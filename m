Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22570C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 16:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66B10E05E;
	Fri,  5 Jan 2024 16:56:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FB610E05E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473792; x=1736009792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lGsAwqwoM28vCZaSAt+w9uxJiRoLwi6kw8vOroctPgk=;
 b=E0iHVAAARvKLFruRmzR8b/tZWCJv3RN372z/BqpLayKJLMwghyeNSGij
 V3gBZ2Ovzkmtuk0XVPRusTtQQdIYCGnamOr2FlWUPwGWUzyWgODP8bM8l
 TqhXjk9m5bYxsCmVO7ZJ56B4e2Sm4mEbgVlejhiq63/DA1ZvRqhTuzfNm
 UAC6NPq8JFzvJGejUL67fpy5y+YyzJwgPppN5aVDfRPyRJHuJcif9LHfA
 LT/uyoNTAdJW0rse5LKHmR2b9HI624eSKYlOcPC+wF1ODJbkcDeRJlQQh
 ZmrBlKLw8CDabgpHyNq14g2Ox9exNgBP90ovTE3KTlGzS8vp4KEXKGj21 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4907607"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4907607"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="22891850"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 08:56:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 08:56:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 08:56:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 08:56:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 08:56:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6XbPz/LKe5pCX0y9Adc89NAG60HlJpXZ9jcMprsegaPU7FQq00ZWTMNR19CTcrvalH878lgheRQhHeRxb9yn8xeOF2u0AH6YonI/H4PPxYfNxzTj80hHOdE9vRNrDIpq/C0NUbQnZ2ZVspjyqYUjKxdrVdEvWDyl+AyFbR7r9INIQq/lpWCALxvINwnxxDPwapSyEjHeJL51XlavvMFNRTBbdBPOU2UECafJZXDD5/I1HAHwB4MdBt5OtT8zyDjbm+Yq8nbQaNuHzq3HobdhGfn+XAHAtqa3vd4I7ImUB149ENTpZLIXFqJn3tn8YSAKyurBFblE7ag1wIv85D9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uvrMXCVxcnhXmIn9MrE0AidzFiC75x5T3kzV9sHpU4=;
 b=JzOl7aWfMRTrL6bWeQ+LzxxKZhqXVDtcqfk3o+cBk2MYkjpBpWXA2e9QhpV9Rt6gMiJTBqm7nsQQGOLGHsHjkE1FUWrXmKvktLwQ6UswzURv1zrmwxQayiZAWPe2tmE06jPYIQy508gjhDtOmDbsbYe07ofgkjiDQlO3H9uFInrAwvdr7zpvHQCOjxZQAHE+MPIoKhklFW96BXApmj38cUC/nFFOGCsu9tCTo1Y6mZi7+tte7vpQnxjVQ/hv86PVUIVQRC2QKJY07Fn6vgV06AjHR7xuoPEwbKODIX/H+2cyfUt1PZLT8ZJ454+MPf7zsegFPTaZ3cAOya4Qtn+7zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 16:56:28 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 16:56:28 +0000
Date: Fri, 5 Jan 2024 08:56:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2VzcyBm?= =?utf-8?Q?or?=
 drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support (rev4)
