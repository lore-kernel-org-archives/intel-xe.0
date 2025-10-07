Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911F3CCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5A10E649;
	Tue,  7 Oct 2025 11:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N68r7IYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88110E683
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836410; x=1791372410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p8M0RH4vsCYRwBobkAH21imDXJNLZS8mRcvITtOWMbg=;
 b=N68r7IYY4vi7DZokj132UbOveq4JFy4sFYIOS13/fhagdZRF8JY30zb+
 oD/VeY+kfh1ciYgehpx2WYhE7j3wHkW5gKBjfYRBRrEi2rIy3ItpQLLcW
 1GTpkkKw8PELhKBGQrf60E4+V3ekiii9+2goX0iOtgQJVvRUqUCj6+VhY
 7InLXzM/1P7UfuFSEYRb9u1Jp1hMysqXHBpe8w8n5gaxpyXGHaaFHEpx5
 1t7lMBwtUIfSRDKJUSzx6mIhRZbtWKVW2OG0HI44YEagX1iH28t+XLgq6
 INSMkSoh5GgpMYGuqlohEU5HiDyJ4mTUvrV/g9bZ2uxtGJHOLJfS7o21K A==;
X-CSE-ConnectionGUID: uvXVilsKS2aKom4g7krqUQ==
X-CSE-MsgGUID: eRk6CWQ5QtW+zuABjn8sJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660688"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:50 -0700
X-CSE-ConnectionGUID: sQChtoDaTK2CUKFg5Gc8ZQ==
X-CSE-MsgGUID: k3IUqyU9ShuakQ7c2V8DFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924010"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 18/32] drm/xe/vf: Flush and stop CTs in VF post migration
 recovery
Date: Tue,  7 Oct 2025 04:26:27 -0700
Message-Id: <20251007112641.2669655-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

Flushing CTs (i.e., progressing all pending G2H messages) gives VF
post-migration recovery an accurate view of which H2G messages the GuC
has processed, enabling the GuC submission state machine to correctly
rebuild all state.

Also, stop all CT traffic, as the CT is not live during VF
post-migration recovery.

v3:
 - xe_guc_ct_flush_and_stop rename (Michal)
 - Drop extra GuC CT WQ wake up (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c      | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 866cad61d301..6856973cab9a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1100,6 +1100,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	gt->sriov.vf.migration.recovery_queued = false;
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
+	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f63ce0cec357..fd2385635962 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -574,6 +574,16 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
 	stop_g2h_handler(ct);
 }
 
+/**
+ * xe_guc_ct_flush_and_stop - Flush and stop all processing of G2H / H2G
+ * @ct: the &xe_guc_ct
+ */
+void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct)
+{
+	receive_g2h(ct);
+	xe_guc_ct_stop(ct);
+}
+
 /**
  * xe_guc_ct_stop - Set GuC to stopped state
  * @ct: the &xe_guc_ct
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index ca0ec938edac..02eaa452b400 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
+void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
-- 
2.34.1

