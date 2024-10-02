Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A03CF8548
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 23:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75AB10E02B;
	Wed,  2 Oct 2024 23:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLPEmqrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58110E02B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727910389; x=1759446389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cawb8C/+QFViCiC6j0Sxl1EbjHVWtHnJIvtksaRWooY=;
 b=nLPEmqrRnkErgAmMzY0xynHjuWtjxl2B9BRDZkFS4TVF4dhDlIInWnIs
 Jf1was9mXUFQM7aJuDxwKbkyXyxTR1oEPlzQM/idLesDviTnhXT/Q5k2u
 emlvfZ+zHE8OJ+FzvrN7DaZKcPlKX/egHN45bGFsHs4bloahBCnoXiM6z
 lvub9RxsGHwC6bOF3T2Loof5oKpyOzx/eKrT7ijMKn2pdXAJ/Kd6IInu1
 6QfKp3Z+8geAL4uMaOjjqSzK/e9KhdnNAeN3Jb9O50/HbEJxzw+/4oS4m
 dmZcAoBedYBkXqhcZJBz9ZusQLBuxHt29p6GlAoitkLQ0FsMBFA4L/JVm Q==;
X-CSE-ConnectionGUID: +jxiBpUDS2WNWU0t2PPKJg==
X-CSE-MsgGUID: WT+IDpRcQmyZwl8qEUBv4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26897787"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="26897787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 16:06:29 -0700
X-CSE-ConnectionGUID: j0qkbMnfSVWqOUMsvN0gHQ==
X-CSE-MsgGUID: Ms0sbO5eQ7ygmsmIwPnTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="79007189"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 16:06:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Make wedged_mode debugfs writable
Date: Wed,  2 Oct 2024 16:06:21 -0700
Message-ID: <20241002230620.1249258-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.46.2
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

The intent of this debugfs entry is to allow modification of wedging
behavior, either from IGT tests or during manual debug; it should be
marked as writable to properly reflect this.  In practice this hasn't
caused a problem because we always access wedged_mode as root, which
ignores file permissions, but it's still misleading to have the entry
incorrectly marked as RO.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 668615c6b172..fe4319eb13fd 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -187,7 +187,7 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
-	debugfs_create_file("wedged_mode", 0400, root, xe,
+	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
-- 
2.46.2

