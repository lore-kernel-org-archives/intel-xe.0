Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373CEC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA81B10E4A9;
	Wed, 26 Jul 2023 19:27:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA85210E4A9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690399669; x=1721935669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NFDqI6NM9knOoV9k7m++z3lRrMa1iVaEEX1/Kn6gvxA=;
 b=UQXTqi9/IZz4WNJMblw7mBOnVw/lyBkWt/WLoFmVoEx9zbrexAu75GvK
 S2M7GtpZIpkfLI8Q089Y/OV2jr61YrNgJ1LLf/FugkWMqYFaS67peQrxC
 Wu7QuKOj9J25U944JgrVIfUfBJfrk/GseCwC/6H8eqqfu+0e6bBWXi6pP
 L+ArUBnZRpZR4mVgfcvrDPwDm+pB4q3NcW5qFBgxHVAT84mHQ5/WdrntP
 M4Kl9JuIU8qB0oqlYfg6G8QQ3OpJC61YgDYjK6plsojdHfIQ7YMOsa4LK
 Ima2E8LPzWGVsYkC0zIpzOhaT71DqQRxNIni0aX5qGPEd2UI2H6U5P1IU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368131966"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="368131966"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729977502"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="729977502"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 12:27:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:27:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:27:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwtpYDCMqRbnK7QT3pz3YuCBgKF3CR5mOdIIvi+GAtWbQEZ1pXv2who4R6E9IBAOCvppZApvy1r6Q6bhVBOctbOt0AmkeJ+IS1rl7IdfvCkdyqlilrrLDUBZY6Dgyxugiuq7KZDl0t8XkQAX56GcqtHzh9a2z5qiFfD5el2MVmhS22y5xozRc1/PUQacM9I1uxq5qzoCjnZNZw2+Mz3Z4zHtl94bZPp1i6ayeWLxNcZtue4+tJdtFXXDykPeVcjAd/6sc50bapRPY87jvuqRnyfqw6KoVM2T6BKUhxYKrV1FOctA0ED4lajNX4XMKiKraR9LIVXicZzyCd+RVvJlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWXmwUoYdJk9LRI+3yosYCd6698J7zFHyVlr82CnQPA=;
 b=QbYiVPp7TrqyKC2XJHeF4FSUGT1Iey8dA0jONA7rJiutr93XlC/OYqTtvf85kZirXgWcQQC3lavZ9pR1AiYvpFMao8qIuyfXMghZQLOIVlft5Cxs1cCWs1yQRvi2TGGq6YIoxrTPV+7tqZZ6jEmkuMgoVtSI14cDxPrIwlVqqLWMnqHq80YpPML3/M31qRj1FYJYR33VTJl2ojnKsT3jCTNShoeHtfG3wCa3IK5z+0P9c9eovoFIlP5dnKJ2Ip7BI5nPdp+t4g+0mWzzvYnwZGnkwanHL0jFKOWYpBIGh7DftLvUlbHtL2yzk32wsgmNDzo5pukG8aMxeKzlT0TwpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 19:27:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:27:46 +0000
