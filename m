Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934C2C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F3910E201;
	Fri,  4 Jul 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S7gZURYv";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95310E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4V/PaKyjdmNaqoTrr2WBY0M/ui7tfnSbfyCtcKLLJA4=; b=S7gZURYv+bpm6ubsectk06w+QT
 ra8U0ty/1Ywg7XWUkIiiqtgVfa956KVK8I2oYgO4liKTxqOsZRkAWT2LiWjpY9l3oHvOiIQ/aApAW
 7HoDXIbbcu67H4HwLBJ+JnKrr2+rGLRA+DVsDL977GXsQa/NdCxwPV/QVMNSt9CefFPqyzcWZi/AJ
 +cPGMUTJ29YpVd7shaiJY+huXEKprV3m5C54cVjUuBLqzoOb1i6fPjDfcyYLq3/1O0wVD9ugCUWsC
 CRa1Oweb/kz61A/o5xzGHFXO83gIOtieX/tQIAC7bbPzLubsU9De8q/TZfDYaSUsapoTBgeaOeYJC
 JA5Ir/8g==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXdKZ-00CNaN-Th; Fri, 04 Jul 2025 12:07:43 +0200
Message-ID: <1f6dc212-8426-4fbb-80a3-5bd9cb270627@igalia.com>
Date: Fri, 4 Jul 2025 11:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/xe/lrc: Reduce scope of empty lrc data
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-1-6aa22f174041@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250703-lrc-refactors-v1-1-6aa22f174041@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 03/07/2025 23:41, Lucas De Marchi wrote:
> The only case in which new lrc data is created from scratch is when it's
> called prior to recording the default lrc. There's no need to check for
> NULL init_data since in that case the function already failed: just move
> the allocation where it's needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d2ad8fe737eb3..7cde827ddbec9 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1044,7 +1044,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct iosys_map map;
> -	void *init_data = NULL;
>   	u32 arb_enable;
>   	u32 bo_flags;
>   	int err;
> @@ -1076,25 +1075,26 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>   			     hwe->fence_irq, hwe->name);
>   
> -	if (!gt->default_lrc[hwe->class]) {
> -		init_data = empty_lrc_data(hwe);
> -		if (!init_data) {
> -			err = -ENOMEM;
> -			goto err_lrc_finish;
> -		}
> -	}
> -
>   	/*
>   	 * Init Per-Process of HW status Page, LRC / context state to known
> -	 * values
> +	 * values. If there's already a primed default_lrc, just copy it, otherwise
> +	 * it's the early submission to record the lrc: build a new empty one from
> +	 * scratch.
>   	 */
>   	map = __xe_lrc_pphwsp_map(lrc);
> -	if (!init_data) {
> +	if (gt->default_lrc[hwe->class]) {
>   		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>   		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>   				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
>   				 lrc_size - LRC_PPHWSP_SIZE);
>   	} else {
> +		void *init_data = empty_lrc_data(hwe);
> +
> +		if (!init_data) {
> +			err = -ENOMEM;
> +			goto err_lrc_finish;
> +		}
> +
>   		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
>   		kfree(init_data);
>   	}
> 

That was indeed a bit roundabout, good cleanup.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

