Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374ABFF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 09:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D8710E63B;
	Mon, 27 Apr 2026 09:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hx/7bXQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831BC10E649
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777282373; x=1808818373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4lPWSMSIjhbtKGSFtdR789RLmYK5HnNDeif85TOoLE=;
 b=Hx/7bXQ4IGsdrUZhMx/sk+rVi5aP0uczRnSTnG9xly4J9iuT2Tjdm5gd
 hzoCrEKWT5nOLsyL59ZV3JWoGk6oIzF60l5Sihusy0dIEW/t0fZHm1LGW
 ReRQpX3wd952NUq45iLYE+vd6wlt/2+J6JASY/X2HLru2NYMgKwpgpUpI
 Wv7OkmxoYcjq4LHqithRzqwV4StBisjSfiNwNeVyPd8q7TIO5gTiYRCCo
 7Dqg9lheGTTowGio7IH/BSDn1EqeLcag6GA/MweWL3jLzjW4LPqGGjuah
 uv4A9UzRLPWY1sVwG7V98yHNmRMAznx+t0KNKJzMNJv/jBykPBvqTUxH6 A==;
X-CSE-ConnectionGUID: 9XyTsd9IRRKUE9yeWbhmdQ==
X-CSE-MsgGUID: Wr9GZKbgQk23HLb8O/ZRbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78082626"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78082626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:32:52 -0700
X-CSE-ConnectionGUID: MmEVaSIFRciGUsKfjqZQNw==
X-CSE-MsgGUID: d6lY5VMhTIyK3GPuuMYjHA==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 02:32:50 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc_pc: Make xe_guc_pc_stop() void
Date: Mon, 27 Apr 2026 14:59:26 +0530
Message-ID: <20260427092928.1181893-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427092928.1181893-1-raag.jadav@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
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

xe_guc_pc_stop() doesn't return any meaningful value. Refactor it into
void function.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 9 ++-------
 drivers/gpu/drm/xe/xe_guc_pc.c | 8 +++-----
 drivers/gpu/drm/xe/xe_guc_pc.h | 2 +-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1355b68d3fce..ec291588c482 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1730,13 +1730,8 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_stop(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
+	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+		xe_guc_pc_stop(&guc->pc);
 }
 
 void xe_guc_stop(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 7ecd91ad6192..9530cddbd11d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1316,18 +1316,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
  * xe_guc_pc_stop - Stop GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
  */
-int xe_guc_pc_stop(struct xe_guc_pc *pc)
+void xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc)
-		return 0;
+		return;
 
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
-
-	return 0;
 }
 
 /**
@@ -1343,7 +1341,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
-	XE_WARN_ON(xe_guc_pc_stop(pc));
+	xe_guc_pc_stop(pc);
 
 	/* Bind requested freq to mert_freq_cap before unload */
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0678a4e787b3..1025a2b15f5f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -13,7 +13,7 @@ struct drm_printer;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
-int xe_guc_pc_stop(struct xe_guc_pc *pc);
+void xe_guc_pc_stop(struct xe_guc_pc *pc);
 void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
 int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
-- 
2.43.0

