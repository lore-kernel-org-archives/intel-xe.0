Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1AAC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 12:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BD28825B;
	Mon,  9 Jun 2025 12:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZMRpRQOS";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73C28825B
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IHEUwTXV6i5PhUZFTy9YZ8RUpaK6oGeEkWZwZAFybs=; b=ZMRpRQOS8Rp/d4GTE5WNXtOio/
 ZxczwVQ7KH4V3g2cFOywTPvBl2GyvARNeoOcN+fDWtyDZb1U1SYOwp2BLLJ+eizqFcpAin7Djz72Z
 iXnIDoTHNFAZytWNOm6v0YGGt7ZWtGjWKk47pxYXVQLrntCXNsKYAZjtE7U5Ck1gROB7Mv+cXqwCA
 JWaQvU4xtBHUdEeJQGoA9Ka/XikKrW6c2dzpl0pF/kEgmDYvUnZ4MTL01xtM9OO9JvEVhROmpTlHR
 X1YpSljpA6ZBdKSo/SRS7XYiIPjtBTePpPE+gDwnOKx1PHO+XrReHh5IP6TmjicD0jTsBSchbD23u
 G+Cs+SvQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uObCH-001PEs-LP; Mon, 09 Jun 2025 14:01:49 +0200
Message-ID: <49b2fe81-24dd-474a-8030-ee692919a68d@igalia.com>
Date: Mon, 9 Jun 2025 13:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lrc: Prepare WA BB setup for more users
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
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


On 04/06/2025 16:03, Lucas De Marchi wrote:
> The post context restore (WA BB) is a mechanism in HW that may be used
> for things other than the utilization setup. Create a new function
> called setup_wa_bb() that wraps any function writing useful commands in
> the buffer.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 69 ++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index bf7c3981897de..529c6a972a55b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -914,9 +914,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>   }
>   
>   /*
> - * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> - * context run ticks.
> - * @lrc: Pointer to the lrc.
> + * wa_bb_setup_utilization() - Write commands to wa bb to assist
> + * in calculating active context run ticks.
>    *
>    * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
>    * context, but only gets updated when the context switches out. In order to
> @@ -941,18 +940,13 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>    * store it in the PPHSWP.
>    */
>   #define CONTEXT_ACTIVE 1ULL
> -static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> +				       u32 *batch, size_t max_len)
>   {
> -	u32 *cmd, *buf = NULL;
> +	u32 *cmd = batch;
>   
> -	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> -		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
> -		if (!buf)
> -			return -ENOMEM;
> -		cmd = buf;
> -	} else {
> -		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> -	}
> +	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
> +		return -ENOSPC;

Hand counted check is a little bit error prone or could go out of sync 
but I have no better suggestions apart to maybe removing it altogether 
and relying on the main warning in setup_wa_bb() catching all errors 
during patch development?

>   
>   	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>   	*cmd++ = ENGINE_ID(0).addr;
> @@ -971,6 +965,49 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>   		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>   	}
>   
> +	return cmd - batch;
> +}
> +
> +struct wa_bb_setup {
> +	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> +			 u32 *batch, size_t max_size);
> +};
> +
> +static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> +{
> +	const size_t max_size = lrc->bb_per_ctx_bo->size;
> +	static const struct wa_bb_setup funcs[] = {
> +		{ .setup = wa_bb_setup_utilization },
> +	};
> +	ssize_t remain;
> +	u32 *cmd, *buf = NULL;
> +
> +	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +		buf = kmalloc(max_size, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +		cmd = buf;
> +	} else {
> +		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +	}
> +
> +	remain = max_size / sizeof(*cmd);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
> +		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
> +
> +		remain -= len;
> +
> +		/*
> +		 * There should always be at least 1 additional dword for
> +		 * the end marker
> +		 */
> +		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
> +			goto fail;
> +
> +		cmd += len;
> +	}
> +
>   	*cmd++ = MI_BATCH_BUFFER_END;
>   
>   	if (buf) {
> @@ -983,6 +1020,10 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>   			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>   
>   	return 0;
> +
> +fail:
> +	kfree(buf);
> +	return -ENOSPC;
>   }
>   
>   #define PVC_CTX_ASID		(0x2e + 1)
> @@ -1139,7 +1180,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	map = __xe_lrc_start_seqno_map(lrc);
>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>   
> -	err = xe_lrc_setup_utilization(lrc);
> +	err = setup_wa_bb(lrc, hwe);
>   	if (err)
>   		goto err_lrc_finish;
>   
> 

LGTM, I did not spot any mistakes and I can easily rebase mine on top of 
this. And follow the same pattern for indirect context.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


