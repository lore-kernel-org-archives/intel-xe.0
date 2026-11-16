Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50373606A881
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S511PxC9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F4610E3E6;
	Mon, 16 Nov 2026 08:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ED510E989;
 Mon, 16 Nov 2026 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816745; x=1826352745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6lw33cBp7WIFgQLeDZMRehcoG3PH+753sISz6rd1P+k=;
 b=S511PxC9Sjz2CUiVoWVpHMBS+oOUmAMCG/LUckmcU/Tdt+g9TQj77hNF
 r5lcsxBB4bstI0cWKpoR4AfOHyVxE4WnVoyUXGR8KiMEeqMJlTFpsjhnT
 v9OVA44I9SMwO3T2+gt0hZ0k6L6hT8RJxD5N8BNDFwpUwh9uononn5wgq
 Cxa3Wh0JkGUg+kHCNgMAfMjeblrH8lxwtaUCL6RRCOUsyoksKeZgi+ivf
 96qOYyLQUYJ7TuWWAAe6cnzh42nFH4AyyiADO5vQtxZBavI3a91DQyguR
 +Amr+5t41Zap/YfD8CpBMaZX5D7b+Qoy4U0xE+JePS7JH7cEsiYcafoLj A==;
X-CSE-ConnectionGUID: kc1lhdGORnqf57WRtT70Zg==
X-CSE-MsgGUID: VZQdQlwKRjGAv2/B7kF8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3553579"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3553579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:16 -0800
X-CSE-ConnectionGUID: ESgxfahOSgmmdz5AqnYjyQ==
X-CSE-MsgGUID: W250r73KRhSVXqACSRrsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9557752"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/dsb: Skip redundant zeroing of every second
 indexed write DW
Date: Mon, 16 Nov 2026 10:10:40 +0200
Message-ID: <20261116081041.6519-7-ville.syrjala@linux.intel.com>
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

Currently intel_dsb_reg_write_indexed() assumes that it may be
the last register write into the same register, and proceeds
to zero out the last misaligned DW. But if another indexed write
to the same register follows (as it usually does) that zeroed DW
will again be overwritten with the new register value.

So every second indexed register write in a sequence will
perform a completely redundant DW write. Considering that the
DSB buffer will be in device memory on discrete GPUs we
probably don't want to do these redundant writes.

Defer the extra DW write to intel_dsb_ins_align() which gets
called ahead of every new DSB instruction emitted. There we'll
just have to write a single DW, if the previous indexed write
left us with an odd number of DWs.

Eliminating these and other redundant writes speeds up the
DSB buffer writes for a 1024 entry LUT update from ~75 usec
to ~45 usec on my DG2.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index f8ca64a3c076..f7a54dc44894 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -336,14 +336,11 @@ static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
 static void intel_dsb_ins_align(struct intel_dsb *dsb)
 {
 	/*
-	 * Every instruction should be 8 byte aligned.
-	 *
-	 * The only way to get unaligned free_pos is via
-	 * intel_dsb_reg_write_indexed() which already
-	 * makes sure the next dword is zeroed, so no need
-	 * to clear it here.
+	 * Every instruction must be 8 byte aligned.
+	 * Indexed register writes may leave free_pos misaligned.
 	 */
-	dsb->free_pos = ALIGN(dsb->free_pos, 2);
+	if (dsb->free_pos & 1)
+		dsb_buffer_write(dsb, dsb->free_pos++, 0);
 }
 
 static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
@@ -417,9 +414,6 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *dsb,
 	dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
 
 	dsb_buffer_write(dsb, dsb->free_pos++, val);
-	/* if number of data words is odd, then the last dword should be 0.*/
-	if (dsb->free_pos & 0x1)
-		dsb_buffer_write(dsb, dsb->free_pos, 0);
 }
 
 void intel_dsb_reg_write(struct intel_dsb *dsb,
-- 
2.56.0

