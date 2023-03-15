Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B0C7618B
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F3C10E986;
	Wed, 15 Mar 2023 09:44:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605C10E986
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678873454; x=1710409454;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y9JxLg2hgZ39SpSKF38POAX4w13Xl/365wtKTwYF0yg=;
 b=HyVG3PkzFM9h5MVIQ0z58zw2ioWir4jukR0DLSb5YVJM0vK8Mid8NNnp
 pqt0RFeWmdm714RmmchX0+IE+1EKQa8QRXeeu9iiJPdy6dpyJas3XEMxG
 6Bgl7UwqUZYQAV/9DnBijZ9qROKltENhcUNZkTiF4JkD2P1cMFc+W8I0x
 4U1+toY6wzpYh7fz8T6wU7Pv1VNWhPU6S2R79ORFko5JF94+Ixsrbbpf7
 xY1MvliWJ4rV6QQLQ4kI+hoJJg8+Drrlp8xT3O207DiGwhmS3BoWwu/Tn
 +QW1dEwhwOPv22xAaBcuslU24DftxyJ5JLAOu1ShzTwt+mqc93N0vmxjo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340021016"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340021016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709622195"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="709622195"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.32])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:44:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230315004902.2622613-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230315004902.2622613-1-lucas.demarchi@intel.com>
Date: Wed, 15 Mar 2023 11:44:09 +0200
Message-ID: <87y1ny5oye.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Silence kernel-doc warnings related
 to display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Add a "private:" comment to the part of the struct that is not expected
> to be documented, the one with display-related fields. This silence the
> following warnings:
>
> 	$ find drivers/gpu/drm/xe -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'  |  xargs ./scripts/kernel-doc -Werror  -none
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_type' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_id' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'wm_lv_0_adjust_needed' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_channels' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'symmetric_memory' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'type' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_qgv_points' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_psf_gv_points' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'dram_info' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'runtime_pm' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'sb_lock' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'skl_preferred_vco_freq' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'max_dotclk_freq' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'hti_state' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'snps_phy_failed_calibration' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'modeset_restore_state' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'global_obj_list' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'de_irq_mask' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display_irqs_enabled' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'enabled_irq_mask' not described in 'xe_device'
> 	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'params' not described in 'xe_device'
> 	22 warnings as Errors
>
> Fixes: 19026b7eb521 ("drm/xe: Remove i915 header dependency when building without display")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 034e0956f4ea..4c65598652e8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -244,6 +244,8 @@ struct xe_device {
>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>  	bool d3cold_allowed;
>  
> +	/* private: */
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  	/*
>  	 * Any fields below this point are the ones used by display.

-- 
Jani Nikula, Intel Open Source Graphics Center