Message-ID: <20240105165625.GC1327160@mdroper-desk1.amr.corp.intel.com>
References: <20240104182615.21327-1-nirmoy.das@intel.com>
 <170440323642.22406.11653957018867912587@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170440323642.22406.11653957018867912587@5338d5abeb45>
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: b73a6aa4-540c-440e-f474-08dc0e0f4243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQuRgAP/jjQPSdhDPI+Hb9u0h+jg81TFmKYL6auBshtuDdZbA8gBHewqiB1M5/Eg5ikOu6pakF74aPadGk5z3ws9nTrgwABQzYRsYskval9aBzaOMjrPGqM81PVjJiBh0aPhW4xGK/nSBgr+HE4Ri3rZ8zoZbdza1M2wiXB84jLKVwdelCbEORNX5jYq6nDG0wGTR0Qt5mrxWEDaTA+1qZ5D2+5cFqrwMAnWjWUQQDxPqbTevSL0jvUssNAHf+L8BGpnr9ri839XfMbhPWDmOPmIJRASWBsTxLs8qEJs9E5piRP/qyUXZReo/NdAVnhc78i7KSOrHEF3bp9OglU1xRFeDXJqwZ3Fmn3YmtWT9cTTWqdr3Cs8pGcuRKN2fdRQYabgoi5UYE1iCCrw2ark6jf86oo+alRRZ9mASY6KYYFYoFS8y5XXghDNsPlDneCk8Yla7UWIoL4RIXpmzH5KfZXbmFKQnG3keJZv7C0EH92RP1ncu0s7jFm1g4h8Ek0FjWbkhdzCeYvLy1Os6RZ4S740BDg9+ZXS5i8+zgEMvnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(6506007)(6666004)(6486002)(478600001)(6512007)(966005)(38100700002)(82960400001)(86362001)(33656002)(2906002)(1076003)(41300700001)(5660300002)(107886003)(66946007)(6916009)(316002)(66556008)(66476007)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dVhNVP1OM+umib1+JhfeTWZmCAQ1QdWHw0AzTml8Lh3ZcgY8tARfGFH7XQKZ?=
 =?us-ascii?Q?9KdVcnpXgilPZBvVxz3iX6ueccpg4rJpisuM3ZlZF1AfnkjjYuAvbgIaz5C8?=
 =?us-ascii?Q?IIcuHFCXCNz7aPa5IPUUFy4BRT7dZ9rdnTX7XXxL9JSbwMyoxFEcPDDl8RdU?=
 =?us-ascii?Q?4drmAsNohfZYDv7Dm2ps+uMl8l+Cul5pS3QIq3RlSJ0wxrAFXQJGwsX6rIUa?=
 =?us-ascii?Q?SbxfozIiVdTNIsB40YzDJojy9c1D3eV/LnH+7oQ8CQtQUefNGdzlYBeowKWn?=
 =?us-ascii?Q?Z/Gy9W7WDLPJ0pCjkA5ZB/C2TGJFWH5T0U9xGQoYATYj6OzrjjHYQV02bkgj?=
 =?us-ascii?Q?yV2Bh5b9/f6Zucg0ekCYfCxjl3JA7zQx/c6fa3BZGI1PPGeJ/lemmzuh0AUV?=
 =?us-ascii?Q?55lI562n7akJ2vKjy0n1x/nROTHgoLIsy2KGzTArdIxutQw6T5/vT/lJe8Zv?=
 =?us-ascii?Q?SahbV84X0e9SWJH3tV/xfadGlAqq33+pX65iwQmhaNd61jb+OXUQoPKWFcBc?=
 =?us-ascii?Q?yuLtmrSRdXJARZxZS17GU6U/vVPEM4l8hhkVXPV6zNYerKXTXlNpWx+n5JtL?=
 =?us-ascii?Q?AI6JRvDl8p0K9nsd/5GZb40CIMp91Y6DEaMo+WP0IY3MMkEl9aoW5y2k8SGE?=
 =?us-ascii?Q?SSro4n6bcjlN0BQNpE4X6WzRhBgpXCmdxh2tzptKXnyeqAQOOStyfrfSrOgi?=
 =?us-ascii?Q?jUf2n1hgZBqyQI2v9v06lGryIpP2oh9x/PDDWkQI+GW9uNRTBwjAI8EW1m6U?=
 =?us-ascii?Q?6slrOo2AspVHDW7VE6nEtmkSgj62Shp2+mLCvYUGoFJYYzuiFaq09XnEE5Je?=
 =?us-ascii?Q?ixs5p7Fy/ApJ6WfBLO+7xBu7POOnPgi6clcADnfiFUDOpbOfc8zuO8XdRkGW?=
 =?us-ascii?Q?u605ofh93xGVLRESfUCN2UxEbnAOZLC86awYqHIDKu1Tfx+z1uuJ7INgsMO7?=
 =?us-ascii?Q?NTPO7uP+uwn/Cbn20pbEakLfrj1AYsmk5iFd1A2vUeDBW5eFbdlJnDyIVY2G?=
 =?us-ascii?Q?bB1u+Lg9lpeTd9PpPp1LODCyeAqBo1tTBBAXlAol4aOnomIcMH6VkyKz2KH5?=
 =?us-ascii?Q?vHYRi/VDkP0RJx4a1UMwtDmXkEJ4+9xrfD4fmNRNg430B9+Mpx8IPojA5zoI?=
 =?us-ascii?Q?R76ZjRPgKU0H3mEj0nAfq2P7icch/DU8Pk3X8PERwXJU+vglo0mJJVzWzCK8?=
 =?us-ascii?Q?lKvlE13fzxzO9fzoqZhhPS+WRSCtiE9jyR0MZzPgtT2P4wIBn+t7ptERqvwM?=
 =?us-ascii?Q?3nV52A5dGmxwI6fmfQMmnPSk/vJ7EO3lg+ZnE4IfG85QItAEYc9xEdFE3Q5b?=
 =?us-ascii?Q?NOlXRWBiL9YLKeb7v0HTr1aXjWLEGztI9SVTJ95VycGiXPLr+k5c9En0Ik5Z?=
 =?us-ascii?Q?hDRpgOxcKgTjobCd11n778RoR9k4ctFbmYv7gMpkp2lB6+Wr9ybE0XpPREyI?=
 =?us-ascii?Q?W7cQHKsFK5/lqQuFfxrwl82riVvepTpzBAkjbh7T1K4eipVr4TOSNiZbfWOw?=
 =?us-ascii?Q?dzxKWWWKnRoOBnI+OnmdGuKLC1dCIXQDZPpI+nvuU3HSRo7MUx+6LHb+dZ0P?=
 =?us-ascii?Q?+t8j0WruWMXq+IN2nCr8V/X+U22u9MLtzFqs1m//0CqwBcOQx0Xbp9WD01XS?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b73a6aa4-540c-440e-f474-08dc0e0f4243
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 16:56:28.0099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EX0wkvcUEyBNr7MA8UuIRioz9vBXqLPTwuFg4jF4jn1zow850XVQnJZSfWxzOHf8h+cc+7UkKCoCgZ/GoHmP1N8e/h14Zj/Bf1q+VD+wud0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 09:20:36PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support (rev4)
> URL   : https://patchwork.freedesktop.org/series/128040/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a_BAT -> xe-pw-128040v4_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128040v4_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#1033]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128040v4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_create@create-execqueues-leak:
>     - bat-atsm-2:         [FAIL][3] ([Intel XE#524]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128040v4/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
> 
>   * igt@xe_create@create-execqueues-noleak:
>     - bat-adlp-7:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128040v4/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7651 -> IGT_7656
>   * Linux: xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a -> xe-pw-128040v4
> 
>   IGT_7651: 02fa4cf8bcbb15f1641e862fa83e2182c6f73a63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7656: 149297384db8cab03928c12b37ae1bb61089bdad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a
>   xe-pw-128040v4: 128040v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128040v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
