Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCDCC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938510E9B8;
	Thu, 11 Jul 2024 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSo750wQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224AD10E9B8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689225; x=1752225225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxHq5T88ZRIzoXRYVpWl1DNJ31T8RY7l63N53FjOQas=;
 b=CSo750wQCJITLqzUoM1oY7Y3gZSlEslRECAY32pteTAZyFlqa2u2LxCG
 656Jk2QuK6Fxw04VzCpyJJhUqgYb+MUyvQj9wY97ebcyWVtgT5mNqVZXT
 Wwbxg9FQbsAgYLFk4xpcCk/bguZz6Xt8znv4k0KcnsQ3mM+YmdZu5fBGO
 pbSfMmZuBxFCqRQYxBWK+KWXJfzfIiuGEoyaG2xE+BVZ50zkvc7jfVK+X
 2G3dcyC+NkkQ0QfSO0pIS1X4dzjZhr/jyqFkniTmgu5jWJ+uiL/iudo1L
 cFbER1A1WPNFlmpnTPPVo8w+Uw5tnRGDZ6tt14xlSXrhL4y00dTLsTNH3 w==;
X-CSE-ConnectionGUID: DqwQ5UhQTKyIs9FXK+YpCw==
X-CSE-MsgGUID: U919tvGbQVOu/vIEsQnfQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495470"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP; 11 Jul 2024 02:09:40 -0700
X-CSE-ConnectionGUID: tldNrgdjR2a7QgPImvbG8A==
X-CSE-MsgGUID: PjYUtdkJTY+9WKkAjw2jkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48467868"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:09:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Expose display alignment requirement
Date: Thu, 11 Jul 2024 11:09:24 +0200
Message-Id: <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
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

Scanout buffer on Battlemage requires allocation in 64K contigues
pages to support Tile4 + compression what differs from normal bo
requirements. Expose display alignment configuration to userspace
to ensure it will properly align requested memory.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 +++-
 include/uapi/drm/xe_drm.h     | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4e01df6b1b7a..c32894f3eea1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
+	const u32 num_params = DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT + 1;
 	size_t size =
 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
 	struct drm_xe_query_config __user *query_ptr =
@@ -342,6 +342,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
+	config->info[DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT] =
+		xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K ? SZ_64K : SZ_4K;
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..c7a930dbf58c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -398,6 +398,8 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
+ *  - %DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT - Alignment of contigous physical
+ *    memory allocation required by the display, typically SZ_4K or SZ_64K
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -412,6 +414,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
+#define DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT		5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

