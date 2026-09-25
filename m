Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC897C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E3610F9FD;
	Fri, 25 Sep 2026 11:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gD5tr7yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179A10E7CE
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790337413; x=1821873413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ugNtD46mYv2gGawvXmhBGkMNXoEelqzB+w1qfBVYazU=;
 b=gD5tr7yf3k6xvOQgDiUtq4A7Pj9/3w7aoU7SK3rogpCEwpFbKhsAyty+
 RpaCmpUaROq05hk0oKZORPf6RjSgMpQRe5IckZBIc7kzaTO6jeyC5tBVc
 sPkg8IICYNhR8NuHkql8bpWAsyR+hF7w2TqEV4wBnfFFWkbxs0UIbx8/D
 5ua4kJ0amYVEk2UnMYf+8iPH586K7RLovkACPKszh67l7YEdAR4O1yM8Y
 SP8kU7o20woz5OHjW6/ok8oojo6W48d1alSQ+nmTHlFWrGHFRZy3vunEJ
 2lr3RKDERdCk6sd0B6rB3CTTrGOXotrNuUKGYYQZXFsxlPyo8+IJl+yCH g==;
X-CSE-ConnectionGUID: vU22UdvjTHazd2A/BP6UpQ==
X-CSE-MsgGUID: 3IAHfKIZRHeHZtXuYTslhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90248100"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90248100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:56:52 -0700
X-CSE-ConnectionGUID: yTh8upriRPyRGYSQcy1o+g==
X-CSE-MsgGUID: iZuHpMP8TJii9YMAjp9xaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273871353"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.107])
 ([10.245.245.107])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:56:51 -0700
Message-ID: <6948ebd4-a039-4b58-9106-1b3685655311@intel.com>
Date: Fri, 25 Sep 2026 12:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove no-op ternary in emit_flush_invalidate()
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20260923171527.663537-1-shuicheng.lin@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260923171527.663537-1-shuicheng.lin@intel.com>
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

On 23/09/2026 18:15, Shuicheng Lin wrote:
> '|' binds tighter than the conditional operator, so the trailing
> "?: 0" tests the whole OR expression instead of just the TLB flag.
> MI_FLUSH_DW is non-zero, so the condition is always true and the
> expression evaluates to itself.
> 
> Drop the ternary. The mask already yields 0 when MI_INVALIDATE_TLB
> is not set.
> 
> No functional change.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: LLM
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 46ab1f0f3564..3dd8cf4e2131 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -143,9 +143,8 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>   
>   static int emit_flush_invalidate(u32 addr, u32 val, u32 flush_flags, u32 *dw, int i)
>   {
> -	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
> -
> +	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> +		  (flush_flags & MI_INVALIDATE_TLB);
>   	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>   	dw[i++] = 0;
>   	dw[i++] = val;

