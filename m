Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670ECD47CA4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 00:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BB410E0B4;
	Fri, 16 Jan 2026 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At4JO5Er";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7910E0B4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 00:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768523137; x=1800059137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZhN5DVhRJvRilDFkd6Rzh8ht4exCkzOSWENel/0g3FY=;
 b=At4JO5Er+/J29ggm5BaeRCNjky5sKZe/1TcjzSfHUD2mHns/l68G9Tdk
 UldEv5FGVoFYPHiha7LjpN64jFevjPQog0u9g64SwbE6Os2uVahzvirb1
 mvMRFYeJiG6KVN76QT78X4qCgqW5LPMHOYOzIaTVlih1V0nvCidpm8E2v
 NfMlkT+OHW5HQ0lBic86kMmXPCnqeaff3YbVljNK92RJ3DB4UyHH73ONS
 DAOZt9k5q7TfI4Jh2BhO0LLGRmM2xmx87X58gTKbHoKN1OJcoBmRyY76e
 IgAW1wVn7IysLfQ/M+dDXYC9jcVwvDRbcVJisnw52whWeHZ+oInq0DkK6 w==;
X-CSE-ConnectionGUID: RxhlW1sDTDy3JQ29dLafow==
X-CSE-MsgGUID: hnFlQLCUT6uXwD5IP5I+WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69737422"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69737422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 16:25:36 -0800
X-CSE-ConnectionGUID: trV7HmKQTnOz2q/cN+7n+A==
X-CSE-MsgGUID: Fc9DckJXRxCVHFKNwfl7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="209959679"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 16:25:35 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, niranjana.vishwanathapura@intel.com,
 stuart.summers@intel.com, Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Date: Fri, 16 Jan 2026 00:25:29 +0000
Message-Id: <20260116002529.951176-1-pallavi.mishra@intel.com>
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

v2: Add single helper function (Daniele)

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 56 +++++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..ec18086b98d8 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -48,6 +48,38 @@ struct g2g_test_payload  {
 	u32 seqno;
 };
 
+static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt *rx_gt)
+{
+	struct xe_device *xe = gt_to_xe(tx_gt);
+	int idx = 0, found = 0, id, tx_idx, rx_idx;
+	struct xe_gt *gt;
+	struct kunit *test = kunit_get_current_test();
+
+	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
+		gt = xe_device_get_gt(xe, id);
+		if (!gt)
+			continue;
+		if (gt == tx_gt) {
+			tx_idx = idx;
+			found++;
+		}
+		if (gt == rx_gt) {
+			rx_idx = idx;
+			found++;
+		}
+
+		if (found == 2)
+			break;
+
+		idx++;
+	}
+
+	if (found != 2)
+		KUNIT_FAIL(test, "GT index not found");
+
+	return (tx_idx * xe->info.gt_count) + rx_idx;
+}
+
 static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
 			  u32 far_tile, u32 far_dev,
 			  struct g2g_test_payload *payload)
@@ -163,7 +195,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
 		goto done;
 	}
 
-	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
+	idx = slot_index_from_gts(tx_gt, rx_gt);
 
 	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
 		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
@@ -180,13 +212,17 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
 	return ret;
 }
 
+#define G2G_WAIT_TIMEOUT_MS 100
+#define G2G_WAIT_POLL_MS 1
+
 /*
  * Send the given seqno from all GuCs to all other GuCs in tile/GT order
  */
 static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqno)
 {
 	struct xe_gt *near_gt, *far_gt;
-	int i, j;
+	int i, j, waited;
+	u32 idx;
 
 	for_each_gt(near_gt, xe, i) {
 		u32 near_tile = gt_to_tile(near_gt)->id;
@@ -205,6 +241,22 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
 			payload.rx_dev = far_dev;
 			payload.rx_tile = far_tile;
 			payload.seqno = seqno;
+
+			/* Calculate idx for event-based wait */
+			idx = slot_index_from_gts(near_gt, far_gt);
+			waited = 0;
+
+			/* Wait for previous seqno to be acknowledged before sending */
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

