Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C6D5E130
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CB110E921;
	Fri,  8 Nov 2024 05:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBcGDUTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0252C10E920
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044022; x=1762580022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HqnHTM7+YZ+jzqEwcgyTcPZ15k0X0M5em2PsQKE2r78=;
 b=kBcGDUTcZ21jVffvmINjLdfOxhnYsrNwuA7SSTdNctp/1JE87ZRSx2SR
 3sdbvdNK0D7enZkpyms5hONZtQjtj5fM+gXLi8Rdcpfw8qta+4H/Q84rm
 2WY9OvHLAr5zYSJ2+o11skmple0DN9FFhg3r1tg4+nzslChxIw18wPfpm
 1nDPR1EuJLh02QnobvbhUSfhyNftMGWRrGlwH06mNstOCgj/I1+Yj4fLa
 6f7x/dCq7aqdBnuXj8YFmDjsQNfYne1XqTsrKQl3UXgENQzLF8JDCmh4F
 7uwPF9I6tsZ2bdHwnP1fYNmP8oRHqTITuvLnj2x9yFvWLvKhtrk83gvLx Q==;
X-CSE-ConnectionGUID: 7S3LeAg2RASywgxwk/MHng==
X-CSE-MsgGUID: 2EGclfH/QQ2q5JrOq6GjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30316583"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30316583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:42 -0800
X-CSE-ConnectionGUID: wQHtWXHWQ8mu+8jmhCGavw==
X-CSE-MsgGUID: eCweOUMMTdO6QWlRB+4I5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="90037108"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
Date: Thu,  7 Nov 2024 21:33:18 -0800
Message-ID: <20241108053318.3483678-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108053318.3483678-1-lucas.demarchi@intel.com>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
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

Cache the hwe used to read the timestamp so it doesn't need to be done
every time it's read.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   |  2 ++
 4 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae9..9668a60e3aeae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -759,6 +759,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_drm_client_init(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fffbb7d1c40b4..f13b738ce77a8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -34,6 +34,7 @@
 
 struct xe_ggtt;
 struct xe_pat_ops;
+struct xe_hw_engine;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -509,6 +510,10 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	struct {
+		struct xe_hw_engine *hwe;
+	} drm_client;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 298a587da7f17..125ee18ab9f1f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -274,6 +274,9 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
 	struct xe_gt *gt;
 	unsigned long gt_id;
 
+	if (xe->drm_client.hwe)
+		return xe->drm_client.hwe;
+
 	for_each_gt(gt, xe, gt_id) {
 		struct xe_hw_engine *hwe = xe_gt_any_hw_engine(gt);
 
@@ -394,4 +397,11 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	show_meminfo(p, file);
 	show_run_ticks(p, file);
 }
+
+void xe_drm_client_init(struct xe_device *xe)
+{
+	xe->drm_client.hwe = NULL;
+	xe->drm_client.hwe = any_engine(xe);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index a9649aa360110..5609fbd682650 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -16,6 +16,7 @@
 struct drm_file;
 struct drm_printer;
 struct xe_bo;
+struct xe_device;
 
 struct xe_drm_client {
 	struct kref kref;
@@ -48,6 +49,7 @@ static inline void xe_drm_client_put(struct xe_drm_client *client)
 	kref_put(&client->kref, __xe_drm_client_free);
 }
 
+void xe_drm_client_init(struct xe_device *xe);
 struct xe_drm_client *xe_drm_client_alloc(void);
 static inline struct xe_drm_client *
 xe_drm_client_get(struct xe_drm_client *client);
-- 
2.47.0

