Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A11CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61EF10E16E;
	Wed, 20 Sep 2023 09:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA9A10E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695203539; x=1726739539;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2EIQsqjJauT3xaa9m2DcPy62x4Lf+v1g70fZznhFjQY=;
 b=hBYzmtFHGQpDkPcMAPgFqgb/1s40ZbyvfJyOxB8xqd7mrquTJ9OueBK/
 7+CVVvdoNh05UijsFCoolMu+XTd/y8vsfN6m04G3NzzKKT6aj9TKjrGQ3
 N9wKEEP8UhDR6921S9HfJg0L/ImpRVYKxShFLsIbNGoM2WesIhNVbmd2L
 XGHVPSI0XnRhcK6ytkTweSOQMDrcmPWAUzOQAacXB5qizswwrjMb32tCY
 yVSjfvI55djlqYXTuQ1ecLW0sRZs7IC2K2zlZtaq3eH+wL6XyryfjDhw5
 uELOgmikv1mFGnHbvv3qWKW1pa8LA7RpKMUM7h0+7S11dPJ3dN0HR7fqC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411121466"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="411121466"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077370112"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="1077370112"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:52:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230920071700.434195-2-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
 <20230920071700.434195-2-chaitanya.kumar.borah@intel.com>
Date: Wed, 20 Sep 2023 12:52:11 +0300
Message-ID: <87editrx2s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [RFC 1/3] drm/i915: Add wrapper for xe compatibility
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

On Wed, 20 Sep 2023, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> Add a wrapper around intel_step_name to maintain compatibility
> with xe driver. The wrapper will share the same name as the one
> to be used by xe while both drivers include different files as
> needed during compilation.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_step.c | 5 +++++
>  drivers/gpu/drm/i915/intel_step.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index c02a6f156a00..6b62b5fcc792 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -352,3 +352,8 @@ const char *intel_step_name(enum intel_step step)
>  		return "**";
>  	}
>  }
> +
> +const char *intel_get_step_name(struct drm_i915_private *i915)
> +{
> +	return intel_step_name(RUNTIME_INFO(i915)->step.display_step);
> +}

Okay, so I've mulled this back and forth. Here's the, uh, steps I think
should be taken:

1) Please name this intel_display_step_name() or
   intel_step_display_name() or something. It's about *display*
   stepping, and just intel_get_step_name() is a misnomer.

2) Use this in intel_dmc.c.

3) Send the above to intel-gfx, based on drm-tip. Make it into a single
   patch. Get it merged to upstream i915.

4) On xe, revert the FIXME patch in question.

5) Add a fixup to remove "#define intel_step_name xe_step_name" from
   compat-i915-headers/i915_drv.h

6) Backport the upstream patch from 3) to xe.

7) Add xe_step_display_name() or similar, mimicking the one added to
   i915. Don't name it the same as in i915.

8) In compat-i915-headers/intel_step.h, add a static inline to bridge
   the call from intel_step_display_name() to xe_step_display_name(). Or
   make it a #define.


BR,
Jani.



> diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
> index 96dfca4cba73..25a1b1948a43 100644
> --- a/drivers/gpu/drm/i915/intel_step.h
> +++ b/drivers/gpu/drm/i915/intel_step.h
> @@ -78,5 +78,6 @@ enum intel_step {
>  
>  void intel_step_init(struct drm_i915_private *i915);
>  const char *intel_step_name(enum intel_step step);
> +const char *intel_get_step_name(struct drm_i915_private *i915);
>  
>  #endif /* __INTEL_STEP_H__ */

-- 
Jani Nikula, Intel
