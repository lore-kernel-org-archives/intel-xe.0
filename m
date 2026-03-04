Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22328EF8FF1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 14:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D893E10EA2D;
	Wed,  4 Mar 2026 14:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyq4+hog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B2D10EA2D;
 Wed,  4 Mar 2026 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772635294; x=1804171294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZkdbFR8fZzQ1hu2SkSWfqA5lBfkvEldj8SI/l23a88I=;
 b=jyq4+hog08pB4RxKmMQwpfZAmY6ASWN8YSUvV+zmMytzC4s/OW9yDZGG
 aIwRLHY16IKl4ZUnX2BDG9uIBJDGgOZPNd1y1lp2YJ/zSPlifHqb/9E0q
 H6UsJAfVUdvdGvPSFP15zKtv8ogGtur5vD4rSRPM5G8Xny+R0c9GtkYfN
 SRznhcYXtxvcEqu7WefMiVgOOv25u0jU4PeLLKm9OjqfHd/yvifY6IWJj
 vdW/iJrtG3SmhsIpPQDnjTR4dmojR1D2g6gh1xA7cbt3/e6EstvZGw88Q
 L9qXlZx8O+sC6wlyg186wGXHaLAy9bBMjZhRzQoCAiDqm7jQVnikkQPib w==;
X-CSE-ConnectionGUID: +8sflB4HSvu91D+PaVD7nA==
X-CSE-MsgGUID: OJcYpvNTS/CMmk23dSNUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73744094"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73744094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:34 -0800
X-CSE-ConnectionGUID: RSSuPG+JTGqRxKVMARrxzA==
X-CSE-MsgGUID: 1jpinp7qTE6V8TqeeHm93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217518073"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 7/8] drm/xe/step: switch from enum xe_step to intel_step naming
Date: Wed,  4 Mar 2026 16:40:52 +0200
Message-ID: <d314f94272ffa45bb90b77f07220baac914769df.1772635152.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remove the xe_step macro, and use the enum intel_step name directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c  | 4 ++--
 drivers/gpu/drm/xe/xe_step.c       | 2 +-
 drivers/gpu/drm/xe/xe_step.h       | 4 ++--
 drivers/gpu/drm/xe/xe_step_types.h | 2 --
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f3179b31f13e..860409c579f8 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -131,12 +131,12 @@ static const char *subplatform_prefix(enum xe_subplatform s)
 	return s == XE_SUBPLATFORM_NONE ? "" : " ";
 }
 
-static const char *step_prefix(enum xe_step step)
+static const char *step_prefix(enum intel_step step)
 {
 	return step == STEP_NONE ? "" : " ";
 }
 
-static const char *step_name(enum xe_step step)
+static const char *step_name(enum intel_step step)
 {
 	return step == STEP_NONE ? "" : xe_step_name(step);
 }
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 2860986f82f7..e021da35b03c 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -248,7 +248,7 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 	case STEP_##name:	\
 		return #name;
 
-const char *xe_step_name(enum xe_step step)
+const char *xe_step_name(enum intel_step step)
 {
 	switch (step) {
 	STEP_NAME_LIST(STEP_NAME_CASE);
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 686cb59200c2..6fd680c1b45e 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -16,8 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
 struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 				      u32 graphics_gmdid_revid,
 				      u32 media_gmdid_revid);
-static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
+static inline u32 xe_step_to_gmdid(enum intel_step step) { return step - STEP_A0; }
 
-const char *xe_step_name(enum xe_step step);
+const char *xe_step_name(enum intel_step step);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index bc3ed5a8282a..bd9a7a44a67f 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -10,8 +10,6 @@
 
 #include <drm/intel/step.h>
 
-#define xe_step intel_step
-
 struct xe_step_info {
 	u8 graphics;
 	u8 media;
-- 
2.47.3

