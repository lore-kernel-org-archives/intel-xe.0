Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D6BCD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272E410EFB4;
	Wed, 17 Jun 2026 11:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWLE86Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550610E9DA;
 Wed, 17 Jun 2026 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781696128; x=1813232128;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g0xHTjIqR2d37ONez6BD2EmmdVtZAnasWCkPBmGnLT8=;
 b=EWLE86Phr32LBMc4vZuGnL7le0xowC9qaKMmG63EPoTpSQQ30V7DTkte
 /OUaRM/4x2CzXD2jiFrzUoYJvwVuX1u0/ZR4Tai0M9JmRWCPj4J+THiue
 I1+Toip4iooq8HxHeoCH3SAn0VCsjieYjIjQn7NbxSzovvaoopqc/IQwY
 RvMhLRIF89OrQUCB2Bn5tVbesr//K6oMA01J96UtvS3NCmEGG9JDGaAr/
 1u369Iadljf78/Vq9ZkNFJ/TMmfSxeulKUlc6PnbfhoAwuwXOmnlEVCVh
 IJd8ynFDAxmuPpw1hoYmxCagqCS+9Z5Nd+6pEr3QrZIrbsvFDJNY3q/aS g==;
X-CSE-ConnectionGUID: UF0BLAEKThukrZTh5S73nQ==
X-CSE-MsgGUID: 6GDce3zDQfqjoAG3yemP6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82386024"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82386024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:35:28 -0700
X-CSE-ConnectionGUID: 8kTu/oHITGSRY7tZL0ugeQ==
X-CSE-MsgGUID: biTc0qhlTNKYh5WvaRN0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="271759762"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:35:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/cx0: Remove unnecessary hdmi link rate
 function declaration
In-Reply-To: <20260617041807.162927-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617041807.162927-1-suraj.kandpal@intel.com>
Date: Wed, 17 Jun 2026 14:35:23 +0300
Message-ID: <ab9cbb1273ae3c0a762060185b3d4bce9867c926@intel.com>
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

On Wed, 17 Jun 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> intel_cx0_phy_check_hdmi_link_rate is not used by anyone but is still
> declared. Remove it.

More specifically, the function does not exist.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> index 1428e7a5a318..95c20eb4b4b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> @@ -60,7 +60,6 @@ void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
>  				     const struct intel_crtc_state *crtc_state);
>  void intel_cx0_powerdown_change_sequence(struct intel_encoder *encoder,
>  					 u8 lane_mask, u8 state);
> -int intel_cx0_phy_check_hdmi_link_rate(struct intel_hdmi *hdmi, int clock);
>  void intel_cx0_setup_powerdown(struct intel_encoder *encoder);
>  bool intel_cx0_is_hdmi_frl(u32 clock);
>  u8 intel_cx0_read(struct intel_encoder *encoder, u8 lane_mask, u16 addr);

-- 
Jani Nikula, Intel
