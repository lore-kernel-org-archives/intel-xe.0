Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4E3CA0FE1
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 10:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BA110E36D;
	Mon, 25 Aug 2025 10:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNfcwvCI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49910E36D
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756116587; x=1787652587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z9hoOA8+LgyytoB5Xzi0U14E7WbMFqj8mMMKf84JEnA=;
 b=iNfcwvCIYfqQkQXu+IYOL+CBbWTi0MjQFk0koAy5tS9DAGaMactp8BPI
 iPqNQNrTCGhVIngDmH34kaDrg/Km5+IqRq06OgNhK491yVWOr7Ee8gnKk
 ftOYAkYZv9EdVC6n742VmkpXKw+OBd4jh6+sLa0Lr5uoRGgJwxeuBcBbx
 8XTM7MAo8xUHoqnOMTEn9O8z2gk9rlgQW5JVcWltLwUv44Uf9cDuvFlv7
 r4muWnROfVijgoC0T9KEjQAJOOrDRp6YcgIb/Ap9JVm8iXFxNRKzKcT88
 CgJmRIylz/ZOldmzzcQIW3EmRB6muUChkcQ5tMh9CefhN/qrmgG7gwBmQ g==;
X-CSE-ConnectionGUID: TCDMn4xQQvqHKiq2Hx3CdA==
X-CSE-MsgGUID: 8E9/MjGmQ3G0zW9N5/apzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="62139322"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62139322"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:09:47 -0700
X-CSE-ConnectionGUID: kshhhrA+Qp2kx3jjV14btQ==
X-CSE-MsgGUID: rVdvghGfSfSZV4mJRjQgSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168467603"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:09:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] drm/xe/nvm: Use root tile mmio
Date: Mon, 25 Aug 2025 16:05:37 +0530
Message-ID: <20250825103537.2551837-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

To allow initialization of nvm during early probe for future usecases,
use root tile instead of root gt to access mmios, as gt is not 
yet initialized at early probe.

v2: fix commit message (Lucas)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 61b0a1531a53..9ca4a5ae1693 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -39,17 +39,17 @@ static void xe_nvm_release_dev(struct device *dev)
 
 static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	if (xe->info.platform != XE_BATTLEMAGE)
 		return false;
-	return !(xe_mmio_read32(&gt->mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
+	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
 		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
 }
 
 static bool xe_nvm_writable_override(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	bool writable_override;
 	resource_size_t base;
 
@@ -72,7 +72,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 	}
 
 	writable_override =
-		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		!(xe_mmio_read32(mmio, HECI_FWSTS2(base)) &
 		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
 	if (writable_override)
 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
-- 
2.47.1

