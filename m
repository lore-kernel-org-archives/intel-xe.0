Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F781CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 12:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0510E84E;
	Mon, 28 Sep 2026 12:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dod74sO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA3D10E2AD;
 Mon, 28 Sep 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790599222; x=1822135222;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=AzpcIZA3dngKSt7ap47qd6sX46+AlEE10lXCZ3CWonY=;
 b=dod74sO21CwDp3mSqd3LBiRvWAJ6RPaRTNdiw962rkUG/iygFxLREHv2
 Ojfr3ozbImdT3YRfVJWCIJlvLZSNcHiwTQrluhmx0YGIYXxGCFc2Xj9zD
 miBJczRRlxOlT31dal5JRbVNXXu+Lsk17PHsPgMDqSi+3BVfqDRqd2xpa
 YjQljcy3MiBNUeLrVoBAmey3fERuLAscyAUzuF81S7pCEF272p6RSEyjU
 Qs8PLEoyNEa199leTYR5LWI6l+GHgFxd4uUWHdLCV3jx90AgaYMjHIwI9
 5ctRPx933bg40sBl9qDlh05HieyzrJy1uJpnZ78LAqj55YpKsQs+WSXd2 A==;
X-CSE-ConnectionGUID: 0W9pFLyQTCWIE2HTVP/ljg==
X-CSE-MsgGUID: A8E9YcvsT6mnltMpr0pZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="107675534"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="107675534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:40:22 -0700
X-CSE-ConnectionGUID: 2nLwI736QG64+xxeZOSrig==
X-CSE-MsgGUID: UzcoPp9cQRy6DrVkR4pofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="302992646"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:40:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 00/10] drm/{i915, xe}: use a shared gtt_view_types.h header
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1789502902.git.jani.nikula@intel.com>
Date: Mon, 28 Sep 2026 15:40:17 +0300
Message-ID: <239bd8bca68d576aeeccdbbe554ac3aa600ead15@intel.com>
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

On Tue, 15 Sep 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Move i915_gtt_view_types.h under include/drm/intel, and clean up.

Ville, any feedback on this?

BR,
Jani.

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

-- 
Jani Nikula, Intel
