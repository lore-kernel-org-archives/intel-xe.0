Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9A3C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 14:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02010E41C;
	Fri,  7 Aug 2026 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqMvsse7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0BD10E36A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786114598; x=1817650598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZnQmwCViM1WA22ivW3LKnEg4nXhGccIOXl6ReKu2GHE=;
 b=iqMvsse7amweYXSRvoscs+1ULT+1voSqimigicjIkVQXkxiAZvwjpSQU
 VXJP+alyfiSX+g63nEbVT+04jyCFb/EhqXxsBhGwC8RqfP5nSWA2UdPwT
 fay4v/rKGhEu1bJCRQ/X4AXBWJPvM36ipLkDwpVobP/mKdFvfjCScU+Hl
 dXeOp2FXVjsffTtmFUPiMj/4XGpDQ7DKpB23+pKYhjGxTKae7a28/gO5y
 1iDFQGIzeqOhYgEPMyxP/sCuTp+L2GjyCauCmNSVvDXl6XxT6rmSbRwsE
 cw0o/l/SzcGLOE8HwFJmoXm+LtF8inKdk4kV9t9B+KpdUXLQpWMn9qlYS A==;
X-CSE-ConnectionGUID: YrDto11dQhCOG1nu+lf0wg==
X-CSE-MsgGUID: 5FS2S3ITRnyvK2ujA99DDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90604293"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90604293"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:35 -0700
X-CSE-ConnectionGUID: e3C+4qg2SH+/GbDmiDv5QQ==
X-CSE-MsgGUID: BY4kM4sDTfaE6VKYKbFatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258116203"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:25 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 0/4] drm/xe/sysctrl: Add System Controller debugfs
Date: Fri,  7 Aug 2026 07:56:21 -0700
Message-ID: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
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

v3:
- Fix RAS error injection command ID to 0x7E
- Add xe_pm_runtime guard for mailbox commands
- Rename error injection command to avoid fwctl command ID collision
- Reject writes until the diag firmware is ready

Anoop Vijay (4):
  drm/xe/sysctrl: Add System Controller get application status
  drm/xe/sysctrl: Add sysctrl debugfs infrastructure
  drm/xe/sysctrl: Add loopback test debugfs interface
  drm/xe/sysctrl: Add RAS error injection debugfs interface

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  82 +++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 280 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  98 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  38 +++
 8 files changed, 520 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

-- 
2.43.0

