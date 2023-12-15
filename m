Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C2FC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80B310EA59;
	Fri, 15 Dec 2023 16:44:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578A10EA59
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702658654; x=1734194654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X8LjsXeazzN1DCOMoqOno/hiCqVPGsWkBkYq8VZiYyM=;
 b=YuDpnV2SlcTulHbN58F4AiPlEpArVUdtWa2bIJbdaBUBQwa6Mt6mGrR1
 nxv70qJAOsJH0taKBbjbtDRBT9M9b986kIxYarjT9sgTxGMypDIPB/Me9
 SWL4bXNwR/VWVR9TD8ENm1ZT+2i0Zc7W9nkfhb0tJfuW6qmzgseCL6+pA
 DGSimZEzFF9z2ZHsF3AYJSQhJ+N5+KcutlxsDI9pZhboS9N6ZQ1+NzfIW
 nIsDo3Znlj2lw4rcA6hoB5UAb8W8pTX8RtyTmc/KHVz4DL1z3VrYTDctf
 6Q3oQkGAQdR+4MkMCjdPnx9lRv0M3LeRvR1gqxhDbuicoapI4S/zRgXTD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8719347"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8719347"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="865455882"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="865455882"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2023 08:44:12 -0800
Received: from [10.249.144.211] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.144.211])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0989339C79;
 Fri, 15 Dec 2023 16:44:10 +0000 (GMT)
Message-ID: <2212597d-31f0-4881-8e5f-14cd4e285723@intel.com>
Date: Fri, 15 Dec 2023 17:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
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



On 06.12.2023 22:14, Daniele Ceraolo Spurio wrote:
> We're currently sending non-blocking H2G messages using the EVENT type,
> which suppresses all CTB protocol replies from the GuC, including the
> failure cases. This might cause errors to slip through and manifest as
> unexpected behavior (e.g. a context state might not be what the driver
> thinks it is because the state change command was silently rejected by
> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
> type instead, which suppresses the reply only on success; this way we
> still get the advantage of not having to wait for an ack from the GuC
> (i.e. the H2G is still non-blocking) while still detecting errors.
> Since we can't escalate to the caller when a non-blocking message
> fails, we need to escalate to GT reset instead.
> 
> Note that FAST_REQUEST failures are NOT expected and are usually a sign
> that the H2G was either malformed or requested an illegal operation.
> 
> v2: assign fence values to FAST_REQUEST messages, fix abi doc, use xe_gt
> printers (Michal).
> 
> v3: fix doc alignment, fix and improve prints (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
> ---
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 58 ++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index 3d199016cf88..ff888d16bd4f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -24,6 +24,7 @@
>   *  |   | 30:28 | **TYPE** - message type                                      |
>   *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
>   *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> + *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                         |
>   *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
>   *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
>   *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> @@ -46,6 +47,7 @@
>  #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>  #define   GUC_HXG_TYPE_REQUEST			0u
>  #define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 24a33fa36496..2fb9be5ea132 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -17,6 +17,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_submit.h"
> @@ -448,7 +449,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	} else {
>  		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	}
> @@ -475,11 +476,31 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return 0;
>  }
>  
> +/*
> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> + * driver, the GuC will just copy it to the reply message. Since we need to
> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> + * we use one bit of the seqno as an indicator for that and a rolling counter
> + * for the remaining 15 bits.
> + */
> +#define CT_SEQNO_MASK GENMASK(14, 0)
> +#define CT_SEQNO_IS_UNTRACKED BIT(15)

nit: maybe s/CT_SEQNO_IS_UNTRACKED/CT_SEQNO_UNTRACKED

> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> +{
> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> +
> +	if (!is_g2h_fence)
> +		seqno |= CT_SEQNO_IS_UNTRACKED;
> +
> +	return seqno;
> +}
> +
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	u16 seqno;
>  	int ret;
>  
>  	xe_assert(xe, !g2h_len || !g2h_fence);
> @@ -505,7 +526,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		if (g2h_fence_needs_alloc(g2h_fence)) {
>  			void *ptr;
>  
> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> +			g2h_fence->seqno = next_ct_seqno(ct, true);
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -514,6 +535,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				goto out;
>  			}
>  		}
> +
> +		seqno = g2h_fence->seqno;
> +	} else {
> +		seqno = next_ct_seqno(ct, false);
>  	}
>  
>  	if (g2h_len)
> @@ -523,8 +548,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	if (unlikely(ret))
>  		goto out_unlock;
>  
> -	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
> -			!!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> @@ -786,7 +810,8 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt =  ct_to_gt(ct);
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
>  	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
>  	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
> @@ -794,10 +819,31 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	lockdep_assert_held(&ct->lock);
>  
> +	/*
> +	 * Fences for FAST_REQUEST messages are not tracked in ct->fence_lookup.
> +	 * Those messages should never fail, so if we do get an error back it
> +	 * means we're likely doing an illegal operation and the GuC is
> +	 * rejecting it. We have no way to inform the code that submitted the
> +	 * H2G that the message was rejected, so we need to escalate the
> +	 * failure to trigger a reset.
> +	 */
> +	if (fence & CT_SEQNO_IS_UNTRACKED) {
> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",

nit: you can drop explicit "0x" prefix in "0x%x" by just using "%#x"

> +				  fence,
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> +		else
> +			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> +				  type, fence);
> +
> +		return -EPROTO;
> +	}
> +
>  	g2h_fence = xa_erase(&ct->fence_lookup, fence);
>  	if (unlikely(!g2h_fence)) {
>  		/* Don't tear down channel, as send could've timed out */
> -		drm_warn(&xe->drm, "G2H fence (%u) not found!\n", fence);
> +		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);

nit: if this is a response kind of message then this fence in the
message is host seqno aka H2G, no?

>  		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  		return 0;
>  	}

few nits, but LGTM so,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
