Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B32C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 13:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BAA10E453;
	Mon, 24 Apr 2023 13:05:27 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191810E4F0
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 13:05:26 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 15:05:17 +0200
Message-Id: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fixup small bug in xe_de.h
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

In display it's not called from irq context, so use xe_mmio_wait32 with
atomic = false. This fixes a splat and the need for i915_utils.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/245
---
 drivers/gpu/drm/xe/display/xe_de.h | 5 +++--
 scripts/package/buildtar           | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 000379f8702e..0c76b0d24d96 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -70,8 +70,9 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			     unsigned int fast_timeout_us,
 			     unsigned int slow_timeout_ms, u32 *out_value)
 {
-	return wait_for_atomic(((*out_value = xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
-			slow_timeout_ms);
+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
+			      fast_timeout_us + 1000 * slow_timeout_ms,
+			      out_value, false);
 }
 
 static inline int
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 65b4ea502962..fee5b9d3b171 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -51,7 +51,7 @@ fi
 #
 cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
 cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
-cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+#cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 
 
 #
-- 
2.34.1

