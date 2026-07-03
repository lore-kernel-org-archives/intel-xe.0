Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA80FC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 10:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B30F10F777;
	Fri,  3 Jul 2026 10:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdK4YVsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825510F777;
 Fri,  3 Jul 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783074164; x=1814610164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/KEYL5Y2JkryplvRYOXuZXHg30ko2RA6mKVJc7pzTwM=;
 b=JdK4YVsGV3hCOkKSTlO9glziEiZRrSjsH4cRLSEcBVlQ+6azeUa+2nen
 l6cVFlpsqwGPiYnCikm/X0JIOa+WvPzdvTiS2mNym3LaoSkEGqkwGoJk4
 ELBapqKfHOCXoVpQsekncW7aR2nBH1xT5rZ7k7P4iexKwijkn0FxFm+RA
 gfLN25OgoFRQO1sutX/vPsqvZtizXqKe24Gp+53SGGP6A5PQ9/8Yqwye/
 zHsUJqJWmhwRUr240u0jDOjPjTi7mWYPkQbSLkQ7TxioCpxjzkL/pFDLT
 zhS8nQAimnzwoavZv07MmPEHFe1KQq/pQD/+kUPeMTq7e4Wiu1BEbC+Gf w==;
X-CSE-ConnectionGUID: nZAJ5VgVTDiuY9krJ1UJsQ==
X-CSE-MsgGUID: 2zBU6xwFQUiv1ypl36S1HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83693061"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83693061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 03:22:44 -0700
X-CSE-ConnectionGUID: 1PXStL2NT5uF0+XNRl1q3Q==
X-CSE-MsgGUID: p5zN5GhnS0S8vBqrusIsag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252625244"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.162])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 03:22:43 -0700
Date: Fri, 3 Jul 2026 13:22:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [RESEND v2 0/8] drm/{i915,xe}: unify runtime pm calls
Message-ID: <akeNb7UeeFXMvbU8@intel.com>
References: <cover.1782913901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1782913901.git.jani.nikula@intel.com>
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

On Wed, Jul 01, 2026 at 04:52:58PM +0300, Jani Nikula wrote:
> Resend of [1], which is v2 of [2].
> 
> [1] https://lore.kernel.org/r/cover.1782311749.git.jani.nikula@intel.com
> [2] https://lore.kernel.org/r/cover.1781527161.git.jani.nikula@intel.com
> 
> Jani Nikula (8):
>   drm/i915: call intel_uncore_runtime_resume() for each gt
>   drm/i915: call intel_display_power_runtime_resume() on suspend error
>     path
>   drm/i915: move some display runtime suspend operations earlier
>   drm/i915: add intel_display_driver_pm_runtime*() functions
>   drm/{i915,xe}: add new
>     intel_display_driver_runtime_pm_{enable,disable}()
>   drm/xe/display: separate d3cold handling from
>     xe_display_pm_runtime_suspend_late()
>   drm/xe/display: add xe_display_pm_runtime_resume_early()
>   drm/xe/display: unify runtime suspend/resume with i915 for non-d3cold

I got a bit sidetracked into the system suspend code and the
somewhat tangled mess of gem/gt/uncore while looking at this,
but all of that looks mostly separate from this.

For the series
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  .../drm/i915/display/intel_display_driver.c   | 71 +++++++++++++++++++
>  .../drm/i915/display/intel_display_driver.h   |  8 +++
>  drivers/gpu/drm/i915/i915_driver.c            | 58 ++++-----------
>  drivers/gpu/drm/xe/display/xe_display.c       | 44 ++++++++----
>  drivers/gpu/drm/xe/display/xe_display.h       |  1 +
>  drivers/gpu/drm/xe/xe_pm.c                    |  2 +
>  6 files changed, 125 insertions(+), 59 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
