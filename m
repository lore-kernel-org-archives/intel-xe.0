Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE2BC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 13:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518910E0A7;
	Fri, 25 Sep 2026 13:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXfuttPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8222710E0A7
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790344539; x=1821880539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GncsoC4GRNeqDZlIxO75mBhLTktn32lh3Q9WdN03YpI=;
 b=hXfuttPgTzx4M+2LNEmU+hTdlukggDIO6epr+53ZDWXISRFxAybJwdwf
 St7ArwgwexOkZ0Ac2fv2aKnapbZRWLKmLZOkjT4R7UVGMynFswrGvQhSE
 Df4n72b56QZOT/5rKDGxhHNtDTDbnVo5jc7nj4aIHUkl51KUCFKBVmEJw
 bZeTynBEpA6cIlwfy76MQOs1u1+lj2iGuEzLaodUa8077ZHpGL1I0/FWm
 0I2+ZabYA77hX2heFNQH7BvDcjGfSNaq10XWLLmLQgC5c8bYc2CjTAxpg
 dAmrs8q9M3GHP89qr1W9GMBTLO/U5gitU89X66dI7kXnMBEIBndEXDbse Q==;
X-CSE-ConnectionGUID: /1l+PsXPSaeJPGepeLzNXw==
X-CSE-MsgGUID: CbNaMghvQdSuOIdftqdBDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90993019"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90993019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:39 -0700
X-CSE-ConnectionGUID: 9poJIaD/TjqwvZZ75dfTaw==
X-CSE-MsgGUID: q+6HVk6MQCqLlIL2AEOw0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272914921"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:35 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michal.wajdeczko@intel.com, michael.j.ruhl@intel.com,
 paul.e.luse@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v7 0/3] drm/xe/sysctrl: Add System Controller debugfs
Date: Fri, 25 Sep 2026 06:55:20 -0700
Message-ID: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

This series adds debugfs-based test interfaces for the System
Controller (sysctrl) mailbox, to aid validation of firmware
communication and RAS error handling without requiring userspace
tooling.

Key features introduced:
- Debugfs infrastructure for sysctrl (types, registration hook)
- Loopback test entry exercising the mailbox send/receive path via
  the Core group's inverted loopback command (0xFF/0x03)
- RAS error injection entry exercising the Diag group's
  RAS_ERR_INJECT command (0x02/0x7E), gated on the diag application
  having completed firmware boot/init
- Generic mailbox passthrough entry for any group/command not
  covered by a dedicated entry

v7:
- Add per-command timeout override to mailbox debugfs
- Add per-command response-length override to mailbox debugfs
- Add usage hint to loopback debugfs output

v6 (Rodrigo):
- Reject non-zero offset writes for loopback, mailbox, and ras_error_inject entries
- Account for mailbox header size when validating input payload length
- Add warning on devm_mutex_init() registration failures
- Refactor token parsing to simplify cleanup and error handling

v5:
- Drop the application-status patch; already landed upstream
- Add per-entry locking for debugfs accesses
- Add xe_pm_runtime guards for ras_error_inject readiness checks
- Simplify ras_error_inject write-path flow
- Skip empty mailbox group/command tokens
- Drop unused xe_device.h include

v4 (Rodrigo, Anshuman):
- Added lore links to the parent application-status series
- Squashed debugfs infrastructure and loopback support into a single commit
- Gated ras_error_inject on diag firmware readiness in .open()
- Added a generic mailbox debugfs entry

v3:
- Fix RAS error injection command ID to 0x7E
- Add xe_pm_runtime guard for mailbox commands
- Rename error injection command to avoid fwctl command ID collision
- Reject writes until the diag firmware is ready

Anoop Vijay (3):
  drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test
    interface
  drm/xe/sysctrl: Add RAS error injection debugfs interface
  drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 500 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  37 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  47 ++
 6 files changed, 603 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

-- 
2.43.0

