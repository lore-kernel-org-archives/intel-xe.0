Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B48CD612F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 20:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347910E2E9;
	Mon,  9 Oct 2023 20:22:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2161210E2E8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696882921; x=1728418921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YI9YHtyWMPOMp0zyC4tJCaucsmGIkDc9edKNu0DsXfU=;
 b=f4r5ZbEsRogkHDthbdDGKV/UtCy+ZbWALssVSCPlTOr/wUfl1Q6yiGqr
 U1I3nmi23X7AaqoVlDnNYaZuVSnXr04hFFDzuf4FaET0mzCNkdx1sLF0u
 O/3zHkBS1MKTZ4IOq73K0FzrLmzjeO5rJsYP1zYae/ol5UTMBRry7gswd
 tIbnZuptFHWZ5yRvmHwIqDRM0Gs9pFV7PCsihTdLauSBLS6OIpbEtfatU
 SVDq6AwNPrfM0dmM1gEK43Uxr3jMcXJbXfgoGahZWJl0T/iS+GRoP9Wop
 4Yw5AfvCxZsKBMKdv58pEgt5q/W0NGF46EBDXwKh7+wDWw7aq8HaJfXlc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2824787"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2824787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788288410"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="788288410"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:21:59 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 13:21:48 -0700
Message-ID: <20231009202149.245718-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009202149.245718-1-jose.souza@intel.com>
References: <20231009202149.245718-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: Add misc functions to support
 read of specific DSS registers
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Next patch will read register in specific DSS registers and this
are the functions missing to do so.

xe_gt_mcr_get_dss_steering() calculate and return the group and
instance that will be used by xe_gt_mcr_unicast_read().

xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
if DSS is available for geometry of compute.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  3 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h |  4 ++++
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1e..47860ce94f9fe 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -747,3 +747,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
+{
+	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
+
+	return value & BIT(dss % 8);
+}
+
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return has_dss(gt->fuse_topo.g_dss_mask, dss);
+}
+
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return has_dss(gt->fuse_topo.c_dss_mask, dss);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a03..e7baaa0088041 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8dc..e76cb0ae457aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
+static unsigned int
+get_dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	unsigned int dss_per_grp = get_dss_per_group(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
@@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
 		}
 	}
 }
+
+void
+xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
+			   int *instance)
+{
+	unsigned int dss_per_group = get_dss_per_group(gt);
+	*group = dss / dss_per_group;
+	*instance = dss % dss_per_group;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a00..c0167d57de42a 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -24,6 +24,10 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
+void
+xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
+			   int *instance);
+
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #endif /* _XE_GT_MCR_H_ */
-- 
2.42.0

