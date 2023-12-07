Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4812AC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FDD10E08D;
	Thu,  7 Dec 2023 15:07:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F0C10E08D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701961624; x=1733497624;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D9IYGbknn1D6PHrXuAGxdenQanRduLHZv6M9SxUQ65c=;
 b=Wd8ScTkJvCdJekDwMrcp6vhjEuUu0j2M20R5+0s0j1FTWIpXHnkl/JlS
 1TZ5N26GzbMMbIPTMXF+wWdYR2CJccPUgRAsvzfRBIPTUUL7kGw2oPikT
 PgTg8UZxdUT0yV7UcJpx8QG24FoZkYaq5Ba8LiRr1k/4d5sLRR+rzDIaV
 SohmhzaKzvTheh+41LVxRmQdKW+QOS5sK2qLup9C6+9Jsr9piw3VXicFl
 ygz5PJu3LOdLydqGiWHn386cGQgo3BMkVW2LgAth1aVRLPYDlI6muOfgq
 zF0lH3zzrfIRIGPvDqYhW4ii0blSJJRn8rFHIlh0putpXtk0+Rm3yLV00 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373738912"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373738912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="747988940"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="747988940"
Received: from jmadex-mobl.ger.corp.intel.com (HELO [10.249.34.28])
 ([10.249.34.28])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:07:03 -0800
Message-ID: <27508736-6fef-400d-9e39-0047e72e8ef5@linux.intel.com>
Date: Thu, 7 Dec 2023 16:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] fixup! FIXME: drm/i915/display: Remaining changes
 to make xe compile
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207130046.2350822-1-jouni.hogander@intel.com>
 <20231207130046.2350822-10-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231207130046.2350822-10-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2023-12-07 kl. 14:00, skrev Jouni Högander:
> We are defining I915_TILING_X and  I915_TILING_Y as 0. No need for these
> ifdefs anymore.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ae6bad4407eb..5522d6725474 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2441,15 +2441,11 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>   		fb->modifier = DRM_FORMAT_MOD_LINEAR;
>   		break;
>   	case PLANE_CTL_TILED_X:
> -#ifdef I915
>   		plane_config->tiling = I915_TILING_X;
> -#endif
>   		fb->modifier = I915_FORMAT_MOD_X_TILED;
>   		break;
>   	case PLANE_CTL_TILED_Y:
> -#ifdef I915
>   		plane_config->tiling = I915_TILING_Y;
> -#endif
>   		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>   			if (DISPLAY_VER(dev_priv) >= 14)
>   				fb->modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
