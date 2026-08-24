Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42139C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89710E571;
	Mon, 24 Aug 2026 16:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGzarkjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0910E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787588608; x=1819124608;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hDIZlaP+4nczcvgc6GW9pZL01RxDuDmv9CfsfD0k/0M=;
 b=XGzarkjAv2qHkQ/sQ3QcyFUDhEmUQP9JYVF0P8vzZrefX+cy7eZUsJkf
 xFRZmfhQcdoovAw9ODwLeAwfnqzEc62ptoQyuSEXSQMK2dOMFShk7JaBd
 xoOPiExiIZyOzFQ7Tq52MsyKCXJV++QZf+i6t3ZYpAYi3PsdaZ6EwMn75
 ynogpxdv2FSAgnskuZNVKKjoZRxThzAmI3Pty2o9r0i/GEH12bjiQaJWx
 Vc1kSysMKQoevbgkhIaB1r3tOPa1B84KHBcMtNMTWuslMgnwKg19KF37z
 31R/Y/qCanaU3pT/15HeTREBP8iMWOljvVwixoKm1da49/9A3/6KJ3Dxo w==;
X-CSE-ConnectionGUID: 83jyrjhVQmy+1a4Hx5xPpg==
X-CSE-MsgGUID: /XZlmyk1TmCyC+ajoOSMaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858047"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91858047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:27 -0700
X-CSE-ConnectionGUID: LkzE1ij2RWm2xEUsPbqo6Q==
X-CSE-MsgGUID: zrLvkM5ESOu6ABOvT123Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="267088121"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:27 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v3 00/10] Crescent Island PMT support
Date: Mon, 24 Aug 2026 09:23:16 -0700
Message-ID: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
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


Michael J. Ruhl (10):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: Add register access callbacks
  drm/xe/vsec: Protect against missing config
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support possible hotplug exit
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: Support late bind fw information
  drm/xe/vsec: Update PMT internal access for CRI

 drivers/gpu/drm/xe/regs/xe_pmt.h           |   9 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  44 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_vsec.c               | 536 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
 drivers/platform/x86/intel/pmt/class.c     |   5 +-
 drivers/platform/x86/intel/pmt/class.h     |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  39 +-
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  14 +-
 13 files changed, 607 insertions(+), 80 deletions(-)

-- 
2.43.0

