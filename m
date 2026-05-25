Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13503CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47F310E3B7;
	Mon, 25 May 2026 18:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V51amJ4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0010E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779734799; x=1811270799;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S8HoKuuQd/nqZ/kwIdmzDsGXF9NaCmYeJwV3F2cs3I4=;
 b=V51amJ4BRrJXTIeQVOhV8X/0cXoFP3JlhufAxVqZkhEKyty5zDvy7ZuY
 8nWL9RQ28zwlSJ3fS7Vd9f7tiz4JCcqHKnCLH9bLq7V9lv6bR9jPfBUR/
 Q05duBi6LXGl0+LMbNMouOyY2+rSTSc/rlAjD/gb8SXkrmB0E5NlayGVr
 1weDXTqOO5o/4nlFuCs/DvMuhhsj+PbtLOfKVffEVlaXBOFH1G2YCxUa7
 vov0yywMXoPbLW7cbxuIp0/o6S+oWcqu56XXuo5sfcn9iPLkYF4FfBvfO
 +48Jh0ssEbxQ12VtwPUkKZRFZYqiJdeb9nxqSjWSwRNmaxnJn2xGiRrOy Q==;
X-CSE-ConnectionGUID: KLHNSmFnSY+NTR34TNBdWA==
X-CSE-MsgGUID: UgsXyjmXRlmlsWLLBYSQmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106016218"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="106016218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:46:38 -0700
X-CSE-ConnectionGUID: pKj9COiRQ96UKMG4wlEURA==
X-CSE-MsgGUID: KjIb1Q1QSk2+G18rKWmdbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="241530460"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:46:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:46:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:46:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCzI9SsxFM/dJ5ueLktfDg71qyaBhqDK0r1CaR4jkkkTUvK2SCPGeL2cmwDQdLY7bYWz+tUrosA0SXoArPeZqInPFGiC6MyI4APR3BESayA1Nwu9Y8PU9fDk72APelpCNyBdUaBAASFrZcMKqqUEiotcAVMsG2OS7bLU2YjWB0GsvgoXVqvowiGCMn7ufl4ESCbxGNGNmmpzLztByq//sBRlP3FrVodOdq7oy82ODPWfRGaPxOTfXB+TVrTJNxXH4OZ+RbvvoQuDEdJVccSmf37g7pdFra9296jkinDg9DAO6kac/ES5NUBP9bra0OtUkyqtHr/KvpMtNnONJYGWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMMoVOf5mYeiuis8UZfEnD52lCG25Xd5Rsyj9zkwd8M=;
 b=CLliS77QIibvuBbEElAr8HAQr9f4bAXYH+HdQAYkvu+BqVxF8j6HgVeIKRSryn1OpChqB7rWUmRezzJvkD+qPcIxU6L0twtD0B+lIPwXi6XSgEj2u11M0OgLnMMMXgZWFNfNfzHZMiYCOoDgrzV1aG2g2ZZkzhGg7giEybTJ/cUgg8du9Wevb+U3ycatNYEmWMrLS7aufqC+sD9VWZDuTpFTJv5gaGqSYsT893boSmHmHpxbPoh1B5K2ZW/Yd7wWda13msDSxE67CvhGdaTb2oiWCYiZIJPG5ClYpCl+uYY3+ewA6JkKe4kd/QSpbvrDk1bf+SHGugfctknSEO/lPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:46:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:46:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Move xe->info.force_execlist initialization
