Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAEAC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD8610E615;
	Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A210E615
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699373775; x=1730909775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ulGVnBxKoEyl3CKMRItttH1LyCiTEzHvviFqOvj6w7A=;
 b=Mn3qnQrCtogap4KerAD8bxO1YWvcF2HKrK+ALXiFAwIrKXf824YKdowJ
 sRTflxoYYpwbK/LPuJLsG2gVNN+9Bii3bprxmtXeq3Pkway9HTSBedPrz
 Z0CscvkVR3OHBIN29Q9ZgkVf54ak6l9nokbzC3cOr2Fvaq0yf7Ga2grL9
 AijeUnrxgvDF0FZb5irNqa7kpdPxxo1hmf1oJksdVdBMDd7oLV6CRlRzk
 Ml26LHArPn9lCd/nmh+lBA0hGwUWJEZM/nvm9o7syNMIPx1f3mHRdzLR7
 lQQ++pjNdJVYKw6ZqHVhCOEYbPUVq+Reco5qibaI5i3L32QkZu9IvJSvf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386719717"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="386719717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797709669"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797709669"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  7 Nov 2023 08:16:19 -0800
Message-Id: <20231107161623.135419-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
References: <20231107161623.135419-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe:
 s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..47b84b8ca78b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -59,7 +59,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
  * engine done being processed).
  */
 #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
-#define ENGINE_STATE_ENABLED		(1 << 1)
+#define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
 #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
@@ -84,17 +84,17 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
 
 static bool exec_queue_enabled(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_ENABLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
 }
 
 static void set_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static void clear_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static bool exec_queue_pending_enable(struct xe_exec_queue *q)
-- 
2.34.1

