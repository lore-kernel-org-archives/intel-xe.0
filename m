Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0BC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 00:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55CA10E644;
	Wed, 25 Jun 2025 00:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+hhx/0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AFC10E644
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750810558; x=1782346558;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ilPwayWvOln8rheRFvCp4w0pEbnSemW8jnyqxyU1dyo=;
 b=D+hhx/0Zs/DGMOqgYXl/654cWVKv12YwvOypy56K6qo8/1y3sQxfRUPh
 uBPMW9JQCA1PeskjX6LJJ0zHW8CjiEFEHQP0wbb7d3J2wYuK8f6kNPel4
 7B+oFqDvCyVsPitsKsHO528cjAkYeRIPnnQN+9epFaHeZ7l/RXTOpHAw9
 WpmV7asC1f85FOLDgKjQGk2vMRND443PlLguNzt1w0cFS9uvxTmizJaN9
 ByGTRweDZnkIpS1Fvy4xeUZxsbxWKAPLcok3Vw6RxgCcAa/MKIWaDa2N2
 PwfhIbvO4ewiBaMCtMV7fyrtcJFltiprZC0PGCq+6wjkKv5pOkGFUwojN g==;
X-CSE-ConnectionGUID: IQc4z29LRUiMy12V+QYTFw==
X-CSE-MsgGUID: vr8HGod3S32Yodjsujd34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56853585"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="56853585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 17:15:57 -0700
X-CSE-ConnectionGUID: mAa+cGdtQoSpwIrr8Y7cyA==
X-CSE-MsgGUID: jihA3/7vSfmtbxVvOLuPSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="156089392"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 17:15:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/guc: test PTL GuC 70.47.0
Date: Tue, 24 Jun 2025 17:15:40 -0700
Message-ID: <20250625001538.1617675-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625001538.1617675-3-daniele.ceraolospurio@intel.com>
References: <20250625001538.1617675-3-daniele.ceraolospurio@intel.com>
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

This is the first official GuC relase for PTL.
This patch is for testing only. If the testing is successfull, we will
drop the definition from topic/xe-for-ci and add a clean patch to
drm-xe-next.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b9aec6c5d3d7..2ea7b42bd4eb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 46, 2))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-- 
2.43.0

