Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC48C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 07:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308E010E36E;
	Tue, 15 Apr 2025 07:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kD8hLTgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337210E36E
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744702853; x=1776238853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p0+YxlOPADY9oUzznCCAg64/ypcfga0hAwBaToSIwIA=;
 b=kD8hLTgSA3A5GRdtbF81ftHM/sUbWiR0D2rIpLvmjz29R4/Oy6B8CUdW
 21WUBnhnyTWL1EBtt1omo5UaqFhD4s/7mOHXyo9FMh/dL3F4RbSIZ3NNs
 mKzA6RjIRTUsPE6Wxq3Ai9ZPlFUONTFEezI8vSMUKPJ48NDFiFyS3hSDu
 3uKQbYtlC9lIxNyC0ANu0V/JLm7ykk+Z+iJNhU+KGob0i5jLfFBOPy5he
 Ftrfe44ulGG0KX/SuXwZvMN/ujoet7o2h7C5Iv9XbYAIBbL1p6CnVX4H6
 ccI0YYsLPgvfrdklE8c7lFxsIeanglwkS2sqLjxHG0cnKN7Z0UeSRwhyW Q==;
X-CSE-ConnectionGUID: kjXjPe8TTpqfoUi/CDM1Jg==
X-CSE-MsgGUID: hx1Oiy90S0uY8hPc/1+6iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45909107"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45909107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:40:44 -0700
X-CSE-ConnectionGUID: je8HW6vsQWqpWmc3Bo2sPw==
X-CSE-MsgGUID: SUDJ+/dXTU68PObp/mG6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130043729"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2025 00:40:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [RFC] drm/xe/vf: Allow to inject VF provisioning errors
Date: Tue, 15 Apr 2025 13:26:47 +0530
Message-ID: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

In unlikely event, due to PF malfunction or misconfiguration, VF may
receive incomplete or invalid configuration and it must be prepared
to handle such cases without causing a crash.

Since we believe that our PF implementation will not provide invalid VF
config, reuse existing FUNCTION_ERROR_INJECTION framework to alter VF
provisioning to verify driver reaction to unexpected or invalid
configurations.

However we can't use FUNCTION_ERROR_INJECTION directly on functions that
query VF provisioning, as all detected error conditions will cause
immediate abort. Instead define dummy functions, where we could inject
error using FUNCTION_ERROR_INJECTION framework, and any errors from these
functions will be used to adjust the received valid provisioning data into
the invalid one.

The following errors are recognized by these functions and to trigger
specific provisioning misconfiguration.

-ENODATA (-61)  : Force resource size to zero (unprovisioned)
-EREMCHG (-78)  : Force resource size smaller than received (should be
		  harmless until driver detects inconsistency)
-EINVAL  (-22)  : Force resource location invalid (like GGTT base
		  below WOPCM)
-ENOSPC  (-28)  : Force resource size bigger than HW limit
-EDQUOT  (-122) : Force resource size larger than received (will cause use
                  of unassigned part of the resource)
-ESRMNT  (-69)  : Force resource size larger than received with invalid
                  base address. (Will cause use of unassigned part of the
                  resource).

Fault can be injected with below steps (using GGTT resource and -ENODATA
error as an example)

$ FAILFUNC=xe_should_fail_ggtt_provisioning

$ echo $FAILFUNC    > /sys/kernel/debug/fail_function/inject
$ printf %#x -61    > /sys/kernel/debug/fail_function/$FAILFUNC/retval
$ echo 100          > /sys/kernel/debug/fail_function/probability
$ echo 0            > /sys/kernel/debug/fail_function/space

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
An IGT will be developed to further test and validate the functionality
introduced by this patch based on acceptance of this RFC patch.

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |  10 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c | 223 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h |  25 +++
 4 files changed, 261 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5ce65ccb3c08..d6651b9d5969 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -150,6 +150,9 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o
 
+xe-$(CONFIG_FUNCTION_ERROR_INJECTION) += \
+	xe_gt_sriov_vf_tweaks.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..af15cd8ed1aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -21,6 +21,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_sriov_vf_tweaks.h"
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_guc.h"
 #include "xe_guc_hxg_helpers.h"
@@ -406,6 +407,8 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	xe_gt_sriov_vf_tweak_ggtt(gt, &start, &size);
+
 	if (config->ggtt_size && config->ggtt_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
 				size / SZ_1K, config->ggtt_size / SZ_1K);
@@ -435,6 +438,8 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	xe_gt_sriov_vf_tweak_lmem(gt, &size);
+
 	if (config->lmem_size && config->lmem_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
 				size / SZ_1M, config->lmem_size / SZ_1M);
