Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CEC44500
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 18:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CF110F0AF;
	Wed,  1 Jul 2026 18:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J21VvJN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD0A10F0A9;
 Wed,  1 Jul 2026 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782930675; x=1814466675;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=UqAObof3+Gge4KaorD7CBE1957FyA1bmndsJ13/gBms=;
 b=J21VvJN2JkLahRpQ9xyiwGrUnx2PLi8hcB5QaEtTcsLWq9AM98Ua4eyk
 Irw/1Gs6qbBvJ4ocM2NdTKE4B7nKwyElFH1/DBKSf6ck+oUEYciQ8XW6R
 2yrNiTJuqMdpF3E4+WY63zlXGUBnld9WvMsp0D5NrKqa1+ooZbKOSginu
 kacZmG/vOlAzhVtKfp1Yc+xGnTU5X2PrH14YwG/mUEJgEpRk6ezrxjkOt
 12wwltxpm4znA9rI1kTuiVBwff8IDtVYOYDSy0eN9f8yD8snHOppmzf0G
 MjV+/fkB0cc+m+FiQtBgxaEJSqeR/HikYK+MXdnAn4ft8atnNohKO7m2X Q==;
X-CSE-ConnectionGUID: i4PynZQRToSxZ4BlPZChZg==
X-CSE-MsgGUID: gMcjWjH0Rbyf5F8E1hn7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94827653"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94827653"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:14 -0700
X-CSE-ConnectionGUID: 4n5JOq8yT4aOJObLWGlmxw==
X-CSE-MsgGUID: sYXH1omoRLus1rDgbyPMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="248191609"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:13 -0700
Date: Wed, 1 Jul 2026 20:31:11 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [v6, 1/4] drm/i915/display: harden masks in HSW_AUD_PIN_ELD_CP_VLD
 macros
In-Reply-To: <20260609095525.570614-2-luciano.coelho@intel.com>
Message-ID: <3d6e60c1-9c28-d4cc-f0a6-e06f61b65a6c@intel.com>
References: <20260609095525.570614-2-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1248221454-1782920879=:605841"
Content-ID: <3c48a3f2-2b78-edbc-3363-f9db23c5d4a1@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1248221454-1782920879=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <204d51f0-dfd0-ce54-d7b2-8ca85233688e@intel.com>

On Tue, 9 Jun 2026, Luca Coelho wrote:
> HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder

nasty nit: double space sign: s/  / /

> value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> valid here.
>
> This is not a problem with the current implementation, because trans
> is always valid when these macros are called, but it's more robust to
> mask the index to the low 2 bits so the shift is always well-defined.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
> drivers/gpu/drm/i915/display/intel_audio_regs.h | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio_regs.h b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> index 4c31844d21df..f3d2a99c03d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> @@ -109,12 +109,20 @@
> #define _HSW_AUD_EDID_DATA_B		0x65150
> #define HSW_AUD_EDID_DATA(trans)	_MMIO_TRANS(trans, _HSW_AUD_EDID_DATA_A, _HSW_AUD_EDID_DATA_B)
>
> +/*
> + * HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> + * TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder

double space: s/  / /

> + * value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> + * valid here.  Mask the index to the low 2 bits so the shift is

double space: s/  / /

> + * always well-defined.
> + */
> #define HSW_AUD_PIPE_CONV_CFG		_MMIO(0x6507c)
> #define HSW_AUD_PIN_ELD_CP_VLD		_MMIO(0x650c0)
> -#define   AUDIO_INACTIVE(trans)		((1 << 3) << ((trans) * 4))
> -#define   AUDIO_OUTPUT_ENABLE(trans)	((1 << 2) << ((trans) * 4))
> -#define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
> -#define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
> +#define   __AUDIO_TRANS_SHIFT(trans)	(((trans) & 0x3) * 4)
> +#define   AUDIO_INACTIVE(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 3)
> +#define   AUDIO_OUTPUT_ENABLE(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 2)
> +#define   AUDIO_CP_READY(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 1)
> +#define   AUDIO_ELD_VALID(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans))

I'm thinking about something like:

#define AUDIO_TRANS_MASK 		REG_GENMASK(1, 0)
#define __AUDIO_TRANS(trans, bit) 	(REG_FIELD_GET(AUDIO_TRANS_MASK, trans) * 4 + (bit))
#define   AUDIO_INACTIVE(trans) 	REG_BIT(__AUDIO_TRANS(trans, 3))
#define   AUDIO_OUTPUT_ENABLE(trans) 	REG_BIT(__AUDIO_TRANS(trans, 2))
#define   AUDIO_CP_READY(trans) 	REG_BIT(__AUDIO_TRANS(trans, 1))
#define   AUDIO_ELD_VALID(trans) 	REG_BIT(__AUDIO_TRANS(trans, 0))

or, on a second thought, maybe even:

#define AUDIO_TRANS_MASK 		REG_GENMASK(3, 2)
#define __AUDIO_TRANS_SHIFT(trans)	(trans << 2)
#define __AUDIO_TRANS(trans, bit) 	(REG_FIELD_GET(AUDIO_TRANS_MASK, __AUDIO_TRANS_SHIFT(trans)) + (bit))
...

since multiplying by 4 should be effectively left-shifting by 2, 
and it shouldn't matter whether we first do the left-shift or bitwise
AND.

But no idea if it makes any sense. Anyways:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

>
> #define _AUD_TCA_DP_2DOT0_CTRL		0x650bc
> #define _AUD_TCB_DP_2DOT0_CTRL		0x651bc
>
--8323329-1248221454-1782920879=:605841--
