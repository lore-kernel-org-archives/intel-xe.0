Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E375CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333010E665;
	Thu, 18 Sep 2025 07:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLxUNnbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8033210E65D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758179590; x=1789715590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3toUoO0P51lSrPYPWg/ViWFbLIcuEXFW8LvHUcdf3A=;
 b=TLxUNnbgUcHso29mFMBJ/huMcrBFPtaViFLXntJxfIb6v5zDCTwDZVlU
 rJCqBhueDmHIrz+H1FNaLY41d4Hh9AMX11d5SkWrr6BWXrWxnAZDm/5+1
 R3ENVrLuyadtSeasZGlvEIl6zmjWdGKgJaIm46Ftm2Pd3r9F/9LwSjNGR
 hEKmbsti+88/owCjdx6KQzsp9GmKeMDH7xP+zmvsxZJKfkh2ZGN2Pa5Xm
 nNTzIq3zluyd5ueBjw82fkkP+1122rUWVgA9j8CJuxHd5+IlOTX7NohWJ
 aEbKcEWmt4tnye9aBX672WZ3bE8MCp7QxGsCagI2l+WAunSE54CXhBqRm w==;
X-CSE-ConnectionGUID: 5vvw8JcPSLCjbMecWTNRew==
X-CSE-MsgGUID: C49YWDGcSQmHlNHL4WB5nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60648752"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60648752"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:13:09 -0700
X-CSE-ConnectionGUID: KY24AVrWTmCRK8eXyrp4ow==
X-CSE-MsgGUID: hTsfE9/XTamJWdSFdHpIaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175856964"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 00:13:08 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/4] drm/xe/lrc: Add helper to query post-init ring tail
Date: Thu, 18 Sep 2025 13:00:05 +0530
Message-ID: <20250918073002.15242-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
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

Some paths need to know the ring tail immediately after ring
initialization, before any user or kernel commands are emitted.

The tail may not be zero after init because the ring can be pre-populated
with required workarounds or bootstrap instructions.

Introduce a helper that returns this default post-init tail.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       |  1 +
 drivers/gpu/drm/xe/xe_lrc.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d52e0eb97f5..27be53c94b46 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1458,6 +1458,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (err)
 		goto err_lrc_finish;
 
+	lrc->ring.tail_on_init = lrc->ring.tail;
 	return 0;
 
 err_lrc_finish:
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..ab198c94e953 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -80,6 +80,21 @@ u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
 u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
+
+/**
+ * xe_lrc_ring_tail_on_init - Ring tail after lrc_init()
+ * @lrc: Logical Ring Context
+ *
+ * The tail may not be zero after init because the ring can be
+ * pre-populated with required workarounds or bootstrap instructions.
+ *
+ * Returns: Tail of the ring on lrc_init().
+ */
+static inline u32 xe_lrc_ring_tail_on_init(struct xe_lrc *lrc)
+{
+	return lrc->ring.tail_on_init;
+}
+
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
 u32 xe_lrc_ring_space(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index e9883706e004..6d04b21c2bfa 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -44,6 +44,8 @@ struct xe_lrc {
 		u32 tail;
 		/** @ring.old_tail: shadow of tail */
 		u32 old_tail;
+		/** @ring.tail_on_init: tail of submission ring after lrc_init() */
+		u32 tail_on_init;
 	} ring;
 
 	/** @desc: LRC descriptor */
-- 
2.51.0

