Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D7D1D486
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542CD10E7AF;
	Thu,  8 Jan 2026 18:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9kwO2BC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E410E7AF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767896503; x=1799432503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7FfZLNk+sd8upbS8/vZXSqDobwrgV4aImb+jtOhzLk0=;
 b=m9kwO2BCuyOMi4Fs0b1r1jS1Cn4cjFrsWTVCHIeIgNtCytRRxdihrxk4
 CkZnr23sNA9nfmOc76+8fw30xjUTlxetSU3bhwK08u1gUYPy+jgJfaOf3
 eT7/+whIhNtvPdVup1HJY0x3eAWqcLmqASBO/kU8MH5OAzBjMXEafkVzq
 rd1oyvSsPh0muJUko+1VWVmkeIZt4W473X5WpDo+5CPNjLOVY2Tnu8NOt
 lLWTENNoUJgn0YlUe9Le2UgLjI00ArRmLbMN7UJU0tZMDQkayOCCvTr/7
 WhGnfEjnjTyJzS8+MLapXaToZ/SjM08R62JKG0LD7j8SR76X2u9Olag0H Q==;
X-CSE-ConnectionGUID: XjHiPUn8R0WoAkE5byWsnA==
X-CSE-MsgGUID: y84GKijRQhSh85F+5bIlqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69355242"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69355242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:42 -0800
X-CSE-ConnectionGUID: Hm5K6OypSjWBj8sCyRHYYQ==
X-CSE-MsgGUID: +toUAv9bSeKvZ9bWDpfR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202394581"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 10:21:43 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/4] Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
Date: Thu,  8 Jan 2026 10:19:44 -0800
Message-ID: <20260108181956.1254908-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108181956.1254908-6-julia.filipchuk@intel.com>
References: <20260108181956.1254908-6-julia.filipchuk@intel.com>
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

This reverts commit 3f0b612ede72785e11437a9e101b36d8c590399e.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 290c69032129..cacbf89e8f68 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

