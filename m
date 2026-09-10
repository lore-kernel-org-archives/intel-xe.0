Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D8C79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 17:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7D210E0CA;
	Thu, 10 Sep 2026 17:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxz+mgdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01610E0CA
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789062987; x=1820598987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N5gWNHm1r3CMuFAPnQ9sAmcazK2kyAmSz/U6z+XmHTU=;
 b=cxz+mgdgr49xQg+i1tmx4SMRlwIVijX8G/D+Lgi0Bh/41h/kdZcmQRfu
 G6lemoDuOhHNTJs80HiGWRJREezcedHQFJNb+dmiBEHDg9345wgud9tjv
 5K+GBZ11S8e7OfHtbqcZV3yJzRS4Xy8W7sux6Beaic9dBG8k18l3YL5bz
 6C0TK2Oj2rZdRJl00ui4MltBSc77TGVlLEWvfllCZgmXVMZ6csseM4GqR
 MNw2vK/uJUGdKK02VBJGBVQoLbCzzIM60uy5AWz/NYzFgx/zD+6CVfVZO
 Z1Ptg3ralJ1SmNazIG23RoT2LurzthU7ivDkxq9rx9MY6qzKaPaHOuFrc w==;
X-CSE-ConnectionGUID: 7UW1dYFJTSWXDDoN+d0GAw==
X-CSE-MsgGUID: kOu6cT/PShO8y626ACFxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100183560"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100183560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:56:26 -0700
X-CSE-ConnectionGUID: 1MbFn5ilSEK1muUYeQ3hEw==
X-CSE-MsgGUID: lLnypKkyS6eELBLHecJz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271677830"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:56:23 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v5 0/3] drm/xe/sysctrl: Add System Controller debugfs
Date: Thu, 10 Sep 2026 10:56:19 -0700
Message-ID: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
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
 drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 438 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  33 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  44 ++
 6 files changed, 535 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

-- 
2.43.0

