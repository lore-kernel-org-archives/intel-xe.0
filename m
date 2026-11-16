Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A0606A32C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=by3UqcAu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704610E9A9;
	Mon, 16 Nov 2026 08:11:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3B10E995;
 Mon, 16 Nov 2026 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816681; x=1826352681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/5zgmXvNZcrFkh9ycqLH7Ksu0MwsLkmHMpLUuzhR2M=;
 b=by3UqcAuT//JcsPAa9gAmcXptphv5J9bxZCVlAE5r/ojzulqBiGOQClj
 DIWi5IJO7nTOIXsxFANOT7qPBY2p2ex5yNQa7l97al7E4dSGCig/A5y2k
 JtRXOhPgm+jgXRhBwylPfezBtlD84wMiCcqu8VXxFLiHOkA5UGkAU3nod
 uHaddxIbesm0eYCpQEidTmLD0a2xiQ46EDIh2yCrZci3uqY1WFaizj+Qs
 s9tVPlF+5IkQlcEzAZHXap7UgEPduLFcsRZPMwPmqUuqb9cLOxeGqiXWQ
 NXKoCKKPTXCify8D6NpImuGU16YIOcDnxSPGGMdJSOb6tjZoRTIj2UOAz g==;
X-CSE-ConnectionGUID: gthU+Dr3R/emyFPOrSOV1w==
X-CSE-MsgGUID: AMkH+Z/6Tqmnr3Vvqld2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3462228"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3462228"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:21 -0800
X-CSE-ConnectionGUID: GUedKwVMRmuTY8rJiDaBLQ==
X-CSE-MsgGUID: 11BjfBUVSmywYA98Hk45CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9676196"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:20 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/dsb: Avoid redundant writes to the DSB buffer
 for indexed register writes
Date: Mon, 16 Nov 2026 10:10:41 +0200
Message-ID: <20261116081041.6519-8-ville.syrjala@linux.intel.com>
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

Currently each and every intel_dsb_reg_write_indexed() call
will store the new register count into the actual DSB buffer,
overwriting the previous count. Considering the LUT has
perhaps 1024 or more entries, that is a lot of redundant
writes into a buffer that may live in the local memory of a
discrete GPU.

Defer storing the count until the final value is known,
that is when a completely new instruction is about to
be emitted.

Eliminating these and other redundant writes speeds up the
DSB buffer writes for a 1024 entry LUT update from ~75 usec
to ~45 usec on my DG2.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index f7a54dc44894..057f0545bace 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -335,6 +335,10 @@ static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
 
 static void intel_dsb_ins_align(struct intel_dsb *dsb)
 {
+	/* Store the final indexed register write count */
+	if (intel_dsb_prev_ins_is_indexed_write(dsb))
+		dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
+
 	/*
 	 * Every instruction must be 8 byte aligned.
 	 * Indexed register writes may leave free_pos misaligned.
@@ -409,9 +413,12 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *dsb,
 	if (!assert_dsb_has_room(dsb))
 		return;
 
-	/* Update the count */
+	/*
+	 * Update the count. The actual dsb_buffer_write()
+	 * is done from intel_dsb_ins_align() once the final
+	 * count is known.
+	 */
 	dsb->ins[0]++;
-	dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
 
 	dsb_buffer_write(dsb, dsb->free_pos++, val);
 }
-- 
2.56.0

