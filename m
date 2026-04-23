Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF53FDEE2B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 16:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6610E341;
	Thu, 23 Apr 2026 16:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZcZdJALp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3E10E341;
 Thu, 23 Apr 2026 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776963232; x=1808499232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WS432+7KK/zIiljV0vPHVGPcL97XOzyQ4gICXq3GV/M=;
 b=ZcZdJALpBMdY327N5tKIxGx07zfgruEU077SX/EPG8yuJm9Dkm38Ycbs
 s2JjKveS7YzzWoSP2kiE7+bhCDRwvi4hy2J/gxgCfXPVKU9XNYKQB+cTK
 cXJNSJeL+BpbLGMxFHXK6/moAZFvq06ALnVXP0LwqvlxYBCLO0AN2+F/y
 E9jx2fgyUksE4MA+gZMocXtIghodeskgHC1K9kix0QuQBQ71mh0phtum+
 LX0evSaD2HocTSA+cffcFa2Qe2+rMdguCLoGFEtzyKaCvyVXV5ggv2t5u
 8XhmamvUjt05F8ifV+TffLhT+mvSjHSgHilokLdq8Fh1x9j2YXD67T2zq A==;
X-CSE-ConnectionGUID: QvR/OOgyQImeW+OIBYTnZg==
X-CSE-MsgGUID: 96HsX7LZTqCKNKVkaw6q1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88245145"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="88245145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:53:51 -0700
X-CSE-ConnectionGUID: L+whcjMyRdqiktxQmxLTwA==
X-CSE-MsgGUID: 42lxs6utQUq6gtYRDNQHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="237765004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:53:50 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/16] drm/i915: Introduce 'fb_pin' parent interface
Date: Thu, 23 Apr 2026 19:53:29 +0300
Message-ID: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Abstract the fb pin/unpin stuff under a new 'fb_pin' parent
interface. The interface is fairly low level so that the i915/xe
side doesn't need access to any display specific data structures.

There are perhaps some needless extra layers on the i915/xe side
afterwards, but we can clean those out later. There are also some
rough corners left in the initial fb code, but I'll be following
up with a separate series to fix/clean up that whole thing.

Ville Syrjälä (16):
  drm/i915: Introduce intel_parent_fb_pin_get_map()
  drm/i915: Move intel_fb_pin_params to the parent interface
  drm/i915: Move the i915_dpt_offset()==0 assert
  drm/i915: Reorganize intel_plane_pin_fb() a bit
  drm/i915: Introduce i915_fb_pin_dpt_(un)pin()
  drm/i915: Introduce i915_fb_pin_ggtt_(un)pin()
  drm/xe: Move the FORCE_WC assert into __xe_pin_fb_vma()
  drm/xe: Kill the fbdev vma reuse hack
  drm/xe: Reorganize intel_plane_pin_fb() a bit
  drm/xe: Introduce xe_fb_pin_dpt_(un)pin()
  drm/xe: Introduce xe_fb_pin_ggtt_(un)pin()
  drm/xe: Restructure reuse_vma()
  drm/i915: Introduce the main fb_pin parent interface
  drm/i915/fbdev: Use intel_parent_fb_pin_ggtt_(un)pin()
  drm/xe: Use xe_fb_pin_ggtt_pin() for the initial FB pin
  drm/i915: Consolidate the intel_plane_(un)pin_fb() implementations

 drivers/gpu/drm/i915/display/intel_cursor.c   |   1 -
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |  40 ----
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  22 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_parent.c   |  60 +++++
 drivers/gpu/drm/i915/display/intel_parent.h   |  34 +++
 drivers/gpu/drm/i915/display/intel_plane.c    | 122 ++++++++++-
 drivers/gpu/drm/i915/display/intel_plane.h    |   3 +
 drivers/gpu/drm/i915/i915_driver.c            |   2 +
 drivers/gpu/drm/i915/i915_fb_pin.c            | 205 +++++++-----------
 drivers/gpu/drm/i915/i915_fb_pin.h            |   9 +
 drivers/gpu/drm/xe/display/xe_display.c       |   2 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 145 +++++++------
 drivers/gpu/drm/xe/display/xe_fb_pin.h        |  21 ++
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  18 +-
 include/drm/intel/display_parent_interface.h  |  42 ++++
 16 files changed, 472 insertions(+), 258 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_fb_pin.h
 create mode 100644 drivers/gpu/drm/i915/i915_fb_pin.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_fb_pin.h

-- 
2.52.0

