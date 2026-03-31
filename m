Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449010F9302
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 21:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274810EC06;
	Tue, 31 Mar 2026 21:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6jqZrkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F09710EC06
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 21:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774994007; x=1806530007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HqyMft9HkHG1N5fXlYhZuGKJ/J57DD/UjH7uS+8CO6A=;
 b=R6jqZrkQ1Yw4oyfAUiuEpDFKNUTXr+1RyUopD5pU8nsBJrMTlinOWgB5
 SKmPJIqv6a9whfS23m2aGVUvJaegVU09QGLZnJLr72jm0AqToC1aafDJ9
 sxrwSInDiikEMqaaz1TQYQo9+o7P7BBuRDgw7zLhkHku043Vp30vYZRIr
 tMV5UbVDeuoRRz02HG9HNp+33u90qXlyudEyo6w9hzGx8q0PItIVig0ef
 FLJimPU1VWQovKkOaeULaKt4DFcFQzee/VfH8jpJW07TpZ0lP6mg1LaBT
 8lcE+850QzILWUgprcYh67vRE9tCxwbxs0uslZZ4wO4ixDmcgRKEBh/cR w==;
X-CSE-ConnectionGUID: 4i9y8lTbSWuszFI/1E6eZA==
X-CSE-MsgGUID: y+Wt3ZaaQrqMHXHwjItbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75984726"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75984726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:53:27 -0700
X-CSE-ConnectionGUID: BBqvjZsTTwWUPowLPN+emQ==
X-CSE-MsgGUID: SnrnwbH9ThGzMtzcDeoemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230557432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:53:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:53:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 14:53:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdEd8Rv3HDTtB1kP9B62fHmeWEVXSQcrAHh/wCm5d9OXZhNAv2t2kHrjqaIeeEcmRkKMOIO/EJaeiRraU9bGetgZHCMX/TXoi5y7jyietCk8IqjON4w1VdRZIKZl68bhSgGGr9afEPnme/AKlwDNrnX5UdK5Cmd5ctVtrph3/0NtXGv7FC1PXvNFKD6jyhEVDi372zlcr+wUuQwhOgo7w+UhHGmZUKb5i8XnwCL3b4Vw78MRQe6C/GNMPPcDVf4kr1D97bXFQ6SqjtjxzLNBOEmXmgCkbanI9MxBjEud383+DuWFFKsn2GoV6lmuvk73zKU6bHVzm81/2W4EeA5ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VJxHWodDG5Heqo7YQ1qityM5rWAo8SuIW+79MIpp68=;
 b=c5B/vRtRtcja2oqBueZK2rgHSw4IF3CYZZB68r+4qQt1SXojJOnm8UesH1O4DrxIPnu1zFzpV6/8qdO03YKTQXNx3pUT6su615uAHNgWCO5u6yD2d9sT7enTxwGkUopr53gYAa/lKOGbjBdXQQLlrabpxUCUoj4uTvv/sDZo8tovxYpLoKaFiUWFixTnZCMskPDU4ndYe6AfZf3F4g0f+cvNI3HHaCHKlngY8esbxjGvDtgLNScXdcMYvY2st39YuH4V50MTeaDsGd6bQ8swyo9M14B+e1kWbZ9FxNbEdPUvjSVCCBb0YTJ1XYQ9nWnhP7tynZ8uI0HK5NP/Oc6UVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 21:53:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:53:20 +0000
