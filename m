Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03161093180
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE1810E982;
	Fri, 20 Mar 2026 07:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n40Mpl09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807CB10E982
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773991549; x=1805527549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1KgDbSPu9fr83zcWJKh5870KIAdqsJf7sc0s2Va4h3Q=;
 b=n40Mpl094l3+ajs0eoBI0HCwSR9zO/W0cpXlcsUOkhlo+WUb6e06xbq7
 gYr6YTNV8tkrjwUNwXRCH7oWnm54N5d0i2CS3gpRLOj6ob2ZUsFigm3NR
 b4VqLCpwMAPvzn962E2yK6vkqbdjpymw3dfK8Sd7exAl5gm68dbAoRgf/
 I10aE5IuZSwu0pT8OvkSQC37NiNlCKtnyGyaoOHCT2nxz5yNlljP7ajQn
 79D3iRDmwfmB/5QBWPxs2xW//zTZotH92K4iYfcE+lIg73QvF7yLnMwP9
 UHN0hXhX/fIELkov1v4MYZ8DUZHU10sDM5euuyOSQzZVhRIM4e5ghngEQ w==;
X-CSE-ConnectionGUID: liGBGKKkQzKAqFZfMcGrog==
X-CSE-MsgGUID: lNSKgIv7TCeK+FV/REfX+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62634652"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62634652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:49 -0700
X-CSE-ConnectionGUID: 55nSlC//TzWhCNcS1Zr++w==
X-CSE-MsgGUID: 6p+ECexYRTm96TpcE0lEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227335870"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:45 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [RFC v1 3/5] drm/xe/fwctl: Add Xe FWCTL type definitions
Date: Fri, 20 Mar 2026 00:25:31 -0700
Message-ID: <20260320072528.1780651-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

Add type definitions required for Xe FWCTL infrastructure. Introduce
xe_fwctl_types.h to define core data structures used by driver,
including Xe FWCTL device context, per-file context, and firmware
operation hooks.

This patch adds type definitions only and does not introduce functional
FWCTL logic.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_fwctl_types.h | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl_types.h

diff --git a/drivers/gpu/drm/xe/xe_fwctl_types.h b/drivers/gpu/drm/xe/xe_fwctl_types.h
new file mode 100644
index 000000000000..22498f2b2fd9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fwctl_types.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_FWCTL_TYPES_H_
+#define _XE_FWCTL_TYPES_H_
+
+#include <linux/fwctl.h>
+
+struct xe_device;
+
+/**
+ * struct xe_fwctl - Xe fwctl device context
+ * @fwctl: Base fwctl device
+ * @xe: Back-pointer to Xe device
+ *
+ * This structure wraps the fwctl subsystem device with Xe specific
+ * context.
+ */
+struct xe_fwctl {
+	struct fwctl_device fwctl;
+	struct xe_device *xe;
+};
+
+/**
+ * struct xe_fwctl_uctx - Per-FD context
+ * @uctx: Base fwctl context
+ *
+ * Per file-descriptor context for Xe fwctl operations.
+ */
+struct xe_fwctl_uctx {
+	struct fwctl_uctx uctx;
+};
+
+/**
+ * struct xe_fw_ops - Per-firmware operations
+ * @name: Firmware name
+ * @rpc: Execute RPC
+ * @validate_scope: Validate RPC vs scope
+ *
+ * Operations table for each firmware type
+ */
+struct xe_fw_ops {
+	const char *name;
+	void *(*rpc)(struct xe_device *xe, enum fwctl_rpc_scope scope,
+		     void *in, size_t in_len, size_t *out_len);
+	bool (*validate_scope)(void *in, size_t in_len,
+			       enum fwctl_rpc_scope scope);
+};
+
+#endif
-- 
2.43.0

