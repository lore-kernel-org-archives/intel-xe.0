Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0E9CD3444
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D010EEF8;
	Wed,  6 May 2026 22:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae7wNlIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675B910E1FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106911; x=1809642911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5Yh3rHcscW4lvHpsWXA0O08lWE+2tJRdrCyXTGEn+w=;
 b=Ae7wNlITZ4E5Jd8Dqd9N3T30rWJzAZjH295rmbFd6mTD3Hufzdx02m4Y
 OWIft4XOLzKPUsh2a41TJoFUsNX3sImRZd4M67ez91+I//25RQjORompa
 7gTwxAsmfchSNzKMCi6pyWOE/e+JtE0BYlUFJNTo6U1OHEIYyuz/zfksG
 EJE16PMiqFqjFmYCnznghZjtIGHHuMntFBLGVclBsMlCsthhg+PHuOCYf
 6pt4b6j7clMO+yiTZA01sXn2i8l2l61RLGLWdfbG0oQrSvtFjdYQUz9Tw
 EnaL4yKigwt2JrReDmlytZ3iaNE86Mq7bLG4riJkqvdqUaE5zmklYM8wl Q==;
X-CSE-ConnectionGUID: yBdjUk6lQRC99ClVwA5yNg==
X-CSE-MsgGUID: waQVInVITr+catCDe/DNRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429711"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: bPlDY/61Ro+NBzFUnDd2/A==
X-CSE-MsgGUID: 0Na1evkeReSTY/c8vG0GuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707470"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 03/11] drm/xe/lrc: Refactor xe_lrc_timestamp to simplify
 logic
Date: Wed,  6 May 2026 15:35:04 -0700
Message-ID: <20260506223500.3769614-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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

Use a context_active() helper and simplify the timestamp logic.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2: Add a comment if context switched out (Niranjana)
---
 drivers/gpu/drm/xe/xe_lrc.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 66682a678cc2..b31525bd2a4c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2585,6 +2585,11 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
 	return 0;
 }
 
+static bool context_active(struct xe_lrc *lrc)
+{
+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
+}
+
 /**
  * xe_lrc_timestamp() - Current ctx timestamp
  * @lrc: Pointer to the lrc.
@@ -2597,33 +2602,23 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
  */
 u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 {
-	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
-	u32 engine_id;
+	u64 reg_ts, new_ts = lrc->ctx_timestamp;
 
-	lrc_ts = xe_lrc_ctx_timestamp(lrc);
 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
-	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
-		new_ts = lrc_ts;
-		goto done;
-	}
-
-	if (lrc_ts == CONTEXT_ACTIVE) {
-		engine_id = xe_lrc_engine_id(lrc);
-		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
-			new_ts = reg_ts;
+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
+		return xe_lrc_ctx_timestamp(lrc);
 
-		/* read lrc again to ensure context is still active */
-		lrc_ts = xe_lrc_ctx_timestamp(lrc);
-	}
+	if (context_active(lrc) &&
+	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
+		new_ts = reg_ts;
 
 	/*
-	 * If context switched out, just use the lrc_ts. Note that this needs to
-	 * be a separate if condition.
+	 * If context swicthed out while we were here, just return the latest
+	 * LRC CTX TIMESTAMP value.
 	 */
-	if (lrc_ts != CONTEXT_ACTIVE)
-		new_ts = lrc_ts;
+	if (!context_active(lrc))
+		return xe_lrc_ctx_timestamp(lrc);
 
-done:
 	return new_ts;
 }
 
-- 
2.51.0

