Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61665C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 07:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059E910E1EA;
	Fri, 23 May 2025 07:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeR5/BYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E767F10E1EA
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747984826; x=1779520826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0M9tFD1uqdral19Lk0l87u8oIW6hoghlJLimK1d5vmU=;
 b=SeR5/BYBw/6KQ1IH5N0eicOx2OwIesk7pR/dApVmc1tSwd+G36L6LEQR
 cMIr+63KGJGy1akGn1ue+BZvC3neTo1G9He3r6trRWPz7lOdGAp9/tx6j
 hKNACHcvl/u9GUxR5MrjhiaCaQdQTLWrQalfaJFl29cyrC9sfQVtdruT9
 7srdLluPQZEIboCkrJN0CXyFtuEEBFl2SyA4sCDtVRuWXHG7gSUA1GGe1
 kDZNyjQq44fnR1GmrmKv3QIxceQHTxNDBNQpbjJQCaP9wYl652pmxwH1s
 1tNPihGApwgOaNmjg6jkaxxQgnKKxo5haviFuvasXBmf2WpXtwg77SlYk Q==;
X-CSE-ConnectionGUID: aN2fgc/VQF2RG88Pz17ZFA==
X-CSE-MsgGUID: t8e0O/hQQICPf9pv6vo0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37658011"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="37658011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 00:20:26 -0700
X-CSE-ConnectionGUID: fSaC7afuTCSoLvBXMMQbSQ==
X-CSE-MsgGUID: Aej6VB/nQF+wwr9wfKTJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141569841"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 23 May 2025 00:20:24 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC v2] drm/xe/vf: Allow to inject VF provisioning errors
Date: Fri, 23 May 2025 13:06:32 +0530
Message-ID: <20250523073638.24842-1-satyanarayana.k.v.p@intel.com>
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

Using the combination of "times" and "space" parameters provided by fault
injection framework, fault can be injected into the provisioning of
ggtt/lmem/ctx/dbs.

Steps to inject fault using "times" and "space" are given below.

|=============|=============|==================|===============|
|   space     |     times   | fault for IGFX   |fault for DGFX |
|=============|=============|==================|===============|
|    1        |      1      |    GGTT          |    GGTT       |
|=============|=============|==================|===============|
|    2        |      1      |    context       |    lmem       |
|=============|=============|==================|===============|
|    3        |      1      |    doorbells     |    context    |
|=============|=============|==================|===============|
|    4        |      1      |     NA           |    doorbells  |
|=============|=============|==================|===============|

Fault can be injected with below steps (using GGTT resource and -ENODATA
error as an example)

$ FAILFUNC=xe_should_fail_vf_provisioning

$ echo $FAILFUNC    > /sys/kernel/debug/fail_function/inject
$ printf %#x -61    > /sys/kernel/debug/fail_function/$FAILFUNC/retval
$ echo 100          > /sys/kernel/debug/fail_function/probability
$ echo 1            > /sys/kernel/debug/fail_function/space
$ echo 1 	    > /sys/kernel/debug/$FAILTYPE/times

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

---
V1 -> V2:
- Created a single function to inject fault instead of seperarte functions
---
 drivers/gpu/drm/xe/Makefile                |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |  10 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c | 220 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h |  25 +++
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4bf484d4121..8dea08f451f7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -155,6 +155,9 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o
 
+xe-$(CONFIG_FUNCTION_ERROR_INJECTION) += \
+	xe_gt_sriov_vf_tweaks.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..8034e0011e2e 100644
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
@@ -436,6 +439,8 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	xe_gt_sriov_vf_tweak_lmem(gt, &size);
+
 	if (config->lmem_size && config->lmem_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
 				size / SZ_1M, config->lmem_size / SZ_1M);
@@ -467,11 +472,16 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
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
index 000000000000..a7ee2bd0adf7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c
@@ -0,0 +1,220 @@
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
+DEFINE_FAIL_FUNC(xe_should_fail_vf_provisioning);
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
+	err = xe_should_fail_vf_provisioning();
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
+	err = xe_should_fail_vf_provisioning();
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
+	err = xe_should_fail_vf_provisioning();
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
+	err = xe_should_fail_vf_provisioning();
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

