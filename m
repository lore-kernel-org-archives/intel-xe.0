Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6666C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 11:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EA810EFDC;
	Wed, 23 Sep 2026 11:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8e7fjpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D5010EFDA;
 Wed, 23 Sep 2026 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790162600; x=1821698600;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=3F18BxiMogoJaNCU9yZykreS64bNPm+Q9OSeiGPR2Hk=;
 b=X8e7fjpIXy3a4slNk/ELswrYo7eofnHETviJ+cb2cNPmOFdHySHNrjjr
 ynAErw9NnqBl8gjx1yXHkii5Y4/QMYAaWlitHG66Wf98wKgSFF+q55qTX
 wnBOAdeotQaAre6P8j8HdcUi4zGSI64zA48oNcn2GbI4RdFosQJM2HU2V
 t9i9pALNM8CM08yh4qKQvNVBr2mAXWHnqzwwD2ALi8T/OVL8PUSjNDfwv
 g9d8GWqR6lS0vEXdclY0o164/wTp20uQ98UA3TuKflgtP8STZ/wy10+H3
 ayeylkfnxwn8cAI2rm+1hqCLw8mt21hZWhJZ5YL1FtqKDVc580Rrriseb A==;
X-CSE-ConnectionGUID: KUMpX2cTQpudHgekUaGKCA==
X-CSE-MsgGUID: UU0BHwUURfO3Vc3ItNTNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78401467"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="78401467"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:23:19 -0700
X-CSE-ConnectionGUID: IN6AR5k2Rm+K/rOfUPHfbQ==
X-CSE-MsgGUID: PCRDojDnR3yZWG7rMXbW7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273043848"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:23:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 04:23:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 04:23:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 04:23:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbJyVrl2dVSOi4KjOKKMwkiDZxqv3IrdLoAaoeo/Ilm4ydowgO+uzFIVmrezGDvEUlFpiPq/CW+qnwuPffxptqpUgjJd7g6AT6bt5Nx1yFMhQSfWy3Nf9Af2J4NNTbbCyHqXTkq33MXTexRSTKBdmkHiJNKldgZaKDUesT45QWnkxDeeAqfpwOE/bg6aiFnD3MkpSrN2Tgfqn/5wKnO4JyH6N8DejKuSibAbzgJ9uMGZBfwBOS89clwTYr3j9EEf/XJYR6VUoq/UC53y/cWWs+0H6wlHNdaAgZEP2B74uZAn/izSUuXDVJVaEWXVPrOnw44zakUBQ6C4FTqXhNxP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhC3pATqyPojQOF2ItUpWXjVdYP+fqyJeWR1wNgq0Dc=;
 b=CkaRNzqkwHvdQ+QToaqWQLRGeBV7+ikNiZ18z3WFFVWPv5dG82c16CaefK1LF2slndJRMFw8dj4vN/QMe28OExtryBrbZg5Kzeebt3+peRuBPb95cKEILcgxNJLMcuHw0xHbeSkSSZaCRoJVawe3qbXPUgFYPVkYrKqiAxROgRWGqoi6vhb4vztRue6o8/14BEm38q7PvQYPQND9jT39UvthyL19QioLFuVplu60mk19KnTLFlc9WrhbI/FyV4bcP4c51N7D8sIoK8R/ePojtjY1YKXy1tOZeu7pJ3cIqvUMsElKHcynnaI8Y+fnzUS2X893tpl7F1nsjOfFUouO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:23:16 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:23:16 +0000
Date: Wed, 23 Sep 2026 14:23:11 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/{i915,xe}: add/move intel_opregion_suspend() to
 intel_display_driver_shutdown()
