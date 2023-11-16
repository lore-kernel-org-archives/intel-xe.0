Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D54AC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 17:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E306E10E64C;
	Thu, 16 Nov 2023 17:12:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECD010E64C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700154748; x=1731690748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=45YWL9f5gxhL4MGCCGfUXRrngfY4iJl2xz5NKb53KYM=;
 b=NALloRI1HfAdA/nKV932yI+/bE8uo+AOnfC5s2toC4dR1Ju/KSiUd0iU
 SrDqS5iHznhjYu0RGB7Gi1iuhJ0w+nLL8qS4GEvABMvLoDX2WVXOJc0JG
 HowEoEw4QenDKdKfaC3rbs4E5PYxkiTgv2J8oZgtO02E9IPRqsb/4Rwei
 BFQzO1OpIcqc6NCPWwCisGZn02zH10yJ1WclhEkykhtbx2F54+eErRI+A
 mFquZJ7K4c6mxXmzTVBZX1E0rnJRZpfKoJvUnsWSYYqeuItF2IczyKCEM
 PeP3vbxRHE6mbHbiSIcbByVEEerMZFDeUHyybimpi2rPAtJbNllUkwGcF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381526859"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="381526859"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 09:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="741824882"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="741824882"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 16 Nov 2023 09:12:25 -0800
Received: from [10.249.152.135] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.152.135])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1E4643636B;
 Thu, 16 Nov 2023 17:12:24 +0000 (GMT)
Message-ID: <0a532eac-615e-4149-a634-aeebb25501ab@intel.com>
Date: Thu, 16 Nov 2023 18:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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



On 16.11.2023 00:40, Daniele Ceraolo Spurio wrote:
> We're currently sending non-blocking H2G messages using the EVENT type,
> which suppresses all CTB protocol replies from the GuC, including the
> failure cases. This might cause errors to slip through and manifest as
> unexpected behavior (e.g. a context state might not be what the driver
> thinks it is because the state change command was silently rejected by
> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
> type instead, which suppresses the reply only on success; this way we
> still get the advantage of not having to wait for an ack from the GuC
> (i.e. the H2G is still non-blocking) while still detecting errors.
> Since we don't track the non-blocking messages, we don't exactly know
> which one of them failed and therefore can't attempt to recover and need
> to escalate to GT reset instead.
> 
> Note that FAST_REQUEST failures are NOT expected and are usually a sign
> that the H2G was either malformed or requested an illegal operation.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> 
> In the testing I did locally I didn't see any failure responses, but I
> didn't run the full CI suite. If failure responses do come out from the
> CI runs, I'll try to fix them before merging this patch.
> 
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 28 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct_types.h      |  2 +-
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index 3d199016cf88..e517e2a740d2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -46,6 +46,7 @@
>  #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>  #define   GUC_HXG_TYPE_REQUEST			0u
>  #define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u

you should also update doc above (bits 30:28)

>  #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a84e111bb36a..81d727b72709 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -448,7 +448,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	} else {
>  		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	}
> @@ -505,7 +505,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		if (g2h_fence_needs_alloc(g2h_fence)) {
>  			void *ptr;
>  
> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> +			/* we reserve fence 0 to indicate unset */

why ? it's not required by the HXG protocol

> +			g2h_fence->seqno = ct->fence_seqno++;
> +			if (unlikely(!g2h_fence->seqno))
> +				g2h_fence->seqno = ct->fence_seqno++;
> +
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -792,6 +796,26 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>  	struct g2h_fence *g2h_fence;
>  
> +	/*
> +	 * FAST_REQUEST messages don't have a fence and therefore are
> +	 * not tracked in ct->fence_lookup. Note that those messages should

but why we don't use fences for FAST_REQUEST ?

even if we don't expect any failures, from the protocol POV this is
another separate flow, and we shouldn't reuse same 0 (unset) fence for
multiple requests sent one by one.

it also will make any debugging much harder (if we get such failure
response) to figure out and match that error with actual request
(without deep analysis of GuC log, that might be lost)

> +	 * never fail, so if we do get an error back it means we're likely
> +	 * doing an illegal operation and the GuC is rejecting it. Since we
> +	 * don't know which action failed and therefore can't attempt to
> +	 * recover, we need to escalate the failure to trigger a reset.
> +	 */
> +	if (!fence) {
> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> +			drm_err(&xe->drm, "FAST_REQUEST H2G failed! e=0x%x, h=%u\n",
> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> +		else
> +			drm_err(&xe->drm, "unexpected response %u for FAST_REQUEST H2G!\n",
> +				type);

we should at least use xe_gt_err() to get the GT id in the log

> +
> +		return -EPROTO;
> +	}
> +
>  	lockdep_assert_held(&ct->lock);
>  
>  	g2h_fence = xa_erase(&ct->fence_lookup, fence);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d814d4ee3fc6..62f98dcaeaf1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -99,7 +99,7 @@ struct xe_guc_ct {
>  	/** @enabled: CT enabled */
>  	bool enabled;
>  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> -	u32 fence_seqno;
> +	u16 fence_seqno;
>  	/** @fence_lookup: G2H fence lookup */
>  	struct xarray fence_lookup;
>  	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
