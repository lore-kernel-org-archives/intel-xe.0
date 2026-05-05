Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDBCCD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 07:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74B810E00F;
	Tue,  5 May 2026 07:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9a1SePI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6936A10E00F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777967037; x=1809503037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+bZK6xBWZzTVKlwXuLByUaVRkufp7RhILxdmXYxtFPs=;
 b=P9a1SePIKm1M2mm3rYMvzNiRW7RmuKOL0rVTqqL70JzhicQ8HUBIiJti
 s5RGWpVbnbeIamytpvmgOYjyDIEykRiCm7Ho0113y6bBeoU78GIBT5syH
 PDioaoHPVaGVZZ2YvgkX26aFocBR03SicIs683ZXtvMRpmSaT3AcDWKUF
 k6IL1eSMCO0kAV/zwHkUEoPIXz7mbxjXyjOjYrvInjp+VXcdgRKpIazZJ
 71sgef2JdQTZM2whsTHLd3OmUBXlmHUP1B00i0UqT61lD+Yju2NlwkpSI
 Iy4U5DEXzD1U1XuNaOz91NIV7HddqSWZediU5Dh5GZzkK0b8SOtQwKBbb g==;
X-CSE-ConnectionGUID: x5xiivTsTeOURis4Qmg4ag==
X-CSE-MsgGUID: BFMZogQRTBOks9EYaF+74A==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82698640"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="82698640"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:43:56 -0700
X-CSE-ConnectionGUID: 4u316fJqRxmbp/0VcBu3xA==
X-CSE-MsgGUID: 54lkNS2ORC+h7yJzi7S5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="235995383"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:43:55 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/cri: Add new PCI IDs
Date: Tue,  5 May 2026 13:18:56 +0530
Message-ID: <20260505074855.3813063-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for new CRI PCI IDs.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 include/drm/intel/pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 33b91cb2e684..e32ef763427c 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -898,7 +898,11 @@
 
 /* CRI */
 #define INTEL_CRI_IDS(MACRO__, ...) \
-	MACRO__(0x674C, ## __VA_ARGS__)
+	MACRO__(0x674C, ## __VA_ARGS__), \
+	MACRO__(0x674D, ## __VA_ARGS__), \
+	MACRO__(0x674E, ## __VA_ARGS__), \
+	MACRO__(0x674F, ## __VA_ARGS__), \
+	MACRO__(0x6750, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.43.0

