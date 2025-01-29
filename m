Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1C4C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 09:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85C610E782;
	Wed, 29 Jan 2025 09:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6AJegkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694AC10E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738144617; x=1769680617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P67szmXY2jnNRSeQF/jl7EueDYJcGjb3XMkSMj+vxCo=;
 b=d6AJegkhC6UD+Baaul+AzqQNuHBXC+Td5Lvsf1xAJsSv6L2MX0yYNAHx
 y4dSUzWVXMZzIxxggawS/FbHC9vxlb8ufqXnWkjCLyqi/bMmk7hW71Sld
 5dICGnlRrI/EgqJX4+wzQQ/Dcen7jpAyQ+PqAnfCM02lroR0ST7nNHZUL
 IkCgRc91SgnW2fuZnETX+TMeGEgkQzgfv9QBjKrM7xJSEne9uzzJxZpEm
 ObnlzkV+Pt7fCq24fY7eVBVYsZO4pzR5/58aPoedgkwRy3vG73b0mid0b
 Z/OJaQw+aA+U/ZJfCCCfKKdgT2rsdgghYdKw602o+pxKRkJHzmlrK8gZh g==;
X-CSE-ConnectionGUID: NdZyUDKtS6W/AqTtWCx17g==
X-CSE-MsgGUID: 4Ww8IfpJR5y3UUcTvCy5dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42579539"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="42579539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:49 -0800
X-CSE-ConnectionGUID: +RZ8i+6/TgSGuBux49fIFg==
X-CSE-MsgGUID: Do6joQYCRXmf4AqaXWeUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108958311"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 8/8] drm/xe/pf: Enable per-function per-engine-class
 activity stats
Date: Wed, 29 Jan 2025 15:46:51 +0530
Message-ID: <20250129101653.1976699-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
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

Enable per-function per-engine-class activity stats when
sriov_numvfs are set and disable when sriov_numvfs
are set to 0.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..fd0c1284deff 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -7,6 +7,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -62,6 +63,18 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static int pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret = 0;
+
+	for_each_gt(gt, xe, id)
+		ret  = xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
+
+	return ret;
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -94,6 +107,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
+
+	err = pf_engine_activity_stats(xe, num_vfs, true);
+	if (err < 0)
+		xe_sriov_warn(xe, "Failed to enable function activity stats\n");
+
 	return num_vfs;
 
 failed:
@@ -110,6 +128,7 @@ static int pf_disable_vfs(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	u16 num_vfs = pci_num_vf(pdev);
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
@@ -117,6 +136,10 @@ static int pf_disable_vfs(struct xe_device *xe)
 	if (!num_vfs)
 		return 0;
 
+	err = pf_engine_activity_stats(xe, num_vfs, false);
+	if (err < 0)
+		xe_sriov_warn(xe, "Failed to disable function activity stats\n");
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.47.1

