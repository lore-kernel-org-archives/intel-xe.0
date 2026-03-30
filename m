Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD8610D14AC
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 13:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B810E76A;
	Mon, 30 Mar 2026 13:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsUTQaAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AD410E76B;
 Mon, 30 Mar 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774875772; x=1806411772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dKJNEmqnoCMZ/IrFMCTcypFVG0Zbea0AvUy3HlyP1Lw=;
 b=dsUTQaAIq+9RQmnkOgGSetrQnbIPFugXkk79vNji9zBoS+QII7ngAEh+
 3FJ20iHH7G5/Rt81IydvKR0tkKBanE5nc9Vy/c6oTA3Qe5gtENWCfNzbX
 6jijx82McsgFY5WNKbSW9oIMm2d019Wb8FaulYWz6U+ISeDEBgRWe0ASD
 Hzbgvau4CIkkAaOAn+33hnKPhWmw94uwz6aqEDTxhSfK710ElDlkUMKx2
 m/CH1/HTEhSL0eMowstCDZ3/ifLgJQk3lsRS4CNzDfdfH1JkmBJEHIg2g
 ie4qCP6xHP3Zbnznl8k3uY69GHkxEdYcFhmwaiLlpSt8zuNjEWzQK3bJK A==;
X-CSE-ConnectionGUID: LCNkbqoTR+e3B2QVM8PnJA==
X-CSE-MsgGUID: mEALqsPOT92EKSTCls8xow==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79767828"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79767828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:02:52 -0700
X-CSE-ConnectionGUID: kpG/TtqwSoqKCwn2y4jJBA==
X-CSE-MsgGUID: i17dFXppTCW5IZpqp1Z4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="256560152"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:02:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/3] drm/xe/step: switch from enum xe_step to intel_step naming
Date: Mon, 30 Mar 2026 16:02:35 +0300
Message-ID: <87530eaa2052ae4a3c97c7fb87e261d1f73341a7.1774875688.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774875688.git.jani.nikula@intel.com>
References: <cover.1774875688.git.jani.nikula@intel.com>
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
index d0f888c31831..fb9c31613ca7 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -278,7 +278,7 @@ void xe_step_gmdid_get(struct xe_device *xe,
 	case STEP_##name:	\
 		return #name;
 
-const char *xe_step_name(enum xe_step step)
+const char *xe_step_name(enum intel_step step)
 {
 	switch (step) {
 	STEP_NAME_LIST(STEP_NAME_CASE);
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 41f1c95c46e5..ea36b22cc297 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -18,8 +18,8 @@ void xe_step_pre_gmdid_get(struct xe_device *xe);
 void xe_step_gmdid_get(struct xe_device *xe,
 		       u32 graphics_gmdid_revid,
 		       u32 media_gmdid_revid);
-static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
+static inline u32 xe_step_to_gmdid(enum intel_step step) { return step - STEP_A0; }
 
-const char *xe_step_name(enum xe_step step);
+const char *xe_step_name(enum intel_step step);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index 808385f81804..f60572b93523 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -10,8 +10,6 @@
 
 #include <drm/intel/step.h>
 
-#define xe_step intel_step
-
 struct xe_step_info {
 	u8 platform;
 	u8 graphics;
-- 
2.47.3

