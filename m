Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E2EFCEE84
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 11:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE75410E73C;
	Wed, 25 Feb 2026 11:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDFN/PCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A2110E737;
 Wed, 25 Feb 2026 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772018352; x=1803554352;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EumsiuhtDvgkIHFRq6hQDCyQ98GaWhPwco5n7jYZF6w=;
 b=eDFN/PCQb9W8FIDHNMviZgE6nqbNcyFv2iHAAyvoHSmnmemcf3rhLsK3
 im0wpqPSdwTPYIUTjQRpLLO5zkV7CpuI9S8bIgeEV5i6EZn7WcysEL15T
 6aU2aOr0hnc7NWaYMbFk16cN0+wNn/CqzvA9MIrFhf4kTbashD1Tcb2RV
 WNAEqqBl4kBgo+ZC/vJiITXXMDC09v/luAsS0pQUNeKGKFJk+zpFIo86B
 aN+t8CGDViKinq1q9mxuFR9GLozWp003v05+rnFiyZOlDiF4Z68s7mZDd
 s8z6HneWITjJG2mdfK9iee2O094XDTUsFqrk2/pInFxQKnrdMwPiZQ3WE A==;
X-CSE-ConnectionGUID: mLIR4hEtTSKCVxmPxC1jvw==
X-CSE-MsgGUID: csGuNmrsQ62Un83XrspTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76886559"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76886559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:19:11 -0800
X-CSE-ConnectionGUID: WrZj4NZ1QSOsAPgQ8PGa3g==
X-CSE-MsgGUID: ATgkCkGTStGv2QyBBqg15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="253962917"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:19:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 00/19] drm/i915/overlay: Convert to parent interface
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 13:19:07 +0200
Message-ID: <fb7caf29eb98ab56697d9b9d8f14d2a1d0f62006@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 18 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Split the overlay code into i915 vs. display parts and introduce
> and new parent interface for the display->i915 calls.
>
> The interface is rather verbose due to the interruptible ioctl
> design of the overlay code. Ideally we'd implement the overlay
> as a drm plane and tell it to flip via MMIO writes to OVADD,
> at which point the parent interface could be limited to just
> two functions to repartition the render cache as needed.
> Maybe one day...
>
> Smoke tested on i830 and i965gm.

I'm a bit sad how verbose the interface ended up being, especially
considering I was prepared to nuke the entire thing [1].

I reviewed this fairly lightly, commented in a few places, and I'm happy
enough with the end result, even if not thrilled. As always, I'm pretty
much trusting you to maintain and test this, as we don't have relevant
tests in IGT nor machines in CI, and we're not really getting bug
reports for the oldest platform anymore either.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Along with the error pointer fix, the whole thing needs a rebase due to:

69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar ty=
pes")
bf4afc53b77a ("Convert 'alloc_obj' family to use the new default GFP_KERNEL=
 argument")

from upstream.

[1] https://lore.kernel.org/r/20260204164827.807502-1-jani.nikula@intel.com


>
> Ville Syrj=C3=A4l=C3=A4 (19):
>   drm/i915/overlay: Remove GPU hang snapshot stuff
>   drm/i915/overlay: Track current frontbuffer_bits
>   drm/i915/overlay: Extract i915_overlay_is_active()
>   drm/i915/overlay: Remove redundant overlay->active
>   drm/i915/overlay: Relocate the underrun check
>   drm/i915/overlay: Introduce i915_overlay_obj_lookup()
>   drm/i915/overlay: Use struct drm_gem_object as the type
>   drm/i915/overlay: Extract i915_overlay_reset()
>   drm/i915/overlay: Extract i915_overlay_setup()
>   drm/i915/overlay: Extract i915_overlay_cleanup()
>   drm/i915/overlay: Abstract buffer (un)pinning
>   drm/i915/overlay: Rename low level i915 specific functions
>   drm/i915/overlay: Adjust i915 specific interfaces
>   drm/i915/overlay: Make i830_overlay_clock_gating() i915 specific
>   drm/i915/overlay: s/dev_priv/i915/
>   drm/i915/overlay: Split 'struct intel_overlay'
>   drm/i915/overlay: Don't use fetch_and_zero() in display code
>   drm/i915/overlay: Move i915 specific code into i915_overlay.c
>   drm/i915/overlay: Convert overlay to parent interface
>
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/display/intel_display_regs.h |   2 -
>  .../drm/i915/display/intel_display_snapshot.c |   4 -
>  drivers/gpu/drm/i915/display/intel_overlay.c  | 584 ++----------------
>  drivers/gpu/drm/i915/display/intel_overlay.h  |  48 --
>  drivers/gpu/drm/i915/display/intel_parent.c   |  76 +++
>  drivers/gpu/drm/i915/display/intel_parent.h   |  26 +
>  drivers/gpu/drm/i915/i915_driver.c            |   2 +
>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>  drivers/gpu/drm/i915/i915_overlay.c           | 517 ++++++++++++++++
>  drivers/gpu/drm/i915/i915_overlay.h           |  11 +
>  drivers/gpu/drm/i915/i915_reg.h               |   4 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/intel/display_parent_interface.h  |  33 +
>  14 files changed, 726 insertions(+), 586 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/i915_overlay.c
>  create mode 100644 drivers/gpu/drm/i915/i915_overlay.h

--=20
Jani Nikula, Intel
