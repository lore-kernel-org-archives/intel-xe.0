Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31A7C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A410E0E7;
	Thu, 26 Jun 2025 20:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdUmKFtg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716A10E0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971393; x=1782507393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rp2Tc3aid/+LmMMnmYWXdALrwgHE3ujocfYTl/CZa2U=;
 b=kdUmKFtgYZ6nOKt7v6hzy/qkvHMwIeBAYiuiAVi0ph8iv2dHUDFlGMIe
 t9e+yrTu+ZfritHQMhIS7OaXEz7vRnWOwUxff5D/Ivu1U7srMDgMoVxOo
 mwSALj33Oy9PPZLgFU+wvSxinSNu4eKJVRaZbgoim9CXqlvAwGVJhMbds
 LjXc20FGGs8dcwTGMnr1y7AugC5Tykb5/zu/u1pz8XV4/4Fo4oaR27qvi
 wctZf9GNzozJKBEu0cBuskdqSa7ztMgTcXUnwBc/+ltF07VeCW/PtVdiB
 5RqeODOe+zuQtC98PW/MmprLBvOmNH4MEliSFnp/Q1+XsIFi/S65se4Vn Q==;
X-CSE-ConnectionGUID: JW4scsHLQZacoKCB2sPXJQ==
X-CSE-MsgGUID: 32vg0FSeSUmS7gN0utEbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53360373"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53360373"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:33 -0700
X-CSE-ConnectionGUID: rnnavO8MSimI4mMOXqGVYg==
X-CSE-MsgGUID: NBISMPihSsSaf4ECw5DgJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157003206"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] FOR_CI: pcode-fix
Date: Thu, 26 Jun 2025 13:56:18 -0700
Message-ID: <20250626-xe-kunit-v1-1-2440e6d9a4b5@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
References: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

Just to test/validate second patch. The solution is being discussed
at https://lore.kernel.org/intel-xe/gbisrh7ep2gn2fxv7xz4g4sy75qjpmcr5yqdx5atlab2oxevlx@j3zwx3k4o4x4/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 87323ad0cbbb2..08aee78ff08ed 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -337,7 +337,10 @@ int xe_pcode_probe_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 
-/* Helpers with drm device */
+
+/* Helpers with drm device. These should only be called by the display side */
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+
 int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
 {
 	struct xe_device *xe = to_xe_device(drm);
@@ -362,3 +365,5 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
 
 	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
 }
+
+#endif

-- 
2.49.0

