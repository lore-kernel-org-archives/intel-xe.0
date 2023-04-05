Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C326C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592F10E9FE;
	Wed,  5 Apr 2023 15:39:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAE310EA0F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709169; x=1712245169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gAE8lVJz6vHH0RJpgygE8Gl+3IdYvzH7z+ifnPfmW+E=;
 b=Xu1OzXnMnR9Xj4i2eF8RT6N6570in/VnTOHJ0f+oXi0hUUnOVy0ElLxk
 eD634P5nUWsQ9Jl540m8yzR63OuV7Knnx6RwheVVo1Nic84mAScUHFZPC
 yu98JcmI9cj3UJcFUgK62q47EoKQ110NulwOtN8EywIhxCyGtkET+i5Xs
 5UhktoOeqqe5Kdc3MRyohXjbz+m0P1ef49CbSdqIxoLw/L4FV9XLDuWpI
 hJtLSx90n8PdKglIo7jUQ+f4sYsRwaA8aua7ohPc8VDY3/gvYtI0lNbXI
 rBUEkKjTPPvrHOdlrChetnQJKNIFtIavZGOu++idoM6/KVqkAmLkv/+uR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210758"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210758"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295588"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295588"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:38:59 +0300
Message-Id: <20230405153920.926583-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/21] xe & i915 display integration ifdef
 cleanups
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey all, here's my first batch of #ifdef cleanups for xe and i915
display integration.

Many of the patches in this series break the build, and will get fixed
by subsequent changes. It's pretty much unavoidable as many of the
changes are standalone to i915, and others are fixups.

This is pretty straightforward stuff for starters, really. The idea is
that in the next rebase, the drm/i915 changes here go *before* any of
the current i915 changes.

Adding the static inline stubs for xe build in i915 (the !I915 parts) is
very helpful in not sprinkling #ifdefs all over the place. A lot of the
time, the compiler is able to just compile out lots and lots of
unreachable static functions and data without explicitly conditionally
building them out. We can leave a lot of it out from "drm/i915/display:
Remaining changes to make xe compile". This is crucial especially while
upstreaming by keeping the changes to i915 minimal.

Also, I think the conditional build and stubs in headers is the least
intrusive way of going about this before xe is actually upstream, and it
also follows the usual patterns for CONFIG_FOO=n code paths, albeit I915
is defined in the Makefile, not in kconfig.

BR,
Jani.



Jani Nikula (21):
  fixup! drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe
  drm/i915: define I915 during i915 driver build
  drm/i915/display: add I915 conditional build to intel_lvds.h
  fixup! drm/xe/display: Implement display support
  drm/i915/display: add I915 conditional build to hsw_ips.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  drm/i915/display: add I915 conditional build to i9xx_plane.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to intel_lpe_audio.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to intel_pch_refclk.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to intel_pch_display.h
  drm/i915/display: add I915 conditional build to intel_sprite.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  drm/i915/display: add I915 conditional build to intel_overlay.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++++++
 drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++++
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 15 +----
 .../gpu/drm/i915/display/intel_lpe_audio.h    | 20 ++++--
 drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++++
 drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++++++
 .../gpu/drm/i915/display/intel_pch_display.h  | 63 +++++++++++++++----
 .../gpu/drm/i915/display/intel_pch_refclk.h   | 25 ++++++--
 drivers/gpu/drm/i915/display/intel_sprite.c   | 20 +-----
 drivers/gpu/drm/i915/display/intel_sprite.h   |  8 +++
 drivers/gpu/drm/xe/Makefile                   |  2 -
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  7 +--
 14 files changed, 211 insertions(+), 71 deletions(-)

-- 
2.39.2

