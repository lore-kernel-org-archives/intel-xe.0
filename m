Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534D7CD6E51
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 15:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CF811213E;
	Fri, 29 May 2026 15:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMvmB8Yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF08F11213E;
 Fri, 29 May 2026 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780069247; x=1811605247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ax6HVnurhMt7HbPg5Uw+d81XNnH5euslKyxgcIgddNM=;
 b=CMvmB8YqLEVZguNZifCw1CSNCrGK+3pYvcGiY066GBnkpCs9ORqgTcTy
 CiRVLx4U3ZQXIw9xdZY8TGoNFMP9x4spcPWPyypFbAb2QL9nmaAz3EVlW
 94Ny2v5v+yYKBSXcX0WRDdLMf7vnbIMc0t2Guj/Vi1n6e2jJW7fJjy8Vj
 aqfJ992VESIFZeFy2FVA17c23qFaMJruCzz6lx05UkAiOeBkjpWt6Wn4y
 ZDtXGnkxAVBjhJEDa0MR9JzPm6U4SC2n8dKRr+EBXRkac4hjKwHtzPfWQ
 hM75hWzguhNgAGLDsOvO96Cl5gHs14goS5Y5OiXn2tLawzgklQSZiDNa7 g==;
X-CSE-ConnectionGUID: TTzkPImlQoOzz77E6YF/Sw==
X-CSE-MsgGUID: AUHiQIi7R4yCcjyFTtBWYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92396751"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92396751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:40:46 -0700
X-CSE-ConnectionGUID: /Txaz08QRn+gTeO88Ze4lA==
X-CSE-MsgGUID: DAsTmGs3Q1+/k2jRFCwDqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240333774"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:40:44 -0700
Date: Fri, 29 May 2026 18:40:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: James Xiong <james.xiong@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 gustavo.sousa@intel.com, jani.nikula@linux.intel.com, imre.deak@intel.com
Subject: Re: [PATCH v4] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
Message-ID: <ahmzeOA79VxnmWD3@intel.com>
References: <20260511173101.723421-1-james.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511173101.723421-1-james.xiong@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, May 11, 2026 at 10:31:01AM -0700, James Xiong wrote:
> During driver probe, DMC firmware is loaded asynchronously via a
> workqueue. There is a race between parse_dmc_fw() setting the payload
> pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
> writing the firmware to hardware registers. If the probe thread calls
> intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window via
> intel_modeset_setup_hw_state(), it sees parsed payload but stale HW
> registers, triggering a ~20% intermittent WARNING on ADL-N warm boot.
> 
> v2: Fix by calling intel_dmc_wait_fw_load() in
>     intel_modeset_setup_hw_state() before iterating the CRTCs (Gustavo
>     Sousa).
> 
> v3: Move intel_dmc_wait_fw_load() into intel_dmc_enable_pipe() itself
>     so the function is self-contained (Jani Nikula, Gustavo Sousa).
> 
> Fixes: 3af2ff0840be ("drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled")
> Signed-off-by: James Xiong <james.xiong@intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 0df4f42ba3e3..4151eae92744 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -786,7 +786,12 @@ void intel_dmc_enable_pipe(const struct intel_crtc_state *crtc_state)
>  	enum pipe pipe = crtc->pipe;
>  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>  
> -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
> +	if (!is_valid_dmc_id(dmc_id))
> +		return;
> +
> +	intel_dmc_wait_fw_load(display);

I was going to say that intel_flipq_init() already did that, but
looks like that's called later not before.

I think what we probably want is an unconditional
intel_dmc_wait_fw_load() somewhere before this so that the whole
thing isn't so random.

> +
> +	if (!has_dmc_id_fw(display, dmc_id))
>  		return;
>  
>  	if (!can_enable_pipedmc(crtc_state)) {
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
