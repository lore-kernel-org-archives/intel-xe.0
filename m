Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2DC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 20:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D8B10E6E5;
	Tue, 14 Jul 2026 20:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKGX2G/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E453510E58D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784061029; x=1815597029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jeZ410ebSS70MqHY/+CjtJzApdjzbfxxej5tE5I8U/4=;
 b=SKGX2G/Gl8nhSRKfQEgsSK0YB0t7Bv1XcKs2TN3vCqiSPUQvmWIp0iEa
 Ne3HNsPK4PM3xD9DD98TpLjcHKMDCh0+WGfjUlJEBl7I3139tLXBqKkEl
 Q/9AQ2dK1peqdUXT8u02yUegdcFHv2S94yTaiL6QOReqgY4xUqwMlMNXC
 8iid+d8ewxUkmOEkeixFqp0hzOi+9gUN3BzocyGL+OW1gJKtZ7Zx4uBLY
 EtAzJhy/eRVjhxwPYo3ubmrQENcJ1yjpV9uRcxzmJRLL7tZSBUunYKaaJ
 ysrUCktXX4ahD9mVvjJiLiNLrbxb+jvCsBuQ/9te7YD//aYdY9gFYprVy w==;
X-CSE-ConnectionGUID: F5ZphVleR2q95o6EvTrotQ==
X-CSE-MsgGUID: q5LExlzITw2dnE68QsXlYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96057722"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="96057722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:29 -0700
X-CSE-ConnectionGUID: +d9TlE3oSp6y4lUGF3ce7g==
X-CSE-MsgGUID: Z4HMni0wRp2IpvqHQByKEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="279241352"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:29 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/5] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Tue, 14 Jul 2026 13:29:58 -0700
Message-ID: <20260714203012.855004-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260714203012.855004-7-julia.filipchuk@intel.com>
References: <20260714203012.855004-7-julia.filipchuk@intel.com>
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

This reverts commit 1f4aa742267490213e83d894fc9021365201b96e.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f7d3af6b57bb..65f0136859d7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

