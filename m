Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F8E67A6B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 05:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A87E10E62F;
	Tue,  3 Mar 2026 05:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2sXts4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9510E62C;
 Tue,  3 Mar 2026 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772515202; x=1804051202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MzCLSMJtQYqsgVxKoCNu4SFvLJd6PlQw8eK71bvCWes=;
 b=i2sXts4NRunA9D/pxOxAfVNUi6W5u4Yr5KPnwtxOvuwEmjYgZ3WaM+iN
 q2uz/Mt3xKMQYbUc7JFs4r0Ya2wAGo/5qB54OIgKm18OXJgI0NFssYgzG
 NebMwM7DDAN82rPSmYmesC9ydMtsl9i59CswVlv77IPTk72hOxJGK5286
 T8bAA0P/h7d27D7XdAqvKvH/C8yoSQK2CPinmzTcHR6QOsOE5ffM/YCw3
 mIsYH9WYsPIUyqFpwxe8Gt8pudn6Te/OQIgeR7yoJclwB0va29qwh/RPk
 4y1+i2pP2HpvqPOhtGGlovDJxstKA7cn4MJH4tbDJIWKLpPKShCe9nA7R Q==;
X-CSE-ConnectionGUID: W+KmX4TCSbChS8alpGf+SA==
X-CSE-MsgGUID: 1g4hYtUVS+uxUr6QkZ8eZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73445403"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73445403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:20:01 -0800
X-CSE-ConnectionGUID: hMIJemb1RYCBYB9ozCdpuA==
X-CSE-MsgGUID: n5LwjUV5Sta+ipDUdt3wbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217110163"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:20:01 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v7 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Mon,  2 Mar 2026 21:19:47 -0800
Message-ID: <20260303051953.1453372-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

This series updates intel_vsec to improve const-correctness, decouple
helper APIs from PCI, enhance error handling, and plumb ACPI-based Intel
Platform Monitoring Technology (PMT) discovery through the vsec layer. It
is preparatory infrastructure for follow-on PMT core/telemetry and
PMC/SSRAM series that add ACPI discovery and support for new platforms.

The series is organized as follows:

Patches 1-2 refactor and improve const-correctness of base_addr handling.
Patch 1 makes base_addr an explicit parameter throughout the call chain,
clarifying ownership and removing conditional logic. Patch 2 then makes the
platform info data structure read-only, preventing unintended modifications
to shared driver data.

Patches 3-4 decouple the vsec layer from PCI-specific types, updating
helper APIs and data structures to use generic struct device instead of
struct pci_dev.  This enables vsec to work with both PCI and ACPI parent
devices.

Patch 5 enhances error visibility by returning meaningful error codes from
the registration path instead of collapsing to boolean success/failure.

Patch 6 adds infrastructure for ACPI-based PMT discovery, allowing client
drivers to consume discovery data from either PCI or ACPI sources.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Changes in v7:

Fix but found from incorrect struct device * passed to
intel_vsec_add_aux().  When the unused first parameter was originally
removed, the remaining device argument was inadvertently changed from the
aux device to the PCI device. Patch 3 restores &vsec_dev->auxdev.dev, and
patch 4 drops a follow-on change that would have reverted it back to the
PCI device.

David E. Box (6):
  platform/x86/intel/vsec: Refactor base_addr handling
  platform/x86/intel/vsec: Make driver_data info const
  platform/x86/intel/vsec: Decouple add/link helpers from PCI
  platform/x86/intel/vsec: Switch exported helpers from pci_dev to
    device
  platform/x86/intel/vsec: Return real error codes from registration
    path
  platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 121 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 143 insertions(+), 93 deletions(-)

--=20
2.43.0

