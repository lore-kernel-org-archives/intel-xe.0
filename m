Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769ABFEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 18:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734410EBE0;
	Fri, 27 Feb 2026 18:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLw9zLjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BB810EBE0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772215589; x=1803751589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pEhbn85O3NDNWuiAPx8EW9mm7NvH6jDWvJMUqHSH+ZA=;
 b=HLw9zLjWo+1/Elnugb7aFVPiIOQiUc3/vlbCHXgCsZ/iRWR5UTZOCXqE
 K/QhQVWzLoUEjN8CMtusoKPM7UwkJKFdz1Pcf5aD0n95POa6qtq7N96lR
 N6GuVmqxB5HpSELfQTBmwsJXK0X5wCZ7s3mEbB7aqsRTMzV5rnMoXu6Qy
 iSYwF7Jt1sDaxUTD7PnTyIjwXZGqrYpY2aff7sVHrLdAaWyC1c/VUJt4S
 Bs2v1KuRpzZ6bDpmwoEMQKIjZ38oQYqvnvukMF7Hqjf1ScxbaeY02SWzP
 9wn2WM9EpDe94m63bhGXStslTQoRkqlrj0iG7W0gy4cZnKXdFRIU9K5HK A==;
X-CSE-ConnectionGUID: d1zAHs29R5mcogkmp9JLow==
X-CSE-MsgGUID: u6g5/2U3RZOuL9TZUuqqbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83635219"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83635219"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:06:29 -0800
X-CSE-ConnectionGUID: WsiywVYWQFeI2UIm/m7g1w==
X-CSE-MsgGUID: 0vdHnxjfSaSnRvlzqBeoGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216200622"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:06:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:06:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 10:06:28 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:06:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okWGoXM7PlG2s9HMfKJrMNMp0aMAONcm4rLP+IDKSjnXXliaDeXz4ASwwekbsZRHjaygHBtyJsFhoxM92if/pWMuVrlegjaIp55hQv42v6LED+r+DJEo4kBcZWnEuh7OIunG7J2LBrmW1ElEuHOPBc/IG7VHskfnW+WdgPCmdbQT5ziiwWdovJD6fiRICeCnOpovJvrPB8can0w5lMmCzL+N6tNLaboxFLwLnPHl09i8tyzYfDHSUoeBxbGnKRFgYzZ4zLpyKYJ9ieYb6DJL6KhDAofylOxoraQEvdpmMXCwo1/s3nStaVfPSiSGQQw4zVpdwEf5CQ4Z2mIfD+pKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClVba8P3p/aAhLJxifrtqouRlJi6WoQ7N1iJcza34Gs=;
 b=oi4yfFK/8+jeh8F7F/6+YxNEZwtaoaYE7yJGDQ/+0xsgEF7Mxuupn+yGFG8wJfJgQmA4N5COQA2icVtK5/zZmoZ5j6XHSWkjA9ZLByaW7S5OtpZbX6rNwi1kPZUebJJa1Ddu2jxhkElYfhmPEoczVaPiA1p9WMg5oqxSt0SyIG7X2xb7OEouCUAsAIyy+fyk3M3BH8oUYOfnkKjU76dPCvGGq6p0zu7u76744TDk9HYGKyg/sQ4GvkFXWOYFZnrrP6FWvZm6Ra1QIvh5y/4lLnxSUKze3hdGWYogn0b1fh5dtJX4amPQYtyjM9zUCKLiAa7BXp+Ahm1tKxMlfqEbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 18:06:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 18:06:24 +0000
