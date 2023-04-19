Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F5C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C673910E050;
	Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0E010E8D6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890297; x=1713426297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J7YVTZlY9k9IyHwf1lyb+ASsN0/0BkopP1kT/xr5vaY=;
 b=S9YBv8B5UWnxhVD1efKL7KuzbiZA/0znl4TUNifVNUNY9fVmIe8Jp2o+
 us2wvAYN9R3gXB7eojS53WJKw1gdUanDnJ+hZEf8yVA8afJ766PyS4Tyl
 eCKbbdML/SGrKs8afMwAUt1Kp+4/LNCz3oH7xihcBAp5pgfq/+y9YsFrD
 5x5muiU+MoYGpRMbdc1vkw9KyJqwB7cDq8iMlzZrjDQEgPiv+0XchY4gA
 kV6QWI0KS/h2R4C5YaXel5vJz4QYqk5q0Y32xThyz3IZKF5UAPeknYoN/
 1NjkH5CQhnT25vxlqKXAgAm7Ib8vzir41vQMXcSa7JiTPnFyVJaC6t5p1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186112"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186112"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951873"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951873"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:27 -0700
Message-Id: <20230419074440.4006398-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/17] drm/xe: Rename RC0/RC6 macros
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
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f174758d8307..778d34afae93 100644
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
index 5a8d827ba770..2f98544736ae 100644
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
2.39.0

