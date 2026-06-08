Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FA8CD8CA8
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC97B10F90A;
	Mon,  8 Jun 2026 19:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT2F4QUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361410F909
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 19:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946341; x=1812482341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iU7rpYZacKPASRL+INWcTWXYAyTlHDSzui9nAjuXrn0=;
 b=cT2F4QUb3cz9doSLbZ/Gxg2rDjH786nkWxneMyR/snhPQF45ZhRl734K
 bdqsZXW7JGNa1ptLZHXloNXIzF7lLSoLr8Mxe4A/3pkLaItJfN5lfyaEQ
 lJl28lkae53T4QzFUeZiqOPxGEbmKKqGVLVhdlmaw29qTqcbeeKNHTpfM
 RWLqXIGOfvhLhNghHMkpn1Owc9eOhxokhLg1qG1gcfug3eCq7JZ353tc9
 FFq98aHzV7eDMdRs/1r4I+1PdDZuT++bYNetgFITrvkFDU2zEZtNpB4kB
 H8Jn0CNUxpn9nNXHqmxGU/bTZnb4AbZKZT+yn6mK5uk3khj6gk2XCp+aS g==;
X-CSE-ConnectionGUID: AFa3+tp5R6WrIEqfiGQd5g==
X-CSE-MsgGUID: Kghn1Bt8Td2IW7dAyI4ZUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92019428"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92019428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:19:01 -0700
X-CSE-ConnectionGUID: 3Q2I5JRXQpqEhW4MNpLEAg==
X-CSE-MsgGUID: VF5RP+xtQ0SFb/5TdArUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244789335"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:19:01 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/9] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Mon,  8 Jun 2026 12:17:46 -0700
Message-ID: <20260608191831.2337033-14-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608191831.2337033-11-julia.filipchuk@intel.com>
References: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

This reverts commit 70680e8c7300e361d46a466288abfdd673e927ef.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a63d49df9a9a..f97c874edadf 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 68, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

