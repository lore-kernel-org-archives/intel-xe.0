Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2B0C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C139110F200;
	Thu, 23 Jul 2026 20:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GavyhejH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4B310F1FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839094; x=1816375094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LbAvNFcECYeTn+2tVu+lp6IYWdaGgI4EKJA0RhI7aNM=;
 b=GavyhejHJnZ169WkAd6evn6BjuvckcT90AVJq2a2RtwsSJc9o1eAxw2c
 3lZsD5EUshogd+eiI0fcNfh3L5tMpZjsIds1aoPKI9fNnE2o2hf9oe+Wb
 Ss8TIspIlQjE8OhA7k5BenqyOKxu7KQ6G5duJTwv3IcJzDpBUCy5MeaO8
 O5uQjj0aec4jOpnFOeSLBhCD5nFYwzGMe3qBDZUFz7IjmbhiQFY1c4wru
 c1R1v5d+E8RBOl2ghIJ+4CALIb6DtctM9yPIurDI2ObRVsRNbnsDn9ewg
 v4V/CBkC22XJ4ymYWPesFMT/cGls9gYR26SK0CMMzfClxhmIbCx2MeVtP g==;
X-CSE-ConnectionGUID: NIrBoSSxS7a/jnUdI/rZKA==
X-CSE-MsgGUID: x+qdHShSRzuaVaTE5Js8Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484286"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:14 -0700
X-CSE-ConnectionGUID: yK4URaGVS2Knm8+3eRptew==
X-CSE-MsgGUID: Z23CkMtsTWuV3dkZxwhCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578578"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 02/19] drm/xe: Introduce xe_any helpers
Date: Thu, 23 Jul 2026 22:37:35 +0200
Message-ID: <20260723203754.3782-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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
that will return either expected pointer type or NULL. Also add
conversion helpers to/from the struct device/pci_dev.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_any.h | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_any.h

diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
new file mode 100644
index 000000000000..c633c6ee83b5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_any.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ANY_H_
+#define _XE_ANY_H_
+
+struct pci_dev;
+struct xe_device;
+struct xe_gt;
+struct xe_tile;
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
+ * xe_any_to_xe() - Get the &xe_device pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the @xe_device pointer or backpointer.
+ */
+#define xe_any_to_xe(any)							\
+	_Generic((any),								\
+		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),	\
+		 struct xe_device * : (any),					\
+		 struct xe_tile * : ((struct xe_tile *)(any))->xe,		\
+		 struct xe_gt * : ((struct xe_gt *)(any))->tile->xe)
+
+/**
+ * xe_any_to_dev() - Get the &struct device pointer.
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
+ * xe_any_to_pdev() - Get the &pci_dev pointer.
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
+ * xe_any_id() - Get the identifier of the undrlying any object pointer.
+ * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
+ *
+ * Return: the identifier of the object, or 0 if nor applicable/available.
+ */
+#define xe_any_id(any)							\
+	_Generic((any),							\
+		 struct pci_dev * : 0,						\
+		 struct xe_device * : 0,					\
+		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
+		 struct xe_gt * : ((struct xe_gt *)(any))->info.id)
+
+#endif
-- 
2.47.1