Date: Tue, 31 Mar 2026 14:53:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe_pat: Print PAT_ATS during register dump
Message-ID: <20260331215318.GO2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260331134330.2535519-2-zbigniew.kempczynski@intel.com>
 <177498329364.419941.17938652378811281140@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177498329364.419941.17938652378811281140@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPF4D011AE7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5e829a-33cf-41b6-9383-08de8f6fec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: VEWjYOXtAX3zUHMgUGbsE4A5G7phXBqJ+Nphr74ajDYvIdo9LV7kVI3styTTKtq+/4SHcCK7CaMutMZpT19aBuJBzcsn4z/YhUGkdS3Il9gq53ICFHdjUQdDbSxKN1Xn1WrDdJ4ardiuKxzDtohGUYd99IOrO1T1PByqKayxDDB85QvpA32RpAuuWkxO1Yx/vdxGHGBST4AbMuWBilusDMW9w1b3IJ/JTf3eNGILqeUB+YnVWlshOKvpscepj/T6LKkNI++MhfTRSMgiSRsSo7/N4NYdoAv4j+7X+X1ISTdk7P9EEarojTpfqi4KJKNT/RI/os2giUW4pRoIFmB9ylg9NfRpeLXGGnjGsPj45SRCzCTClxnNBFzXN4JeWuR5UYod3wsGztJ+TJWvSDO4VUVmbw/+osejl/hLozNSZZRP3auwSsQxjM2lLYlMy97WogXb7Qzw0HZG7WhfuL8Gw9jSlR88HR8NxzY0mdXjXiBiTaotiEq6aoC2hrSlXc/T9x9MBcsdVfu3qzdvzWVx5H0wJh28PSZOom4au34hAyIxqwn2s7yDdc+iaje6TNDKUKNIZYKL7Ch5QPsZMMP2Of2Oa1/fQ8HGtDnmiW5aquP5Kq+eJ4d50fT1ogfPO8osrOQWAh8yHZt7CBzXBmdy8jD8LTftt5ns5kMLIucHnZR+ERBtxa+exAjI6wobtz0V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dFkPDc4e3hS3jTAeHdKdUZCFK4OTrCVPk/DWDOnvGn38ecZdIT+CxAiNE7qw?=
 =?us-ascii?Q?BjU0tPb4H89wRC+3yclnjreAgAI71EuxGdMbj7a3OpraiR7GY7oRbGt7syU+?=
 =?us-ascii?Q?LXx1L6M2l2lSINltPVZzKVqdIoWswRcbqnLwNjLYodwowRMrcTIBygbJXmO4?=
 =?us-ascii?Q?u9IJ54wGXyZ9hEch6J88sd2BAXmEcRjR+lDS8/YKw8lA1InEQgTPf2aWuHtj?=
 =?us-ascii?Q?8JuBIyPxUgCqQQTWoo5NTkHhYGpatV1/XD0gKc5YmvLHEVkE77qCH2Z89APU?=
 =?us-ascii?Q?AwKn49cMHkDhNSAt1+up3SRQ1JAoQCgOD0Bxhh8lJvmCW6ZlmX8nHrYrYhc4?=
 =?us-ascii?Q?W6l7JB8rU6xfz8WB3kdCMOURWTslQS/5c1Bydill8lHqDRhUzqWPSJerxMhi?=
 =?us-ascii?Q?Nr7YlUNmr0uS/gejjDb094qLjLY6VeuYK2sIfNrOpotALKqkBEViDVyp88nH?=
 =?us-ascii?Q?4dMSc9k/f2fsTINygkbrwkbHqspwdNLWOZGmMoR0GgqlVBwUMIUOp9Y5fg5i?=
 =?us-ascii?Q?E3O4tdYWw2OTkjd+SctKUMScTVqjkt/ooatCxLPKPHoOu0ij8Yt/wBeUpDw1?=
 =?us-ascii?Q?rmRz98N7ySn0uI9YFRa94ipfjbeLcFZLu05A3GgLwe41b6V5hf4YKc14R3Yr?=
 =?us-ascii?Q?OrHY41HYhT3jqe/qKovugYR71lVnXHrOU1+bsV2JmAaHbvHEaQJAYRzqjCYo?=
 =?us-ascii?Q?2v9GzPj6AJ14H+3Hr6jC/Ij9+ahc/d7UhfZicaV1K/OgvHWS7lMQyRmXc2x2?=
 =?us-ascii?Q?0zlvwjXdIOH32uIGMMQzwlzIl7gz/VwxbUkyP3Kd2lpvMvZvLnBXkSlVtY+g?=
 =?us-ascii?Q?hv6uy7+y+HGgbwP3bcKxljDNKWHsYVLbcUGL3ubRLSosDoirAVBk4W33kVXV?=
 =?us-ascii?Q?QPjl3h1yjfdU3NYVK0ZusVpnZ/vbGSHDd0ElFkOSC9jY4xCBFEh7FWaCVuJs?=
 =?us-ascii?Q?etTRe84qqz1WWBqBf/grjqFXFs4tD6DO7BMA0zWpf9HsqcXU4BWiCGp6WuSt?=
 =?us-ascii?Q?IVi2uLhydA6rtOgVEByPuU35cH/2TE4eprLzDLXJmEE79FU7MsOtq6bncEU6?=
 =?us-ascii?Q?Arbb2UfAi/fOJL9qrm9ql8uHTo0xsIjZbM5mYUXIjzPZCcdrwKUL/jHlytoX?=
 =?us-ascii?Q?jojDeYXgwgF9kmgNcWODneZ3Btb0UhgHRhsonSGKupnOa5JBurKIvHorkOiw?=
 =?us-ascii?Q?nsrZWr2piK5mTXFjEUeTQx8rNZTm7fYRsOhgz6k0+zyaAjroT2z9B4+YMlCl?=
 =?us-ascii?Q?1xdpPNrzOAgA701DW1jaBhsN7EFYfJ2l/1K7Bbk0L5dtHcuBJTb3jz0L/HpC?=
 =?us-ascii?Q?rCHVUslJjByqGvXGNTq/B1XJQWZ3t7NlHytkvor+o5q9+Q8vxw3u83zspk+X?=
 =?us-ascii?Q?o1PSHHkBki131yNrsqxQi6aVPL4sz9T7xba0Q11gOQQkc+l54eHCzjHfBdTK?=
 =?us-ascii?Q?nzdQVSRS4ywFQhKtsOP8t8rimmSdZOZTMCq+3iWAHql4JXL9n/Y8SpSZH1Ly?=
 =?us-ascii?Q?FP7eyVch359uQJuMYj7iC67x1HiAUEec6sjS/zKo62WcC3n8WC8Y/PCJ1qbf?=
 =?us-ascii?Q?M5U/OdX6tQ4czSFtVGvU7N2sLd+wM5hFuDZjrKe0GtcSWe+Z5xO7xuwABK1C?=
 =?us-ascii?Q?2YqbwIHsFmGKBFZcSlPgliFqh8+ogl9VPWKIWWz2F3hsIcXi/+NnJ8WwpF0I?=
 =?us-ascii?Q?oYS9BpaYDqVBv6DZJKv1C61tJcdxXbt2ZU1YzMZ3JuNXwIiJ8NxBxtQdrDDz?=
 =?us-ascii?Q?bLjl3Vu6iBsWpbEL94OASKtTSIHvs+o=3D?=
