Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7567CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F0210E539;
	Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRItv9bb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6A510E539
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781563352; x=1813099352;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sONpHNAiQ+5Ni0NwVZHxFfQgbbfsxb/L3aThoTsq6cQ=;
 b=jRItv9bbFm8IZrZfY3pfCfWNY9IlyChC+giAiTN15L2ukMUcoAZ1iJtr
 vvIUroH4GQufP1iLFGbWgI350gsgoEwDTBQMltP5FTpbtKt/Kia0IgIJ8
 Zl1SFI120HkMCypxNfTqf/Dz4tlctIb/ef2DxGUT7hxr4vzPq3a3ODiBZ
 9zqQoTUaePK+OLB4WfH4B9e0Y1hJLuNYezbeKj0NPLNz4N2Fz4j/LQ21J
 EBGzBg/H9kFjd5UEDN+ObCZv8fNjPFXIVxCaucC5jyPULdb7HSKgHNYuX
 Amz0CMmxeKS+JoTWZWPZpupmMyUZ+PZOUEVPEB8zTbBGB5IZZTVACtsoF g==;
X-CSE-ConnectionGUID: ukbaLer3SYuykBzmFV0CUw==
X-CSE-MsgGUID: GD+QrrITSTqsIQMmgxCljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82513152"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82513152"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:32 -0700
X-CSE-ConnectionGUID: jsCHXbCxSWmdIKz7ecc/uA==
X-CSE-MsgGUID: 2j20+7YjRX2/ZCzBrO1Fqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247676798"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:31 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Date: Mon, 15 Jun 2026 15:42:19 -0700
Message-ID: <20260615224227.34880-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224227.34880-1-ashutosh.dixit@intel.com>
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
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

Unconditionally whitelisting OA registers is a security violation. Set
RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
don't get whitelisted by default after probe, gt reset, resume and engine
reset.

v2: Add WHITELIST_DENY macro
    Reword commit message (Umesh)

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 2e84b1c49f374..2d8ddb57412c2 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -104,10 +104,12 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
+#define WHITELIST_DENY(r, f) WHITELIST(r, (f) | RING_FORCE_TO_NONPRIV_DENY)
+
 #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST_DENY(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+	WHITELIST_DENY(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
+	WHITELIST_DENY(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
-- 
2.54.0

