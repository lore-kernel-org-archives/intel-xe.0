Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B9C3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0B10EA53;
	Thu,  3 Apr 2025 18:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoDYgkNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24CD10EA43
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706582; x=1775242582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upFHrzAm/Fp55YbyNOwdhslWchpPy41SZNgZul1NAZ0=;
 b=KoDYgkNj8VFDWykPD8xbHzqjFhTza26xxfbAY6tmNEZ94ZCsGMCDIZ6K
 JA4FMbXvZjHR5NpIuNtkk4VeMG8oG/mq4Bg2oK62suo+obeS7WjVGZzXl
 ARK4lkN1cx7PSDti8RSEjFDkl2TEz2utYh3VWPbPPqqmd5mBIbnFwXfWx
 lITfAbAQsEFZieM1oAkAqLUudSTlUibax4ovlZYUntMdkDz6y+c3fFvEw
 z4iQBCi7orEC+dCUEB0IzqIzMrLirr07w5lDHcz9Ubt0rcbHi7+9Ladxz
 +MUKUjbLC6WlfMRzCIAS/ytJPiorB1PKjH3p7blm4vmb2iHaatLMviMua w==;
X-CSE-ConnectionGUID: kmEA107jRICltwIyUBtfPg==
X-CSE-MsgGUID: IEAtCyPMSEWjD+uvQvDNGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737760"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:20 -0700
X-CSE-ConnectionGUID: Di+lLy07Se28i6dwT7nFsg==
X-CSE-MsgGUID: aS3DUprGSXiEtWZFA1mOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895849"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 4/8] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Thu,  3 Apr 2025 11:56:14 -0700
Message-ID: <20250403185619.1555853-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

This reverts commit 6762538793ee391aa20e1ee3ce8853696fa88275.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 1da557ed3a5e..4a16d3c40ea9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -117,7 +117,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.49.0

