Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF17DD2D8FA
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 10:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2010E51A;
	Tue, 27 Jan 2026 10:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P679qVOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1152D10E51A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511240; x=1801047240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHpUVQFNOxiUvitHk52F3e2DeL0ksduHT2fduwW2VvI=;
 b=P679qVOjONvOKyBm464MoGtM2gFipMnjXhP/Yw0iqLYJ006+HWzyy2lS
 o/2saZiZD+u+8mg5snaXArhgHv7ghQ4zgwq6aTVIXWLTVoVr7XNAsxLL2
 qs/D8jN1EDoIIiY6sswFOJD7IHA4YLXCHLnI30+8MmQSjFV6H+pm44IgF
 +B3547hkNgLkw/hs1ZiK49TotWRPFjIIRNecTJYr8orWyg9Op08+ST3PP
 5TPmB6M0z+8hB04JehOWlhVi3nmgBfq7hWb/rUwwknvvEv2TUGw4KeSYG
 wpOHSTmeIuYGjBKmec1qKbh9t0kxMH8kPvf/qS9QPLEq1I8Si6wIFgwVL g==;
X-CSE-ConnectionGUID: iuItFpofTwm6FrhJC6Yp9Q==
X-CSE-MsgGUID: eFAEfQ6dR7OnDeSCDr2NIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70606718"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70606718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:54:00 -0800
X-CSE-ConnectionGUID: UTI7HjrHStiUP67nHXXudw==
X-CSE-MsgGUID: vvlQ6HEBQQ+EtwCPnD006w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207965515"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:53:56 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v5 1/6] drm/xe/sysctrl: Add System Controller register
 definitions
Date: Tue, 27 Jan 2026 02:53:45 -0800
Message-ID: <20260127105347.2651751-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
References: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add register definitions for System Controller mailbox
interface on Xe3p dGPU platforms.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt)
- Use lowercase hex values
- Align macro definitions to column 49
- Change to relative register offsets
---
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
new file mode 100644
index 000000000000..5875890d19dc
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_REGS_H_
+#define _XE_SYSCTRL_REGS_H_
+
+#include "xe_regs.h"
+
+#define SYSCTRL_BASE_OFFSET			0xdb000
+#define SYSCTRL_BASE				(SOC_BASE + SYSCTRL_BASE_OFFSET)
+#define SYSCTRL_MAILBOX_INDEX			0x03
+#define SYSCTRL_BAR_LENGTH			0x1000
+
+#define SYSCTRL_MB_CTRL				XE_REG(0x10)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY		REG_BIT(31)
+#define   SYSCTRL_MB_CTRL_IRQ			REG_BIT(30)
+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT		REG_BIT(29)
+#define   SYSCTRL_MB_CTRL_PARAM3_MASK		REG_GENMASK(28, 24)
+#define   SYSCTRL_MB_CTRL_PARAM2_MASK		REG_GENMASK(23, 16)
+#define   SYSCTRL_MB_CTRL_PARAM1_MASK		REG_GENMASK(15, 8)
+#define   SYSCTRL_MB_CTRL_COMMAND_MASK		REG_GENMASK(7, 0)
+
+#define SYSCTRL_MB_DATA0			XE_REG(0x14)
+#define SYSCTRL_MB_DATA1			XE_REG(0x18)
+#define SYSCTRL_MB_DATA2			XE_REG(0x1C)
+#define SYSCTRL_MB_DATA3			XE_REG(0x20)
+
+#define MKHI_FRAME_PHASE			REG_BIT(24)
+#define MKHI_FRAME_CURRENT_MASK			REG_GENMASK(21, 16)
+#define MKHI_FRAME_TOTAL_MASK			REG_GENMASK(13, 8)
+#define MKHI_FRAME_COMMAND_MASK			REG_GENMASK(7, 0)
+
+#define SYSCTRL_MB_FRAME_SIZE			16
+#define SYSCTRL_MB_MAX_FRAMES			64
+#define SYSCTRL_MB_MAX_MESSAGE_SIZE		(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
+#define SYSCTRL_MKHI_COMMAND			5
+
+#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS		500
+#define SYSCTRL_MB_RETRY_TIMEOUT_MS		20
+#define SYSCTRL_MB_POLL_INTERVAL_US		100
+
+#endif /* _XE_SYSCTRL_REGS_H_ */
-- 
2.43.0

