Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4915ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC0510E235;
	Tue, 14 Oct 2025 18:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXhdfn05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57510E679
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465369; x=1792001369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lrxapucSKidkjpZfXzwkMkV2oh91B3mB9Uv1jeyzDQ=;
 b=jXhdfn05aAMhr0a8Dhzx/eMy640NLYyGvaOdY4fYniXMkhxvLrKIkBWy
 QDDK1tM3Z5izK7KiarbOh23ubMsdwtChG71brwsRycx2aDJlT5cFvT4BR
 U2r6rN6ptWfF6TPEUhhrIQVpHZX7G63IWpbbEtlP1O3TeR/UJNhXyaogZ
 baUkResnfSkIS5oM3Qr+VmTyI7y4oSiynFiU+9hNNMProfVMhWlf7Hw3v
 uhsdrdub+5AZJh4OC+QvdaFzRFeGI1kIAo+uUpgyc8pNSV6Cej3fdHpU4
 4m08jH6KJiAdyABA1lBSUVt+vX46MeCbtxdxJ6onruZTlD8g5vMG3DRnA w==;
X-CSE-ConnectionGUID: MtIdC8T3Q6CNe+GOPB4ioQ==
X-CSE-MsgGUID: F2/jYTObSHCL5BVQk6zsQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66285421"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66285421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:29 -0700
X-CSE-ConnectionGUID: cg822s4gSbS5XZKH3fYfAg==
X-CSE-MsgGUID: OXoUygncSLW7Q5bLXN7b3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="212570180"
Received: from dut4084arlh.fm.intel.com ([10.105.10.163])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:29 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Date: Tue, 14 Oct 2025 18:09:27 +0000
Message-Id: <20251014180927.105077-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014180927.105077-1-stuart.summers@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
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

Comments also added to the code, but in the event of
a wedge or a hardware failure while communication with
GuC is outstanding (e.g. during a schedule disable or
context deregistration), the driver doesn't automatically
reset the software state as it would in a typical GT reset
since we are trying to save the state for debug. However
once the user unbinds the driver we still need to go through
and clean everything up for these exec queues so we don't
leak memory on the DRM side (e.g. LRC or LRC BO).

Add a kick start to the DRM scheduler to handle any outstanding
messages on hold during the wedge and go through the GuC stop
flow to simulate that reset on teardown.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5ec1e4a83d68..0bbae336c722 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -276,6 +276,14 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	/*
+	 * If GuC stopped responding during deregistration
+	 * some queues can be left in a bad state. Ensure
+	 * these are all cleaned up by going through the
+	 * GuC software reset flow.
+	 */
+	xe_guc_stop(guc);
+
 	ret = wait_event_timeout(guc->submission_state.fini_wq,
 				 xa_empty(&guc->submission_state.exec_queue_lookup),
 				 HZ * 5);
@@ -295,6 +303,13 @@ static void guc_submit_wedged_fini(void *arg)
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/*
+		 * Kick start the scheduler since some messages
+		 * might have been added while the scheduler was
+		 * stopped during a wedge event.
+		 */
+		xe_sched_submission_start(&q->guc->sched);
+
 		if (exec_queue_wedged(q)) {
 			mutex_unlock(&guc->submission_state.lock);
 			xe_exec_queue_put(q);
-- 
2.34.1

