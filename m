Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87967C4828C
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 01:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471BB10FE0F;
	Thu,  1 Feb 2024 01:01:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C1510FE0C;
 Thu,  1 Feb 2024 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706749294; x=1738285294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iK6X4YKDS/CAYXUxVXEaBKv0EDOOUqdTFbq/E3jpqGQ=;
 b=cj4zQ4tnqng5poS1dNsCBHuhkrrhTkLCLSth8PJ0mc/wHPs0Ogdl2nue
 33ejWY9Ppys0rf41hAoWtjNous8LueVw/pcqmvuWrVL5CsBP2MZ3igSiB
 MlOXGM6RAulQ4hmc22tKDROcjRrn87yG264Jsh8nmvtRIymsumIyXS3/m
 cKf5QuXIkgtq/KDmMh6gkFk7/QbtIRG2FQGmWqqE2TQlwv59v8zpc0KJp
 xmv7wYN0meYo05mQ9hCHynjhGNWpUqM52TKxugvIfFAO60nyrGVW0SEvG
 geKO8zINGW+7WYdoc54Gz5gtzyMrTUEw32ZDzIsEJnrB4E8oFoomcBP/A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11144618"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11144618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 17:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4229207"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 17:01:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 17:01:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 17:01:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 17:01:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiqlYWWhqorJut4HHSXUWUzx7ZYSzIEj1He3kkFvkjylwVZUMYnQTxuKe7brkA3JxmOcLyL3u84bugVLtQBwa9R5qKq8EgdGNs+fV4hYQLZ/DpW+NWNKkoo8dF+jihiuxHY5c+8DoqA9KWtH/3IKXwAGCCqgyodAGsInMh8lyCp99aCp7TXcMfFJlPCwiMNz1AG7zIKETP2oANLXs4NMpAscg9n44NoimtSKcaf/RIA2nO5QjGE5qsWdeaNDRpXzjDQYQoXHDV1mmt098hTM+xX7kdaZuti7bVq4lHZ3OsZxJ3rtheG4fLoaJ3nkvkDZgGMzhHHcg35qN8B4QTbRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLy7pOpJaXCZhIALGYWy/TJA7rpRRLXbEswOv/7EB/4=;
 b=FdPZINfdQNlaknwrhgzfdGm0m8VKA9q+cjPDNgOuS26A741wQgFnoMU5d7lxBWO7cvYf84GD5eQJkrnPuJDlDA0htvdFExIH9HHQVpzoezACeNT82694NL5Uy6vT+zKPfkppsptICf1Nwf4+Gt6MREbuu5c5Cp2gKbE7HnwE6Z8uIJ6D1Ztq4gjl79/sBQl+wZ+UVYkfTtfrwptlADCFdt/chsRGYEug5lTWeJduRyTbqxG5CSzRDuWcWB2HFJzogGetl4gGEZwo0sx0pKtuZN3QoXBX+18rn7ROICp0AgbMyrctyDkPMf/W4IYTr1g/ZQjBULIrt02fr4VDwws4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 01:01:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 01:01:19 +0000
