Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76614EE644A
	for <intel-xe@archiver.kernel.org>; Wed, 31 Dec 2025 23:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71B10E60C;
	Wed, 31 Dec 2025 23:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0fcd+s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69410E60C
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Dec 2025 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767223957; x=1798759957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=urZ2l318FbaVLq0TuW2cwb4uVET96+QV/9yGF9FuCgM=;
 b=M0fcd+s97WYJfo11Be9Uzsmo+NVJhOqD5/84g7ZqtWfKdscrwX9ZNiJ6
 3ACD96Jas5gstB1YZ+SJVNyIhyDYQAwIYxdMjcpHgUUH8uxDL4CfOgcI5
 R2+5EHig5+2g+wjZ4p+L8Qt5hw/K9wjnX6MzeI1eNLbFvhUYBbEg8qvS7
 sLVHuVlY26cKJFm9FBBFuAyldaElrof4jt0P2LT6cFVo3HKsn9AsDyBIp
 UZC26LwLFi7LvOKaJXKqExEYmqi5Bt8G67D25r6tLFYJvsbqdIjVlNcdS
 oRbwJpzxORVxzrSfMgXeCDPJ5yxVlU6ryys/sVM8rfvPhFb4SK6QUonY3 g==;
X-CSE-ConnectionGUID: ovrXrlSjQNeoQOXO+ZDTPA==
X-CSE-MsgGUID: rIq2N4GaT5iHkfBmBRHSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68850972"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68850972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 15:32:36 -0800
X-CSE-ConnectionGUID: Ds8xKtA8R5uKP059Y2LOBg==
X-CSE-MsgGUID: WQ6dNn0tRKSwL7OMBdddAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="205676843"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by orviesa003.jf.intel.com with ESMTP; 31 Dec 2025 15:32:35 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, niranjana.vishwanathapura@intel.com,
 stuart.summers@intel.com, Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH] drm/xe/tests: Fix g2g_test_array indexing
Date: Wed, 31 Dec 2025 23:32:30 +0000
Message-Id: <20251231233230.428953-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.34.1
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

The G2G KUnit test allocates a compact N×N
matrix sized by gt_count and verifies entries
using dense indices: idx = (j * gt_count) + i

The producer path currently computes idx using
gt->info.id. However, gt->info.id values
are not guaranteed to be contiguous.
For example, with gt_count=2 and IDs {0,3},
this formula produces indices beyond the
allocated range, causing mismatches and
potential out-of-bounds access.

Update the producer to map each GT to a dense
index in [0..gt_count-1] and compute:
    idx = (tx_dense * gt_count) + rx_dense

Additionally, introduce an event-based delay
in g2g_test_in_order() to ensure ordering
between sends.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..85e95c5f643a 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -48,6 +48,25 @@ struct g2g_test_payload  {
 	u32 seqno;
 };
 
+static int gt_index_from_id(struct xe_device *xe, int gt_id)
+{
+	int idx = 0, id;
+	struct xe_gt *gt;
+	struct kunit *test = kunit_get_current_test();
+
+	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
+		gt = xe_device_get_gt(xe, id);
+		if (!gt)
+			continue;
+		if (gt->info.id == gt_id)
+			return idx;
+		idx++;
+	}
+
+	KUNIT_FAIL(test, "Invalid index");
+	return 0;
+}
+
 static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
 			  u32 far_tile, u32 far_dev,
 			  struct g2g_test_payload *payload)
@@ -102,7 +121,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 tx_tile, tx_dev, rx_tile, rx_dev, idx, got_len;
 	struct g2g_test_payload *payload;
 	size_t payload_len;
-	int ret = 0, i;
+	int ret = 0, i, tx_idx, rx_idx;
 
 	payload_len = sizeof(*payload) / sizeof(u32);
 
@@ -163,7 +182,9 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
 		goto done;
 	}
 
-	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
+	tx_idx = gt_index_from_id(xe, tx_gt->info.id);
+	rx_idx = gt_index_from_id(xe, rx_gt->info.id);
+	idx = (tx_idx * xe->info.gt_count) + rx_idx;
 
 	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
 		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
@@ -180,6 +201,10 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
 	return ret;
 }
 
+#define G2G_WAIT_TIMEOUT_MS 100
+#define G2G_WAIT_POLL_MS 1
+
+
 /*
  * Send the given seqno from all GuCs to all other GuCs in tile/GT order
  */
@@ -187,6 +212,7 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
 {
 	struct xe_gt *near_gt, *far_gt;
 	int i, j;
+	u32 idx;
 
 	for_each_gt(near_gt, xe, i) {
 		u32 near_tile = gt_to_tile(near_gt)->id;
@@ -205,6 +231,26 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
 			payload.rx_dev = far_dev;
 			payload.rx_tile = far_tile;
 			payload.seqno = seqno;
+
+			/* Calculate idx for event-based wait */
+			int tx_idx = gt_index_from_id(xe, near_gt->info.id);
+			int rx_idx = gt_index_from_id(xe, far_gt->info.id);
+
+			idx = (tx_idx * xe->info.gt_count) + rx_idx;
+
+			/* Wait for previous seqno to be acknowledged before sending */
+			int waited = 0;
+
+			while (xe->g2g_test_array[idx] != (seqno - 1)) {
+				msleep(G2G_WAIT_POLL_MS);
+				waited += G2G_WAIT_POLL_MS;
+				if (waited >= G2G_WAIT_TIMEOUT_MS) {
+					kunit_info(test, "Timeout waiting! tx gt: %d, rx gt: %d\n",
+						   near_gt->info.id, far_gt->info.id);
+					break;
+				}
+			}
+
 			g2g_test_send(test, &near_gt->uc.guc, far_tile, far_dev, &payload);
 		}
 	}
-- 
2.34.1

