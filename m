Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14FC55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62D10EFB0;
	Thu, 30 Jul 2026 15:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGXbaHp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CECD10EFAC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425604; x=1816961604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ay/Irw/F+sksKNvpaw8jdUVfAI714e59Y4HRK5e1//c=;
 b=WGXbaHp2VXj/fpQFkz+Rb56tCzoy7Tquv6GHIU1kOkXyup7LezQ/owlQ
 TSRQrPeNkS15kPag9Kmhl5tU4q6Uoro8cXsvtgdLiO8jlLUclDggIxjfI
 3RmPcCZrTRHG1TXnS2+lXFvZaFWpQu+LgLtak+BRIMiTv3e9QyQVIfmZ2
 ++bSrkp3zGBZWS6lSD33SvZYrRMBdlN2AKmTGDUZ0GdHzN7UdgwIohwU4
 vSgpMtnKgSEMRmTATtJ7p7raSGKkRYPKhLSBvqdEspxGDQK+J0rHq9k1d
 /uNw5nk37VOgqBCKcH68znUN0eMIHAwtXp6AWrmkjg1bep2Ijf7owLBfD A==;
X-CSE-ConnectionGUID: Mwm8xeNiQuaPEFA6UxBvcg==
X-CSE-MsgGUID: OuHPp1x/ST+SZvaTwqtEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583050"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583050"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:20 -0700
X-CSE-ConnectionGUID: SOvG9cz6Sr+2NzkofuwJvA==
X-CSE-MsgGUID: UigLs8iaQuOVn6+vsa6GMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387578"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 12/23] drm/xe/ras: Check RAS and LOG component definitions
Date: Thu, 30 Jul 2026 17:21:08 +0200
Message-ID: <20260730152121.576-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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
---
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index a31e06b8aa67..56c0c31e46fb 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_drm_ras.h"
+#include "xe_log.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -45,6 +46,16 @@ enum xe_ras_component {
 	XE_RAS_COMP_MAX
 };
 
+#define CHECK_COMPONENT(RAS_COMP, LOG_COMP) \
+	static_assert(MAKE_XE_LOG_COMPONENT(HARDWARE, (RAS_COMP)) == (LOG_COMP))
+	/* make sure components definitions maintain stable relation */
+	CHECK_COMPONENT(XE_RAS_COMP_DEVICE_MEMORY, XE_LOG_COMPONENT_DEVMEM);
+	CHECK_COMPONENT(XE_RAS_COMP_CORE_COMPUTE, XE_LOG_COMPONENT_HWCORE);
+	CHECK_COMPONENT(XE_RAS_COMP_PCIE, XE_LOG_COMPONENT_PCIE);
+	CHECK_COMPONENT(XE_RAS_COMP_FABRIC, XE_LOG_COMPONENT_FABRIC);
+	CHECK_COMPONENT(XE_RAS_COMP_SOC_INTERNAL, XE_LOG_COMPONENT_SOC);
+#undef CHECK_COMPONENT
+
 /* RAS response status codes */
 enum xe_ras_response_status {
 	XE_RAS_STATUS_SUCCESS = 0,
-- 
2.47.1

