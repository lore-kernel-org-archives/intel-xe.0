Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B157CCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 10:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171C710E050;
	Thu, 26 Sep 2024 10:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIKHhXB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E7E10E050
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727347774; x=1758883774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lm6QEib3QdsRb+XKu7ACgRZgILn/UQfDrDFJkbmWN7g=;
 b=oIKHhXB79aWPDnIfJFxp6EUtsFAvZjKTGrvuWiAYpAY7lEUECiG7Moui
 qiEu+xELnQCSFDzyaqb6oR05zAr1kkLT33Ib6cigvrunFbwNzduMG2zLV
 jJmDWHeSwjVI26BqjUWEtSf/J6aWGxpGgB6DO8pw+jqdIYBPPhE7w9xii
 GC9ncZUO72Gzoz8sTxUkX/qmRmWrRZk5K33uy8FC0uKIROumiQQtCWMW+
 Mv2kHvbRLY09g4bMBGMWjdiqilnMZyBhC0Fw5+1TGtCC6fTprgTcYb7H1
 WiKXqkKmc+uW+qt9aT79ID0sHX4g8k+yFeG1siRQ60fyS9LIIQluhcbHz w==;
X-CSE-ConnectionGUID: /6oIexqlTZ+qVq2EbnyoDQ==
X-CSE-MsgGUID: kRYymIURQ1mZiSovCHkG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26248261"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26248261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:49:34 -0700
X-CSE-ConnectionGUID: lEdPKgRAT7iMkpD61l6syg==
X-CSE-MsgGUID: EEbdWuoKScqwSlngFacd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="95443369"
Received: from suttanur-desk.iind.intel.com (HELO
 singhapo-Super-Server.iind.intel.com) ([10.145.169.90])
 by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 03:49:32 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Check return values of functions in xe_gt_shutdown()
Date: Thu, 26 Sep 2024 16:30:26 +0530
Message-Id: <20240926110026.407383-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Check the return values of the functions xe_force_wake_get()
and xe_force_wake_put() to prevent mistakenly treating them as
void returns.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 274737417b0f..317640554310 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -890,9 +890,12 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	int err;
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");
 }
 
 /**
-- 
2.34.1

