Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAA5CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9ED11261C;
	Fri, 16 Oct 2026 07:19:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799FF112621
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135150; x=1823671150;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bUU+bIG3ru8uO7NSlfEi15DnigTdXBLtpB18yYzQpbc=;
 b=FaDivDQQFdg5zPkzw9Diyzw/aWKQeULX/EYjivtBlzUtSuaopzAF/M6a
 zPmpByQ/HStDge6sJy4pYQDq2C5AApwVgTc8NFyMYmcy8Ktk/jQQEvwNI
 vKsjhfI5JMOjU+Nb7Mj8/dmsawhV/VefQz6cUhb78JVjvur5yG/iN5XZy
 5UUNiw8yASM3RM5W+cEkPxPhJfOgA8Fnvboy/DnAiKx2PsbQhx96JuHOt
 G97SIDVa2Kts4MUq+ZBi2H1eAS70kNRRjldNvE8MlACK8jP9U2aFbLPPJ
 QKZVQKanJL6qAAjyaj8ZnLlVShj2+YED36kncC+RUN2qKc/xzPRnVmr9O g==;
X-CSE-ConnectionGUID: 6ulW7oc2TaK3pzsRMHfgMA==
X-CSE-MsgGUID: e3iVpH02QMSfFJ7hERI76w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813661"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813661"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:58 -0700
X-CSE-ConnectionGUID: 7MWDXnj3RJuldfSq0DNXLQ==
X-CSE-MsgGUID: RmDlFVpTTBGIcwfFDC3ZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787303"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:57 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 17/18] drm/xe: Skip PM notifier preparation when device
 I/O is blocked
Date: Fri, 16 Oct 2026 12:48:27 +0530
Message-ID: <20261016071832.222574-18-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

The system PM notifier runs before the PCI suspend callback and may
evict BOs or prepare pinned BOs.

Hold the common device I/O gate during preparation and skip it when
the device is blocked or unplugged. Track whether preparation ran so
the post callback only performs matching cleanup and releases the
runtime PM reference when needed.

Keep the gate held across BO eviction so isolation waits for
preparation admitted before the device was blocked.

v2:
 - Protect PM preparation with the common SRCU gate.

v3:
- Replace the private I/O gate with the DRM device SRCU helper.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0a6ca893b257..b02d61343477 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -494,6 +494,8 @@ struct xe_device {
 
 	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
 	struct notifier_block pm_notifier;
+	/** @pm_notifier_active: PM notifier prepare work was performed */
+	bool pm_notifier_active;
 	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
 	struct completion pm_block;
 	/** @rebind_resume_list: List of wq items to kick on resume. */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317..fd265f9135c6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -459,10 +459,16 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 	{
 		struct xe_validation_ctx ctx;
+		int io_idx;
+
+		/* Do not start PM preparation while device I/O is blocked. */
+		if (xe_device_io_get(xe, &io_idx))
+			break;
 
 		reinit_completion(&xe->pm_block);
 		xe_pm_block_begin_signalling();
 		xe_pm_runtime_get(xe);
+		xe->pm_notifier_active = true;
 		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
 					     (struct xe_val_flags) {.exclusive = true});
 		err = xe_bo_evict_all_user(xe);
@@ -479,10 +485,16 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		 * allocations.
 		 */
 		xe_pm_block_end_signalling();
+		xe_device_io_put(io_idx);
 		break;
 	}
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		if (!xe->pm_notifier_active)
+			break;
+
+		xe->pm_notifier_active = false;
+
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
-- 
2.43.0

