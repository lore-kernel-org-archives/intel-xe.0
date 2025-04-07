Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54CBC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 14:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680DA10E4B5;
	Mon,  7 Apr 2025 14:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCzCERqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234210E4B3;
 Mon,  7 Apr 2025 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744036753; x=1775572753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jxbtKbwMC7KcLaDZ206XXWtVvEAwSlmfPx1myL0UYC8=;
 b=MCzCERqN2p5Lshe/+2wCfoTBq6TVANhnAGlMU68tG/fttGDkiNuBTrwy
 YLKQwdQ9Ba7dTpgm+TKkeSLJXl9XeMsjIo24PZuMYaddmsFIaOAe+FRPL
 6SDr+0g2CJ/M9jy87dmndYM7+hQUqG+BiLpHuTw/7/w1QjpZhw/4zwTQj
 CdrmasHGi0eotmoAAyPhzSOyfUwXBdk04vaxo3gFFoY9f3VNE4sUtxrQL
 Ix+0A16ZwA+b7horv4UlmZBcyjPa792bJJZcbvnpj3OfNTDJsT/PiFh11
 iLum+dj+j36Jd89+MU8wO9OXoOuA/voj/0mpmHYj1h5DIvRzirlkUW1mj w==;
X-CSE-ConnectionGUID: RBzrj73OTNSy6rl0R4yjQQ==
X-CSE-MsgGUID: If844/HQSWaN5CL6K3uHDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44572406"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="44572406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:39:13 -0700
X-CSE-ConnectionGUID: q2pixgbwSd6DpyibfdH1Sw==
X-CSE-MsgGUID: TLeWw3F7T6mhY0HAE8PmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="158963633"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 07:39:11 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, animesh.manna@intel.com
Subject: [PATCH 01/11] drm/i915/dsb: Extract intel_dsb_ins_align()
Date: Mon,  7 Apr 2025 19:53:49 +0530
Message-Id: <20250407142359.1398410-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407142359.1398410-1-chaitanya.kumar.borah@intel.com>
References: <20250407142359.1398410-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the code that alings the next instruction to the next
QW boundary into a small helper. I'll have some more uses for
this later.

Also explain why we don't have to zero out the extra DW.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 0ddcdedf5453..c166e02b8af0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -228,13 +228,25 @@ static bool is_dsb_busy(struct intel_display *display, enum pipe pipe,
 	return intel_de_read_fw(display, DSB_CTRL(pipe, dsb_id)) & DSB_STATUS_BUSY;
 }
 
+static void intel_dsb_ins_align(struct intel_dsb *dsb)
+{
+	/*
+	 * Every instruction should be 8 byte aligned.
+	 *
+	 * The only way to get unaligned free_pos is via
+	 * intel_dsb_reg_write_indexed() which already
+	 * makes sure the next dword is zeroed, so no need
+	 * to clear it here.
+	 */
+	dsb->free_pos = ALIGN(dsb->free_pos, 2);
+}
+
 static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 {
 	if (!assert_dsb_has_room(dsb))
 		return;
 
-	/* Every instruction should be 8 byte aligned. */
-	dsb->free_pos = ALIGN(dsb->free_pos, 2);
+	intel_dsb_ins_align(dsb);
 
 	dsb->ins_start_offset = dsb->free_pos;
 	dsb->ins[0] = ldw;
-- 
2.25.1

