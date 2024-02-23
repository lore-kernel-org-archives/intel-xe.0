Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A13C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D210EC26;
	Fri, 23 Feb 2024 14:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmDqOeHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC8710EC2A
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708697710; x=1740233710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B5dosGU2dnlZZZU9+nhUtgnCjvvvlAF89rdVcpNfTHI=;
 b=dmDqOeHrGuaZlvA2fEbimZSo4iPYdkw2cEfsMp5vsGpHyhEnoF5ZF+eO
 4kEfBP6+8QMoA22OTWfe79b7tn8vs/pjADvuAaFUC01451kb97rcXMF9e
 5jGCjvd2ymBMAW0XLk2tR8Z3xcw8VM2VQghkT5HcmlUs1fwuM7WKpGlBO
 7lUJbmn7UtkKhInfzkk8lLSBWZE16OFKc8uoiYvUzbM2EPblcNPG4uv2i
 J6mX8eDhmHxIX02KA5+FX60x91iu5YIHwH2UIcQVY5nWK43JcrFUulAFv
 XPIZsv87tDwWe5SqMiXH+L9sZkwzI3sio1jkdK87udSwTfAyGtaugHlg7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5958149"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5958149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5896219"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 06:15:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 06:15:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 06:15:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 06:15:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/MCLILfe2P+58GZzDAdy2wlH/iG1Ej6PYp1jL/NiMFsF+NSHy1/TMcNklr7/OWBnX21U0vsHrUp6PR+i0NxDqgxc5YdBGRDu/ATqQH6ZfpciD+OPD9lJOtf0HVB1EGun9AB9ZZOU9OAt/FMPd4tPoQnIBXO+Vwko93jBWL+HQpSirKYjhn3uFZ7bR8f/foVH/RAeUCHr8wUnkjqDPrKIm0HpYGLN8yY+rVpgN/8BucaInD2/GoUeChPar7K4N8/ESNVvhD9QWAjJUS+ZIOZq6hmmy5B9hHEpvrwz0GsE7Fl4BKVnseP82MvCwblIwKN2Z+Ir0Ow85q1CJ4t6C6SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5wOZQXou+JygeqG7CWCB6s2+Sq5sF6smPsAOVFi67I=;
 b=afkWRlc8fWXRY06V+NnjiFV3lobWd9bENdXQVh53iIt++CE+Q1mxSbFPlhJv/WRt0DAkaYrsKvpkyR4VTfTqCMmvmfLC3GTdYUOkCvaNaAzScJc4AEnylNhIiEZBhA1rq22o8FBHvUIa8qu9mr9h9uA6IkEFrfs51eE1Em8o0Vs6/MUE6vCB7pU+4dyJsfj/aH4DalIsVHUyP4t9QbFm4dq86kvWOEHkk9bqSpEJbiNlIaRxVFniPTe3Vfci4BsKPF2T4JqQDrFrZX3+eWdYXYc4YVMX6WbdgGt0cuUghlCqtVxTOb/nvFJEZa9NCTiqkp5+fTpD1uTznftj5nzySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 14:15:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 14:15:05 +0000