Date: Wed, 26 Jul 2023 19:27:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Message-ID: <ZMFzhWchFiy9OBKZ@DUT025-TGLU.fm.intel.com>
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: f41e4211-9b5b-4bbc-3d22-08db8e0e63e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCC80u3UWwjD9vb/Va55nC8umszfdLiaLwMGH7qg+vAFJkqFTxp754rwOnIGkEZcnG3zuF1z6LkRZWWpVoJSlGoLlwPUstUfh0DZ/e735Drl0dlKQ3MS6Nx6AhRTYlSRRuCpdEtIivJvPah1K3LAAC2vEnHqJbqkC0a5MET4yWJhig0qc96pX4MDCM5iA02VR+WyaMlSYdAPccbp5viximv9rwLJoq/9NjeSUwBhELNtgE9Iy3cDk2yZZKrpedcDE4y9x8YvUyiuwsuuVfzosWvr3WnxxIMVYqvgdBRKS140mCEaL7vWwPGmFKaAHZbt3jVR8RGz/tuIAPAxElUp78Q2J1lNrgriV8YyHqehMJ9KPjREIyVyLJvUhDK3jDjNb1Fzop4ayQCVUKSZXUTbHS36j8lQbKN2S++GjGuxfh6k6XljvNlZmN41nGFmlU2gOVyaIOcL/BiQvwRxOn52Sa0CuAKNnt5Jd9qqpLekK+nYtHViB5krQoReS0mc8fE6QQkrp+ERC9X9KxYBw4FJZfoZX2CMny1axQf0vdyW7uAKMAV0gahd0Pdw1b2xpZkR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(6862004)(6666004)(186003)(6486002)(478600001)(38100700002)(41300700001)(8676002)(82960400001)(83380400001)(66476007)(66946007)(66556008)(4326008)(316002)(86362001)(6636002)(6512007)(5660300002)(8936002)(6506007)(26005)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?497ATlJzd+ygX9xc7/Pa9nN2yAcZJBcqPn/4n0aI+6nGehFwt/C6dSduo9LG?=
 =?us-ascii?Q?PokyGlwco7qodVTdqLrJbwpdKvBUWzYPQaMzH5zqxUaFrerGGSIuq8KCDt9N?=
 =?us-ascii?Q?actA7Ye7xFVBXbFFbK269okwO4I/z9932MitTH8/nqD7gHHHB/iDSoohaBeG?=
 =?us-ascii?Q?nn/gHMyx/HhVcuitEJJdR0m2emuEkXdmL2ykRfFkeZGylY2jrd/aXX9ikF+k?=
 =?us-ascii?Q?cXRkgIpZe+EKWwXdzMZnr0KuIocjs1pcLztOHA5pUqqfRys8SpfLHqQFT4lu?=
 =?us-ascii?Q?u3zEPe6mc1SD6gktsZENf28iwN4O5P27xmNri/txMDgOSYYgM3lEWe6gCYOR?=
 =?us-ascii?Q?m4dJ1sXoMQjN/CCdiZHvlUTsMU0jHN56NFZTJ14EpnutPWvJ2dPeWG8fPD5z?=
 =?us-ascii?Q?4dckf5QUcJvT2bZMG4zyxVeOXCRMDSYJS9zjy5tNRUVlQFebRYy02C1cXB/e?=
 =?us-ascii?Q?KV4UPvS+ixVYqnpEq/vy+k4JWoptRblEw193zA78QBgVAfsftcRHsdX9nfVH?=
 =?us-ascii?Q?4UMhitO2CIG2XGvwNJyKka3Vgfni3uCSYm0I0PCKyyF02Fj/TtcZRxoB+gY9?=
 =?us-ascii?Q?mN6Pjb2JYqudjHEhZgZS6DPngXsm+5GTTJf9rxyQcBo+SpY2v9DPCfrYRY87?=
 =?us-ascii?Q?T3vUvD6A2qUnkuYnU2ySvIHAHI33kswb1xK1S7EBW5kDSiaIrFf37wdDOVid?=
 =?us-ascii?Q?vSql9C5nJXdMO2/p7e5FjtMOgay7ryLPFaOQR3i8PYSFLpMXJ12ivuu8NjfU?=
 =?us-ascii?Q?ENsXgGkqp0j4sCjyhIsHPCtX5ey6m/OLI0J2vI35mL1uVNPROXFlRpBJRlo+?=
 =?us-ascii?Q?vKZ1yLCx97kwGB0OdmsIZdEr3ho0M0Fmxiyw/adC4CLHab8PaPJo8LqNBk1d?=
 =?us-ascii?Q?TI+b2Y9wCP1qIeYQSSKgqfVAMzJRRvDb9aJ4qN9ZnEHoxmZbcZsIgQu9MYMS?=
 =?us-ascii?Q?4yychQscEKRFpmOPu4nZoIonybt5vu/EQnYe9D3q22t8xcE17SdOBs44JYeq?=
 =?us-ascii?Q?VZLGe+2JhPr+84vfFygmeHa0q/V7Av58PEbG9jHxcyLAmxMZijZ7EW4v0Jga?=
 =?us-ascii?Q?dIrZaVuqd6a8ZovVpcfeAY8NWVtGHSeB7yUQZmC+iRnbrvE2QTKGynhQeENu?=
 =?us-ascii?Q?FzVOmQXzGVaXOi03dfQRZW//nEzb1PGTUIbjIopnudcgURcLwrkjYBDMwi9o?=
 =?us-ascii?Q?nznjCkJIuN0Qh+EwrdQMlR9k4t4Ptl2xqAuQd01hMtmumW2rkva9vZzX7vxR?=
 =?us-ascii?Q?K5OUac313K3TBKGiWX9xI1zySNoX9UkQxQYrX3p9JJLTDqqYZB1jRPCP3XGP?=
 =?us-ascii?Q?JCw0SUIxhcsAKAVoNz+qMXzL+KKbKsxb+9xJQd+qkt3CJAErQEagMMkTGpHh?=
 =?us-ascii?Q?qFVYbHhBVhBcgbMc2VQnzoNmyQ2TupZ3hK9rrKkYDv4K/D1B86RFrTbnGKqw?=
 =?us-ascii?Q?pqAGZ574UuwcyEY6rWqciHdpiHCn4dSLtf1ti0H9ozzru6qNIsePOlcweNwa?=
 =?us-ascii?Q?R58tqtCk4Qn/o/oJSVZ4U4BMoiiGM3jtXs6J4wQC39mo2u1Ru45RAEWNYFlW?=
 =?us-ascii?Q?bZ4viFPQFeFatVgt2h8tXdkDI5AT8qD0vAW9xVm+gvpNs7Ng/aRF6RKqpnaq?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41e4211-9b5b-4bbc-3d22-08db8e0e63e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:27:46.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUFAzuY0NiEQsTWYYUHhg+jinNEpwIYf/ChT5fvErJSoMQbK+dtpjPkgHKrra9nR5aSd5bUUvUZ8IE3nj/fikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in PTE and PDE
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 06:19:16PM +0530, Ravi Kumar Vodapalli wrote:
> Different platforms has different PAT encoding in PTE and PDE format, add
> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
> 
> Bspec: 45101, 71582
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 119 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_pt.h       |   2 +
>  drivers/gpu/drm/xe/xe_vm_types.h |   2 +
>  3 files changed, 106 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..09dafb0e47ea 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -16,6 +16,7 @@
>  #include "xe_trace.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_pt.h"
>  
>  struct xe_pt_dir {
>  	struct xe_pt pt;
> @@ -62,6 +63,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  {
>  	u64 pde;
>  	bool is_vram;
> +	u8 pat_index = 0;
> +	struct xe_vm *vm = bo->vm;
>  
>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> @@ -70,10 +73,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */

Stale comment, this should be correct after this series.

>  
> -	if (level != XE_CACHE_NONE)
> -		pde |= PPAT_CACHED_PDE;
> -	else
> -		pde |= PPAT_UNCACHED;
> +
> +	pat_index = xe_pat_get_index(xe_bo_device(bo), level);
> +	pde = vm->ppgtt_pde_encode(pde, pat_index);
>  
>  	return pde;
>  }
> @@ -103,6 +105,9 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  			struct xe_vma *vma, u32 pt_level)
>  {
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	u8 pat_index = 0;
> +
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
>  	if (unlikely(vma && xe_vma_read_only(vma)))
> @@ -111,19 +116,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  	if (unlikely(vma && xe_vma_is_null(vma)))
>  		pte |= XE_PTE_NULL;
>  
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		pte |= PPAT_UNCACHED;
> -		break;
> -	case XE_CACHE_WT:
> -		pte |= PPAT_DISPLAY_ELLC;
> -		break;
> -	default:
> -		pte |= PPAT_CACHED;
> -		break;
> -	}
> +	pat_index = xe_pat_get_index(vm->xe, cache);
> +	pte = vm->ppgtt_pte_encode(pte, pat_index);
>  
>  	if (pt_level == 1)
>  		pte |= XE_PDE_PS_2M;
> @@ -187,6 +181,91 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	}
>  }
>  
> +static u64 __xelp_ppgtt_pde_encode_pat(u64 pte_pat, u8 pat_index)
> +{
> +
> +	pte_pat &= ~(BIT(12) | BIT(4) | BIT(3));

Defines rather than just doing BITs.

> +
> +	if (pat_index & BIT(0))
> +		pte_pat |= BIT(3);
> +
> +	if (pat_index & BIT(1))
> +		pte_pat |= BIT(4);
> +
> +	if (pat_index & BIT(2))
> +		pte_pat |= BIT(12);
> +
> +	return pte_pat;
> +}
> +
> +static u64 __xelp_ppgtt_pte_encode_pat(u64 pte_pat, u8 pat_index)
> +{
> +
> +	pte_pat &= ~(BIT(7) | BIT(4) | BIT(3));
> +
> +	if (pat_index & BIT(0))
> +		pte_pat |= BIT(3);
> +
> +	if (pat_index & BIT(1))
> +		pte_pat |= BIT(4);
> +
> +	if (pat_index & BIT(2))
> +		pte_pat |= BIT(7);
> +
> +	return pte_pat;
> +}
> +
> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)

