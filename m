Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00789E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE60D10ECA4;
	Thu, 12 Dec 2024 03:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcPxQxza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E0D10ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733972833; x=1765508833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ApsVq8DSXJCniJXhfEnlFRuydM2LaVQNMErRvCpemac=;
 b=PcPxQxzaJ5tl6y7uujtHwi7nsGobBFIOP1XBCSIJnDh8Ns8JINd5tPuT
 bVgPNFVEQ9Fy5myjw+5iwfrTQYyObWGsMn/+E5QXGv5k4rd1a4zOOn/5i
 /0lZcmYgUdYxWQnzW2p4T+mdm+mHqAChD9qJ29TrrFd4n5cWr/1f/bqxR
 nkNh45LXpzeK1s3r9ulKFhOK4YwVRvHZ3ndbY9YGMxnWexx2a+vPwv3Kp
 KkP5OsubrcGazMCJl9RvMV3LElhRqbk9tajWWs0b/SfxECX9J3unUgnuK
 v+6e8dCvvkyoxCcikbq8mu02p0hXFsWoS+Au16EhRYuCw7/L7dCjs6IRU g==;
X-CSE-ConnectionGUID: wPHpjCBSQmipKsiEJkIMMA==
X-CSE-MsgGUID: Ey5bFEOVTA2wlGjOGiDDOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45051980"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45051980"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:07:13 -0800
X-CSE-ConnectionGUID: 6jVsJ+2zQVOzs2iH4BwS1w==
X-CSE-MsgGUID: b+1ZbB6CTryz75ncWYpTKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96286953"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:07:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:07:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:07:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhOMlYOOtKg8DyT3HZrRi1wZJaZbsnxG35wutTp6qQCMM0lUJzlhRsca11DIN7ChruEpqj6/uZtsPF64DIQLk3R37eQtin7Wc8hZBRJUDqmjUfc52tMoBR4t0OP6vPxXjcDx+DTBOutpTGJMZ1aZ8Xi6ugrVM4e5qAuzcxrNFELPwzTsPZUdQgY8sqi2aoTQ/+01bnoNeY/ahwCPDtPKyD5cBwY/zWsIK6i0v84GxPn3kAq4gQXFEstcZ0cwtkXV1RqCUp+6Wbgj1kNXYfNeufRphHKScRnWf6VZOoMmENcaS08y4AbLN+nLCDnHU8NJ6VADpfv7LojUQIedulpeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gwDD1Kh9wASOswNAZ0/Vs+CKovJ+IgVLs/3oGee26Y=;
 b=pouzs899LfHl82kU8qCCRcEE1d/BqWRaHyTL+87jnPz9Me4SPyPsaEYnyIyGq9aH+n2CLbFrPxc2wlFcnpb3qjizaUkt7pUXaKv4w7DNwWtoc/gUnt3rv2O9IPB7gp5Yc82QxFc0UdjeePl1FQ3SFEDWHreGUCQ22kqjC/iGQLmMXpVNRPt2DHvOqBJB28VNCnRNshZlAby/B4nm08d2DoH4QHA869lxzQYVxdIQt+6jwtyaujtH37bSKjgf0+/0GniM+MkFXBz+01dWTEkrh8+N/p3AvyasoAidq5OE+u0ngcHu/649Y9MIKWK+4LQ7MwTHGcnbYQJItU1KIvC1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 12 Dec
 2024 03:06:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:06:38 +0000
Date: Wed, 11 Dec 2024 19:07:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/13] drm/xe/sa: Cleanup internal BO data at device
 removal
