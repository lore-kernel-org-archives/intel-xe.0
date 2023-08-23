Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5222BEE49AD
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 05:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2410E254;
	Wed, 23 Aug 2023 05:04:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F96010E224
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 05:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692767076; x=1724303076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtkSCeWjHmcgRdwuoQ13FJdQjpbcTQy2motatJiwoRQ=;
 b=MvHOEZcxB2Hj+YmpefVxH8pCkXpTeJ1zoyoxSrNBGJO3L0eQXYlU2Up2
 kKCJ/py20bDG9Bldoe+fYGOWyU6UhT/OB6tXf8o5c1py11RpokYV1tTv8
 qZEnng2gvxjXxBFDCTpzmlTICgTkqt+csCOqkWZndXSPzstKt6sBt1t++
 k22OicMWp+k4nhn5tb0HV5MYMGxFISHAu8MrBU7+FD/N4BAyAlMLnGHIT
 84N4tOHx7/81DffZ1gWZRGw4CL6Ghgr2aZLfM9Ao2813v6ltjSHAE73in
 /b7ggodejhVN6uqUdIcHN+xqlNXT7QE7rxFPBetVti9n7inwjETm1spbl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372956867"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372956867"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983130430"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="983130430"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:39:54 +0530
Message-Id: <20230823050955.1226024-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230823050955.1226024-1-riana.tauro@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] RFC drm/xe: Disable ctb communication
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

During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
transistions. It is not necessary for GuC to reset for D0 -> D3hot,
only enable/disable ctb communication.

Modify the existing ct disable function to send a request
to disable ct communication if firmware is running.
Add a function to disable guc communication.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2493c5859948..3e4c00bee6bf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -557,6 +557,21 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
+int xe_guc_disable_communication(struct xe_guc *guc)
+{
+	int err;
+	struct xe_guc_ct *ct = &guc->ct;
+
+	err = xe_guc_ct_disable(ct);
+	if (err)
+		return err;
+
+	/* Check for messages received during/after the CT disable */
+	guc_handle_mmio_msg(guc);
+
+	return 0;
+}
+
 int xe_guc_suspend(struct xe_guc *guc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 3addd8fc674a..18cf5d02eea7 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,6 +18,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
+int xe_guc_disable_communication(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 59136b6a7c6f..64c2029b2752 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -21,6 +21,7 @@
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
+#include "xe_uc_fw.h"
 
 /* Used when a CT send wants to block and / or receive data */
 struct g2h_fence {
@@ -319,15 +320,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
-void xe_guc_ct_disable(struct xe_guc_ct *ct)
+int xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
+	struct xe_guc *guc = ct_to_guc(ct);
+	int ret = 0;
+
 	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
 	ct->enabled = false; /* Finally disable CT communication */
 	spin_unlock_irq(&ct->fast_lock);
 	mutex_unlock(&ct->lock);
 
+	if (xe_uc_fw_is_running(&guc->fw))
+		ret = guc_ct_control_toggle(ct, false);
+
 	xa_destroy(&ct->fence_lookup);
+
+	return ret;
 }
 
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f15f8a4857e0..1ad150c19ae3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -12,7 +12,7 @@ struct drm_printer;
 
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
-void xe_guc_ct_disable(struct xe_guc_ct *ct);
+int xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *
-- 
2.40.0

