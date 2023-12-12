Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EDBC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7210E695;
	Tue, 12 Dec 2023 21:01:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F259510E685
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414874; x=1733950874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zAcG2UYfrvOOxbhbG2lWeYirBgWlOUqhZLmpTdy/NWY=;
 b=LiXpXZ59OXE57s9zjdhLxFVK7/pwOg8ErGnxiEQ/u7Nb7hEz3Nvc15b6
 epBTg2JWktaOMiUklN0YrYK1izivMmfnRpfOhcELZfzJLY0cYUVAvEkH0
 fLY9+p0p4VbkD2xLNlqZBFdor1ezSsZKrxS3l6dF+yHmjOZSlUQHQQQuo
 aiTZ429t2PW6os8H56kD702oD++RPMvSDfmknaZLnehAWGsR2RPmeP+0U
 xQFhSQHfnqcDvQb9RHBiNnu+KIBNMwyi95L9mxx8oJUl6sKPAXiSJkmHZ
 XXPrRt3OlBwqmfaLOEamRGJfOs3XqgDF3pYSEh4KSPcXr5lBz4V3+x9iv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654575"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654575"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417144"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417144"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/10] drm/xe: Add device flag for memory based IRQ support
Date: Tue, 12 Dec 2023 22:00:45 +0100
Message-Id: <20231212210054.1747-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

The register based interrupts infrastructure does not scale
efficiently to allow delivering interrupts to a large number
of virtual machines. Memory based interrupt reporting provides
an efficient and scalable infrastructure.

Define device flag to indicate which platforms will use memory
based interrupts for delivering interrupts to VFs.

Bspec: 50829
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 3da83b233206..0b158d0d04e4 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -168,6 +168,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 	return xe->info.has_sriov;
 }
 
+static inline bool xe_device_has_memirq(struct xe_device *xe)
+{
+	return xe->info.has_memirq;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1a48456e9a3..0c48e3686837 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -259,6 +259,8 @@ struct xe_device {
 		u8 has_flat_ccs:1;
 		/** @has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
+		/** @has_memirq: Using memory based IRQ */
+		u8 has_memirq:1;
 		/** @has_mmio_ext: Device has extra MMIO address range */
 		u8 has_mmio_ext:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 260e8a6034a7..11559669cb8a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -64,6 +64,7 @@ struct xe_device_desc {
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
 	u8 has_llc:1;
+	u8 has_memirq:1;
 	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
 	u8 skip_guc_pc:1;
@@ -551,6 +552,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_memirq = desc->has_memirq;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
-- 
2.25.1

