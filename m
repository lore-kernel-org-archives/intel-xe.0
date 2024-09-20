Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80FCF9C67
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 20:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4014610E301;
	Fri, 20 Sep 2024 20:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7eZeRit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A999210E301
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726864825; x=1758400825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=snGGTodZDxrcVFNSNw5fqvSoXGSli2MU0y9sqhy/QpE=;
 b=e7eZeRitgbSgv/mnEAMCrZk8uo1qYA+U/3j88PBWCp/QU0gy3Xa6E1dc
 FDogfndNb/YIuYXnDif2NJd/WhkjF2eNyB8PCoZobIDnnNBp7V9JicI3M
 PupnEMjVet4iA4A3F76dYr+745KvFPL/2oq69z0AezRM/X099XO7YfNlV
 SmnyeaS9/BPElke2T3A2Hj4CvTKh+8EC9lEGUdPR9ojI93n2MNkFWBq+g
 lfJpPrBktnbCvZ08l2GUSGkNOhHI0p8EeeUAHBhTbMIHwLkv0P2DmbWu8
 YXmNmrlF+VMB3UL97GQzG9ujTk+Ruq1H0bGOVvRMDWswNqJuN8HI6T0Ew w==;
X-CSE-ConnectionGUID: kqtV4S4ITiG6M8aDd6+Vzw==
X-CSE-MsgGUID: zEqL/rn7SWG7VQNQ51uxcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25835072"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="25835072"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:40:24 -0700
X-CSE-ConnectionGUID: r6+EbALZTHylQiVMR9k49g==
X-CSE-MsgGUID: ETYXGnQtQZmopd7+AgViFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70563059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:40:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:40:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:40:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:40:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:40:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHDwfIVaG3Zb/K6+94X6VndCx6r0rFx2ejKDo7IKwjwsn4w3U1Ho4E8yt81Ce3QanFcdTMa/FcAjIL14Ggx9cNhdhp5iiaUeVAZsySpGNhiEEh9UU8crEhiG7G5kpwhzr7X1UomzVFw97u3eb5Ro2PPwIJpuGoVc0tQDDYXNZpMnvTi0hzJt/FhaoPGqVzqrfaDWyQtZTZdcRrX8NfJ3gP6liwNfnYWTBRCDet5k0ElhjC++i7RYB9OxyYp3jJE0Z/npXZJpInRVbE/YXq6nvM9gh2Mz0tjfBdGT5d0pa8aQc2PkhUhnK2gO4ZUrE924wCjx0A504lopFL43JjPJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzUALSZtr56RL4kNTrnFzxWmPETIgFP+UlSOsB3kY3k=;
 b=sB+H1hTUgvv3ZQRJ/F9SNGEW5Qmi4WSmLm15qLQ9dHjXt8wKJBSO1l4qGImjxuDTmiqwQJcBSiSCtPDYsCFkgKRCw9H11hdOWM5aL14OgmLNXcnvxnvjpVTPoow1oNkIK+SQxDEgsnBnSKM77aoONcPTDNFDV63jZdW3ieGC3kpBGsL6ji7BjOav5a2W+jLa8HUKiP7Fye42HOPdU2zuaKtYJyZElkTQw3oDGMEw7ldVqOrbPa7oKEeK0ZttLaGyYPcYjK1MzAaqJAGB3DB4gDdX0ePgyDEExcRMN87kDxXg3aKvg6BdKTi6NI5gm0aJdbcCWWGl3DnZYjYncUyaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 20:40:17 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 20:40:17 +0000
