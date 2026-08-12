Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E1C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC1110E45F;
	Wed, 12 Aug 2026 19:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImOjQ7Xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEF410F0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562128; x=1818098128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qgNFZ2H3igsBOhQfL7f5WznSaT5zm15JvlbuWYN5OlA=;
 b=ImOjQ7XwyOS4UJK4NsVeoe+SJscJ3lUINoZya6dq0eIJOs4torjwsEaO
 fmaGouNPTRsy6kFs1Cxl9kSFN0VNkqgGYBTkLYZkKvT98o5nUEIHJMqbE
 uEa5TAI/cMSRlevTroYi872xlT0AdZfqEmE/4iVWMHdvuy9c4EtasBHoH
 u/RhnAWwWuYwH6Gg93Qtk/15t71ZCGpnDnoFE5Bm7Bs1HgZfodZekFUig
 vSVdhdXcNe1prLLfmUd2OareMfXzU3Wjn8dstaz0bETNsxUbhD8NSdOy5
 LcZ4+dE4ZliWkLPvsr9Wx49cicRxl56o64qjGDteN6ixUYwvbDaYejeq9 A==;
X-CSE-ConnectionGUID: TMk4A5gXT2W8vByY/U8rBw==
X-CSE-MsgGUID: zM0pARdIQI2WRTtRTghvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987546"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:27 -0700
X-CSE-ConnectionGUID: ILq93+e4TK6972+f+i+MAg==
X-CSE-MsgGUID: MIRxn+eERGWBKSxYD5AEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891980"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 14/32] drm/xe/ras: Check RAS and LOG component definitions
Date: Wed, 12 Aug 2026 21:14:30 +0200
Message-ID: <20260812191450.11690-15-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
index 93e45ef49bae..18f05a55fc61 100644
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

