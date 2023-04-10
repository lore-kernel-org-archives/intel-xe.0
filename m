Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE97C77B6F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825BD10E220;
	Mon, 10 Apr 2023 18:32:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30EB10E220
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151549; x=1712687549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSiuwAEtc9csO35QulXkfwlYtKgQ9GJWq/neBnJrTOo=;
 b=DvIcqQF0d1odB0NqjHO4ojUDP+DFUJ5lNa/6VAwYW9jeN8yPtAO3Avn5
 /h3JuEP33mzbv4wRckIT1UO36/t0ZkT0oa4ZEdDVlvGV5a5+C9X61G0M5
 AT81dnmL2IFCIf5AyShc+ZKNZeyFajeP34caPVeOEbpVzX5fUbhpKWiTl
 nWzSddPZCqVowqULaVMvOWcYM0BgQObVslHobdStMT1O/OJEAY+UdgZY2
 oznBcYok79scRXnQb9lMMTyfy5FQne2auntnhjS0JipuBkX3HztbgpX9z
 xqp8IVOm02S7GZvXfU0nSpCQMBntL+LH1wVUz6O6wLmAz/Mer42TYrsmZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408563419"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408563419"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681801005"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681801005"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:28 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:32:18 -0700
Message-Id: <20230410183219.191543-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410183219.191543-1-jose.souza@intel.com>
References: <20230410183219.191543-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/6] drm/xe/display: Disable PSR HW tracking
 by default in all display versions
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

Of the platforms supported by Xe, only TGL and DG1 has PSR HW
tracking.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 0001a9d02495d..42f35ffda3546 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -446,7 +446,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
 	.has_psr = 1,							\
-	.has_psr_hw_tracking = 1,					\
+	.has_psr_hw_tracking = 0,					\
 	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
 
 #define XE_LPD								\
@@ -469,7 +469,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_fpga_dbg = 1,						\
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
-	.has_psr = 1
+	.has_psr = 1,							\
+	.has_psr_hw_tracking = 0
 
 #define XE_LPDP								\
 	XE_LPD,								\
@@ -489,21 +490,20 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
 			.has_modular_fia = 1,
+			.has_psr_hw_tracking = 1,
 		};
 		break;
 	case XE_ALDERLAKE_S:
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
 			.has_hti = 1,
-			.has_psr_hw_tracking = 0,
 		};
 		break;
 	case XE_ALDERLAKE_P:
 		xe->info.display = (struct xe_device_display_info) {
 			XE_LPD,
 			.has_cdclk_crawl = 1,
-			.has_modular_fia = 1,
-			.has_psr_hw_tracking = 0,
+			.has_modular_fia = 1
 		};
 		break;
 	case XE_DG2:
-- 
2.40.0

