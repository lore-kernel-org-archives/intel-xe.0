Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F48C369D1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 01:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212810E0B7;
	Mon, 28 Apr 2025 01:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikKo1M1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D39410E0B7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745803565; x=1777339565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjcQMYGhlSR+q7S1xnH1tfb4xf1caDjskfEISjk43iY=;
 b=ikKo1M1pNaavA7L1z56aMwpNyOAbupFIvLjgtCioEPu2TOFUWADJJtrS
 V1e5aHVJJEKapwsG7IGZUaHAMOMAdvb7brfI3fhSe8ClKKqFHWYAnC+uG
 lIlMvwHPGhQuimoE5uUlCRKA4VoCoqL3R8W5w+r18Hj1AwDwPg+EB+Wsp
 AjMGVg2CWt8d8w3lmj+m52MNIwxE6k1OxqIdFO2CVWNyGbu2CccSiG+NQ
 51npbZnI116LydwnYKNbAYSqZwCBLJXgX+Q4vp8ZJvcc02n8NZNvYVduA
 822+8Q3xYkPfhu7CAqRt7/D/LqMYTS/N9TAH4OmMwmEqotDcPxRxXQLxa Q==;
X-CSE-ConnectionGUID: z9X4WZb7RmikHbaDAaALDg==
X-CSE-MsgGUID: GubJ/tHRSNCnGJR5dHVUpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58364057"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="58364057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:26:05 -0700
X-CSE-ConnectionGUID: wTWrSytHSvyA3MkE2XRwMA==
X-CSE-MsgGUID: YgeHtrIpTFqrlZDHVE3Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133299037"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:26:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 18:26:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 18:26:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 18:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHwoFqozlgxpmB6Okb93NnrnPGltN1t/Ei3+ABgX2fDZ3imealdnfJxJplFq/O53vT9XYlq7Qr/3imKlbf45E0XhvYjxI4g5vww40a0fIv2MLGOtCISUO6i10BiCAm3/C++D/4x2E32KBmY4lInyqW3iqFi+k0tIG9i2f+7DNO7ODa8/ekGm+AurkLAPhIoo0RXn+jG0tTmF1YeptB5vwWqPU37hOzjdOKmqsv+wjfXtydwGpwAqBP/yJPlGxAbY1Bc3OkA1UVpIUWwMNTVwz0qgPnr3t0uUyjVjTcLZEgfm2vFZegjDZRD70szILHPVDa0PpfDd9iyGgPusGlk28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5Ugq6k+aIy12RB3QljWSw8BV822Jk+kq8wK+GWkH6M=;
 b=mUWd0MJnCVb1/7Kyl6By7u5bJnrV2PBGgkAngMRzZUmZUW11rfPKigbLg/bfgVqXY1gR4EJDEvRsWF0TUPGfrs0uyOFIsiEaqdA44egJZXD97XlCshD+xz8tWeVlHQQa0sxPpPU5oXjIs9J5kTw1GDkSp/ELput1BVK8l0TTa7Y3obu9kleLYe40DKVqJcYYUriYC6TUc/NEdTuxRashcLMsYgykMy9N1XcR3rwVI4X9pUw6FjMM6OHJ1H+1YW4WSsE5S9ShTLs6Ew1AgOVB5fUVvrSKu2wpr6ygJwfBV3q2fpEtTJnEMbTS+O7fDvhNBFvHaLUsSF5SVVJD7hl9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 01:26:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 01:26:01 +0000
