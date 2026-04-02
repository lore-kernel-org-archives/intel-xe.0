Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3738D6AB17
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45C10F634;
	Thu,  2 Apr 2026 22:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFFqsCoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F40A10F3F1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775170121; x=1806706121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjLdVMtkvhJc/SGQeZJoA7hYhVxpexwVReamaua5zQo=;
 b=gFFqsCoyhIuLlDoi3e6LN4YVtx33tdqrPNTl8agkqNLqG6hQu3gGNLBk
 KTvhSxCeKM/bpDplzYoF5b5lDt/EuH7nfer5WMAhb4bR2sWV2Sza2PKRD
 W1ALqhhMaO5LXHzcTRHlBG/x/LgnBLv8/tndhUXoICHT2jDEOdJOVXSPW
 5PqPFoDwsiqiOCYCBwmJJRHcMtIoZIDE6MOlp678odG2mgPMRNsWD5Gs+
 2a42m2t185QA3y+HG8QWaA9hEBsM1fhv4KMU3gbX2unVcO0S22iw/QdRZ
 qhjGnbuizpGg/ijLkBchjD/CNUBugv1p/7otITFizlFsAyTxxDOBq8Uwr g==;
X-CSE-ConnectionGUID: Ztjo4h+3RK+GSmar8aVVcQ==
X-CSE-MsgGUID: OTRnO0AIRZugefq3ENgQCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93823869"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93823869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:40 -0700
X-CSE-ConnectionGUID: uQ3ROpf2RjqeG5Z8c2v8cQ==
X-CSE-MsgGUID: ljO3Xey/R0Gh73GDMgB/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231137209"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:41 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/7] Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
Date: Thu,  2 Apr 2026 15:47:45 -0700
Message-ID: <20260402224819.405728-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402224819.405728-9-julia.filipchuk@intel.com>
References: <20260402224819.405728-9-julia.filipchuk@intel.com>
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

This reverts commit bd9ef8d19f9e9ff47518ce48fb2002d58bfeeaaa.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b5a49ef9dafe..6268ca599ec4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.51.0

