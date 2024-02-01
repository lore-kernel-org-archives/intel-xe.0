Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CEC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 16:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E4110F0BA;
	Thu,  1 Feb 2024 16:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNYn/9fT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0272210F0BA;
 Thu,  1 Feb 2024 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706804572; x=1738340572;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=o1Spp4+sx/FG7uQxdxzZQ8iQCd+m+zAyDK58E667ZIo=;
 b=dNYn/9fTMm8q502Hk13Frrgg6ybveLvpt6s3/zVrFI9BRKvYpRiQPn+V
 kqnUgUpBj+cKR0wfpfZZihCfy/nXjvHcTKCmskjl1BsBhUFdXyXNiPPPO
 ouwHlg7keuZ+K3hvjUmyiyupvV7fP+nxnXdOxT67dmmmrx+dzSs4Xo/Rg
 I4gzwKFPBIzGSiXhuksvK9YKJLvGrkWmGYUX6pVrquH8q/bAJevchNc8a
 yDjKAQE5c4UMnu89weiuYYXY+TJf8lEJFgDTHaeXeA45Smo7ubYpCNEZ7
 BhvFOYlAZ25UQlgO8kdIg/EcF66+nvgY+3/gFA15FF2xTzR4/8pW9lfDh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11033918"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="11033918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822958683"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="822958683"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 08:22:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 08:22:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 08:22:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 08:22:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/YPtcA3KdU38sHiyKKvPmLzkCFRLwyOX9SuDfchRQMiGbA8tfjrKgc2aUsbm6rtSkH3aydjXHz7pr/BKESBIWT+oBdqlEjPuL+kDWvXBX5kMZBpGOaLAHiRiZRbY3nHQ4wNELS+xxaOMoltE6zPGWOtJe2dGS+B+bIC9QIsyYqFb7s4Ao1CLHzpjByGZpMNRLUt6NDqDf9U05MK443d0EH1/+qU0Y4W5xXXF22Q3KP6ggYlCX/tm4WPqHeR2drzVxj8KA6wYHyV1UwVljdNr4lLn69amveCA8kGTxVpIQt03NsDJALcX8niij5x3hT2sGxyD4HUN1US4fhw7UqGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZxbIpdXAudV8Q9TmGyoLac+gqHZgip2n7mkn1sV6Lo=;
 b=Ww8DDnqYSd1IMpzyEaraeflCEt6DoK3Oys13cz9RzqkWDY8q43lpvCfuNhP3LYIH28r3tA5uNebi82BJhWW8CU5ZzgS2gNb8+kHNMiiWWw5iNwTO6mp/0woVnzkmywdlNO7aA/nwMwR6BXzr+veh1OtBXoccGMqaK/CdM76UdcO98/fLsiVQj5NCAUj+BpHQ2e2HTHNtQ3JyrGdTo4oEM5LOhH/3ffS2dBzYRKUR6/atPf3vjIVC9f8xqtR5x5iaUbksxoft/9AT+wSR+RHleI6sKZH8Jwo7cx9MDdMS6ovdPYewvpW5xkyTSIsJmAHwdvezCqPj9m/OXSFQZOnXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 16:22:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 16:22:47 +0000
