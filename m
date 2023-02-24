Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2159C64ED8
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 22:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCBC10E271;
	Fri, 24 Feb 2023 22:16:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1210E271
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677276972; x=1708812972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xtELICNp27wbas2QNJpTWrGkg8f9yierX8vTtcigpOM=;
 b=ULD5MRHxkeftSQb7/Gr0F/MPYHxWUvo6MZ1jNdEZaU7xlBKy6uEtEw5B
 NYhl+G6LkF+GwezL/5yLTlQ1vSr8akOaM8YAuKVgT+6Y4zvXeRwGFyVUH
 qH5JGf9+cBd/lj15gtLsNIQqLI1knRC+oH66GVFV3VQN6zNmG/PAacDCD
 Crj2Ey9bFNykMeNY4JR2HsuV1ZF6qnkqTQA52IO2juQ4QurWnaWODPily
 tS+hXxbtf/tL8vZM13AYG7dZnd1VqVpmFS6mbjfxLOxrUsr5r/naSpPPk
 6DPbs1u530Hr7qn214tbGHQTh2qoBf13vI1O7DDXU6lDcpiMT33zkG4bS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317349978"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="317349978"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 14:16:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918561178"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="918561178"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 14:16:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 14:16:01 -0800
Message-Id: <20230224221601.3996099-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Assume MTL's forcewake register
 continues to future platforms
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Starting with MTL, the GT forcewake ack register moved from 0x130044 to
0xDFC.  We expect this change to carry forward to future platforms as
well, so forcewake initialization should use an IP version check instead
of matching the MTL platform specifically.

The (re)definition of FORCEWAKE_ACK_GT_MTL in the forcewake file is also
unnecessary; we can take the definition that already exists in the
dedicated register header.

Bspec: 65031, 64629
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 5bd87118ac73..21d04a02847b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -36,8 +36,6 @@ static void domain_init(struct xe_force_wake_domain *domain,
 	domain->mask = mask;
 }
 
-#define FORCEWAKE_ACK_GT_MTL                 _MMIO(0xdfc)
-
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -48,7 +46,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	/* Assuming gen11+ so assert this assumption is correct */
 	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
-	if (xe->info.platform == XE_METEORLAKE) {
+	if (xe->info.graphics_verx100 >= 1270) {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT_GEN9.reg,
-- 
2.39.1

