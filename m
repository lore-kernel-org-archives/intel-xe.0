Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB35C7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7971B10E335;
	Wed, 26 Apr 2023 21:32:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9686010EA29
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhxashEHYu/BRZbqsP4ImWvPuDXcKBL+TzGTygwUs50=;
 b=fsogORTWuNlr4pgr3ZXp/PfwcLyC/33piykKftQsHKBnV29wFej6qWi9
 UdGjzjoCOr6EauIZox7tSi23JeqpXBH6lWCHz7fleYR6SpeBg+fxiH6FA
 Mg+TNow74UOQ5BTVslc9YrhcppvjSwTEKDAzMQ4jQrSyQhEWJgkUnLxAN
 N1Ynzi1ETw07WzRwWXEaAPyfRyL2GMVBTSw3XCPqYNKbm20G0Lj9W/hpO
 A7tyhJmNyed7c80NPS57mXwdLiKWEehxolOFGVl6uSsymFdaXcGwkgMen
 q4rvrdM4JFET7s9ObjAwZM0WsOb/yVs/ZmsX0P4iOXSUWFalikLLCQXMt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213087"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213087"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415163"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415163"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:29 -0700
Message-Id: <20230426213242.1315119-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/17] drm/xe: Rename RC0/RC6 macros
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow up commits will mass-remove the gen prefix/suffix. For GEN6_RC0
and GEN6_RC6 that would make the variable too short and easy to
conflict. So, add "GT_" prefix that is also part of the register name.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0a948395acf8..05a03129dc54 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -345,8 +345,8 @@
 
 #define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
 #define   RCN_MASK				REG_GENMASK(2, 0)
-#define   GEN6_RC0				0
-#define   GEN6_RC6				3
+#define   GT_RC0				0
+#define   GT_RC6				3
 
 #define GEN6_GT_GFX_RC6_LOCKED			_MMIO(0x138104)
 #define GEN6_GT_GFX_RC6				_MMIO(0x138108)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index b853831b342b..0b6d0577a8a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -592,9 +592,9 @@ static ssize_t rc_status_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 
 	switch (REG_FIELD_GET(RCN_MASK, reg)) {
-	case GEN6_RC6:
+	case GT_RC6:
 		return sysfs_emit(buff, "rc6\n");
-	case GEN6_RC0:
+	case GT_RC0:
 		return sysfs_emit(buff, "rc0\n");
 	default:
 		return -ENOENT;
-- 
2.40.1

