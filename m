Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33264C43602
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78C10F05E;
	Wed,  1 Jul 2026 16:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkA6h/Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711CD10F05E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923591; x=1814459591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Li4Ufw1zSVnzUocvIUQhsBHCJyaF/Tg0qj2I8A1AgA4=;
 b=RkA6h/DxOMAmeLopPVUW+IiZkgSQJv7KDm6luzcmGDfI+Z2CUDok+jY4
 5mfqIk/sAJc3U1V0tYPQnOgtUZMPWZ05jxNCNiUJ09n/Hsqbyd1yF2Y27
 bJrD59t/5CDFQ9YTA3SFuZ2mEAfx9Uxh6DdWMC72AX9GMvWmZrDtK9225
 7Tog7yec4T1ywlLqtnKflvlx+uqdaVrmmpnr/sdvFik9Cv4FL2nklYUXv
 dlXPotAztPWVOwjot7Ny4SM/lZ7NQnuqPe/h0GvzbwGI/VYe1xM/s1y1x
 NWZxMgjYQlD3rKZUCdzIwLizwkZ5JzVXFvMy9AHdv0nm2CNV5URVOlD9l g==;
X-CSE-ConnectionGUID: 863DZXm8Q/2+nWbW2IFMGA==
X-CSE-MsgGUID: OezHqZJRRtiFyxJmg1U/5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779244"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779244"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:11 -0700
X-CSE-ConnectionGUID: YhFrkVZPSqKY8MobghkJNg==
X-CSE-MsgGUID: XoG+BlkxQua7AxFjciTnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196421"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:10 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 1/8] drm/xe: add page size allocation control state to
 xe_device
Date: Wed,  1 Jul 2026 22:03:41 +0530
Message-ID: <20260701163348.3432358-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

v2
- make cur_index to atomic as update need in later patch to
  avoid race/concurency (sashiko)

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..eb60bce89e2d 100644
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
+		atomic_t cur_index;
+	} page_size_alloc_ctrl;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
-- 
2.43.0

