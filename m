Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E01C25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1810E967;
	Tue, 21 May 2024 09:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcX94/cT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9C710E967
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716283540; x=1747819540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCSJT2gv1crKnFraoq7ZQUXbzm8vtOufuPBRK1Vy1B4=;
 b=LcX94/cTgxnkag3wjhPNJVLnY5drYGXo/3jp0NQbUByQyKh8fYlPUbVN
 wvwgpeGnfj0ehuF5oC/F1k8L9TTnxmRf2gQUVBVtgM3pgSKs36D7umFy3
 qCnhqqyJo7TVi68ImuWwPB8IgWh24JvxsJzYq6NvTMWsx+8MwC1PLrX16
 6gaE7lk0FJBkdL8K8uSMC+iiNkmKzeC1J3eY32AlHBslIzZZYkk/I3c82
 sU7apLHjccMfTbbF6cjY6C/h6BelE9ur1CMzPF/uhaabN66uyzqMioO8s
 0Jz3t+XnNjo8pCDPMy7S8yYdmTF/agdJSLRYFK3YpKojX6g71i33FYKMl w==;
X-CSE-ConnectionGUID: pdtfWWIvQR+DnDSwq5ktvA==
X-CSE-MsgGUID: e/R7HGcIQkOeDo7kimqncA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12310797"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12310797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:40 -0700
X-CSE-ConnectionGUID: +AmUPC3zQHG5D2tyUIAMxw==
X-CSE-MsgGUID: YhD2ifc1TJGCBUStz/MUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32758152"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: Allow to initialize submission with
 limited set of IDs
Date: Tue, 21 May 2024 11:25:17 +0200
Message-Id: <20240521092518.624-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521092518.624-1-michal.wajdeczko@intel.com>
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
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

While PF and native drivers may initialize submission code to use
all available GuC contexts IDs, the VF driver may only use limited
number of IDs. Update init function to accept number of context
IDs available for use.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
v2: add kernel-doc for xe_guc_submit_init (Himal)
---
 drivers/gpu/drm/xe/xe_guc.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e52b544ac690..807ad53449e4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -358,7 +358,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc);
+	ret = xe_guc_submit_init(guc, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4efb88e3e056..13ec171ada1b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -278,7 +278,20 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
-int xe_guc_submit_init(struct xe_guc *guc)
+/**
+ * xe_guc_submit_init() - Initialize GuC submission.
+ * @guc: the &xe_guc to initialize
+ * @num_ids: number of GuC context IDs to use
+ *
+ * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
+ * GuC context IDs supported by the GuC firmware should be used for submission.
+ *
+ * Only VF drivers will have to provide explicit number of GuC context IDs
+ * that they can use for submission.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -288,7 +301,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 4275b7da9df5..4ad5f4c1b084 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -12,7 +12,7 @@ struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
-int xe_guc_submit_init(struct xe_guc *guc);
+int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
-- 
2.43.0

