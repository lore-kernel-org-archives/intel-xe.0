Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA0C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD0710EE8D;
	Thu,  1 Feb 2024 14:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxB6k+Pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F99D10EE8A;
 Thu,  1 Feb 2024 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797827; x=1738333827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EbaO1mxee/slvNe8+WFgh1hA5to/OLDluhaG8LsSX+Q=;
 b=AxB6k+PeMEhdlzPHDQL1bZOzJZCpIjnmCy2xup4LAi7wDmSSsO/+mHS0
 EI+sD6poenZSk7oNAeSr5vuqjlaryt1xUG6f7FydxcYoS4kWBGbE4aEor
 jLpu1EFwF7q2j+2P1VjokWYFqQrhGsFibKC+aBt6LzHF3TWfQaaEtnbur
 uxOCQDJON2PcEfMgVvGbzv9HfTrMlVECSWYfDlfq/c66YEVdxtdaJPydt
 i/adoA5uxNjGp1s7P8tls9NKrZ42k8oHiZ0kgw9Tb8aRgeZfiQ+BrdkbT
 cnBNqBUcQIKG/7vKxRRCMO60Onjy08ULGupcaDem8gF7EYbYL5C3zMAi1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407622981"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="407622981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4398499"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:30:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:30:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:30:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:30:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoZ1rBZnBRW7NaO0ofsTp0LOF9HwQlIu3doz7cTkgFOixEmNfDfKW3C9bfoTdt1/Q5j0TgFOXfz+xoMaRa/kTTwez0QWXdLmq4vmXW+WAzxx/Je5SGLLbOcAwGQoIBCafP1L4Eq+pvGQ+NKnXSrBEgVyqn7/8yfbQvpRW8X9lRRl6EZKU4YIWfezMEvgXLb9oWpuy/qesD9RP5gi4I8EHYBkGBW3a68Yt4fzK79fuR9Y/sLZX9l0MfCDkkKX8KHXlMN360uLksb3lB4Qfj8NzivqVLF3EP9qXbmg8p6BnyyCGBPwWLHNk4o2vEGFvQpRQB+8M2wQEY1Z70tMg0k35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYYCjFaERNNHB3WzbiQiaoXotIaPF7Lpb6MHjir97Zg=;
 b=LqtmLqo7PgBV5un2bkpmDgaCTCIl1IKvg5iCsJ/H6LNx6VoMuyiqvjFUcNhjZDtF0Uz9g8hA5kwWTX3UO/cPv5octGVUhHPG1ne2BcBdc4y+SNGYsjeQ3+nbOPHt9rSe9JcmSt9iVyrwicvQYgUBJUdF1XLVNfsDH3Rap9cVyFqD9ZzAJuDNoJFJHuVWz/GjS/xda2wVia5r6X/IfrVLEHT52XYeHw1VdmJ6QOTfvkKBVWXZEQ/Q5tAemMFBdUnCSqlu42F1F6148HMBStgi5mazk/cJ8247HEzwuRtB5TJ1rSr50u/iG3JctU2IS9zGMudelNDrvvrbgJkC4nQs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 14:30:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 14:30:21 +0000