Date: Fri, 23 Feb 2024 09:15:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/xe: Cleanup some layering in GGTT
Message-ID: <ZdioZVLRr3iIlf9V@intel.com>
References: <20240222232021.3911545-1-matthew.brost@intel.com>
 <20240222232021.3911545-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222232021.3911545-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: c675b897-8584-4dfa-a8e7-08dc3479d51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tm7W2EXXVlcwN8udeWDEHpEQL09DjGQgUMaWlFsGGS7U338ULah4C+4eRYMbqfjcYZxiZh2I2lzQ1MGHKgtzYuokwZivGalaHidt7PcSHfQK16Z5RN+0JG2rUpKRxcarEy891Ns7X2eI8aXpTx9xghPNO7ydeB/8R1miK//MXoRJME+J6HamtlZ2ML0mxhlu1E6yDZZIa6I7M6LUHGr9+ZPMpFOdwsUwS10Xm82NK+V2E1gaJguLDOrBfN9jHUqCPLxOa0E40VYoVmiQAN9nHxE3LofcJJ0Ti4/6cBXKCjA9dCHz/WY3fnhvD2zyWOwcWXmW6oJhqKKKW4YpkhvXRzOJmFEuwhbeXLVEysYNKI/pJtkb94uJkSEnzFz7KpWhb0DZuDLtkrU/KfyYlMtSHEtLRTYkZf0z5FjpfF2tCAxyNN0cmP8PWy+aCgG9g6rRNyiGozLRpTxLDMwLO2bJBm7YJqGGtUE4P2d6TxnltTpUTGQECBJm0x/3Uf1L66Q1p5KrDPl/PYUicUTPk+FXC4EHGSSbjigS7vUnkTOhf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGH4NJU2fAHO4luZk2WO1E4AuPWhBEV8xGKUoueZjvRUeNDTsq5iil8Xflm1?=
 =?us-ascii?Q?b+32Q8EtcqkwVOqz1lZMcM+cTbRuVPhWMoLVxPORbrtcy4VFw2+dZ2qMi1Nv?=
 =?us-ascii?Q?wIao9COWYYmt1cPLbjxDYFRIxG+0EZb0YHS7l0YcQ1dvJ3h9Sr2uimgFMF2j?=
 =?us-ascii?Q?40SZYT0yja+hWD0mEvsNp/yatGnfJ45ioczmz8QbUUmi93cNabN0rKqfL38Z?=
 =?us-ascii?Q?219vDtcoEw/jv3MVk82Ngg2c5AJTw+ieQB4BKfbNAbSkuW+rhxDzXSk7q+jo?=
 =?us-ascii?Q?1SaI1ihrCveIA92Uf9iL2hySmnmKnjvs3SbHaiXd/xvSEV4NLWTbvtMzvKaD?=
 =?us-ascii?Q?+iXRbdHWJn1ucQky5ViDMFFK85QyHwxeMkui2KlYVpR0LZzeIK1J5B29vx7m?=
 =?us-ascii?Q?hn6JFzl4IPyiuWAvXYPVyjQQ/M4IsrP0TO6QxI5tSxJo85oxCftesZGqNhT0?=
 =?us-ascii?Q?8tAflEqT7U9A4ntYz8PXVIskAlMESyVBgB0jbSJSAzlZaUG7mSh/J3bfjN6o?=
 =?us-ascii?Q?HkuwmGmbpq4FfTBC8C5MdX8GXWFvsG1qi2Nv1cogI/P2MbN77l8Hwskk8muY?=
 =?us-ascii?Q?YunrsLTQCvzrv2iFS4b+2LEnq5cI1kBpmCOcGdz3Eri0dYgv3K+/qP4QVFF4?=
 =?us-ascii?Q?s4+xecQwfr+Hjt8sA/3C2StkjTzdeNfE6aItthZWMqp1FOJyNM+zGElPGvna?=
 =?us-ascii?Q?1pbIkhvCHYUpj7ji7nqR5R3YtTFUM6sqgwrzIdJrUKJP5t/4cAfyDAbeDrEx?=
 =?us-ascii?Q?gsHmULgbp+qHcK/q0Q1/kfWEbywzCSVLfgOlrsfQwKHNzeUpjSjJKaz2rSe9?=
 =?us-ascii?Q?z6DyMdnIQ4J9rgE698xuFqQWAK6M9x0bS32OrlpeDZu2wM+OaLj/WbgApd6S?=
 =?us-ascii?Q?QNCY+yiwJdadcy2EICdhPQJo70u4uA90l5xjC/AL0Y8IlS/EdorK5LQEGmJu?=
 =?us-ascii?Q?xZy8s/7zwjNZSOwATQajVpBTbQVbgEI3eQYl8svl2087ObAiDLHJolYtQMaH?=
 =?us-ascii?Q?HXY8lRBbMoTHPR0eSki/yaHSmhX5Yzgmf5MSevThJKLr9aewHrJJQldfHOat?=
 =?us-ascii?Q?IvQALGab90LBcGLT5dVQoYe3X4iTw8BQHWAGg89Y4+OE5xrqKhoVQt2uV84a?=
 =?us-ascii?Q?6KKsrrG4AcjryRUN374wAwhtgoGAiophGtKARzAQ+Lm/gstXyJcc6z+Vw4rE?=
 =?us-ascii?Q?29pUpLR0yghBbr+P6f6kVDvdYsC21x5NizR8OKFpy7OGzgNbMV8hdq39S/j6?=
 =?us-ascii?Q?A9WYuSo4dSjLE8hCOmd3kl7tIDbLHh4UIH+PYL/+mOAVJZvCNflpIjzpL0HX?=
 =?us-ascii?Q?vcz5LEvVnUsPS+Nw6q3wxxxDbjxWpEFe7NLyHFPVmgT4sIzm0xDD95RH4b5s?=
 =?us-ascii?Q?Ql38XzUbZ3n9bhn5+Pp9Wjs3ibWSWlPTBMrWEoKyNlgwUz4fVc1yFMsnqldX?=
 =?us-ascii?Q?qHD2FHeiJZDsjyuJzbeF0eyIU0lDCFxygUZCg5NOH9Qc9p7/0Lj8NgLEtRVo?=
 =?us-ascii?Q?FFGr8Om0amewiaXrpSe2S6lGg9JoOnClSdXif7eJbhLv3UndlZ6RZ3rzCEqW?=
 =?us-ascii?Q?BRkh/OUC8NPERpbY1u1hsv+CqjUn3LfoydV5R400rBLmkwDquvkFjAJYoIkv?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c675b897-8584-4dfa-a8e7-08dc3479d51d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 14:15:05.2912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEr8v5ZIoob+PYVJLuUslrR9Ag0RHF0aCA30biB7Bf3hh6VicR56leU4L8aUF6XX7rFCei1rme0lz0J+tJ5kwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5508
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

