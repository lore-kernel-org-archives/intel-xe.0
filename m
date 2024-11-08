Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA38D5E12D
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A8410E91E;
	Fri,  8 Nov 2024 05:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTzeglxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2D10E91E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044022; x=1762580022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9nC7QVqWTRQ7HzS2Y3FKc4lgsXgZMNO8KF0oHQE2ys=;
 b=kTzeglxGHG2exd4ls9scC0HVCgeOEFdmxMt2z8nPA5H5REJltBytann+
 Qj/DkOK+zu5T0YtaSzIBKs/r/aNpUutnS5W5e5UwBmLW08mxfzJyJKwgk
 phnboMyJk6p3x/L/FMbj2BxD22sbownHWog8pPKZaR8uEzBIx29CQODFC
 IyP5OeAkW+XHOZTlr5Jm6btBoNF7sgVb/lLp8vJDIn4F+5BgH8Iy48eOS
 ePRiX8ff5uhcXh3yNrnhvUgQHzAzBpaCk8AfnRNt44HnHnABq/0KL+dwY
 PMUS7EXgbXk11vq5Dl0SWr4m7ok1TLuwAYxOSjpN/UBWcQWdjEVcunVVH A==;
X-CSE-ConnectionGUID: 0vihemidQ8ag3m2H3dn1pQ==
X-CSE-MsgGUID: n4VQMuWVQm6/eggstHo2fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30316582"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30316582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:42 -0800
X-CSE-ConnectionGUID: QE342ioPTXGGCC0s4KR6og==
X-CSE-MsgGUID: ewyJ83sVR06tzzZHUY8F+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="90037105"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Sample gpu timestamp closer to exec queues
Date: Thu,  7 Nov 2024 21:33:17 -0800
Message-ID: <20241108053318.3483678-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108053318.3483678-1-lucas.demarchi@intel.com>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
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

Move the force_wake_get to the beginning of the function so the gpu
timestamp can be closer to the sampled value for exec queues. This
avoids additional delays waiting for force wake ack which can make the
proportion between cycles/total_cycles fluctuate around the real value.
For a gputop-like application getting 2 samples to calculate the
utilization:

	sample 0:
		read_exec_queue_timestamp
					<<<< (A)
		read_gpu_timestamp
	sample 1:
		read_exec_queue_timestamp
					<<<<< (B)
		read_gpu_timestamp

In the above case, utilization can be bigger or smaller than it should
be, depending on if (A) or (B) receives additional delay, respectively.

With this a LNL system that was failing on
`xe_drm_fdinfo --r utilization-single-full-load` after ~60 iterations,
get to run to 100 without a failure. This is still not perfect, and it's
easy to introduce errors by just loading the CPU with `stress --cpu
$(nproc)` - the same igt test in this case fails after 2 or 3
iterations. That will be dealt with in the test itself, using a longer
sampling period.

v2: Rename function and add another to get "any engine", preparing for
    caching the hwe in future (Umesh / Jonathan)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 73 ++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index dd4e16a84874c..298a587da7f17 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -269,6 +269,49 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	}
 }
 
+static struct xe_hw_engine *any_engine(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned long gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		struct xe_hw_engine *hwe = xe_gt_any_hw_engine(gt);
+
+		if (hwe)
+			return hwe;
+	}
+
+	return NULL;
+}
+
+static bool force_wake_get_any_engine(struct xe_device *xe,
+				      struct xe_hw_engine **phwe,
+				      unsigned int *pfw_ref)
+{
+	enum xe_force_wake_domains domain;
+	unsigned int fw_ref;
+	struct xe_hw_engine *hwe;
+	struct xe_force_wake *fw;
+
+	hwe = any_engine(xe);
+	if (!hwe)
+		return false;
+
+	domain = xe_hw_engine_to_fw_domain(hwe);
+	fw = gt_to_fw(hwe->gt);
+
+	fw_ref = xe_force_wake_get(fw, domain);
+	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
+		xe_force_wake_put(fw, fw_ref);
+		return false;
+	}
+
+	*phwe = hwe;
+	*pfw_ref = fw_ref;
+
+	return true;
+}
+
 static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 {
 	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
@@ -288,6 +331,10 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
 	xe_pm_runtime_get(xe);
+	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
+		xe_pm_runtime_put(xe);
+		return;
+	}
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
@@ -302,33 +349,11 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	}
 	mutex_unlock(&xef->exec_queue.lock);
 
-	/* Get the total GPU cycles */
-	for_each_gt(gt, xe, gt_id) {
-		enum xe_force_wake_domains fw;
-
-		hwe = xe_gt_any_hw_engine(gt);
-		if (!hwe)
-			continue;
-
-		fw = xe_hw_engine_to_fw_domain(hwe);
-
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
-		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
-			hwe = NULL;
-			xe_force_wake_put(gt_to_fw(gt), fw_ref);
-			break;
-		}
-
-		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		break;
-	}
+	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 
+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
 	xe_pm_runtime_put(xe);
 
-	if (unlikely(!hwe))
-		return;
-
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
 		const char *class_name;
 
-- 
2.47.0