Message-ID: <arO2nxkyOK5XzBJw@ideak-desk.lan>
References: <cover.1790089118.git.jani.nikula@intel.com>
 <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3PEPF0001DC1B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::275) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: aaab535f-aca1-4ee1-70af-08df19651022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: i4/BwiK5KnInSEsO9vhD5f3Ym+R4wLjAvkBWuyzRu08UfH+1XcPOz0AFyLSdqZ2uwwP+Tg74Zu64/Rb/znnwfUjY1I8I5HRlrN8yJ1Sr6/BhjjZvGfsUqgW7ceU/wShk6uckPCtTf5EEHgOO/hNSkF+PHLESKu7hRP7U9qzojX1OJ5mbEoA+Tjwsx/HkNyTakBZVfRJIxzQSu7Xm1Db1edRHz3Kv5YeMFPIBoP2cKXclOpWYl0X8PBDsWGuXJ3KhvHCEYSOAAEnMzAHE+1HkyyTLSKOYyo8ToPOZZ19MAai01Ydmg2mxajo6q+bz9Zj/ugbsykZgfmxMRf0WRWMDpPnAzODOpx9RhMi9nuv6ufG84kUI8P2uKyNlrERTrCP8L3sJiY7WnxFVN9RpNh+2cKFAxuwzdun9TKo5Wg54Gd2S47huJnVDPgu9g6MYFcGR1II6l5Kwg8TftE0XNs3bwB6VbZeaFCnzUT4HB4dPhAcydht6Q5OZKEO5RNXA5OkP+olhidbnvSeClwSdJ0Kgxr1MuEg0tnmfkf21h833smYb+MPCpArBvLL+nzhtxlNGyRupoMAw178upVXlD8V6yg7hoGda6uJbjuyLb5oVrh0Dn+295T+cGcqc8juSI38Tjy8zYTV+0+MBJGFcUp5YPwynaG1kjBgsGc/115WVYRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aUc0wZWN53m2rGuyj1DBTc8rcPlfIGWeukXsM9rWTf+VNnwNt9Uz6BpBqQGE?=
 =?us-ascii?Q?s8LTw7+tEj4dotE4aLzmWbdbhXP1AmqECn3wpULqlj5gcuS+L2vnJ7UmDGX+?=
 =?us-ascii?Q?7BOqjWhXViWUuIA4xnMmFedVgsfVgtESXeYCAunQkid9KyTE2w59tQcoitfA?=
 =?us-ascii?Q?QyHNL2O3yYZQ6uKggM0bb0ip45rDgm8vcmihdhxhy+oVRoaBWKhXTCT1+JbV?=
 =?us-ascii?Q?Upxrje2mdH7PhaXup4QNvU/HObnxfssFP0zRO5dxCjERWatHrddHRzZaCf1k?=
 =?us-ascii?Q?aVWUqw5o9VuS2vt8TWp+UvRg4WMpH6x3a06P3dZspgJdjKzNS5xLa+4XvFOJ?=
 =?us-ascii?Q?cdGTZjLlHV9QjJ8j7ntxGS8sWdDgfxxzwd5cmDxfNsvSTfDQC4IrLH9HiRBH?=
 =?us-ascii?Q?8VTuZzHry8QjrjK4MLjciCFOg6NEUt+lU9rpmIg78PBe1UEA3QdjWxpCGVuL?=
 =?us-ascii?Q?p+EWrY7AyX7Rj8Bj3MkROLAOPKXislXoMVa7jBh1xBWpo+JA5L5SQfAaoCZv?=
 =?us-ascii?Q?GFSKylf77pRzxhhi3/j3QYG/71/mZEFb2Qo4aISiv9QvTOmCSZPXLkqXv6R3?=
 =?us-ascii?Q?SKEa1PcXddmCBKHhuArFDvfxYhBKgI3e0xpWkaCK5Wop3vvMp26+v9xV7oYJ?=
 =?us-ascii?Q?df/bzNzfWYUghJdUBTv8pKrtN3wxfqe/GH8Bh6PhqiyGH57IPXu1rzZd9N9Z?=
 =?us-ascii?Q?y6Yj4A1sqVBDbImBSBCLNgyLsZ7wHA8KClBJgI3tqA881Y4ElEXPWYuHI30g?=
 =?us-ascii?Q?z7T1MW3yQ1Ul2hOWsEmfioW/En/G5KOmNdX865HJZnyCukQ6tYJiulP1TfHO?=
 =?us-ascii?Q?3lQSLN6r3pcvAf/fRK8kSpGfytlGw+6WAuyNhre/ZA+NS+xzWS6OgwPMmXcU?=
 =?us-ascii?Q?HsJ9vD1Ubln0GXt7eS9/QcmoYOdaVXkdMotp0HEJDwqng+RGhCboOiHcBmrR?=
 =?us-ascii?Q?xaVFjkmRH3shp3wKuG5k94TDKjgGqJOPeCMnIL1Q4wJUyl0ka1f0eI/t9qER?=
 =?us-ascii?Q?XaG2Cl7Kq3xAq/Axkmk4bClGItR1aDn4JAat3mD7oNvTvTvhtuJgEEp3Pt+P?=
 =?us-ascii?Q?nFQuKZquHgpZ+W7VYK6Kvi21WuqfkpGpEYcKYkuGWLXPG1pT0Tqo24FwZY6V?=
 =?us-ascii?Q?8LlHIm0UMdx+EhyiorOOibn8kEMecrW9rYaNW7UAjWa4+mReaCPYspWP0WHm?=
 =?us-ascii?Q?yCtnR9dmKXOYONkQF0C5+Fbh1D/SFE0rtVeSuWQ7Q8DJTGOl1yKN7r7FUBen?=
 =?us-ascii?Q?BqPvW1e7f9PBD7aJwQQ7pQ4b5qvTrscl+0DkffTwpIKISYTBwBL6uNYQ45XH?=
 =?us-ascii?Q?pOXSGlRTPta5xiAnoMN29xnDSUG9KALkbrJ6ysDcWRcqHD3cR7XVmI1e7APM?=
 =?us-ascii?Q?NJoH2PPBqezxAkzG+CdJ3qZBbLRbK/mImnDJLAoxF7wOD8gnRQ8mn+ti2ysU?=
 =?us-ascii?Q?ASRyhEkljFiJQT3SPL3gP23hk1ToChZwUUMoPsroPijcacCUpYUW6oVewAst?=
 =?us-ascii?Q?4f3Y2/VlzJLa/+XQT1oS8HAQiXE02mroijSHs5vvECBJWeANlZm9udfHXNux?=
 =?us-ascii?Q?B4cztBoqNu4/obFXlKlr3BTcoF+zsZyGZH4C6Of20al2XAOyfqMr2+gBXco4?=
 =?us-ascii?Q?ffGkhnG1+pq1BaJEbm46Ncs/ZmaoWpfHRIjz2OjpDM7SmIF+kngOH63Qvk2a?=
 =?us-ascii?Q?GzfcBe3U2NlTWf1Nh+WNaF5W5XVH8Qfd+d8wlge67m8Lbk4p5Ehx4cT1u5Bt?=
 =?us-ascii?Q?F5bDTaWKBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: qDYHyapxMOmuC6tXGCfx6mtEpR8YJ7nwuAxYUbBbpIfkxTknP8z5Zhx7DRle4ufOghPxqcfI8gBcU9U1io5KyUjyh95Dot/adOXKSp2m4o2D5SL9oWvA9R0a6THz/ZX/Tyw349c9/zIKyjRu/R2Q3NeHGghtfhewOUpFfsEyqtUtX/CiO52Gwf6Q+hR49kC1w6d6G8bxiMUnfl17444X0q/CiOYWfd64F4dSfW3nziE9DA7FdARX2HHZxwOZz/cxKM2ngaKGyO9ZBAItx0//y79fBQZ4c+sRGsYw0AkeD00MPJxRZyKGXLbcVLFNrm97U/gCnr6wZYFGT8YW8ntt0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: aaab535f-aca1-4ee1-70af-08df19651022
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:23:16.4646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohSQOCutEWF3hZ1dcllDCZGCCzDsQXq9rPBn7cAF0xDDdzww6NuKB+9+H5q3JR96xw9rh/Yjk+yPmP9Qv/WpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2026 at 06:00:51PM +0300, Jani Nikula wrote:
> Add intel_opregion_suspend() to intel_display_driver_shutdown(). For xe,
> there's no change, but for i915, this starts calling
> intel_opregion_suspend() on shutdown.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/xe/display/xe_display.c             | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index abab457bce3a..d452506ecbc4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -704,6 +704,8 @@ void intel_display_driver_shutdown(struct intel_display *display)
>  	__intel_display_driver_pm_suspend(display, true);
>  
>  	intel_encoder_shutdown_all(display);
> +
> +	intel_opregion_suspend(display, PCI_D3cold);

Could it be moved to intel_display_driver_shutdown_late() instead to
make it symmetric with suspend and to call it after IRQs are disabled
already?

>  }
>  
>  void intel_display_driver_shutdown_late(struct intel_display *display)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index b013ec00b75d..1e37b1c29bb1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -176,8 +176,6 @@ void xe_display_shutdown(struct xe_device *xe)
>  		return;
>  
>  	intel_display_driver_shutdown(display);
> -
> -	intel_opregion_suspend(display, PCI_D3cold);
>  }
>  
>  void xe_display_shutdown_late(struct xe_device *xe)
> -- 
> 2.47.3
> 