Date: Sun, 27 Apr 2025 18:27:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpusvm: set has_dma_mapping inside mapping loop
Message-ID: <aA7Ze4KEbBpQERIZ@lstrano-desk.jf.intel.com>
References: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: MW3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:303:2b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 580104bd-b9e2-420f-5821-08dd85f3a2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rFH16d+EeU2mFxrwC6YGwapoMhA1YxMZcOnRcPs5ie5vi7wGEXVJCM53DS9J?=
 =?us-ascii?Q?oYnbICGSmiz5sc750tvumVl25cmcjkzESeq1eH+j6xIlL46/97oajgO4SGiu?=
 =?us-ascii?Q?73HzpgJbpHBADvHCLoMtNN/mShmWPTfPAxxBaTA23e3g5asp1Ajb8lsgIsus?=
 =?us-ascii?Q?ZhEnweRaVke7I3qYtxPD0RmRtzA7WtImlUH5QtQ/RuH4n879H8yt4xkUsWn3?=
 =?us-ascii?Q?wRrza3DM5cuzvUTHkWX556eP80mH1qKW0jHHDyRRWyjvX67L87ewzP7P+56h?=
 =?us-ascii?Q?5htuSCeI6CT/VypdWSPF3GJi9kXZ3MvpFKSy+FRwpwo7tcMbaVPPQNAI47MF?=
 =?us-ascii?Q?+FTKGmDdeb7TMGgRO+W+W0vq/8CHQaf0V2QPu25Qrr9SQXydK3NeQc8unqPq?=
 =?us-ascii?Q?BZGO9pBDrEYtz/ZCFsIl7nEAGOv9tbH/swn3/mh9PHBtG3jEAj/FfA6EQvi8?=
 =?us-ascii?Q?MSXFGguWu0sUXYwQ3z++Urnfw/XGkcunYcXIxdSIsmb4rPruKaoGpuMXgv5Q?=
 =?us-ascii?Q?DqAO0HrKNZ7nWhgnDwACEIkDjQm1T1gmM/fHOffEUxWuDTnroW+aqNPEr682?=
 =?us-ascii?Q?DJucWAv+0XvLlmh1kAfjF0G6kYvJ4LWDpIjMSHdyoqvMu9T0EzaifVdqwLD2?=
 =?us-ascii?Q?7ktsqUPmhc9LN4sV/xryHo8aNCGoiaEoCQQh6lgXXTS5PSkPqdXlIDKYAQfj?=
 =?us-ascii?Q?vM7ALrFu6JkGhkik3iixycf3cobmG8CG8VYfvrf/2vYNdImHhFJ6sSjc8soc?=
 =?us-ascii?Q?nFGswo7oqfxt8j5cXXRP16agEGB31RZHQpKI/8Ic8Q9c+wDhHOHq2AGQPr42?=
 =?us-ascii?Q?cY+lanHzOEm/B4TnTf4Uy/Gaxeogn7FBuFqMhgu07doh4X00vplgUg5Lfaoj?=
 =?us-ascii?Q?Ka5qkEzZZ3NEN8Oj78Tpya+DxMT3CuGgwckkjeISsQ72ZinWrcyPBZhdbOSq?=
 =?us-ascii?Q?NcSdnP87TYi8N0NT5KNCHYrimRPRl+ZewdcFy7E//mZN5d01FnjUV7XkEJuD?=
 =?us-ascii?Q?VPklKYytEZBGhwLmzRZTGquFUb0sxnkDSs8G6jvQ5JXDwJPCDqm4JBfSaC7+?=
 =?us-ascii?Q?Basc4JGG0m1LquvjlNqemeWz47vt8pHQ9WyACLcFwoERHY2oVsHmZNJtdmTV?=
 =?us-ascii?Q?+6bhbkihy7SaZpyImWEsZcfzk/VuETxaXIGD+9ym1HBq0geI0M2r/qQPuWh4?=
 =?us-ascii?Q?m5Z2S4IrJoK3IN26nxy3qbVYWolJCT9+F30CRsOBUUVim+6jm6B3jmBp96/I?=
 =?us-ascii?Q?VSlwahPlvaCG7VFRfJ2Q/JzZHZEWHOF9kwvuXcpD4dU8j/T0raDO3B3wFE2b?=
 =?us-ascii?Q?dQOtsqi1SfW4CRzBzI2bmHAbMxZwsqGyNuo9YUcGrIOVT13ckhipit2AwwUp?=
 =?us-ascii?Q?xz31tgoXviCHu1QRDF3wO9Kv74Q5KSVPgSxx7jhbH/16MBuouleBZwWZFnQf?=
 =?us-ascii?Q?iG6/HC3rwLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cnWZU1Rof7EczT2GGHH6uIvfaMoNTmvACQyvkV3moxBBYIsR4mSMcPGc7ZMZ?=
 =?us-ascii?Q?lH8AJ36QGf31Dir1/xsrEL13fgsM8S0/0Xr79CAgvLJI/UBEIZqaDZNVopZE?=
 =?us-ascii?Q?2G/NN7Dmq9VXRUMOIiAkJkLqrOb5jwx0z49DchVyqanRHpblc9mL3hSzqFo7?=
 =?us-ascii?Q?xKbuW70dY4YsDKSTRsmKl07Is2DCnclWOF1bjcwtJC4f3/hl+bEpWPBfsvz9?=
 =?us-ascii?Q?5+7ZcQmOHwPnV1Jv8AATxRFtpxPOuUpMuRn73D4N4u2RGxqrRPDFHGHkkj1/?=
 =?us-ascii?Q?zYOkiFrqbDKKs+UyjG9kE0b0TMjQBt+5D6bj33LACLSK50f50FDDivNsm//y?=
 =?us-ascii?Q?ZHqCKjwyvs09PAhIO5UVNBzo+GdCwB+V1mTIOBLj6XcmamhhhXlYFo9BAeLO?=
 =?us-ascii?Q?IQ4k9o2WbdVJjyVnKmRhu51tDUwTa1LXq1yVHjoPEflTJKjSgbyWuGr1o0Mu?=
 =?us-ascii?Q?X452+LNTT6Fkvlm2JOoBWnxXTVGxoakip0unSGUQU75dG3rpVW4W+3dFisyj?=
 =?us-ascii?Q?AL+Q26ShYnM0QeDFkH1dgtqpaLidrVFntoQJfmjRpSCs9r1YW0Ygt5/5qxbh?=
 =?us-ascii?Q?irpEKCoAvgAZb6F7MrW4owE18/Cy9Cd9gj81DEwld9T3JIwr8HeZvNyyIJ6r?=
 =?us-ascii?Q?5gbFS1WpsNWpBsaxxvdl8buNaLvtWfKMUNn5PWI7O+Wc19X3Yi8rrfj3/ly1?=
 =?us-ascii?Q?3jlwQTWtomtuKqcSCA+fw9rr4CQpiuz61HnsP8adapFQQuF+h3FysOMD8lVd?=
 =?us-ascii?Q?BZaBnM5jX3eeUCqFgGPojKAzMbHlDPf0v01j/nU40scFsa7eUA61WclxoxxY?=
 =?us-ascii?Q?2UULumAYYCzDqUkSE2rfW0wq9NUUmD3LgrAwak2Q+LF96/483x+SwEu49Yca?=
 =?us-ascii?Q?yY9S7AQHy4Rh9l6V5A906HmRSrtuwyL0AWhlGTRiBjuMMbBDGGCIHOCq9ybW?=
 =?us-ascii?Q?xhBBGTbVtFAPQS3qrBZiJPn8uAV08CWL0y1G+L0OHnI4VO0GmLIf3RjTWdXb?=
 =?us-ascii?Q?8snCdwJtrjggxNwtIKo607mvfNoJvyZRnWdDYuseHi7MR0GTOB5fU1hXwbTY?=
 =?us-ascii?Q?6aRbD3ztl9K/SS7TA7MqFhUBryKWsQ9zA/qLzrV0yFWvgR9Cf6svSDM1sn5A?=
 =?us-ascii?Q?InUAa/AUVQUMq9gtlBeeovDdHC8NYXgRfonZgK5uYUaIW3PnSGz3qEnE02nV?=
 =?us-ascii?Q?hvJ/+yf/E+ksu7AJVqekm0fLrwOB6Hw3kM5pVkzFTL2aXNtYifMMCVuqVPRt?=
 =?us-ascii?Q?BFjCDzhamyLbbXLtBIVLEa9r/a9X3gYgIUOoc2g3+HAkaNQvWIXemd+KOBKF?=
 =?us-ascii?Q?qD+Lq6iVhdlJ/iveNzdJnpfutEku51O/SYisS7EkaUGjh+mMSthYjS6puHe0?=
 =?us-ascii?Q?lXfBa4h6K95Jo45RLwTGZYfqj5iVHu3/CMKIXuA1TtyKGdhcZssorp2QS5wx?=
 =?us-ascii?Q?bd3zGMlDlnQFXnODxoPAsOMUeHq7zltLcQ8J0+d4xsEleAQPofy++pCrjzap?=
 =?us-ascii?Q?MvvI++MWeO7g6SS6vxkrxIwJoVVGp2aaEsKZzvHxhqUilg68hy6DA7mUw7Ce?=
 =?us-ascii?Q?HKLYEGVs50yalj0QV4EOruiiIAS2GEPKQtysF6iESR2YKeZ3TWP/5TUtKDdG?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 580104bd-b9e2-420f-5821-08dd85f3a2ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 01:26:01.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /U8ogmId1zr2eKy31xXw7TNVfYkp2iADF8vEtQvLY0uxCyV9hM5DmSrUntnmS/M2sgpy2t+sWMd10aUja0KoIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

On Sun, Apr 27, 2025 at 12:42:38PM +0300, Dafna Hirschfeld wrote:
> The 'has_dma_mapping' flag should be set once there is a
> mapping so it could be unmapped in case of error.
> 

Good catch - LGTM but you need a fixes tag so this gets picked up in the
6.15 cycle.

With a fixes tag:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Do you have commit rights? If not let me know and merge this tomorrow
with a fixes tag.

Matt

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 30408f2dd370..4e18b201b5e7 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1464,9 +1464,9 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		}
>  		i += 1 << order;
>  		num_dma_mapped = i;
> +		range->flags.has_dma_mapping = true;
>  	}
>  
> -	range->flags.has_dma_mapping = true;
>  	if (zdd) {
>  		range->flags.has_devmem_pages = true;
>  		range->dpagemap = dpagemap;
> -- 
> 2.34.1
> 
