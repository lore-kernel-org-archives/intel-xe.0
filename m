Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DF5EDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2310E8EA;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3/8Dg7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3157010E8E8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772573843; x=1804109843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=00AYxF4igPEXCHk5/UqXHAU8C4S3gT4uitgxW4TnzCg=;
 b=C3/8Dg7/GcIqLD3lLRuNC37RGg8/qeAYwwZqqIkFz4g9V+mWn95a/QY0
 UW9H6u0GmzY8pD/5C1v6ouWZgMCupNeEz2PJEKJGqDk/i9RwRAc787bgJ
 f+8wvrRMO3g1M62Y8D/i/NDM6BzzHLIcUEAdc9gXdUH95Ow3MvJyHBzco
 VrBsBGU3Kbtcja4k84Zs9s/z51Kv+Lb2p2pHF9sAIiH280/Uyp8t9/7YZ
 u4wwMEVMFnfMa77+h7l0qWy1IrSc/rOelFWVkvvXvqxegDJp+ZgSvFENq
 r0xvuluWdBtUOj9JB0EOt/fzEthjLPrRxfQ9hFQOzZKqwtcDV/DQGhvDS A==;
X-CSE-ConnectionGUID: Oua13+EUR3SfpufcJxdMrA==
X-CSE-MsgGUID: mJbT0Q3oQkix1pNgAPyHBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73689139"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73689139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:37:23 -0800
X-CSE-ConnectionGUID: ZX88+BhiRV2FNq1RBeKXwg==
X-CSE-MsgGUID: /Zrmg40eRq2xvYUZm6ae/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217294704"
Received: from mjruhl-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.220.75])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:37:22 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/1] fixup! drm/xe/nvlp: Define GuC firmware for NVL-P
Date: Tue,  3 Mar 2026 18:36:51 -0300
Message-ID: <20260303213655.241442-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303213655.241442-3-gustavo.sousa@intel.com>
References: <20260303213655.241442-3-gustavo.sousa@intel.com>
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

Update GuC version for NVL-P to v70.60.0.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 60c82b920f47..9aa8deefa6c4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 55, 4))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 55, 4))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.52.0

