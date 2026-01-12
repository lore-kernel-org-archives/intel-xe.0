Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1B5CF45BB
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A41010E2A9;
	Mon, 12 Jan 2026 18:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7GeMZcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0146510E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768241312; x=1799777312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4C4txBPzdYkgfi8OabguD3BWBtp0+epgxP6uSgTDCPs=;
 b=f7GeMZcDjwFhhT0Ud/7+HOti0aXEIj3PwvpTCoivTxBsUoqxayKPM/pB
 Sue7fdqueqCal8JDw0bgIypCUfbfpbfafF3CLGX28fSV5LdiAJw0uAxPC
 LxlZ4/B0lh5WGU0+Of+cHurT/l5DA+wyEt2Qe/YlUx3qDUC4F5iB3lZqx
 GPW0GdSKfmTckk1B4Oce1EN0rr+dkMNr/hbd/XqtiHJbQ3nM/UMXOe2K3
 sR/aosJ8nkobx5/8oUcFz+c6N7R4dFIbl9rS8u/KtPYtKe7ncdvnEC4Q9
 /KwV4hTwi4zLkuRz7odKNGn6LGsMlvSBBNec0vG7Rc/0RKabbVb4z7nap g==;
X-CSE-ConnectionGUID: 4CufAh4JR3SXSUJ+CAJH8g==
X-CSE-MsgGUID: ZA1jNuu4RX2lqVpiCjTf9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80162730"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80162730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:32 -0800
X-CSE-ConnectionGUID: XYL06QcwRwqSEbeYhLh+hA==
X-CSE-MsgGUID: yK1XCyiXQx+g19N/64l3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204561518"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:08:31 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/7] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Mon, 12 Jan 2026 10:07:36 -0800
Message-ID: <20260112180809.1474677-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112180809.1474677-9-julia.filipchuk@intel.com>
References: <20260112180809.1474677-9-julia.filipchuk@intel.com>
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

This reverts commit 912b9b537ae6e75c352d42f7ac40b50f9aa3d2ce.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e93f314e9eb2..2980d0b99e95 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

