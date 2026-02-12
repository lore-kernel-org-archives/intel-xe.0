Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A3BEE369E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C2910E76C;
	Thu, 12 Feb 2026 16:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OW6Cezow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDDE10E29C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770914100; x=1802450100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39NyruODG779TBfoNYseSQrowg1ZGccrQ6up+++nw6U=;
 b=OW6CezowekHIxp7agzH6UG1DiJoXHUTIsZh8DxvKBQ6nYnZqoPAASYK2
 AA7w8ZGUHBOv6KDbSj9KlXhJxsMiuOyPohZPEEfrPlWZ5FONmla0nqHmh
 ODiwAG3lF4o6SmwKgU8PUrlhVyJTOQSYq2nN8MHvGKM+3jlaM1XW/skz6
 pZoAQNMtSwWDVKsqK+T1tEoHSHK5mwFShIUan697nTtJOZxGBglkvUL/h
 2u+Rz+yzh4q7hE7QFH0O2fVJB0noQjaZBehtgJ4jh/DQ+tjAg8QtA+awr
 DeAESYkDkGvP2SXrbpgdSrxee80+WYu7gXDPb/m5ZCpfgXkrmaRf/4KIi w==;
X-CSE-ConnectionGUID: 48/l9mNzRni+aM+/H1oGAg==
X-CSE-MsgGUID: uqzqunh/TMOkJI9UpOPFPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89498519"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89498519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:34:59 -0800
X-CSE-ConnectionGUID: ka9y5AF7TcW1Qjc4AwLcSw==
X-CSE-MsgGUID: JDloskRrTdSMDFJbmZsIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235634007"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:34:57 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 1/7] drm/xe: Add a helper to get vram region from physical
 address
Date: Thu, 12 Feb 2026 22:04:41 +0530
Message-ID: <20260212163439.1514363-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
References: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
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

Adding a helper function to retrieve a VRAM region from a physical address
is a necessary enhancement for supporting shared virtual memory (SVM) and
advanced memory management features like memory offlining.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 0538dcb8b18c..0768b4075bc9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -365,3 +365,19 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+struct xe_vram_region *xe_vram_addr_to_region(struct xe_device *xe, resource_size_t addr)
+{
+	struct xe_vram_region *vr;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		vr = tile->mem.vram;
+		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
+		    (addr + SZ_4K >= vr->dpa_base))
+			return vr;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL(xe_vram_addr_to_region);
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 72860f714fc6..49ef89acba1c 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -20,5 +20,6 @@ resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
+struct xe_vram_region *xe_vram_addr_to_region(struct xe_device *xe, resource_size_t addr);
 
 #endif
-- 
2.52.0