Date: Thu, 1 Feb 2024 08:30:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <ns2copyoqtupor3iixu5cw6ukdbzqibmy7c2qye2haz776dr4n@5zgannj3tvdb>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
 <wefjuksjpqxyofstfnjdsdr7jdxr3u72kfytuft5rdtxwnkylp@suywjlthr3u7>
 <3169229.fEcJ0Lxnt5@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3169229.fEcJ0Lxnt5@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: f697267f-7763-4572-7d24-08dc233251f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jns3rWu6NHL4JeLMTzZOhv37lBUxwcu7bH9lHBwO58Pg/rKjM3RZkDN7IZLZYoxwIS0dsO4uRe3i3zTklFlyVZ6ioqyG/WzdSIr68bGqpgTtCAJnWnpJGQTVQLd16PqJoNu6aMaBz2s0e6rLGZh/bulfPVSPg7SnmazKWZlsubgHrRG/0Hshr4vHbvsgtL9fEU6DWqx8dF4l8vrFS/gnrOfzW5fkK/s/6nwS90sWukS90feUeIZV4zXzGGkorVb7kBQAMjyOvroifzXUtkXuhSVDZiT42NVzg/08hsbSbzPblhf8HJ8rwAp3XOY94Xyu43CBEu7jYob45xP7Wxo0Py3fc/b6zMI/FKTeYCIPxKmNEZ6/GssOHhi7+h7Pm8Fm3BUFpaAEetEAEVm5GWQULvGcVfkc5bUwS3DSTZdvDv5DFyRhts090/4oTnr4A+XoSemGmFsD6WUopc+qARIyWQSNh1XUDH4SEEo3BLd2ynGuHjkHmJmdQQgyhkCUYczjzso+lJIlEM+B66O4pwR/YsInayGRJZ/56uoxTRagIZI86LKN4hdhMbU7zzmP71eKWChrlO0YFINu+5fvrRXrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(83380400001)(82960400001)(86362001)(26005)(38100700002)(9686003)(6512007)(33716001)(6506007)(2906002)(6486002)(6916009)(66946007)(316002)(66556008)(66476007)(8936002)(4326008)(5660300002)(8676002)(30864003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vs5ZxWwKbyflbEvKxw72i4gJci1+KAC5JetUZGefYI+dXAhX292pusD9NIru?=
 =?us-ascii?Q?KoW0tn+mWbqnV1ut3dRpEtuinnmEgRuvRVgsz817dt5GGXlGvG/asb1zccwA?=
 =?us-ascii?Q?VfrQDWaMElWTXi6dVGMPqnR5jdX9T0jv7f8/FkGciLDc+bVsXEzrzGUD7iWN?=
 =?us-ascii?Q?Vu8phFtGkWXlNG5d3SXU03apWiSai4PaWwvBlt9/w/rq8yw9NjgzND6HkN1b?=
 =?us-ascii?Q?ErApnCpHgqshEadceYFfEAtTHbbBBtBh/02qzFePf8pOZMGCZTkUe3VWxncf?=
 =?us-ascii?Q?qqPiWjl2Uk+DJO4PTNY59aGoi8mNinvc/XgjIfZiqAcrEQANfJdkJefJkTJh?=
 =?us-ascii?Q?s4ocF1UO6TYyBkUIL2/G1RTBELgSHV+gaZPBBGtktJurFTj5gQssqnMwdXko?=
 =?us-ascii?Q?eUwHPfyNmtUQdIZV7V2cSNH3UKUCKrJJg1az0aRQ8ryTYUr3lEze2jjoc08C?=
 =?us-ascii?Q?OsMbin7SN+Rub5iPoO/F9iPVPlBS3BaYk4XQCshHT1EmLwwLeXOOrVFtL6JB?=
 =?us-ascii?Q?kxLq0XeQSbscnDCQMg3RlFFGXk0LQHUiufawkhujM3W5vrASIfCgtih0Btrg?=
 =?us-ascii?Q?19UU+EyTGvNPw9z5TZt6++KJ6KM5EmNcPNoUNpY6hqmHI22NMYsoEvDJXuBR?=
 =?us-ascii?Q?Y11FSwnHwx0C0UoerSFW3kgRHN05QNJhATwG7Tz1Nmwuth4y4u/8fbXGLk4y?=
 =?us-ascii?Q?K/RPolsYIvV9Sc5PH4EkuQKlW0tRD1yPFEChKlHr7FRVzaQClxAeXq/LUcZ2?=
 =?us-ascii?Q?ZqZ+oqfGGpX1LgSyTHbQYajts8K34LF4eqC8bnD5y8GsidE+vpeRbuwCYkoD?=
 =?us-ascii?Q?Z1ZBQEqjiJbDU27n33gaQ28rvruhfpxhdaxRo8NISvzQ3Sk/HvHz9G901YS+?=
 =?us-ascii?Q?4CRFF8H7oERXcOruqG6N6Tx4sbO2oXmQLnPk7QW7NlI4VjaLguYBwXj7N27O?=
 =?us-ascii?Q?fGa3oGYvXxQzn6/yBWD8o7JgN2MYOftvp6M/2EhM0jYRIu/REzEXcweXTHrM?=
 =?us-ascii?Q?B40gupNRVbRH4XbfaQya00g2y9qIQzjHuiHAl0WUiALm5epn46liy9k6HBxA?=
 =?us-ascii?Q?KxuXdU6P5KvX7vk7P+oS0a+UotxAQ5IGpBaC8i36NrB8ctsSxCcZd2nQtzGO?=
 =?us-ascii?Q?boHCr1L9VkUjdJmg0AxnpWX8otY4QQeuqJe1EnFFxrq8XnQgOd6OGdx9Hw2b?=
 =?us-ascii?Q?oLkOy1BXwhfkoIPvn6tm9Fbngw17/zWP0Skl7uGKr9IpL0G7DFbKundSsSw4?=
 =?us-ascii?Q?U6j5Dsyt0f7x6eSvGKh6TlYQFDKjQt2T/tXHIekhiaV3v1pRCYQQFT7KI1/6?=
 =?us-ascii?Q?m1DZ84DHln4qlcRyInAQL2xb73DJiBdObD3YEpOyNMpSKPnByEEPBO0pei2r?=
 =?us-ascii?Q?r4/q2GUwmzhLpldNGHjZXPKCXPFzS7vpIADbX7pDPPU92OXvZiGPWMPzIyXQ?=
 =?us-ascii?Q?xScnD31j7iyHnM7TC+6ywatMj9A7kAsvLTgGDryLcEO01Wqhl8HALk48SplA?=
 =?us-ascii?Q?rls/xMzuiP55o7EM8rYYr1c4Ya6BVq3VyydPoFpFhBvt4GSpHM4ZFZh3qVRQ?=
 =?us-ascii?Q?Iq9lgOY0pDAFkRE9Uf0aKr9AgBIDOfQbDFLByPec5a3zDOSfTuBS93ZFkBWg?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f697267f-7763-4572-7d24-08dc233251f2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:30:21.1711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANdBNTpukp0GG27ugdJgOqeNUFrDWiUnIeB3zr3oJ3i2fzeue+mp5rF566QuVmHVEeB5E8o60FJYtgA2j9vpT3iRzBmBz0RqsIxJRsR5lag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

On Thu, Feb 01, 2024 at 12:03:27PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Thursday, 1 February 2024 02:01:17 CET Lucas De Marchi wrote:
>> On Wed, Jan 31, 2024 at 07:03:51PM +0100, Janusz Krzysztofik wrote:
>> >Instead of wasting resources on reloading the base Kunit module each time
>> >a different set of filter parameters is needed, try to write the required
>> >values to sysfs representation of those parameters.  If that fails (e.g.
>> >on older LTS kernels with read-only filter parameters), fall back to
>> >legacy "no list of test cases available" mode as we do on kernels with
>> >those module parameters not supported at all.
>> >
>> >This modification will also serve as a workaround for the issue of
>> >impossibility to unload the base Kunit module on Xe platforms, available
>> >to IGT as soon as the module supports writable filter parameters.
>> >
>> >v2: Work around ineffective writes of empty strings to sysfs module
>> >    parameter files (Lucas) by using human readable non-empty strings that
>> >    give the same results as default NULLs,
>> >  - drop fallback to reload of base Kunit module method if assigning new
>> >    values to module parameters via sysfs fails (Lucas), instead use the
>> >    existing fallback to blind execution like if getting a list of test
>> >    cases was not supported at all,
>> >  - split move of open_parameters() helper up in the source file as well
>> >    as cleanup of base KUnit module unloading to separate patches (Kamil),
>> >  - address the issue of the second paragraph of commit description
>> >    suggesting two separate changes combined in one patch (Kamil) by
>> >    rewording the description.
>> >
>> >Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >---
>> > lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
>> > 1 file changed, 84 insertions(+), 30 deletions(-)
>> >
>> >diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> >index d2c28d0a64..1d57ea708d 100644
>> >--- a/lib/igt_kmod.c
>> >+++ b/lib/igt_kmod.c
>> >@@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
>> > 	return open(path, O_RDONLY);
>> > }
>> >
>> >+static const char *kunit_params[3] = {
>> >+	"filter_glob", "filter", "filter_action",
>> >+};
>> >+
>> >+static bool kunit_set_params(const char **values)
>> >+{
>> >+	/*
>> >+	 * Reapplying default NULLs to module parameters via sysfs seems not
>> >+	 * possible, and applying empty strings doesn't work as expected,
>> >+	 * leaving current values untouched.  As a workaround, use
>> >+	 * human-readable non-empty strings that exhibit the same behaviour
>> >+	 * as if default NULLs were in place.  In case of filter_action
>> >+	 * parameter there is no such obvious non-empty string, however,
>> >+	 * that's not a problem for us since even if it was previously set
>> >+	 * to "skip" and we leave it as is, our "module!=none" default filter
>> >+	 * guarantees that no test cases are filtered out to be skipped.
>> >+	 */
>> >+	const char *defaults[ARRAY_SIZE(kunit_params)] = {
>> >+	     /* filter_glob, filter,	     filter_action */
>> >+		"*",	     "module!=none", "",
>> >+	};
>> >+	int i, params;
>> >+	bool ret;
>> >+
>> >+	params = open_parameters("kunit");
>> >+	ret = !igt_debug_on(params < 0);
>> >+
>> >+	for (i = 0; ret && i < ARRAY_SIZE(kunit_params); i++) {
>> >+		char *param = igt_sysfs_get(params, kunit_params[i]);
>>
>> why do we read-modify-write? I'd rather just write the values. An
>> optimization by checking previous value belongs in the kernel, when it
>> makes an actual difference. Something like this (but with error
>> handling):
>>
>> 	int dirfd = open("/sys/modules/kunit/parameters", O_RDONLY);
>> 	igt_sysfs_set(dirfd, "filter_glob", ...);
>> 	igt_sysfs_set(dirfd, "filter", ...);
>> 	igt_sysfs_set(dirfd, "filter_action", ...);
>> 	close(dirfd);
>
>OK.
>
>>
>> an abstraction could better be something like:
>>
>> 	igt_sysfs_set_all("/sys/modules/kunit/parameters",
>> 			  attr1, val1,
>> 			  attr2, val2,
>> 			  attr3, val2,
>> 			  NULL);
>> >+
>> >+		if (igt_debug_on_f(!param, "param: %s\n", kunit_params[i])) {
>> >+			ret = false;
>> >+			break;
>> >+		}
>> >+
>> >+		ret = !strcmp(param, values[i] ?: defaults[i]);
>> >+		free(param);
>> >+		if (!ret)
>> >+			ret = !igt_debug_on(!igt_sysfs_set(params,
>> >+							   kunit_params[i],
>> >+							   values[i] ?:
>> >+							   defaults[i]));
>>
>>
>> filter_action is "". How does this fix the issue of writing a 0-length
>> string? If we try to go back and forth between "skip" and "", this will
>> fail.
>
>I think I've explained that in a comment to "defaults" variable (see above,
>here quoted again for your convenience):
>> >+	/*
>> >+	 * Reapplying default NULLs to module parameters via sysfs seems not
>> >+	 * possible, and applying empty strings doesn't work as expected,
>> >+	 * leaving current values untouched.  As a workaround, use
>> >+	 * human-readable non-empty strings that exhibit the same behaviour
>> >+	 * as if default NULLs were in place.  In case of filter_action
>> >+	 * parameter there is no such obvious non-empty string, however,
>> >+	 * that's not a problem for us since even if it was previously set
>> >+	 * to "skip" and we leave it as is, our "module!=none" default filter
>> >+	 * guarantees that no test cases are filtered out to be skipped.

ugh... I hate how these params have the same name but
different semantics. So yes, I think this works. We may
need to reword the comment above once we fix the 0-length write though.

/*
  * We don't care about writing to filter_action since filter guarantees
  * there will be nothing filtered out
  */
igt_sysfs_set_all("/sys/modules/kunit/parameters",
		  "filter", "module!=none",
		  "filter_glob", glob,
		  NULL);

We probably don't even need a kunit_set_params() in the end? Each
caller can just spell out the params it's writing.

>> >+	 */
>
>If still not convinced then please have a look at results from other KUnit
>based IGT tests executed within the pre-merge CI run for this series:
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10613/index.html?testfilter=drm_mm%7Cdrm_buddy%7Ckms_selftest
>to see how it works (please note that IGT output is still not in sync with
>KTAP output, then results are still not easily human-readable, which is a
>known issue that will be fixed by a series planned as next, i.e.,
>https://patchwork.freedesktop.org/series/126017/ refreshed on top of this
>one).
>
>> A workaround would be to make defaults above to be something else
>> like "run",
>
>But won't that require a respective modification on the kernel side?  Do we
>know if KUnit will accept "run" as filter_action value, now and in the future?
>And if it is accepted then do we know how KUnit filtering algorithm will
>respond to that value, now and in the future?
>
>> but we should really fix this in igt.  I'm submitting a
>> patch for that.
>
>Do we know if KUnit will accept an empty string as filter_action value, now
>and in the future?  And if it is accepted then do we know if, when filtering
>test cases, KUnit will respond to it, now and in the future, the same way as
>if it was NULL (the default)?

yes, should work. But I'm also ok with not writing anything as above if the
value passed to "filter" makes it not needed. However if we do write "",
then I'd prefer to make sure we have igt fixed to do the right thing and
really write that.

Lucas De Marchi

>
>That would be nice if default values of those module parameters were not NULL
>(presented by sysfs as "(null)"), then perfectly possible to be restored via
>sysfs (with your IGT fix if empty strings), without guessing or inventing
>default equivalents.
>
>Thanks,
>Janusz
>
>>
>> Lucas de Marchi
>>
>> >+	}
>> >+
>> >+	if (params >= 0)
>> >+		close(params);
>> >+
>> >+	return ret;
>> >+}
>> >+
>> > struct modprobe_data {
>> > 	struct kmod_module *kmod;
>> > 	const char *opts;
>> >@@ -1100,6 +1150,18 @@ static void kunit_get_tests(struct igt_list_head *tests,
>> > 			    const char *filter,
>> > 			    const char *opts)
>> > {
>> >+	/*
>> >+	 * To get a list of test cases provided by a kunit test module, ask the
>> >+	 * generic kunit module to respond with SKIP result for each test found.
>> >+	 * We could also try to use action=list kunit parameter to get the
>> >+	 * listing, however, parsing a KTAP report -- something that we already
>> >+	 * can do perfectly -- seems to be more safe than extracting a test case
>> >+	 * list of unknown length from /dev/kmsg.
>> >+	 */
>> >+	const char *values[ARRAY_SIZE(kunit_params)] = {
>> >+	     /* filter_glob, filter,	    filter_action */
>> >+		NULL,	     "module=none", "skip",
>> >+	};
>> > 	char *suite_name = NULL, *case_name = NULL;
>> > 	struct igt_ktap_result *r, *rn;
>> > 	struct igt_ktap_results *ktap;
>> >@@ -1113,27 +1175,21 @@ static void kunit_get_tests(struct igt_list_head *tests,
>> >
>> > 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
>> >
>> >-	/*
>> >-	 * To get a list of test cases provided by a kunit test module, ask the
>> >-	 * generic kunit module to respond with SKIP result for each test found.
>> >-	 * We could also use action=list kunit parameter to get the listing,
>> >-	 * however, parsing a KTAP report -- something that we already can do
>> >-	 * perfectly -- seems to be more safe than extracting a test case list
>> >-	 * of unknown length from /dev/kmsg.
>> >-	 *
>> >-	 * TODO: drop the following workaround, which is required by LTS kernel
>> >-	 *       v6.1 not capable of listing test cases when built as a module.
>> >-	 * If loading the kunit module with required parameters fails then
>> >-	 * assume that we are running on a kernel with missing test case listing
>> >-	 * capabilities.  Dont's skip but just return with empty list of test
>> >-	 * cases, that should tell the caller to use a legacy method of
>> >-	 * iterating over KTAP results collected from blind execution of all
>> >-	 * Kunit test cases provided by a Kunit test module.
>> >-	 */
>> >-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>> >-	if (igt_debug_on(igt_kmod_load("kunit",
>> >-				       "filter=module=none filter_action=skip")))
>> >+	if (igt_debug_on(!kunit_set_params(values))) {
>> >+		/*
>> >+		 * TODO: drop the following workaround, required by LTS kernel
>> >+		 *       v6.1 not capable of listing test cases when built as as
>> >+		 *       module, when no longer needed.
>> >+		 * If updating writable filter parameters of the kunit base
>> >+		 * module with required values then assume that we are running
>> >+		 * on a kernel with missing test case listing capabilities.
>> >+		 * Don't skip but just return with empty list of test cases,
>> >+		 * which should tell the caller to use a legacy method of
>> >+		 * iterating over KTAP results collected from blind execution
>> >+		 * of all Kunit test cases provided by a Kunit test module.
>> >+		 */
>> > 		return;
>> >+	}
>> >
>> > 	igt_skip_on(modprobe(tst->kmod, opts));
>> >
>> >@@ -1200,16 +1256,11 @@ static void __igt_kunit(struct igt_ktest *tst,
>> > 			      t->case_name) {
>> >
>> > 			if (!modprobe.thread) {
>> >-				/*
>> >-				 * Since we have successfully loaded the kunit
>> >-				 * base module with non-default parameters in
>> >-				 * order to get a list of test cases, now we
>> >-				 * have to unload it so it is then automatically
>> >-				 * reloaded with default parameter values when
>> >-				 * we load the test module again for execution.
>> >-				 */
>> >-				igt_skip_on(igt_kmod_unload("kunit",
>> >-							    KMOD_REMOVE_FORCE));
>> >+				const char *values[ARRAY_SIZE(kunit_params)] = {
>> >+					NULL, NULL, NULL,
>> >+				};
>> >+
>> >+				igt_require(kunit_set_params(values));
>> >
>> > 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
>> > 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
>> >@@ -1378,6 +1429,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>> > 		igt_assert(igt_list_empty(&tests));
>> > 	}
>> >
>> >+	/* We need the base KUnit module loaded if not built-in */
>> >+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
>> >+
>> > 	/*
>> > 	 * We need to use igt_subtest here, as otherwise it may crash with:
>> > 	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
>>
>
>
>
>
