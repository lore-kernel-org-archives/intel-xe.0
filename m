Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04622C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA610E587;
	Mon, 24 Apr 2023 16:52:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F1410E571
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355128; x=1713891128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46GuhJivLdsP9bOx96CSNabqkwYm5nM8+0WwA5pyCw4=;
 b=VTcjmNQA3Lm+GsQYQMQlTU1DpXHWOw681Gstfd/f9PfzpQ64bh85WC3k
 5sxMp+X/lHkbSsYoXEEcLXRMticGtVHcFBtc8RMfkbFVH6M4WTpTeSEXG
 vEUp8ks61rIpe/cQL/Wbaf4EWTW/s8PYhSbpwenN8lA86aeCwD2U51Lg2
 nf0QL+rZ7rPbruUI8KZcTyZQ8flAjssUgpRdrG85VpnoGGeF+jZAtIZQs
 oew8LlffQoN/M9DK0dPZRUa/Ntdy1M7vXkLHRPmc1vwJpHGl+lie/O5B1
 MM6uhi6NjPuDyWA+ESTiNCUTD5ZfIuR3cgD9x1wQcEJjvJOTom3iJsbti A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704322"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785617"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785617"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:06 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:34 -0700
Message-Id: <20230424165135.132494-15-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/15] drm/xe/display: Disable PSR HW tracking by
 default in all display versions
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
index 9bfe93c3aca64..f59b97f8aacf9 100644
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

