Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B598CC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8B10E7F8;
	Tue, 20 Aug 2024 17:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEpuNoMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1210E7F1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6gtB3i2JQUG7I22ermqo0W8U5RKBMy/qX2TdmRCbJYI=;
 b=AEpuNoMndsab9KSGkVi4W6Sr43xa8Lgdmp+uYiuOXZlqau9g9cG1i3lR
 ezS24jqI6a6EEpb/3ofBh5XIBtHXotNEzkFnYhrtVbda8LDrlwZcPOVUq
 2BuXo3MgKvczU4ncz09abrel/1ipxtqBhRjRVllBdRCcki+I++6F9u80c
 wtx9aHcTu7jtvUVA/UJ8DLTn9dfD9fEXh6jtOjyGtHMRC5PRXbOEwOzX8
 qyGpCzMLHV2W0oxYjYw4ykHwNzDL1Ub1VArtbhu2o/T1CLmEap3wAUQD0
 I7ZfuDD6oWR8hPfvoAo4hx4PSdafQAolamaeLeuqOSSra1O1xplBD07DQ w==;
X-CSE-ConnectionGUID: SHP6aBIOQnaZTgrXjFX1HQ==
X-CSE-MsgGUID: yqDg31DoRvuwYowvw5te7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365493"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: lfwI2A3oTvySi5JPoUKBWQ==
X-CSE-MsgGUID: pun3r4dLRc2dBwQ8rmTQ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651736"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/xe: Set firmware state to loadable before
 registering guc_fini_hw
Date: Tue, 20 Aug 2024 10:29:54 -0700
Message-Id: <20240820172958.1095143-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

The guc_fini_hw registered calls __xe_uc_fw_status which is only
expected to be called after initializing fw state. Move this before
registering guc_fini_hw.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..52df28032a6f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -350,6 +350,8 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
+
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
 	if (ret)
 		goto out;
@@ -358,8 +360,6 @@ int xe_guc_init(struct xe_guc *guc)
 
 	xe_guc_comm_init_early(guc);
 
-	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
-
 	return 0;
 
 out:
-- 
2.34.1

