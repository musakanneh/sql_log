def name_dataframe(scripts):
    """Gives column names to the dataframe first

    Args:
        scripts(args): gets values and implement sorting
    """

    practices.columns = ['code', 'name', 'addr_1',
                         'addr_2', 'borough', 'village', 'post_code']

    scripts.sort_values('bnf_name')
    distinctPractice = (practices.sort_values(
        ['post_code']).groupby('code').first().reset_index())
    joinedDF = pd.merge(scripts, distinctPractice, how='inner',
                        left_on='practice', right_on='code')

    groups = joinedDF.groupby(['post_code', 'bnf_name'])
    sms = groups.sum()

    grouped = sms['items'].groupby(level=0, group_keys=False)
    res = grouped.nlargest(1)
    res.head()

    groups_post = joinedDF.groupby(['post_code'])['items'].sum()

    portion_of_total = 0
    result = []
    final_resultt_grader = []

    count = 0
    for i, j in res.iteritems():
        if count < 100:
            for ii, jj in groups_post.iteritems():
                if ii == i[0]:
                    portion_of_total = j/jj
            emptytuple = ()

            emptytuple = i[0], i[1], round(portion_of_total, 10)
            result.append(emptytuple)
        count += 1


if __name__ == "__main__":
    print(name_dataframe())
