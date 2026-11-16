Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E1606A882
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DDZ0VlUn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC21910E3AD;
	Mon, 16 Nov 2026 08:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4C10E3AD;
 Mon, 16 Nov 2026 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816668; x=1826352668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xgRyx6idERa/0Vs3R5hQYdzNUMnx84iLB4NFYQN8VvM=;
 b=DDZ0VlUnYweC7M1xaUpx754c8RfpM38YHko4vFlNGvVsmQYesn2TPcED
 wyUm/9G7QPYbQ7DLWpDrFX7XtSzkOKDR/lVhHzroVREKzcRrLsqdLb7u4
 FL9F6OtO4OhwHCvthJghhGOGjbJP/UCKnV3A+isRxiXiqerIXMWYB1wPH
 jtKYHlDZn1leNGgFGVbdylyiJuztDInpHqDckM8fz80yMM4a+JDYbJwkk
 O4d+YoNrZ2kvhMy0pHqVIMnTGtCwzaK+O2NpjMOvw3MfC2oYVxB4/crtB
 +QAPtuAjDf8cT9VSAyw+fiEEU3qvN2nhMpQVt4Hs8VKFBrgJeFU3Hi9X9 Q==;
X-CSE-ConnectionGUID: SVtlXyAeTzC4eOIEJFeYvA==
X-CSE-MsgGUID: 17OEjfA5RXaqo9rdZCs6HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3581795"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3581795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:02 -0800
X-CSE-ConnectionGUID: 0CRb3YtyT3WYnySVy7A3cw==
X-CSE-MsgGUID: mKzSQzWwTMSvvMYKMoFbsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9499770"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:00 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915/dsb: Carve up
 intel_dsb_prev_ins_is_indexed_write()
Date: Mon, 16 Nov 2026 10:10:37 +0200
Message-ID: <20261116081041.6519-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently intel_dsb_prev_ins_is_indexed_write() checks both the
opcode and the register offset. I'll be needing the opcode
only part for a second use, so carve the function up into
two parts:
- intel_dsb_prev_ins_is_indexed_write() which just checks
  the opcode
- intel_dsb_prev_ins_is_indexed_write_to_reg() which checks
  both the opcode and the register offset

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 8357c712a20e..fa4964c17163 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -310,6 +310,20 @@ static unsigned int intel_dsb_tail(struct intel_dsb *dsb)
 	return dsb_buffer_ggtt_offset(dsb) + intel_dsb_size(dsb);
 }
 
+static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
+{
+	u32 opcode = DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
+	u32 prev_opcode;
+
+	/* Nothing emitted yet? */
+	if (dsb->free_pos == 0)
+		return false;
+
+	prev_opcode = dsb->ins[1] & ~DSB_REG_VALUE_MASK;
+
+	return prev_opcode == opcode;
+}
+
 static void intel_dsb_ins_align(struct intel_dsb *dsb)
 {
 	/*
@@ -338,20 +352,17 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
 }
 
-static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb,
-						intel_reg_t reg)
+static bool intel_dsb_prev_ins_is_indexed_write_to_reg(struct intel_dsb *dsb,
+						       intel_reg_t reg)
 {
-	u32 opcode = DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
-	u32 prev_opcode, prev_reg;
+	u32 prev_reg;
 
-	/* Nothing emitted yet? */
-	if (dsb->free_pos == 0)
+	if (!intel_dsb_prev_ins_is_indexed_write(dsb))
 		return false;
 
-	prev_opcode = dsb->ins[1] & ~DSB_REG_VALUE_MASK;
 	prev_reg =  dsb->ins[1] & DSB_REG_VALUE_MASK;
 
-	return prev_opcode == opcode && prev_reg == intel_reg_offset(reg);
+	return prev_reg == intel_reg_offset(reg);
 }
 
 /**
@@ -386,7 +397,7 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *dsb,
 	 * we are writing odd no of dwords, Zeros will be added in the end for
 	 * padding.
 	 */
-	if (!intel_dsb_prev_ins_is_indexed_write(dsb, reg))
+	if (!intel_dsb_prev_ins_is_indexed_write_to_reg(dsb, reg))
 		intel_dsb_emit(dsb, 0, /* count */
 			       (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
 			       intel_reg_offset(reg));
-- 
2.56.0

