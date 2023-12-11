Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E91C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 08:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051DE10E361;
	Mon, 11 Dec 2023 08:51:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CA210E361
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702284663; x=1733820663;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YABgfv3vKiVjxyMHlT5beDFjfJGB/h+NVxOTqfS8ck4=;
 b=mEsq/Up1gXeTqVL+qGLbkr370wFuF5I+NHw5L649LsEPSOB3Tr4+k/R1
 jO1GPlqbwbdiOcg5OAzFsJf71aiYQwVNdLzNESvORnqT5aYES+od/BjPw
 6hUxOrT7XFfziJC5jmqoNTpjaFoWBo1vIZG70xntk4QK3YcbYjzggfJpm
 NSAmGpz53+JX3fdgrg0uwhvSMKrnxbWk8cAb+5UOURBZUssUfRVeQcvUA
 +0mg1VNKNZ5PFv5cZFlv3Qtps+cJewNqpV+5bK5rQHEImgmKaNO7HcwkW
 +LJovp7FB6V6BI8Od8z2WYDQHrdCYISzx1PRFo9SaBF6Sr3RFej5m/jli w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="385021981"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="385021981"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 00:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="838944881"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="838944881"
Received: from kbalak2x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.68])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 00:51:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] fixup! drm/xe/display: Implement display support
In-Reply-To: <20231208204246.958662-2-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231208204246.958662-1-rodrigo.vivi@intel.com>
 <20231208204246.958662-2-rodrigo.vivi@intel.com>
Date: Mon, 11 Dec 2023 10:50:58 +0200
Message-ID: <8734w9yvf1.fsf@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> Adjust to display changes that already landed on drm-next for a smooth
> rebase.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and ack for merging both

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 8e67f38e98fd..5d2a77b52db4 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -98,11 +98,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
>  
>  #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> -#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
> -#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
> -				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
>  
> -#define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
>  #define IS_GRAPHICS_VER(xe, first, last) \
>  	((xe)->info.graphics_verx100 >= first * 100 && \
>  	 (xe)->info.graphics_verx100 <= (last*100 + 99))
> @@ -220,9 +216,6 @@ struct i915_sched_attr {
>  #define pdev_to_i915 pdev_to_xe_device
>  #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
>  
> -#define DISPLAY_INFO(xe)		((xe)->display.info.__device_info)
> -#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->display.info.__runtime_info)
> -
>  #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
>  #define HPD_STORM_DEFAULT_THRESHOLD 50

-- 
Jani Nikula, Intel
