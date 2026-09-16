Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F07C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D10C10E061;
	Wed, 16 Sep 2026 20:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol7YsE++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA6210E061
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789589515; x=1821125515;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PWnlhMpGnofAzPF5BkGQVb6futu9GUwQqchuzn4z5/w=;
 b=Ol7YsE++VYYRCNwE2QEerofi5SBo0uY/eCPP48S2KTfSFZ+0tQFUY23u
 7oF+XEoZnSpF+L5ESM+C6foahPcZ2E8/LjHUzTN7MoTjHYuzB3oPU5q7K
 pD3l42cL11mEEKFa4eu1KVmjw2QoM9OtZXQo2PA5/CVpH1JGgkBtV7IqF
 PwPXw6hBvWHAwsXcMAxajsFOWthcVIfjxCLmCDSari22czax7ZMVnBPT+
 5/WH5aTH9++hTBD1KnVbw7tTUBmuvyBXhVrmLhpi2gdm5WnJb8fk8AB6O
 fn2O3/vQtNJ4VfsmUM4x8KRMEeFPTIBePBkPj9Ud+DJ+ai5szVBG3Boeq A==;
X-CSE-ConnectionGUID: +a+l4/4LTl2h5IK71xWtRg==
X-CSE-MsgGUID: qvlJI/vMQ++X3cAsgKEdrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296126"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100296126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 13:11:54 -0700
X-CSE-ConnectionGUID: jyumWlmjTH+3MeskfYiJ/Q==
X-CSE-MsgGUID: 9yXiAwoUT3Gy8HWzI5b1Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277573967"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 13:11:55 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v9 00/20] Crescent Island PMT support
Date: Wed, 16 Sep 2026 13:11:38 -0700
Message-ID: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The Crescent Island (CRI) GPU supports PMT via Xe driver
registration.

The CRI PMT MMIO mapping is shared for each PMT feature and it is
necessary to set an index register value to access the correct memory
space.

The PMT driver has a callback infrastructure to access data areas with
driver specific access. It is does not support the PMT control access.

CRI discovery/control spaces are part of the access window so a driver
callback is necessary to allow for the correct window to be exposed.

Add control path callback support to the PMT driver.

Add CRI PMT discovery information.

Update the Xe driver to support the CRI PMT access.

The crashlog access needs to be done with power enabled (telem is only
available when the device is powered).

Determine which access is requested, and do the appropriate power
request.

CRI FW is loaded at device power.  Support the late-binding API to
wait for FW readiness. (pending sysctl patch set implements the API).

v2:
  Address AI feedback:
  - add missing entry->cb check
  - address SRIOV VF concerns
  - use xe_pm_runtime_put instead of _get in error path

  Address review comments:
  - redo power/lock sequencing
  - support device hotplug events

v3:
  - cleanup power manangement flow
  - fixed an out of order power management locking issue
  - add a GUID caching mechanism, for GUID read
  - removed unused parameter (mmio)

v4:
 - address various review comments
 - refactor crashlog to allow for return values
 - for callback usage, decouple PMT remap of data areas
 - use IS_SRIOV_VF() rather than expose soc-remapper internals
 - separate locking fixes intos distinct steps
 - refactor define update patches to seperate BMG and CRI updates
 - separate internal GUID into separate steps

v5:
 - removed callback helpers
 - do not return error message with sysfs
 - fix missed return code check in trigger_store
 - return error value not false
 - use DEFINE_RES_MEM
 - document when base is unused
 - return error on invalid GUID request

v6:
 - fix enabled/disabled inversion
 - fix missing DOC reference
 - change memcpy_to/fromio to readl/writel for register read
 - guid cache comment and update on valid guid

v7:
 - reordered to have BMG updates followed by CRI support
 - separate base_offset usage for clarity
 - added EAGAIN usage to block uninitialized use of the API

v8:
 - fix punit crashlog offset (should be 0xE60 not 0xE78)
 - remove EAGAIN support and re-order probe steps to initialize
   VSEC before other features use it

v9:
 - added appropriate reviewed-bys
 - use dev_err instead of pr_err
 - enforce defined base usage when callbacks are in plcace
 - move SRIOV check to get_platform_info
 - assert SRIOV for API check
 - use scoped_guard() where possible
 - update to use correct sysctrl helper

Michael J. Ruhl (18):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: refactor rmw with a return value
  platform/x86/intel/pmt: refactor rc with a return value
  platform/x86/intel/pmt: Add register access callbacks
  platform/x86/intel/pmt: Do not remap when using callbacks
  drm/xe/vsec: Do not register BMG PMT for VF
  drm/xe/vsec: Correct locking order
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Add DOC text for VSEC
  drm/xe/vsec: Support possible hotplug exit
  drm/xe/vsec: Refactor BattleMage PMT defines
  drm/xe/vsec: Update VSEC probe order
  drm/xe/vsec: Add base_offset to allow for more flexibilty
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Add PMT GUID internal access
  drm/xe/vsec: Update PMT internal access
  drm/xe/vsec: Refactor platform check

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 552 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |  26 +-
 drivers/platform/x86/intel/pmt/class.h     |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c  | 237 ++++++---
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |   3 +
 include/linux/intel_vsec.h                 |  14 +-
 16 files changed, 782 insertions(+), 167 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

-- 
2.43.0

