Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805B606A89D
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CtLamSav
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E315110E3E6;
	Mon, 16 Nov 2026 08:11:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3304910E8A5;
 Mon, 16 Nov 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816704; x=1826352704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Y2qKAgAVsoCsKo2TIXDYtqpzic9QNaNG1honHlGpN8=;
 b=CtLamSavDqdpE+NKUw6wa7KOkkH45IMDds4xVzowntcTCit0R7WgJoWx
 2JQ9oQlxDHavhj2u4N6rWzLoZcVR299SG//EJXQ8S55Q/PKHQYzt/2pkc
 6bHeHkQ8na4d3qNWt74J1QbD9r259Zv2xnj1TSkREoGff2+1RkyTINpzc
 MQrDns4qsDd6osLXFj5WsQDk9oarNJqxcgMUoohW9ASSBurDvS7UzKt9R
 oMQ9v5PVEfET74abt6hVeIOjA/2MBdvW5mlX7J0eP/JqvIcPo73Pwm2Zt
 XMObyZTqOQ/KePE3MMwF7W/V4tbOzvI7EEq6jQbdkHyyKaFDsxsYJIiyp g==;
X-CSE-ConnectionGUID: e9EDKm6zQHiIZQjc9B4MOg==
X-CSE-MsgGUID: ELcY6NKWQlWymqM3qlL6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3553564"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3553564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:57 -0800
X-CSE-ConnectionGUID: 2cK/QDQ9SWiWV5S6rPVJow==
X-CSE-MsgGUID: jB5HYspxQUeDbvAWo5qaEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9557706"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/dsb: Eliminate intel_dsb_prev_ins_is_write()
Date: Mon, 16 Nov 2026 10:10:36 +0200
Message-ID: <20261116081041.6519-3-ville.syrjala@linux.intel.com>
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

We no longer care about anything but indexed register writes,
so remove the pointless intel_dsb_prev_ins_is_write() middle
man.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index c15d4db5a3ee..8357c712a20e 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -338,9 +338,10 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
 }
 
-static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
-					u32 opcode, intel_reg_t reg)
+static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb,
+						intel_reg_t reg)
 {
+	u32 opcode = DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
 	u32 prev_opcode, prev_reg;
 
 	/* Nothing emitted yet? */
@@ -353,13 +354,6 @@ static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
 	return prev_opcode == opcode && prev_reg == intel_reg_offset(reg);
 }
 
-static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb, intel_reg_t reg)
-{
-	return intel_dsb_prev_ins_is_write(dsb,
-					   DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT,
-					   reg);
-}
-
 /**
  * intel_dsb_reg_write_indexed() - Emit indexed register write to the DSB context
  * @dsb: DSB context
-- 
2.56.0

