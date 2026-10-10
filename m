Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951CBCA9EBB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 01:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D4010E0DB;
	Sat, 10 Oct 2026 01:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSoafMgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDE210E0DB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791595512; x=1823131512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xJhfidv1VELAIjskBJzAVLVnEkScOKj3qApqsuk6Ums=;
 b=bSoafMgi8waKH3wm3/xl02ena/eqTxoctNR9BF9EvVSVNT1xL3WtkdzA
 +BJuYMr63TJ+TX+lZbETdJv3vRbq8W4tinMvP85h755ljbBN3F5hRtLhZ
 EPoyFxQLjhdypSp1095IkQ5KS5Y48WlVADBN2XK1i/SJvoiEeTRWupjJH
 QFJwJ75Dr2IWTH2riQ/CZkuqyj92mfDgDaVDkPFqCWFPPEn0CNnBsHtHX
 UCsJnLQSC9jJqsubPEiDQK6oCEvho71YVkXZiEdMhjLZCtb3tN76GZw7U
 Lt3Qh+ua56XTAjq0ze2/hcFolrFGwA8xZiWCNUH8TIHvy+8wYVyFTFvTA A==;
X-CSE-ConnectionGUID: GunR6BPlRdK9VspQs2c/wQ==
X-CSE-MsgGUID: sTCP0BiNQCeD0MjALF+DXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="403306"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="403306"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:25:12 -0700
X-CSE-ConnectionGUID: zWOHO9IRTDSLER+xyRxyNw==
X-CSE-MsgGUID: 9O/5fiJmSaKT8ImBySRB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="899243"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:25:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:25:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 18:25:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIEvwD859BbXg+Qdggjc4juenqp/E845kj0gZns7DuEhqN3ASSsq2bEvyEkbnccBHhv24DIBzeJuFlXeUI803uai4nWrws+ROxZt3wmQqlg+hDKjHIOXmOOC46CP4vMkpwJgpa5R+hWq31PymrjyK04yDqYxpIq3T3fuf3pDy1rcG7Neav1apctDwY2NhNKVDahvT5r5+w+zakthBtY1VM99V4tLnaQ5ljBHqOhkZ+EqV/zwOcWuF9Ubhg8nhiMcWRpyc0Vo6sLX8JjRXZJ2UcLoziC8RU/vK7FCdBPcd1n4sqQQ1iXNHIo9ldUFrrRLFG4h3V7iANBhy80QQy+DqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXekuIUBH1omQP6c5bsKBM9fBAas2ixrotIrNSoekEo=;
 b=QNUfFaQlsyOYp5gOsjzkWCOC1m5zQBoCcfyPqiy42deGoQX1PttUjsec23PhJfM+Jxj3Ws7+r4hZbgjUeNNPQ/aYnnsGRr2ESTdsbLu9NQDhwUvHg5N/nyw7rBRYg65tHHObaiVA4NdxWzDXrGrYG1Y6ZU8+Z4Ea0vzRgN6r9GDPZZwRtybTC7BIfaiqfCxUTlOB0SNSeIVPA7xQgyM8zsTcUA2QDfi9eHrBrRvJe/h8GTSldSh0g6AySmesUE60KkZGhdAFsZB+18ncFW4LWdI5MlJrftSW4QgNDmLYuYkmF7LuG4TSJ2OCdiWFmz5pz/k8/7qn+AVUTj9KE7eWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.35; Sat, 10 Oct
 2026 01:25:04 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 01:25:04 +0000
