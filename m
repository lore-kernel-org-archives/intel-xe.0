Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDFBCD37A7
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 11:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD2E10F45F;
	Fri,  8 May 2026 11:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UV0ILEkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0210F455;
 Fri,  8 May 2026 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778239667; x=1809775667;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eu0+bqYmt4511YtN95ewMepJP9CxLVXzXFLTzv0fB2A=;
 b=UV0ILEkK8nEZWPk17S5QrTHG9bAUPqtilRqoMN3k5MzQoLlPv0QgOLmH
 81OHst/R/B61ZmB+IQkZhBZwDpKMiDK3ZteMx9ckZlz+MEzx6Bd51AgHB
 oFKKmxDtD0+6QvOAd4Rmn9UVFgiHp8RzmhbuaFpG0W7LaOQHdQ1VsqAU7
 ZdBCo8gATtFEqFcOFZZqauSVpp9PrDLKgUETqk/DBwkiVA23hh/NwmMle
 +H9kob1S/8U8VnL+7aGRJ3IjkCXTpocDxR/ezXC5z5BPp64zgH8c3tF1N
 GnsIP5O2nfu6H72ZGwHrzw0Xkvy3o6X5xGqFBQMBocLeR9Rpsup8jZILG w==;
X-CSE-ConnectionGUID: Ebs04pcxQ3WJy0ZP9I0bIA==
X-CSE-MsgGUID: q8UVGlfiSzyiJj3MNUT13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="66733379"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="66733379"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 04:27:46 -0700
X-CSE-ConnectionGUID: pwEBE3GcQbKA19lFwaX/eg==
X-CSE-MsgGUID: vKmsYM95R1KOo/LFhGVnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="235759984"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 04:27:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Xiong <james.xiong@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com, jani.saarinen@intel.com, James Xiong
 <james.xiong@intel.com>
Subject: Re: [PATCH v2] drm/i915/dmc: fix assert_dmc_loaded WARN during
 async firmware load
In-Reply-To: <20260507164605.608368-1-james.xiong@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260507164605.608368-1-james.xiong@intel.com>
Date: Fri, 08 May 2026 14:27:40 +0300
Message-ID: <b02ec283a5d2137f48859884805d9c55f216cf58@intel.com>
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

On Thu, 07 May 2026, James Xiong <james.xiong@intel.com> wrote:
> During driver probe, DMC firmware is loaded asynchronously via a
> workqueue. There is a race between parse_dmc_fw() setting the payload
> pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
> writing the firmware to hardware registers. If the probe thread calls
> intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window via
> intel_modeset_setup_hw_state(), it sees parsed payload but stale HW
> registers, triggering a ~20% intermittent WARNING on ADL-N warm boot.

I wonder if intel_dmc_enable_pipe() should call intel_dmc_wait_fw_load()
itself?

>
> v2: Fix by calling intel_dmc_wait_fw_load() in
>     intel_modeset_setup_hw_state() before iterating the CRTCs (Gustavo
>     Sousa).
>
> Signed-off-by: James Xiong <james.xiong@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> index e88082c8caac..277e56848470 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> @@ -961,6 +961,8 @@ void intel_modeset_setup_hw_state(struct intel_display *display,
>  	 * intel_sanitize_plane_mapping() may need to do vblank
>  	 * waits, so we need vblank interrupts restored beforehand.
>  	 */
> +	intel_dmc_wait_fw_load(display);
> +

No matter what, the comment above now appears to refer to this
intel_dmc_wait_fw_load() call, which makes no sense at all.

BR,
Jani.

>  	for_each_intel_crtc(display->drm, crtc) {
>  		struct intel_crtc_state *crtc_state =
>  			to_intel_crtc_state(crtc->base.state);

-- 
Jani Nikula, Intel
