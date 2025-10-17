Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F12CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451910E0F6;
	Fri, 17 Oct 2025 02:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVv+Z0uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5AF10EAE9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h1PwM2UkwzWuO6rZm4q0Ad0QwBcY9TpUNQ0Pw5A6mW8=;
 b=OVv+Z0ukCpvzVTPz9Hy5h2+aCHyDQx0F/+6eOuuJfa9OfuYN/YO6G2cR
 AYPJdqFUCAQzn+3c3P4IS9V7vCVOy6nukLAyfv5aepzc29j2Yo3Q5pBpJ
 Qp3HofiU/ZK/NC+1NJH2hHIt+eFkr91IDZDRIeuB5hJmLQ5psPFeaYDv7
 c58GGq4HP/8KF6r7ZaFyUkNp+HmPlwGDHq6G4eFdQ4UjbHgEFCssxxulD
 oc4RUoy8vKfIR0dYkZKqp0mkAznkuhtRiF3pFNtj9oye/Mfi09MhSNjNP
 fJdbW9alaWUxcX/lla7FSI2egFvS2KhRioq2SN/kGL+fZOkkUYPMQNOiA g==;
X-CSE-ConnectionGUID: FrA5aebXTUeuOzf+AE5OBw==
X-CSE-MsgGUID: DSrfbRn4TL+YOCRsaINHSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739218"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739218"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:18 -0700
X-CSE-ConnectionGUID: psYCx/DHTGOXgC8IWVVANg==
X-CSE-MsgGUID: GMmURiyzT5yVjskDJJhU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089202"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH v3 15/24] drm/xe/xe3p_xpc: Add L3 bank mask
Date: Thu, 16 Oct 2025 19:26:34 -0700
Message-ID: <20251016-xe3p-v3-15-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Fei Yang <fei.yang@intel.com>

Expose L3 bank mask through topology query interface.

In Xe3p_XPC, MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not
just a per-node mask), and each bit represents a single bank. With that
there's no extra complexity to calculate the L3 bank mask like there was
in previous platforms.

Bspec: 73439
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Better commit message (Matt Roper)
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 80ef3a6e0a3b5..14af073783ad3 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	if (!xe_gt_topology_report_l3(gt))
 		return;
 
-	if (GRAPHICS_VER(xe) >= 30) {
+	if (GRAPHICS_VERx100(xe) == 3511) {
+		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
+
+		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
+	} else if (GRAPHICS_VER(xe) >= 30) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
 		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);

-- 
2.51.0

