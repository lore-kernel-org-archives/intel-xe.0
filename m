Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CE3C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5A310E967;
	Tue, 28 Jul 2026 16:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hi9cv7j6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B148610E87D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255070; x=1816791070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oAIjqgrpZ0TxuqCy+DwMNEktZ+7U2pk0ReBNvhu+bnA=;
 b=Hi9cv7j65kkSxVeg3C6VZvPuFLV3GFSkVekXbiMfOBg6S4KG4TzeEP5L
 w9GFFA3MsrAddC9uLk1LqC5cOE3iuRvwzRZrPzyp51wHk5keo7jrufFjn
 5bbkfw4TH8NB0XT8nf7tKcnCQBdXwhn5ZT7ZZ0PfSSncexjRR5XuDMZt0
 IJrOPrGFESdDtg6LsgMMvVBLyFOXQZailFyOiC8oJT+aUhvkGsdA6yiLk
 MypsVel5yXfWL+kjAjiUeedPPcdm+45JP/eiOiA6exyphvxXIPZK30sH6
 V9YNT5ozTl5OPNZ8P7aHTd+Bk1KlPWnDgQDiLylMLS2ZptGr6/6Vv9tk6 A==;
X-CSE-ConnectionGUID: OBc9HZBgQRmhB16NEuLerQ==
X-CSE-MsgGUID: X+IEKkL1Rm6RaIjFBJQhPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386246"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:08 -0700
X-CSE-ConnectionGUID: +S7wpQw1QYCOZDOXL2RQyw==
X-CSE-MsgGUID: AXnXkVzeTwiKuCaY2dZBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819229"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 01/22] drm/xe: Introduce xe_any helpers
Date: Tue, 28 Jul 2026 18:10:16 +0200
Message-ID: <20260728161039.579-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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
---
v2: add include (Sashiko) and const support (Mallesh)
    reuse existing to_xe() helpers (Michal)
---
 drivers/gpu/drm/xe/xe_any.h | 112 ++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_any.h

diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
new file mode 100644
index 000000000000..a2b1e42fbc5c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_any.h
@@ -0,0 +1,112 @@
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
+/**
+ * xe_any_if_type() - Get the pointer only if it is @type pointer.
+ * @any: any pointer
+ * @type: data type to look for
+ *
+ * Return: the @type pointer or NULL.
+ */
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 type * : (any),						\
+		 const type * : (any),						\
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
+/**
+ * xe_any_to_xe() - Obtain the &xe_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @xe_device pointer or backpointer.
+ */
+#define xe_any_to_xe(any)								\
+	_Generic((any),									\
+		 struct xe_device * : (any),						\
+		 const struct xe_device * : (any),					\
+		 struct xe_tile * : tile_to_xe((struct xe_tile *)(any)),		\
+		 const struct xe_tile * : tile_to_xe((const struct xe_tile *)(any)),	\
+		 struct xe_gt * : gt_to_xe((struct xe_gt *)(any)),			\
+		 const struct xe_gt * : gt_to_xe((const struct xe_gt *)(any)),		\
+		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),		\
+		 struct device * : kdev_to_xe_device((struct device *)(any)))
+
+/**
+ * xe_any_to_dev() - Obtain the &device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @xe_device pointer or backpointer.
+ */
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 struct device * : (any),					\
+		 default : xe_any_to_xe(any)->drm.dev)
+
+/**
+ * xe_any_to_pdev() - Obtain the &pci_dev pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @pci_dev pointer or backpointer.
+ */
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 struct pci_dev * : (any),					\
+		 default : to_pci_dev(xe_any_to_dev(any)))
+
+/**
+ * xe_any_id() - Get the identifier of the underlying object.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the identifier of the object, or 0 if nor applicable/available.
+ */
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 struct xe_gt * : ((struct xe_gt *)(any))->info.id,		\
+		 const struct xe_gt * : ((const struct xe_gt *)(any))->info.id,	\
+		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
+		 const struct xe_tile * : ((const struct xe_tile *)(any))->id,	\
+		 struct xe_device * : 0,					\
+		 const struct xe_device * : 0,					\
+		 struct pci_dev * : 0,						\
+		 struct device * : 0)
+
+#endif
-- 
2.47.1

