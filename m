Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E7C8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AE010E9D7;
	Fri,  4 Jul 2025 10:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sYfsAdle";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDE110E9D7
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsPLSdEFOEtRdTcZgreEpIMtZvfPSmnG5cgCgfM8ks8=; b=sYfsAdleMCHTanRJ9feumzY4xj
 NaKnx5s81jxJJg527ATaCvRzPeOKJ9zzJzO2samATkBgi/eVYt7S9aIG7XKWKwnPyOeBMGNbdQm71
 XT/AfmeOzg8Zt32jxjUfxFBW5w8yy1TzoUl/AqK8oyPV0hep81MkjLsyAosm6pc3x1nA1uvs0Q+xB
 Vv6U298XqAWeUAzb+FSYLsJ0G4ss1QBIUBXG2ZfaQjWZC741PZPCpDx1RyDlzNXWDtQ5q3uuu+e22
 ojvnQKmc7uiLIBYMct6PTQWkwf3S4D4bOVBtJH+T4oDj9NkSJaD1kpw3zEuRUqN2vpG7TYiOmpJTY
 gWocYdZg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXdWb-00CNrP-C4; Fri, 04 Jul 2025 12:20:09 +0200
Message-ID: <b3bc6a5b-c0c0-4fea-9e43-4fec14eeb317@igalia.com>
Date: Fri, 4 Jul 2025 11:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/xe: Count dwords before allocating
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-2-6aa22f174041@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250703-lrc-refactors-v1-2-6aa22f174041@intel.com>
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
> The bb allocation in emit_wa_job() is wrong in 2 ways: first it's
> allocating enough space for the 3DSTATE or hardcoding 4k depending on
> the engine. In the first case it doesn't account for the WAs and in the
> former it may not be sufficient. Secondly it's using the size instead of
> number of dwords, causing the buffer to be 4x bigger than needed.
> 
> While it's unlikely this is causing any real issue, let's calculate the
> needed space and allocate just enough.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d397df056e4cd..a926f560f2e36 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -189,16 +189,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   	long timeout;
>   	int count_rmw = 0;
>   	int count = 0;
> -
> -	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> -		/* Big enough to emit all of the context's 3DSTATE */
> -		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
> -	else
> -		/* Just pick a large BB size */
> -		bb = xe_bb_new(gt, SZ_4K, false);
> -
> -	if (IS_ERR(bb))
> -		return PTR_ERR(bb);
> +	size_t bb_len;
>   
>   	/* count RMW registers as those will be handled separately */
>   	xa_for_each(&sr->xa, idx, entry) {
> @@ -211,8 +202,26 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   	if (count || count_rmw)
>   		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>   
> +	bb_len = count * 2;

Shouldn't this be count * 2 + 1 ?

> +	if (count_rmw)
> +		bb_len += count_rmw * 20 + 7;

1)
This one is good. For both hardcoded value are a bit fragile maintenance 
wise but it can be improved later.

2)
Until now bb_len is in dwords, but below it is in bytes, right? In which 
case here there should be one, at this point exactly:

  bb_len *= sizeof(u32);

> +
> +	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> +		/*
> +		 * Big enough to emit all of the context's 3DSTATE via
> +		 * xe_lrc_emit_hwe_state_instructions()
> +		 */
> +		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
> +
> +	/* Make sure accounting offsets downward is also aligned */
> +	bb_len = ALIGN(bb_len, SZ_4K);

I did not get what you mean by "accounting offsets downward"?

Regards,

Tvrtko

> +
> +	bb = xe_bb_new(gt, bb_len, false);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
>   	if (count) {
> -		/* emit single LRI with all non RMW regs */
> +		/* Emit single LRI with all non RMW regs: 2 dw per reg */
>   
>   		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>   
> @@ -236,7 +245,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   	}
>   
>   	if (count_rmw) {
> -		/* emit MI_MATH for each RMW reg */
> +		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
>   
>   		xa_for_each(&sr->xa, idx, entry) {
>   			if (entry->reg.masked || entry->clr_bits == ~0)
> 

