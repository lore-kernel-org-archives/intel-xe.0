Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEAFCA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F710F407;
	Wed, 30 Sep 2026 13:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTqepYCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F3C10F407;
 Wed, 30 Sep 2026 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790775539; x=1822311539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LaiiNSkzSf7icoy9sdrrmyPyKtaK/+OOZCUZR86oD1M=;
 b=BTqepYCcFGYS97R/Axx/lYwvgjd5QQgqRKgenjVOF6TO3lwTteG00Oa4
 ZtNQMZIIExZPkoLj3WVCsZ6IeCx6Dpk+R2+9Ws2fwKZh/tdbnix7uO8nk
 5ee9Uoiz6XssjIwMB9Avde6M7WIxIiY6yv2303cudVCBCrj6UhNP2VOYO
 sY7Hn2aAL/aBgr+n6ZGOtdLeY4DtgI14lZTZZtv+gBzZbw/Q1i53E5wvy
 qDq3xsiPFtDNeQDz+FBoChJGLSk+DBx5j31kGFlGnWQBF1wBT2ss04HeA
 5n23j36FDeiO8QAT+WfjZNkFPCLmTNYP2R5ktqe1olWHWkGF7fZtyLwQw A==;
X-CSE-ConnectionGUID: xPOtMvspTKShZ99RmiFEJQ==
X-CSE-MsgGUID: IiGYBT7URIGqksFA6fxcJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79080106"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="79080106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:38:58 -0700
X-CSE-ConnectionGUID: R4LSPd67Rg6BSsD6WVGg3A==
X-CSE-MsgGUID: N0+/9xoQRMaLjh8+dyc4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="301961717"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:38:57 -0700
Date: Wed, 30 Sep 2026 16:38:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 00/10] drm/{i915, xe}: use a shared gtt_view_types.h header
Message-ID: <ar0Q7vanXDrMkc_u@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
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

On Tue, Sep 15, 2026 at 11:09:11PM +0300, Jani Nikula wrote:
> Move i915_gtt_view_types.h under include/drm/intel, and clean up.
> 
> Jani Nikula (10):
>   drm/intel: move i915_gtt_view_types.h to include/drm/intel
>   drm/intel: rename i915_gtt_view_is_*() helpers to
>     intel_gtt_view_is_*()
>   drm/intel: rename i915_gtt_view* struct/enum to intel_gtt_view*
>   drm/intel: add intel_gtt_view_is_partial() for completeness
>   drm/xe/display: use intel_gtt_view_is_*() helpers more
>   drm/i915/gem: use intel_gtt_view_is_*() helpers more
>   drm/i915/vma: use intel_gtt_view_is_*() helpers more
>   drm/i915/selftests: use intel_gtt_view_is_*() helpers more
>   drm/i915/debugfs: use the intel_gtt_view_is_*() helpers more
>   drm/intel: rename I915_GTT_VIEW_* enumerations to INTEL_GTT_VIEW_*

I did a quick rebase of my wip tile ys/64 stuff on top of it and
didn't spot anything bad. Spotted a couple of small nits (one in
the header and another in the selftests) to which I replied
separately.

Apart from that the series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  .../drm/i915/display/intel_display_types.h    |  4 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++---
>  drivers/gpu/drm/i915/display/intel_parent.c   |  4 +-
>  drivers/gpu/drm/i915/display/intel_parent.h   |  6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 14 ++---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           | 20 ++-----
>  drivers/gpu/drm/i915/i915_gem.c               |  6 +-
>  drivers/gpu/drm/i915/i915_gem.h               |  6 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 44 +++++---------
>  drivers/gpu/drm/i915/i915_vma.h               | 12 ++--
>  drivers/gpu/drm/i915/i915_vma_types.h         | 29 +++++----
>  drivers/gpu/drm/i915/selftests/i915_vma.c     | 60 +++++++++----------
>  .../compat-i915-headers/i915_gtt_view_types.h |  7 ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 28 ++++-----
>  include/drm/intel/display_parent_interface.h  |  8 +--
>  .../drm/intel/gtt_view_types.h                | 37 +++++++-----
>  19 files changed, 143 insertions(+), 170 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_types.h
>  rename drivers/gpu/drm/i915/i915_gtt_view_types.h => include/drm/intel/gtt_view_types.h (50%)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
