Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D798AC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468310E560;
	Thu,  4 Jan 2024 22:20:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D686310E54F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406843; x=1735942843;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wBXKTsnBRewTjEIOgJdh69QIeoQzyIT8dHzyKsK9KVI=;
 b=Sa1pGxunX30+Zj09Yb5uGaI+VlyxwxkrGyzwxFYeJK1e095ljbYY10xH
 0E8iXCLH96MN3pIc4KWIZ5W/1RA//zcGQ5r96+gcfz2MECbnYOqenUP7Z
 QI46MdOX6sDyMnm+cMRFQmKUc2mc7LMRerTG9uPmOp3ySn8GaLv4tkcXO
 l7S6CJYymOV5tTT1NaA0akeIpEXfxj130CVCrShYa3qeu6j95r/dofPCH
 iw5Mn8Oo17q9dw2YBvC6CbjqQSnZIN1JBbJ74vmSEJnSWbiDZoSAZ0Xzj
 OqgnoQHBYbC5bFjygoHg4FvEZENErmUo2Bmjg4Hj2IlywRUsBjk3N+DZF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546850"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546850"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022791"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022791"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:42 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 02/10] drm/xe: Define Virtual Function Identifier
Date: Thu,  4 Jan 2024 23:20:23 +0100
Message-Id: <20240104222031.277-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
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

According to the PCI Express specification, the SR-IOV Virtual
Functions (VFs) are numbered starting with 1 (VF1, VF2, ...).
Additionally, both driver and GuC will refer to Physical Function
(PF) as VF0. Define helper macro to represent VFn and PF.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: fixed typo (Piotr)
---
 drivers/gpu/drm/xe/xe_sriov_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index 999a4311b98b..1a138108d139 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -8,6 +8,18 @@
 
 #include <linux/build_bug.h>
 
+/**
+ * VFID - Virtual Function Identifier
+ * @n: VF number
+ *
+ * Helper macro to represent Virtual Function (VF) Identifier.
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

