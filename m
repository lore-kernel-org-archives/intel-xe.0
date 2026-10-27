Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADD606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d8iqLjNE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A6210E41B;
	Tue, 27 Oct 2026 12:25:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A81D10E41B;
 Tue, 27 Oct 2026 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793103952; x=1824639952;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CNj3tjrQd67DWnCESjvqLzbtLbof9+zD8FhzDZHae08=;
 b=d8iqLjNE4HaCNoqrSEo/722BHXhJo05ig3n+sf8nDdJCTWFZIHN6MVUi
 1pOVwo6m80LIg8Y5HPS9ruvd4uq9qIwfNRCslcPA2JrUVhvghEgkhgJze
 bAP1SdewYBOj+VJ00an8pvAzMJIeROrMA8DPRqBrn2rIEafb4cqsTDlmX
 cbwEzB2foj+7QJvuq5Qzt3g5FTLWWLnaOSQI3+9WzaQJfBNoSvDuzrXLR
 hRdV1XNz+F8ZF8c5kxzucNvZjdwYPR0IMA878f/t/IwasPJJhLlG2NBu4
 /kgdnbYbbnIh/qgyKyX4TFwWxJLVYque3iO9+/VxWQP0EnRcJe3+S5DLp g==;
X-CSE-ConnectionGUID: NZjCpNq9S+Sq68I6PxsH1Q==
X-CSE-MsgGUID: 9pSfeYjfRyKm3aldRaIthw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1697275"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1697275"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:25:52 -0700
X-CSE-ConnectionGUID: 8WyvCEAITtWA3+1d8OXK7g==
X-CSE-MsgGUID: PpUa83TvRCuk/+QKmXmNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4614154"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:25:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com, Animesh
 Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder
 disable in hsw_crtc_disable()
In-Reply-To: <20261026082906.802048-2-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261026082906.802048-1-animesh.manna@intel.com>
 <20261026082906.802048-2-animesh.manna@intel.com>
Date: Tue, 27 Oct 2026 14:25:46 +0200
Message-ID: <c3b14e8837b48b0b61923278974f80bdc70ceb9c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
> sequence, before intel_encoders_disable(). With this ordering, the wait
> for CMTG_STATE to clear after CMTG_ENABLE is cleared intermittently
> times out:
>
>   xe 0000:00:02.0: [drm] CMTG: A disable timeout
>   WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]
>
> This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
> disables and re-enables the eDP across modesets and suspend/resume.
>
> Move the CMTG disable after intel_encoders_disable(), so the eDP-side
> teardown (panel unprepare, ALPM disable, backlight off) has completed,
> but keep it before intel_encoders_post_disable() and
> intel_dpll_disable(). The transcoder timing generator, DDI buffer and
> port PLL are therefore still running while CMTG_STATE is polled, and
> the requirement to disable CMTG before the transcoder and the port PLL
> feeding it are turned off is preserved.
>
> v2:
> - Modify commit description regarding PSR exit. [Dibin]
> - Add fixes tag. [Jani, Dibin]
> v3:
> - Add a cover letter with links to v1 and v2 for the review
>   history. [Dibin]
>
> Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index afe70e9ce347..5e40487e9ab0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>  		intel_atomic_get_old_crtc_state(state, crtc);
>  	struct intel_crtc *pipe_crtc;
>  
> -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> -		intel_cmtg_set_clk_select(old_crtc_state);
> -		intel_cmtg_disable(old_crtc_state);
> -	}
>  	/*
>  	 * FIXME collapse everything to one hook.
>  	 * Need care with mst->ddi interactions.
>  	 */
>  	intel_encoders_disable(state, crtc);
> +
> +	/*
> +	 * Disable CMTG after the encoders are disabled, but before the
> +	 * transcoder and port PLL are torn down in
> +	 * intel_encoders_post_disable()/intel_dpll_disable().
> +	 */
> +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> +		intel_cmtg_set_clk_select(old_crtc_state);
> +		intel_cmtg_disable(old_crtc_state);
> +	}

A follow-up patch could move the conditions inside intel_cmtg.c instead
of having them inline here. Like, we don't have the conditions for
intel_dpll_disable() below inline here, they're up to the dpll mgr code.

BR,
Jani.

> +
>  	intel_encoders_post_disable(state, crtc);
>  
>  	intel_dpll_disable(old_crtc_state);

-- 
Jani Nikula, Intel
