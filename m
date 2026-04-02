Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF011D6AAF8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDF810F2FD;
	Thu,  2 Apr 2026 19:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2lvgfb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135E710F2EA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157503; x=1806693503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xy0ioAnCDVjh+V4UG7GTjXET6UeKndgWDQg3AtzgBc=;
 b=k2lvgfb6hmari8nllZtKs40XIHe40JbgQcTjsY5vCzaQVs26SI/dYtb+
 qZ2hZaI32pD14u6IflmdgKber+FN2tJ4eTHO5CSg7R+TWc2FCCQhOqK1c
 mojT1o++BjUT5rSa/XLRiGxqaKRitHJON1C8e+aromUduy/5NDxf7roFh
 JClKX8NJzIa2CpJQfftx9gT30MLGaHgTK++gpdngPjnYlEJBl5eAKl9/m
 Z4313/df4gIC+NC0E9S0Hu2aI2CsFe3RhXORVOIKg6zqiCHc0slCfT5bE
 Y06JWVu/13PIidzrZvq3QitiKF7mj+fhGUyeoiZOFO8+vX8LaY/aMyoTI A==;
X-CSE-ConnectionGUID: /dArn7FeT2uHFeoBZQ+6wA==
X-CSE-MsgGUID: kqBhPMWMSDCZvEpcBpziVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241109"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:22 -0700
X-CSE-ConnectionGUID: L8g42Fb4RzWD1zYiXol78g==
X-CSE-MsgGUID: aq99oWoIRxWzusLuy8SkJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213086"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 10/13] drm/xe/pf: Reprovision scheduling to default when no
 VFs
Date: Thu,  2 Apr 2026 21:17:23 +0200
Message-ID: <20260402191726.4932-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Once we have disabled VFs there is no point in keeping potentially
limited PF scheduling provisioning as we want to complete a cleanup
of the VFs resources and return to the pure native mode, the same
as before VFs were enabled, as soon as possible.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c          |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 39 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  1 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 3fd22034f03e..35e6b53e18ce 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -191,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	xe_sriov_pf_reprovision_default(xe);
+
 	pf_reset_vfs(xe, num_vfs);
 
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index abe3677d33ed..e11874d689fa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -103,6 +103,45 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	return 0;
 }
 
+static int pf_reprovision_default(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, false);
+		result = result ?: err;
+		err = xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, PFID, 0);
+		result = result ?: err;
+		err = xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, PFID, 0);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_reprovision_default() - Reprovision default PF in auto-mode.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_reprovision_default(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	if (!pf_auto_provisioning_mode(xe))
+		return 0;
+
+	return pf_reprovision_default(xe);
+}
+
 /**
  * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
  * @xe: the PF &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index f26f49539697..b15e4d7ad940 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -30,6 +30,7 @@ int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid,
 
 int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
 int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
+int xe_sriov_pf_reprovision_default(struct xe_device *xe);
 
 int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode);
 
-- 
2.47.1