Date: Fri, 20 Sep 2024 13:40:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/pciid: Add new PCI id for ARL (rev2)
Message-ID: <20240920204014.GY5091@mdroper-desk1.amr.corp.intel.com>
References: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
 <172617671400.993829.9047036691935253218@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172617671400.993829.9047036691935253218@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::35) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: f11a581f-4b7f-4623-077a-08dcd9b46f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OXBAp1AKDETIkh/5YExMwAfFHQJpzc/749vJcogOmnBRB/fApT7UFvQKSzau?=
 =?us-ascii?Q?QpMHSAZfxwCQdSwSEpKfWqdu0QqMfzwAW9g4RGTccLgeSZhd50Ft6HvE94Cm?=
 =?us-ascii?Q?sxhHdeB3N7PFwk4iy8goAv3+WwDr+ww716T0fVsGMs6y50Qu7v/1KStI/f+X?=
 =?us-ascii?Q?bWaiRzv3XBltYt1z1gO9mruHQGhhOf3cGmZW0UYfg8WXqymGs3pEE4BiIpnc?=
 =?us-ascii?Q?DdTCbHNZAbA3jIbHZP7fNMgsefcE2AlnXo+asElVJEhRzBkCtYyiQVjRO9Mg?=
 =?us-ascii?Q?81ziONPdiliZilERIZf1ETOX8pftyX8iuko1+/5eG+SOao9sZIGwo78BriQa?=
 =?us-ascii?Q?H5oH80UJW5TVxTBgMPmcuZImQxiUBc4Ge4I0jAKC0EW47jdycNoicd79RFOs?=
 =?us-ascii?Q?l+u7OTJkwLYrMODqI+LGSF9+tXmhPwCctETgAbxDicqTOD/zKcQEmi2tmKuk?=
 =?us-ascii?Q?NJeM04cSGvv4LSNMxumeKokGICGy7BZyNF/YP1yZQV/wvgVAkR2Zc0MLZZym?=
 =?us-ascii?Q?iKXPbv9ciUa62no1y1keEQX3hMXN/0rCmenAdPtJEXfD2HCVtt0PM4fxl/U+?=
 =?us-ascii?Q?Nm06LL4ZLSz6dePmgE2R0VEGknrZO7V6azY2392RI3gclHOE7DjDED7CaBpc?=
 =?us-ascii?Q?azAxjIb0MmZX79+ula9hWyUki9KxwsMpzxVGp35pJ92b6eyqbdvzfekjOAOx?=
 =?us-ascii?Q?qtXXjZddvQXtGtwQ1DHPTapQbuZHX0oi0j/kM0r+5g31c9AUtmmmW6UgkDIV?=
 =?us-ascii?Q?QAnPif1UW5SM6+VB1dpGkAgTsONhqbgfWwbDrBW/L1dpJ3mQzWQwEym4ueU9?=
 =?us-ascii?Q?zXxJwTdj5PkZI7vMWXA9Sd8Ndz93KbkGxLkGxN+bJXnZvkkj0nvsZu1x4vGV?=
 =?us-ascii?Q?GdqdBa+zCF5p4lHdSVN0OGw62uQaRe3yMxSg5TnwHwR/UU/Uf1KNIi8p2ZE4?=
 =?us-ascii?Q?Neg7diXNdaQOVlY4s3ZWIBobLCGMHdSe77ds5C74gkKFYW1UjH1e+n69IIbq?=
 =?us-ascii?Q?k/oyotHGumZ0wdKfbVLmUhZIh6W8hlXo11Sdc+xuHrSHB8lu+t9t2hJN5Ggt?=
 =?us-ascii?Q?l7UJ9poWKO91BqGZ7yrUP/RNm+Dns/1yM/JxHgwBY9o5EeXLigucoOU8BOPA?=
 =?us-ascii?Q?y3DgPZnIQxo9IKCvZQGM+HyQ3QBy0eMRZtw9uwHs+WQ/yHE9Zl8S8exmYL51?=
 =?us-ascii?Q?VJuWw618spI4xcdIMjfvkIDcsur5PbM2btXSwXloNMrtNcvFOT/j5FSJ40A?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zSREEdF/U8d8VYHg54tRXwK6AlC3+/r+MAO/woZd319IfGW/XOQ/ykUgYMa4?=
 =?us-ascii?Q?fwXR3QfipiajnhK8sjMf/KUslZXlMleuoJmik9XjY9smjdOwNYjJz2sfZ4L6?=
 =?us-ascii?Q?2FB94M93yTVCFIREJyhhBf4XHlv4RSfThwWAuUHa0m1hPspBH8DWik9rhhug?=
 =?us-ascii?Q?06Ad2zSyFKi704iWP5xcYQe3rlJkhaFpG2d/S4M5dm/yZ+mFzWxIwy7BxjW0?=
 =?us-ascii?Q?yY8NoGhjUU1nxuD6mxtx+kW8RaEKT4Vn6yw2ZdoczJtc5GeeC6gJuLLMR8IZ?=
 =?us-ascii?Q?XlHmFBvxIrH4pvwSh0pft10VVf0shT8/ZbESHp2goUvywn3i3FDlTW+gVWtb?=
 =?us-ascii?Q?WY199fj30bQC8PXMHuOXYQjHMPub+0Uk0+VrrHedVwcHIZVVV2y/kda8XmML?=
 =?us-ascii?Q?SGYupOGMesJxs6sNF76ZaCtViLJ9NvhpoMZ2mMNLsB6CMG64Zd4G8lMPirwn?=
 =?us-ascii?Q?xQoNrM1/Z1I9ieCYeFxwGpYmaXYSfEgmlBAc3KjjtMF4uCrDE+zPEyMw//ru?=
 =?us-ascii?Q?LvJaBXjh6KO4AfJDi9vyfkG/ckZ0ABRbArNYIsyziLzLkLdArHI50YDvLN19?=
 =?us-ascii?Q?2y9az9WH3+gPcOvx3gXyKG1LjbppD/VSxj2m6XnPUkar7vYaY8met+o1hpcQ?=
 =?us-ascii?Q?QdQIwy+8drLXTLmM0Uv4ut0Woc20XCmMg/HjeDfguA3bIIYXg0y2lY8DkOG4?=
 =?us-ascii?Q?9ATGhAVLxVF5NQ7oxTyWTlt2oEbrcJrtgUqyxF13jEGRUlFrRdIF46sIUZS1?=
 =?us-ascii?Q?S+rAT48cE+HLSU3QiXouI4KDMlI4g0HlG0ohjR89yxH/vOhXNGRX5mbgm9Ae?=
 =?us-ascii?Q?vtIsgar05EogWZUg8JLHePF/CS5Wc6OuYZYE2qngSrdR48h3lPzDA6Y82faq?=
 =?us-ascii?Q?e2lDsOstrq0GyJ8+njHmkB2SC0CpGYSEVKmxCmzblkVTdDyZvpcwSm7IuyqW?=
 =?us-ascii?Q?TuRiW6Hguqv6pIwmJaK6+cKAiuCZixv/A3WhjCh8rbCmW6vxiujR3mrNh7yW?=
 =?us-ascii?Q?vWuD2YJaseWj21trSK8pI5QLvsIr9ukEV7BflDLj98WySo4u2FIYVF0aYUfc?=
 =?us-ascii?Q?y94R+hg6/krej8Y5JlnfxH6XATrSNx+Mz9pHQKLaldW0r1pmypt+CY1xDIXc?=
 =?us-ascii?Q?gkFtDkn/JqT6yUFtldxNjn7jzPk/QhUa3ZEQgeNhpeZstVdi3Xb9jQRD9vgH?=
 =?us-ascii?Q?m94WUaHJ9C6ohk2POeI3Ccyp1rjOnzr5hkZqweAIthdffX8LBRyuoxu9u82Z?=
 =?us-ascii?Q?Z4UE2h56KfeuRwRzoUtYL8HwPDoGVhziN1a3PfQc2iZEvUG/idYw/uPZxG9L?=
 =?us-ascii?Q?SN37EPIksDv9veWwv/kpHlC9uSSQxGzElP6mzcRxAHHIUF4kDHtP/lV6AlSp?=
 =?us-ascii?Q?KPub/cjnwtEA0oX5lmcAUJ6eSAMmTKTW2wn+jGXskBV5Ysor4xa6P+RQy4tI?=
 =?us-ascii?Q?3PJSR7bvUuLwCFwufzKeaDuVLo0pSVhduwLbLZtYG3nt/qa4gb1x7KFCVodG?=
 =?us-ascii?Q?ArdqtsYDwF6/QqmA83tb3vna7/yxYB1tT3A4lv4Nzkr1H3w0nfY3RELLzUm/?=
 =?us-ascii?Q?JrH0iWz6+a50Di8vLzDGKNRy5ppCQZVI1Iz9LywEwvSvZ+LE/vJlAY6ZZALn?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11a581f-4b7f-4623-077a-08dcd9b46f80
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:40:17.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD4rqcf6V9LwkUQyLqn6qYLRfbDQSBZI2LiwBDso6AlKK2a7nt3AcD50R30H6fvMMRbajjf1nN+gh1JMTqLC4zepFpzxOnVU6xwejldFtwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