Date: Fri, 9 Oct 2026 21:24:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
Message-ID: <asmT4vtoo6AxIak6@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-6-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907083541.2194747-6-raag.jadav@intel.com>
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 58735c0b-75d9-4422-fed8-08df266d4f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|261009223027099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: oSFVft0gvm2aQNibfFLWZh/K6MxhjuMJ3w7fAfPPQXO1oC41IX9lVFhKhlOl5YJec1Cf0Ec7B3dSqCX6K/+wh5UZzASidD+kVaT3L+Je0HYzcnRBvzx4Vim3RKHsim0Tp1QblF0GGcewfbUHi9A16+Yua+nznXqGun/nBxm+uZdS6untSEPbOlEqWYqNIQk8KRksK+R1zLGvY8yK5vW9RqS+qv1iucoDetrxl+BzGlH6QeNv1uwiFvvsY2jF/Yg6bkKnoBNWu2TVwwJ5i+Lin7qNMimyferV6xbYdsZNb8DYMe9/RP8TH5JXq8rssORu+3TVy1rRCcyTsjMSusfgbB1B9hMamXJCcflDzKpkFDi+P74YjH2SOgN/xc0TDS82QCeK+llmBlpRq4J3RU7/N6dq2o2E2+O78IA9SsXMlAE0o+EXNhx3dcrt4IP4cXOshHZu3oyyjAdDBhyP27kgEzDyDHMy6gMY+rId42yiITu981rmixkUiTQzBsL8EQyq6UdjmVwXMqoRE2wNHbLZDi40P+d2OzVZJoLeG5v5gKfsdL3pMxgJUmE8Y3ovtm73LCS+T+usuXpFpAnw3J0W/5f3xj60npLyXDJpf3I8d1H32TBVWGZrxYjMMcaIQt61zDf7IgbpOo9Ks1agQs7NJ/dkNv5QK4N9fW4+p8X3KOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwPj5XgBHGp87P3ldnW4efnJnD+stgtEh1ozc/sWXlj2Yw4WMCaNYobEAZ73?=
 =?us-ascii?Q?wFGJAaKaVre9VssHvALp4CeKTIGzFAubgilFhBXxkMdBJ7ugqPq6XwpxQANE?=
 =?us-ascii?Q?bVI2Or+wl4Bsdv5CvmgbVbI0omJrdq1fk6iMWgKIM6OqoqM2SXgzxiPc/EWm?=
 =?us-ascii?Q?0moXpjkYxZeDiEsVmQXMm/nDJ5aU9crEb7EEamBxiMLYLxu3fU3aT32Ig9BD?=
 =?us-ascii?Q?E3GFT6wt/BcBodG9YO/xg+ITGiw80OtWXCzVLGvsujEgSbDZcMLgCpdUp++s?=
 =?us-ascii?Q?DMpGAocCgFlSEiVkR0R+0/q6Y2NqOX/ysLEkjd55nN0v2qF8e/RDUj+b23pb?=
 =?us-ascii?Q?yoMaNTRl1zBHPsToFtuOzczqvd67lgtXuyCcPDehZmPdN17F7pNY5RIVjhJx?=
 =?us-ascii?Q?ATzEKoo1XoYYLmRcdaRPm60aDbhniuPS4TbflphSxM0PZzm/JuIQea4Y8Xh6?=
 =?us-ascii?Q?ds9xMDoWifuJQia/x7NbV3xh7wushYjGZUeFNngrWcMDC800yNHb/xyg2aPA?=
 =?us-ascii?Q?xySvow+jB+xSWBgPr2sRNAUhycC8JitG447xBpY8HxIYycr/3e4IZBr7Xv9w?=
 =?us-ascii?Q?X4rPYQHK6qO9luZHCTjJ5mH+QiqU3DQnFzI3sTu6f/m2Zi44BYcChPxxGrEL?=
 =?us-ascii?Q?qEVk8LRIVd0j0e3JJCgqKr5DI9H1x7xjPBmmO48PHTEcvZyKuvQYTqbssrLG?=
 =?us-ascii?Q?NrGX6FCwG2wS4C1yokVv9oFUYBiZivf/kOLlPjrTMXE29nDkaeJAjjBozfcO?=
 =?us-ascii?Q?kgQ6fGGL/KqawuAqlG9nVE4elwy87hwMboGDWhgzRgjGvG07EO75DNlG+sRP?=
 =?us-ascii?Q?eDizVBFnRM/Q+lt53ao10wwd+4U637BO6bwmLEKcAMvc7BwLzLfaR+D/PnOg?=
 =?us-ascii?Q?ypTCWMOc0SKDlpTTQkxN6MqFNtwVmEeK8GTcpoh0UPisovvfxThHB7W87YOS?=
 =?us-ascii?Q?RaYXze6dUw3xFKjNPsVPe7FbIDsa8OBdJDhQ0Evi1983ICJk6f0aUdaCdvra?=
 =?us-ascii?Q?t5zKB5N/DheJdgV9Ib7qxDAxMVnQBgymNWUpbMVjW70nMrKs81gDnyiPX0sj?=
 =?us-ascii?Q?vsj5Z19tRLilGlFSjPX4bsYYUmBnALTXvHZ/3JJqhkph5/1oGure9xz2ce3h?=
 =?us-ascii?Q?B1rlTj3ghaKS0kw6VopwH2Yb9IoRCAVr0ODbuW1jCJ5nyBIt17fzuGArH3p/?=
 =?us-ascii?Q?tBuLL/+qxKKvFAelIfgXaN0ek/vLmYffeqx/wzFvufM1A6qiKBMpDcjBLE4b?=
 =?us-ascii?Q?5CxqtTAttT8usUBJHSoohz9ewXNVDLsirvIXgjlH5/aV/q8TnlnPmV8QCFgx?=
 =?us-ascii?Q?VcOs9f1+6K5puTU6mAaA168tEIRuqV6/51fxqO7WevSchvwLyYZQaOKg6fPo?=
 =?us-ascii?Q?q+E3G+kJbIq2Zntqk3LgYQ2HCOjwOn7GguK6BFbQ/9mjzBMtwsBkXdhdpBWO?=
 =?us-ascii?Q?SypC0Q1/xXPwIf0NlrfAM4iYJFW+UP3vL44sBiHYRmvydyXu2SGxJTrkKPov?=
 =?us-ascii?Q?CDXSu2gRQ4VgQyrqtM7XX/hpKTqWKn0/v+m/opB/mvsJEWzD3N2ooUwXdE9t?=
 =?us-ascii?Q?7TfbCXVBCi3Q+VG0M4ixLOj1e5TfUYm7BunulduI+nqmV4uQWT+SDgL6CFrD?=
 =?us-ascii?Q?cE2bkMBJVcuakPEXurphRT02Er052qH4dFXIVgl7nsAC7nPSDr5aWjoGR4QU?=
 =?us-ascii?Q?8TAZBtIh7gupWP3IVDRoXr24iMEGAe42VELjNJ8IIN9NljCOiaBZLLF7sb76?=
 =?us-ascii?Q?fqL6kRa3I71zN16oay5SOdauTJ/A1lM=3D?=
