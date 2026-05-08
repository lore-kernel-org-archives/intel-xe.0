Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E81CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCB110E0B9;
	Fri,  8 May 2026 14:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW5lbC5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434A410E0B9;
 Fri,  8 May 2026 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778251344; x=1809787344;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=L9atX5SZFWNouSYJhqu1tV2vrxchfVuB1/bN3moV0EI=;
 b=BW5lbC5dRq4OuZYRKDBbPLDwvKLpK1139uYrZa3owmEbHj/ymXS0Ggy1
 n7E34R0meOMyy3K+p0LXHZoGxw7rVxVqEfmuyZ37YgIqSf+Ud+fsAi2gZ
 VmPr3xpSJDOD3mbJTME7hQj4aRQE0PZ2uc6XkNBGoe9HWytANckiFZ+aK
 UOlxi38D1xJ8/97HwdIfXsUJDXkYcjbUBTOL9ri0dRZY1snDq6UPwBZrL
 RDaT2vqezDtg8ggWdgOD3JEulRcxlSzmnLMu8gNUHflZt3UTAh9gouHQZ
 DuZZWPc8IOThvmnaa4bmQ2CLPrEdOBovmDdhS3T7u5bpbjC4obqwHZ5cG g==;
X-CSE-ConnectionGUID: NJ/7NPh3R+OC/uTPL6qcUg==
X-CSE-MsgGUID: oQzBvdu2R/6837j9IpLnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="81784555"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="81784555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:42:24 -0700
X-CSE-ConnectionGUID: 9oI9ot+wQ+KYsn8XVUMGHw==
X-CSE-MsgGUID: vvrVgJFzTBCZpp0abx90pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="232443532"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:42:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 017/108] drm/i915/dp_link_training: Add helper to mark
 link training failure
In-Reply-To: <20260428125233.1664668-18-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428125233.1664668-1-imre.deak@intel.com>
 <20260428125233.1664668-18-imre.deak@intel.com>
Date: Fri, 08 May 2026 17:42:20 +0300
Message-ID: <1df1beb8661ad06de0b6e29b983720507ab72b06@intel.com>
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

On Tue, 28 Apr 2026, Imre Deak <imre.deak@intel.com> wrote:
> Add link_recovery_mark_train_failure() to record the failure and make
> the link recovery state transition explicit after a link training
> failure: recovery can continue with an autoretrain, or must be handed
> over to userspace after fallback selection.
>
> This also prepares for replacing the sequential link training failure
> counter with an enum in a follow-up change.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 1c2cef7d61f37..eb922dca69c5b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1277,6 +1277,33 @@ link_recovery_autoretrain_allowed(struct intel_dp_link_training *link_training)
>  	return link_training->seq_train_failures < MAX_SEQ_TRAIN_FAILURES;
>  }
>  
> +/**
> + * link_recovery_mark_train_failure - record a link training failure
> + * @link_training: link training state
> + *
> + * Record a link training failure and advance the recovery state to
> + * indicate the next required recovery step.
> + *
> + * The caller must proceed with recovery as instructed by the return
> + * value, either via automatic retraining or, once automatic retraining
> + * is no longer possible, via userspace modesets after fallback
> + * selection.
> + *
> + * Return:
> + * - %true  if recovery should continue via automatic retraining.
> + * - %false if automatic retraining is no longer possible and recovery
> + *          must be delegated to userspace.
> + */
> +static bool
> +link_recovery_mark_train_failure(struct intel_dp_link_training *link_training)
> +{
> +	if (link_recovery_autoretrain_allowed(link_training))

Yeah, I still think combining the above check with the below reads
wrong.

> +		/* Move to autoretrain pending or autoretrain disabled state. */
> +		link_training->seq_train_failures++;
> +
> +	return link_recovery_autoretrain_allowed(link_training);
> +}
> +
>  /**
>   * intel_dp_stop_link_train - stop link training
>   * @intel_dp: DP struct
> @@ -1813,6 +1840,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
>  	struct intel_encoder *encoder = &dig_port->base;
>  	struct intel_dp_link_training *link_training =
>  		intel_dp->link.training;
> +	bool can_autoretrain;
>  	bool passed;
>  	/*
>  	 * Reinit the LTTPRs here to ensure that they are switched to
> @@ -1844,8 +1872,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
>  		return;
>  	}
>  
> -	if (link_recovery_autoretrain_allowed(link_training))
> -		link_training->seq_train_failures++;
> +	can_autoretrain = link_recovery_mark_train_failure(link_training);

The documentation says "the caller must" but the variable says "can".

Maybe the code here would read better if this wasn't conveyed in the
return value but rather in a separate call to
link_recovery_autoretrain_allowed().

Or should it be link_recovery_must_autoretrain() or
link_recovery_need_autoretrain()?

BR,
Jani.

>  
>  	/*
>  	 * Ignore the link failure in CI
> @@ -1864,7 +1891,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
>  		return;
>  	}
>  
> -	if (link_recovery_autoretrain_allowed(link_training))
> +	if (can_autoretrain)
>  		return;
>  
>  	if (intel_dp_schedule_fallback_link_training(state, intel_dp, crtc_state))

-- 
Jani Nikula, Intel
