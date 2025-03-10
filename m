Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DBC28B30
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671F10E4E0;
	Mon, 10 Mar 2025 20:07:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C913010E4E1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 20:07:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 4/8] drm/xe: Make it possible to read instance0 MCR registers
 after xe_gt_mcr_init_early
Date: Mon, 10 Mar 2025 21:06:49 +0100
Message-ID: <20250310200653.89731-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
References: <20250310200653.89731-1-dev@lankhorst.se>
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

After mcr_init_early, we need to be able to do VRAM and CCS probing
without hwconfig probe. Fortunately the relevant registers are all
instance 0, which fortunately means no dependencies on further initialization
is required.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
[mlankhorst: Fix british spelling]
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c   | 47 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 605aad3554e77..c93d401b9ee3c 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -419,12 +419,6 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
 	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
 }
 
-static void init_steering_inst0(struct xe_gt *gt)
-{
-	gt->steering[INSTANCE0].group_target = 0;	/* unused */
-	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
-}
-
 static const struct {
 	const char *name;
 	void (*init)(struct xe_gt *gt);
@@ -435,7 +429,7 @@ static const struct {
 	[DSS] =		{ "DSS",	init_steering_dss },
 	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
 	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
-	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
+	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
 };
 
@@ -445,25 +439,17 @@ static const struct {
  *
  * Perform early software only initialization of the MCR lock to allow
  * the synchronization on accessing the STEER_SEMAPHORE register and
- * use the xe_gt_mcr_multicast_write() function.
+ * use the xe_gt_mcr_multicast_write() function, plus the minimum
+ * safe MCR registers required for VRAM/CCS probing.
  */
 void xe_gt_mcr_init_early(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
 	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
 
 	spin_lock_init(&gt->mcr_lock);
-}
-
-/**
- * xe_gt_mcr_init - Normal initialization of the MCR support
- * @gt: GT structure
- *
- * Perform normal initialization of the MCR for all usages.
- */
-void xe_gt_mcr_init(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
 
 	if (IS_SRIOV_VF(xe))
 		return;
@@ -504,10 +490,27 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 		}
 	}
 
+	/* Mark instance 0 as initialized, we need this early for VRAM and CCS probe. */
+	gt->steering[INSTANCE0].initialized = true;
+}
+
+/**
+ * xe_gt_mcr_init - Normal initialization of the MCR support
+ * @gt: GT structure
+ *
+ * Perform normal initialization of the MCR for all usages.
+ */
+void xe_gt_mcr_init(struct xe_gt *gt)
+{
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	/* Select non-terminated steering target for each type */
-	for (int i = 0; i < NUM_STEERING_TYPES; i++)
+	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
+		gt->steering[i].initialized = true;
 		if (gt->steering[i].ranges && xe_steering_types[i].init)
 			xe_steering_types[i].init(gt);
+	}
 }
 
 /**
@@ -569,6 +572,10 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 
 		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
 			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
+				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
+					 "Uninitialized usage of MCR register %s/%#x\n",
+					 xe_steering_types[type].name, reg.addr);
+
 				*group = gt->steering[type].group_target;
 				*instance = gt->steering[type].instance_target;
 				return true;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e3cfb026ac88e..6612b6456c697 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -375,6 +375,8 @@ struct xe_gt {
 		u16 group_target;
 		/** @steering.instance_target: instance to steer accesses to */
 		u16 instance_target;
+		/** @steering.initialized: Whether this steering range is initialized */
+		bool initialized;
 	} steering[NUM_STEERING_TYPES];
 
 	/**
-- 
2.45.2

