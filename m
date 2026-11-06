Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E0606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvmYQ9su
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B43110E44F;
	Fri,  6 Nov 2026 19:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863D10E44F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 19:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793993603; x=1825529603;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=zG+JpnjeX/CXGtTBuaZAif9JldExIGnzA9un3cMYcHY=;
 b=YvmYQ9suQEW4IgeiyeDbLPSapAzWZGVWUkGjGf90uXFmzhnAKLetOWEy
 5Qon2VHAGR0QPSBGGaNdf6AHvTQzwHJyuUU/lB2gLZ0xVDAnavIscrnaX
 m99zJDDYpNGqSsrgfM5jjNHoNgq+H/QhYAhVzRMrNFgoyVVsuQYiVd2SZ
 W+UI9l2MBmp77XCkOgaLuFC9FAQTnK5sa+j0j+3d4soH5hL5gQ/haUPeG
 TadnHPDkT+d+X3+KCvWHckiREO9s7VLgwjW4hfO0p/XhNYCfBa/0Vf6To
 l11nF3TjdYvNjN5SU7udzNGzgm+dvwXTtZ9SFvsmY/NuQhYa/8XSSPAlF A==;
X-CSE-ConnectionGUID: DMUERX9rQT2D7hBKq9A2eg==
X-CSE-MsgGUID: pjIVMOa1QluZHBym3TS+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2713433"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2713433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:33:22 -0800
X-CSE-ConnectionGUID: Ny4ivaxiTDOuaOo3ChyHqQ==
X-CSE-MsgGUID: 2igdYxeLSlCwpyB1vY/2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7222403"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:33:22 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Nov 2026 16:32:35 -0300
Subject: [PATCH] drm/xe/xe3p: Bump offset for PPHWSP software scratch area
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB0wKoK9Sukixl8zi9ohU21Av
 HuDy2/x3kmGJDB6VCclHGLy2QpcXVGIflvBMhdT27SDc83AGZ3ytL+VVePPlC0k/w2Rp4Bx7Bw
 8+plKrgmL5Hv9fF3XH7cJAI5qAAAA
X-Change-ID: 20261106-xe3p-bump-pphwsp-scratch-bce9931eae4d
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Xe3p_LPG version 35.10 B0-step adds a new feature that allows
64-bit token for semaphore wait/signal commands.  With that, the
PPHWSP layout was modified to store extra information associated with
the new feature on a region that was previously considered part of the
scratch area of the PPHWSP.  Previously the sw scratch area started at
dword #34, and now that base has been pushed to dword #36.

It appears the value for LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR was meant
to point at the beginning of the sw scratch space, but, because the
hex 0x34 was used in the calculation instead of decimal 34, value is
actually pointing a little further.  As such, we accidentally
"future-proofed" our driver with respect to the layout changes
discussed earlier.

Now let's make this future-proofing intentional and use a buffer area
a bit bigger to allow future hardware extensions not to impact the
driver code for some time.  Use dword 128 as the base for the area
that is going to be used by the driver as scratch space.

Bspec: 60424
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index f2e829e62168..77949593562c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -51,8 +51,23 @@ struct xe_lrc_snapshot {
 	u32 ctx_job_timestamp;
 };
 
-#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
-#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
+/*
+ * The PPHWSP software scratch area starts at different locations
+ * depending on the IP:
+ *
+ *  - Before graphics version 35.10 B0-step: dword #34.
+ *  - Starting with graphics version 35.10 B0: dword #36.
+ *
+ * For our driver usage, we use a custom base that fits all supported
+ * IPs and adds some extra buffer in case future hardware updates end
+ * up reserving extra dwords and further pushing the base of the
+ * scratch area.
+ */
+#define LRC_PPHWSP_SCRATCH_BASE			(128 * 4)
+#define LRC_PPHWSP_SCRATCH_DW(idx)		(LRC_PPHWSP_SCRATCH_BASE + (idx) * 4)
+
+#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(0)
+#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(12)
 
 #define LRC_WA_BB_SIZE SZ_4K
 

---
base-commit: e96f23b42352b7b9fea6bf92bceed052533fb98e
change-id: 20261106-xe3p-bump-pphwsp-scratch-bce9931eae4d

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

