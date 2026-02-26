Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC171FC5910
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639B910E0B0;
	Thu, 26 Feb 2026 10:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7c+ZXLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC85C10E0B0;
 Thu, 26 Feb 2026 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100463; x=1803636463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ylYJdqUYN/81ukY4zavlMRxHteSE5PlgQHUauLu6hg=;
 b=T7c+ZXLXRGkLGPUYHk2rz4N3hoMbSClfo8RmZ+XBk7TvLqQpVUizy/u2
 uRGT7ZZuQsrfd08r+C4ZlcEIqAm9V6XH2Wje1eQa5ql4qZhc1fu/icWD4
 /Q7yRONLdiZVyhKgzZsu2DuqNwsvMgjOFz+A8xMloit4TZA2fqi77jjTJ
 wizn7vFvFzUsGePFJ02LVy9oAyyUKnvQkPSYqk1PYxw5c12+9t0c1eepn
 Mc6PfySfBntjktmGnBItEOGwAeZX3Pu3obIq/HACfX9tYk5Yq1Q69Molb
 0x3OuYXtWiYp60O1BejusChdcCzuZ8Fac31ROnnARglKbiRe7j54Fzh+R g==;
X-CSE-ConnectionGUID: HES+NtDKRz2uzJDYye456w==
X-CSE-MsgGUID: OYLAOBodT+u/pVp7+6FpxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83866848"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83866848"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:07:43 -0800
X-CSE-ConnectionGUID: IrT4mxnZRGSiK5H/CrtvVQ==
X-CSE-MsgGUID: AaD6SvS7QICzel67j5Dr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221512652"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:07:41 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/19] drm/i915/overlay: Convert to parent interface
Date: Thu, 26 Feb 2026 12:07:19 +0200
Message-ID: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
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

Split the overlay code into i915 vs. display parts and introduce
and new parent interface for the display->i915 calls.

The interface is rather verbose due to the interruptible ioctl
design of the overlay code. Ideally we'd implement the overlay
as a drm plane and tell it to flip via MMIO writes to OVADD,
at which point the parent interface could be limited to just
two functions to repartition the render cache as needed.
Maybe one day...

Smoke tested on i830 and i965gm.

v2: Deal with the IS_ERR() screwup
    Rebase due to kmalloc_obj() & co.

Ville Syrjälä (19):
  drm/i915/overlay: Remove GPU hang snapshot stuff
  drm/i915/overlay: Track current frontbuffer_bits
  drm/i915/overlay: Extract i915_overlay_is_active()
  drm/i915/overlay: Remove redundant overlay->active
  drm/i915/overlay: Relocate the underrun check
  drm/i915/overlay: Introduce i915_overlay_obj_lookup()
  drm/i915/overlay: Use struct drm_gem_object as the type
  drm/i915/overlay: Extract i915_overlay_reset()
  drm/i915/overlay: Extract i915_overlay_setup()
  drm/i915/overlay: Extract i915_overlay_cleanup()
  drm/i915/overlay: Abstract buffer (un)pinning
  drm/i915/overlay: Rename low level i915 specific functions
  drm/i915/overlay: Adjust i915 specific interfaces
  drm/i915/overlay: Make i830_overlay_clock_gating() i915 specific
  drm/i915/overlay: s/dev_priv/i915/
  drm/i915/overlay: Split 'struct intel_overlay'
  drm/i915/overlay: Don't use fetch_and_zero() in display code
  drm/i915/overlay: Move i915 specific code into i915_overlay.c
  drm/i915/overlay: Convert overlay to parent interface

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |   2 -
 .../drm/i915/display/intel_display_snapshot.c |   4 -
 drivers/gpu/drm/i915/display/intel_overlay.c  | 584 ++----------------
 drivers/gpu/drm/i915/display/intel_overlay.h  |  48 --
 drivers/gpu/drm/i915/display/intel_parent.c   |  76 +++
 drivers/gpu/drm/i915/display/intel_parent.h   |  26 +
 drivers/gpu/drm/i915/i915_driver.c            |   2 +
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_overlay.c           | 517 ++++++++++++++++
 drivers/gpu/drm/i915/i915_overlay.h           |  11 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/intel/display_parent_interface.h  |  33 +
 14 files changed, 726 insertions(+), 586 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_overlay.c
 create mode 100644 drivers/gpu/drm/i915/i915_overlay.h

-- 
2.52.0

