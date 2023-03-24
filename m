Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EA7C77B62
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8EE10E53E;
	Fri, 24 Mar 2023 21:04:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874C10E56B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679691865; x=1711227865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U0dBCDrgZmxCP8hYExgmS3emzzmXtaJt3XRwMONr3eE=;
 b=iuh9bMskUpkEsGP32STNUZ2M1dnwJMeikVZJzGMFbX6iIzdVrOpSz1UX
 yBW+fphfXNyFfOEyLw8RY34eig5SBYBvpb2me4nVw3hTorbrzkfLnsrwI
 706Mzjw4WxdKV80ovUg297BS4twPQfZchv/YL7laSLaVpFPvKFhB7Virs
 qF1o5xylegAGDrzv/3NRTp8KPHMUQtcuDygjmGnRxNgaezvn2UNwrV1JO
 WK0+yCbkQhbG+45Hlu81Q6jCn4MxkNa0iE2N5ZgBrXbHeuPHuCS/o0VVq
 hmXmjJ96K31OzfDWv4u1xlqK/e3KNAjUnmJMpLBc8hUgvd4Y9BiuKIPDf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341456109"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="341456109"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752022857"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="752022857"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:04:15 -0700
Message-Id: <20230324210415.2434992-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324210415.2434992-1-matthew.d.roper@intel.com>
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe/mtl: Handle PAT_INDEX offset jump
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Starting with MTL, the number of entries in the PAT table increased to
16.  The register offset jumped between index 7 and index 8, so a slight
adjustment is needed to ensure the PAT_INDEX macros select the proper
offset for the upper half of the table.

Note that although there are 16 registers in the hardware, the driver is
currently only asked to program the first 5, and we leave the rest at
their hardware default values.  That means we don't actually touch the
upper half of the PAT table in the driver today and this patch won't
have any functional effect [yet].

Bspec: 44235
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 645eb20aea8e..a713afdd0510 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -8,7 +8,9 @@
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 
-#define _PAT_INDEX(index)			(0x4800 + (index) * 4)
+#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
+								   0x4800, 0x4804, \
+								   0x4848, 0x484c)
 
 #define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
 #define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
-- 
2.39.2

