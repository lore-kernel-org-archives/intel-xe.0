Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B543C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0045510E50A;
	Tue, 25 Apr 2023 19:26:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552EC10E7C7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450815; x=1713986815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfchicMQ4KnpF/NryarySBl2ZnwWFlx768sS3ohcx3o=;
 b=bxe9lj3tCz8hrrGMspxlx7ndfbj5Lp/JCJuKBaNs3scLz0ndvyQ7XAbA
 OBfSN7Fc3GvXn5kOMuGQRCTo2KdnjQ+4q2D4UcgsaZLmG5mNnhIBztXbA
 +1uNjZPjfsL9S9ruWUMuuD4QuBOFzxoHLf4c/ShfexsCi3hmfbH2ZnSRB
 rimQJRZ+dZlZC8vMCz1PdO7aR+4AcY62ljHDwNnxQqBV9sh1YxfYGh+JI
 iPZbwqfaMzhw+cIoQ9NU8VTl01VZjOyTvd/Vwtv+mQlI6/TQjsHehjBwr
 i7lOzupCfmqLxq2Ym6EdKbysyQB35lzGwomrGRvXdDoBuhSUz8eMhv37l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100919"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100919"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990508"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990508"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:51 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:23 -0700
Message-Id: <20230425192624.168640-15-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/15] drm/xe/display: Disable PSR HW tracking
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Of the platforms supported by Xe, only TGL and DG1 has PSR HW
tracking.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index fbae60c179be1..376186bc02e51 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -449,7 +449,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
 	.has_psr = 1,							\
-	.has_psr_hw_tracking = 1,					\
+	.has_psr_hw_tracking = 0,					\
 	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
 
 #define XE_LPD								\
@@ -472,7 +472,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_fpga_dbg = 1,						\
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
-	.has_psr = 1
+	.has_psr = 1,							\
+	.has_psr_hw_tracking = 0
 
 #define XE_LPDP								\
 	XE_LPD,								\
@@ -492,6 +493,7 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
 			.has_modular_fia = 1,
+			.has_psr_hw_tracking = 1,
 		};
 		break;
 	case XE_ROCKETLAKE:
@@ -511,15 +513,13 @@ void xe_display_info_init(struct xe_device *xe)
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