Date: Fri, 27 Feb 2026 10:06:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>
Subject: Re: [PATCH v2 6/9] drm/xe/lrc: Introduce xe_lrc_reinit()
Message-ID: <aaHdHSyXmlix/rkl@lstrano-desk.jf.intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-7-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227170049.3418863-7-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa41ca8-9d3d-4dfb-6869-08de762aeb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: HLKDeu/Xo4l4EUvCKBzvGiyE3CNCjiJCFmOsIm0sHu6YRpE+qbQ/+xOBiR/OfIemIHLa/Wg4kJe0LEguM//w0v6sKpL9k3lTKo6DGTMqdBoPa0D1RVHHULaych6JaOCvDWzg6eQXXaQ2iMe4MjLR629RMnl3T1JTVJBfjHoA2g95PpBBGIjzMwARhhmRqPo5S3fSArJs5dTMl4MWH+EWV+aQKWnx4TyGbTVU+tiVciTs2NBdSCN2NAuLzYtYThwH6E4GrTp4So4unr4Ec7HGZlk3K45FsENxK4XwCx7yOcezVPwh0p7UMLDXcUt/mgwGp6Ezr2PSGi0lpYxNPySFPg4//YgG2lmiozl8exOVhY15tvobyOzsTLUvniEDQrKGQ7V+ABR8n17n5k7YqXVNGHKkTo2ARYK0/ekZ+RuWntmrJvZqwzCFeRdGjmqMyBf0sRrX7zWRFHDSicO/kHF80CxFxEGD4/F8QuuVkar8Q6/1by8/nNfdcY/2nD4Rpr3uvVk6OXpWnafIbPa17R4BWzhP1btK2fXIi+zmwWa6VJZJ5cSQNOXm39hJLw2TwFMtVOQ0CVdYendUI99oVkYYdQKtjIRJjjFjGoOnkOewJtjtbhuKVRRS2eO/KVA2kGbiuI6gejm429vzv0SRnUedVIFATGh1r1w7dq3joXgGzi9SsxGrmg0BhzEzjVLIUnx+ruGS3fKkNaWfykgHA7aUuh/YExXPU1gCvDINo7lt+Dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2ZAyKrIAwkqRptYpKYbUB6ao+R7TSJcHg9UxfcFK2vg9s2x6vlu0Rq7UPPx?=
 =?us-ascii?Q?qocqU5Q7/knPI7xYyDk47ZUk7a480SfsdflfZh9roeSReRlntFhcqq1F6QMx?=
 =?us-ascii?Q?LzHDHpWP5aeeq6E0Xrd5axc2G6kDf0CAM+heKVVlXEu2jFFGjbAXuiHkqKvs?=
 =?us-ascii?Q?NGeBYnR7tfiqeS6q4CMJpTLAUOnvSymFDunxybRmm/eGBenRkPS6rTqEE55J?=
 =?us-ascii?Q?+2vB40mKDKmzSnZeQ7bl3UKNT9AGfJOoXhEGDePiZJ41zxDKLYq5trPPZcac?=
 =?us-ascii?Q?R2jsJSnvv7oNChN5Si+AbMoFtKKy+o/uMqg23Uwtoxs+0eNrp/FJM7uqcH1E?=
 =?us-ascii?Q?+DukyIXEdC14ymZCSNy1KOGfed+vIG3ivz7/NUz/ojUiswrU9SxFSwAe1Aa7?=
 =?us-ascii?Q?oLFZB4+/by7201xPfjd/cyhXMu3MuJeLL7lcVI8Ih1GQx8gqPKU+XQqzOv1D?=
 =?us-ascii?Q?WkTiwCY36ohzA3z/oEtSVzcuAbDuwEHn0DvC1f8LwlF+rw+m0U1N3f5Kt8ne?=
 =?us-ascii?Q?CeTGhlDcgpaGUD+LaUYb2O9/KU08NVNEhuVT/E6W1ExzEU51zcEq3Cvmj2qN?=
 =?us-ascii?Q?e/9WepokLw5hwm/jokqaS84GS98Miopamd/NKVRdVuIp10rX7KErXODeHVxy?=
 =?us-ascii?Q?Qajw7avWXOlky8axmUAwMuNH0hO22A1iW7PudSSm2VQZ9qULJesMKvXHumHR?=
 =?us-ascii?Q?0lWA0TqW0GOY6pzn7BWk7Bxhs4eEjmBXPk5XCmaqbjtJNSLicv7resR4rB+v?=
 =?us-ascii?Q?/UpHTqc2Yaj4YoXgWPEUSezYteryEo9hjdOMQa31c8b02ZCt2JhCiBvx58zE?=
 =?us-ascii?Q?tPtPI0ZzEz65gbygwuM+dqUQwr5kMhAMlVMnmNqRYdyBw3aEK+TfuHL0Nysg?=
 =?us-ascii?Q?VSiMHgiYJkX8MFOGFt+jAd2gyQ84iEJq8TAG784a4pYPACMa+khX2j2N7Hjr?=
 =?us-ascii?Q?n14bNNW+gv9fPz6oz7vQ5urMpLdeQyYnDJyuQRYDeIaJRuoAVrKWUkCC7tCI?=
 =?us-ascii?Q?CBCkfOPXyyQFI2CBL9HF6zQZdPwLmKmFPsBbyDHmi+bfivuQnN+buAwRSxvz?=
 =?us-ascii?Q?8+gPOevyFWxolPDZAAckEQrB/RYp+5bEEJ6stX0yzN2uKoHSHuIjUOQzMf2C?=
 =?us-ascii?Q?3GZfbei44Yi18GreMkgFk1H3QKhYwYkZYwvDHT2U0EoUQFl7svc4zC8Ywa3K?=
 =?us-ascii?Q?he2LWrK3b49uSxW0AVoCK0urXlN69mhwUb2dBbG9qdMFDBjvrML93jyysv/F?=
 =?us-ascii?Q?9QmNThu35GB+PeEqUIJD2Oy1kgdxUuuXeZNI0PaMjAuzVAV4gbGmix1UFalA?=
 =?us-ascii?Q?2CJcJm7T5leDSrtox2POk8lEWQPogsaTiBP/oBgesZn3eD6+n/HoxW/sNfKW?=
 =?us-ascii?Q?dZfQ2+6csQB1el6ZGb1guST1VquCiuO1P7orSsvKLKtKaMIw3CmAPwhcVerr?=
 =?us-ascii?Q?waa39F607LdmfmDcBoBl8OwBtR1lJ8kuAf8nyrz8Mz2SevwBEUIZS3YbJeWQ?=
 =?us-ascii?Q?Ws4KKojwGjETvPnqZKIfJl3/uLVvHDNfN0VBCCuSTu4cWtCoAyRnriuU6l+Q?=
 =?us-ascii?Q?jdY10nww0tnHGYS4OGg1k3rRuQuK9YbOVQ+9WVYyXSmw+3E0GcGQ4fDjQxRt?=
 =?us-ascii?Q?0n1v9HbrMOPpTAWdM+YaRG45K7UAuOEu/VLLPK8sYOpoEedcTLgiADGbjXv8?=
 =?us-ascii?Q?x9xD2AfAIomJvaEJbKVfjH+wCEXg8y6A2tecU2hi5xBVEP5DcUICyewRbtTX?=
 =?us-ascii?Q?GroLd0hgBjwzoO7UayMuJYW/C/mEGt4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa41ca8-9d3d-4dfb-6869-08de762aeb5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:06:24.5073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp/4cxNL1YYAeevmYQrVnsBn6NN6Q6CPYucAlFajJqaES9YgT9rm4FLp2ND8ygH00fgt1LdHkk91fmd5fV/Lhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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

