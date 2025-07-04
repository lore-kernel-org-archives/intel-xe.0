Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C89CC83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275B310E9E5;
	Fri,  4 Jul 2025 10:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PrrknH1O";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578710E9E5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/MC1T94oE9ggsp0u7nxpPESJHr2NOnhneKV3P6UOigY=; b=PrrknH1O8FnrR1lzLOGCBVQEUW
 yR48BaN7xVSt+2MPVe5cxnl51Z53wkSSmZYG2J2fiGnPVhcMn5uSRWtUOqvdVhM1Y6sdbL1DfwW+c
 ONS5yJ9rA3Z3FgZhxxyOX5jf2ahX50XpOxXAsjmHZVUEr/irrnOYbIaQDZpZoWkfGFxQDgK33FovS
 uyXcNM6LYVUPB2DoI1+5Sh07Fy+9CV64mQ4uTjTaYsbWEst6m7FX7xd9kpnET+FK1/vmOShzH5fmv
 e4fWU1uRVoLsXI7cnO7GEhrOEwhXz0eIijU47PF+pRY4irFrHgcZ4+FvYjXc9WJRkMoueHLAeEidt
 V00Mr0gw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXdr4-00COLE-DR; Fri, 04 Jul 2025 12:41:18 +0200
Message-ID: <e81ce1b2-f7d2-4639-b840-f56e1dada189@igalia.com>
Date: Fri, 4 Jul 2025 11:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe/lrc: Add table with LRC layout
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-4-6aa22f174041@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250703-lrc-refactors-v1-4-6aa22f174041@intel.com>
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
> Add a table to document the LRC's BO layout to make it easier to
> visualize how each region stacks on top of each other.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 7cde827ddbec9..75f4678cb090a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -42,6 +42,27 @@
>   #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>   #define LRC_WA_BB_SIZE				SZ_4K
>   
> +/*
> + * Layout of the LRC and associated data allocated as
> + * lrc->bo:
> + *
> + *   Region                       Size
> + *  +============================+=================+ <- __xe_lrc_ring_offset()
> + *  | Ring                       | ring_size, see  |
> + *  |                            | xe_lrc_init()   |
> + *  +============================+=================+ <- __xe_lrc_pphwsp_offset()
> + *  | PPHWSP (includes SW state) | 4K              |
> + *  +----------------------------+-----------------+ <- __xe_lrc_ring_offset()
> + *  | Engine Context Image       | n * 4K, see     |
> + *  |                            | xe_gt_lrc_size()|
> + *  +----------------------------+-----------------+ <- __xe_lrc_indirect_ring_offset()
> + *  | Indirect Ring State Page   | 0 or 4k, see    |
> + *  |                            | xe_gt_lrc_size()|
> + *  +============================+=================+ <- __xe_lrc_wa_bb_offset()
> + *  | WA BB Per Ctx              | 4k              |
> + *  +============================+=================+ <- xe_bo_size(lrc->bo)
> + */

I assume '---' separates parts which are considered engine lrc state, 
while '===' is for other data which happens to be in the same BO. So for 
indirect ctx I will use '==='. Just unsure if indirect ring state should 
in that case also be '==='? Looks like LRC image points to it's ggtt 
address which would suggest it is equally separate.

> +
>   static struct xe_device *
>   lrc_to_xe(struct xe_lrc *lrc)
>   {
> 

Modulo the above:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

