Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85CCD98F9
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B510410EE99;
	Thu, 18 Jun 2026 22:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8PAyVtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7F10E8C8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821549; x=1813357549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vktpyye0V5Bb11Hpvr2nmlxpQHRdHgiuqsxX0+C23h4=;
 b=Q8PAyVtO76Cc4UgcBcTOjiN8ILAWPg4QDCrB9KX3pp5GRHUFgoRj+N9H
 NdXgKv0vaVw51Kx90wgRm1re2t8jBTrilJYqDCmisX864RVhqLz5nVpjx
 LUhrnOWSHxJpp7uPw3SI42oqAAtVHNPtFCzlbYi4PAJlLamttrUD/uN4b
 A7Mc4uLAQcSHZBDbtjifUdw6eyiVVph1GqeBm4fwBfXK11+TvFX6GeXpm
 x2s/jVZZ5tqOnMgFsyHJU9WN9UAwpe8bZTc9YkRNmHM9kF5AOPTS9Q8iW
 s3c7y4Jo9NxGUGfSJSNg/vrc8no4EYsixrzNyUHZDOPQPJHmZ7LvodMG7 A==;
X-CSE-ConnectionGUID: Hl+f5nKHQiqZzCxfEVdgjA==
X-CSE-MsgGUID: s1F1zlfsShm4XrwnjoXpKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785779"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:49 -0700
X-CSE-ConnectionGUID: fgvaefMYQbSULTfOSE5dqg==
X-CSE-MsgGUID: Q5Irtd9NRLi12SzVYmcEdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661320"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:49 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCHES topic/xe-for-CI 2/6] Revert "topic/for-xe-CI: drm/xe/cri:
 Define GuC firmware for CRI"
Date: Thu, 18 Jun 2026 15:25:29 -0700
Message-ID: <20260618222536.3351750-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
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
index 7cec96a2a41e..b7f8b8584e2a 100644
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

