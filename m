Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C0FC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38310F1CF;
	Fri, 31 Mar 2023 10:24:33 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE710F1CB
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:31 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 12:24:19 +0200
Message-Id: <20230331102419.521392-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: Fixup __intel_de_wait_for_register
 macro.
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

Create a dummy when output reg is null, this is required for the changes
to MTL display support.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_de.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 9f92fdb4159a..ce42e2938a06 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -70,6 +70,10 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			     unsigned int fast_timeout_us,
 			     unsigned int slow_timeout_ms, u32 *out_value)
 {
+	u32 dummy;
+	if (!out_value)
+		out_value = &dummy;
+
 	return wait_for_atomic(((*out_value = xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
 			slow_timeout_ms);
 }
-- 
2.34.1

