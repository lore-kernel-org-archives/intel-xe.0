Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8281EC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB3F10E9CA;
	Wed, 17 Jul 2024 07:33:29 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A353310E9CB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 07:33:22 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46H7WN101135105; Wed, 17 Jul 2024 10:33:09 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 10/11] drm/xe/irq: add default msix
Date: Wed, 17 Jul 2024 10:32:22 +0300
Message-ID: <20240717073223.1135072-11-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240717073223.1135072-1-ilia.levi@intel.com>
References: <20240717073223.1135072-1-ilia.levi@intel.com>
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

From: Dani Liberman <dliberman@habana.ai>

Just like any resource, msix interrupts are limited. To support irq
requests for more than the available number of msix interrupts, we
need a default irq. Once all msix interrupts are allocated, and
allocator returns an error, it is possible to request the default
irq.

We currently set default msix to be used for all exec queues -
requesting unique msix via uapi will be exposed in a later patch.
In particular, lrc priming during probe is done with default msix.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  7 +++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 11 ++++++--
 drivers/gpu/drm/xe/xe_irq.c          | 42 ++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 890f8c101a60..f31f5ecaffd0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -318,6 +318,13 @@ struct xe_device {
 			u16 num_of_interrupts;
 			/** @irq.msix.indexes: used to allocate msix indexes */
 			struct xarray indexes;
+			/**
+			 * @irq.msix.default_msix: default MSIX to use.
+			 *
+			 * This is used when not asking for unique MSIX or when all indexes
+			 * are already allocated.
+			 */
+			u16 default_msix;
 		} msix;
 	} irq;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ae4dffe96b1b..dd813be778b6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -34,7 +34,7 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
-static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q)
+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
 {
 	u16 msix;
 	int ret = 0;
@@ -42,6 +42,11 @@ static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q
 	if (!xe_device_has_msix(xe))
 		return 0;
 
+	if (!unique_msix) {
+		q->msix_number = xe->irq.msix.default_msix;
+		return 0;
+	}
+
 	ret = xe_irq_request_irq(xe, xe_irq_msix_hwe_handler, q->hwe, q->hwe->name, true, &msix);
 	if (ret < 0) {
 		drm_dbg(&xe->drm, "Can't allocate unique MSIX to exec queue (%d)\n", ret);
@@ -60,7 +65,7 @@ static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
 	if (!xe_device_has_msix(xe))
 		return;
 
-	if (q->msix_number)
+	if (q->msix_number && q->msix_number != xe->irq.msix.default_msix)
 		xe_irq_free_irq(xe, q->msix_number);
 }
 
@@ -114,7 +119,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
-	err = xe_exec_queue_msix_init(xe, q);
+	err = xe_exec_queue_msix_init(xe, q, false);
 	if (err) {
 		kfree(q);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9eef9606f4b9..e285acd81a71 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -31,6 +31,8 @@
 #define IER(offset)				XE_REG(offset + 0xc)
 
 enum static_msix_allocations {
+	DEFAULT_MSIX,
+	/* Must be last */
 	NUM_OF_STATIC_MSIX,
 };
 
@@ -737,8 +739,48 @@ static int xe_irq_msi_request(struct xe_device *xe)
 	return 0;
 }
 
+static irqreturn_t xe_irq_default_msix_hwe_handler(int irq, void *arg)
+{
+	unsigned int tile_id, gt_id;
+	struct xe_device *xe = arg;
+	struct xe_memirq *memirq;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+
+	for_each_tile(tile, xe, tile_id) {
+		memirq = &tile->memirq;
+		if (!memirq->bo)
+			continue;
+
+		for_each_gt(gt, xe, gt_id) {
+			if (gt->tile != tile)
+				continue;
+
+			for_each_hw_engine(hwe, gt, id)
+				xe_memirq_hwe_handler(memirq, hwe);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int xe_irq_msix_request(struct xe_device *xe)
 {
+	u16 msix;
+	int err;
+
+	msix = DEFAULT_MSIX;
+	err = xe_irq_request_irq(xe, xe_irq_default_msix_hwe_handler, xe,
+				 "default_irq", false, &msix);
+	if (err) {
+		drm_err(&xe->drm, "Failed to request MSIX IRQ %d\n", err);
+		return err;
+	}
+
+	xe->irq.msix.default_msix = DEFAULT_MSIX;
+
 	return 0;
 }
 
-- 
2.43.2

