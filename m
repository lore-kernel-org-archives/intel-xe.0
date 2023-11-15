Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C08C54F89
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1310E010;
	Wed, 15 Nov 2023 14:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F8C10E010
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700059131; x=1731595131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yfupK3N6qqNtFO94qWdTx4iuxs+0KwIFWUqUalD+cmk=;
 b=Hxo0QoYwra3sIIEodwH68SjXFpsHXu5yEiKmNPCBxIEjlwAU/mDT2oxc
 cEuanDOMklpziB3a8no7lDMAksRf33IJuECugAtonDZISLZhzHjT5/4lA
 5EnvBVxVb4ZwiLdgIM14fwq4lvzs6R0T5x7u7zhILW+xrrjEOVrfQxoha
 E4s5/qSXRcxIEK8DRDCykKC10OFdiGCm5oney4xRpS780nQHXgjARAdVX
 3g5UKOhBXS9Ml5ypJ336R70r2LccatYny+2tAUJKkdseJzSMLvwPaeGGq
 cv2K1JkPAx5OIbS2szwo9ZBbSWiJAH6xBFwgZeNGeA6f7VnNOqBSqweii Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370231000"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370231000"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830964685"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="830964685"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:49 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 15:38:35 +0100
Message-Id: <20231115143838.2081-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Introduce dedicated function to read
 fuse registers
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

Fuse registers are not very special and usually could be read
directly using ordinary xe_mmio_read32(), except when driver is
running as VF, where those registers will not be exposed by the
HW and other mechanism must be used to obtain fuse values.

Define dedicated helper that we will in the driver to access fuse
registers and that we will later update it with VF specific code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..5a7e174ffbb6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -141,4 +141,9 @@ int xe_mmio_probe_vram(struct xe_device *xe);
 int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 
+static inline u32 xe_mmio_fuse_read32(struct xe_gt *gt, struct xe_reg reg)
+{
+	return xe_mmio_read32(gt, reg);
+}
+
 #endif
-- 
2.25.1

