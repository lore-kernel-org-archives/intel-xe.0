Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91640C25B4F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 16:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61110F1B0;
	Tue,  7 May 2024 16:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt9Yd1sS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFB10F1B0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715101097; x=1746637097;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A/GYe45eBy3tmZzlMOqeUqbn6GJW+2XSge8Wyfp1nxc=;
 b=dt9Yd1sSPjK/lyOaTO+2QbsOZyJyvkp5Pdby4egMzLT9ALmqN7uSJGLq
 SgZr532IhebMp7RIFWFO3WRLF/d7OvFCXxsMa0942s7xAjuIo6Rb2OFoT
 xNJPedWceq3X6bnQNoYpTc5/EknrsBMmvzVnHVXz1VPYOUni5AG3XMxe9
 gXwuJHZGoIvSNHpWP1pOpEnItIBhCmRV/RYrFmx9vV0wuqkab9xF2mzTa
 H9mrBdlrOOfJAieqRySH0g7GxgBOkT+A5RuWiIuSLL6ic/SEuT8LQWs3f
 ZZqEmcE94nCpelvlHNJO6zue5naYfd5uXwVADv92o+GD/JJZ2XnIQFdpe w==;
X-CSE-ConnectionGUID: +vHzC9zIQ3O9rLxPLTq54Q==
X-CSE-MsgGUID: OSbPawxBSp+j2SMpGGg5NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28390439"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="28390439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 09:58:16 -0700
X-CSE-ConnectionGUID: m0H7IiOtScSzWSJX3MZT6Q==
X-CSE-MsgGUID: tHDxOiWySGK9jaUBsRyLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="28677835"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 09:58:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/pf: Don't advertise support to enable VFs if not ready
Date: Tue,  7 May 2024 18:57:57 +0200
Message-Id: <20240507165757.2835-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Even if we have not enabled SR-IOV support using the platform
specific has_sriov flag, the hardware may still report SR-IOV
capability and the PCI layer may wrongly advertise driver support
to enable VFs.  Explicitly reset the number of supported VFs to
zero to avoid confusion.

Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
prior to enabling VFs using the sriov_numvfs to check if such an
operation is possible.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 1c3fa84b6adb..a274a5fb1401 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -53,6 +53,7 @@ static bool test_is_vf(struct xe_device *xe)
  */
 void xe_sriov_probe_early(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
 	bool has_sriov = xe->info.has_sriov;
 
@@ -61,6 +62,16 @@ void xe_sriov_probe_early(struct xe_device *xe)
 			mode = XE_SRIOV_MODE_VF;
 		else if (xe_sriov_pf_readiness(xe))
 			mode = XE_SRIOV_MODE_PF;
+	} else if (pci_sriov_get_totalvfs(pdev)) {
+		/*
+		 * Even if we have not enabled SR-IOV support using the
+		 * platform specific has_sriov flag, the hardware may still
+		 * report SR-IOV capability and the PCI layer may wrongly
+		 * advertise driver support to enable VFs. Explicitly reset
+		 * the number of supported VFs to zero to avoid confusion.
+		 */
+		drm_info(&xe->drm, "Support for SR-IOV is not available\n");
+		pci_sriov_set_totalvfs(pdev, 0);
 	}
 
 	xe_assert(xe, !xe->sriov.__mode);
-- 
2.43.0

