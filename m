Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB13D30007
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343C610E91D;
	Fri, 18 Oct 2024 13:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXOM0pHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0910E91D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729258151; x=1760794151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CiswG5EeB+T/E9DMTc2AKvmMSrAwjrjZqwSbAMD8Si0=;
 b=gXOM0pHJ9ChNE3tFmrp/jn4yEeSXBO/M2Ul6sIP5OUlE5eqaPBjc57Uw
 YQfCyApS96/v/G2xiZrSl/c2EpehTY9xgS1yZYWx+7CoL1/ON1Ch7qbQd
 fuSAUsXdc3u5NpNUN8k0PLjL316OkAK820man9l8D2RshtcJZeGsT9VmP
 mfJwfpRUICOOQEwtZoq0LyQ4sLuC8yqQSS/JKXjaaEawI2wto1nkVzlQ9
 O8oQy0bGChC4nr0REt5fhbI9cisJ0NrUyzhvZpdtnzp+zgmOljQ4y5s3h
 mh3JmcCy/A6g6PBF0cJR0DY+MkrqnkB2x8aDIX2m9NyCdtwurCCqx6rX0 Q==;
X-CSE-ConnectionGUID: 3g/cUuq3RsWKv7HKlS3HkA==
X-CSE-MsgGUID: zi6D6yxHQOmVy/g+A5L09w==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28250354"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="28250354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:29:10 -0700
X-CSE-ConnectionGUID: fyQMpiWmQ6yD8Q/cbNBiUg==
X-CSE-MsgGUID: qcCjLJxkSAeWgqC3yLcRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="116328287"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:29:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
Date: Fri, 18 Oct 2024 14:47:10 +0200
Message-ID: <20241018124710.1536948-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

If the backing fence is signaled then signal ufence immediately.
This should reduce load from the xe ordered_wq and also won't block
signaling a ufence which doesn't require any serialization.

v2: fix system_wq typo
v3: signal immediately instead of queuing in system_wq (Matt B)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Auld <matthew.auld@intel.com>
gc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c6cf227ead40..069c1e4ebea5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	return ufence;
 }
 
-static void user_fence_worker(struct work_struct *w)
+static void signal_user_fence(struct xe_user_fence *ufence)
 {
-	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
-
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
@@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
 	user_fence_put(ufence);
 }
 
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
+						    worker);
+
+	signal_user_fence(ufence);
+}
+
 static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
 {
 	INIT_WORK(&ufence->worker, user_fence_worker);
@@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 		err = dma_fence_add_callback(fence, &sync->ufence->cb,
 					     user_fence_cb);
 		if (err == -ENOENT) {
-			kick_ufence(sync->ufence, fence);
+			/* signal the ufence immediately if fence is already signalled */
+			signal_user_fence(sync->ufence);
 		} else if (err) {
 			XE_WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
-- 
2.46.0

