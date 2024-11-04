Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3B4D132D6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979AE10E458;
	Mon,  4 Nov 2024 14:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="he5Zi0lL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB910E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731114; x=1762267114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1WSaG4JUoQFgUXE/FmGExIUe5brSCGTspmYyaZZS+M=;
 b=he5Zi0lL/K4F08jTaEex2yag00dwrxzMVlIaNfeaiW69h2170gGVfw0s
 XqKtGRGtefLoGR4VZYSRGSevlLbeBCYPHE8KqAgq8L8LLR2SOMNzhGjgv
 HyYGQScxMiyZ402fKUnPb5MrRS8B1AvR23qukVGqexQHju/IiB6eC74Hw
 VEQG6daVt+Lbfpcdtz/lR+sLzyCGYuKMa6dV+V8Gml/u7wZsBuXFeZGLF
 zn3vOZVBzc6OO6A97QAwWSpssDfoQPoUL88AaQUPsHlWqmyCgkKs2aPTU
 yUb6BQZhS1LrcyNbzI2HNIuZp7oStrFhyZnFn+9Yh0K+nRro9gy5fB+Ws A==;
X-CSE-ConnectionGUID: hxOCBDCOS5+NbSBwS49CYA==
X-CSE-MsgGUID: OnADgO63Q56MkI/wIHCLiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55831413"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55831413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:34 -0800
X-CSE-ConnectionGUID: zeUWhngHSiWgDueGnP24sg==
X-CSE-MsgGUID: OTyghOpRSWGe26ENvB2wug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88244316"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Date: Mon,  4 Nov 2024 06:38:15 -0800
Message-ID: <20241104143815.2112272-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104143815.2112272-1-lucas.demarchi@intel.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
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
proportion between cycles/total_cycles fluctuate either to more or to
less than the real value, depending if the delay happened in the first
or second sample of a top-like application:

	sample 0:
		read_exec_queue_timestamp
					<<<< (A)
		read_gpu_timestamp
	sample 1:
		read_exec_queue_timestamp
					<<<<< (B)
		read_gpu_timestamp

Additional delay in (A) will cause the utilization to be bigger
than it should. Additional delay in (B) will cause the utilization to be
smaller than it should.

With this a LNL system that was failing after ~60 iterations, get to run
to 100 without a failure. This is still not perfect, and it's easy to
introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
the same igt test in this case fails after 2 or 3 iterations.

Although not perfect, this could be viewed as just extracting that ugly
loop to "find the forcewake for any available engine" into a separate
function, and at the same time improving the results a little bit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 24a0a7377abf2..874c2157baf49 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	}
 }
 
+static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
+					     struct xe_hw_engine **phwe,
+					     unsigned int *pfw_ref)
+{
+	struct xe_gt *gt;
+	unsigned long gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_force_wake_domains domain;
+		unsigned int fw_ref;
+		struct xe_force_wake *fw;
+
+		hwe = xe_gt_any_hw_engine(gt);
+		if (!hwe)
+			continue;
+
+		domain = xe_hw_engine_to_fw_domain(hwe);
+		fw = gt_to_fw(gt);
+
+		fw_ref = xe_force_wake_get(fw, domain);
+		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
+			xe_force_wake_put(fw, fw_ref);
+			return false;
+		}
+
+		*phwe = hwe;
+		*pfw_ref = fw_ref;
+		return true;
+	}
+
+	return false;
+}
+
 static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 {
 	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
@@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	xe_pm_runtime_get(xe);
 
+	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
+		return;
+
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
 	xa_for_each(&xef->exec_queue.xa, i, q) {
@@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
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
 
 	/*
 	 * Wait for any exec queue going away: their cycles will get updated on
@@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	wait_var_event(&xef->exec_queue.pending_removal,
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
+	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
 	xe_pm_runtime_put(xe);
 
-	if (unlikely(!hwe))
-		return;
-
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
 		const char *class_name;
 
-- 
2.47.0

