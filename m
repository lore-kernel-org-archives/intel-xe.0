Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB073C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A389110E183;
	Fri, 14 Aug 2026 17:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7FLaTHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080910F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727921; x=1818263921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iUXsnsyLOKKCmBFCXmQQFw/97M35IjFfJGutK23yMkI=;
 b=j7FLaTHtF3Ux79l5s3ABnvFatDMPzXbjbc/tB0NehALuOif7QttSQpnC
 H7EoJgoACJjHkz31hURPNEQ6DufMYH0zDU/5wKRDp03G5RduqKLjmpw+C
 MNWWy2kHnVY1YQJ8bpo8N2OswCvKjY/awD+GY5JYUz0TLNKUGxto9O28K
 i8kLTFC17TBZe+HWUX4HFX3NK2B6Rc3rI3CqsoJwAsq60xDZgVNF2goho
 MsGHkOr7YL5KosU6f3qNsqZDnVFqN+tkyZCL13Tu6bGfAN94bb7uQLtV/
 A1i1PzEX/dG92Awtmn6KuSz0pN4MkfPxlAuJbDFAXHc2ejkDGBjeTHUnZ A==;
X-CSE-ConnectionGUID: LSCeADv+Q6qK7P/wRAKtSA==
X-CSE-MsgGUID: S1irH/AARmSlTWjS6fHXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464043"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:40 -0700
X-CSE-ConnectionGUID: mMeZ0+9aQhmRx2p6ZS9bhA==
X-CSE-MsgGUID: A0qZ/J55RNKpCsTwBhiB0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946191"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 14/33] drm/xe/ras: Check RAS and LOG component definitions
Date: Fri, 14 Aug 2026 19:17:40 +0200
Message-ID: <20260814171801.13347-15-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

While not strictly required, we want to make sure that components
definitions used by the RAS firmware are in the same fixed relation
with HW components definitions used by the LOG infrastructure to
allow code simplification. Add static asserts to enforce that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: rebased after comp tag renames (Michal)
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 004599c35aee..d25d25f77531 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -6,6 +6,7 @@
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
+#include "xe_log.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -46,6 +47,16 @@ enum xe_ras_component {
 	XE_RAS_COMP_MAX
 };
 
+#define CHECK_COMPONENT(RAS_COMP, LOG_COMP) \
+	static_assert(MAKE_XE_LOG_COMPONENT(HARDWARE, (RAS_COMP)) == (LOG_COMP))
+	/* make sure components definitions maintain stable relation */
+	CHECK_COMPONENT(XE_RAS_COMP_DEVICE_MEMORY, XE_LOG_COMPONENT_DEVICE_MEMORY);
+	CHECK_COMPONENT(XE_RAS_COMP_CORE_COMPUTE, XE_LOG_COMPONENT_CORE_COMPUTE);
+	CHECK_COMPONENT(XE_RAS_COMP_PCIE, XE_LOG_COMPONENT_PCIE);
+	CHECK_COMPONENT(XE_RAS_COMP_FABRIC, XE_LOG_COMPONENT_FABRIC);
+	CHECK_COMPONENT(XE_RAS_COMP_SOC_INTERNAL, XE_LOG_COMPONENT_SOC_INTERNAL);
+#undef CHECK_COMPONENT
+
 /* RAS response status codes */
 enum xe_ras_response_status {
 	XE_RAS_STATUS_SUCCESS = 0,
-- 
2.47.1