In-Reply-To: <20260525160529.15890-3-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-3-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 15:46:31 -0300
Message-ID: <875x4biayg.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: ab29e34a-d596-4e34-ad7b-08deba8df21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OyWq/ImT0xXab3hoOZ3/3McENXJbMmko/vLIp0TUO3WhjE8xjyGW4s0hBrFwwkPKLzfoTFgkftfdSS7wmblzJYYRibW1vfUj7QCgZahkb8MQEK1joRCeC7lXE2qfKMQ2ZDRBba/mtmgdYytWLTfmUdR+oIkGljTAQ1VkIT7A9sTnSVFlv4QXAGPxavjSA4OxiirqIubnnpuQzQfycZ+/cohXW71Ig014gxWHBXcq3xAMYVHEKzfPyM/HK9XCZ+Kf4prbTR5p2TaPWMlnEnaTiUtnUv34dzVfzKPshTa9N+TG1ZCyex3hmT5m8kXh8/o0lfaRuUMLSvyfzNZIxVdMWVJsOlHrD4OYRC5woMCLPxPEO8cYCdtDbgVvVSLurzUIS6A6oQSTuSDi/k7CFrUWyUlaL0HvT3c9d2VTKCG/K59xpWyj4eG4ZV6cQbUu2rBOP8/ZgBDX2pb0zyBbsTpC2+B6XzZIg/ub+1TCyBP4eHKD90YWoWxwS2pYj3fL6V+p1JyWF7LHUVikvX89EhFJIOKl42PR41NiQS0cIsqaDSkX1w9QHgt09BLNvORJZZ2X+KHVlvgLX1OQ5TldJZCGoThqV3K++TnZvdiZVBBatSXwxrfVx4s7Ay0lqYzF1x5Ldz29vL6S+XQMRg8tawkP/1GIs2JtCy0h2eSIrifJoF82htwisEIni6A4ZIWAdsKy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwgOp98p+aasl7QYTedyRgb0CRiAr/WxYttKa+LA/nmYIrc0YSN+FCNIOU0U?=
 =?us-ascii?Q?z266Mh335e3tabpVT2hUClbGtVxNj6dCUYc5Szc/xAz/I14tAaDH/wpOEsQE?=
 =?us-ascii?Q?zel/LfVHkrK0DCXNIsS2X8Ax+l7IQ8YnrgLcNgX0W0u4/aiHJi5+NmqTvyBn?=
 =?us-ascii?Q?5sEJ8TRp2P/FOKGZD2jkHTNcYoEzP6IcInQaxu/AfFtKPt28PkEJE9+kowDq?=
 =?us-ascii?Q?pgM7te7BUwdbQYvm7yOha9UVbmCsS6fTe6JCeZGD1yXi5P2ZcegUvjfDd1Ex?=
 =?us-ascii?Q?G8smAe2pDXm2knw9XkBr9HnEhMk9r/Tsj2ujZFXZtXe/q5m8GBUPezAc8vQj?=
 =?us-ascii?Q?0BxuENMo4sTsOrI3yeIGcgRnG+TQn3nIwPrn6fT2AP1qswIifwKQbteMWm2r?=
 =?us-ascii?Q?rl8yZregdcVs9VdGWtLW0Or6nzkzFrBTE31UF1jCm5uC0baZDpKMHqmCbn+S?=
 =?us-ascii?Q?nFgEYvxVvjxqtXCPJ2KeXXN01cKZz8RIEZotMB5t4oj43udcMqd82WBBl90E?=
 =?us-ascii?Q?dGDMl8ZlKxBKALctqU2+IV3mNiEaNWnTzClkP7oqzuBUJG/RnJ0fSuHMug8+?=
 =?us-ascii?Q?S5Pv9E+qDDTuiIjUT9huVrKJ2oGeFoz9tSc9RcrKTf3S22Fwr8FfO24cDmmX?=
 =?us-ascii?Q?50e+JewOGg1lV3UyNgf4jElaxO/tY/bxTX4mO3+11WSBkZtLO/B4SKh3zUFO?=
 =?us-ascii?Q?vK1hh+0FnAc/vHnTlrpK/s81rUR/+jTDj3tcC0k5BQH3xG/w7TelkGpBSe7q?=
 =?us-ascii?Q?877VvLYy8aV/MpeFkjVPZgzMsL97ga42lLa2qXuX27SJH+8idvoEUuTijrg/?=
 =?us-ascii?Q?unSEByBN6EKX7QwzyntCdQEhGtYoClnsaBl+K12/eZQIsBDICG3+80xWajjT?=
 =?us-ascii?Q?JM7x3D9TkascEKxP1xyOvwsNyU05Svb0SSrPfaNGRY7oizaAWQGXFaB0jbNR?=
 =?us-ascii?Q?D1qLXai9HFD/WJEmofxwHBqT0WO1mmjm4AxjayMo7NDQvJl3O5P4OGb/CQcj?=
 =?us-ascii?Q?tAggnazmJmuLy1PZGfdSm6gRJYyHAQtgMw6lOLWSWeF2Y/Ay1UGO8RBvVFEO?=
 =?us-ascii?Q?mP6o9Rjph7f/P4LqVy6XpPr2CQ4nnS+BS1xLrScVik3HWtoj040UaXtKCV1V?=
 =?us-ascii?Q?M6ij/R2GNvPc16gv/M/MvRmKAP+hX2g/P1+6LOzx6HK9TqYidZA8NFgqCSHU?=
 =?us-ascii?Q?m1xzH9iJIGIlqSNlW9XxiVWJxFFR2jLCJ2ulJv9qJg5eOdZINf90nyHuzw3R?=
 =?us-ascii?Q?5Le6scLilgHUqRK3iMv7nq5wtcgvvogZs6kUOVs186omlj+309/I+4UWCj6N?=
 =?us-ascii?Q?6DKX1ndXnfrVoJ9OVpZGdKVNf5ZN2Im06icNytlHzz2EGOoChpN9Y7dnenbR?=
 =?us-ascii?Q?pm0NfARDOcyzt44vz2PDSg1xomuVvo96sJ+6gODiTCp9Nuwleh2slsCP7d5P?=
 =?us-ascii?Q?IO4cjJeMqjagrOzcXNtrInD1XpQi9YzsD1OXZfuX8Ezlp9ra8JC5DE0J40b6?=
 =?us-ascii?Q?Jg0hU0MGmsWvnffTe/f5XZXPlmP94RXcljResjNYVYOzUax9Yj3SGx7+up6M?=
 =?us-ascii?Q?zZi/VbnKzLpJVvONuxlV53vePlrKDK+EX8lM3P6A/ctoe5zGNmIfXtISrtM2?=
 =?us-ascii?Q?VSzDYR1TMp79PWV356E5WvjF9OKKLILkrODYXtwHo2/aESKsJlTb4hWKjAo4?=
 =?us-ascii?Q?rYYRPrEqMAcvOHqEfpZlrHpN81spjgo5H+t4kZcRNUsA8J1cRv2r8WynbUKc?=
 =?us-ascii?Q?iQ3+zLMbSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: jNMvUQPgQf0PRcktdV3WdL2cuzKwkNykUcHajOY0oruExFNoulsTASl+nuJHg+UcOpuBemT2+Brp8tT6owfWk/PITrymW/iNo6+QsQvM5vSKuxJVYj6BAzRwOdVU3aEzEL8IQYvk7fFfYZgN4dmc/m1l90aoXC2qsVGCIbUh/XIlCqv8ZzpaGiCz/kQxlmt8A7ELbZ0S88Iu9xSXTmE2C9pvfsIkdFnVkP+E9vbfmXGZGsEzs+AXvK4rRQswhRzOUESRX5JLEYogNthqOl9gafiWRv80wiCgpndFYzVkcxSz4qhAMqGACzyxwKe0flM+hVrzqCne2D9qOJbca5HonQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab29e34a-d596-4e34-ad7b-08deba8df21d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:46:34.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4fj6I0HuNRysqxe92joeIvrcpEYrpDhO3C4oj638sMZqvU5ja+Lbh9X/nCIGGyXNSObIe70ufgzz2Z5I7tnuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> The xe_info_init_early() is a place where we initialize those of
> the xe->info fields that do not require any additional hardware
> probes. Move the initialization of the force_execlist flag there.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 -
>  drivers/gpu/drm/xe/xe_pci.c    | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3f063e5530bb..cdc7e0935c13 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -523,7 +523,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>  
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
> -	xe->info.force_execlist = xe_modparam.force_execlist;
>  	xe->atomic_svm_timeslice_ms = 5;
>  	xe->min_run_period_lr_ms = 5;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c2bf9f0c325b..b1f5f0098f26 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -778,6 +778,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
>  				 desc->has_display;
> +	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	xe_assert(xe, desc->max_gt_per_tile > 0);
>  	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
> -- 
> 2.47.1
