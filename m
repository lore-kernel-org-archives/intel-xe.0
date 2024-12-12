Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9E9E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2910E059;
	Thu, 12 Dec 2024 03:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8/kFjAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436C10E059
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733973229; x=1765509229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0YMndgw2NdB8ei3PRQNZPw4krZ6LDvSFSPhZ8lj8lk4=;
 b=B8/kFjAu3eul89upW8poX9OSZMnA7a5D18seVKtONB4Wf9xa9TSOCHjZ
 IKPbO7jKn1AK0d/Upe4VrkmeA+KjJomWZCOOEOqtCudhXvSEHCpKtd9wJ
 l5wmzZZnwIUF8zvhxSAW4wcwop+c9tY8bVUh20lU2r+f3w68fPK9inrSv
 WzI9grByOCQ1+ICi7kg76NzXcBcRFwEUSAqA5I6Vg0g69rfi62AInqTFX
 0rmBNOyRefbNxyT6259lryPYKrIBg87U0+DGIx39XSL5IAJ72KUT8slnl
 LdN+ukjmjK63RL5MXUcFDAMQxP8Cjyl47TTJpWS/GxzKWLi2QdTBeYl/p g==;
X-CSE-ConnectionGUID: wdXCTjp/SH2lRpV8w7nJeA==
X-CSE-MsgGUID: GEwnPAV4Rbi+YBErrSki/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45387933"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45387933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:13:49 -0800
X-CSE-ConnectionGUID: uPLpH8vkS32TGE4zfJc99w==
X-CSE-MsgGUID: i9a+REvXQeKbYpQ59uiu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="95839064"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:13:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:13:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:13:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osnhk9DP6beQKNDBwTOhqbgA9tVi91ElnuXLufE9XZGMFKvcfCGwEcWhVsh1v/m+kLC4kh5aC6ngTyRt8Ll4MStyHXfLFbAETdMvW4XMxthc1oWdKVoqqdTmhC4rCdfb1PZ1qZQ5ljmEgXIt7/jVDaZwvwZezMhtvL+zkv1Aloj3oauF4eD2X5WLb0dkA2baeduuFeKHXc9YTDCyG/Ab4TyXT/90hkTD7Gs+7EG7+wQWKMtuOhfYEzjH3nhjj/P2ZADPLdeCbmMYu2srOFCL0ijblzW0W4Z6t0qrQOCR6BXAnZgTX1oRUW+eKef5K8wN4QK63PAuNfiIwAyFLnUyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g095JpV0bGVIXPxQswexYkbdYyDl/QN/zPPLHv9IWd0=;
 b=qh837D6KFEs/SqoFm5FkfGrbN1TbKC5sVLLBtrzRrpyQvZJRh/qL9sKVS8n6Od9o8Sbzb2+37zWmZTvaKg3XjRQxDpFNq2l/xeY/91v79RGqLvyPAVCB0E/XBbQqqMboTTL5pLGxGFGYJFRV59lB+uhxZtZSRmFXH+vPpLWUnYGCCalalIJBm8rMnIStJIK4cNxk/q0H92CSp3H65lwcS1Sy6jV4IOV2AFG3iPLBAPjJ2PTiffwWDlrXBZ8teYOqmcSd0h3ana2XGhAfMJnpfglkbaQl8QcUUByp85zYBp+nGCqipwikUaHkyEQFFfwXoMcNe19i4/yi34XOWVlDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 03:13:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:13:30 +0000
