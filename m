Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F86C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 15:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F1510E550;
	Mon,  2 Jun 2025 15:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KOLEJtcf";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B556810E550
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J/OUQQqssgx85JdIiK62kOkbOpgftcGlGKC6A43nJwU=; b=KOLEJtcfXpju8iYDFs1iT8PDUP
 KD0ujNNPHfYqYD03JRbbaKTbNPawg38e57WoRDfoQEfJFR5EjYiCgzap0kvd8ncAribAQP1wKuVOs
 vXnealKN0RZsEjomeVmfotXP3hbxd9HeQfKd+C3jZeHmT0UiLnuJIGqn4yhlcGMjIYBHsqphsDlvn
 yXfjwy7AYLPqiDls2UYLDPHOlEWBPzFFOgKq3rtm3ipx4guCCjlSpzblSz79N8Z81Hte4/ZBsbLvh
 7wKcMPdKm0XoDlTMTLWXl+TJBi5l4595AmfB4G5kFSTtc4x6tCe/6sfO9/NqYm1UjKpj7t/0TRv38
 OoToDX9w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM6zw-00GKE7-Mh; Mon, 02 Jun 2025 17:22:48 +0200
Message-ID: <e98414e8-a487-4164-89db-86f9a98b06b9@igalia.com>
Date: Mon, 2 Jun 2025 16:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe: Use iosys_map helpers for WA BB emission
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
 <20250602111956.14854-3-tvrtko.ursulin@igalia.com>
 <r2alqrhauj7b3dbtmc6oicp2jevhlniogxjgggovw4axlyxzqd@5mnufxsin23l>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <r2alqrhauj7b3dbtmc6oicp2jevhlniogxjgggovw4axlyxzqd@5mnufxsin23l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 02/06/2025 15:56, Lucas De Marchi wrote:
> On Mon, Jun 02, 2025 at 12:19:52PM +0100, Tvrtko Ursulin wrote:
>> To properly support discrete GPUs on all platforms it is required to use
>> the iosys_map helpers.
>>
>> To fix we emit the WA BB into an on stack buffer and copy it over using
>> xe_map_memcpy_to().
> 
> For https://lore.kernel.org/intel-xe/20250523-wa-bb-cmds- 
> v1-0-40b337f71bcd@intel.com
> we will extend the WA BB to other things (and that is the first
> additional user). I don't think we can keep it on stack. For my next
> version I was adding the patch below to allocate the buffer. Let me know
> what you think.

Works for me I think.

I mean I don't exactly see yet how you will make it work for multiple 
users adding stuff to the same wa bb, like will you consider a shared 
buffer passed down from the level up or what, but in any case I can 
probably adapt my series quite easily.

In summary, you suggest my series waits for yours to land first?

Regards,

Tvrtko

> commit 28dbdf201133d92b0e0b0a0139eae7fe5eb9e33b
> Author: Lucas De Marchi <lucas.demarchi@intel.com>
> Date:   Fri May 30 16:29:51 2025 -0700
> 
>      drm/xe/lrc: Use a temporary buffer for WA BB
>      In case the BO is in iomem, we can't simply take the vaddr and 
> write to
>      it. Instead, prepare a separate buffer that is later copied into io
>      memory. Right now it's just a few words that could be using
>      xe_map_write32(), but the intention is to grow the WA BB for other
>      uses.
>      Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context 
> utilization")
>      Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>      Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 63d74e27f54cf..1b835d7efca2b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>    * store it in the PPHSWP.
>    */
>   #define CONTEXT_ACTIVE 1ULL
> -static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>   {
> -    u32 *cmd;
> +    u32 *cmd, *buf = NULL;
> 
> -    cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +    if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +        buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
> +        if (!buf)
> +            return -ENOMEM;
> +        cmd = buf;
> +    } else {
> +        cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +    }
> 
>       *cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | 
> MI_SRM_ADD_CS_OFFSET;
>       *cmd++ = ENGINE_ID(0).addr;
> @@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc 
> *lrc)
> 
>       *cmd++ = MI_BATCH_BUFFER_END;
> 
> +    if (buf) {
> +        xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
> +                 buf, cmd - buf);
> +        kfree(buf);
> +    }
> +
>       xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>                    xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> 
> +    return 0;
>   }
> 
>   #define PVC_CTX_ASID        (0x2e + 1)
> @@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct 
> xe_hw_engine *hwe,
>       map = __xe_lrc_start_seqno_map(lrc);
>       xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> 
> -    xe_lrc_setup_utilization(lrc);
> +    err = xe_lrc_setup_utilization(lrc);
> +    if (err)
> +        goto err_lrc_finish;
> 
>       return 0;
> 
> Lucas De Marchi

