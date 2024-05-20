Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E7C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94CC10E7B5;
	Mon, 20 May 2024 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3n1HaG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0306510E4C2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219943; x=1747755943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p4+oJb/fGU2nn/DlWVbzdoCGsMzsWa4A0rLoNvJkNdM=;
 b=n3n1HaG3b4Y+mkeHzHWu6NCgyIZNlBvuavpsALoLrz+dWryjmHxWPtlm
 OzHj6fglXwqkwNgJY7xhKb0yFNh6yM3x6tMyP48HPHfN7sS7uO4BdHjto
 o+CvFg/UOoAQArsnNN3C+yb/tUhI9KG0K38JEBnuNKos7dK6J98/eydp+
 5Lo9qpvozpr669k5foHlb7jLpTPIHfH/gaIr0urqe/qZaq3MMlJQI3BCr
 Bplo1Bbsd+2pzArXu34oxffEP4eb7JdAlUjuMXQQD3SdkNSWrRP2OuEbS
 72keGPiq9wcN3Y4tkcFd82YpvQgIgTMqteW5M16xROf4t9SMWKJ60GAAa Q==;
X-CSE-ConnectionGUID: AGU5paSVR2ihrn0wDl88Mw==
X-CSE-MsgGUID: i/7eRrPkQaWomHKp8JO+uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873153"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:43 -0700
X-CSE-ConnectionGUID: kpRkl1HSQRCVD51y96u8TA==
X-CSE-MsgGUID: k4J4D4ChRiiKcOasJw/RmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610460"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 07/18] drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
Date: Mon, 20 May 2024 16:42:56 +0100
Message-ID: <20240520154249.52888-25-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

Make it clear that is about cleaning up the HW/FW side, and not software
state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 4164dab1ab66..aabe241be42b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -889,11 +889,11 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 }
 
 /**
- * xe_guc_pc_fini - Finalize GuC's Power Conservation component
+ * xe_guc_pc_fini_hw - Finalize GuC's Power Conservation component
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(void *arg)
+static void xe_guc_pc_fini_hw(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
-- 
2.45.1

