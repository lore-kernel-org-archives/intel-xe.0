Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B260A2602
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TCubH+wV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933188284;
	Mon, 26 Oct 2026 22:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8CE88284
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 22:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793052485; x=1824588485;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Atff9Cqtnr4kGnQkn/Xu3gDtsOA0Q6ZlwJ3INtdqUg4=;
 b=TCubH+wViDnWdOh5Bc6qnyb5ASGNSjQb6/f7pRFr0dSRclOmWpUL0Eai
 b7SpykjtPqxqYpJanlz+1IPpwTbApdzzSzXxI0P8mTBds5o/A2mZCnAIR
 Ru5986EnN7obyX4/gwLrLCudAZxolGFX5XETHixEzNgzI8YXDccsZnVRI
 3LxPksI8b1sjtiNKsGah1ns8zJQItCQnNCq9p4gng/hin+Ms57aaaojSt
 x1EpLhG/8dwtG5rlEoi1mKN/Zl75ePrWe8jZ2+EuacHFXbynUeq8HZ2Ek
 zQ/nAO8BgVBQqn6zwEP0+C8hYwtEckrUvUFsXmmRyksIEXcBEPOPA8IxS Q==;
X-CSE-ConnectionGUID: PwS1/pJZSDy/Y+65yRaZBg==
X-CSE-MsgGUID: J0hot0GSTn6VJutbt/Gp1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1613818"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1613818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:04 -0700
X-CSE-ConnectionGUID: aiKxGoOERtWTOrvrihBj9w==
X-CSE-MsgGUID: o8nPdZwHQSSgqt7kMN9t9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4336202"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:03 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 26 Oct 2026 19:06:47 -0300
Subject: [PATCH v4 1/3] drm/xe: Extract override_has_cached_pt()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wa_14026539277-v4-1-54e40d3e92aa@intel.com>
References: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
In-Reply-To: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.15-dev
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some platforms support cached page tables, but some workarounds might
require disabling the cached access on the CPU side.  One such example
is Wa_16029380221, but there could be others as well.  Extract the
code responsible for overriding xe->info.has_cached_pt into a new
function called override_has_cached_pt(), so that we have a common
place to add the necessary runtime checks specific for has_cached_pt.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a07655b4c7a9..4e9598791279 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -769,6 +769,21 @@ int xe_device_probe_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 
+static void override_has_cached_pt(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	/*
+	 * Wa_16029380221: The affected GT will always use non-coherent
+	 * access to page tables, so we must do uncached writes from the
+	 * CPU.
+	 */
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 16029380221))
+			xe->info.has_cached_pt = false;
+}
+
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -911,14 +926,7 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	/*
-	 * Wa_16029380221: The affected GT will always use non-coherent
-	 * access to page tables, so we must do uncached writes from the
-	 * CPU.
-	 */
-	for_each_gt(gt, xe, id)
-		if (XE_GT_WA(gt, 16029380221))
-			xe->info.has_cached_pt = false;
+	override_has_cached_pt(xe);
 
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);

-- 
2.56.0

