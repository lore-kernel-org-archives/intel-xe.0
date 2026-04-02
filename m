Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7F0D6AB18
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E96810F6ED;
	Thu,  2 Apr 2026 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHVH9o1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA48F10F3F1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775170121; x=1806706121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iE3bESqpNObY9mO1gYHdrMhshnC8ycJN+JYVaa2PFck=;
 b=YHVH9o1n0w80AE7F15v3xyMyQJxNAgWvYDhX8op6DYpyXfjveyzmZPhC
 0kU5inN8PRT4hZRKu8vsY+Z/qKi8Cz8rWs20hJR2L+HFEqZ3td/6MI+VO
 U+rvSBFGkr4K8rEmcd3aGzkznW8MvaO1NJLHfcJRcPRAIEqUR6Ta6bql7
 riKc2bLM9CvU+ql6FORDFdnVVsD4dVHQI8+EHRI+pEyfFDYAtpmO6ESm1
 wsEFJX10celYMdrfkHmXiZVa58fmpkm7PZls8uttAkdqKXWIMhJnT550+
 9H+SQPRAcrvSLujCDy1m8gYaFplyhGHCVQ0RCwidKRTSuiaIjrpSkJ/rj A==;
X-CSE-ConnectionGUID: WFD1xlB8SqCid7Km2tMOYA==
X-CSE-MsgGUID: QgejXoDyRdqVMnNRwiZz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93823873"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93823873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:40 -0700
X-CSE-ConnectionGUID: RHDDWWv/QfCTiR4jPbh+MA==
X-CSE-MsgGUID: 2cZNu6SES6m3oBI91Kr9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231137222"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:41 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 5/7] Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
Date: Thu,  2 Apr 2026 15:47:49 -0700
Message-ID: <20260402224819.405728-14-julia.filipchuk@intel.com>
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

This reverts commit f93a9f056f3dbc847dc365ae12533c7654e21847.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index eeca044d3aed..dec917613ead 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 60, 0))	\
-- 
2.51.0

