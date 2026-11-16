Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F6606A880
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlD4bmLV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CAE10E28F;
	Mon, 16 Nov 2026 08:11:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C726110E26C;
 Mon, 16 Nov 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816662; x=1826352662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jc3395c28TZjPTceqr7tP9mUtMzFXbG0KYJSZedsN10=;
 b=IlD4bmLVi0/FBtEjQDSZ/bKQgMlYv9OjXwl57uhYjR+C9XWfa1YLyO9a
 yY9PsyGUURrg/p1wECgSt/tOb7xDENka4AoOG7DNYgrPHneeJf8aUIxQy
 dSv4mUGGclNXRskhFQatbhyCXvlogQQZ+0rtg9XXiEAaQcfeHaLgI4J/o
 tjOVq087Md4uIjkBjvRh3qG6apzu808Z7FLVSZ9shMs1Wy2qNX1Y4WCtw
 Lsa6B8AgPdvvMoUQmc3vqzDTJS+EnfG/3IOoVaIhdT6OQUug5S9sc9GSY
 r7dMgNcRR+dfSsn1oEpguIT96G+dfVNz3NqesRozuT/kEFDI+c8kJ2BJh Q==;
X-CSE-ConnectionGUID: LpkMcXSqQRW0gjoSI327DQ==
X-CSE-MsgGUID: anSB+DvNTqyaq1GlNtiTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3581776"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3581776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:52 -0800
X-CSE-ConnectionGUID: C6Q8ABO3S8ug4ctrxU7HSw==
X-CSE-MsgGUID: aFTRNYTbTsivABCfso8PIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9499739"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:10:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/dsb: Remove old comment about stale contents of
 the DSB buffer
Date: Mon, 16 Nov 2026 10:10:35 +0200
Message-ID: <20261116081041.6519-2-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Actual reads from the DSB buffer were eliminated in
commit 0e94059113f6 ("drm/i915/dsb: Avoid reads of the DSB
buffer for indexed register writes") so the old comment
about the initial buffer contents being garbage are no
longer relevant. Remove the outdated comment.

Let's keep the "have we emitted anything yet?" check for
100% correctness. Otherwise the initial state ins[] = {0,0}
would count as the previous instruction being a NOOP.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 90401f0fc2b0..c15d4db5a3ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -343,11 +343,7 @@ static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
 {
 	u32 prev_opcode, prev_reg;
 
-	/*
-	 * Nothing emitted yet? Must check before looking
-	 * at the actual data since i915_gem_object_create_internal()
-	 * does *not* give you zeroed memory!
-	 */
+	/* Nothing emitted yet? */
 	if (dsb->free_pos == 0)
 		return false;
 
-- 
2.56.0

