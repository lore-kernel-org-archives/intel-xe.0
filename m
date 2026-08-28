Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F693C61DD6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 19:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE710E087;
	Fri, 28 Aug 2026 19:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3Ba8y/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C263210E045;
 Fri, 28 Aug 2026 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787944212; x=1819480212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7fNQR/deCAygGZx/EESpH18uyO4k8ry1m0yhjP1PRBU=;
 b=e3Ba8y/iGD+QtDlp0I/TfzXljQWV9ZfwdrEkKpyqBvEo0NCe5wBGEAmX
 2qXeO9jBlnTNc08NU6qPgetUI0sJyWP63YUz5JF+MAMgnumCLv0PPzh4B
 KlHG2bNppUo5v1s7cfAgnDVR0a11jfXBsxbooM84lRwoAYE1HQsu34fPB
 vx4+T+ZEsIE0KIgtTFHaFlPjTA4Y3sLZ1qRzyePTCkLDQvH9YOk6/Zxl4
 ekJHQRHJNs3T6wnvA0viNWxCGtSCs6TCLrYaoKI98BYhwRAsZhp+3Sk7V
 bt1YaXSkQmcjrwdvtCOU/zFGQBeJ08v7MrJFisna42NHKbHNO53YivJhu g==;
X-CSE-ConnectionGUID: 7K/4lYQ2Q+661D9lfaKl9A==
X-CSE-MsgGUID: eoWfy3tjQa2B66LCt2K9pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92324714"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="92324714"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:10:12 -0700
X-CSE-ConnectionGUID: fuo9IakKTXSXqCSvvuuT+g==
X-CSE-MsgGUID: 5Vu4Y8PQTBOBn4xYP+byEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="271758111"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 12:10:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v5 1/2] drm/i915/pcode: rename GEN6_PCODE_DATA to match spec
Date: Fri, 28 Aug 2026 21:09:55 +0200
Message-ID: <20260828190956.2622350-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260828190956.2622350-1-michal.grzelak@intel.com>
References: <20260828190956.2622350-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Variable naming of val and val1 should match register macro naming.
Historically, corresponding macros were named GEN6_PCODE_DATA and
GEN6_PCODE_DATA1.

Rename register macro GEN6_PCODE_DATA to GEN6_PCODE_DATA0 since spec
appended '0' to the register name. Rename val into val0 in functions
declaring val1 for both i915-specific and shared display code.

v4->v5
- clean changelog's versioning

v3->v4
- split i915 changes from xe (Jani)
- apply the rename to the read()'s signature as well (Sashiko)

v2->v3
- resolve conflict from rebase

v1->v2
- rebase onto drm-tip (Jani)

Bspec: 19978
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_parent.c  |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h  |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c          |  2 +-
 drivers/gpu/drm/i915/i915_reg.h              |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c  |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c           | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h           |  2 +-
 include/drm/intel/display_parent_interface.h |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index ffc1f5e0518cd..99cebb17763ac 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -281,9 +281,9 @@ void intel_parent_pc8_unblock(struct intel_display *display)
 }
 
 /* pcode */
-int intel_parent_pcode_read(struct intel_display *display, u32 mbox, u32 *val, u32 *val1)
+int intel_parent_pcode_read(struct intel_display *display, u32 mbox, u32 *val0, u32 *val1)
 {
-	return display->parent->pcode->read(display->drm, mbox, val, val1);
+	return display->parent->pcode->read(display->drm, mbox, val0, val1);
 }
 
 int intel_parent_pcode_write_timeout(struct intel_display *display, u32 mbox, u32 val, int timeout_ms)
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index c817a826169c2..cc4a58f631663 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -115,7 +115,7 @@ void intel_parent_pc8_block(struct intel_display *display);
 void intel_parent_pc8_unblock(struct intel_display *display);
 
 /* pcode */
