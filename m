Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261BCD32D98
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 11:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D4110E1F8;
	Tue, 12 Nov 2024 11:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXYRYiNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC210E1F8;
 Tue, 12 Nov 2024 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731411170; x=1762947170;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t9kmZ93g+JttyYvFkB2kK5T/Bj25NKZ1nEelu3lcc/s=;
 b=NXYRYiNK2sagm/a5RdPdXNQO1JuVImTx+3fc3RDCkojnGXEIl7x+q0vU
 VUt7sMdkTDSyOTyS7DB/TfoM+pgnUJvDWH0D6LjaaPLkldnD8e4i37wxD
 h+gKPOV4QlyYEKkg2EBUeigKsTTK3skx2DW5xj2wgZRYs1Os9SHIb1zEM
 tTqHYmjXaAdKpmlktB/SQq4SPluEVNaa4pXTsnc0ImOlsntL8cAFMoMPz
 d+OERrjwUrmmiANM0eHgibvatIIBuAOwAe4rIOwloOlbfe4irkuytofQd
 Ep2QCJ0ePao28j2uMBF04Y8gwQKSrbdNb0Wr64MzEZElv9VHCowMWN4/6 g==;
X-CSE-ConnectionGUID: gf8CG9GPR+KPkFe/cwUstQ==
X-CSE-MsgGUID: arTietnpQOiGHrprGysnFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35026653"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35026653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:32:49 -0800
X-CSE-ConnectionGUID: 6iID94sNTPqPhyBRwp0Cfw==
X-CSE-MsgGUID: 1YCHF4mzQXOA1W4MIpz+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87837702"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:32:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 mitulkumar.ajitkumar.golani@intel.com
Subject: Re: [PATCH 03/23] drm/i915/vrr: Introduce new field for VRR mode
In-Reply-To: <20241111091221.2992818-4-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
 <20241111091221.2992818-4-ankit.k.nautiyal@intel.com>
Date: Tue, 12 Nov 2024 13:32:44 +0200
Message-ID: <877c98d6w3.fsf@intel.com>
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

On Mon, 11 Nov 2024, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> VRR timing generator can be used in multiple modes: dynamic vrr, fixed
> refresh rate and content matched refresh rate (cmrr).
> Currently we support dynamic vrr mode and cmrr mode, so add a new member
> to track in which mode the VRR timing generator is used.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index d3a1aa7c919f..a1b67e76d91c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -913,6 +913,12 @@ void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
>  
>  typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
>  
> +enum intel_vrrtg_mode {
> +	INTEL_VRRTG_MODE_NONE,

I couldn't quickly conclude whether this is in fact redundant with
tg_enable.

Would it be possible to ditch this in favor of using mode != NONE?

BR,
Jani.


> +	INTEL_VRRTG_MODE_VRR,
> +	INTEL_VRRTG_MODE_CMRR,
> +};
> +
>  struct intel_crtc_state {
>  	/*
>  	 * uapi (drm) state. This is the software state shown to userspace.
> @@ -1286,6 +1292,7 @@ struct intel_crtc_state {
>  		u8 pipeline_full;
>  		u16 flipline, vmin, vmax, guardband;
>  		u32 vsync_end, vsync_start;
> +		enum intel_vrrtg_mode mode;
>  	} vrr;
>  
>  	/* Content Match Refresh Rate state */

-- 
Jani Nikula, Intel
