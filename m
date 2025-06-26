Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF4DC83000
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 18:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC7510E8EA;
	Thu, 26 Jun 2025 18:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3NueJ8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8611E10E2F0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 18:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962506; x=1782498506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iN0a1HacK7Ij0YFYHKeMCi5saRaXNBrxsVXjH+17+aI=;
 b=i3NueJ8/QnTNbn7WcgMlkjRxa6zV/IGoNUTounMhDRrXuVaneSdcm6Bn
 wvoGvY0pi/9CCpCzGiPRbGCRn99IjwzZ/uNa8uPqobgd4Kpvjo5F/Ku/e
 1Fu8P30IUh7IyKYJGnFtoSWC4CqXTOOBCWltliktMQmakP2WikPy1HXL2
 ZatrrTiwl1o4gnvo8qzJuq8eXVJ0Y9PUqXoAG73wO1En0jS06qgzsPssV
 E7LE9ijnO1sgbyArMRVX1Xb7RqI/YmV7xuF8aEdNuFhBlctKyY5IkiJZq
 5y4ey/B5Z/CzOp6YTFEp9G34I9dY5Mt5wZK6wzZO7y60auPEM/P7aCEHp g==;
X-CSE-ConnectionGUID: DnwBijaQTvSzoGxJnSWL1A==
X-CSE-MsgGUID: eyv0PGqpTt+vmWoC9hEBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64626691"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64626691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:24 -0700
X-CSE-ConnectionGUID: 3SW5A+/UT1CLLP5aIkmaiQ==
X-CSE-MsgGUID: 4koRrjQzTHqRvE97TKUD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152766326"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:24 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/7] Revert "drm/xe/ptl: Add GuC firmware definition"
Date: Thu, 26 Jun 2025 11:28:08 -0700
Message-ID: <20250626182805.1701096-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
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

This reverts commit 738538d0edb88e0c2f758dfc299146087f34826e.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ec946727828f..6e04032ec3e0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 46, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-- 
2.43.0