Date: Wed, 31 Jan 2024 19:01:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <wefjuksjpqxyofstfnjdsdr7jdxr3u72kfytuft5rdtxwnkylp@suywjlthr3u7>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 28518792-2f91-43cb-b212-08dc22c14cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tz651UzreNe70oSeyItxGIq2kJed565XHJvB9PXlDoye2AB3t3a9AgJOlLvo1Cz7EM0/fM8AZudv0tn6N9/14BMOOjG6Ekmgiz99RyTYy1V1TbteoG0VCyRY3pWttI9rG+w3uodjqcmsnjICigNsUlvLn/n7TRQrhJ2cyAKB3gBdx93VECpvLuzYbc9XIod5fEp6KXk5Oz5I01NpsKzD78zs4AiEq2nsN+zv+YzqBRrjuB5ZwNs2YhSnppB3Tf4BBgznNILBYCYn6iZQn+wvaUGHURdqjZOY7oyoSXML8Scadf8BIwYd9pw093W4oOkofoPnEcds4g+mVVMh8C0FXc+/jfsNvhYH7g3LYYrVIOvqaJ3noGRnbgHYqu9AhhzW+xk05GZDJAzk0tIu2+ZRlXARsP/DWWXJKyOdO/pDm4UnwNsaC5KWaTUxBKGDCNgIGn6S/0ohbkfj81qa32FK53g6N57wJOxyrbD9/3RfVMkDA/Kq9yfP7yNKBy3uddxS0hs8LAbwiYxXbqumDF/8yAKTWE2LvFR52Jd31NGv8UxjU0y5CHTUV5Jx5RjRp622
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(6916009)(82960400001)(66946007)(66476007)(66556008)(2906002)(8676002)(4326008)(8936002)(9686003)(6512007)(86362001)(5660300002)(38100700002)(83380400001)(26005)(33716001)(6486002)(6506007)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYyeCs1PuEgBUuH7ZL9DTXZNE1w7VtDhbvCS0Lyn/aFIDbfT5nSrHmkpLWdX?=
 =?us-ascii?Q?6oyErQ2JmAWFgSu3pbJZ4zpb/nUUbVHXTveY4pFQdGSPK2/le1qg9ex9egAs?=
 =?us-ascii?Q?SkWVJAprHeq6nTVjEuqWsTp5bvOonbgS7S/BXp/1ID6L1YrMP7ipNfb72e8Z?=
 =?us-ascii?Q?k+20f47ZYlob9BprejN2GLXSllwWvftSZvFhiqyYwfIxUUXfLzvrHjSRNpKl?=
 =?us-ascii?Q?2QDt1KVUi0JYQX4OYJdAyq2hjA98Igm9gDOwv3mOTXI3jnDbeC41FLulZ63U?=
 =?us-ascii?Q?RflUJSYY/pvjRNH+bc4Jmn7LunQYQH2fH0cWGrE/7av41sLingrmBD1u1rM/?=
 =?us-ascii?Q?mtla2FQBktGOtrIoqB+g8xd7R491/7YjkIQO/blhJHJPDtepKMjTeoNGW6Nn?=
 =?us-ascii?Q?7lwLRgxvDYFfaRCEep15VgQuKzdH0ecyXhFoMIYXD1AyT5mlHlGP4XptpX5B?=
 =?us-ascii?Q?jv/9fVN2O0zS8B+VGH8xvQWs8FdbrnlbMqBLXXTmyTB3j6byppIFY4nszn4q?=
 =?us-ascii?Q?GYoR3/6K9uSiSVc+hwxQWpiYlcqVXgnKbcqZdRJmwjblrAZ8q2dKC6QnboWE?=
 =?us-ascii?Q?5FxjzJhe9YR60UO7+rMd2a+lrWyXZIn8ef4pUlis86dUD3ZV/Np9jEdcTbVL?=
 =?us-ascii?Q?dpr2FNMee/vcuzMMYuPFMnOW/vtN2vzx1tIo850GdjNjzeH3qLQDjZw1OqGW?=
 =?us-ascii?Q?TLx4mLw0op74phUB/Uc0OOkjURU6tbI2f8fBIjlBYuk9m4EzFJOhonLQ5W6C?=
 =?us-ascii?Q?/0qMGegnWoAL3GY8hBCKR00vsDR5+BYCneiI56iVerQrcgYfLS9+lVj+6aEN?=
 =?us-ascii?Q?TXundjsHQV+Gqs9BPlddVay9TtfqD62bkTRLnEZwaJL4H7JuLn8A8BOUhVa6?=
 =?us-ascii?Q?lVLHYwR9shoBlSjunw/tFcXecNTTvj2X14Lpxz16HKhijAuvUbqCKZKc2Nqa?=
 =?us-ascii?Q?dSkivwaQPncHfg7vYLCBVFdzfxbCPx3YZZwUzaRY3qgob4P8eM0whNVQuIC8?=
 =?us-ascii?Q?yraUGC5HgCeNYYTHIs2tutYjlf5TvBfqAdxhYvFr1Aa+v3vdNlS/uJSaNoZB?=
 =?us-ascii?Q?JXpFkZA0TxKRWIVe9LdBu7Rn0yhu18SQE4BwC1JRSco7zft9WIzaFWj6ZX+X?=
 =?us-ascii?Q?w61E3/nWF6Ljijj0wd/EzaLYrK7Os1wfpyZBjr1CBeLalxPi+cmOjcQ6nC3J?=
 =?us-ascii?Q?ZuuBbopP69fFgSSMLXuBtM93ghCBNVroXYA7lMY77dB5yREJ1ESw25AA5vTO?=
 =?us-ascii?Q?weFlGAqwf4ImnTC6JvUbIl1U/6W9gxW8hnVOK+ZRAmoPPmUdRVOTbWadxyFQ?=
 =?us-ascii?Q?2ys4C4wLeBuYh6k+wje+nlU7doxVhxiCPFtlXAwemQr2QueaxZqoQVGrIGc2?=
 =?us-ascii?Q?ZlyJEu8o4iJXUs6P9GrsnQW2sLX8Zhnwe9w3UscE94QR/8/snvqcJakcCx5A?=
 =?us-ascii?Q?P+JJutheBZlSCo3R3X+IHIytOLdlMuJo7/MEb/t30nJ1xwGeh+ANiDU0+VRp?=
 =?us-ascii?Q?3heg+j5aa9343aE8CzI3dve7efreBGhxS6vK6G8CYnKixPtcP1lfM68ybD2K?=
 =?us-ascii?Q?+Z0SvMsxzWZ5Jx9LuMBdH3w7hP4g5AVlXXcpDic/aAu5O502dM/zVoLuBJSi?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28518792-2f91-43cb-b212-08dc22c14cb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 01:01:19.2021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgwxUyPx1CAEFkqQ6sWrkZnzjz5jOE69Z8ybsg06vTjSOca+W3Nvy7jTOHbQJMHY5pzVvFH0qULmg44BoFWmIlj0hSpvTT0DXsMrT9DpIJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
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
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 07:03:51PM +0100, Janusz Krzysztofik wrote:
>Instead of wasting resources on reloading the base Kunit module each time
>a different set of filter parameters is needed, try to write the required
>values to sysfs representation of those parameters.  If that fails (e.g.
>on older LTS kernels with read-only filter parameters), fall back to
>legacy "no list of test cases available" mode as we do on kernels with
>those module parameters not supported at all.
>
>This modification will also serve as a workaround for the issue of
>impossibility to unload the base Kunit module on Xe platforms, available
>to IGT as soon as the module supports writable filter parameters.
>
>v2: Work around ineffective writes of empty strings to sysfs module
>    parameter files (Lucas) by using human readable non-empty strings that
>    give the same results as default NULLs,
>  - drop fallback to reload of base Kunit module method if assigning new
>    values to module parameters via sysfs fails (Lucas), instead use the
>    existing fallback to blind execution like if getting a list of test
>    cases was not supported at all,
>  - split move of open_parameters() helper up in the source file as well
>    as cleanup of base KUnit module unloading to separate patches (Kamil),
>  - address the issue of the second paragraph of commit description
>    suggesting two separate changes combined in one patch (Kamil) by
>    rewording the description.
>
>Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
> 1 file changed, 84 insertions(+), 30 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index d2c28d0a64..1d57ea708d 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
> 	return open(path, O_RDONLY);
> }
>
>+static const char *kunit_params[3] = {
>+	"filter_glob", "filter", "filter_action",
>+};
>+
>+static bool kunit_set_params(const char **values)
>+{
>+	/*
>+	 * Reapplying default NULLs to module parameters via sysfs seems not
>+	 * possible, and applying empty strings doesn't work as expected,
>+	 * leaving current values untouched.  As a workaround, use
>+	 * human-readable non-empty strings that exhibit the same behaviour
>+	 * as if default NULLs were in place.  In case of filter_action
>+	 * parameter there is no such obvious non-empty string, however,
>+	 * that's not a problem for us since even if it was previously set
>+	 * to "skip" and we leave it as is, our "module!=none" default filter
>+	 * guarantees that no test cases are filtered out to be skipped.
>+	 */
>+	const char *defaults[ARRAY_SIZE(kunit_params)] = {
>+	     /* filter_glob, filter,	     filter_action */
>+		"*",	     "module!=none", "",
>+	};
>+	int i, params;
>+	bool ret;
>+
>+	params = open_parameters("kunit");
>+	ret = !igt_debug_on(params < 0);
>+
>+	for (i = 0; ret && i < ARRAY_SIZE(kunit_params); i++) {
>+		char *param = igt_sysfs_get(params, kunit_params[i]);

why do we read-modify-write? I'd rather just write the values. An
optimization by checking previous value belongs in the kernel, when it
makes an actual difference. Something like this (but with error
handling):

	int dirfd = open("/sys/modules/kunit/parameters", O_RDONLY);
	igt_sysfs_set(dirfd, "filter_glob", ...);
	igt_sysfs_set(dirfd, "filter", ...);
	igt_sysfs_set(dirfd, "filter_action", ...);
	close(dirfd);

an abstraction could better be something like:

	igt_sysfs_set_all("/sys/modules/kunit/parameters",
			  attr1, val1,
			  attr2, val2,
			  attr3, val2,
			  NULL);
>+
>+		if (igt_debug_on_f(!param, "param: %s\n", kunit_params[i])) {
>+			ret = false;
>+			break;
>+		}
>+
>+		ret = !strcmp(param, values[i] ?: defaults[i]);
>+		free(param);
>+		if (!ret)
>+			ret = !igt_debug_on(!igt_sysfs_set(params,
>+							   kunit_params[i],
>+							   values[i] ?:
>+							   defaults[i]));


filter_action is "". How does this fix the issue of writing a 0-length
string? If we try to go back and forth between "skip" and "", this will
fail.  A workaround would be to make defaults above to be something else
like "run", but we should really fix this in igt.  I'm submitting a
patch for that.

Lucas de Marchi

>+	}
>+
>+	if (params >= 0)
>+		close(params);
>+
>+	return ret;
>+}
>+
> struct modprobe_data {
> 	struct kmod_module *kmod;
> 	const char *opts;
>@@ -1100,6 +1150,18 @@ static void kunit_get_tests(struct igt_list_head *tests,
> 			    const char *filter,
> 			    const char *opts)
> {
>+	/*
>+	 * To get a list of test cases provided by a kunit test module, ask the
>+	 * generic kunit module to respond with SKIP result for each test found.
>+	 * We could also try to use action=list kunit parameter to get the
>+	 * listing, however, parsing a KTAP report -- something that we already
>+	 * can do perfectly -- seems to be more safe than extracting a test case
>+	 * list of unknown length from /dev/kmsg.
>+	 */
>+	const char *values[ARRAY_SIZE(kunit_params)] = {
>+	     /* filter_glob, filter,	    filter_action */
>+		NULL,	     "module=none", "skip",
>+	};
> 	char *suite_name = NULL, *case_name = NULL;
> 	struct igt_ktap_result *r, *rn;
> 	struct igt_ktap_results *ktap;
>@@ -1113,27 +1175,21 @@ static void kunit_get_tests(struct igt_list_head *tests,
>
> 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
>
>-	/*
>-	 * To get a list of test cases provided by a kunit test module, ask the
>-	 * generic kunit module to respond with SKIP result for each test found.
>-	 * We could also use action=list kunit parameter to get the listing,
>-	 * however, parsing a KTAP report -- something that we already can do
>-	 * perfectly -- seems to be more safe than extracting a test case list
>-	 * of unknown length from /dev/kmsg.
>-	 *
>-	 * TODO: drop the following workaround, which is required by LTS kernel
>-	 *       v6.1 not capable of listing test cases when built as a module.
>-	 * If loading the kunit module with required parameters fails then
>-	 * assume that we are running on a kernel with missing test case listing
>-	 * capabilities.  Dont's skip but just return with empty list of test
>-	 * cases, that should tell the caller to use a legacy method of
>-	 * iterating over KTAP results collected from blind execution of all
>-	 * Kunit test cases provided by a Kunit test module.
>-	 */
>-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>-	if (igt_debug_on(igt_kmod_load("kunit",
>-				       "filter=module=none filter_action=skip")))
>+	if (igt_debug_on(!kunit_set_params(values))) {
>+		/*
>+		 * TODO: drop the following workaround, required by LTS kernel
>+		 *       v6.1 not capable of listing test cases when built as as
>+		 *       module, when no longer needed.
>+		 * If updating writable filter parameters of the kunit base
>+		 * module with required values then assume that we are running
>+		 * on a kernel with missing test case listing capabilities.
>+		 * Don't skip but just return with empty list of test cases,
>+		 * which should tell the caller to use a legacy method of
>+		 * iterating over KTAP results collected from blind execution
>+		 * of all Kunit test cases provided by a Kunit test module.
>+		 */
> 		return;
>+	}
>
> 	igt_skip_on(modprobe(tst->kmod, opts));
>
>@@ -1200,16 +1256,11 @@ static void __igt_kunit(struct igt_ktest *tst,
> 			      t->case_name) {
>
> 			if (!modprobe.thread) {
>-				/*
>-				 * Since we have successfully loaded the kunit
>-				 * base module with non-default parameters in
>-				 * order to get a list of test cases, now we
>-				 * have to unload it so it is then automatically
>-				 * reloaded with default parameter values when
>-				 * we load the test module again for execution.
>-				 */
>-				igt_skip_on(igt_kmod_unload("kunit",
>-							    KMOD_REMOVE_FORCE));
>+				const char *values[ARRAY_SIZE(kunit_params)] = {
>+					NULL, NULL, NULL,
>+				};
>+
>+				igt_require(kunit_set_params(values));
>
> 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
>@@ -1378,6 +1429,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> 		igt_assert(igt_list_empty(&tests));
> 	}
>
>+	/* We need the base KUnit module loaded if not built-in */
>+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
>+
> 	/*
> 	 * We need to use igt_subtest here, as otherwise it may crash with:
> 	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
>-- 
>2.43.0
>
