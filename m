Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A5FD3762
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 14:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63D410E045;
	Wed, 25 Feb 2026 14:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3zG0e2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BAF10E045;
 Wed, 25 Feb 2026 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772030962; x=1803566962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FsyW8L/A0lmKuFh11SLYPdEF+QBTufzZSsBcc3siMUw=;
 b=T3zG0e2Je3V4EgdusTqYIj+nf6C2KmSD+n+yzFQ8N0nwMqUBU+V53W8A
 6lFv2iQ+ESHZOEGQNIFmhFl1bgB8d8FRJLUqSH8MaKJ2eCZAY9dPaRrMC
 kxASx8Fz11LGqbB7Zow9lV4Cq3nXh4q454XCEoneSq5B+FkCp/eGlTsZF
 5+s3jDEVG2PJBrmlV1Yu49BWz7nLkPz0aN8oCdoPoFdB9QLFKq0jpEZMy
 sQG9May3eOg6MjBW/fJLux8pbzudIDLsr3R+MVkPGKaS7xIXB0VmHB6g0
 LluaHU3LDDYKG5ALJK6JB578wX8Na4avEBlzRg+cYadBzIuN183dEuJ1I g==;
X-CSE-ConnectionGUID: Z/xgAnWQS1G/GJvcg5g9/w==
X-CSE-MsgGUID: PyH02wQZQdOf56+ACEJOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83398607"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83398607"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:49:22 -0800
X-CSE-ConnectionGUID: Ox3GuwVBQbaao34U9E93FA==
X-CSE-MsgGUID: TuG3OWykS+6zDEQtBczhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213369230"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:49:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/10] drm/i915/dpt: refactoring, move to parent interface
Date: Wed, 25 Feb 2026 16:49:06 +0200
Message-ID: <cover.1772030909.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Reposting [1] for CI.

[1] https://lore.kernel.org/r/cover.1770379986.git.jani.nikula@intel.com

Jani Nikula (10):
  drm/i915/dpt: move display/intel_dpt.c to i915_dpt.c
  drm/i915/dpt: pass obj, size instead of framebuffer to
    intel_dpt_create()
  drm/i915/dpt: move create/destroy to parent interface
  drm/i915/dpt: move suspend/resume to parent interface
  drm/i915/dpt: remove display/intel_dpt.h
  drm/i915/dpt: drop _common from the DPT file names
  drm/i915/dpt: switch to i915 runtime pm calls
  drm/i915/dpt: rename i915 specific functions to i915_dpt_ prefix
  drm/i915/dpt: rename struct i915_dpt to intel_dpt
  drm/i915/dpt: pass opaque struct intel_dpt around instead of
    i915_address_space

 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c      | 316 +++---------------
 drivers/gpu/drm/i915/display/intel_dpt.h      |  22 +-
 .../gpu/drm/i915/display/intel_dpt_common.c   |  35 --
 .../gpu/drm/i915/display/intel_dpt_common.h   |  13 -
 drivers/gpu/drm/i915/display/intel_fb.c       |  21 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  15 +-
 drivers/gpu/drm/i915/display/intel_parent.c   |  28 ++
 drivers/gpu/drm/i915/display/intel_parent.h   |   9 +
 .../drm/i915/display/skl_universal_plane.c    |   1 -
 drivers/gpu/drm/i915/i915_dpt.c               | 277 +++++++++++++++
 drivers/gpu/drm/i915/i915_dpt.h               |  20 ++
 drivers/gpu/drm/i915/i915_driver.c            |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  20 --
 include/drm/intel/display_parent_interface.h  |  11 +
 18 files changed, 419 insertions(+), 378 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h
 create mode 100644 drivers/gpu/drm/i915/i915_dpt.c
 create mode 100644 drivers/gpu/drm/i915/i915_dpt.h

-- 
2.47.3

