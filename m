Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1A606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyZ6V8hR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55E10E8CC;
	Mon,  9 Nov 2026 21:44:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B9210E8CC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794260664; x=1825796664;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=CVxCaL6vV15nO515Hiew0oDyU6VxuXzIaGKUOD3evZM=;
 b=XyZ6V8hRLrNedtMdYf5S3/GdHQIl/ide5kZjqqGXwPw12FtdA/+nJLWV
 5Mb+7i3HBGD0FvgV40N0gT9ZKzBDcQvLnnDn+9sOP9a6m2hDTIN0R3Pjw
 MNEH7pBfwk9U0eEubAqlpewS7V9TsVaJCuGN1fEwqQnGzccl2vaiy9ql9
 akdcgZWq7LEuhDMytv+4tDRuC5CZcdSyKXfhvmM15bzC3kO15X46lbAZo
 amnkeIwHP+tfIx8oL3zZSOmT0iGyjxcp0cgxiEG7D2CRGoVp0aK9NPqOF
 ayW2KH1uzI9TQvw8ESWArsXT0+rQ4MC2KRlpx3kE6nGNo3lj8rzItWAUy Q==;
X-CSE-ConnectionGUID: 0pMetr1wQ1CyI5sfSQ/fpA==
X-CSE-MsgGUID: M9fzKA0USAyOLlBsYucVsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2895315"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2895315"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 13:44:23 -0800
X-CSE-ConnectionGUID: OmJLsNf3TEunK1Sgu7gbyA==
X-CSE-MsgGUID: 8aGm2g6YSYCPNozWuIoDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9831863"
Received: from arnabgho-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 13:44:22 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Nov 2026 18:44:04 -0300
Subject: [PATCH] drm/xe/xe3p: Interpret resource copy fuse as mask of
 sub-copies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-xe3p-res-copy-fuse-subcopy-v1-1-b00100deb1ff@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBAF0KvIrE2iGoKriEXxMRuaTghp3F1j+
 TYvkiIIlLosUsAlKseeYPKMps3tK1jmZCqLsjamaPmG9RygPB3+4eVUsJ7jj6ZFbSsD66yjFPi
 ARe4/74f3/QDQfHdjbAAAAA==
X-Change-ID: 20261109-xe3p-res-copy-fuse-subcopy-89e6351e3a3a
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

There was a Bspec update to the RESOURCE_COPY_ENABLE register noting
that the fuse value is a bitmask of sub-copies.  Reflect that update
in our driver by updating read_rescopy_fuses() treat any non-zero
value as an indication that the resource copy is present.

Bspec: 74623
Fixes: dd7707871f1e ("drm/xe/xe3p: Read resource copy presence from fuse register")
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 55ee0c892c1e..e2caa7d88eb4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -892,12 +892,12 @@ static u32 read_rescopy_fuses(struct xe_gt *gt)
 				 xe_mmio_read32(&gt->mmio, RESOURCE_COPY_ENABLE));
 
 	/*
-	 * Although the register field is 16-bits wide, we don't expect to ever
-	 * see more than one resource copy engine (BCS0 in bit 0) enabled.
+	 * There is only one resource copy and each bit in the mask
+	 * represents a sub-copy.  We detect the presence of the
+	 * resource copy engine by checking that at least one sub-copy
+	 * is present.
 	 */
-	xe_gt_WARN(gt, fuse & GENMASK(15, 1), "Unexpected resource copy fuse (%#x)\n", fuse);
-
-	return fuse & BIT(0);
+	return fuse ? 0x1 : 0x0;
 }
 
 static void read_copy_fuses(struct xe_gt *gt)

---
base-commit: d72707a042b6aff601449a9cf87e5fe55decbc5c
change-id: 20261109-xe3p-res-copy-fuse-subcopy-89e6351e3a3a

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

