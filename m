Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61C3C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A42F10F491;
	Wed, 22 May 2024 10:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFVZno/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CAB10EE6B
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373331; x=1747909331;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yCAe/C4lDcpSw14KNslZOsBTieCZ2RF9dF3iebX0Db4=;
 b=DFVZno/2P+SgmfcNMjtTOuEBmaGvTGEoRtW4gOvBcsjk5IdTj4aDMBtP
 vHuM7kUE96NXJ9k/AjKbfDVrVyIu5S8TZ0xU07QxD6AgWOU/V+943p099
 C/UPHxr8k0jei45jzScEuKFJMQu2V8nQaKqJoJ2LeT0rO7uMOEVwW+bMH
 bKO1tzPV6BZ48yiIW5jH5OVFLxJRiptDpdsRcVsmo0J7JitZYEnKD9ttS
 Mp9Zzk+1x1MZk8cxMG1tXSl9OjxcbmOZ1Qfuq4n4hxHmp3yoQAvu+wONP
 s8nwVwd5YjgW6XXGKwf3QpsREM3YZjA9QelkM2OhS/qiR5xgLjlyqZG1P A==;
X-CSE-ConnectionGUID: PZfveLe+RqecN7UUjshkjg==
X-CSE-MsgGUID: DaEQxo2iRci1ZgEjEpLlfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562686"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:09 -0700
X-CSE-ConnectionGUID: mbKY7NqNQkeZmdW+Zq//xQ==
X-CSE-MsgGUID: Emx/6yudQC20GWFPOpwnlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195263"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 06/18] drm/xe/guc_pc: move pc_fini to devm
Date: Wed, 22 May 2024 11:21:49 +0100
Message-ID: <20240522102143.128069-24-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Here we are touching the HW/GuC and presumably this should happen when
the device is removed. Currently if you hotunplug the device this is
skipped if there is already open driver instance.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d10aab29651e..4164dab1ab66 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -893,7 +893,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
+static void xe_guc_pc_fini(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
 }
-- 
2.45.1

