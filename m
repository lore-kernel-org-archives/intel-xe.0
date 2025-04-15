Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9311C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 23:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A13110E396;
	Tue, 15 Apr 2025 23:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGa6qvS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A4010E396
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744758985; x=1776294985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kp2X+Dn9ktwFnSYRsqwzLj9iqubW0h7bOOpJAwh1TQg=;
 b=WGa6qvS+VhUdVnCbzmDXCdxMhvnFPyiXw8pygXbEngPNG5GYp4Za6lEU
 p4hx9woSVmD+cjwO8jThk0CXfxQ5ApYp8rFiiGP/t/8avVXtjZ83diC3r
 0Yv6KHhA3V9V9Wc27+SNjkjzx5rg2OWEI/wSZq6920prftI0NU0voYhZI
 LuBeI+JeDUJdaHIcBPM8fkGiDDjqmS1MYRePEax0ZYgGmMzyBTJsEWPTH
 Yw5d2Z16f4EoaGqr5MmldeD9frdwO9/lrrs8oP6TdE+4VPt/07978Nf22
 negRI+g6FRMVukuGaKrszFvfZ0xfDR0hdbRDan0sQMu1r4rjV8bFsMVjs w==;
X-CSE-ConnectionGUID: pA++xnkaSyiEZBjd+J83gA==
X-CSE-MsgGUID: ahYDz3ZbQTKYLz3/jx/Krw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68781703"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="68781703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:16:24 -0700
X-CSE-ConnectionGUID: gThdcZpSRDGne02RgF7YZg==
X-CSE-MsgGUID: Iw2nE70LRPCU+Bxz9Qhlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="131166504"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:16:24 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [xe-for-CI] drm/xe/ptl: Update HuC FW version to v10.3.2
Date: Tue, 15 Apr 2025 16:16:10 -0700
Message-ID: <20250415231610.1286014-1-daniele.ceraolospurio@intel.com>
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

This is the latest version recommended by the media team.

Note that this patch should be squashed with the one introducing the FW
definition in the for-CI branch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 40d48da19243..7b2d01d39b86 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,7 +128,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 3, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.43.0

