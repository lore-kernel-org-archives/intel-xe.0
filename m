Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1DCD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 16:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4929A112235;
	Fri, 29 May 2026 16:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNBX1WgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAE2112235;
 Fri, 29 May 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780072357; x=1811608357;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fW3+BxmJklxLDnmE44xNB12tssP0w8Xjxpo+EJpBqrQ=;
 b=MNBX1WgTk2GR+AXvoSG82JxPgyZ2mxzNFZUR7JNTvRTEt5M6F0j3/9T8
 GRlxdRQxZxPZKnexN9YAgrJfgDKISUAQesBUaCXdLwqoJJ26/pI94lfBw
 qgq+RV9fsI5/jI1iYE+Mj7SLloJz32OjjxLRDC/UIfHSWJVcPtfFzkmhX
 UdfTdmCs91OCwZVpBtEpxI02DGxVL5rJjg44l+ASb0x3YouY5ltfA23Ef
 bXLddUACmJTDN+MSyZ9pw16IMpt/6uJqiBZhVJ/NkCgNwuAzQgLMxiN86
 Ty/rff+uctNNJpongBhQ2rt6HSaPBbCNInGG2sFJ5dTYlPQT0TirWOCO3 g==;
X-CSE-ConnectionGUID: 1hBAuEQgRma8s7ace3iUSw==
X-CSE-MsgGUID: W6AGDgulTMieYvAgp5WBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80071485"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80071485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:32:37 -0700
X-CSE-ConnectionGUID: gEnIeQppS5ymAYhRtY48Hw==
X-CSE-MsgGUID: LKUFAf8kSG+PK7CbtjEftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240343069"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:32:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/i915/display: harden masks in
 HSW_AUD_PIN_ELD_CP_VLD macros
In-Reply-To: <20260528093222.2758007-2-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260528093222.2758007-1-luciano.coelho@intel.com>
 <20260528093222.2758007-2-luciano.coelho@intel.com>
Date: Fri, 29 May 2026 19:32:33 +0300
Message-ID: <8efc55da36b1c67e774ff5ea2da66a1cb6030774@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 28 May 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
> value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> valid here.
>
> This is not a problem with the current implementation, because trans
> is always valid when these macros are called, but it's more robust to
> mask the index to the low 2 bits so the shift is always well-defined.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio_regs.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio_regs.h b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> index 4c31844d21df..03e2dedf2714 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> @@ -109,12 +109,20 @@
>  #define _HSW_AUD_EDID_DATA_B		0x65150
>  #define HSW_AUD_EDID_DATA(trans)	_MMIO_TRANS(trans, _HSW_AUD_EDID_DATA_A, _HSW_AUD_EDID_DATA_B)
>  
> +/*
> + * HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> + * TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
> + * value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> + * valid here.  Mask the index to the low 2 bits so the shift is
> + * always well-defined.
> + */
>  #define HSW_AUD_PIPE_CONV_CFG		_MMIO(0x6507c)
>  #define HSW_AUD_PIN_ELD_CP_VLD		_MMIO(0x650c0)
> -#define   AUDIO_INACTIVE(trans)		((1 << 3) << ((trans) * 4))
> -#define   AUDIO_OUTPUT_ENABLE(trans)	((1 << 2) << ((trans) * 4))
> -#define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
> -#define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
> +#define   __AUDIO_TRANS_SHIFT(trans)	(((trans) & 0x3) * 4)
> +#define AUDIO_INACTIVE(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 3)
> +#define AUDIO_OUTPUT_ENABLE(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 2)
> +#define AUDIO_CP_READY(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 1)
> +#define AUDIO_ELD_VALID(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans))

This drops the spaces after #define... the idea is something like this:

#define REGISTER_OFFSET
#define   REGISTER_CONTENTS

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  
>  #define _AUD_TCA_DP_2DOT0_CTRL		0x650bc
>  #define _AUD_TCB_DP_2DOT0_CTRL		0x651bc

-- 
Jani Nikula, Intel
