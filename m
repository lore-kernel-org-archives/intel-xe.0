Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58496CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8310E0FE;
	Mon, 10 Nov 2025 23:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR/CcNxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E374F10E0FE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762817354; x=1794353354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J76QDW3q+AZvvAyd0eOpc60Fj90OplGrnWO+vfqb7NY=;
 b=cR/CcNxY4FTrv9DJSXIjQ4HIIdFy5iSLeYoCaqh7df8HBqiohurDsAKH
 G1Oy48X5dSw264JwRk2BMxB+E9PHvBIQdF1Xo13UbKWqNDfkUKsveCmi9
 YlAItMzLNpMt1rDgJ82ubwefp3/uEp6VxXOAFx0VWtUOH/mUBH82H4ESW
 XSSHmt6r3QtMgB+NroYHeSZNH+SiLYZJ2C+vOaFeM6XeyAAfgjF3kVzUQ
 ks+6p6bobqSET50BZ3O+BSP1lZyqg19wuVYQx1XSYHaYUye5QhRIYDY4M
 d39sOsnkNmwKNJBTlXipV0eZ/HRaQwCJvYXgWGfs+QwQ2sBwhpRcB0Bpz A==;
X-CSE-ConnectionGUID: 73RXkAStTcagtHVmQIYrJA==
X-CSE-MsgGUID: MjUDer4FTmeFAUofUUZn0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82271071"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82271071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:29:13 -0800
X-CSE-ConnectionGUID: ahTQB+n3RWeIaLkMl0hVdw==
X-CSE-MsgGUID: ykm1APPjRmmiSyozXP0fSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193185327"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 10 Nov 2025 15:29:12 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
Date: Mon, 10 Nov 2025 23:26:58 +0000
Message-ID: <20251110232657.1807998-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are 2 identical "select DRM_EXEC" lines for DRM_XE.
Remove one to clean up the configuration.

Fixes: d490ecf57790 ("drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7219f6b884b6..4b288eb3f5b0 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -13,7 +13,6 @@ config DRM_XE
 	select TMPFS
 	select DRM_BUDDY
 	select DRM_CLIENT_SELECTION
-	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
-- 
2.49.0

