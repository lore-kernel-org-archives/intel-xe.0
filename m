Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68896606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdNSwi2N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F3410F3C0;
	Tue, 10 Nov 2026 11:41:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB36B10EFDC;
 Tue, 10 Nov 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794310864; x=1825846864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5RB2wjgt1U5BVMdu5w5ghTikSgQ492TBZK/vSgymKxM=;
 b=CdNSwi2NfIDVQ89QFsZUq46KLM+JETEe6x1dEM56w7lFIAnQ21P328O/
 fm2PGCoUURtVpUJXGNlAHbjDuVe7iEpOFt/zLg7jaKtbPy6SxJonOD3XP
 PaLYtiGR4A88VnzzrBEJE0+T4RbZLVxRG9mgnvRGx9bpoTuaVnuwdfcw4
 Rksdfv3VYMrO66sfEsIUYYSrJYFT/QjCj6ggdU/rHabMeAlOrlt21x6Ch
 gc4+itPnxVxaxwcH4x0qxyOeiRfr8/mPyWpKU7lrz+qbOiLdScvtmIlxA
 isCokwUQaIclAevsHQT9UEP23wv+4wHQBS+WxXK+pM9t3agzMnLJ/UDMi A==;
X-CSE-ConnectionGUID: 5aiQ7p8SRhyvBOBr7SdWhQ==
X-CSE-MsgGUID: /3/BY9nFQC60tPY83nkf7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3050947"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3050947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:40:55 -0800
X-CSE-ConnectionGUID: GlGNXMqMQK+ILC/QygSWAw==
X-CSE-MsgGUID: hQQ0Q7eQTFm4Bbr1WXOHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8456708"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:40:55 -0800
Date: Tue, 10 Nov 2026 13:40:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Victor Carreras <vicajilau@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Don't recheck the eDP link state after a
 passing link training
Message-ID: <avMCw5rPER8uY_wu@intel.com>
References: <20261110101713.3684346-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110101713.3684346-1-mika.kahola@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:17:13AM +0000, Mika Kahola wrote:
> On eDP, a link retrain power cycles the panel. If the panel reports a
> transient link error after power-on, the link state recheck after a
> passing link training ends up in a retrain loop. Skip this recheck on
> eDP.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17737
> Tested-by: Victor Carreras <vicajilau@gmail.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index ac1aff6edf05..35bf29f7b996 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1800,12 +1800,23 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
>  
>  	intel_hpd_unblock(encoder);
>  
> -	if (!display->hotplug.ignore_long_hpd &&
> -	    link_recovery_autoretrain_allowed(link_training)) {
> -		int delay_ms = link_recovery_autoretrain_pending(link_training) ? 0 : 2000;
> +	if (display->hotplug.ignore_long_hpd ||
> +	    !link_recovery_autoretrain_allowed(link_training))
> +		return;
>  
> -		intel_encoder_link_check_queue_work(encoder, delay_ms);
> +	if (link_recovery_autoretrain_pending(link_training)) {
> +		intel_encoder_link_check_queue_work(encoder, 0);
> +		return;
>  	}
> +
> +	/*
> +	 * An eDP retrain power cycles the panel, which can retrigger
> +	 * a transient link error after power-on, leading to a retrain loop.
> +	 */

Is it a transient error? Ie. does the interlane align bit ping-ponging 
randomly or does it always (as in every link rate and lane count
that is possible) stay completely off after link training?

We know that on those crappy CH7511 bridges the bit only works during
link training, and then just permanently turns off when link training
ends. IIRC on those the bit disappears exactly when we switch the
training pattern off.

> +	if (intel_dp_is_edp(intel_dp))
> +		return;
> +
> +	intel_encoder_link_check_queue_work(encoder, 2000);
>  }
>  
>  static bool
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
