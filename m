Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79039C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 15:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0B10F0AE;
	Fri,  2 Feb 2024 15:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDWHivjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BF710F0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706889477; x=1738425477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=54QiplHi/BpFd3cYSkmtZisvQ7nAftMx9d6+bM5oEJs=;
 b=HDWHivjvIT0bJTuK2tbtJ9F+EY6t33JsTMvXgclSBObBh9yS6z/6KRCB
 xf/q9jygR5rdzXDZ6jks+b/ckxcMhlOFaN6BD5keENAAcgQjj2YzUKPFm
 t9yvu4+dg+mzhB8F5nxEjrD0zDUFAs4FefIYLgleDdkR7wEX/1RFNVq6q
 8HS80+rcaKO0eZZ+nNvbqmaa+LthBrJEIAM2WBjwRBrNQCq54jpeOCBTl
 rQ8biocI8gEt1eSTmeZXon8ZXDttZ5T1mYvgj/ux7QIoqyu1150zCK6T/
 x698u2m+2hl4K7q327bUGkeJp5Y5uF3t3xJ/65zsqIGz/yedTP27u2GrQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="355213"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="355213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="408647"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 07:57:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 07:57:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 07:57:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 07:57:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYJkl0QdJnUdde4uQ/LA+3cp4qnW0ZtZJZwW/AzmmPyo66jwuTtsg58o4HO8tNWmaH/0zzqEwZLXcXav78C8KcnZ9mfb6PT0JCX/K+vACTa5cOWDPx6nBX7IxH+UvU7WJGYwGQIB/T5+ZRmx34437zhCUXUj9NPzBJwFoijvr1Fxdfh9onaXhEBcj3sM/MJMBvegYHoG4JdoSRub0P7K6TeJkWyz/WuXAzZz+Yt/kdsOkk13I3je3mVqkcYu9ZUMkLTb9YM/xUTFb8KzS9brVKo2MPfn0GRJ1b2I2mrvMZAIE1ZGgje//NGC7Ir+vjlDxvVIUdFU3x8HFtMXwz+n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9KypUP/19zcb6TISagZMVRtHRQMfbziSpAVgKw20nk=;
 b=V+U3MZ6VtiNO7XoXGy7V/HTIfu3O+0Cu0LOJixqGnkwCAslm1SqNURDph9zSpHcCpma/Kc1J7M6pSAOFPdKRvZPIYBS9tuj9VR4GKQj1cu4ZIQsIlWnZYpwHF9jaAROdcqLyxxMHFD6J0Z3uM7ljZv1T0mDo9UZnkntQocn+21KwUl3S0usaGGwGOGUazxEY4OA3ox9lqLa901i7+dswhVNoueHHqHMsve6vtwTrUlnD0jo8H1AkK9q5IAF+c0tACeFnzT7UGiBuMQQp5PwtAP9N8wU8CqnZAuKrLPNiqoCci8oL5brQq6hAGMH5g3gin5dFS6Pr4BqT8TrpXP3Hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 15:57:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 15:57:48 +0000