X-Exchange-RoutingPolicyChecked: rJjA1c5TgFh0aJWBgYymubZ6j2Ofx/WwPlde5LIj2nmPPjzgmBAF6Jb4ud2kwHBEqERCPM2/UCLx3Ait5um8UWkACwbDWCe4HsW+2EUFD1jef/Cbx5DH1PVaMY1J6IKznToU0f22XtiFyAqJqqjk6z2gCyS09DNWyhm7nJHjATKUDdONxkKyP3LJqrTfzmZuCyMgJjsecBDftzv3NazpyPmMNGNULGOlR12vR6Q63KEYg7b3IOg3yujfv+s2mQJAnU12H0N3iqF/OxxBW7LxcLryQmjD3JeH1oBjsAg72+uK7q2CEZ534Y66KZvrIt+OiLSbal7HTkzaGrW+Yzt5PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 58735c0b-75d9-4422-fed8-08df266d4f53
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 01:25:03.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SeHttjYXT91WKcrM7IR+TUH+8HDTG/5xFGQgacfOvd8F/uo+v73xpCairEXJHPLennTFJpRl77SavpKx85YHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

On Mon, Sep 07, 2026 at 02:04:40PM +0530, Raag Jadav wrote:
> With xe_wedge_fini() now moved to xe_wedge and registered as part of
> xe_device_probe_early(), it is safe to move xe_ras_process_errors() back
> to xe_ras where it belongs. This essentially reverts commit 20bc4883c7c0
> ("drm/xe/ras: Fix boot-time ras error processing") which was added to
> prevent PM reference leak in case of early wedging in probe sequence.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 7 -------
>  drivers/gpu/drm/xe/xe_ras.c    | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 12279ed27629..8b0ea8a48d57 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1148,13 +1148,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> -	/*
> -	 * Process and log any errors detected by hardware. Possible results can
> -	 * include declaring the device as wedged, which must be done only after
> -	 * xe_wedge_fini() is registered.
> -	 */
> -	xe_ras_process_errors(xe);
> -
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2e8eb8856f97..abf4800ff1e3 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -933,6 +933,13 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>  
> +	/*
> +	 * During probe, process and log any errors detected by firmware while the driver was not
> +	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
> +	 * causing the driver to enter survivability mode.
> +	 */
> +	xe_ras_process_errors(xe);
> +
>  	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> -- 
> 2.43.0
> 
