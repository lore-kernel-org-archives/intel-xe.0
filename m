Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE876C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 20:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6CA10E0FF;
	Thu,  1 Feb 2024 20:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoN/JvxQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC91310E0B7;
 Thu,  1 Feb 2024 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706819202; x=1738355202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hpa7rj6s1VmAxFWdGYvPzVmcre/cwenfSerpMRLKXmQ=;
 b=hoN/JvxQ5GGU9JnXUNJdQiFwd2ebgUGyjPAoRY3mGc5m20bbs+a8m93g
 2/HqEX7Y78oaJ7FTGh48rZBYbGv0nruq26u5nrjkYLPzd5G93dJkHjy7t
 w9iPsdRxVBdgGzWeV2PLDqyQ5Gt74IDXkKIM6lZ4KUXu/rO0lfb6VF32L
 rLtNxQhT0A0Uv9t7CcYVR1YMGw1PKHdphQGoM50agjIlJTkOr94okQpxC
 6cMYms4H3tvQ7LyCedEBh1ppxONE47epXI5Su7Pqm5UEyT7B7R5u5H+pm
 u+jAlqBp7NaCVHovlKz5G3db+eyn4TlLRstf7AbZ6BtZm4+NrBK3Phjct Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22502461"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="22502461"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="738544975"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="738544975"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 12:26:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:26:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:26:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 12:26:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 12:26:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgB7bByxwxY2Jv2yy74ED9ZsFb9B9G/vC6cADHfRVHPVl83M08shgCEbpmfY4zADw75NShn7P7nm81Z4EkMsqf3MzfZ6uM6x3+CV7toDRZzsSULfYoxPSlyVudG9RF1JvxaTKB7cH00QwfYOQ3MC/RgA75BKRzyg9QHDBOvYo13b4C2RlkMX1YA2sAKl+pxkTGjIi/e6C3Ovpe2hZl9RDre9agqajodjXr8zW3tgDrYqre+4ASTPZmOQnZNfvoREPZZDTYhusPuSJ8xUCPtiTo8wy4Y1UVDqr906bpFldqd5koNX5nadSCZmVI25ev4Q87o4FFofGtshLK0DkPTc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLMYZNDz70RNbYdQUyp8OeDMyuodsdit9gK5elQYCHg=;
 b=CdrHa/WNYjnAmH8PD8ReAStnKU5vnBBgIHnlQrS/5rtaNaUwuSJ73R56sXMoLlHgKKvVnHoklshurhk1drPYnw6AWHxPNe2IQ4/hTCJrm5g2L+Zjagb7EMq8X4UFQ8+1ewu2fAWb4dUMgw8etM38rXp45S8LKrA8/CUIpW1AuqS6dx5RBDygN2UthLx0KFRmkoSnK8cQKyWx2Rdi3lrIzA/XZsJUtlSfMqcS6tzsUXDB7I8OmS0fMRSKJqoYqA/baOkpEAId8tvAkinonojc7vjy5gD1lYtV7AG3UHIBR4NxgdP+Ps/Laj5KBjM5x+oKpfvLqSwK2Drif21kD0ytZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 20:26:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 20:26:37 +0000
