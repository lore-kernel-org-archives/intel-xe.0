Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D1C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 19:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A9D10E779;
	Thu, 17 Sep 2026 19:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/LpuLPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D1910E779
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789673434; x=1821209434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHB2a04koqFtMIOeyqJ3SpO+93nOkWuMkbKDYP8LGyY=;
 b=R/LpuLPOpB1eW7jLl1yYaiBPEvew0WhJVtSmLe7j0HyH38IugF5tHPra
 icWJLxV36dMc/I0yfY0fZv/CPBnnxvNez0QkFdwKz6FWj2yYzuDrWIXEK
 ToFRIZAqlurvM6fzlwDABcX3uhjc8hnj9F3e39QB1S8gOY8ta75R1RKZC
 VRK5p9zx7YztL3GnkKWN10/vam3bj/6p59LSg+lWVXEJvkmaCzU16RSSo
 /wZFW5aCIqLrEsCdtE8kx/2OGphdfGI/1Ss5uG94ccENV/XQqCjZp2wDh
 LKGAlcWT+p7Ys10IKvivRfe+4X6IU105WwYOEeCmTYSZDCoEvoUB+87/P w==;
X-CSE-ConnectionGUID: 7ETv4O5LRleUXvN7v17tdg==
X-CSE-MsgGUID: +cdplUmsTO+lJ6etmKPJ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77697609"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77697609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:30:33 -0700
X-CSE-ConnectionGUID: Nd4GKbbqTJqYxWd/QfKUUQ==
X-CSE-MsgGUID: XzoDkXvuSTqZIStYXtvIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271327205"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:30:29 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 0/3] drm/xe/sysctrl: Add System Controller debugfs
Date: Thu, 17 Sep 2026 12:30:26 -0700
Message-ID: <20260917193026.3234636-5-anoop.c.vijay@intel.com>
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
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 460 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  44 ++
 6 files changed, 559 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

-- 
2.43.0

