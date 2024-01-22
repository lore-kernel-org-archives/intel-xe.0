Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB86C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD4410EEE8;
	Mon, 22 Jan 2024 21:17:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A9810EF8A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958248; x=1737494248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rlj5BeaEfivBbDitJLtFgWapao+SV01gkIynPF8gRGU=;
 b=aoJ2V5Ku9kXjPWyyoyFUqScfJBuZsd+cRUPIWPiGf+yZMeHmNDyGlIkm
 ZwqcfUIsRigiSJZM6eiAj2/jQcWTTCnStUWn396gv1Clfecqvb1qfU6qE
 rVAqby8wfIwNAL6FcjM8Y6g7lI8e7NFiuL2qcHY4DOZgeSVQI2ONePT6D
 FqDAlsu8QvJt5cScHksX3C/QrMNWm905GHPL8kUNYOdZw2qyhslx9Pwdp
 rXCy1pShWt+3h2Q24us4BqpnYVqSU0+h6TAuMbHzz3EGMDdBMsUCmHsC0
 yDCASUO0yC2JEYR4QoAgqDUQs28xqUZFMdhVbg/rbQv+PTdaIBv94HjAp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432486569"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432486569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27495072"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:27 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/xe: Print more device information in devcoredump
Date: Mon, 22 Jan 2024 13:17:07 -0800
Message-ID: <20240122211709.224419-7-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122211709.224419-1-jose.souza@intel.com>
References: <20240122211709.224419-1-jose.souza@intel.com>
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To properly decode batch buffer Mesa tools needs to know what
platform is this one, for now we can do that with PCI id but
already making it future proof by also printing GTs GMD version.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 ++
 drivers/gpu/drm/xe/xe_device.c      | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h      |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a0e3732440ab5..6759728c2220e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -63,6 +63,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = coredump_to_xe(coredump);
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
@@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b4cdcf1b2081a..5ee78183d6c04 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -742,3 +742,23 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(highest_address_bit_get(xe), 0);
 }
+
+void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	drm_printf(p, "PCI ID: 0x%04x\n", xe->info.devid);
+	drm_printf(p, "PCI revision: 0x%02x\n", xe->info.revid);
+
+	for_each_gt(gt, xe, id) {
+		drm_printf(p, "GT id: %u\n", id);
+		drm_printf(p, "\tType: %s\n",
+			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
+		drm_printf(p, "\tIP ver: %u.%u.%u\n",
+			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
+			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
+			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
+		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index ce20f6fe6219a..6212517328477 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,4 +178,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
+
 #endif
-- 
2.43.0

