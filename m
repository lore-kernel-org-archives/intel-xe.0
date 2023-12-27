Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E37C46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66F10E1D6;
	Wed, 27 Dec 2023 23:59:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B2810E181
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721547; x=1735257547;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+LCP0ri8mPkL7RLpZw8INyfKOGHRhUvJKtImn8xsyQk=;
 b=HIkMLjbVeVygAHBiNBar3HvjBmolbCkDC2ZWBZ8YVfaQlwOtLYXK69Pg
 UXiHqMk+K3mFOYEJdyqUtG/S1yp4Oqisq5ZAHeHTWU6WW/s3VQaWC/IGQ
 yKbVaP3RRmHnxllgWF6OQVRh0YHBQkS0wjOGhD3wKLTRz1aXHg/ZqimM9
 uPnK6K/12sgeQCHZ1Nf0WKCw29cxLBK9JV5pE8eorPlWrhHcn+FaFu53s
 qxhvYcktJfT0aXVMIKU3fvyYoN5+z9stYCv6kQAhUum1WxUN3nCgJPwu6
 YjHSLLp2u74kLoYQZb2spi3cSMUHDSxWqebXq1COIdLPStBmhBdZeGLyT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329150"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329150"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589860"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589860"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:05 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/10] drm/xe: Define Virtual Function Identifier
Date: Thu, 28 Dec 2023 00:58:30 +0100
Message-Id: <20231227235838.212-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

According to the PCI Express specification, the SR-IOV Virtual
Functions (VFs) are numbered starting with 1 (VF1, VF2, ...).
Additionally, both driver and GuC will refer to Physical Function
(PF) as VF0. Define helper macro to represent VFn and PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index 999a4311b98b..fbeebdb12166 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -8,6 +8,18 @@
 
 #include <linux/build_bug.h>
 
+/**
+ * VFID - Virtual Function Identifier
+ * @n: VF number
+ *
+ * Helper macro to represent Virtual Function (VF) Indentifier.
+ * VFID(0) is used as alias to the PFID that represents Physical Function.
+ *
+ * Note: According to PCI spec, SR-IOV VF's numbers are 1-based (VF1, VF2, ...).
+ */
+#define VFID(n)		(n)
+#define PFID		VFID(0)
+
 /**
  * enum xe_sriov_mode - SR-IOV mode
  * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
-- 
2.25.1

