Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F4C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012E41129A1;
	Tue, 16 Apr 2024 03:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXUNn1sA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840BF1129A1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236707; x=1744772707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t6DYDNttXZvs/8uhN3AiBN9esg6GduYi3XFzuOsX/UU=;
 b=EXUNn1sAsLa7WhQRCQ8HB/6z6tWtgg9tRF3tdg42nd4QTFzxk6OSE57K
 j7AnBGo8YEPsZEN5JS3dX66f3IEddmsWxYZmqsbHMhMh4XM3H1uU3opwN
 Y0CElzW4dDIksMcmJME9ALcNueK2YsrMx30Z0jq5rNrpAMemDcA+rxEvv
 OQnP2FkilnJZcF2U7j0e1qN6mFesN0S/Yjn1HMOZGp8oWaTXaLU9+LJaG
 fzKGpR3ttLhoxWTeIiYdg9NBfoLIG+ZZxp7ISASFb1Z0MZ8HxaFoSmt04
 pVLYW9tz7fNy11YYdz7X2XkInNfDYF7iJlyA/cg9vk/3nAMX2cpYDAyPW w==;
X-CSE-ConnectionGUID: czVANqYiTCyhOVNJausZvQ==
X-CSE-MsgGUID: m/9QwI+CQwuKyWhm+LiuMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213823"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213823"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: wVlryiDaSta5QqhZ7YrM7A==
X-CSE-MsgGUID: cN5hhSNpT/6/189hV3vTKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895703"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/7] drm/xe: Promote xe_hw_engine_class_to_str()
Date: Mon, 15 Apr 2024 20:04:50 -0700
Message-ID: <20240416030454.3739862-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Move it out of the sysfs compilation unit so it can be re-used in other
places.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c             | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 18 ------------------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a688bb2d96ce..8f72f324eee7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -959,3 +959,21 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
+{
+	switch (class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		return NULL;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..843de159e47c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -67,4 +67,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 	return hwe->name;
 }
 
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c5084d94c442..4e9db6299c7c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -624,24 +624,6 @@ static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-static const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-{
-	switch (class) {
-	case XE_ENGINE_CLASS_RENDER:
-		return "rcs";
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		return "vcs";
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		return "vecs";
-	case XE_ENGINE_CLASS_COPY:
-		return "bcs";
-	case XE_ENGINE_CLASS_COMPUTE:
-		return "ccs";
-	default:
-		return NULL;
-	}
-}
-
 /**
  * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
  * @gt: Xe GT.
-- 
2.43.0