Date: Thu, 1 Feb 2024 10:22:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <ev2vxde6hxmpjnaqjncy6hoo745znczmvcmjc62izwjsc6lm3x@ljbnmvhkg6im>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
 <20240201150741.r6hq3dnam33qzwxe@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201150741.r6hq3dnam33qzwxe@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: e90231bf-64c9-4ae5-e2f4-08dc234206f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5R1RtCFyidh1EmPufNrk02/cvSM78jvH4fUeie4d3bn92rasy/HRx9vcz+2tyBe534mnIsSlHau+PJ3D6lSgWbkZ+wjXlRypTlLhi593K86P/1DnfFrP6s3weEqayzqi+eFFfkUGzzJHudG8PJYM91v2AxoXtbrRLN7RHRza5BWSTyGNkq695lpmAyVIDKy8U6MrtB7cXqOdcVZKnmgpI4crnZU0rfw4BjCdCg0S0z40Gam4p2LBwtJ3Z8bjoW8wmzcHR9oJLZSm92rcmskD1H6HuLh3p1M1KLfgzg4zg71Xwzb+LKn4Kh2eHRsDjPlYpPyH3Y9rMB7VAyVFDkE1X+SR3OyqukIECCyPzgbFmttiuEb36ONGfdOlf++8z8eLw4EFeEXnQ9b7l5QsuGdSq69YV2iKrxe+5NU5jFGC8eVwa7OBQ4mvMTpTcUcPkbuBIH0nDKwpq17gVGfO0dlJPK+tBYYcKtkFDtSkPSq+fcmMxJDy1aunqpIYxtPs9yzpEWuxs9Z/hJPT8XU1z/BL6oBGB3AjZd+jbMzn0xGR5230nsv18FmrjOMel1H1sjnr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(2906002)(8936002)(5660300002)(82960400001)(86362001)(38100700002)(6506007)(478600001)(6486002)(41300700001)(83380400001)(33716001)(6512007)(9686003)(26005)(316002)(8676002)(66946007)(110136005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fwr3xizG7IpGBaVxZM+/bCx0zeawIMoG0ZYtTNAmlMWyj4BrArnV0drkjTgU?=
 =?us-ascii?Q?k5iFEev8weI0Coe8QMmVrBMvRldBPPkZtp3d1Jt7jsH2Fg8MOHL1wHWL29Nm?=
 =?us-ascii?Q?jcsb559ANYIErbaQO+KsPRFBRUNdYDcupKHvIYi0vFLy3wUrEpdX1bXsCRYK?=
 =?us-ascii?Q?oWr5fG7CJQtmG8SbEvUOhahmrXQKnI/34ZU5obLioWoxc3ayjuvksOs1nKP2?=
 =?us-ascii?Q?FQEmZb9HQi+MbBFAuceM/PJjLewWC/wyEwYO4cRKR/UTk3zLBRNHhKmhcJa3?=
 =?us-ascii?Q?mj6ux0D+FYO3Av7hebYtoj0gVu6ehn0ypMaHzX0ZgBINeQa+k9/nz2G8aAfM?=
 =?us-ascii?Q?l/NbWmtcw5+YEFm5ZY+bPqYaHFcEeHKIURQj3dBui69YRIs1S49gcVOkya9e?=
 =?us-ascii?Q?X8wcxxy/AQ0TpSMGFY+yojxEqxjaM0JMQAAZN7XUEF312rao73xi6Wv4g0s6?=
 =?us-ascii?Q?iDdqUgJm0Dmu0rzJOFi5tTlTx3kkJJJC0WRGq/bXmqvh/IvPKhvceoRvwKg4?=
 =?us-ascii?Q?9nmXwhkxJhfVrXWNF/poCTvleuqOT+UbL/sRZb89bpzwu/poF+2k0knGHlhB?=
 =?us-ascii?Q?6pgbWcFuWfwsRlyQKYjMBkLkZw9rtCkAIT6Ua6LwHNgWUaw9DPJSjbQejC98?=
 =?us-ascii?Q?k/z+wmRyVZQBSmhKWX1LG66Jwb6qde+UTa6LOk/kNrwFYOXiQtAUGosm6QOz?=
 =?us-ascii?Q?R7mltrfLYA7rYQtS6KEzwCIG8cVBhufIsnOTFCTQ8oSvkJjRpzffL5X8wrXR?=
 =?us-ascii?Q?h+bJqRYdZXAG5ppes8ZQqc+E7mgxH0b8CbMeFZ6iFMwmkkZFRXgovJYGh0z+?=
 =?us-ascii?Q?Ld3aiUxb+taiUtaoXnFBjIbUl1wsRKS3JfSJDSNEgf6mb/Ztr1NkmqLNkCFT?=
 =?us-ascii?Q?YJc5sUiNiIqo/DtWdOhsQd7cIWQNL5eEaY6I1mZx+Bkm96RBhTogQ8FwjVje?=
 =?us-ascii?Q?+Y7XX0JumDergI0wDJQAoRm5yMnF1L5ygqkg+GmKCDEBtUfKBCDc1hrDLgFb?=
 =?us-ascii?Q?eznpj5K40nWoEJtGCqWRd0AwDljcPe6OUU8fWcoalMWH7T9i0ZVPWPhP/SMj?=
 =?us-ascii?Q?3AYmFonxsnvBGIeb5rCj8rA7t1kKyrHGiX2JOyhhULOSE8ZLYKWQac2EZO4x?=
 =?us-ascii?Q?kMYMrRVxoN0a2lws8t5bTNDphnxKlUYaOlpXXkdhFVS0mmT7J+TXsSiuX4uU?=
 =?us-ascii?Q?P/NFyD3FlWAiacQbYctbUG7X+rWrhU8nJuNVvaWj+AksGKqRjimRrwNVU9w0?=
 =?us-ascii?Q?I4PrseujeZiLS9kRLbMJLM+yX3PpFRSe7yB1sQo7VtQihr/lqEPxl5vqbnH1?=
 =?us-ascii?Q?lBn/qRjTaHoQN9m1/jp/Nl5kfB0h4EU4q7LC7dBYT8yPjKZoBEZ2pckZihi3?=
 =?us-ascii?Q?+1pHuxhdGvgxhPOXomdWnL9rtowCJ4BY3faDz+DYC0XHzAuJbVQwb1c/QAcA?=
 =?us-ascii?Q?p6kYOLcxcDDicP4O8sZLENtZxIikCgcaFdt+9n0GKJuXOE23ecyJ/YLU4DxJ?=
 =?us-ascii?Q?0Fn9YpxddDcVZxI2WjinqZfsx9w1UGLS75KJQwtmBGQIvqdWvcAZXfTaeMpU?=
 =?us-ascii?Q?o/K+mVFWxUGId/sMnmsqUfWwFsCFv4Eu7yhx2rj25YNEiS0/arH7430pI7ja?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e90231bf-64c9-4ae5-e2f4-08dc234206f4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 16:22:47.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kZM7QAC4DQQoa/1wuunGtQze9yhWRNrQqvB3iBTpbFv7ipU9DwgFVUf8raAw79CwOm1mY0p8O64BHwUjXLeFWfvNGrzsoaY2YyZO+8iCQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 01, 2024 at 04:07:41PM +0100, Kamil Konieczny wrote:
>Hi Janusz,
>On 2024-01-31 at 19:03:51 +0100, Janusz Krzysztofik wrote:
>> Instead of wasting resources on reloading the base Kunit module each time
>> a different set of filter parameters is needed, try to write the required
>> values to sysfs representation of those parameters.  If that fails (e.g.
>> on older LTS kernels with read-only filter parameters), fall back to
>> legacy "no list of test cases available" mode as we do on kernels with
>> those module parameters not supported at all.
>>
>> This modification will also serve as a workaround for the issue of
>> impossibility to unload the base Kunit module on Xe platforms, available
>> to IGT as soon as the module supports writable filter parameters.
>>
>> v2: Work around ineffective writes of empty strings to sysfs module
>>     parameter files (Lucas) by using human readable non-empty strings that
>>     give the same results as default NULLs,
>>   - drop fallback to reload of base Kunit module method if assigning new
>>     values to module parameters via sysfs fails (Lucas), instead use the
>>     existing fallback to blind execution like if getting a list of test
>>     cases was not supported at all,
>>   - split move of open_parameters() helper up in the source file as well
>>     as cleanup of base KUnit module unloading to separate patches (Kamil),
>>   - address the issue of the second paragraph of commit description
>>     suggesting two separate changes combined in one patch (Kamil) by
>>     rewording the description.
>>
>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>  lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 84 insertions(+), 30 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index d2c28d0a64..1d57ea708d 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
>>  	return open(path, O_RDONLY);
>>  }
>>
>> +static const char *kunit_params[3] = {
>> +	"filter_glob", "filter", "filter_action",
>> +};
>> +
>> +static bool kunit_set_params(const char **values)
>> +{
>> +	/*
>> +	 * Reapplying default NULLs to module parameters via sysfs seems not
>> +	 * possible, and applying empty strings doesn't work as expected,
>> +	 * leaving current values untouched.  As a workaround, use
>> +	 * human-readable non-empty strings that exhibit the same behaviour
>> +	 * as if default NULLs were in place.  In case of filter_action
>> +	 * parameter there is no such obvious non-empty string, however,
>> +	 * that's not a problem for us since even if it was previously set
>> +	 * to "skip" and we leave it as is, our "module!=none" default filter
>> +	 * guarantees that no test cases are filtered out to be skipped.
>> +	 */
>> +	const char *defaults[ARRAY_SIZE(kunit_params)] = {
>> +	     /* filter_glob, filter,	     filter_action */
>> +		"*",	     "module!=none", "",
>
>If writing empty string poses a problem, what about writing
>one space? Could it work?

no. we can't write a different value and expect the kernel to treat it
the same. There's no "strip()" happending on the kernel side and
depending on the sysfs file a space might make sense as a real value.

Lucas De Marchi
