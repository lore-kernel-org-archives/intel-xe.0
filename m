Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3184EC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 11:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2C010F1A4;
	Fri, 24 May 2024 11:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq/mLUFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D288010F1A5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716550644; x=1748086644;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7p4xtWmS3WOiaBFygWv1Y0niqYFYdNWVcMTuOyh+c+s=;
 b=Oq/mLUFSSDq6fdK10uWK+aRjJryPRwVTcT5jRDjXXg1BPLyCBKS0g69T
 tELVbnLcQnt0k28w5r02XGiiO3o88O0YaS9jp7DQBdangbiTCZb9QhiFs
 5pYPqfK+Ankdxc494ork+7MEciKP6xA9MlLH4wFgbDy/87HNkYaZ3zqNG
 VoIcsqI7o3FfBebHHFUpJhZTczrupLBkqd956OE9X4tU1oZjcW27Isydv
 1mDXCDBqku/mbXFg2ojAaoQnlFDMmezGiHzhmA3WW39uy7PsGqvihpvZO
 hzqs9YL7CS3eOkd0FmZAZWJEBrOtvtmJpCJzg9nJ36OkodLUM2EhGwe6g A==;
X-CSE-ConnectionGUID: OvRKBbF3QUKILw/GW2UmiQ==
X-CSE-MsgGUID: fADgatVoQViaNF+FFSvIPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12772695"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12772695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:24 -0700
X-CSE-ConnectionGUID: RY/1OqZLRNGiO/T3B63g2A==
X-CSE-MsgGUID: m01I6XzbTROsYX4uaii0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="38986482"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/vf: Read VF configuration prior to GGTT
 initialization
Date: Fri, 24 May 2024 13:37:13 +0200
Message-Id: <20240524113714.932-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240524113714.932-1-michal.wajdeczko@intel.com>
References: <20240524113714.932-1-michal.wajdeczko@intel.com>
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

Each VF will be assigned with only a limited range of the GGTT
address space. Make sure that VF driver will read its own GGTT
configuration before starting any GGTT initialization.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5acf2c92789f..f04b11e45c2d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -35,6 +35,8 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -569,6 +571,15 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	for_each_tile(tile, xe, id) {
+		if (IS_SRIOV_VF(xe)) {
+			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
+			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
+			if (err)
+				return err;
+			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
+			if (err)
+				return err;
+		}
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-- 
2.43.0