On Fri, Feb 27, 2026 at 10:30:46PM +0530, Raag Jadav wrote:
> In preparation of usecases which require re-initializing LRC after PCIe
> FLR, introduce xe_lrc_reinit() helper. The LRC bo already exists but
> since it's contents are on VRAM, they are lost on PCIe FLR. Recreate
> ring context as part of re-initialization.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Re-initialize migrate context (Matthew Brost)
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 149 +++++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_lrc.h |   2 +
>  2 files changed, 90 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 84360fcdf743..9fc8720f62ca 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1438,65 +1438,16 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
>  	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
>  }
>  
> -static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, void *replay_state, u32 ring_size,
> -		       u16 msix_vec,
> -		       u32 init_flags)
> +static int xe_lrc_init_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +			   void *replay_state, u16 msix_vec, u32 init_flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> -	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_bo *seqno_bo;
>  	struct iosys_map map;
>  	u32 arb_enable;
> -	u32 bo_flags;
>  	int err;
>  
> -	kref_init(&lrc->refcount);
> -	lrc->gt = gt;
> -	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> -	lrc->size = lrc_size;
> -	lrc->flags = 0;
> -	lrc->ring.size = ring_size;
> -	lrc->ring.tail = 0;
> -
> -	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> -		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> -		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> -	}
> -
> -	if (xe_gt_has_indirect_ring_state(gt))
> -		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> -
> -	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> -		   XE_BO_FLAG_GGTT_INVALIDATE;
> -
> -	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> -
> -	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> -					    bo_size,
> -					    ttm_bo_type_kernel,
> -					    bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> -
> -	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> -					     ttm_bo_type_kernel,
> -					     XE_BO_FLAG_GGTT |
> -					     XE_BO_FLAG_GGTT_INVALIDATE |
> -					     XE_BO_FLAG_SYSTEM, false);
> -	if (IS_ERR(seqno_bo)) {
> -		err = PTR_ERR(seqno_bo);
> -		goto err_lrc_finish;
> -	}
> -	lrc->seqno_bo = seqno_bo;
> -
> -	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> -			     hwe->fence_irq, hwe->name);
> -
>  	/*
>  	 * Init Per-Process of HW status Page, LRC / context state to known
>  	 * values. If there's already a primed default_lrc, just copy it, otherwise
> @@ -1508,7 +1459,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> -				 lrc_size - LRC_PPHWSP_SIZE);
> +				 lrc->size - LRC_PPHWSP_SIZE);
>  		if (replay_state)
>  			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  					 replay_state, lrc->replay_size);
> @@ -1516,21 +1467,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		void *init_data = empty_lrc_data(hwe);
>  
>  		if (!init_data) {
> -			err = -ENOMEM;
> -			goto err_lrc_finish;
> +			return -ENOMEM;
>  		}
>  
> -		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
> +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc->size);
>  		kfree(init_data);
>  	}
>  
> -	if (vm) {
> +	if (vm)
>  		xe_lrc_set_ppgtt(lrc, vm);
>  
> -		if (vm->xef)
> -			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> -	}
> -
>  	if (xe_device_has_msix(xe)) {
>  		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
>  				     xe_memirq_status_ptr(&tile->memirq, hwe));
> @@ -1602,12 +1548,93 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  	err = setup_wa_bb(lrc, hwe);
>  	if (err)
> -		goto err_lrc_finish;
> +		return err;
>  
>  	err = setup_indirect_ctx(lrc, hwe);
> +
> +	return err;
> +}
> +
> +/**
> + * xe_lrc_reinit() - Re-initialize LRC
> + * @lrc: Pointer to the LRC
> + * @hwe: Hardware Engine
> + * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
> + * @init_flags: LRC initialization flags
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags)
> +{

I think you likely want to set lrc->ring.tail = 0 here (or in
xe_lrc_init_ctx), right? Alternatively, you could set both
INDIRECT_CTX_RING_HEAD and INDIRECT_CTX_RING_TAIL to lrc->ring.tail in
xe_lrc_init_ctx.

Consider the case where a bunch of work has run on the migration queue
and lrc->ring.tail ends up in the middle of the ring, then xe_lrc_reinit
is called. The next submission on the LRC will execute the instructions
between 0 (INDIRECT_CTX_RING_HEAD is set zero in xe_lrc_init_ctx) and
the lrc->ring.tail value at the time xe_lrc_reinit was invoked, which
will be stale or invalid if VRAM was clobbered.

I would have expected this to show up in testing if you ran something
like:

xe_exec_basic;
echo 1 > /sys/bus/pci/devices/<BDF>/reset;
xe_exec_basic;

Otherwise this is good cleanup adding xe_lrc_init_ctx regardless of Xe
PCIe FLR so if we work out above, feel free to post this an independent
which we can merge ahead of Xe PCIe FLR.

Matt

> +	return xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
> +}
> +
> +static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> +	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *bo;
> +	u32 bo_flags;
> +	int err;
> +
> +	kref_init(&lrc->refcount);
> +	lrc->gt = gt;
> +	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> +	lrc->size = lrc_size;
> +	lrc->flags = 0;
> +	lrc->ring.size = ring_size;
> +	lrc->ring.tail = 0;
> +
> +	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> +		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> +	}
> +
> +	if (xe_gt_has_indirect_ring_state(gt))
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> +
> +	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> +		   XE_BO_FLAG_GGTT_INVALIDATE;
> +
> +	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
> +				       ttm_bo_type_kernel,
> +				       bo_flags, false);
> +	if (IS_ERR(lrc->bo))
> +		return PTR_ERR(lrc->bo);
> +
> +	lrc->bo = bo;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_GGTT |
> +				       XE_BO_FLAG_GGTT_INVALIDATE |
> +				       XE_BO_FLAG_SYSTEM, false);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto err_lrc_finish;
> +	}
> +	lrc->seqno_bo = bo;
> +
> +	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> +			     hwe->fence_irq, hwe->name);
> +
> +	err = xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
>  	if (err)
>  		goto err_lrc_finish;
>  
> +	if (vm && vm->xef)
> +		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> +
>  	return 0;
>  
>  err_lrc_finish:
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 3e500004f1ae..af31de8df408 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -52,6 +52,8 @@ struct xe_lrc_snapshot {
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags);
>  void xe_lrc_destroy(struct kref *ref);
>  
>  /**
> -- 
> 2.43.0
> 
