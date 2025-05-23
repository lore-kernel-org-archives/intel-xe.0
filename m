Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3149CC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45D110E0BD;
	Fri, 23 May 2025 18:37:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8810E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:37:52 +0000 (UTC)
Message-ID: <abcc3cac-ef1e-41eb-8464-55b6b774e97e@lankhorst.se>
Date: Fri, 23 May 2025 20:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Have LRC hold VM reference
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
References: <20250522180906.2181573-2-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20250522180906.2181573-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

The patch seems like it's missing a fixes tag. Additionally, I would say it's missing a description of the bug being fixed.

Because of this, I'm not entirely clear if this is the correct way to solve the problem.

Looking at the code, I only see that execlists might end up with a reference on LRC, is that when the problem happens?

Could you simply add XE_BO_FLAG_USER on create instead?

Kind regards,
~Maarten Lankhorst

On 2025-05-22 20:09, Niranjana Vishwanathapura wrote:
> LRC's BO uses VM's dma_resv object. Have LRC hold
> VM reference.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..efdf4ef35b35 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -908,12 +908,17 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  
>  static void xe_lrc_finish(struct xe_lrc *lrc)
>  {
> +	struct xe_vm *vm = lrc->bo->vm;
> +
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	xe_bo_lock(lrc->bo, false);
>  	xe_bo_unpin(lrc->bo);
>  	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
>  	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> +
> +	if (vm)
> +		xe_vm_put(vm);
>  }
>  
>  /*
> @@ -1013,6 +1018,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	/* The lrc->bo uses VM's dma_resv object, take VM reference */
> +	if (vm)
> +		xe_vm_get(vm);
> +
>  	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>  						  ttm_bo_type_kernel,
>  						  bo_flags);

