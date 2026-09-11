Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B34C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C2910F548;
	Fri, 11 Sep 2026 08:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pe2RKPL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7B710F548;
 Fri, 11 Sep 2026 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113909; x=1820649909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/mnjh4HWCIn/IZVLPtZWOUlDPwXgsy9yA/VqurKiaE=;
 b=Pe2RKPL111D7U6dJMBaLKF3PPiFqgv3qNNLhsKuyO/DwjjbtAFv8FDIL
 xWepXVnNaa9P0VDj/0gGzrK4YeoXYNY3u+kzwPCkOi0VqqvUl+GF8S8OG
 NdSjl/XIw8mMpzcsQXH6TRlSCtJv7oor/oSC67AgR7oehoM8HzFdjh95o
 RfFWBmE7Nu43ZIYMRl/NQ4eIVsseKD5Jtoqwt1qgnHP+LVXqYPJcgoDVI
 GA3+1iam6lReyEM4Ww4/c4lILTAh4VojUIxuRjF+CL/sAN5WZToJQ8ob6
 I7/1svmbWorvrOeZGByWEt78uYoQRGknaljED6RT2b3aCZqHcqvgSeHbc w==;
X-CSE-ConnectionGUID: lMVIhAjiSMGgQUdo5ZPveA==
X-CSE-MsgGUID: 5ogi9/g6RXOcFwXrBvep3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094728"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:09 -0700
X-CSE-ConnectionGUID: Q3Kg2u9pRRu7fQswodGW5w==
X-CSE-MsgGUID: 4a46LTmvQCebnxBF7qXkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333282"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:06 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 00/10] pm_pme support on display hotplug
Date: Fri, 11 Sep 2026 11:04:38 +0300
Message-ID: <20260911080448.778316-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Introduce PME support for PME capable devices and avoid
HPD polling on runtime suspend. For PME capable devices
HPD will trigger PME which will wakeup the system. And
rest of the runtime resume call is same as before.

v2: Instead of plumbing keep_hpd and pme_capability to
    the existing interfaces, a separate helper function to
    set and get pme capability is added.

    HPD polling is handled directly inside the
    intel_hpd_poll_enable() based on the pme capability
    flag

v3: Lockdep related splats were observed during some rare testing
    scenarios. The PCI PME api to enable wake internally use kmalloc
    and can trigger deadlocks. So the calls to the PCI PME APIs are
    updated and placed within the no reclaim loop. Also any display
    specific calls are isolated within xe / i915 blocks and display
    parent interface is used to tackle the inter dependencies to
    keep the display module design clean. 

Vinod Govindapillai (10):
  drm/xe/pm: initialize the device's system wakeup capabilities
  drm/xe/pm: introduce PM PME support
  drm/xe/pm: avoid reclaim when arming PME wakeup
  drm/i915: add pme_enabled() to the parent interface
  drm/i915/xe: plug the pme_enabed implementation for xe
  drm/i915/hotplug: add helpers to track HPDs can generate PME
  drm/i915: plug the pm runtime handlers with PME HPD handling
  drm/xe/pm: clear PME HPD flag on runtime suspend error handler
  drm/i915/irq: conditional HPD IRQ resets based on PME capability
  drm/i915/hotplug: avoid HPD polling if the device is PME capable

 .../gpu/drm/i915/display/intel_display_core.h |  2 ++
 .../drm/i915/display/intel_display_driver.c   | 16 ++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  1 +
 .../gpu/drm/i915/display/intel_display_irq.c  | 19 ++++++++++------
 .../gpu/drm/i915/display/intel_display_rpm.c  |  7 ++++++
 .../gpu/drm/i915/display/intel_display_rpm.h  |  1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  | 15 +++++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h  |  3 +++
 drivers/gpu/drm/xe/display/xe_display.c       |  9 ++++++++
 drivers/gpu/drm/xe/display/xe_display.h       |  2 ++
 drivers/gpu/drm/xe/display/xe_display_rpm.c   |  8 +++++++
 drivers/gpu/drm/xe/xe_device_types.h          | 13 +++++++++++
 drivers/gpu/drm/xe/xe_pci.c                   | 22 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c                    | 20 +++++++++++++++++
 include/drm/intel/display_parent_interface.h  |  1 +
 15 files changed, 131 insertions(+), 8 deletions(-)

-- 
2.43.0