Message-ID: <Z1pTZ7fyXSs6aMmF@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: e98ae58f-23d4-488a-2dc6-08dd1a59fe7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XgWROWAePOg/MTdmVIu9b6uR2c4zSxU5QIDfbsln2Jh33z0m1EHNAlvLHP+Z?=
 =?us-ascii?Q?EuOTQrTj10qFqT/Mq+fFUGBmmuv6suMZAxB1RUTr+msl4yrkMvaRAPb7btNK?=
 =?us-ascii?Q?ssPr0t9/I7RaGA4LrmOFbSr6RG4rS7qNRnfzc8WhKu87TzVojmF3oiNMggMF?=
 =?us-ascii?Q?+Y5mc0+5ozy/n3JL1est97MXSuNcAYSsqPuN6vJn8qJPU6lZD/ZQ28h5Kq8f?=
 =?us-ascii?Q?cPObGwD2fGxOvO+EAek4ZyQcdzljPST3yo4ISYjrh5uVfqcgsYGpe6L5YM4g?=
 =?us-ascii?Q?Szo51eNRLV5Brrfy9K6KZKRp5LRGJ0rQFodFPPCnK+5XzjaJ2B7rFHavSEZ5?=
 =?us-ascii?Q?MF+yR/8ZC/ow03TGWeoPbO6MqWlhu7C+OVQzUD86YXb4MH5FyN89ShsRD8Bm?=
 =?us-ascii?Q?MPwWSRLQa1kurswphpy8KRiP/u7ggzxDh+i/EPIrE5zlc1J5Di0iAvOYghf5?=
 =?us-ascii?Q?EilF1RhI5EWm7LzMd1882wUzEkXb33NcWS3DD/a27Dlho2/VoDqtjxdsandQ?=
 =?us-ascii?Q?cJCdH39DdDCkys7RLof9xuJYUMwfYWUOBuYu37HxMB74CWfuxKipaUTmQPMy?=
 =?us-ascii?Q?JJs659kDEB091Zgdm1HJT9WbRwjNzE1FDq14tJU4/o0Qjb8ajf7gqSz/NAQy?=
 =?us-ascii?Q?BftCDl2ou1REMKWm3a2oaA3XLJuAYdKht1d9kyhqDeW/9FRg7eNz1npuS3tY?=
 =?us-ascii?Q?kkqxP/dhFQ5+US9DH5fZ6JOpFWAgOYjSimJMNbH5RvNOMh/BKvZeeUHrg7gj?=
 =?us-ascii?Q?Czvw/iDCEWajKTU5PwtA8NBCZE352ZvgAclLKUj7E1IJYhM2Slr2ux2pXXG+?=
 =?us-ascii?Q?1+vpSu7bN30ZHb126bIpl8pXx0QuZAEbkkF4rZ+uysOKDjkgSCcLCPpnZ3LN?=
 =?us-ascii?Q?3poOBSC8YRQL2cvJjOpcfdBswI4aPmlAR4kcZj8z2Pqaka8rwT6CfIz82WLK?=
 =?us-ascii?Q?yK2PHP7uS5S6m1r/gmpLaxiS6pXFrxBV8NETHR5LP+Ex6kpO/9m10inodn40?=
 =?us-ascii?Q?87CIuYBdMI/bQpyvOJoB/JiNuzShyzYmkTNYcNkGpc6KCVCxQEbEWGfCz1Sk?=
 =?us-ascii?Q?Gsf1zW5djDuK4in4GzU/OpbvshWnCH238+ChkK91OOwffJ/LcIKsKnb5S2CZ?=
 =?us-ascii?Q?LOU4zu0dJQBSo4wxo6CWaqM98v537FYhpyYEyPKUj59en7z3J9bt5GOZOk4c?=
 =?us-ascii?Q?dxxxkXwSPSRS9v5nmXGADqrnAIyvRxm7OUY9PlwrIDY98xIBhToTMdp6s4oC?=
 =?us-ascii?Q?egtUxkaC+PpKoQ5xq9PnguGAn3TWNEDaCZ7B+csGxXeIINWQUEphmTKwtMzA?=
 =?us-ascii?Q?dIKLS9re3X+fmq3kMabrBozPeoZ3947MMcOblIkm0faEoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/y/d11bR1iWLgoFKtKzfQxUG8qV4vyUfxoM0LBqTBxN0SA7xb0JTYNjs6nf4?=
 =?us-ascii?Q?QQknlDvYpca7mWFf3fNSq03xg+QE3dI1tNl2GtPzRotNAK8LuHeYaESzJtDH?=
 =?us-ascii?Q?a/90PjWRGPm36S//lSZ37cxOoTV9AY098ocy0586hzuuFOOzxFc07rTgTegc?=
 =?us-ascii?Q?pIgIWKN4Vg7vsrtzbeNTUus1lWii2VP1dz6fm32id5XEIbGaZbjKp5xLsFnj?=
 =?us-ascii?Q?2cynqz/xm1ziwi2sDUBhKOGew/7oXL01WoJz7pP5rTr6z450msQ8nQLzzt7o?=
 =?us-ascii?Q?O3M5b/YvxD7MqafvwWepv6vxLm7c8QIhR++nDfeFaBO8PVVDTOU4JtF8HLMs?=
 =?us-ascii?Q?bBtwT45WD+xbqv44yLSsEl8i8TcjiIT/EmyQ4Q9J+iNG+1VbwtDC4qkjwNZy?=
 =?us-ascii?Q?cdtDOHQCDZ78kodbiqxevzCbiOCUOgJFYUxQOrHu9I8AWtqg4RhDgkfeLf7k?=
 =?us-ascii?Q?dm0DtT0t5jxVkmBhg32Hy/KvH4OpQ/ISfi1wZIMpUSS+Mnw0aBMjrM6+U/v/?=
 =?us-ascii?Q?t1RVPl6evdkKqK16XeThaPmwBcuab0hsWUgtGUQHk1dxsO+Rt5Tg/EBlXbPm?=
 =?us-ascii?Q?PwDQZRqyEKgSqGkjzRLKFsMppIY+DfNpEEDoGTOudmreNDRIGTMvjo98riMf?=
 =?us-ascii?Q?LmzgAFJbEN3Gy90L7J4SO7ay2b7oujncaHl+xozXVv59w4sQ5UJyxF+B0otp?=
 =?us-ascii?Q?R4rGL1uwirXm23SJO/VL20vcmptoThxReJZIONzKkYRCXdBoqRmGGCDCDult?=
 =?us-ascii?Q?4vP2qIk4Wy+CfY6U2fmjGIWPHihlgUnBeX775ZBzEjjcTWa1vzpJkAsP/l7l?=
 =?us-ascii?Q?jW6vvBOysmBTCFtRo/X8SAif80qeN3OZ/Lr46WT+ZlHtW0smWSSaUyt9S38R?=
 =?us-ascii?Q?++k+8CCGLU2R2l+ZbVpRIjRgVB8MjMnTLLCB+8qIgE15Cls/YBOsBkFXMZO8?=
 =?us-ascii?Q?SrTsKzcqnMQf80A8b/LPlmoWCrvE1C1/T1ZViUIoUlegn6Zuz9DNJ1VWOK/D?=
 =?us-ascii?Q?s91ejw/ady++MK2kFzX+5hH8HhwIgHLgNcwbMi6WcUIKAdz8aJUEBkQPN9dU?=
 =?us-ascii?Q?jtQTj2JDe0yr8AnsY6PtLYZZzv3kswbI+uNm/nY66U288McAvssji+RH2s4F?=
 =?us-ascii?Q?f9VVHrZJqWI81WRfonJZ9zFuPlSkf9G19rdc3lGqRSqy4LATAmdBzNjgoV2h?=
 =?us-ascii?Q?q66su2/0H2Q44ouqDf5DFH+UAcaeQunw0kqOCLBKj9wZDJhPKWxP2rNQfsc7?=
 =?us-ascii?Q?AESIvDOsE4rptOvgxYJhUEcxqZw+tOX4/fkosXdN5EHsHZdC8YDUdTXgwOvA?=
 =?us-ascii?Q?vGHYM2fBL3BOHi+eXV3yP0h99N30/CZY35gOZdPLx/WbzVC4KeEdEhOWbdur?=
 =?us-ascii?Q?6/8RG6x0H1/DKOnU4F3xl6Gy9kwVzuFsMBZ/SatmKF5PFGWzTpzYPRkBDixd?=
 =?us-ascii?Q?UhzSq29Tb+PraBVIuV68m8zQnFcszHBY48kT3dSIQDdnRR+vI8cWBSIR3ZM4?=
 =?us-ascii?Q?xUfZSnA5fQB4Vp+n/r6S6tJgI2l1FJxtS7TMmXHR7GQ4FXX+Ec4gM7RL6J5r?=
 =?us-ascii?Q?bpT2fEk3dqF0T2OQpnP1NEfSw+JMm67KP4WSJrRvf5nzvn5dN5p9qkqv6X4I?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98ae58f-23d4-488a-2dc6-08dd1a59fe7f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:06:38.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFQX4CqOWZGeSZfXpQbw4uDNrN5+8VJg7S/4oInnHUwD2x26WDgPixUNR6Zp/ZopBY8+5PJcSJ+aGkBdEnHtwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
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

