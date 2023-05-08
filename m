Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7CC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A707A10E308;
	Mon,  8 May 2023 21:39:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37310E308
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683581960; x=1715117960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oej3drogWLaDTBSyGjcblTEzffIGmGMgIMnVAFbuMWQ=;
 b=YN9XA3Ou/c0//kueCL3Rn2uXeXbCkFgH5PmF7/62rk4z9b6NSM3i4qpH
 hMEeqHDuq9FzIQC7ooUb2MwyLmipoA+gBklsPC3R3nVgxlBI1jtSm+Kmx
 Coxo/bN17bS8C7L3lGouU4dOj9v2+IYgZTrt+huplxpPnlNT/qV9fcuT3
 XDgzHK5rx7PNSxjowEje1FLJ2WisItmmudBZ6/KnFnjLXY50hgmO7btZR
 jJUea2xNtxV0l0ZT52vnQ32ntcb4basrN3g3PUoRFFKP5DBjqGE4qLI5i
 FaAJCSpKztkGw1HMrk2RBvICeQWg8UbM1wGUKfIWXCp+IzCc7Cp5Yd+uU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="338988010"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338988010"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768215462"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768215462"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 08 May 2023 14:39:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:39:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:39:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:39:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLpZo6kJxxtb1t9SZTSz+gxtR0SKLvCiCDCwkT4+eNiAFS2kd0RPRgBtfgKNpc48XWNjSOoXak7ZPIPA3ks0+caqM0gCOZGaPp/7tkMcwfKs+QJ2UODOpwZ1NRL4qhymB9E+ZSarDbrHCbzYsGAy+sAgr7OiCkXxmnLaPw3AiKlsWKyLVr5aEn9vXRV2Ovft+jSlTKwsO1Px78yj7Npgmd3KBrqWG0jZ1bkAb1fXAJltG9h6Zplp2rB+7UQW4EbBVcm1EHCt+pW6Arb0o2Fmm0LIhOcCLewEoAOwfQNSSWZg1NqnGO35bIxEDXqkEq3KMzTFcyWBJLvnR6FhG2eiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1R6JNtBie/DC4XQwpPcPs3q8RbhaihHfW4JQwUyptM=;
 b=NxcWNYOfnn9vbdkXBg3QK/hm/UcHPhF7M8k8QiHsXRHpBdVvcyTlUxNbRIrmX/+3zSsDomuOGV+P/J7TQGcw/n4ah7RFO4v2lyxG5ivgw6fGQhpG3UuI5ToXJ9eh+X0h0iT8UP7bhVY+04gDhF0c5iaWtuL96IdhyNlQ7II+g4EGLRkpNKVQAtmseQQ/m6/r/Q7UTIUXh8GHgWcmiYIhNRwJnYk9PakevRuFLdj1XEmqaxKemQMBTdLy42+/DOF4rOMMuLfKhQY0tZr3AZxIiJavpHYRHEhJOLUakUqW/DwiPoyks9pCh8Cm1fyA1rWEf7lh22ZEXnyzKjgzk21MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Mon, 8 May
 2023 21:39:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:39:16 +0000
