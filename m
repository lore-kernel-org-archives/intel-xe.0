Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3435AFB516F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E848510E2F2;
	Mon,  6 Apr 2026 21:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPWreUy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290FC10E2F6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510313; x=1807046313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Ribzk+bSE/SQ7W9GrHnJyG3b1fp9ELmpdN/YxBRnvA=;
 b=iPWreUy8e2Qu7x1AzBYGVTo9fWczAvRSvr6PPnzlN1XApW3T79MXQ9y9
 4NV+AVjM6pdkH7Xe5BKayjeEFmBlvug89hQUxP0p3sq/LWT4eRT4CCuXp
 kYRpItM2YcLMTHRdOEGZix3yHgeZTZHV/xvAP/l0h/HyyVhdRLTG2+uAO
 TRH+uS8rfk5pfOPstUUyiPSUxc0OPyv+YQXPxGezSHJUha2Nb/MyfqgU5
 3Hi1x/q9JI1eoweWSOTcMnnvGZvBtXGfmnsq7dpg1oChIc72ML4Nw0GYY
 OiR+YdGxSVrZep1hl013doSQVvVe6yW7+1dWUtWpyeBM4IvcSDyUyPL0j w==;
X-CSE-ConnectionGUID: FR7fC4rZTLmz0uXEBhwd7A==
X-CSE-MsgGUID: a6/9QHcNSy6p2uaLnKr2BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76653352"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76653352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:33 -0700
X-CSE-ConnectionGUID: d+NKzHXwQbWs2viCnl4E1Q==
X-CSE-MsgGUID: jD163hsUR9CN0oqLendZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227888188"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:32 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/7] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Mon,  6 Apr 2026 14:17:26 -0700
Message-ID: <20260406211759.817577-11-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

This reverts commit cff5e8fa6b434bcc543d021d6f865221536ea9f8.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6268ca599ec4..70bccbc1af82 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

