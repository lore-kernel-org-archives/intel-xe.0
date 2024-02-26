Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF93C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1AD10E7A5;
	Mon, 26 Feb 2024 16:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nv9x7Db5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF110E800
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708965925; x=1740501925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5AhVYXZT6jTlT72F25tZs8I6MqSbJPAz68alkoB9Vg=;
 b=Nv9x7Db59SKZ5RJGiGJCgOgWR2Ecg2GQwVlbCmy4esqsUoqYVMMqoXb2
 ZTpU/8XNcmciHBMnQfkFeW12NpPm26rUy+trzmkKLJR/9RPtI7U1YqzXJ
 P372LlTPEqgAu1DhZEbAS1rwmPRTDWTmDuSKlI6vWFiTtq4RGuiM6T0k3
 +SSjc6ESrTFpsJo+pJ3FhAKe7/j8qr4ODU55puZ/msqIXeP9GRNvIHDMQ
 HsQuYZVF7Qjbt0C240Q1IqfQtv7LYKoMfpSIIEt26TfcM6kR9W3lk1hX2
 aBRhthPA+vohSAME3FjUTWC+U4xIJScnnQhjN/EKLEJwNkXWBm2X6rAbe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25730065"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="25730065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6751902"
Received: from shunter1-mobl.ger.corp.intel.com (HELO fedora..) ([10.252.3.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:12 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 3/3] drm/xe/bo: Allow migrating local bos to TT to make room
 in VRAM
Date: Mon, 26 Feb 2024 17:44:55 +0100
Message-ID: <20240226164455.10179-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
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

If VRAM is full and we want to evict local bos we can't typically
do that, since we require all local bos to be residient at
execution time.
But we're allowed to migrate to TT if that's a valid placement
for GPU access, so in that case, do that.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2931b9030503..21141f877850 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1049,6 +1049,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+/*
+ * Does @bo have @mem_type as an allowed placement?
+ */
+static bool xe_bo_may_reside_in(const struct xe_bo *bo, unsigned int mem_type)
+{
+	const struct ttm_placement *placement = &bo->placement;
+	unsigned int i;
+
+	for (i = 0; i < placement->num_placement; ++i) {
+		if (placement->placement[i].mem_type == mem_type)
+			return true;
+	}
+	return false;
+}
+
 static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 				    const struct ttm_place *place)
 {
@@ -1061,6 +1076,10 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 			/* Not bound to the vm? */
 			if (list_empty(&ttm_bo->base.gpuva.list))
 				goto allow;
+			/* Is the bo gpu accessible even if placed in TT? */
+			if (ttm_bo->resource && ttm_bo->resource->mem_type !=
+			    XE_PL_TT && xe_bo_may_reside_in(xe_bo, XE_PL_TT))
+				goto allow;
 			return false;
 		}
 	}
-- 
2.43.0

