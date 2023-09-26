Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04EE7D27C
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC7610E3A3;
	Tue, 26 Sep 2023 10:39:24 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4765D10E39D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:39:10 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695724654; bh=p8/VELCoOdLldQtzPDpfwGpmxzZPvhBmy4bBantzlzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oK2MkvVTiD0cZW6vQ4E1E/0U0jIsyHixbhiZPG0JkKAUkNB14JnaM6mR52W4X0+A5
 kRAko/oxjkuO7H34W/ZutLaQ37nRupRZUwiywqpz+mTDt81pTEYa5Ja/iqI+ic5UM5
 Ogi38mJ/kLAsy7WgYfWAelYbKpea0kiDAQumGXMAS41ZPp0c28CYcH/8KC34rezAO/
 9BIVze3mOLmcT2HvMVqBg7zuBAgft8xpyOn022G30mE62aZEf/8H/mHW6RtFAf3yJA
 ylnFoRH8A0rFHiemgIvIozUAdujpwfRH13wIYk7CvL+Gh3r/6o+i+a5xOo7FCXq1+B
 Dm8i7oYaWjS2g==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38QAcmdE1200229; Tue, 26 Sep 2023 13:38:59 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:38:43 +0300
Message-Id: <20230926103848.1200206-2-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926103848.1200206-1-kelbaz@habana.ai>
References: <20230926103848.1200206-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] drm/xe: add 28-bit address support in
 struct xe_reg
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe driver currently supports 22-bit addresses for MMIO access.
Future platforms will have additional MMIO extension with
larger address spaces, and to access them, the driver will
have to support wider address representation.
Please note that while the XE_REG macro is used for MMIO access,
XE_REG_EXT macro will be used for MMIO-extension access.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 13 +++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 557a1cd65531..6e20fc2de9ff 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -19,7 +19,7 @@ struct xe_reg {
 	union {
 		struct {
 			/** @addr: address */
-			u32 addr:22;
+			u32 addr:28;
 			/**
 			 * @masked: register is "masked", with upper 16bits used
 			 * to identify the bits that are updated on the lower
@@ -35,6 +35,10 @@ struct xe_reg {
 			 * value can inspect it.
 			 */
 			u32 mcr:1;
+			/**
+			 * @ext: access MMIO extension space for current register.
+			 */
+			u32 ext:1;
 		};
 		/** @raw: Raw value with both address and options */
 		u32 raw;
@@ -84,6 +88,16 @@ struct xe_reg_mcr {
  */
 #define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
 
+/**
+ * XE_REG_EXT - Create a struct xe_reg from extension offset and additional
+ * flags
+ * @r_: Register extension offset
+ * @...: Additional options like access mode. See struct xe_reg for available
+ *       options.
+ */
+#define XE_REG_EXT(r_, ...)	\
+	((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .ext = 1))
+
 /**
  * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
  * @r_: Register offset
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32ab0fea04ee..cc48cd9c9a32 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -144,6 +144,19 @@ struct xe_tile {
 		void *regs;
 	} mmio;
 
+	/**
+	 * @mmio_ext: MMIO-extension info for a tile.
+	 *
+	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
+	 */
+	struct {
+		/** @size: size of tile's additional MMIO-extension space */
+		size_t size;
+
+		/** @regs: pointer to tile's additional MMIO-extension space */
+		void *regs;
+	} mmio_ext;
+
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-- 
2.34.1

