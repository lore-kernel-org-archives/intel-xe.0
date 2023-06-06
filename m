Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB0C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CC910E21E;
	Tue,  6 Jun 2023 11:07:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578710E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049665; x=1717585665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DArRHhTmfAEzLE0oMHgEiTj8JpjiZl4DpHXGpCz3Sws=;
 b=Jwk8cwgRrvFPHdyx6MYLmfXydoHk/j20WVd+mxDU4rxD+dyn+Vy8j4TS
 /sr0HH0bQWZbYaU2QFliRi+OV8ehKZXIlSefqQK1mgzQZHfTRV9TWkkAV
 WFC1PlCe5r4KanOQI/YRqhasAQ5kFaRQ/s4QafLhZcyfRma68bT1cEmL0
 DsKii21omsll2zJYSRNO470Sz/6ceMPl8/oPHp2Kgyv5ByK/vCUaEzvyM
 tpOQ4hGAIP5E0oTV8JHTzaSaSo/oxst5lkldABkeLizsGdjYvpXb37vtA
 A3S5/3ZAhlUYoZpaa+i3pu5OAHCkVUdlyg/x62S81Zk/nUOAWueLhq2OW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443013975"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443013975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955711832"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955711832"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 04:07:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:42:55 +0530
Message-Id: <20230606111255.2072426-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per tile
 memory size
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

Add sysfs entry to read per tile physical memory
including stolen memory.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++
 drivers/gpu/drm/xe/xe_mmio.c         |  1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47 ++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index db61da4d6212..7b5443aebd00 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,11 @@ struct xe_tile {
 
 	/** @mem: memory management info for tile */
 	struct {
+		/**
+		 * @actual_physical_mem: Track actual LMEM size
+		 * including stolen mem for tile
+		 */
+		resource_size_t actual_physical_mem;
 		/**
 		 * @vram: VRAM info for tile.
 		 *
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 475b14fe4356..86a7c65c301f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		if (err)
 			return err;
 
+		tile->mem.actual_physical_mem = tile_size;
 		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
 		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 821bd49de277..d48c599e8cc1 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+typedef ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf);
+
+struct xe_ext_attr {
+	struct device_attribute attr;
+	show xe_show;
+};
+
+	static ssize_t
+xe_sysfs_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	ssize_t value;
+	struct xe_ext_attr *ea = container_of(attr, struct xe_ext_attr, attr);
+
+	value = ea->xe_show(dev, attr, buf);
+
+	return value;
+}
+
+	static ssize_t
+addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
+}
+
+#define XE_DEVICE_ATTR_RO(_name, _show) \
+	struct xe_ext_attr dev_attr_##_name = \
+{ __ATTR(_name, 0444, xe_sysfs_show, NULL), _show}
+
+static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
+
+static const struct attribute *addr_range_attrs[] = {
+	&dev_attr_addr_range.attr.attr,
+	NULL
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kg->base;
 
+	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
+		drm_err(&tile_to_xe(tile)->drm,
+			"Setting up sysfs to read total physical memory per tile failed\n");
+		goto err_object;
+	}
+
 	err = drmm_add_action_or_reset(&tile_to_xe(tile)->drm, tile_sysfs_fini, tile);
 	if (err)
 		return err;
 
+	if (0) {
+err_object:
+		kobject_put(&kg->base);
+	}
 	return 0;
 }
-- 
2.25.1

