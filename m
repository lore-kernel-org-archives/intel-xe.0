Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF3C105F7AF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DCF10E0B0;
	Fri, 13 Mar 2026 14:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRH4A2Z/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319A110E135
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773412406; x=1804948406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FW7+tjyVrWm+4snsZOL00rg0hA3DzmUspt/hdx70qbM=;
 b=HRH4A2Z/Km91uC4dVkvH42gA7id1Ek4OCJkQYK5ccMqHj4Lu9Qn+cxer
 qlQegbOZg/U40ftqNa+7b2WKpPDBxRDwos9pjIAW4CUzyxVi2PTRN1XZ8
 kFH8nGDfQGiz/sPMw9QhSQc+Lfav9VQQfSoUTeMD+vi4OVyNsk/8r5pmk
 3Jw0UVGll20g2YjSG2OVAoQpSQPmM8MbA4aX/4RoBXzyzSkTE3r08sfML
 as/mFhUDLMuoBNWQ0ufUGPgrjo+T4v9VhBAGEl3g+bPhGzMSgwMqn5PLR
 81aqeXFs1rQtJPR7tUklywhluuWsff0UT260wpj9tdo2glOCZCloPgXCh w==;
X-CSE-ConnectionGUID: q0wl1LPuRA2lQ/FPporBIw==
X-CSE-MsgGUID: 6rcogTJdTkOVvZMMCtiCpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="73536521"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="73536521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:18 -0700
X-CSE-ConnectionGUID: nHF4jsTpSsqHPYoFquOe/g==
X-CSE-MsgGUID: Sc/i7hbzT32l0vytIOVB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216084326"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:15 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v10 2/7] drm/xe/xe_sysctrl: Add System Controller mailbox
 register definitions
Date: Fri, 13 Mar 2026 07:33:05 -0700
Message-ID: <20260313143303.2441609-11-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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

Add register definitions for System Controller mailbox interface,
including control, data, and protocol-related fields, along with base
address and BAR configuration required by the driver.

No functional changes. This patch introduces register definitions only.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v4: (Matt)
- Use lowercase hex values
- Align macro definitions to column 49
- Change to relative register offsets

v6: (Matt)
- Move protocol constants to xe_sysctrl_mailbox_types.h
- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro

v9: (Umesh, Badal)
- Normalized hexadecimal literal casing
- Renamed MKHI to SCHI (System Controller Host Interface)

v10: (Riana, Badal)
- Removed SCHI terminology and aligned to sysctrl mailbox naming
---
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
new file mode 100644
index 000000000000..59f3f3ec59a6
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
@@ -0,0 +1,36 @@
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
+#define   SYSCTRL_MB_CTRL_CMD			REG_FIELD_PREP(SYSCTRL_MB_CTRL_COMMAND_MASK, 5)
+
+#define SYSCTRL_MB_DATA0			XE_REG(0x14)
+#define SYSCTRL_MB_DATA1			XE_REG(0x18)
+#define SYSCTRL_MB_DATA2			XE_REG(0x1c)
+#define SYSCTRL_MB_DATA3			XE_REG(0x20)
+
+#define SYSCTRL_FRAME_PHASE			REG_BIT(24)
+#define SYSCTRL_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
+#define SYSCTRL_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
+#define SYSCTRL_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
+
+#endif
-- 
2.43.0

