Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6965FE65D03
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 22:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CE510E106;
	Thu, 21 Nov 2024 22:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTL9HXKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C9D10E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 22:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732229725; x=1763765725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fH1x7+/k8R1y+LCIog4FPKT04y9Lz7Kl46+5SFBmFno=;
 b=ZTL9HXKR7pq9Z0BHsPZ+VbwcLKlgo84LoOXHqGGheBFOwuPRR1M6s11B
 TN8w97cBdEMPtiYwlf+LOLAE+k5XJ3MRghEBFDFpeNXB42fd4cANTS/da
 /ZP+cICCuyXygYEHs0n8sp7wFZ41/0AxPyNKUGsSej2JUMpT4LMEXVqbE
 mBJk/Hye9q8TkexnQXTMROG6A4AUhUyy+VkHrKxxNioVxsfgc6NFNLkNd
 1IxVOeBcEMgidS9KAsyTCveNyh/1KnlWnUkScfa90u/hFyAYTCefnIJPc
 HuLIEiEqOpdrZ3KC9qMQ4W3EF0+qo5aI0p5x7Dos1Qh4iqd0bfTgCckSi A==;
X-CSE-ConnectionGUID: jDvuHeyyTDSE5YnonzxxFQ==
X-CSE-MsgGUID: +jqz7s6CT96RTbGffncdxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36034986"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="36034986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:25 -0800
X-CSE-ConnectionGUID: 9baVZ6hORCWocTF7q4Fd4Q==
X-CSE-MsgGUID: YyjMCH0PSKmuOvKxidqTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90325625"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.34])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:22 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
Date: Thu, 21 Nov 2024 14:55:18 -0800
Message-ID: <20241121225518.10986-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

Update PTL guc version to 70.36.0.

v2: Fix typo in commit message

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b0deb082ab2b..9c14b0adad0c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,7 +107,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.45.0

