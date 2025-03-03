Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AD3C282D2
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959B10E4CC;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMJcTcnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6526B10E16C
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=scTheegRbJJfW9y0EwLogL9Onhj5vxVub4e/iGN1fq8=;
 b=gMJcTcnD33RSa4tuj8t+2rjzKUSjgn8z3IH+T7bd9OHQguUyeGy/U9WS
 bvBQ7OEr1ZSQXWGCBOYGYa/lBL4jtQ7Yj+1RQiKvBi42NnwNBJogDB8q3
 5IoszHDePRyzPfikaS+YAP37TsFZmTNPr6fFXniVO4RhQ8wjZbQzCeBqj
 rtbpvXC7uddaQmNwSrh+MJlgQX9M/OXxO+R40Lih7Od1/DbltXLv2wnQv
 +mJojK3tZlYNWBqgYGxRydsSvI2GWQgvXZW+GjrUzK6XaEySlvw2Bc0fQ
 OdIym0fZrs6m/bfCNzEjF1MCOI+P9fZt3kqQIDknS8nLa8qdh+ya+0Qti g==;
X-CSE-ConnectionGUID: lY/5U8YLSEu6c3RaLEyxFg==
X-CSE-MsgGUID: r0uI5x4LT6+PP+heXAq9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167368"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:16 -0800
X-CSE-ConnectionGUID: pvYDZE29SbypPzrbj834aA==
X-CSE-MsgGUID: KqdL9n/bTe6xjXOvd5RXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366087"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/7] Revert "drm/xe/ptl: Add GuC firmware definition"
Date: Mon,  3 Mar 2025 11:52:10 -0800
Message-ID: <20250303195215.1046192-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
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

This reverts commit 9a67bf39ece1cfd828f8c671c61f7f3c1c694a30.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 63dc3ebc02bf..087fb96f707e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,7 +107,6 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.47.0

