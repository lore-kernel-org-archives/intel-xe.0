Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A6BC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 20:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC4810E1DE;
	Tue, 19 Dec 2023 20:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DBF10E1DE
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703016046; x=1734552046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HnjJrt4UMYmBqu9REwevon0OHz9vJ3/y45zLrQz9m3s=;
 b=HzpUXevAZlEk+N7+WfempQGkOKwKznVHt6ZgwEbPhNxvxK3+fGp1p2KH
 5pxCMjWnPeJS/GdthYAJYY1Gqpx0qclWbMtABrEfQ2jmZYQN9fpnFWQZ4
 g/TywmhsMehD4aq6e/13IHWvgxoa7JJNMEnzQQ4TJvc2EqmqVADifM4MM
 9uX/J61T25vMsmkyKEaikmWNd1sW7YMQT3lU3C6atSwWmjF6X9o/1+enX
 A4b0JUxQVTQ/rB8sb41AL6+6ZdDPVDBd+79vMZkUCI2FXR17CZCD6JL72
 7M9es8dWtyVmHkADYtCYKmLDF5W2GHILxQlp0CdhmyPGkS0vQzg0MYgd4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380695042"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="380695042"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="779589313"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="779589313"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 12:00:45 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/xe: Remove ci-only GuC FW definitions
Date: Tue, 19 Dec 2023 12:00:20 -0800
Message-ID: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As part of the FW definitions, we declare each blob as required via the
MODULE_FIRMWARE() macro. This causes the initramfs update (or equivalent
process) to look for the blobs on disk when the kernel is installed;
therefore, we need to make sure that all FWs we define are available in
linux-firmware.

We currently don't plan to push the PVC blob to linux-firmware, while the
LNL one will only be pushed once we have machines in CI to test it, so we
need to remove them from the list for now.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

This patch is intended to be added to the PR sent for drm-next, with the
FW definitions being added to topic/core-for-CI afterwards by the other
patches in this series.

Note that this patch remove the last uses of the mmp FWs, but the
support for those has been left in because we do plan to use mmp tags
for early FW drops in the CI branch.

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 73d6938c921d..9dff96dfe455 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -102,9 +102,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.43.0