@@ -466,11 +471,16 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	xe_gt_sriov_vf_tweak_ctxs(gt, &num_ctxs);
+
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
 		return -EREMCHG;
 	}
+
+	xe_gt_sriov_vf_tweak_dbs(gt, &num_dbs);
+
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c
new file mode 100644
index 000000000000..200671da34ae
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "regs/xe_guc_regs.h"
+#include "xe_device.h"
+#include "xe_gt_sriov_printk.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_gt_sriov_vf_types.h"
+#include "xe_gt_sriov_vf_tweaks.h"
+
+#define DEFINE_FAIL_FUNC(NAME)  \
+	static noinline int NAME(void)  \
+	{                               \
+		return 0;               \
+	}                               \
+	ALLOW_ERROR_INJECTION(NAME, ERRNO)
+
+DEFINE_FAIL_FUNC(xe_should_fail_ggtt_provisioning);
+DEFINE_FAIL_FUNC(xe_should_fail_lmem_provisioning);
+DEFINE_FAIL_FUNC(xe_should_fail_context_provisioning);
+DEFINE_FAIL_FUNC(xe_should_fail_doorbell_provisioning);
+
+/**
+ * xe_gt_sriov_vf_tweak_ggtt - Tweak ggtt provisioning parameters
+ * @gt: the &xe_gt struct instance linked to target GuC
+ * @base : Pointer to base address of GGTT
+ * @size : Pointer to size of the GGTT region.
+ *
+ * Tweak provisioned GGTT parameters according to the error injected
+ * into xe_should_fail_ggtt_provisioning() using fault
+ * injection framework.
+ *
+ * Returns: None.
+ */
+void xe_gt_sriov_vf_tweak_ggtt(struct xe_gt *gt, u64 *base, u64 *size)
+{
+	u64 new_base, new_size;
+	int err;
+
+	err = xe_should_fail_ggtt_provisioning();
+	switch (err) {
+	case -ENODATA:
+		new_size = 0;
+		new_base = 0;
+		break;
+	case -EREMCHG:
+		new_size = *size - SZ_4K;
+		new_base = *base;
+		break;
+	case -EINVAL:
+		new_base = SZ_4G - SZ_4K;
+		new_size = SZ_4K;
+		break;
+	case -ENOSPC:
+		new_base = *base + *size - SZ_4K;
+		new_size = SZ_4K;
+		break;
+	case -EDQUOT:
+		new_size = *size + SZ_4K;
+		new_base = *base;
+		break;
+	case -ESRMNT:
+		new_base = *base - SZ_4K;
+		new_size = *size + SZ_4K;
+		break;
+	default:
+		xe_gt_sriov_dbg(gt, "ignored unsupported fault code %pe\n", ERR_PTR(err));
+		fallthrough;
+	case 0:
+		return;
+	}
+
+	xe_gt_sriov_notice(gt, "tweaking GGTT assignment: from %#llx-%#llx to %#llx-%#llx\n",
+			   *base, *base + *size - 1, new_base, new_base + new_size - 1);
+	*base = new_base;
+	*size = new_size;
+}
+
+/**
+ * xe_gt_sriov_vf_tweak_lmem - Tweak LMEM provisioning parameters
+ * @gt: the &xe_gt struct instance linked to target GuC
+ * @size : Pointer to size in the LMEM region.
+ *
+ * Tweak provisioned LMEM size according to the error injected
+ * into xe_should_fail_lmem_provisioning() using fault
+ * injection framework.
+ *
+ * Returns: None.
+ */
+void xe_gt_sriov_vf_tweak_lmem(struct xe_gt *gt, u64 *size)
+{
+	u64 new_size;
+	int err;
+
+	err = xe_should_fail_lmem_provisioning();
+	switch (err) {
+	case -ENODATA:
+		new_size = 0;
+		break;
+	case -EREMCHG:
+		new_size = *size - SZ_32M;
+		break;
+	case -EINVAL:
+		new_size = SZ_256M;
+		break;
+	case -ENOSPC:
+		new_size = SZ_512M;
+		break;
+	case -EDQUOT:
+		new_size = *size + SZ_512M;
+		break;
+	case -ESRMNT:
+		new_size = *size + SZ_1G;
+		break;
+	default:
+		xe_gt_sriov_dbg(gt, "ignored unsupported fault code %pe\n", ERR_PTR(err));
+		fallthrough;
+	case 0:
+		return;
+	}
+
+	xe_gt_sriov_notice(gt, "tweaking LMEM assignment: from %#llx to %#llx\n",
+			   *size, new_size);
+	*size = new_size;
+}
+
+/**
+ * xe_gt_sriov_vf_tweak_ctxs - Tweak context provisioning parameters
+ * @gt: the &xe_gt struct instance linked to target GuC
+ * @num_ctx : Pointer to number of contexts.
+ *
+ * Tweak provisioned number of contexts according to the error
+ * injected into xe_should_fail_context_provisioning() using
+ * fault injection framework.
+ *
+ * Returns: None.
+ */
+void xe_gt_sriov_vf_tweak_ctxs(struct xe_gt *gt, u32 *num_ctx)
+{
+	u32 new_num_ctx;
+	int err;
+
+	err = xe_should_fail_context_provisioning();
+	switch (err) {
+	case -ENODATA:
+		new_num_ctx = 0;
+		break;
+	case -EREMCHG:
+		new_num_ctx = *num_ctx - SZ_128K;
+		break;
+	case -EINVAL:
+		new_num_ctx = GUC_ID_MAX + 1;
+		break;
+	case -ENOSPC:
+		new_num_ctx = SZ_1;
+		break;
+	case -EDQUOT:
+		new_num_ctx = *num_ctx + SZ_128K;
+		break;
+	case -ESRMNT:
+		new_num_ctx = *num_ctx + SZ_4K;
+		break;
+	default:
+		xe_gt_sriov_dbg(gt, "ignored unsupported fault code %pe\n", ERR_PTR(err));
+		fallthrough;
+	case 0:
+		return;
+	}
+
+	xe_gt_sriov_notice(gt, "tweaking context assignment: from %u to %u\n",
+			   *num_ctx, new_num_ctx);
+	*num_ctx = new_num_ctx;
+}
+
+/**
+ * xe_gt_sriov_vf_tweak_dbs - Tweak doorbell provisioning parameters
+ * @gt: the &xe_gt struct instance linked to target GuC
+ * @num_dbs : Pointer to number of doorbells.
+ *
+ * Tweak provisioned number of doorbells according to the error injected
+ * into xe_should_fail_doorbell_provisioning() using fault
+ * injection framework.
+ *
+ * Returns: None.
+ */
+void xe_gt_sriov_vf_tweak_dbs(struct xe_gt *gt, u32 *num_dbs)
+{
+	u32 new_num_dbs;
+	int err;
+
+	err = xe_should_fail_doorbell_provisioning();
+	switch (err) {
+	case -ENODATA:
+		new_num_dbs = 0;
+		break;
+	case -EREMCHG:
+		new_num_dbs = *num_dbs - SZ_32;
+		break;
+	case -EINVAL:
+		new_num_dbs = GUC_NUM_DOORBELLS + 1;
+		break;
+	case -ENOSPC:
+		new_num_dbs = SZ_1;
+		break;
+	case -EDQUOT:
+		new_num_dbs = *num_dbs + SZ_256 + 1;
+		break;
+	case -ESRMNT:
+		new_num_dbs = *num_dbs + SZ_32;
+		break;
+	default:
+		xe_gt_sriov_dbg(gt, "ignored unsupported fault code %pe\n", ERR_PTR(err));
+		fallthrough;
+	case 0:
+		return;
+	}
+
+	xe_gt_sriov_notice(gt, "tweaking doorbells assignment: from %u to %u\n",
+			   *num_dbs, new_num_dbs);
+	*num_dbs = new_num_dbs;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h
new file mode 100644
index 000000000000..dfaac11f3e3a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_VF_TWEAKS_H_
+#define _XE_GT_SRIOV_VF_TWEAKS_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+void xe_gt_sriov_vf_tweak_ggtt(struct xe_gt *gt, u64 *base, u64 *size);
+void xe_gt_sriov_vf_tweak_lmem(struct xe_gt *gt, u64 *size);
+void xe_gt_sriov_vf_tweak_ctxs(struct xe_gt *gt, u32 *size);
+void xe_gt_sriov_vf_tweak_dbs(struct xe_gt *gt, u32 *size);
+#else
+static inline void xe_gt_sriov_vf_tweak_ggtt(struct xe_gt *gt, u64 *base, u64 *size) {}
+static inline void xe_gt_sriov_vf_tweak_lmem(struct xe_gt *gt, u64 *size) { }
+static inline void xe_gt_sriov_vf_tweak_ctxs(struct xe_gt *gt, u32 *size) { }
+static inline void xe_gt_sriov_vf_tweak_dbs(struct xe_gt *gt, u32 *size) { }
+#endif
+
+#endif
-- 
2.43.0