On Thu, Sep 12, 2024 at 09:31:54PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pciid: Add new PCI id for ARL (rev2)
> URL   : https://patchwork.freedesktop.org/series/138509/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187_full -> xe-pw-138509v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138509v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138509v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-138509v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html

This DG2 failure is not related to the extra ARL PCI ID being added here.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - {shard-bmg}:        [SKIP][3] ([Intel XE#2252]) -> [SKIP][4] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_chamelium_audio@dp-audio.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_color@ctm-0-75:
>     - {shard-bmg}:        NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_color@ctm-0-75.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - {shard-bmg}:        [SKIP][6] ([Intel XE#2341]) -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_content_protection@content-type-change.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - {shard-bmg}:        [SKIP][8] ([Intel XE#2321]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - {shard-bmg}:        [INCOMPLETE][10] -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - {shard-bmg}:        [PASS][12] -> [SKIP][13] +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - {shard-bmg}:        [SKIP][14] ([Intel XE#2501]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][16] ([Intel XE#899]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - {shard-bmg}:        [TIMEOUT][18] ([Intel XE#1473]) -> [INCOMPLETE][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - {shard-bmg}:        [PASS][20] -> [INCOMPLETE][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138509v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1033])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#1701]) +1 other test fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#599])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1426]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#1426]) +3 other tests fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1407])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#316])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124] / [Intel XE#1201])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1467])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [FAIL][37] ([Intel XE#1874]) +4 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1124])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#619])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#367])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1399]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#306])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#306])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#306])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#373]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#307])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1413]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#323])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#323])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#701])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1135] / [Intel XE#1201])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-dg2-set2:     [PASS][63] -> [DMESG-WARN][64] ([Intel XE#877])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:
>     - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1195] / [Intel XE#2049])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][72] ([Intel XE#324]) +1 other test dmesg-fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1874]) +3 other tests fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#651]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#656]) +16 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +10 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [FAIL][78] ([Intel XE#1861]) +2 other tests fail
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1341])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_lease@page-flip-implicit-plane:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#2205]) +1 other test fail
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-3/igt@kms_lease@page-flip-implicit-plane.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-2/igt@kms_lease@page-flip-implicit-plane.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][86] ([Intel XE#1035] / [Intel XE#1195])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-adlp:         NOTRUN -> [WARN][87] ([Intel XE#2078]) +1 other test warn
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][88] ([Intel XE#324]) +3 other tests dmesg-warn
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#498]) +5 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#908])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#2029])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-primary-page-flip@edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][96] ([Intel XE#1649]) +1 other test fail
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@kms_psr@psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1149] / [Intel XE#1201])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#330])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][100] -> [FAIL][101] ([Intel XE#771] / [Intel XE#899])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][102] -> [FAIL][103] ([Intel XE#899])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#756])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#756])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#756])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1123] / [Intel XE#1201])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1126] / [Intel XE#1201])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_evict@evict-beng-small-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#261])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#688])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1392]) +3 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][118] ([Intel XE#1962])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#2723])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-3/igt@xe_oa@oa-exponents.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@oa-exponents@ccs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][121] ([Intel XE#2723])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_oa@short-reads:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#2541])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_oa@short-reads.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#1337])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][125] -> [ABORT][126] ([Intel XE#1358] / [Intel XE#1607])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-4/igt@xe_pm@s4-basic.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-2/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][127] -> [FAIL][128] ([Intel XE#958])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#944]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#944])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#944])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#1760])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][133] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][135] ([Intel XE#324]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][137] ([Intel XE#1426]) -> [PASS][138] +1 other test pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][139] ([Intel XE#1426]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][141] ([Intel XE#1659]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>     - {shard-bmg}:        [FAIL][143] ([Intel XE#2436]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][145] ([Intel XE#1874]) -> [PASS][146] +2 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_plane@pixel-format@pipe-b-plane-5:
>     - {shard-bmg}:        [DMESG-WARN][147] ([Intel XE#877]) -> [PASS][148] +9 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-5.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-5.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-WARN][149] ([Intel XE#324]) -> [PASS][150] +1 other test pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-3/igt@kms_plane@plane-position-hole.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-2/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][151] ([Intel XE#361]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][153] ([Intel XE#771] / [Intel XE#899]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][155] ([Intel XE#899]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][157] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
>     - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1195]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate:
>     - shard-lnl:          [INCOMPLETE][161] ([Intel XE#1169]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
> 
>   * igt@xe_module_load@unload:
>     - shard-lnl:          [DMESG-WARN][163] -> [PASS][164]
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-5/igt@xe_module_load@unload.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_module_load@unload.html
> 
>   * igt@xe_pm@d3hot-mocs:
>     - shard-dg2-set2:     [TIMEOUT][165] ([Intel XE#2574]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-463/igt@xe_pm@d3hot-mocs.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-433/igt@xe_pm@d3hot-mocs.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][167] ([Intel XE#1794]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-3/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [ABORT][169] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [DMESG-WARN][171] ([Intel XE#2280]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [FAIL][173] -> [PASS][174]
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-lnl:          [DMESG-WARN][175] ([Intel XE#2759]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#873]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#873])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][180] ([Intel XE#316]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][181] ([Intel XE#1231]) -> [DMESG-FAIL][182] ([Intel XE#324])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#324]) -> [FAIL][184] ([Intel XE#1231])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1124]) +7 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1124]) -> [SKIP][188] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][190] ([Intel XE#367]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#2191]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#2191])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][194] ([Intel XE#2191])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#367]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#787]) +62 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#787]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1252]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][208] ([Intel XE#1252])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#314]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#314])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#306]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#306])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][214] ([Intel XE#306])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#373]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][218] ([Intel XE#373]) +7 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][220] ([Intel XE#308]) +1 other test skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][222] ([Intel XE#323])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][224] ([Intel XE#307]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#455]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][228] ([Intel XE#1135])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_feature_discovery@psr2.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][230] ([Intel XE#651]) +22 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#651]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#653]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][236] ([Intel XE#653]) +21 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#658]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#658])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#2318]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][244] ([Intel XE#870])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][246] ([Intel XE#1129])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1489]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#1489])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][250] ([Intel XE#1489]) +3 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][252] ([Intel XE#1122])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][254] ([Intel XE#929]) +9 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#929]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][258] ([Intel XE#327])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][260] ([Intel XE#455]) +11 other tests skip
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][261] ([Intel XE#1729]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#362])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#1500])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][266] ([Intel XE#2168])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@kms_vrr@lobf.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@kms_vrr@lobf.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#756]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#756])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][270] ([Intel XE#1123])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][272] ([Intel XE#1126])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#288]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][276] ([Intel XE#288]) +18 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][278] ([Intel XE#2360]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#512]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#512])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][282] ([Intel XE#2541]) +4 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#2541]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][286] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][287] -> [ABORT][288] ([Intel XE#1794])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#944]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#944])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][292] ([Intel XE#944]) +1 other test skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2205
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2567]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2567
>   [Intel XE#2574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2690]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2690
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#2759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2759
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187 -> xe-pw-138509v2
> 
>   IGT_8013: 8013
>   xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187: 5c43f7fc693a421b6bd029a255d5c940c0072187
>   xe-pw-138509v2: 138509v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138509v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