On Thu, Feb 22, 2024 at 03:20:20PM -0800, Matthew Brost wrote:
> xe_ggtt.c touched GuC layers which is incorrect. Call into
> xe_gt_tlb_invalidation layer instead.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h       |  7 ++++
>  drivers/gpu/drm/xe/xe_ggtt.c                | 37 ++++---------------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 40 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +-
>  4 files changed, 53 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 92320bbc9d3d..4e7f809d2b00 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -110,6 +110,13 @@
>  #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
>  #define MED_VF_SW_FLAG_COUNT			4
>  
> +#define GUC_TLB_INV_CR				XE_REG(0xcee8)
> +#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
> +#define PVC_GUC_TLB_INV_DESC0			XE_REG(0xcf7c)
> +#define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
> +#define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
> +#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
> +
>  /* GuC Interrupt Vector */
>  #define GUC_INTR_GUC2HOST			REG_BIT(15)
>  #define GUC_INTR_EXEC_ERROR			REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ab96edb058d6..5d46958e3144 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -19,7 +19,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> -#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_wopcm.h"
>  
> @@ -249,15 +248,11 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  	return err;
>  }
>  
> -#define GUC_TLB_INV_CR				XE_REG(0xcee8)
> -#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
> -#define PVC_GUC_TLB_INV_DESC0			XE_REG(0xcf7c)
> -#define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
> -#define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
> -#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
> -
>  static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
>  	if (!gt)
>  		return;
>  
> @@ -267,29 +262,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	 * and GuC are accessible.
>  	 */
>  	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -
> -	/* TODO: vfunc for GuC vs. non-GuC */
> -
> -	if (gt->uc.guc.submission_state.enabled) {
> -		int seqno;
> -
> -		seqno = xe_gt_tlb_invalidation_guc(gt);
> -		xe_gt_assert(gt, seqno > 0);
> -		if (seqno > 0)
> -			xe_gt_tlb_invalidation_wait(gt, seqno);
> -	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
> -		struct xe_device *xe = gt_to_xe(gt);
> -
> -		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> -			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> -					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> -			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
> -					PVC_GUC_TLB_INV_DESC0_VALID);
> -		} else
> -			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> -					GUC_TLB_INV_CR_INVALIDATE);
> -	}
> -
> +	err = xe_gt_tlb_invalidation_ggtt(gt);
> +	if (err)
> +		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e3a4131ebb58..48bf5fdb0fbe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -11,7 +11,9 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_mmio.h"
>  #include "xe_trace.h"
> +#include "regs/xe_guc_regs.h"
>  
>  #define TLB_TIMEOUT	(HZ / 4)
>  
> @@ -210,7 +212,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
>   * negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
> +static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
>  {
>  	u32 action[] = {
>  		XE_GUC_ACTION_TLB_INVALIDATION,
> @@ -222,6 +224,42 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
>  				     ARRAY_SIZE(action));
>  }
>  
> +/**
> + * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
> + * @gt: graphics tile
> + *
> + * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
> + * synchronous.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> +	    gt->uc.guc.submission_state.enabled) {
> +		int seqno;
> +
> +		seqno = xe_gt_tlb_invalidation_guc(gt);
> +		if (seqno <= 0)
> +			return seqno;
> +
> +		xe_gt_tlb_invalidation_wait(gt, seqno);
> +	} else if (xe_device_uc_enabled(xe)) {
> +		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> +			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> +					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> +			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
> +					PVC_GUC_TLB_INV_DESC0_VALID);
> +		} else
> +			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> +					GUC_TLB_INV_CR_INVALIDATE);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
>   * @gt: graphics tile
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index b333c1709397..fbb743d80d2c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -16,7 +16,7 @@ struct xe_vma;
>  
>  int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> -int xe_gt_tlb_invalidation_guc(struct xe_gt *gt);
> +int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  			       struct xe_gt_tlb_invalidation_fence *fence,
>  			       struct xe_vma *vma);
> -- 
> 2.34.1
> 
