Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E7EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCC110E71F;
	Fri,  6 Feb 2026 12:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHi5wGoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A819310E71F;
 Fri,  6 Feb 2026 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770380017; x=1801916017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+w7iN+7qAw4LtlGc0+VPJA4cGPOsJIsPD0XPZJHhL6U=;
 b=SHi5wGoiP8IxKg1LSq1ws/M3GwR5RRte/yNjvwBULOdvN/vLRIK92xnK
 P8L3QCzHTdWtzT64cpDR2Zvha67aJBd6/SwialjC3IIuDsRC5Y5vhZsa7
 o/kGizXMHwWLC4NPrgTnVzzdLB2eBS9fP6sBHCiyHvjYTLbMxdCrvRLOy
 f1uhQVeeKmossNV/KjAcOG6641gpsCrqmZxsWXBbKyLfrxmKxq7v/VQym
 NHi+bTmvxmXBv2cwcWDgW+32RriyUZ+LSdHDRC7ETtWAPo3uDChr9dVSQ
 BdCgUiksmEQ7jOEo1XiGfAdayNKCzqo1/c8QAvvLCPRiaypY+UxD1+qCS Q==;
X-CSE-ConnectionGUID: JJ+zfeWhTDq9G4kbuSvqgA==
X-CSE-MsgGUID: Bs9bkDgFS6ezDt+fl8YAfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71765171"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71765171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:13:36 -0800
X-CSE-ConnectionGUID: fen5ZG6EQuKeNJdNHkEecQ==
X-CSE-MsgGUID: RVX4Y8PRT2O33hrxvlum2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248472583"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:13:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/10] drm/i915/dpt: refactoring, move to parent interface
Date: Fri,  6 Feb 2026 14:13:21 +0200
Message-ID: <cover.1770379986.git.jani.nikula@intel.com>
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