Date: Mon, 8 May 2023 17:39:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFlsAMZ7Zfwf97K/@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-9-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd1f788-14f2-4880-edeb-08db500cac20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVTluYXI4vn6053IMpInAxK5tfCgOa1jOxb7lLUxXkoTUD1ay7tmdZwulleJQnRTX790GrpX+4C/8EUDGewtg/EyXAsZY3tdXGnfjS4tHpWTYfxX9wx+71ByOETnJBGmZsVc+OThYD3vO6t4u6WvjP7GX5v+6criClmQ/g45QG7lYUex+FlBBT0WYYjc+EBcOnhvY+R62zzqluPA51ngbyjir34F/DSVHkOZ03ZWPWY5NmrOX7wLg1BAh2ROPZEHK3jTCL486ZT23DZp96f/LncCTpUjyCsnLvMU6wrziGVi2aPzK+14cbnjks4PEYAJKtEkpg8UV/piuhACUcjVADfyruniQt9AwFL7kpzEvMg2fjQ01KaBFBlfPOvPcdGrzpijyllkLNdkm/lrOZSFFDyZZktj21JJtqTDUhaqgyu4ysuXvlmx+HQiTgH4hyAA20sV5bUEianvZvEcndMDpNR8nEmCcpgmvqnyBG5XAC5GapVGhzOzMTVDd99H+q/YeJXSLgd+0pjxBLYqX6N1dActEFgpipmQMAkh2aHNmB2ibqiz439OBWnyDHpjByny
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(478600001)(86362001)(6666004)(36756003)(66556008)(37006003)(4326008)(6636002)(316002)(66476007)(6486002)(82960400001)(41300700001)(44832011)(8936002)(6862004)(5660300002)(8676002)(186003)(2906002)(2616005)(38100700002)(6506007)(26005)(6512007)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fqrOC1ceYCx2d+QBjFsdswjbRvGt4k4yecPi+WB5r9as6i4nT59fRkVZrcDS?=
 =?us-ascii?Q?IWb5efrJbLqvJcvf6G7vYZuuUHq9VoFQjFIisvVKqceeb9qOLFD0rjM6qfhL?=
 =?us-ascii?Q?Dv1CQgcBOz4oQMzZuDLI2Ul/n+oVpa64Ya2z9VlUAIQPg/whtow1dy7JUrVH?=
 =?us-ascii?Q?oO9MGCzvSclPMR1TsNCw64vcOh/zA4yb+kdtrwQhqlWfWhYW10zfkK36tO2X?=
 =?us-ascii?Q?ijkYLl1iVRXK4OXX5CSzPciFOagVhWoLrA7CuSMP1OIuYcThN7DCGAfKUIzO?=
 =?us-ascii?Q?HTQ90HDwHkAeIiUYnwDbS/GThSbK2PB3j3G9tGo3rK7LmzSE7SRAiJWB5Mjp?=
 =?us-ascii?Q?NtogtaqLUa5s1u3toPQCFVXiYMhqj6D4ILjUmw6JbRyRPf0NBlMy9D2F+fhz?=
 =?us-ascii?Q?Gk3ymk+bPiS6RJ2oMnDiEy8UOe/vyWPYxuc499m7tEaM4QbOIF+7Yid+pJsG?=
 =?us-ascii?Q?ULE20S9gqAGNmwV8i1iI2a84SGdefYmK+FJnA78cAxcFojpvBMn7gSQFxojR?=
 =?us-ascii?Q?rqYB2u8OvdLvpxEwuQaRvdXD1wIY9qDyHUUarAV1c/grKHRhH8LFdOUDs6YZ?=
 =?us-ascii?Q?iAORNuQRwIeHEFUM8mijvNo9tsiQMvGyCVQ1awKj2AG/ojGLPRcGg/Zb56hw?=
 =?us-ascii?Q?Shchp+xXHtl2UceO6zx5W6YwkcosNUIj2RC0JJAZpU3fM16OStIY01MyCCgV?=
 =?us-ascii?Q?g+2JAvqa5kggzUNkmxpI7SUJ0ioBBMDBRFT83ppXLHnINEYqd8Ez3CNOkYCM?=
 =?us-ascii?Q?rWruqnWNjkS3Eb2y6RNDB7tgfrP2m+1iaH4zM86OlL8YrjR8ybOrAHQtXQjG?=
 =?us-ascii?Q?O3hxfdpVZbUiBvhhfBHOsWAKwUoxKwnP6UiIHUvL1t7WtDvTYaMi0PYmF7/i?=
 =?us-ascii?Q?OTX3AlBgmwbCKCaG/vLCEcteBKsUnf8pASaGQBWIsmSRyhIxeBfZKTKNddeS?=
 =?us-ascii?Q?ovqaT1cxmruARbFCHi+yF6/4JL6V93PtXCcWPZq/Pq4Qj6vzpPCrqDo8oGtQ?=
 =?us-ascii?Q?Ot+oFDPVbQAczENBHqwOx592C2/eBf+xvUcctcq+5Ezs9NZJmzyPgpsQk7e4?=
 =?us-ascii?Q?2sVrZM8ietBDoJhWKBtkbDatseDzP0rZVdBg8EpWqluuMEVJaGgVSiOZ8oP5?=
 =?us-ascii?Q?NJh2+FxGQ360jtZgy3BpXj+iFQH56OCQ5Oe7YEFH3+5uKEvZ+Vvw9gtA1j6c?=
 =?us-ascii?Q?P8N8016B+Bhi9BzioGhKMzOm1+Fn4KZqh13c/QSGSJUw7sZnLJARGZC7X3H9?=
 =?us-ascii?Q?iEoSo5iAJcSINR8Ndj1tVv1zkByafXWbxtCo4BrG7udU+GPI/uKpCVEjHp5b?=
 =?us-ascii?Q?XJUeSwkwLhMhgHBhjdzOFakbrZnvCs4RRELKvtnJjsXVColP2HRi/aFsixm9?=
 =?us-ascii?Q?n486qL5b/SW8/naKrF5opOW1PL3IolcpDNcognnwkP6D0zRaG1jX8h2WFVXC?=
 =?us-ascii?Q?dCey3J/4d5GdDcvMPOw3oNJBZDrvhA1XE9i+GRcmaM72FWf4VC485uCmNnmQ?=
 =?us-ascii?Q?lxdE+F6McADktjNoXSHZXGQy42G04687wBFt0Ck6MnY61sMH2+6weHrDiks1?=
 =?us-ascii?Q?9+1oGNzeFX7WnK+YoVWE7rFYB1XJFhci3my0j3WQst6cP8yTrc7U9A2KVMtM?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd1f788-14f2-4880-edeb-08db500cac20
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:39:16.3089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woSGCYRepXs6nWSpsO8tkEOcdKY40fRj5V3p9eEDCZ0aUN/u57y7GLCn+puEU0X8CADY7oPNNQYmq46o0wmMcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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

