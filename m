Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ACCC761A6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 16:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279210E533;
	Mon,  3 Apr 2023 16:47:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159E10E52E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680540422; x=1712076422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8q1JXyrBiekhhGTMiRGYZuyFWpLkJ3kCx+Z1wTMMTVw=;
 b=fOTUXP/35qRbgYbOkHUL8vGHbYVmB3ivEQ10PLsipPYkagCiERsy09gK
 dSw029ByPcwra+TgNw8BPVXEQxm3SPC56BfrUfpd5t8aVmTdPjpMpIC5h
 mXW5GYRdM40ZiwyR+qokImazemCivxgrTxMzbDuAVUTgVs7xaJSPKgZtk
 /tmPGiA7NduDRfkoC3KsPYpbL6OmMr6ARVxlpFQs4IOoV2aa2UZ8UWyeI
 HNFdmA/bdxJULWMGbZv+mj4OIg4V91hJ367hF7B9idcDwYXZgFZ7jpqLV
 eAgl7VuN9LJryTbK1P2zwAv+di9GyJg7KHSCRbkS1A1AoSpLpzni7tCdQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322350758"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="322350758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797132366"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="797132366"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:30 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 09:46:14 -0700
Message-Id: <20230403164615.131633-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403164615.131633-1-jose.souza@intel.com>
References: <20230403164615.131633-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe/display: Disable PSR HW tracking for
 DG2 and MTL
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
index f3fdb53649cb1..afd3a2aedfcef 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -471,7 +471,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_fpga_dbg = 1,						\
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
-	.has_psr = 1
+	.has_psr = 1,							\
+	.has_psr_hw_tracking = 0
 
 #define XE_LPDP								\
 	XE_LPD,								\
@@ -504,8 +505,7 @@ void xe_display_info_init(struct xe_device *xe)
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