-int intel_parent_pcode_read(struct intel_display *display, u32 mbox, u32 *val, u32 *val1);
+int intel_parent_pcode_read(struct intel_display *display, u32 mbox, u32 *val0, u32 *val1);
 int intel_parent_pcode_write_timeout(struct intel_display *display, u32 mbox, u32 val, int timeout_ms);
 int intel_parent_pcode_write(struct intel_display *display, u32 mbox, u32 val);
 int intel_parent_pcode_request(struct intel_display *display, u32 mbox, u32 request,
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 9f61867e24781..22dd0179863ee 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1706,7 +1706,7 @@ static int mailbox_write(struct intel_vgpu *vgpu, unsigned int offset,
 {
 	u32 value = *(u32 *)p_data;
 	u32 cmd = value & 0xff;
-	u32 *data0 = &vgpu_vreg_t(vgpu, GEN6_PCODE_DATA);
+	u32 *data0 = &vgpu_vreg_t(vgpu, GEN6_PCODE_DATA0);
 
 	switch (cmd) {
 	case GEN9_PCODE_READ_MEM_LATENCY:
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 64e906380131a..d873072b7a92e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -697,7 +697,7 @@
 #define    EDRAM_WAYS_IDX(cap)			(((cap) >> 5) & 0x7)
 #define    EDRAM_SETS_IDX(cap)			(((cap) >> 8) & 0x3)
 
-#define GEN6_PCODE_DATA				_MMIO(0x138128)
+#define GEN6_PCODE_DATA0			_MMIO(0x138128)
 #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
 #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
 #define GEN6_PCODE_DATA1			_MMIO(0x13812C)
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index de118fae0a497..25b72b20e709c 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -611,7 +611,7 @@ static int iterate_generic_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(GEN6_UCGCTL1);
 	MMIO_D(GEN6_UCGCTL2);
 	MMIO_F(_MMIO(0x4f000), 0x90);
-	MMIO_D(GEN6_PCODE_DATA);
+	MMIO_D(GEN6_PCODE_DATA0);
 	MMIO_D(_MMIO(0x13812c));
 	MMIO_D(GEN7_ERR_INT);
 	MMIO_D(HSW_EDRAM_CAP);
diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
index c07d48fc1b355..1c9d1f4137570 100644
--- a/drivers/gpu/drm/i915/intel_pcode.c
+++ b/drivers/gpu/drm/i915/intel_pcode.c
@@ -58,7 +58,7 @@ static int gen7_check_mailbox_status(u32 mbox)
 }
 
 static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
-			  u32 *val, u32 *val1,
+			  u32 *val0, u32 *val1,
 			  int fast_timeout_us, int slow_timeout_ms,
 			  bool is_read)
 {
@@ -73,7 +73,7 @@ static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
 		return -EAGAIN;
 
-	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
+	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA0, *val0);
 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
 	intel_uncore_write_fw(uncore,
 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
@@ -87,7 +87,7 @@ static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
 		return -ETIMEDOUT;
 
 	if (is_read)
-		*val = intel_uncore_read_fw(uncore, GEN6_PCODE_DATA);
+		*val0 = intel_uncore_read_fw(uncore, GEN6_PCODE_DATA0);
 	if (is_read && val1)
 		*val1 = intel_uncore_read_fw(uncore, GEN6_PCODE_DATA1);
 
@@ -97,12 +97,12 @@ static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
 		return gen6_check_mailbox_status(mbox);
 }
 
-int snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val, u32 *val1)
+int snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val0, u32 *val1)
 {
 	int err;
 
 	mutex_lock(&uncore->i915->sb_lock);
-	err = __snb_pcode_rw(uncore, mbox, val, val1, 500, 20, true);
+	err = __snb_pcode_rw(uncore, mbox, val0, val1, 500, 20, true);
 	mutex_unlock(&uncore->i915->sb_lock);
 
 	if (err) {
@@ -278,11 +278,11 @@ int snb_pcode_write_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u3
 	return err;
 }
 
-static int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
+static int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val0, u32 *val1)
 {
 	struct drm_i915_private *i915 = to_i915(drm);
 
-	return snb_pcode_read(&i915->uncore, mbox, val, val1);
+	return snb_pcode_read(&i915->uncore, mbox, val0, val1);
 }
 
 static int intel_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
diff --git a/drivers/gpu/drm/i915/intel_pcode.h b/drivers/gpu/drm/i915/intel_pcode.h
index 19795ea8172e7..deecc64bc1b36 100644
--- a/drivers/gpu/drm/i915/intel_pcode.h
+++ b/drivers/gpu/drm/i915/intel_pcode.h
@@ -11,7 +11,7 @@
 struct drm_device;
 struct intel_uncore;
 
-int snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val, u32 *val1);
+int snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val0, u32 *val1);
 int snb_pcode_write_timeout(struct intel_uncore *uncore, u32 mbox, u32 val, int timeout_ms);
 #define snb_pcode_write(uncore, mbox, val) \
 	snb_pcode_write_timeout((uncore), (mbox), (val), 1)
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index d7d06dcaa699c..5e44c022d1aee 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -179,7 +179,7 @@ struct intel_display_pc8_interface {
 };
 
 struct intel_display_pcode_interface {
-	int (*read)(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1);
+	int (*read)(struct drm_device *drm, u32 mbox, u32 *val0, u32 *val1);
 	int (*write)(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms);
 	int (*request)(struct drm_device *drm, u32 mbox, u32 request,
 		       u32 reply_mask, u32 reply, int timeout_base_ms);
-- 
2.45.2