Date: Thu, 1 Feb 2024 14:26:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <3ehhnx6ijqdzahhkemcf5x4avps4e6inrrgd6p4dqgvu7ydo32@zs7hpimyjhy4>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
 <20240201190237.150754-12-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201190237.150754-12-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: d81c2a11-e39d-4cb6-4290-08dc23641719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtchwQNVGJQA43oFefrGkbhoAGrC03ukygnDiw3G0PwASIRFTTlr2SPAQb0bYq5X6XK6BJAKoJoTsrFmWeI2ATkuTnTViI6xy964tvBRDzsuuOxjSoWK0WSRs2hHy/p0cXJuClgUuFRQgCYJ72fbdAW10ulwleWQu6FR5pHfKrcXEzoZXbJcsgti3huFA0yd6Nd3R2qLw10ey0knvqwX+SBbYDv0kvytOqyKdf37vg7CZBiTwT4oKE3HYNPg2K5Pj43YNh+GMzYfpSM9/tWPv8luprSOtMx+bXu8keYqK3vfPmxeCh34IexAx+RKjwUoxkEFoiiSJlDI0xwCk3SAfDW3zGcgbbJmL1Xav4mIlck65hJe23kjx+kO6QN05/qe3BuB9OBkGE/HZQj6fcwFd5OqF1JhsyXhvKw4FtiNrsDRkzXTNYXKRy130XVa3K2e6HGsLB0itYQcS8eUK90mTrT3kyVXnt32BClLWDWQv3zoXawKbPHdz4LgbwVxjmVuMg7xcaJHT5+KVqlxa57PRmyVU/8VN8ey8XTZv8BtLTnzKTvl5EiFcpguBbNBxXab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(33716001)(26005)(6486002)(38100700002)(83380400001)(6512007)(478600001)(6506007)(9686003)(82960400001)(316002)(86362001)(6916009)(5660300002)(66946007)(54906003)(8936002)(66476007)(66556008)(4326008)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q3j3pOAToq0SrlNovEbCN7ICRTLPCLID4LTdqIDOZIKRTtLiUM+ME6aPXUgd?=
 =?us-ascii?Q?wcoXNMIs/s6lBQ156DOgFmNpzm6soJGJZMn4/GrMuy6YjztVM9rkGlwm45D7?=
 =?us-ascii?Q?PfhOjgueQP54+RlJyAGHplqP8yByLGxAD8WYqmtpXV7q1pw9iBHMHrDtr/fg?=
 =?us-ascii?Q?imZ35EWjeCpz7RQul5konqXA9PYlaUfB2MyfFigpmSk9ZOxBEKbBUpCt3gsH?=
 =?us-ascii?Q?Q72z1+GBYgWeEAYK+WLI+uM3Uo7rbEFCSmVUBJByuoau/5tchcquHZJaLwVu?=
 =?us-ascii?Q?Pk7wmKSNQR/h23lhV+HtB9VYb1m7KPRTCAXr+v1Tg+nArQx9ddDBuW5r8Pen?=
 =?us-ascii?Q?bQKiTPoOTstJRlZ8FjZWfM2H+YfjNuqA7QKWaBSOhKN3RVfWqbyUQHPPZHuQ?=
 =?us-ascii?Q?aCwCRR/X0azFuUnSP1vTkVYB9AuaI3e2fmSscgwXuhL9cRJOrHDnflLthhT/?=
 =?us-ascii?Q?hkE50/O5CgSTA6+jD7gbT4mSraACo7nSfkAFlcKDUYVoWEQhNVh3MV9G/i7I?=
 =?us-ascii?Q?QBNf9Z3ckGS1xg4B9Qy2Fgbve2eXBfGcdsqRu+d2iMiFuR/wmRHClt4+YfLF?=
 =?us-ascii?Q?HVsKYXdsObIUoj2BRKZIBfVbdX6RAPIsYzu3VhW6lE2E+q0lvFUqheFz8usR?=
 =?us-ascii?Q?nmP2FWPok1LTW4JiccrtMJermK+9uqeWXb3iONxHMqRAnANyntiyMR3POsyt?=
 =?us-ascii?Q?IMkQg6hrPBB+iUukH31zAKTiODS5SE2X9AH/prm6ycaiMx8QRoMWtC2EM4pN?=
 =?us-ascii?Q?K6QqnwTCWgGzys8IytloIdSyu4rOCjLeq3y6Zua9+zK/ZGhInCqay8uOG/qg?=
 =?us-ascii?Q?mvfvCVshyCONILvSxpFzSXt+K/LSVba0gVhSNx2x36LPzq3LvazgDbuleRmu?=
 =?us-ascii?Q?h5ZH4BVZTN+MBmfYn2VRlsxNXXVehFXQVUWpMLVz+AzzYAcXImUiXNPXE3I6?=
 =?us-ascii?Q?dgFFgiCdnEu9CbideTkx9BX6V1f5AwmNZFbSbZW7oNgkzABD0DIBMI+SfCOx?=
 =?us-ascii?Q?IZZ9KX4r5I8qOKPbfLSn3HX3GvlFUwRpIU1IXCavVHt1Qux/wA8b0TdvVmV2?=
 =?us-ascii?Q?bLoimKBGvRO0eiOJShQkATUWby3s0YWSkw3wTFBNv664iJ3li3I8GvyWK4Ue?=
 =?us-ascii?Q?QaoMj9tT6X6bbjpT1/Ke9T28jp7Bwpqp5tWsxlvwYQZY4geuMhla3CsQcBmW?=
 =?us-ascii?Q?OyzukZMqSMgvSC0jAglwBNvqnfTkwaQWGe06CAmFxw9mB6qgxjlfBRN+clbx?=
 =?us-ascii?Q?1vLExOYXrH67kN+PIEbmlazHWx3/iBWsA0FvEdVCtL8m8AG0EzlMBIqZT477?=
 =?us-ascii?Q?sG+/0+VWY8kXzQG/+92lXS0CMsVPZXtHrI7QfvUBYDsLdFy21xW0TeN7zKky?=
 =?us-ascii?Q?TJjH5d6Rv5sZNEIUK8PxJVHAU3pwxweLEYRV8w8sHcPTn6JaxN2lkK9KemxM?=
 =?us-ascii?Q?9Gz40JNNJBnrPBhsC/Xb0FAKmhAXhpuK51dxDKGaeOYa92lr5wFy4Yf4QoVD?=
 =?us-ascii?Q?GWXgpw85wlGiU4m96opblDeju2TExFQO60L1MqjyM935Ir8D+02vHvS6VjTe?=
 =?us-ascii?Q?ZD8kEdjv5r9YKmIQfMmnUn+SSibkPgASESvQmcBUd6GUkAThEblbLRKftxKI?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d81c2a11-e39d-4cb6-4290-08dc23641719
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 20:26:37.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7olqzqbAzndwmd6SqkhJmMgg+Vfq8/lGqLyLxoOyADz4EkAMnmuWqIe6vmgds3b2VSvX3iB5pOCYATces1Q52of1yt48roldu8rc0MT8zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Thu, Feb 01, 2024 at 07:59:20PM +0100, Janusz Krzysztofik wrote:
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
>v3: Don't read-compare-write, just write the values (Lucas),
>  - skip calling igt_sysfs_set() when the string to be written to
>    filter_action is empty (Lucas),
>  - warn if we leave the filter_action set to "skip" while setting a non-
>    default value of the filter parameter,
>  - transform generic kunit_set_params() to kunit_set_filtering().
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
> lib/igt_kmod.c | 91 +++++++++++++++++++++++++++++++++++---------------
> 1 file changed, 65 insertions(+), 26 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index d2c28d0a64..83416d2aa4 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -811,6 +811,49 @@ static int open_parameters(const char *module_name)
> 	return open(path, O_RDONLY);
> }
>
>+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
>+				const char *filter_action)
>+{
>+	int params;
>+	bool ret;
>+
>+	params = open_parameters("kunit");
>+	ret = !igt_debug_on(params < 0);

why proceed? just return early when it fails pre-conditions

>+
>+	/*
>+	 * Default values of the KUnit base module filtering parameters
>+	 * are all NULLs.  Reapplying those NULLs over sysfs once
>+	 * overwritten with non-NULL strings seems not possible.
>+	 * As a workaround, we use human-readable strings that exhibit
>+	 * the same behaviour as if default NULLs were in place.
>+	 */
>+	if (ret)
>+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
>+						   filter_glob ?: "*"));
>+	if (ret)
>+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
>+						   filter ?: "module!=none"));
>+	/*
>+	 * In case of filter_action parameter there is no obvious human-
>+	 * readable string that behaves like default NULL.  However, if NULL

that is not true.. it's just igt_sysfs not doing the right thing to
write an empty string, that does behave like NULL on the kernel side.
I'd drop these lines and just justify with the lines below why we are
not setting it here.

with a small change below we can also move these to use igt_require()

>+	 * is requested for both filter and filter_action then that's not a
>+	 * problem for us since even if filter_action was previously set to
>+	 * "skip" we can leave it as is because our "module!=none" default
>+	 * filter guarantees that no test cases are filtered out to be skipped.
>+	 */
>+	if (ret)
>+		ret = !igt_warn_on_f(!filter_action && filter,
>+				     "test error: filter_action=NULL requires filter=NULL\n");
>+	if (ret && filter_action)
>+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
>+						   filter_action));
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
>@@ -1116,24 +1159,26 @@ static void kunit_get_tests(struct igt_list_head *tests,
> 	/*
> 	 * To get a list of test cases provided by a kunit test module, ask the
> 	 * generic kunit module to respond with SKIP result for each test found.
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
>+	 * We could also try to use action=list kunit parameter to get the
>+	 * listing, however, parsing a structured KTAP report -- something that
>+	 * we already can do perfectly -- seems to be more safe than extracting
>+	 * a free text list of unknown length from /dev/kmsg.
> 	 */
>-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>-	if (igt_debug_on(igt_kmod_load("kunit",
>-				       "filter=module=none filter_action=skip")))
>+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip"))) {

probably in the caller or very early:

	if (!igt_syfs_has_rw_attr())
		return fallback_kunit_execution();

I think it's too different this approach from the previous one, that
results in the long comments trying to explain each different
step.

Humn... I guess we can do that on top, so if this works, seems ok for
now.

Lucas De Marchi

>+		/*
>+		 * TODO: drop the following workaround, required by LTS kernel
>+		 *       v6.1 not capable of listing test cases when built as as
>+		 *       module, when no longer needed.
>+		 * If updating writable filter parameters of the kunit base
>+		 * module with required values fails then assume we are running
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
>@@ -1200,16 +1245,7 @@ static void __igt_kunit(struct igt_ktest *tst,
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
>+				igt_require(kunit_set_filtering(NULL, NULL, NULL));
>
> 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
>@@ -1378,6 +1414,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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
