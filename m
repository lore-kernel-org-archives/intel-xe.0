Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645C0C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8D410ECA2;
	Mon, 22 Jan 2024 17:05:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB87010ECA3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943109; x=1737479109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WUGOfwH4Zcc8frVHE9c9dcIJ4xfl+JSq2sHBMDLrFtQ=;
 b=iB1ftPhytoX2sRrp+RieZR5WAPC+Nb6uSKf4YjagCIhL4E5Qww6hEv4N
 DE+tSNIwdXvMEavtNF8/oOznYNx2P0AtcweUeuI7L4uz9UWVqUSBDYmxD
 ENzCvDtwY5gVg1sWf0foy+gdfy9w9R1ZDqOryh1SULFLU55mVdM+J8BGo
 pPzSGu7YuwC6tql10DJhIptnbGfZpxQkKeP6StcgDyQmJfZiNbyz1mcK3
 e+UgOY199768kgD6NJDlungalrypYN0QxHO2R9A7IanVVlYq0vc92vLnU
 GHtUDz08YluDw6Hs3Aws8yparofA7b3CwuUbaDcnDKNX3sU9Zk3gNwFxi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020241"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228359"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228359"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:06 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm/xe: Print more device information in devcoredump
Date: Mon, 22 Jan 2024 09:04:43 -0800
Message-ID: <20240122170445.108856-7-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
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
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 ++
 drivers/gpu/drm/xe/xe_device.c      | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h      |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a0e3732440ab5..43b66ca710f85 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -63,6 +63,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = devcoredump_to_xe_device(coredump);
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
index b4cdcf1b2081a..e0136e7d5ae52 100644
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
+		drm_printf(p, "\tCS timestamp frequency: %u\n", gt->info.reference_clock);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 781a1aa164ecf..7df7cce218770 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -183,4 +183,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
+
 #endif
-- 
2.43.0

