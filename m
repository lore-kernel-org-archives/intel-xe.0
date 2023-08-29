Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262AAC83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B627310E2A9;
	Tue, 29 Aug 2023 14:13:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82C910E2A2;
 Tue, 29 Aug 2023 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693318379; x=1724854379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCa30B2VkOffMoScIJoqMg3FsLdHUPn2NzUa9XlWQBk=;
 b=T/u0UW3vcwfmiiJMxMiYIQ8fzjEt1ZFheZfmJTzUG6PqC3UAv4DmwlfO
 MY8XuAbZ2ByGZD5oSlrnpwrHOlEsUR0ekzly7/A3R/gbFbx4dKDyXu0SJ
 2S3nsfgFVpmniGxPmh8rh04kmYgs8R88GzuJjfRJOwyt/jinIZYhjvArM
 uJ7EpgBLm5JIMzSP/fbeQeiui71bMhflJDVqiYK4za+sU87ui9S58frDC
 +2JX2W9roGfFayH6vZijcxPEsNHZX4kC+Gri5VU2xIT7xS5VwtYS54l34
 fQTof+7GBQqNJEuw30XjIzigXmHqAliamTNlGGPBTxyOunT2D1NPpTaLy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441733930"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441733930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804123944"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804123944"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:04 -0700