This doesn't need to be export, i.e. make this static.

Also in general this is a really goofy use of vfuncs vs. if else. The
vfuncs are only set to 1 function and this function has 3 branches. Very
confusing.

It would make more sense to have a vfunc for getting the pat index with
different implementations based on graphics version. Then non-vfuncs to
the pat in the PTE and PDE.

> +{
> +	u8 pat_index;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1270) {
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 1;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 0;
> +		break;
> +		}
> +	}
> +	else if (GRAPHICS_VERx100(xe) >= 1260) {
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 0;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 3;
> +		break;
> +		}
> +	}
> +	else
> +	{
> +		switch (cache) {
> +		case XE_CACHE_NONE:
> +			pat_index = 3;
> +		break;
> +		case XE_CACHE_WT:
> +			pat_index = 2;
> +		break;
> +		case XE_CACHE_WB:
> +		default:
> +			pat_index = 0;
> +		break;
> +		}
> +	}
> +
> +	return pat_index;
> +}
> +
>  /**
>   * xe_pt_create() - Create a page-table.
>   * @vm: The vm to create for.
> @@ -216,6 +295,12 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!pt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
> +	vm->ppgtt_pte_encode = __xelp_ppgtt_pte_encode_pat;
> +
> +	/* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
> +	vm->ppgtt_pde_encode = __xelp_ppgtt_pde_encode_pat;
> +
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index aaf4b7b851e2..0ed69abf8202 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -51,4 +51,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>  		  u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level);
> +
> +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 261a4b0e8570..fc976e207462 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -336,6 +336,8 @@ struct xe_vm {
>  
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +	u64 (*ppgtt_pte_encode)(u64 pte_pat, u8 pat_index);
> +	u64 (*ppgtt_pde_encode)(u64 pte_pat, u8 pat_index);

Kernel doc and for vfuncs make this a const struct of ops.

An example of what I'm refering to is 'struct xe_engine_ops'.

Matt

>  };
>  
>  /** struct xe_vma_op_map - VMA map operation */
> -- 
> 2.25.1
> 
