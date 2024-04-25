Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FBC19F4E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2111A764;
	Thu, 25 Apr 2024 18:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuUF3wLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9979A112117
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069429; x=1745605429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QnP6qa46MqmrJejzspg6JpKyAbkHewZzIxNDpNCItKY=;
 b=PuUF3wLPgjXYmBbT9XfhMbMU0JOciDp46Nhtvv31WsDdsMWUUJdlyH2S
 mRTVdoycwqPF6mMnwW3geDcuWUWl4/RzWgnxu4BoYgH0ZsdU+rU9uzUzk
 Eo9drGrwdkxc//lzW3pBI4mzap6spKWzsAGIBEH3RYRuoM+eL26hRCZNF
 67YPaoNlXG81yfumCJTlmTkzKnfSwVh80pbDp1EfVRB8RVV1cntZ1njKY
 KmELqww2ZL9RIdBIriEzFBmCkUvQWAt1bvj9mr7RZaNF7osc45kNN4mIv
 mXRKkNUmlTNAGqobF3xQrnVeJmqjFjO1990YkEPrMScK1MXiwAoE0S5VM Q==;
X-CSE-ConnectionGUID: uIyneWK0TrCXVmTMIXUMsw==
X-CSE-MsgGUID: gHpB8liuS0OzCoY9McYl8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605757"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: ZV2Y9rZTThOr/8povWdRAQ==
X-CSE-MsgGUID: 7I8wGXRMQIyvY995V5QFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157827"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drm/xe: Move xe_force_wake_init_gt() inside gt
 initialization
Date: Thu, 25 Apr 2024 11:24:09 -0700
Message-ID: <20240425182410.2705061-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

xe_force_wake_init_gt() is a software-only initialization and doesn't
need to be called from xe_device_probe(). Move it to initialize
together with the gt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8d04283b3617..d090c4e7d57a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -572,9 +572,6 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	for_each_gt(gt, xe, id)
-		xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 805fd0acfc03..2e8efce2799a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -328,6 +328,8 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_wa_process_oob(gt);
 	xe_tuning_process_gt(gt);
 
+	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	return 0;
 }
 
-- 
2.43.0

