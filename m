Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C888F8E4A5
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 04:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22510E288;
	Fri, 17 Apr 2026 04:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBfz2NVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47A10E288
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 04:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776398926; x=1807934926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FKqM8jakGvJT3MAiP+GIog7TkHcax3B/Zw0h0o9jllY=;
 b=NBfz2NVdjYZ1JmE8DGjiT79lMe3RarznhLdl3MJOZ1M7cTqj6Hof6Y16
 QoGTctlRqoPhHd0enWBEMIhO/M8Icp8MbfH9udBpJ9PEK4rTGsKHAD3eH
 4t+cAX0ZdRH2WkbmAXVD+7uPI3IrP6H8+iESe/1mr4IzGWfJkbg8xdV4x
 UUXwVWL8CI89DxKjlNhx/PFMAJCOESPQJwkxUMQAwRgg3ZCBQDKG2Cw0V
 OYg3J+joQtkXj7vy6PY0Fn8q/ecSSjpeBQjvbh1Zk+r2DvetMkPJ6+HOc
 b/A0i/rfty2wZ+C+QBf9UD+kEMM8PYVTHm6K9YKMnAwHDqZJYYlvZ1JCp g==;
X-CSE-ConnectionGUID: PGF0B9kDQsCY75nZpY9BxQ==
X-CSE-MsgGUID: vAJrh0uNRAmHhVNMCCnR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77484937"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="77484937"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:08:45 -0700
X-CSE-ConnectionGUID: VfiuaM0qS3SZi5g6BZfQ3w==
X-CSE-MsgGUID: ZbvBfSZ1RumJaC7IfO3nZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230847908"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:08:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Enable energy attributes for CRI
Date: Fri, 17 Apr 2026 09:44:56 +0530
Message-Id: <20260417041456.818668-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Enable HWMON energy attributes for CRI, which are available through MMIO
registers.
Although these attributes can also be accessed via PMT, MMIO is preferred
as it avoids dependency on ocode firmware load in late binding scenario.

v2: Rephrase commit message. (Anshuman)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 4b3c46eb858f..c63b409d7a82 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -27,4 +27,7 @@
 #define   TEMP_SIGN_MASK			REG_BIT(31)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
+#define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0fd4d4f1014a..852681bdb84c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
+		if (xe->info.platform == XE_CRESCENTISLAND) {
+			if (channel == CHANNEL_CARD)
+				return CRI_PLATFORM_ENERGY_STATUS;
+			else if (channel == CHANNEL_PKG)
+				return CRI_PACKAGE_ENERGY_STATUS;
+		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
-- 
2.25.1

