Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59694C71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091510E96F;
	Sat, 14 Jun 2025 01:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Add3fWT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0045410E96F
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866155; x=1781402155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZIapRU0cDxCd8KmNvHsC+mR8HehlDFUutNldakx8Sg=;
 b=Add3fWT31lxK9r4NeSYH2enixpc81ahmNSzPfwpuUG/mU4u4EfD5mYnm
 a4xE6kgtVNTGP/ezFzqiY7ZcbSTVugN9XH2UDwa20UkysIPM+ZpvpLjsN
 ayTjJTxSXuxllhex0II/OEGmHDiHz0SzvFeluLL1dXRCaX6LkqfgiM5yd
 rsiB0JHj66x+YWN+og81TFEM/puO7hs5hDzaBJZZZ7IuoXdAKkHcoGPst
 hoZFKMP3SwVMVbgVlZEk6xUQvO3+hn0BVm6VqFmNUZvoqKH2F8tuvgY/y
 eM3jyTpwTvi7BYJgpNWRZ9GId5DA+1qCPvRMw3Z8dHYZz1WuHDgpQh3OX w==;
X-CSE-ConnectionGUID: tHUz2QPIRna4GN01mhnWtQ==
X-CSE-MsgGUID: CqSs2lY8SHiAjuTcUe2k8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481408"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:55 -0700
X-CSE-ConnectionGUID: Ckf+PczPQLS2cUGUg5fJLA==
X-CSE-MsgGUID: IukXtrIHQ0+Y7eqoWRsw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875041"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:54 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/7] Revert "drm/xe/ptl: Add GuC firmware definition"
Date: Fri, 13 Jun 2025 18:55:06 -0700
Message-ID: <20250614015511.691610-3-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614015511.691610-1-julia.filipchuk@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
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

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ec946727828fa..6e04032ec3e0a 100644
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
2.49.0

