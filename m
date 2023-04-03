Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2C7C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 18:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E4F10E53F;
	Mon,  3 Apr 2023 18:06:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ADF10E53F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680545199; x=1712081199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMXIdG7ixVFFP7a2caH5xKNFaJ746EijPRLYFAGP2BQ=;
 b=Z0SNLzua9MxlvQm/Tp2zhfibgxJK7vhw4jICeSnEAwGyRpcPkWlwuQmn
 uXQ/yYViXzrDdGWpBbiv0SFxuHbqFg4kipEflb38POY/H0wWSjIaiuyZd
 BLBNUHnYMmLcjTjTT3K7Uh/4Ahe4DdsDV4Ln/hj15ujIeipjmGS+dJPQC
 Bg/DtH6X+t8zLdyJciJUvNHMF759hMF2zWGvOMgEW2Yooc0w8LMzBKnOC
 +i+mdFnwOWWG/LzO3OKU2xb6coENH0Uiz2eC9PTqwHDlmL5fkvapQoAD0
 bGEwiToAoyeYPRYZ9vkO/LR1qqU6586esF82Wjw5gCThgkg19EE6Fe+rY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369787250"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="369787250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860307787"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="860307787"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:06:29 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 11:06:13 -0700
Message-Id: <20230403180614.197711-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403180614.197711-1-jose.souza@intel.com>
References: <20230403180614.197711-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/6] drm/xe/display: Disable PSR HW tracking
 for DG2 and MTL
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
 drivers/gpu/drm/xe/xe_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 8101ca940fbdb..9d982f9bb1b34 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -469,7 +469,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_fpga_dbg = 1,						\
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
-	.has_psr = 1
+	.has_psr = 1,							\
+	.has_psr_hw_tracking = 0
 
 #define XE_LPDP								\
 	XE_LPD,								\
@@ -502,8 +503,7 @@ void xe_display_info_init(struct xe_device *xe)
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