On Mon, May 01, 2023 at 05:17:04PM -0700, Matthew Brost wrote:
> Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> LRU position on every exec.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
>  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
>  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
>  5 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..da99ee53e7d7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>  	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>  }
>  
> +static void xe_gem_object_close(struct drm_gem_object *obj,
> +				struct drm_file *file_priv)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> +		struct ww_acquire_ctx ww;
> +
> +		XE_BUG_ON(!xe_bo_is_user(bo));

We need to really stop using BUG_ON and move towards the usage of more WARNs.

But the rest of the patch looks good to me... I just believe it would be
good to get Thomas' review here.

> +
> +		xe_bo_lock(bo, &ww, 0, false);
> +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> +		xe_bo_unlock(bo, &ww);
> +	}
> +}
> +
> +
>  static bool should_migrate_to_system(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> @@ -1040,6 +1057,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>  
>  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>  	.free = xe_gem_object_free,
> +	.close = xe_gem_object_close,
>  	.mmap = drm_gem_ttm_mmap,
>  	.export = xe_gem_prime_export,
>  	.vm_ops = &xe_gem_vm_ops,
> @@ -1081,8 +1099,8 @@ void xe_bo_free(struct xe_bo *bo)
>  
>  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_gt *gt, struct dma_resv *resv,
> -				    size_t size, enum ttm_bo_type type,
> -				    u32 flags)
> +				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    enum ttm_bo_type type, u32 flags)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
> @@ -1149,7 +1167,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  		return ERR_PTR(err);
>  
>  	bo->created = true;
> -	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	if (bulk)
> +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> +	else
> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>  
>  	return bo;
>  }
> @@ -1219,7 +1240,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
> +	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> +				   vm && !xe_vm_no_dma_fences(vm) &&
> +				   flags & XE_BO_CREATE_USER_BIT ?
> +				   &vm->lru_bulk_move : NULL, size,
>  				   type, flags);
>  	if (IS_ERR(bo))
>  		return bo;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8354d05ccdf3..25457b3c757b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
>  
>  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_gt *gt, struct dma_resv *resv,
> -				    size_t size, enum ttm_bo_type type,
> -				    u32 flags);
> +				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    enum ttm_bo_type type, u32 flags);
>  struct xe_bo *
>  xe_bo_create_locked_range(struct xe_device *xe,
>  			  struct xe_gt *gt, struct xe_vm *vm,
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 9b252cc782b7..975dee1f770f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  	int ret;
>  
>  	dma_resv_lock(resv, NULL);
> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> +	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
>  				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>  	if (IS_ERR(bo)) {
>  		ret = PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 44ea9bcd0066..21a9c2fddf86 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -374,6 +374,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> +	if (!err && !xe_vm_no_dma_fences(vm)) {
> +		spin_lock(&xe->ttm.lru_lock);
> +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> +		spin_unlock(&xe->ttm.lru_lock);
> +	}
> +
>  err_repin:
>  	if (!xe_vm_no_dma_fences(vm))
>  		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fada7896867f..d3e99f22510d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -164,6 +164,9 @@ struct xe_vm {
>  	/** Protects @rebind_list and the page-table structures */
>  	struct dma_resv resv;
>  
> +	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> +	struct ttm_lru_bulk_move lru_bulk_move;
> +
>  	u64 size;
>  	struct rb_root vmas;
>  
> -- 
> 2.34.1
> 
