Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B97C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 05:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D5F10E6AB;
	Thu,  1 Aug 2024 05:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyUBTJeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1310E6AB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722491187; x=1754027187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z3bT0Hc6Jr40a/PhLap7CsCE8ERxxgWHzG/9YkBg1kE=;
 b=RyUBTJeGEO84GA3k1oOaiA+eSOGn/s2tcwzvApnWonmT+UKCexYNjk19
 myiShm7MemVl0h2JrAfjnZ0lhgswt8CgoEsQjcqPlX6yvRD6roAywj7fH
 N62VzpC/eMhBOYj2FIkulrAqPWoM4VcWYd6zmDPqCShV78yErZ6AhaCDx
 7c5+pBs0yEdyFozvDmpvoiuZ0QXX/7awR9i7miEosavvBxbyy4NVuyI+b
 8UfAs13LJQtwm6DD+nYGl96AlHJzvkV/h+aVOYY7NYhpGWTEoGs8vpMfb
 zJo169aDaDnKaNuk7w70+BHkrUfJZThSk4n+wAEVZlKQn2j5HRrLa+5qK A==;
X-CSE-ConnectionGUID: mhB6XJnsQeivdt/4RaUgkg==
X-CSE-MsgGUID: EMW5cpctQ0+RoQmMMx7iOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23337216"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="23337216"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:26 -0700
X-CSE-ConnectionGUID: K9r5W3aBRROhNuHVImxSlQ==
X-CSE-MsgGUID: n7Qkd6aHTq+s7OTudePVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="54881425"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:24 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, karthik.poosa@intel.com
Subject: [PATCH v5 1/2] drm/xe: modify GuC CTB enable communication
Date: Thu,  1 Aug 2024 11:29:40 +0530
Message-Id: <20240801055941.1187878-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240801055941.1187878-1-riana.tauro@intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
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

Modify GuC CTB enable communication function to only set the
CTB state if registration is not required.
This will be used while resuming from D3Hot where
registration of CTB is not necessary.

v2: split patches (Rodrigo)

v3: do not expose internals of CT layer (Michal)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.h |  2 +-
 drivers/gpu/drm/xe/xe_uc.c  |  4 ++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..1ff49318f001 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
 	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
-int xe_guc_enable_communication(struct xe_guc *guc)
+/**
+ * xe_guc_enable_communication - Enable GuC CTB communication
+ * @guc: GuC object
+ * @register_ctb: true to register CTB, false otherwise
+ *
+ * Enables GuC CTB Communication and IRQ
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	int err;
@@ -870,7 +879,9 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
+	if (register_ctb)
+		err = xe_guc_ct_enable(&guc->ct);
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index e0bbf98f849d..13e75573f7d0 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
-int xe_guc_enable_communication(struct xe_guc *guc);
+int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..fa98e9f22631 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 	if (err)
 		return err;
 
-	err = xe_guc_enable_communication(&uc->guc);
+	err = xe_guc_enable_communication(&uc->guc, true);
 	if (err)
 		return err;
 
@@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(&uc->guc);
+	ret = xe_guc_enable_communication(&uc->guc, true);
 	if (ret)
 		return ret;
 
-- 
2.40.0

