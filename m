Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5AC77B78
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE02610E7CE;
	Wed, 19 Apr 2023 07:45:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6910E8E3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890298; x=1713426298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GArDYv8z5gPE348YUGb9rY7IgtAdmPfuZS+FXSGmQJY=;
 b=XIE1pCbfvAV4zL1PVY6C+ZUhfflb1docah9ZS398cW1FObaeMAWxlWpv
 D+B7EtXCZkvHirtbjl5IxthczifTVdYituDqIoO+1jFGNtcewmPiLoBta
 QohX98ug/BrCi94untFSqr+WCzJjkRqGTqDxZaix4NSVg+n6ulOBEP91H
 3u51oa0MUaIxUJZXoCniNaSgTkDVDLjY7OyRkUbrdhfpaXmuCJDPgq07G
 /8gamDZgsMVxQ3izNTYKxmNOp7ocEQCxeV4IWBuZSC1DSak7bUBghrIgO
 SIXEFiNR1cs5/fD5Ti30ZjgQeJgH5ntqCNTAIOYWHhkS+eUkYcBzFtpKR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186121"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186121"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951896"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951896"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:34 -0700
Message-Id: <20230419074440.4006398-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Stop using i915 types for register our own xe_reg_t. Differently from
i915, this will keep under this will keep under the register definition
the knowledge for the different types of registers. For now, the "flags"
are mcr and masked, although only the former is being used.

Most of the driver is agnostic to the register differences. Convert the
few places that care about that, namely xe_gt_mcr.c, to take the generic
type and warn if the wrong register is used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
 drivers/gpu/drm/xe/xe_irq.c           |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
 5 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index b5c25e31b889..1e78508c737b 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -8,4 +8,19 @@
 
 #include "compat-i915-headers/i915_reg_defs.h"
 
+typedef union {
+	struct {
+		u32 reg:30;
+		u32 mcr:1;
+		u32 masked:1;
+	};
+	u32 raw;
+} xe_reg_t;
+
+/* TODO: remove these once the register declarations are not using them anymore */
+#undef _MMIO
+#undef MCR_REG
+#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
+#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index aa04ba5a6dbe..b9631cfd5b81 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
  * returned.  Returns false if the caller need not perform any steering
  */
 static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
-						 i915_mcr_reg_t reg,
+						 xe_reg_t reg,
 						 u8 *group, u8 *instance)
 {
 	const struct xe_mmio_range *implicit_ranges;
 
+	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
+
 	for (int type = 0; type < IMPLICIT_STEERING; type++) {
 		if (!gt->steering[type].ranges)
 			continue;
@@ -436,11 +438,13 @@ static void mcr_unlock(struct xe_gt *gt) {
  *
  * Caller needs to make sure the relevant forcewake wells are up.
  */
-static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
+static u32 rw_with_mcr_steering(struct xe_gt *gt, xe_reg_t reg, u8 rw_flag,
 				int group, int instance, u32 value)
 {
 	u32 steer_reg, steer_val, val = 0;
 
+	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
+
 	lockdep_assert_held(&gt->mcr_lock);
 
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
@@ -494,12 +498,14 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
  *
  * Returns the value from a non-terminated instance of @reg.
  */
-u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
+u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg)
 {
 	u8 group, instance;
 	u32 val;
 	bool steer;
 
+	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
+
 	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
 
 	if (steer) {
@@ -525,11 +531,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
  * group/instance.
  */
 u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
-			   i915_mcr_reg_t reg,
+			   xe_reg_t reg,
 			   int group, int instance)
 {
 	u32 val;
 
+	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
+
 	mcr_lock(gt);
 	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
 	mcr_unlock(gt);
@@ -548,9 +556,11 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
  * Write an MCR register in unicast mode after steering toward a specific
  * group/instance.
  */
-void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
+void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
 			     int group, int instance)
 {
+	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
+
 	mcr_lock(gt);
 	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
 	mcr_unlock(gt);
@@ -564,7 +574,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
  *
  * Write an MCR register in multicast mode to update all instances.
  */
-void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
+void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value)
 {
 	/*
 	 * Synchronize with any unicast operations.  Once we have exclusive
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 2a6cd38c8cb7..492d9519784a 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -15,13 +15,13 @@ void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
 
-u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
+u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, xe_reg_t reg,
 			   int group, int instance);
-u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
+u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg);
 
-void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
+void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
 			     int group, int instance);
-void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
+void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 13f9f220bca0..8e5f8e7c16c8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -27,7 +27,7 @@
 #define IIR(offset)				_MMIO(offset + 0x8)
 #define IER(offset)				_MMIO(offset + 0xc)
 
-static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
+static void assert_iir_is_zero(struct xe_gt *gt, xe_reg_t reg)
 {
 	u32 val = xe_mmio_read32(gt, reg.reg);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index a93838e23b7b..1029b9f27988 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -397,7 +397,7 @@ int xe_mmio_init(struct xe_device *xe)
 	DRM_XE_MMIO_READ |\
 	DRM_XE_MMIO_WRITE)
 
-static const i915_reg_t mmio_read_whitelist[] = {
+static const xe_reg_t mmio_read_whitelist[] = {
 	RING_TIMESTAMP(RENDER_RING_BASE),
 };
 
-- 
2.39.0

