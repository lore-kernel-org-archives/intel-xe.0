Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40240606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYqqmHCM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37010E2B0;
	Thu, 19 Nov 2026 16:37:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004F10E2B0;
 Thu, 19 Nov 2026 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795106248; x=1826642248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3tRBLPa9i77xTRnm6g71I4G07LlvsUyAV7jqMyH8I7Y=;
 b=NYqqmHCMW6yUUtjmDIHKwB8DlyKSoxVOS4Da1OZDIiQ21Yf+OPhcL/wk
 UDkKR+0+nZD716VZY6HTrs0XEdorYKrWle9g7zA4ca0Hnh7dnwikT9Z0u
 WWOBe8729uN8WbrD0C2IxUlm099ImC37EzdKawNIR2lsFGDo4Qz0divkP
 YTjBxZxh+2BK3Pw1YP0x0jcqThH4rlqtMD+NGbMs1mPYkoNKjWhyYIl2N
 K1HSiixME7vRbRonK6bLrWVNNAd4l1Evrd5/anXlc28a2JGriSREOnmbs
 6dcB2DXE8Zwv0sBj+Iwnn3fH4WXr4G3fUmukvBtmiGlLfLmcHPrfR8ye7 w==;
X-CSE-ConnectionGUID: f2DIKBaGTZ2Kuu5627nvZw==
X-CSE-MsgGUID: n0UCF22eQqSAQMdokXlarQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848145"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:37:28 -0800
X-CSE-ConnectionGUID: dQxcKwyoQ7OrC2t4Fkaw6w==
X-CSE-MsgGUID: /s15JNZ+QmqCu1gmoYaOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10460871"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:37:27 -0800
Date: Thu, 19 Nov 2026 18:37:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915: drop unnecessary display/ includes
Message-ID: <av8lw_oCiXk1l__H@intel.com>
References: <20261119151644.4097956-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119151644.4097956-1-jani.nikula@intel.com>
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

On Thu, Nov 19, 2026 at 05:16:43PM +0200, Jani Nikula wrote:
> Remove intel_display_core.h from uncore, and intel_crtc.h from initial
> plane as unnecessary.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

We'll trust the compiler on this one.

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_initial_plane.c | 1 -
>  drivers/gpu/drm/i915/intel_uncore.c       | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
> index d7792b65ec15..9dcb858b9e04 100644
> --- a/drivers/gpu/drm/i915/i915_initial_plane.c
> +++ b/drivers/gpu/drm/i915/i915_initial_plane.c
> @@ -6,7 +6,6 @@
>  #include <drm/drm_print.h>
>  #include <drm/intel/display_parent_interface.h>
>  
> -#include "display/intel_crtc.h"
>  #include "display/intel_display_types.h"
>  #include "display/intel_fb.h"
>  #include "gem/i915_gem_lmem.h"
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index b53059c1a782..4e10a02f5750 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -27,7 +27,6 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> -#include "display/intel_display_core.h"
>  #include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_regs.h"
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
