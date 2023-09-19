Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F8DCD5BC4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF9410E124;
	Tue, 19 Sep 2023 14:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2880310E24F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695132298; x=1726668298;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=VefoA3tZ9SquP4Lu9QNBbzAtR8L8zpA4W3gvkLbNoGY=;
 b=cAuMO30/meW34vApfmXRbxq9x/v0+P/yKR4fsFzMEcoLwINx6IZCKVXB
 Q6RwzVAaDsuhZA2mPU/LUaLolarrqHHoh22TwIYGlwdz00j84oipq/4UN
 uU5AlzOhYJkCXSh8aBlsmS3rWFmCSUD9ZIOuoG5Zl3t33qD/K9jG+OMVM
 iQZGkMJ0nWr+f8gxLZwpfy3xW410/S6NfXg8BFB2mcEeY8mqR/sfnPizo
 dcOB84XldUUm+LOksnXrCg93t2kJN2Uy/C6+Nqkbt2bLEHLYbaC1QA1fC
 bDIf7OHGAZ12l6psC8ONY++0PM1jr3AjvIrmI6ZpqigpyvAgy4ivxWwgo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446419489"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="446419489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836439565"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="836439565"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:04:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230918120229.338270-3-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
 <20230918120229.338270-3-chaitanya.kumar.borah@intel.com>
Date: Tue, 19 Sep 2023 17:04:31 +0300
Message-ID: <87y1h2s1hs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [RFC 2/3] drm/xe: Add wrapper over intel_step_name
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

On Mon, 18 Sep 2023, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> To maintain compatibility between xe and i915, let's create a
> wrapper with same name over driver specific calls made to
> retrieve the step name.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_step.c | 5 +++++
>  drivers/gpu/drm/xe/xe_step.h | 1 +

These files must not have references to struct drm_i915_private.

Try building with CONFIG_DRM_XE_DISPLAY=n.

BR,
Jani.

>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 371cac951e0f..9a79451ccf52 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -254,3 +254,8 @@ const char *xe_step_name(enum xe_step step)
>  		return "**";
>  	}
>  }
> +
> +const char *intel_get_step_name(struct drm_i915_private *i915)
> +{
> +	return xe_step_name(i915->info.step.display);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index a384b640f2af..3e78d46566a0 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -17,5 +17,6 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
>  				      u32 graphics_gmdid_revid,
>  				      u32 media_gmdid_revid);
>  const char *xe_step_name(enum xe_step step);
> +const char *intel_get_step_name(struct drm_i915_private *i915);
>  
>  #endif

-- 
Jani Nikula, Intel