Message-Id: <20230829141107.1505705-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the introduction of Lunar Lake, igt won't be able to just re-use
i915_pciids.h for both drivers anymore since the support for LNL is only
coming with the xe module. Copy xe_pciids.h from the drm-xe-next branch
(up to commit b9c9020fc816 ("drm/xe/pvc: Use fast copy engines as
migrate engine on PVC") and start including it where needed. This brings
all the LNL PCI IDs.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/intel_device_info.c                  |   1 +
 lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 lib/xe_pciids.h

diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 6b832ad27..513385b4b 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -21,6 +21,7 @@ ignore_headers = [
 	'media_fill_gen9.h',
 	'gen9_render.h',
 	'version.h',
+	'xe_pciids.h',
 ]
 
 test_groups = [
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 2c9a45b68..5d53d2906 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -1,6 +1,7 @@
 #include "intel_chipset.h"
 #include "i915_pciids.h"
 #include "i915_pciids_local.h"
+#include "xe_pciids.h"
 
 #include <strings.h> /* ffs() */
 
diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
new file mode 100644
index 000000000..29f07a00a
--- /dev/null
+++ b/lib/xe_pciids.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _XE_PCIIDS_H_
+#define _XE_PCIIDS_H_
+
+/*
+ * Lists below can be turned into initializers for a struct pci_device_id
+ * by defining INTEL_VGA_DEVICE:
+ *
+ * #define INTEL_VGA_DEVICE(id, info) { \
+ *	0x8086, id,			\
+ *	~0, ~0,				\
+ *	0x030000, 0xff0000,		\
+ *	(unsigned long) info }
+ *
+ * And then calling like:
+ *
+ * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
+ *
+ * To turn them into something else, just provide a different macro passed as
+ * first argument.
+ */
+
+/* TGL */
+#define XE_TGL_GT1_IDS(MACRO__, ...)		\
+	MACRO__(0x9A60, ## __VA_ARGS__),	\
+	MACRO__(0x9A68, ## __VA_ARGS__),	\
+	MACRO__(0x9A70, ## __VA_ARGS__)
+
+#define XE_TGL_GT2_IDS(MACRO__, ...)		\
+	MACRO__(0x9A40, ## __VA_ARGS__),	\
+	MACRO__(0x9A49, ## __VA_ARGS__),	\
+	MACRO__(0x9A59, ## __VA_ARGS__),	\
+	MACRO__(0x9A78, ## __VA_ARGS__),	\
+	MACRO__(0x9AC0, ## __VA_ARGS__),	\
+	MACRO__(0x9AC9, ## __VA_ARGS__),	\
+	MACRO__(0x9AD9, ## __VA_ARGS__),	\
+	MACRO__(0x9AF8, ## __VA_ARGS__)
+
+#define XE_TGL_IDS(MACRO__, ...)		\
+	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
+	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
+
+/* RKL */
+#define XE_RKL_IDS(MACRO__, ...)		\
+	MACRO__(0x4C80, ## __VA_ARGS__),	\
+	MACRO__(0x4C8A, ## __VA_ARGS__),	\
+	MACRO__(0x4C8B, ## __VA_ARGS__),	\
+	MACRO__(0x4C8C, ## __VA_ARGS__),	\
+	MACRO__(0x4C90, ## __VA_ARGS__),	\
+	MACRO__(0x4C9A, ## __VA_ARGS__)
+
+/* DG1 */
+#define XE_DG1_IDS(MACRO__, ...)		\
+	MACRO__(0x4905, ## __VA_ARGS__),	\
+	MACRO__(0x4906, ## __VA_ARGS__),	\
+	MACRO__(0x4907, ## __VA_ARGS__),	\
+	MACRO__(0x4908, ## __VA_ARGS__),	\
+	MACRO__(0x4909, ## __VA_ARGS__)
+
+/* ADL-S */
+#define XE_ADLS_IDS(MACRO__, ...)		\
+	MACRO__(0x4680, ## __VA_ARGS__),	\
+	MACRO__(0x4682, ## __VA_ARGS__),	\
+	MACRO__(0x4688, ## __VA_ARGS__),	\
+	MACRO__(0x468A, ## __VA_ARGS__),	\
+	MACRO__(0x4690, ## __VA_ARGS__),	\
+	MACRO__(0x4692, ## __VA_ARGS__),	\
+	MACRO__(0x4693, ## __VA_ARGS__)
+
+/* ADL-P */
+#define XE_ADLP_IDS(MACRO__, ...)		\
+	MACRO__(0x46A0, ## __VA_ARGS__),	\
+	MACRO__(0x46A1, ## __VA_ARGS__),	\
+	MACRO__(0x46A2, ## __VA_ARGS__),	\
+	MACRO__(0x46A3, ## __VA_ARGS__),	\
+	MACRO__(0x46A6, ## __VA_ARGS__),	\
+	MACRO__(0x46A8, ## __VA_ARGS__),	\
+	MACRO__(0x46AA, ## __VA_ARGS__),	\
+	MACRO__(0x462A, ## __VA_ARGS__),	\
+	MACRO__(0x4626, ## __VA_ARGS__),	\
+	MACRO__(0x4628, ## __VA_ARGS__),	\
+	MACRO__(0x46B0, ## __VA_ARGS__),	\
+	MACRO__(0x46B1, ## __VA_ARGS__),	\
+	MACRO__(0x46B2, ## __VA_ARGS__),	\
+	MACRO__(0x46B3, ## __VA_ARGS__),	\
+	MACRO__(0x46C0, ## __VA_ARGS__),	\
+	MACRO__(0x46C1, ## __VA_ARGS__),	\
+	MACRO__(0x46C2, ## __VA_ARGS__),	\
+	MACRO__(0x46C3, ## __VA_ARGS__)
+
+/* ADL-N */
+#define XE_ADLN_IDS(MACRO__, ...)		\
+	MACRO__(0x46D0, ## __VA_ARGS__),	\
+	MACRO__(0x46D1, ## __VA_ARGS__),	\
+	MACRO__(0x46D2, ## __VA_ARGS__)
+
+/* RPL-S */
+#define XE_RPLS_IDS(MACRO__, ...)		\
+	MACRO__(0xA780, ## __VA_ARGS__),	\
+	MACRO__(0xA781, ## __VA_ARGS__),	\
+	MACRO__(0xA782, ## __VA_ARGS__),	\
+	MACRO__(0xA783, ## __VA_ARGS__),	\
+	MACRO__(0xA788, ## __VA_ARGS__),	\
+	MACRO__(0xA789, ## __VA_ARGS__),	\
+	MACRO__(0xA78A, ## __VA_ARGS__),	\
+	MACRO__(0xA78B, ## __VA_ARGS__)
+
+/* RPL-U */
+#define XE_RPLU_IDS(MACRO__, ...)		\
+	MACRO__(0xA721, ## __VA_ARGS__),	\
+	MACRO__(0xA7A1, ## __VA_ARGS__),	\
+	MACRO__(0xA7A9, ## __VA_ARGS__)
+
+/* RPL-P */
+#define XE_RPLP_IDS(MACRO__, ...)		\
+	MACRO__(0xA720, ## __VA_ARGS__),	\
+	MACRO__(0xA7A0, ## __VA_ARGS__),	\
+	MACRO__(0xA7A8, ## __VA_ARGS__)
+
+/* DG2 */
+#define XE_DG2_G10_IDS(MACRO__, ...)		\
+	MACRO__(0x5690, ## __VA_ARGS__),	\
+	MACRO__(0x5691, ## __VA_ARGS__),	\
+	MACRO__(0x5692, ## __VA_ARGS__),	\
+	MACRO__(0x56A0, ## __VA_ARGS__),	\
+	MACRO__(0x56A1, ## __VA_ARGS__),	\
+	MACRO__(0x56A2, ## __VA_ARGS__)
+
+#define XE_DG2_G11_IDS(MACRO__, ...)		\
+	MACRO__(0x5693, ## __VA_ARGS__),	\
+	MACRO__(0x5694, ## __VA_ARGS__),	\
+	MACRO__(0x5695, ## __VA_ARGS__),	\
+	MACRO__(0x5698, ## __VA_ARGS__),	\
+	MACRO__(0x56A5, ## __VA_ARGS__),	\
+	MACRO__(0x56A6, ## __VA_ARGS__),	\
+	MACRO__(0x56B0, ## __VA_ARGS__),	\
+	MACRO__(0x56B1, ## __VA_ARGS__)
+
+#define XE_DG2_G12_IDS(MACRO__, ...)		\
+	MACRO__(0x5696, ## __VA_ARGS__),	\
+	MACRO__(0x5697, ## __VA_ARGS__),	\
+	MACRO__(0x56A3, ## __VA_ARGS__),	\
+	MACRO__(0x56A4, ## __VA_ARGS__),	\
+	MACRO__(0x56B2, ## __VA_ARGS__),	\
+	MACRO__(0x56B3, ## __VA_ARGS__)
+
+#define XE_DG2_IDS(MACRO__, ...)		\
+	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
+	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
+	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
+
+#define XE_ATS_M150_IDS(MACRO__, ...)		\
+	MACRO__(0x56C0, ## __VA_ARGS__)
+
+#define XE_ATS_M75_IDS(MACRO__, ...)		\
+	MACRO__(0x56C1, ## __VA_ARGS__)
+
+#define XE_ATS_M_IDS(MACRO__, ...)		\
+	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
+	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
+
+/* PVC */
+#define XE_PVC_XT_IDS(MACRO__, ...)		\
+	MACRO__(0x0BD5, ## __VA_ARGS__),	\
+	MACRO__(0x0BD6, ## __VA_ARGS__),	\
+	MACRO__(0x0BD7, ## __VA_ARGS__),	\
+	MACRO__(0x0BD8, ## __VA_ARGS__),	\
+	MACRO__(0x0BD9, ## __VA_ARGS__),	\
+	MACRO__(0x0BDA, ## __VA_ARGS__),	\
+	MACRO__(0x0BDB, ## __VA_ARGS__),	\
+	MACRO__(0x0BE0, ## __VA_ARGS__),	\
+	MACRO__(0x0BE1, ## __VA_ARGS__),	\
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
+#define XE_PVC_IDS(MACRO__, ...)		\
+	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
+
+/* MTL */
+#define XE_MTL_M_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D43, ## __VA_ARGS__),	\
+	MACRO__(0x7DC0, ## __VA_ARGS__)
+
+#define XE_MTL_P_IDS(MACRO__, ...)		\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D47, ## __VA_ARGS__),	\
+	MACRO__(0x7D50, ## __VA_ARGS__),	\
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7DC5, ## __VA_ARGS__),	\
+	MACRO__(0x7DD0, ## __VA_ARGS__),	\
+	MACRO__(0x7DD5, ## __VA_ARGS__)
+
+#define XE_MTL_S_IDS(MACRO__, ...)		\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7DE0, ## __VA_ARGS__)
+
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D67, ## __VA_ARGS__)
+
+#define XE_MTL_IDS(MACRO__, ...)		\
+	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
+
+#define XE_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
+#endif
-- 
2.40.1