Date: Wed, 11 Dec 2024 19:14:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/13] drm/xe/sa: Minor header cleanups
Message-ID: <Z1pVA4ZFJsk/huyf@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bb71ea-12c5-4264-43fa-08dd1a5af41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?edpUNQTSI0nwI7YDD4iRQPdVj2o/TqwVfSKEU9LCQClDKSQJCrWlZcsI0jCG?=
 =?us-ascii?Q?dvieMx2ReN4QWpbHb1EDFASKabEkdVfCCGeMWgNhqSVaR2tlhoOzt0Hw9vSg?=
 =?us-ascii?Q?0U8CsJo/mQWTPiVERZRDP6zejkoJG2QhXM+n1OGA4nuRpFGfLVjHgjiodF5s?=
 =?us-ascii?Q?fWn6kdEFclzB7ju6P8Kx/4mRbujugmR5dRBGpy/lt+vQla099ouaFi+qfiXL?=
 =?us-ascii?Q?kbqYE84XSqEdf/IxVMy4citV3MJM3mNRPz8WTrpENwBeeS0duVklpcNIxJie?=
 =?us-ascii?Q?nnEVwGoAah3azq4t9Dp3VnTGvCOnPknNkHFIdjQC/bYRizzR/kIAUYDnfEnh?=
 =?us-ascii?Q?/X5tFjB0Xxk+vp/X0dE8CdOvmLZ7PCFFnAO4a4IyXlSW8Lx+RZYW28HWJsD/?=
 =?us-ascii?Q?xrs49PGAduxHDpx9tqKFOh6vZbiBK7nlFhrWbxFeoCu+DmXapJ0J52TybgiN?=
 =?us-ascii?Q?3rkD1wwhS+DZzFDqkLRF4etb2kruMb0VcKKXAJBcbz9W32j+IRZ22Lvf3rTE?=
 =?us-ascii?Q?WbPpjbV9BDTxslPZuz/grYi9OXeC/PzZ4WXZucAjJAEZXClt71fLYrv90xGV?=
 =?us-ascii?Q?eUQWVO3x9+SUWwvhFQh4/YoAnnbT8fZXHxnHP1lMJKSYwr7BiqrxTjHmQVIF?=
 =?us-ascii?Q?WX6Qjz6CiPD12Gh9hVDm+mDacY7uF6BVb1yJBR/qQg5R7mL0xFFxUoYABNrr?=
 =?us-ascii?Q?HEJbAJCdQ0nfZtWBlJhQYCZ+4NFyg4s65PykMIfy4v8T9Lyu/Hf2FROG1ip3?=
 =?us-ascii?Q?N8YuAHRYWa2uFWS7ra2dM+Ayi5R8IEojBY37mZXiEK4ovAuHid2nWArO2Ld3?=
 =?us-ascii?Q?8OtNSgtnSKGQ8pMAvTuoICYWS7QRbOEILBYvlvwQBgm1QU/ZaFPqSEFtFu0/?=
 =?us-ascii?Q?ui5UQm8Qp0HkNG813IAEw5JVoPHyFxy2TXwTf8kN/KiAvi+QI0oV8Aw1g5Gn?=
 =?us-ascii?Q?JtRleqFiXkdwp5h8d8wMMi4ZeoC5mVLrAqy3pzVduHPfjQS/ljrSMbF7heSu?=
 =?us-ascii?Q?GhUCOftCYTzZqcackTnP5QVKoLyUECFSpdz1qYLbbAk/YasDo22JsrjxMXaA?=
 =?us-ascii?Q?6S453A/86vtZTKbEqW+t1GvhB2yq5kAyPPQJBGTZEuMdX68GE+CmtjJ4t5Vm?=
 =?us-ascii?Q?qyC3pn7v8ZZcxkpYqoTM7gzslxQ4O9vuDPrpYmhwD5bAaPnbHKC8VS2RwGVZ?=
 =?us-ascii?Q?nGn12I/kFTCisq2i+dUQnjCMzLvQz2aHOtANsRyKMHC7i5lTevDVShN3pTIR?=
 =?us-ascii?Q?7VF9DpM6KUayTfYC6eNh3TMox/wZTaVId5h0ZQKUIuJ1UjRtB3rqp4Wul9Jg?=
 =?us-ascii?Q?6HRA8S9tLGEXhCr+Di8cviHhWz3chQh2Yv7TXn3FwqnKmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jssp68eXjNG9TZ3wOXp94mIkm5YGTs0r2+Q1R8qE5KttFYH5yDhsKAM9vr+f?=
 =?us-ascii?Q?3STqIEwaF1j8IH+NQikTlMs0CvHEqsHQRKlbxRhaMe84VEXM/5RbvVh3WSnG?=
 =?us-ascii?Q?sfl4FZM1dWYTJtr5V3U+EGTRjZ4lLKXY63isbGR6FoRHGJztfB83uK3i6izb?=
 =?us-ascii?Q?AjJjcq1CXQutbeLkS858hRf9Hbq7or81bapxQK020I/Pk+aJOE53gmlpcTRQ?=
 =?us-ascii?Q?0fCV8A58AmFIni82mSUoCI+AsWbTWuZQa+3lOITAtPMThjY7csXqCz3i3fgv?=
 =?us-ascii?Q?XVMAo8qr+yQHPYJAEyisqJ3gAhF2cekJOh6OBoUVCf6IWhBrsGRuSWeZYsfv?=
 =?us-ascii?Q?A57E3arGRuNdeph2IJU+x0aZRfen9hbBhzrjO/MXNTqMf8vZRguIKhyMA4Q3?=
 =?us-ascii?Q?U0byUeOnr0ppFmM4Q4OjL0vj65rxY0OgdSxjqRs8ksTq9i3t8xi050fXx991?=
 =?us-ascii?Q?3Diz+lMeNMfn1J+hYotbw/SeNZVFMdHMOg4KQ5VV0S0wy1cgTSEHtrytJ3hH?=
 =?us-ascii?Q?8J0JwoyleJyE6/2+ZVgyeo51LafCX0n7LjFGXJbnqrUSDk3FsUrlRNI8FvHx?=
 =?us-ascii?Q?oYDjdyKbhHEpv1mmJOYYTQ5O9ALG6/OyS7dPRfwpCRZuq0tb5f6NBaAQePBb?=
 =?us-ascii?Q?vKRizp/kBf9R3ftDTTKsCX/W7LEgfDMTyHycVYOGI0PSyFEJ+QdzUyIHj8f8?=
 =?us-ascii?Q?SWoLwHv4Bp3Co9EHmGd7DtOgBwVlJdmNUO70q6X5Sh+DVSEBeyqiiP6owocR?=
 =?us-ascii?Q?XdEv+FUG2APvqIpngNl7LwgCQR2mMzwMTgRdRuQWu+5D4rLX720M01Qm6PCt?=
 =?us-ascii?Q?0gshdLvxBZww7LrbotiDydQn+XjOBwhlsUXJytNv/C8qHTQrBnhr7AmGhYZp?=
 =?us-ascii?Q?vgPA9NmardrPinPLORJpiax9ZtCV483hyaTq6mrwPVQBgXPz+4TW/oKREV4R?=
 =?us-ascii?Q?goMr7I7zHOWa3Xr7BL+Jb1ATRhW8itLA3nsVciNyJcqI5ODU5ISM6Bz9RZqR?=
 =?us-ascii?Q?m07uE3WuCIzmbyt2w1+RuV1LT7E8ZDaS/fstjIbZ8ZignmdK5uKWzDQIO/JO?=
 =?us-ascii?Q?tAzkFUHbNRD4oB1GvuqiI79qsInb315Uft1rj6dpn4D+6Rs8OjAwv1ShZTHQ?=
 =?us-ascii?Q?6fNoVyyjBL6VPJhWxxw7DUUppZ6U1Dw0H9Tcfo0E+ykkD2EtnkpsRYtGj1qc?=
 =?us-ascii?Q?jExQSH4+v7cHTzACneJyeSOatiDrun4HyMP62bycEFSYuMBmyIEJmzNgzs/L?=
 =?us-ascii?Q?XaGjL6ds9ccr8DPjjUcvvgS2gbfYhaDO8JVyL6SNDS/lbGzyw4L0QC4dCQHb?=
 =?us-ascii?Q?euNQ7Om7MVp0BhPk2Z57uMIGq/DW0QsWosGauoREPP4cp7W8MFmpZf2LdsZW?=
 =?us-ascii?Q?KPIhKiO344G3msRKCJcuLfVwhOio/yHgyi4BxzfvYHVy9rekQn5tPUxJny7x?=
 =?us-ascii?Q?xpeFHc641phsmemiop28FlfK8f1nmPwqFXFcMB87dCmsK8+rX1bAcYL7eCXt?=
 =?us-ascii?Q?ZE+pSYWONWty6SUqrLjYxGa6iWR3BnTVEJOgQ3kDlduBBk3NbAdoGs1HgpOf?=
 =?us-ascii?Q?aA1K/Gj3Hz+ZTufQUoUBudDUA21caDfdNgNaqfyhZFX/4mXQdpFwpizbfw+n?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb71ea-12c5-4264-43fa-08dd1a5af41b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:13:30.2083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXVHPNE+PiTWxpM/CPK3QXH2n/0Om8TEjLljJgnkN1ZiXepToQq/IMBXTNcPoJVSRf2dZQm0nAzzeWipH1KbIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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

On Thu, Dec 12, 2024 at 02:01:37AM +0100, Michal Wajdeczko wrote:
> Drop unused struct xe_bo forward declaration and, while around,
> fix unnecessary line split in xe_sa_bo_free() declaration.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 9328b38eff6a..83581b427ea6 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -10,7 +10,6 @@
>  #include "xe_sa_types.h"
>  
>  struct dma_fence;
> -struct xe_bo;
>  struct xe_tile;
>  
>  struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
> @@ -27,8 +26,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  }
>  
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> -void xe_sa_bo_free(struct drm_suballoc *sa_bo,
> -		   struct dma_fence *fence);
> +void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
>  
>  static inline struct xe_sa_manager *
>  to_xe_sa_manager(struct drm_suballoc_manager *mng)
> -- 
> 2.47.1
> 
