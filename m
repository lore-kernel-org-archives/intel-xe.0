Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F22D3568E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9A910E628;
	Wed, 28 Jan 2026 08:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSI2ZP6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9443B10E627
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588069; x=1801124069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jT5A66TwxtBWedX1V5NxmT6ZIf9befRjTVAsqtJHlzk=;
 b=mSI2ZP6uJypW+9oMy9bpvtUtBpr8sp2kWj29FQmFt+F8wrSPcUkl3Owk
 l8kmqgWnxYdMwzgs6/8fJz85ga57KkkaaqVHGmd2UBxL3sizrUWB/Nvuy
 z7lPKtCJqV1Gb/I1XxqbdsHZ624D+h+pmOFPurKUZz4+o6VBsmCKWsTPu
 vHaL4z3nI/mgOZDX8kNaIniNVsgm+bkGmefnzQlgjs6uKoCZxyXpG4vND
 9jPdjL/nVSNqApGOqpE8X9eMO9j86fj0XB9EfurCG+n998eb6P8uIAQMs
 aXww7HL4txOpBnccxBmsX6nD8cEWFrjFYa4wcBPj40qKtBoFtzjmpVFGb w==;
X-CSE-ConnectionGUID: RwY1mdUOTYCFfQUjMgzMDg==
X-CSE-MsgGUID: RqIfFxDdTZeU55aP40oMhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643468"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74643468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:14 -0800
X-CSE-ConnectionGUID: l/Kc+b5bSsO3HblnWTSxIg==
X-CSE-MsgGUID: HBelr47QRgi0zZOnnrScOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231156812"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:10 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 1/6] drm/xe/sysctrl: Add System Controller register
 definitions
Date: Wed, 28 Jan 2026 00:14:03 -0800
Message-ID: <20260128081403.3138456-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
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

v6: (Matt)
- Move protocol constants to xe_sysctrl_mailbox_types.h
- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
---
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
new file mode 100644
index 000000000000..2e91febfa9a2
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
+#define   SYSCTRL_MB_CTRL_MKHI_CMD		REG_FIELD_PREP(SYSCTRL_MB_CTRL_COMMAND_MASK, 5)
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
+#endif /* _XE_SYSCTRL_REGS_H_ */
-- 
2.43.0

