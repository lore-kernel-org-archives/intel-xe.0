Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B0606A84C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZitszokK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81410FF82;
	Wed,  4 Nov 2026 22:19:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A0110FF66;
 Wed,  4 Nov 2026 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830769; x=1825366769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JsXPzuqeLZrUiiWs3lmfDuuAo9I2CGDmeJ0W/Gy+Hmg=;
 b=ZitszokK7EDrf+R33/PsET5oLVmkHdxoyTWlxwYZHMdiazFNDHklJbs/
 KiKNCxDM+RVqJ1w3QRN2XQgzqz/5Q6Mn8YpXCvvANszpdF5mipZa1VB04
 VqJE8UCOjOwuGVh5D4Ta1n4nofUlowxYoCESkCXI9lMtlFkYkffX59UjO
 DXlY2MNrGOD1y6e38swNTf8QZIzBLpPQFMb90qL1OrSuwnbqVvBtHYpEx
 xokL1DOqwjCL4eWTt+fNWlOKsFMgr8D5zV/+hhEEGJr6FYxV1JegNqLgm
 m+/NGR9BZqhAG8fG0ATMD1EiUO75XW3eC/SFN7tCauRWsVwfHE+V0bBZ7 Q==;
X-CSE-ConnectionGUID: 2JR9v0U8SgyhwvQcG3/ZGQ==
X-CSE-MsgGUID: oWWAw04bRg2HQS1vYL8nDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2636977"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2636977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:28 -0800
X-CSE-ConnectionGUID: Y1nqeMWNRsaVSU1ejk35rw==
X-CSE-MsgGUID: 9tm5xSQuSNK25rNUwDxFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6947786"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:27 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/xe: Nuke the intel_uncore_{read,write}() wrappers
Date: Thu,  5 Nov 2026 00:18:42 +0200
Message-ID: <20261104221842.18799-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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

intel_uncore_{read,write}() are no longer needed by the
display code. Remove them.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 2f198e2e2fec..238addc1e5fc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -23,14 +23,6 @@ static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncor
 	return xe_root_tile_mmio(xe);
 }
 
-static inline u32 intel_uncore_read(struct intel_uncore *uncore,
-				    i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
-}
-
 static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
 				    i915_reg_t i915_reg)
 {
@@ -55,14 +47,6 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
 }
 
-static inline void intel_uncore_write(struct intel_uncore *uncore,
-				      i915_reg_t i915_reg, u32 val)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
-}
-
 static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
 				       i915_reg_t i915_reg)
 {
-- 
2.56.0

