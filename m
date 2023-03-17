Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1132C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 00:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4D610E363;
	Fri, 17 Mar 2023 00:22:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4D010E363
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679012543; x=1710548543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L7MinuQS8AvQEqQTSbrDEpod34IiXrUDeIhV+ubK+hE=;
 b=GbGD/feWEHZxCI6tIG7L4yqgRUyiMpZ5mRIKTlPvVqzJZioRM2yX/icj
 3lUwgpy11OM4f+8EgkWVntSaw515ZfvAG7QbvglSTeST/txKstGXBx0fm
 R18GSGlCVxPt5VvdHWVCHplYVhJo1ooSsx46HdiE9JSIfbLiZggSyW9Fk
 8RIp9m42AvuIxRPOeDz5ELoUuC3eOLugKUCtBkJTBCaIAISwfIkQMl957
 bUJ/cLdfdbGtBl7dt2HsMOix4gZyJrq+/J9DeYJpkB5xfkZTzPaOepgqC
 H/YKFDaWNUVxBVWSd3oaLGmO8iGTM76GfEsF29idY7bgGEZ3yELvs1xoM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339686286"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="339686286"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657376272"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="657376272"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:22:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 17:22:21 -0700
Message-Id: <20230317002221.211065-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix locking in CT fast path
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

We can't sleep in the CT fast but need to ensure we can access VRAM. Use
a trylock + reference counter check to ensure safe access to VRAM, if
either check fails, fall back to slow path.

VLK-45296

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 25c5087f5aad..0cc4f52098a1 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(!xe->mem_access.ref);
 }
 
+static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
+{
+	lockdep_assert_held(&xe->mem_access.lock);
+
+	return xe->mem_access.ref;
+}
+
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
 	bool ret;
 
 	mutex_lock(&xe->mem_access.lock);
-	ret = xe->mem_access.ref;
+	ret = __xe_device_mem_access_ongoing(xe);
 	mutex_unlock(&xe->mem_access.lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e5ed9022a0a2..bba0ef21c9e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
+	if (!xe_device_in_fault_mode(xe))
 		return;
 
+	if (!mutex_trylock(&xe->mem_access.lock))
+		return;
+
+	if (!__xe_device_mem_access_ongoing(xe))
+		goto unlock;
+
 	spin_lock(&ct->fast_lock);
 	do {
 		len = g2h_read(ct, ct->fast_msg, true);
@@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
 	spin_unlock(&ct->fast_lock);
+
+unlock:
+	mutex_unlock(&xe->mem_access.lock);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
-- 
2.34.1

