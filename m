Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1524C369A1
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541E10EA4D;
	Thu,  3 Apr 2025 18:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXCEKC0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B6510EA53
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706581; x=1775242581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUAESqWHUml/QXtIZb7Re7kgWxcSXN3Cn6dkmJhHUac=;
 b=mXCEKC0md6CKRhmXPCCdLGsU+NtM2XZ5+Q4daKMpH97nUNapvO/vEexO
 Nwr/rKac3erkHaVBgMzQu31wr8eaBZiX6FNiqQlDaOOn9XGrPvp0J1hyA
 jbbGAkik5jOwCiL6zT4+cAwEYL4pu49cnur1YiJnzDzxrXByvJKkNvzTQ
 I38w1fx5ZHHmiT0zCVsFOK8jz4cpjBmH8M6kHAZy1juuRHrdVDhUq3Xrd
 Yb5ATH1mHC6jInUCDHAKFhJ328rbhwA7TDqDe9Hqq5CphdkB/0s+JEDsE
 fvyY2Ivo8asUqHHZIO/VjZmS3MVdWwQE2aafEZevJLpugX9Aq3tHUrIhI w==;
X-CSE-ConnectionGUID: 4jCQD1bDSb2Oq1LZFICnbA==
X-CSE-MsgGUID: IvSFm6kQTmmDk41KurrS2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737759"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:20 -0700
X-CSE-ConnectionGUID: eOvSIAPaRHuSYSvdFqot2w==
X-CSE-MsgGUID: 3/Ae2zXoTzOx37qDVJiwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895846"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/8] Revert "drm/xe/ptl: Add GuC firmware definition"
Date: Thu,  3 Apr 2025 11:56:13 -0700
Message-ID: <20250403185619.1555853-4-John.C.Harrison@Intel.com>
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

This reverts commit 14a8e4d6ca41e925e267f5970eb11447483da209.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9ce82116498e..1da557ed3a5e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -114,7 +114,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.49.0