X-Exchange-RoutingPolicyChecked: Bceqx9bnF1cFOrtkP2PT6hMZP4w45aYtD5hHVc0316LjDAFj0m+JKi3SOcJd2T6WBa/itx2UOaiQ+J8Tb0LN6bMg56+HHU4cMIFpeM4VOOHa1Qta/a4B1hE8fTBb8zu7ZtJw1fFGrL795ty1uNJ1aGWKjH9B0GOL5h4XevWhxP3i/atTmdgS8LOgI8aq5KT4pOhXbW7Y58KcLPLHGVX91q0NURZAXHx8CYSMhPUKF+D7ukNUkpUrlLZSbEX2V6BQGPpG4DK+r0Dhrd3z4/y6fVGgJB5s0UojQVzWno9uf2I+sGMJyXFR97ujbWjJ9jaIN6YL4OEI8i4ctkvHMhMMCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5e829a-33cf-41b6-9383-08de8f6fec68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:53:20.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2bhj0l3pQQuj22mOwYYVSSl2AA+p3b7at3w62nvUEsnScwqxwwN6XczmnLOxVW7xEB5AUUM0ON5x8M++3ri1E2ZsUeoAPsbUkV+0YTxoog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
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

On Tue, Mar 31, 2026 at 06:54:53PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe_pat: Print PAT_ATS during register dump
> URL   : https://patchwork.freedesktop.org/series/164167/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_FULL -> xe-pw-164167v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-164167v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-164167v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-164167v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-lnl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164167v1/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

This looks like some memory corruption unrelated to the change happening
here.

Applied to drm-xe-next (with the suggested subject prefix tweak).
Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-164167v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164167v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c -> xe-pw-164167v1
> 
>   IGT_8839: 8839
>   xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c
>   xe-pw-164167v1: 164167v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164167v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
