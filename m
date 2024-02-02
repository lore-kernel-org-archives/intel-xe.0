Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F000C48297
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F6E10E3DD;
	Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKKM7aGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB9110E1DF
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904181; x=1738440181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2qEmoKLudIJ655tNSuPs0Wx/I8NofVTr8YvyjbcBtw=;
 b=kKKM7aGHX7gKofvjyGmwnxaCZ2PmyC1Fph8t1x5BhrQbEu2YbOCVVtjN
 mQfLGAikOi3ZzVaKhmQNi30VCdOIKUXE8SFQlZ3i0GUgr4LLvLax8QzO7
 TpFLDODb3YkgYhJhxyMJhV7XPQF3MZDKh9AMC9EQ3hUfnn8wyF5ANSNtf
 MiHUxCSx4skGBIdUFzKpQgony4Wsh7dhy1IGl6vir7alyGTCBB49rd6wp
 PlOx2b9258C5wwUVythfp3/jcALyclGqR+JXJk2oksIwPsudzxaA9gKJs
 pTUaQ+DKUcK+2y2S/vfXwIXYmX4ks2dPtqvWGt1l+43cg6wwACtfrXRmh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3188625"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3188625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="439136"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 12:03:00 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/6] drm/xe/guc: Add support for LNL firmware
Date: Fri,  2 Feb 2024 12:00:16 -0800
Message-ID: <20240202200017.2133438-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
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

First release of GuC firmware for LNL is now available, so start
using it.

v2: Actually use xe directory. Doh! (review feedback from Lucas)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d896c98dd0bb..4714f2c8d2ba 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,6 +103,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
-- 
2.43.0

