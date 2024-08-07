Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D7CC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 13:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD8B10E11A;
	Wed,  7 Aug 2024 13:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJNhOaRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6E310E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723037249; x=1754573249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t7yFdM7zWYH2tnOGAuAxImgvWdc/68nQkVjFnQNWbrY=;
 b=nJNhOaRnSe/Y4Vz/0iaYBOxXYckfR637lxBGWrtgvz8usR1j4t4TMSXL
 HDjMjwmVfn8woLGmV7ABuIMqXZ/m7iTuEA218kYtlfuPVrQDXhXXjuuOO
 kMEkAoqahVaI6tzQHtIu5Qd7UsaRttJmsrhv0A85QwAjRmIQ9gLIlK+Ve
 r4ix+6BzCUOxvKY30RBBAHmuVa2dDxa5xYWqXe6piIqBt66PE2ucLoVAR
 UzAdMhjGXHryExUCUzLU+qfhBUbGMTUKVQUI+7PBOD6xmDmvbAsJA2Jbm
 Jnk/Cjh3gTECPY5hZoUcFW7Pd+cv000ZjY2k46Jrdj4J0GU2wNiO/yi6B A==;
X-CSE-ConnectionGUID: MV/ScmNNQc+e5ySDu8fJog==
X-CSE-MsgGUID: 88kWMyozQeK2Df6cVev2vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21247394"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21247394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:27:29 -0700
X-CSE-ConnectionGUID: qJKOFMyvTC6XQNmvH+Wj1w==
X-CSE-MsgGUID: bgL348zEQEiCqfzpFabDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="94426128"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:27:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v6 1/2] drm/xe: modify GuC CTB enable communication
Date: Wed,  7 Aug 2024 19:10:49 +0530
Message-Id: <20240807134050.2048114-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240807134050.2048114-1-riana.tauro@intel.com>
References: <20240807134050.2048114-1-riana.tauro@intel.com>
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

v4: fix uninitialized err variable (Matthew Brost)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 23 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc.h |  2 +-
 drivers/gpu/drm/xe/xe_uc.c  |  4 ++--
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..85b88532e23f 100644
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
@@ -870,9 +879,11 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
-	if (err)
-		return err;
+	if (register_ctb) {
+		err = xe_guc_ct_enable(&guc->ct);
+		if (err)
+			return err;
+	}
 
 	guc_handle_mmio_msg(guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index c3e6b51f7a09..5fcf6f6ef964 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -30,7 +30,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
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