Date: Fri, 2 Feb 2024 09:57:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: Re: [PATCH i-g-t v3 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <lqfhao6zl6hynfgumjjztky3bqsuxte4nekzrhsilkf2tmyikv@5bb3t3fksddx>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
 <20240201190237.150754-12-janusz.krzysztofik@linux.intel.com>
 <3ehhnx6ijqdzahhkemcf5x4avps4e6inrrgd6p4dqgvu7ydo32@zs7hpimyjhy4>
 <3705187.TKLx3GfHUD@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3705187.TKLx3GfHUD@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e6ae12-070f-44c6-dd56-08dc2407b442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAT4Sq+BGfgPBYPhUH80W96FlJ0Q1aOjwUbIkCOPCsgfXpfaTpOcEdVjt1YeNWufLWZF5LI0YyZHAlR6rIN4TnXFCgS8u5Kqy8vHOCyondJuqPDKZBL8T+9t2tqnQHW/L4GmeblSTlsjWbf1rDkIztPH9/Et7L34eg68x+HayHzz7ISDU14Q5vI16lHX3Q1mIAMKLq+Is0tPx4tvuvP/zp1ybvQoEUcexJhBNyY1DMDmxRFVVzpKHCO15+Z4QLTaj5E1cKSbJ2dEnyheF1+ctcAanFJN1raa2yxO4ZvQgGaeqPsRbeLIl/quSpDykJBC+lohMfQ/eo4p7mhSYomhVmt6lWqRzT0PRvSwRJPxI6SWm3BG4gyV3WBHaDwiyDR4qZthpAX4KHEzxwkHaPXwGj+3DpcXPDtr56VFKBi+TWhzbxO3extoUnzSXaMLtKKNAGhAjbrGJOnD52ON4lpz7TVn31q5YxV/xTL2nOTWM0aqvgeoADaGtDb3cwGHVPkhMO8YXFKHxvWM3QPNTtfWRONCN5OBlwfZDF1HBGkQ2hSav1uBNmWZ1gTeXugYM9q4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(6512007)(6506007)(26005)(4326008)(8676002)(8936002)(54906003)(316002)(5660300002)(2906002)(30864003)(6916009)(66476007)(33716001)(66946007)(86362001)(66556008)(41300700001)(6486002)(478600001)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6XmQhT+uQeXzfhDvnCxX8+Z/lmqivstPTnPqJXipBJIal6KN9BbH0hfTysOA?=
 =?us-ascii?Q?jmZP/J6Mzpbox/CP/zx9v2j0bJauRS6vpju9DemuBQ3uPB5tV/XWCniMRo9d?=
 =?us-ascii?Q?aK7+RKZc5lCgR8L9vs8pnB9E1yLe0jBPmMY8RDMneANwba1sxc0iAkg63OTT?=
 =?us-ascii?Q?5lDA7CVD6CE+Axtois1hk7e47OgIiodx1UBpoIrl1W870PCcF7nkAyuA8Zwr?=
 =?us-ascii?Q?tThEO2V8ABcZEjgwl+2l+qlbjLiceXV5jS4hejtf9mWp7w54Iyx3FvMZNIC9?=
 =?us-ascii?Q?eid57bOOQMkLjAjW4tciEPLZmSV4m+uBTUFNNksf+U0NE0rGaKoh8Bk1wGGT?=
 =?us-ascii?Q?iAQcyVdwRqafD43vn+StvzLCUnXJc9E1uDbc9rUIMAoS1qgrwkVXsPeH5kBc?=
 =?us-ascii?Q?Fkv0aZucup1aUmTKxCR5sMptpIwbhi6CtnvQP5WCeB/uuilb+ps3C9s3wtmR?=
 =?us-ascii?Q?EX3p9jJlVfhASSWlWvgpQNYPVQnmOjXoqXymLz1WzgyHKAanbugU+en1BmFX?=
 =?us-ascii?Q?qpJtZ/Dan0ID41Ik9SXyJEMuCJGd5LrRswPo7gAWuivyUsDITZwFThBa+J08?=
 =?us-ascii?Q?KJEXkU+fwWq0S62uf17wyS32bWe+VO/JD3WNV+1HRH0tg8KU1SY8G2y4/JMQ?=
 =?us-ascii?Q?tt674bozZrEWBM7av3D8TQxsGKLPhB3iD1aU1HYjnAlT22u1NKwEweoVdgpM?=
 =?us-ascii?Q?Dy31ubzhYBeTpxNutnIlLkNiiE7SxfjPPpiiPP57kLxwoirbi6eKEd1Zcj/I?=
 =?us-ascii?Q?4zDTS84U0mF/+jLa/8DCf9nz+DWvE5bvbwgLPgOfWaXijJBzQsSXf70d8d5j?=
 =?us-ascii?Q?za8jbvigc0Op1dyKeUXxHY8JSxFvpCTvnH4y0JnkOG4sb5+QvZ6f7386yHxa?=
 =?us-ascii?Q?N4j0CRxA+lYAItdhTz7jvfEkgL+up7p/a0S33FRWRJNAXT5dSspwViB5J2e/?=
 =?us-ascii?Q?biZN022i1B9JqcVR8+Vr0XQkweQUFu9PHwHMwXqnB4GRYP/6OS8iu5xK946K?=
 =?us-ascii?Q?c2xkdo/CdzbpHXUb6ASH9SR0SR+lZYlnWTxjoFSEJvL9I7+KXvc7iX3btmj9?=
 =?us-ascii?Q?gUkFx62VLpf5CsL8LX9sDnGcACZAh8w0NWZj75WvOaMmQ5FRC1ZaYJCtd/ie?=
 =?us-ascii?Q?rmiq3fzzM/Wp1TGe2ZPJWgc00tmy4Ot3h7pOrk0pBM023OK0IMX5egne1qPK?=
 =?us-ascii?Q?96782X8e7Z8c7jqYynRclo64FfQgufc/aJ+xk3xi5RqSmVhkMSbUXJ2CWS6e?=
 =?us-ascii?Q?YC04at8CQTRZ67I0wbOGkghklYk7QTSGqWrou7J4Vm/ooMTegRQmyfipUpqh?=
 =?us-ascii?Q?UaMqF587tzQ/tXAuByBjp78YNIJzyNem1+4WdIc6wGr6J07eqQHomUz/PikU?=
 =?us-ascii?Q?C9UOWnlBvJYc782rnG0ZU85gaa2gVORHW5NjBgsZApinQo84QIBWzhZKEikT?=
 =?us-ascii?Q?Wt17mi21U/DQuHJeYseYoRWj9m/l+Omu8gS7OE1EcY5raHRswf4ZBjkvP9Dc?=
 =?us-ascii?Q?ohAjKh2Rzlck9Gr6oqCh7MflrZBYDH1VG9nYNxCfF/zIfGiEe4P4BewkABfY?=
 =?us-ascii?Q?yqnh79WKDVA9yKXViZpwZtHnQEN7yUlSrfMSKAr1IgBzOrE7zSBKs7DqKCV9?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e6ae12-070f-44c6-dd56-08dc2407b442
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:57:48.8936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwpjzURMvbGeKpK+ECd9JfybELKa2THhAmknukJUZxjcABALVGYFDnc4g9TCmU1+wkamTaHH8ZoaKONgbB7Z1hFqD1Y/juhBj53UVV8Jpsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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

On Fri, Feb 02, 2024 at 11:14:49AM +0100, Janusz Krzysztofik wrote:
>On Thursday, 1 February 2024 21:26:35 CET Lucas De Marchi wrote:
>> On Thu, Feb 01, 2024 at 07:59:20PM +0100, Janusz Krzysztofik wrote:
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
>> >v3: Don't read-compare-write, just write the values (Lucas),
>> >  - skip calling igt_sysfs_set() when the string to be written to
>> >    filter_action is empty (Lucas),
>> >  - warn if we leave the filter_action set to "skip" while setting a non-
>> >    default value of the filter parameter,
>> >  - transform generic kunit_set_params() to kunit_set_filtering().
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
>> > lib/igt_kmod.c | 91 +++++++++++++++++++++++++++++++++++---------------
>> > 1 file changed, 65 insertions(+), 26 deletions(-)
>> >
>> >diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> >index d2c28d0a64..83416d2aa4 100644
>> >--- a/lib/igt_kmod.c
>> >+++ b/lib/igt_kmod.c
>> >@@ -811,6 +811,49 @@ static int open_parameters(const char *module_name)
>> > 	return open(path, O_RDONLY);
>> > }
>> >
>> >+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
>> >+				const char *filter_action)
>> >+{
>> >+	int params;
>> >+	bool ret;
>> >+
>> >+	params = open_parameters("kunit");
>> >+	ret = !igt_debug_on(params < 0);
>>
>> why proceed? just return early when it fails pre-conditions
>
>Right.
>
>> >+
>> >+	/*
>> >+	 * Default values of the KUnit base module filtering parameters
>> >+	 * are all NULLs.  Reapplying those NULLs over sysfs once
>> >+	 * overwritten with non-NULL strings seems not possible.
>> >+	 * As a workaround, we use human-readable strings that exhibit
>> >+	 * the same behaviour as if default NULLs were in place.
>> >+	 */
>> >+	if (ret)
>> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
>> >+						   filter_glob ?: "*"));
>> >+	if (ret)
>> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
>> >+						   filter ?: "module!=none"));
>> >+	/*
>> >+	 * In case of filter_action parameter there is no obvious human-
>> >+	 * readable string that behaves like default NULL.  However, if NULL
>>
>> that is not true.. it's just igt_sysfs not doing the right thing to
>
>That depends on how we feel about empty strings, whether they are human-
>readable or not.  For me they're not quite, e.g. when simply reading them back
>from sysfs it's not possible to distinguished them from potential white space,
>unless some graphical representation of non-printing characters is used.
>Maybe it would be more clear if kernel was using a convention to display empty
>strings as e.g. "(empty)", like it displays NULL as "(null)".

you can't print NULL. You can print empty like it's done now. That's not
going to change ever, as it would break perfectly usable and sane
userspace.


>
>> write an empty string, that does behave like NULL on the kernel side.
>
>Then maybe let's better send the empty string to igt_sysfs_set() instead of
>skipping that, and replace my "human-readable" with "non-NULL" in the

as long as the "human-readable" comment is removed, fine. Because empty
is empty, it's not a non-printing char. Let me try to make it clearer:

	# echo -ne a > /sys/module/firmware_class/parameters/path
	# hexdump -C /sys/module/firmware_class/parameters/path
	00000000  61 0a                                             |a.|
	00000002

There are 2 chars: 'a' and '\n', with the latter always inserted by the
kernel.

	# echo -ne "\0" > /sys/module/firmware_class/parameters/path
	# hexdump -C /sys/module/firmware_class/parameters/path
	00000000  0a                                                |.|
	00000001

there is 1 char, just the \n inserted by the kernel. Nobody would ever
ask for the kernel to start printing "(newline)" instead of \n.

Yes, the kernel side could behave differently depending if it's NULL
vs empty. kunit doesn't and shouldn't.


Lucas De Marchi

>comments.  Thanks to "module!=none" we are still on the safe side, even before
>igt_sysfs_set() is fixed.
>
>> I'd drop these lines and just justify with the lines below why we are
>> not setting it here.
>>
>> with a small change below we can also move these to use igt_require()
>>
>> >+	 * is requested for both filter and filter_action then that's not a
>> >+	 * problem for us since even if filter_action was previously set to
>> >+	 * "skip" we can leave it as is because our "module!=none" default
>> >+	 * filter guarantees that no test cases are filtered out to be skipped.
>> >+	 */
>> >+	if (ret)
>> >+		ret = !igt_warn_on_f(!filter_action && filter,
>> >+				     "test error: filter_action=NULL requires filter=NULL\n");
>> >+	if (ret && filter_action)
>> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
>> >+						   filter_action));
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
>> >@@ -1116,24 +1159,26 @@ static void kunit_get_tests(struct igt_list_head *tests,
>> > 	/*
>> > 	 * To get a list of test cases provided by a kunit test module, ask the
>> > 	 * generic kunit module to respond with SKIP result for each test found.
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
>> >+	 * We could also try to use action=list kunit parameter to get the
>> >+	 * listing, however, parsing a structured KTAP report -- something that
>> >+	 * we already can do perfectly -- seems to be more safe than extracting
>> >+	 * a free text list of unknown length from /dev/kmsg.
>> > 	 */
>> >-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>> >-	if (igt_debug_on(igt_kmod_load("kunit",
>> >-				       "filter=module=none filter_action=skip")))
>> >+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip"))) {
>>
>> probably in the caller or very early:
>>
>> 	if (!igt_syfs_has_rw_attr())
>> 		return fallback_kunit_execution();
>>
>> I think it's too different this approach from the previous one, that
>> results in the long comments trying to explain each different
>> step.
>
>OK.
>
>>
>> Humn... I guess we can do that on top, so if this works, seems ok for
>> now.
>
>OK.
>
>Thanks,
>Janusz
>
>>
>> Lucas De Marchi
>>
>> >+		/*
>> >+		 * TODO: drop the following workaround, required by LTS kernel
>> >+		 *       v6.1 not capable of listing test cases when built as as
>> >+		 *       module, when no longer needed.
>> >+		 * If updating writable filter parameters of the kunit base
>> >+		 * module with required values fails then assume we are running
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
>> >@@ -1200,16 +1245,7 @@ static void __igt_kunit(struct igt_ktest *tst,
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
>> >+				igt_require(kunit_set_filtering(NULL, NULL, NULL));
>> >
>> > 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
>> > 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
>> >@@ -1378,6 +1414,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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
