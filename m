Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60928CCD198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282DA10E6A7;
	Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQ4uJO69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF010E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842314; x=1791378314;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1wCXF/rUpsFkKMQb7vMnjJJpzk4fz+fKpy2s/YAyHBU=;
 b=NQ4uJO692Xa+ldRjVrwvNRtPkEYRIbw/VWGFVMd7j9/aC4oOyVUdCuir
 HzolYtL59nFt4g3Ns9f5NpULlqPGJSPDl8uxrE+XvzA1J/JX8D5vS4+aZ
 G55AxUvbdDLNXoiDHT48Vt5hSwCWZD5RDwqkoG6i1UVdesm+PQ5eUtlW2
 K4tXibHBEGykENHitSDk/+fFeYaC4OlEVJzPUvQBfr8vjfUCI4a63gBoF
 ToNAXJHTAZ4LFkmyXfqB/Vs5OCeYVjRYomE4w9329CvbiWhjDPuleqpkV
 GY0D6pnaeJWozwo1RlKcIzUIxfUvRpyjgKd3d03P9YEWgE8AiOKpiI8IW Q==;
X-CSE-ConnectionGUID: rPot/t6ZSRS/G7/JPKAHRA==
X-CSE-MsgGUID: KIPnjYazQ76UVKzp0AiOjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639839"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:14 -0700
X-CSE-ConnectionGUID: /3iNjV4/RrurHihJVfL24Q==
X-CSE-MsgGUID: Qr00Tw0BTnG79XTWNZguSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576949"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 19/33] drm/xe/vf: Flush and stop CTs in VF post migration
 recovery
Date: Tue,  7 Oct 2025 06:04:51 -0700
Message-Id: <20251007130505.2694829-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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
index ae49364f6f28..f8370fa4727f 100644
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

