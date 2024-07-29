Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE4AC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 10:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA410E183;
	Mon, 29 Jul 2024 10:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="oMBsNqmM";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F2610E183
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 10:57:49 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1722250667; bh=/nJ0RJRE1hUDuP33R2vkUcVhX8zQzBJKCd0tFJXBc/4=;
 h=From:To:Cc:Subject:Date:From;
 b=oMBsNqmMcNupcR2hY4ZE6Zuwb8J8WDVl058KgaC0qbbAs6gZ88Q9EZbV4ZhL1aQBl
 YZkK4yL8cBWUYA2KNPyM1h2TirKfxFLNTnuM+D7gzjJX3zzo1E5PCf/n1d8Vi3A0wW
 85Y4ssTFH+ell2uTClICpnyjHdqDU3DbMmWlWNf9uJuPUeMhCMC7zAM9fwX2C9f/oF
 u3vEPQm0Lb2/1AnKp2/PcKgCV4hJAH+o8Ld5hOTMDELderHl98Fq+gCdS5Zz03RipZ
 zgyw5H1L+Jt2onTw61etgA87A+nESIM5xj+QArtZ3oKDVWU2cKVfUbX1xfs4JjZ8Op
 GslNFt2N7+G1w==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 46TAvdga419909
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 13:57:39 +0300
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 46TAvdp5419908;
 Mon, 29 Jul 2024 13:57:39 +0300
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: obitton@habana.ai, kelbaz@habana.ai, Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH] drm/xe/uapi: restructure query config types in an enum
Date: Mon, 29 Jul 2024 13:57:31 +0300
Message-Id: <20240729105731.419850-1-osharabi@habana.ai>
X-Mailer: git-send-email 2.34.1
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

The config query has entries per config type.

In query_config(), an array is allocated using the last element of
the query config to dictate the array length.

Instead, a more robust approach would be to use the standard "number of
elements" last element of an enum such that one wouldn't need to modify
the ioctl each time another entry is added.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 57 ++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 73ef6e4c2dc9..aaa60ff764ee 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
+	const u32 num_params = DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
 	size_t size =
 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
 	struct drm_xe_query_config __user *query_ptr =
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 29425d7fdc77..b087789956e3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -378,6 +378,41 @@ struct drm_xe_query_mem_regions {
 	struct drm_xe_mem_region mem_regions[];
 };
 
+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+
+/**
+ * enum drm_xe_query_config_type - Supported config queries.
+ */
+enum drm_xe_query_config_type {
+	/**
+	 * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bits)
+	 * and the device revision (next 8 bits).
+	 */
+	DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
+	/**
+	 * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
+	 * configuration, see list below.
+	 *
+	 *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
+	 *      has usable VRAM
+	 */
+	DRM_XE_QUERY_CONFIG_FLAGS,
+	/**
+	 * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
+	 * required by this device, typically SZ_4K or SZ_64K.
+	 */
+	DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
+	/** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual address. */
+	DRM_XE_QUERY_CONFIG_VA_BITS,
+	/**
+	 * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the highest
+	 * available exec queue priority.
+	 */
+	DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
+	/** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of configs */
+	DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
+};
+
 /**
  * struct drm_xe_query_config - describe the device configuration
  *
@@ -385,33 +420,13 @@ struct drm_xe_query_mem_regions {
  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
  * struct drm_xe_query_config in .data.
  *
- * The index in @info can be:
- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
- *    and the device revision (next 8 bits)
- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
- *    configuration, see list below
- *
- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
- *      has usable VRAM
- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
- *    required by this device, typically SZ_4K or SZ_64K
- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
- *    available exec queue priority
+ * The index in @info are the entries in `enum drm_xe_query_config`
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
 	__u32 num_params;
-
 	/** @pad: MBZ */
 	__u32 pad;
-
-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
-#define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
-#define DRM_XE_QUERY_CONFIG_VA_BITS			3
-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

