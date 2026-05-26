Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD0CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5610E47A;
	Tue, 26 May 2026 14:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIFg1xn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354510E47A;
 Tue, 26 May 2026 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779804294; x=1811340294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TgT9LDq2kYaUG6HVhkJp8m29INgs6e9gVuG3YkZghuM=;
 b=OIFg1xn16/0hLv0CkuG1q1v7FOaYw6WaeDY/8cIyzRfUQM6EvMvqg59H
 tUrJ4Rw0WH8H5PeEe+04V5pTTchneUQbXFFhj47vy5NPaVvCJJyBFrx4c
 1xOIukk/O/Pjkuhi47NfTxX89kVYkEAYAjCv9pmKnmZxGKL37yRgtSKig
 N0lNpNbbERLwrLeUYmFLVbs2p9veko/pNkcRxK+17zWef8v3c1TxSGOlq
 DjzohfRhnNE11t0FXtvfWNtbrNL4FhiyKnfT2lQ7asun4iBF40/tYmQ8E
 t6CmEhJWNTPSySXA+Tzu62Rs8nnqhPhaDb7+c26bfHd2bx50HLiXWVkMB A==;
X-CSE-ConnectionGUID: 7WWBuHQjQjeL2ho8JdGI5w==
X-CSE-MsgGUID: VUHYWTYESU2peemU0S92cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90917177"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="90917177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:04:53 -0700
X-CSE-ConnectionGUID: 8NbAQ789QqW9VmPnH7uAlQ==
X-CSE-MsgGUID: xv27fnZiQeS4P5oUWkpRfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265786380"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:04:52 -0700
Date: Tue, 26 May 2026 17:04:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/11] drm/i915/dp: Enable AS SDP whenever VRR is
 possible or PR !async
Message-ID: <ahWogS4DDNpXFj4U@intel.com>
References: <20260525052235.560741-11-ankit.k.nautiyal@intel.com>
 <20260526064309.585054-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526064309.585054-1-ankit.k.nautiyal@intel.com>
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

On Tue, May 26, 2026 at 12:13:09PM +0530, Ankit Nautiyal wrote:
> Currently AS SDP is only configured when VRR is enabled.
> With optimized guardband, we also need to account for wakeup time and other
> relevant details that depend on the AS SDP position whenever AS SDP is
> enabled. If a feature enabling AS SDP gets turned on later (after modeset),
> the guardband might not be sufficient and may need to increase, triggering
> a full modeset.
> 
> Additionally, for Panel Replay with Aux-less ALPM where the sink does
> not support asynchronous video timing in PR active, the source must
> keep transmitting Adaptive-Sync SDPs while PR is active.
> 
> So, always send AS SDP whenever there is a possibility to use it for VRR
> OR for Panel Replay for synchronization.
> 
> v2: Check if AS SDP can be used for synchronization for VRR or PR. (Ville)
> v3: Use intel_psr_needs_alpm_aux_less() instead of
>     intel_alpm_is_alpm_aux_less() to avoid including the LOBF case. (Ville)
>     Modify the commit message and subject.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a3aa0dadf0e1..87d7857fbafa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3181,7 +3181,11 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
>  	if (drm_dp_is_branch(intel_dp->dpcd))
>  		return false;
>  
> -	return crtc_state->vrr.enable;
> +	if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&

That depends on stuff computed by intel_psr_compute_config() but
currently that is called after intel_dp_compute_as_sdp() (which
is where intel_dp_needs_as_sdp() gets called). I can't immediately
see any other dependencies between those two functions so looks
like we could just reorder the calls.

> +	    !intel_psr_pr_async_video_timing_supported(intel_dp))
> +		return true;
> +
> +	return intel_vrr_possible(crtc_state);
>  }
>  
>  static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
