Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE26C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD3B10E1D1;
	Thu,  3 Sep 2026 14:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYImCQej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222D010F5D3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788444227; x=1819980227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R71IR1Qhofh0+7qyDtkSugnxJ8a5fOnRGTcQ/aB9sgk=;
 b=HYImCQejbX8afGD5SqxO30zTkid3L1qitb4RUkLFZl4rscktlI1fS9mQ
 ukgWMS7S24u6rLYW9KZK8gqbTI5zT9BrFsl/eUQMVQSKPywMIzqBvZIro
 wMuLKw9uE/FgGxKLVL8zxjaR0AMxxtqo2NhrxBb034gKk/ZAOWv4tXpcu
 K1JmUqARbNLi/ws3ZLFpjQTgUwLVJHi6X1CmcP+tngW0E1fEVXYYBRC59
 djZi2BFfu6P6qYz7jcNO1jepyry9mx8uVbPpgH/DMaCBDqhTlTkivfN6U
 U6NXafUf646vZUzJQsbzTumj9d/YPSpwGiuONjQomMdJs2afT+58rHi3/ Q==;
X-CSE-ConnectionGUID: m70ws/08RkS13+FomE/7JQ==
X-CSE-MsgGUID: xuvb+wsNRdS0ANEOnnQFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87865970"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87865970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:46 -0700
X-CSE-ConnectionGUID: fwHWawMTSPCpxT83oEMZxg==
X-CSE-MsgGUID: L1AGViomSb2yyuPXmYjmxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267150146"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:43 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v4 0/4] drm/xe/sysctrl: Add System Controller debugfs
Date: Thu,  3 Sep 2026 07:03:40 -0700
Message-ID: <20260903140340.83500-6-anoop.c.vijay@intel.com>
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

Design question from v3 review:
The review suggested hiding the ras_error_inject debugfs file until 
the diag firmware is ready. Since there is no firmware-ready event 
to trigger registration, this revision keeps the file visible under
sc/ but blocks access. Both read and write operations return -ENODEV
until the diag firmware reports ready.

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


Anoop Vijay (4):
  drm/xe/sysctrl: Add System Controller get application status
  drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback test
    interface
  drm/xe/sysctrl: Add RAS error injection debugfs interface
  drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  82 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 405 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  98 +++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  41 ++
 8 files changed, 648 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

-- 
2.43.0

