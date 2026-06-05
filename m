Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31ACD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26FB11A65C;
	Fri,  5 Jun 2026 09:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0E7BbdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4911A65C
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652010; x=1812188010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bB4nzldaagWFIfB2FYS/ygSL1XfYH/N7dO0XoA23Ae0=;
 b=e0E7BbdUJgkMLKvzKdRdKvdCpvJB1hY7YeiBRQy1Fkhp80CqEfVARVzY
 kMvyGyBBITIAFCzwCXK2UuFqXhGaDdbnN4SF3aw2smi/Z+TsUczibvL6T
 T2mtPdg1UlzldeB/UjNu7GLle8k9r1DCCOFkR7cIefNZLDfAWj3eW08Bv
 572pCgEzNSi0TyOFH4qvW/qJObyDsFN+jY8+Zi/8+dJiqIAD0IHKMiNKJ
 7hxitDj6BGsKGg08cmiwrOTuX44ToQuNin/5l1yw3AvZ6aDw+bT0h94Bu
 E0i5Bhvi0B2R5urGEKhk70SKU+KXXwP4G/rEhze3Ttu8YNvPqLYUkmjBw Q==;
X-CSE-ConnectionGUID: T7GFKLngRmCILA1dEMATmg==
X-CSE-MsgGUID: wXKZeJU7RKmnrmquDuwmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106927791"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106927791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:33:29 -0700
X-CSE-ConnectionGUID: DHIL3OEyRE20QZ2iuwZ1Bg==
X-CSE-MsgGUID: nnC1DOc3Taqpsz+QTInb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="238444485"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:33:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Violet Monti <violet.monti@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] drm/xe/rtp: Fix build error with clang < 21 and non-const
 initializers
Date: Fri,  5 Jun 2026 11:33:05 +0200
Message-ID: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Clang < 21 treats const-qualified compound literals at function scope as
having static storage duration, which requires all initializer elements
to be compile-time constants.  When xe_hw_engine.c initializes a local
struct xe_rtp_table_sr using XE_RTP_TABLE_SR(), the compound literals in
XE_RTP_TABLE_SR end up containing runtime values (e.g. blit_cctl_val
derived from gt->mocs.uc_index), triggering:

  xe_hw_engine.c:361: error: initializer element is not a compile-time constant
  xe_hw_engine.c:416: error: initializer element is not a compile-time constant

ARRAY_SIZE() cannot be used as a replacement because it expands through
__must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert inside
sizeof(struct{}), which clang < 21 also rejects in the same context.

Replace ARRAY_SIZE() with an open-coded sizeof(arr)/sizeof(elem) in
XE_RTP_TABLE_SR and XE_RTP_TABLE to avoid both issues.

Fixes: 5ff004fdc737 ("drm/xe/rtp: Add struct types for RTP tables")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Violet Monti <violet.monti@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/intel-xe/bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk/
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4e3cfd69f922..2cc65053cd07 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -461,14 +461,22 @@ struct xe_reg_sr;
 		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
 	}
 
+/*
+ * Note: ARRAY_SIZE() cannot be used here because it expands through
+ * __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert inside
+ * sizeof(struct{}), which clang < 21 rejects when the compound literal
+ * contains non-compile-time-constant initializers.
+ */
 #define XE_RTP_TABLE_SR(...) { \
 	.entries = (const struct xe_rtp_entry_sr[]){__VA_ARGS__}, \
-	.n_entries = ARRAY_SIZE(((const struct xe_rtp_entry_sr[]){__VA_ARGS__})), \
+	.n_entries = sizeof((const struct xe_rtp_entry_sr[]){__VA_ARGS__}) / \
+		sizeof(struct xe_rtp_entry_sr), \
 }
 
 #define XE_RTP_TABLE(...) { \
 	.entries = (const struct xe_rtp_entry[]){__VA_ARGS__}, \
-	.n_entries = ARRAY_SIZE(((const struct xe_rtp_entry[]){__VA_ARGS__})), \
+	.n_entries = sizeof((const struct xe_rtp_entry[]){__VA_ARGS__}) / \
+		sizeof(struct xe_rtp_entry), \
 }
 
 #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
-- 
2.54.0

