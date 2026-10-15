Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B6BCCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 20:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A1A10E84F;
	Thu, 15 Oct 2026 20:46:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCD810E84F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792097162; x=1823633162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zz7f1wxGnWD7WQzVBz6cqgbHWShEQMiHHnqHRdPWg0=;
 b=IYqPh0b5hyLZayyw89mmHYosgAHL86PBUED8CRzQ9JDeehrF0HgPJVEt
 UiEjQ5zdmFhdyGpxgrzPAzFsqEyqvE95mBGroT0GfeWU4SCYSRRRcbIyf
 alPqDMCLRiTQ/CM2YRwDaKHzdgiCrtMlMsMEkiY9zsMnbcSP7O/BBZdD6
 c4I6qejG0gciQGLAfIr1BvQM4H1NXO44SUsEXtlDvTV7YOKFwaKwVjYNK
 fPlVQBtNv9HbeAO5hjRYvuzx7ehxi6y2WVzlPf7dW808BXGDmlANTmByi
 ZHPvasahz33A02m8FW2kcyIAILbmZiGeGPtgteo3KZ+Q1G1owjMdXnmsA Q==;
X-CSE-ConnectionGUID: KMGgAUsHSgKksZCzdVWPkg==
X-CSE-MsgGUID: oetDBFjXSmezImchsyvZ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="760934"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="760934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:46:02 -0700
X-CSE-ConnectionGUID: P+8xmSOHS9GXy7OabNp7bw==
X-CSE-MsgGUID: f9BaonFEStG6XOGKTNKGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1792662"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:46:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/gsc: Fix NVL-S GSC compatibility number
Date: Thu, 15 Oct 2026 20:45:48 +0000
Message-ID: <20261015204548.147348-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
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

The compatibility number for the published GSC number is 1.0. The binary
is correctly named nvl_gsc_1.bin (matching the major compatibility
version number), but the driver is instead looking for compatibility 0.0
(which maps to nvl_gsc_0.bin), leading to the binary not being found.

The driver supports running without GSC so this is not fatal, but all
content protection features will not work without the GSC FW.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Fixes: 8a90f0d1098f ("drm/xe/gsc: Define GSC for NVL-S")
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6edba1401f7a..709b653276a2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -145,7 +145,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
-- 
2.53.0

