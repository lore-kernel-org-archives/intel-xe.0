Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E3D3943C
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 14:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D7B10E11F;
	Thu,  2 Apr 2026 14:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJySxNPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F295610E029;
 Thu,  2 Apr 2026 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775141651; x=1806677651;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IvrebDV5tcRc6hmsKu3ts3RSE15QkjXmjL9pjQ8fiw0=;
 b=oJySxNPMCvSSqCd1/zsMIMtX/ixZ7BoipjLTqp5m6am3s1j81gNM4JQt
 VB1HnJjnCTBVF3YQCyfqtkggemKpFdPFydRRD6mvAuM6IJewAD8VEqYrT
 XK4SX/6csJuBV+TvpKp41n4ucA0fUmxVPWUXhrF57ZIYZ6Gura3qnVH3o
 3qqMWSzjljnlpCq3d3qQi6BwgJPpIJgyZOIwrCtWAOoTm26Zb/4ZxWvPr
 TGhZVLw1LlqNgNQc7T6Y0OKZqTACRGcG8pfPIKdl4EM5Dr03cGrQ0zUS/
 GsTMwboOrJqYV6EFOfRaFPq16mAZBHwyw4phF5vKXQ+Gn8GeU5Gk7eKa1 g==;
X-CSE-ConnectionGUID: RAHy1U5tRPKA4Y5AqZtjcw==
X-CSE-MsgGUID: 623TyyYFT32tzUC2wJfNKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87274843"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="87274843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:54:11 -0700
X-CSE-ConnectionGUID: wdSwvnE5TkWKoyZkUl9r4A==
X-CSE-MsgGUID: l7rwbM+mT8GFF+DefJ6sqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="225995143"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.183])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:54:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915: Track fence region ID in plane state
In-Reply-To: <20260331162138.19258-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331162138.19258-1-ville.syrjala@linux.intel.com>
Date: Thu, 02 Apr 2026 17:54:05 +0300
Message-ID: <100e73f5d1363ca1b2269f6deeb67443727efaf4@intel.com>
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

On Tue, 31 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> @@ -203,7 +204,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  		ret = 0;
>  
>  		if (vma->fence)
> -			*out_flags |= PLANE_HAS_FENCE;
> +			*out_fence_id |= vma->fence->id;

That should obviously be an assignment rather than OR.

I was reviewing the recently enabled Sashiko LLM reviews, and it had
spotted this one [1].

> @@ -314,7 +314,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  				   fb->min_alignment, 0,
>  				   intel_fb_view_vtd_guard(&fb->base, &fb->normal_view,
>  							   DRM_MODE_ROTATE_0),
> -				   false, &flags);
> +				   &fence_id);

This might also change behaviour as previously uses_fence == false.

BR,
Jani.



[1] https://sashiko.dev/#/patchset/20260331162138.19258-1-ville.syrjala%40linux.intel.com



-- 
Jani Nikula, Intel
