Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE3C83F17
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 17:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFAB10E187;
	Sun, 13 Jul 2025 17:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T30GF6Jx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AEE10E189
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752427800; x=1783963800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UZEc7KMQr4+raGRxI4whkTfySiQtshzSm8BmEXVx21A=;
 b=T30GF6Jx+pHipPfvfiQUKCJjosPVTf/zpxv8Ym3koy7+fpxfTzV6Jhiu
 w1iQ8Mu0KbbhW5HwVZuQFI8BcFUiYHKTLEKx0n3Cyh34dp19N26itLZVi
 3ZsXNndxejYBBgefZ6TVGG5j9TD1Roh7bUoegq5Oy0x3RxepSfLzTjbbj
 1syByxrLq887uLwn41TPPqZnqgzlgyt00BOkM0/DNcWJxi/28Bve1pPbt
 w8d0ktmcI8ZCZwvsGL/l3mb21A91rIwTAL1JWSrLmSxiqwAy0QJpet020
 YdFLFEDLUc8irHLqkxg2BY7KTnm0QPfjZuPIZ84UL26gPNBOf0Gk7iNrt A==;
X-CSE-ConnectionGUID: WwfyXVMxT0+dxMFsZr7hBQ==
X-CSE-MsgGUID: +t4L11aOTame2z7WTvVMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334123"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="65334123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:30:00 -0700
X-CSE-ConnectionGUID: uOXBZ4GOSde6v0NNPblWjg==
X-CSE-MsgGUID: WRgtExz7QHKGoXEzkt3FNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="161069196"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.19])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:29:59 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 03/13] drm/xe: Correct BMG VSEC header sizing
Date: Sun, 13 Jul 2025 13:29:33 -0400
Message-ID: <20250713172943.7335-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
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

The intel_vsec_header information for the crashlog feature is
incorrect.

Update the VSEC header with correct sizing and count.

Since the crashlog entries are "merged" (num_entries = 2), the
separate capabilities entries must be merged as well.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index d279e0ace7d7..8f23a27871b6 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -33,30 +33,19 @@ static struct intel_vsec_header bmg_telemetry = {
 	.offset = BMG_DISCOVERY_OFFSET,
 };
 
-static struct intel_vsec_header bmg_punit_crashlog = {
+static struct intel_vsec_header bmg_crashlog = {
 	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
+	.num_entries = 2,
+	.entry_size = 6,
 	.tbir = 0,
 	.offset = BMG_DISCOVERY_OFFSET + 0x60,
 };
 
-static struct intel_vsec_header bmg_oobmsm_crashlog = {
-	.rev = 1,
-	.length = 0x10,
-	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
-	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x78,
-};
-
 static struct intel_vsec_header *bmg_capabilities[] = {
 	&bmg_telemetry,
-	&bmg_punit_crashlog,
-	&bmg_oobmsm_crashlog,
+	&bmg_crashlog,
 	NULL
 };
 
-- 
2.50.0

