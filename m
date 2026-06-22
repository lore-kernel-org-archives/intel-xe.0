Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B74CDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2210E285;
	Mon, 22 Jun 2026 06:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRysP9Bi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C6C89131
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111579; x=1813647579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=08Uqhgqtyn7e5rR5QUGe2ATP4Vd0h6LCrYmkOgKres8=;
 b=ZRysP9Bi5SOLJLf0U9wWrkd/qOb5PVKIJ/oLvWGTDEUP2bML83WbaQRo
 OQqjHpwWy5TGKu00u7JC1CcbYjPxvocG1JLE+nkZQbsJgFly3WC/nzhVo
 Dtxm8/eh04CLoDoIl4v4HwI++Xxf1/nX6bS0SUk4UsIPWteAFvishDDVj
 gjMui7rEFX89MB8B0lTnwRT2eG3osJjUAhQLBWHt6Aq753TG/0NF1Ns/h
 H7tgt1py7sjeWxRhmRk3ACjs1LbnS+VoQgxrivQiKcU4b37GMoPi22K6a
 r/nWF/x7gPHPuTV5n+AViZWUAQpD3aeuTIAVJvdec5XGxLEbWEmGuKrU5 g==;
X-CSE-ConnectionGUID: b+3gLZa2ST2c97qE/iQrGg==
X-CSE-MsgGUID: Il56PqzhQRWM3AB5A0Z4Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928702"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:36 -0700
X-CSE-ConnectionGUID: 236X7gSjQa2jou6OPTsFUA==
X-CSE-MsgGUID: YnkPyWyOQymeI02jlov8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068087"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:34 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/9] drm/xe: add page size allocation control state to
 xe_device
Date: Mon, 22 Jun 2026 12:30:23 +0530
Message-ID: <20260622070031.2445502-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
state to struct xe_device.

The new control supports forcing user BO allocations to 2M pages,
forcing them to 1G pages, or using a mixed round-robin mode across
4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
in xe_device so allocation policy can be applied consistently.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..d8b0d4af323e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,18 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
 };
 
+/**
+ * enum xe_page_size_alloc_ctrl_mode - Page size allocation control modes
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force all User BO allocations to 2MB pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force all User BO allocations to 1GB pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED  : Round-robin, 4k,64K,2M and 1G per BO index
+ */
+enum xe_page_size_alloc_ctrl_mode {
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M = 1,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
+};
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -474,6 +486,14 @@ struct xe_device {
 	/** @late_bind: xe mei late bind interface */
 	struct xe_late_bind late_bind;
 
+	/** @page_size_alloc_ctrl: Struct to control page size allocation mode */
+	struct {
+		/** @mode: xe page size allocation control mode */
+		enum xe_page_size_alloc_ctrl_mode mode;
+		/** @cur_index: Current index in case of mixed mode */
+		unsigned int cur_index;
+	} page_size_alloc_ctrl;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
-- 
2.43.0

