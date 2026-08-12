Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7AAC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C2210F104;
	Wed, 12 Aug 2026 19:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMc4T7Ts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ADF10F0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562105; x=1818098105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DRIrulwwqBtvIPKNKbdjsd8xIqovmU7u8wg009HSl9A=;
 b=iMc4T7TsExcWfni0Bn0gQ9+M+Yr7POCB15dSuKwrkdr+VscDmfiKSCFn
 OcYRpJcqN/Im+prXmFco0RPqAcLUQqrBdDd1LXCOjXuTOJqWr7CYsDozX
 vTK/A/sHWl0y+HoWbyhKfOA/WApOW+wKjWITKHYVK4tA09apLrrs+BCT1
 jPUFON0aOJlBomeH/jbL4YPwM7Cx1aQd3Tt5qRF5qPFPByPhmD08CS1Yc
 2rSERZrE/VDh0jG1LC9o1s+o5huZgVzNWYeUWSSeuzaH3KEb2bucOpjub
 6UbFI1C42gKkPjSD6usKXJnRjS9lvzgpiQ5kBFPaYm80U2bE1DUvGoLsk g==;
X-CSE-ConnectionGUID: B6xSKnyQSb6G6iIrFgvY8g==
X-CSE-MsgGUID: 9i6EN9DTQiem3ypyYWtrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987493"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:05 -0700
X-CSE-ConnectionGUID: pSEDj5Q2Svml0BHdJbPxqw==
X-CSE-MsgGUID: ihVXLCjlRfy94Y0BzYnJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891795"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 01/32] drm/xe: Introduce xe_any helpers
Date: Wed, 12 Aug 2026 21:14:17 +0200
Message-ID: <20260812191450.11690-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

In upcoming patches we want to define macros that will work with
either xe_device or xe_tile or xe_gt pointers. To make them work
and to allow compiler optimizations, introduce set of helpers
that will return either expected pointer type or NULL or make
necessary conversions to/from the struct xe/device/pci_dev.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v2
Cc: Jani Nikula <jani.nikula@intel.com>
---
v2: add include (Sashiko) and const support (Mallesh)
    reuse existing to_xe() helpers (Michal)
v3: fix another typo and fix to_pdev (Sashiko)
    use assoc macros/helpers (Jani)
    add support for drm_device (Michal)
---
 drivers/gpu/drm/xe/xe_any.h | 137 ++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_any.h

diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
new file mode 100644
index 000000000000..5d97afa76915
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_any.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ANY_H_
+#define _XE_ANY_H_
+
+#include "xe_device.h"
+
+#define __xe_any_to_self_assoc(type, any) \
+	const type * : (any), \
+	type * : (any)
+
+/**
+ * xe_any_if_type() - Get the pointer only if it is @type pointer.
+ * @any: any pointer
+ * @type: data type to look for
+ *
+ * Return: the @type pointer or NULL.
+ */
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(type, (any)),				\
+		 default : NULL)
+
+/**
+ * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
+ * @any: any pointer
+ *
+ * Return: the @xe_gt pointer or NULL.
+ */
+#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
+
+/**
+ * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
+ * @any: any pointer
+ *
+ * Return: the @xe_tile pointer or NULL.
+ */
+#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
+
+/**
+ * xe_any_if_xe() - Get the pointer only if it is &xe_device.
+ * @any: any pointer
+ *
+ * Return: the @xe_device pointer or NULL.
+ */
+#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
+
+/**
+ * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
+ * @any: any pointer
+ *
+ * Return: the @pci_dev pointer or NULL.
+ */
+#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
+
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))
+
+#define __xe_tile_to_xe_device(p)	tile_to_xe(p)
+#define __xe_gt_to_xe_device(p)		gt_to_xe(p)
+#define __pci_dev_to_xe_device(p)	pdev_to_xe_device(p)
+#define __device_to_xe_device(p)	kdev_to_xe_device(p)
+#define __drm_device_to_xe_device(p)	to_xe_device(p)
+#define __pci_dev_to_device(p)		(&(p)->dev)
+
+/**
+ * xe_any_to_xe() - Obtain the &xe_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @xe_device pointer or backpointer.
+ */
+#define xe_any_to_xe(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
+		 __xe_any_to_other_assoc(, device, xe_device, (any)))
+
+/**
+ * xe_any_to_drm() - Obtain the &drm_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @drm_device pointer or backpointer.
+ */
+#define xe_any_to_drm(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
+		 default : &xe_any_to_xe(any)->drm)
+
+/**
+ * xe_any_to_dev() - Obtain the &device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @device pointer or backpointer.
+ */
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct device, (any)),			\
+		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
+		 default : xe_any_to_drm(any)->dev)
+
+/**
+ * xe_any_to_pdev() - Obtain the &pci_dev pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @pci_dev pointer or backpointer.
+ */
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
+		 default : to_pci_dev(xe_any_to_dev(any)))
+
+#define __xe_tile_to_id(p)		((p)->id)
+#define __xe_gt_to_id(p)		((p)->info.id)
+
+/**
+ * xe_any_id() - Get the identifier of the underlying object.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the identifier of the object, or 0 if not applicable/available.
+ */
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
+		 default : 0)
+
+#endif
-- 
2.47.1

