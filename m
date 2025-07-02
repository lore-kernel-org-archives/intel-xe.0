Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E6FC77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975B910E77D;
	Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSJyAME8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0B10E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484639; x=1783020639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RSHyyElGWfk6xlzqZmkXuQXvTk2sCT7tDDH7Y1erFcE=;
 b=HSJyAME8pVXIyEICIJBmSidPq5zXGn2BFYC8WtVPteOwqeLdO0SBPBI+
 Lo4Pjb6SN+ixWFl3uorj/LSu4wgxWI7lYTruNtQGkiR6Qoc/TzxuWREeg
 A0tCLoF8hFISVZwvNubtkF7FpLaSUpuWS8KPSJ+jzVfxHmvQcFAe2eLQM
 isHWxlkrXpPLrkTs+tPU67isAFi+oEG2vkcJi8iJU8S615jK3zadJmyub
 7qoaybS3hp96iVy5B1ibvPVEtjWmedA2i1ZWpwlEjFqyGCE5EJeIjMmvT
 h5LcQnkoD739KMHBaN5pqCTX1heIq2kQ9w7kVWVZgs7dwRnLpcDWEYj14 A==;
X-CSE-ConnectionGUID: yU6Q+b9GTfqUOrDHJIAGkg==
X-CSE-MsgGUID: Dt8ESEcSR/aTZtPO3aGVbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039089"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:39 -0700
X-CSE-ConnectionGUID: FlJHsvJfSryMlqyKDMsoCw==
X-CSE-MsgGUID: 0fK3C4WIT0am0abarzwZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615510"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:39 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 0/6] Create and use XE_DEVICE_WA infrastructure
Date: Wed,  2 Jul 2025 12:30:30 -0700
Message-ID: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
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

There is currently no way to apply and track workarounds that are needed
ahead of GT init. This series adds a bit field to the xe_device
structure similar to those in the GT structures to apply and track
workarounds applied at runtime (oobs).

Device workarounds in this new infrastructure are tracked in sysfs in a
new workarounds file.

Currently 15015404425 is the only workaround like this, so move it to
using this new infrastructure.

Wa_15015404425 is also needed for PTL A step compute dies. Implement two
workarounds. A device Wa_15015404425 oob workaround that applies for mmio
access before GMDID is available. A GT workaround Wa_15015404425_disbale
that disables the device Wa_15015404425 when it is not needed.

v2: Change naming from SoC to device, address styling issues, update
commit messages.
v3: rebase
v4: Fix compile issues
v5: rework xe_gen_wa_oob.c to be more versatile, move device oob init
into device_probe early, move xe_device new fields into a structure for
wa_active. Rename to xe_*_wa to xe_wa_* functions. Put the check to
XE_DEVICE_WA into 1 place (mmio_flush_pending_writes). Create a disable
macro, fix incidental bit clobbering. Reword explanation around PTL
Compute die A-step explanation in commit message.

Matt Atwood (6):
  drm/xe: add xe_device_wa infrastructure
  drm/xe: add new type to RTP context
  drm/xe: Add infrastructure for Device OOB workarounds
  drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
  drm/xe: extend Wa_15015404425 to apply to PTL
  drm/xe: disable wa_15015404425 for PTL B0

 drivers/gpu/drm/xe/Makefile               | 11 ++++-
 drivers/gpu/drm/xe/xe_debugfs.c           | 20 ++++++++
 drivers/gpu/drm/xe/xe_device.c            |  8 ++++
 drivers/gpu/drm/xe/xe_device_types.h      | 12 +++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c              |  5 +-
 drivers/gpu/drm/xe/xe_rtp.c               | 26 +++++++++++
 drivers/gpu/drm/xe/xe_rtp.h               |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h         |  2 +
 drivers/gpu/drm/xe/xe_wa.c                | 57 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h                | 22 ++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  2 +
 13 files changed, 196 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

-- 
2.49.0

