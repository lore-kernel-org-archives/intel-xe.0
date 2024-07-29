Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F05C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 12:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30710E05A;
	Mon, 29 Jul 2024 12:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="UG6iwaHx";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918F410E3A4
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 12:15:40 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1722255339; bh=vm8ZzAoYfVtn2ZJZ+MUEu9Nk+GL2VCYR8sFgwXWv2xY=;
 h=From:To:Cc:Subject:Date:From;
 b=UG6iwaHxZuTXSiUS5CfLXxdj4KLtSczK/rH0XLW6yvQ5lHKxqDTgPtYOaEtF/A89+
 8YuypD29OpQ6H39C0jIK1EhNpXCF5CQGmEj/ycDXmBfQi8GRQyPD1iL/tXsP8yK75R
 NgqSYopH7Fg3hvqfw06STfZEW4LKqc4WNx4yxec+TXWcBvNA+/zH13Zzu2BuTj6zt7
 mMezH4ovxcgdv1gn7a1+44UOrC1G08bCXhaLhWeetnylRDpnLh0EbXcAI6NlCczIe0
 FL2wi2EzMoNhbNC65CdEaqNToI55r9U7hJtZHXF1XxXH4QylrvJArcuOabyrdSCvDe
 7Rnw8DeCMiDxg==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 46TCFSuX448224
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 15:15:28 +0300
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 46TCFSVd448223;
 Mon, 29 Jul 2024 15:15:28 +0300
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: obitton@habana.ai, kelbaz@habana.ai, gustavo.sousa@intel.com,
 Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
Date: Mon, 29 Jul 2024 15:15:26 +0300
Message-Id: <20240729121526.448199-1-osharabi@habana.ai>
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

v2:
 - modify `enum drm_xe_query_config_type` doc

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 22 deletions(-)

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
index 29425d7fdc77..9222563cddc3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
 	struct drm_xe_mem_region mem_regions[];
 };
 
+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+
+/**
+ * enum drm_xe_query_config_type - Indices for the supported configs returned
+ * in &drm_xe_query_config.info array
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
@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
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