On Thu, Dec 12, 2024 at 02:01:31AM +0100, Michal Wajdeczko wrote:
> The underlying buffer object used by the sub-allocator is
> device managed and it will be released on device removal.
> Thus we should not wait with cleanup of related BO members
> until drm cleanup, but do that at the same time as BO.
> Add another device action and move there related cleanups.
> 

Kinda seems overkill to split this. I'd leave as is or just remove 'if
(!bo)' from xe_sa_bo_manager_fini.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sa.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index eb314ca75355..a5e05237b646 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -16,18 +16,19 @@
>  static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_sa_manager *sa_manager = arg;
> -	struct xe_bo *bo = sa_manager->bo;
> -
> -	if (!bo) {
> -		drm_err(drm, "no bo for sa manager\n");
> -		return;
> -	}
>  
>  	drm_suballoc_manager_fini(&sa_manager->base);
> +}
> +
> +static void sa_bo_manager_fini_bo(void *arg)
> +{
> +	struct xe_sa_manager *sa_manager = arg;
>  
>  	if (sa_manager->is_iomem)
>  		kvfree(sa_manager->cpu_ptr);
>  
> +	sa_manager->cpu_ptr = NULL;
> +	sa_manager->gpu_addr = 0;
>  	sa_manager->bo = NULL;
>  }
>  
> @@ -66,6 +67,10 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> +	ret = devm_add_action_or_reset(xe->drm.dev, sa_bo_manager_fini_bo, sa_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>  				       sa_manager);
> -- 
> 2.47.1
> 
