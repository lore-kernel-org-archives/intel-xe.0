Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2291ECD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DB710E645;
	Tue,  9 Jun 2026 20:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQZ1Hw3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2610E64E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036274; x=1812572274;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=sISI/vwQPRfXCERAksnOmtDuMDYTtkjGFulKAYh5e7g=;
 b=VQZ1Hw3WmkJ+NPJrIjA1zu07pvYuzzXmil436OpsChzKLSztbouHMN4H
 r/DP2wTuLjm7HIRG4IEExkd+rLhzqXmJtJSQySF8zPMsGxFJHwrBGNemS
 +1/2heWQY1DJAoDaRzD4CTyNKgMItgU++OGILD8VJWGs2VQZ+XOkzD+oo
 QXC7ospd/j4KL89K753BumKH1z9SdWVCrpZ5TwzGVO7lSmjRyxrXzj9GD
 pu8ox7qV1LfTFtX3xlrbzeMhF1p4ybUQIcjZTo/hbY4ByHA0eW2IFnz+u
 vLYoMtPZ1EiA4/KUnK0TNbVRodFwXPAc1naRYjXK6aeO0GDpXnG3CAwk/ Q==;
X-CSE-ConnectionGUID: V4+ZUfEaTOep/00x6FLRhw==
X-CSE-MsgGUID: ZW0ZM7fIQOmOCJ2KNr0kxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383309"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:54 -0700
X-CSE-ConnectionGUID: NKFwv+RmQqS5GFPwud81Vg==
X-CSE-MsgGUID: JlOgrnRhRCqUoF4x/uNs9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027563"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:55 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:39 -0300
Subject: [PATCH 7/9] drm/xe: Add graphics/media IPs and their step info to
 xe_probed_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-7-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

On GMDID-based platforms, the driver needs to probe the hardware by
reading GMDID registers in order to identify the
graphics/media/display IPs that are present in the platform as well as
their stepping values.

Currently, xe_info_init() has such a probing logic, but that task
should be rather responsibility of xe_probe_info().  As such, move it
to the latter.

For pre-GMDID platforms, the IPs are identified via PCI devid and
revid fields, which is arguably also hardware dependent.  So do the
same for those platforms.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 44 ++++++++++----------
 drivers/gpu/drm/xe/xe_pci.c       | 88 ++++++++++++++++++++++++---------------
 2 files changed, 77 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a665d5dbc472..cd64b1d614c8 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,31 +311,35 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
-static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
-			   u32 *ver, u32 *revid)
-{
-	struct kunit *test = kunit_get_current_test();
-	struct xe_pci_fake_data *data = test->priv;
-
-	if (type == GMDID_MEDIA) {
-		*ver = data->media_verx100;
-		*revid = xe_step_to_gmdid(data->step.media);
-	} else {
-		*ver = data->graphics_verx100;
-		*revid = xe_step_to_gmdid(data->step.graphics);
-	}
-
-	return 0;
-}
-
 static void fake_xe_info_probe_tile_count(struct xe_device *xe)
 {
 	/* Nothing to do, just use the statically defined value. */
 }
 
 static int fake_probe_info(struct xe_device *xe,
+			   const struct xe_device_desc *desc,
+			   struct xe_pci_fake_data *data,
 			   struct xe_probed_info *probed_info)
 {
+	if (!data || desc->pre_gmdid_graphics_ip) {
+		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
+		probed_info->media_ip = desc->pre_gmdid_media_ip;
+	} else {
+		probed_info->graphics_ip = find_graphics_ip(data->graphics_verx100);
+
+		if (data->media_verx100) {
+			probed_info->media_ip = find_media_ip(data->media_verx100);
+			xe_assert(xe, probed_info->media_ip);
+		}
+	}
+
+	xe_assert(xe, probed_info->graphics_ip);
+	if (!probed_info->graphics_ip)
+		return -ENODEV;
+
+	if (data)
+		probed_info->step = data->step;
+
 	return 0;
 }
 
@@ -377,20 +381,16 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
-	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
 
-	err = fake_probe_info(xe, &probed_info);
+	err = fake_probe_info(xe, desc, data, &probed_info);
 	if (err)
 		return err;
 
 	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
 	xe_info_init(xe, desc, &probed_info);
 
-	if (data && !data->graphics_verx100)
-		xe->info.step = data->step;
-
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1c53a25442a9..388771ef6a52 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -600,8 +600,6 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
-	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
-
 	if (IS_SRIOV_VF(xe)) {
 		/*
 		 * To get the value of the GMDID register, VFs must obtain it
@@ -731,6 +729,8 @@ struct xe_probed_info {
 	u16 devid;
 	u8 revid;
 	struct xe_step_info step;
+	const struct xe_ip *graphics_ip;
+	const struct xe_ip *media_ip;
 };
 
 /*
@@ -924,12 +924,59 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	return gt;
 }
 
+static int xe_probe_ips(struct xe_device *xe,
+			const struct xe_device_desc *desc,
+			struct xe_probed_info *probed_info)
+{
+	/*
+	 * If this platform supports GMD_ID, we'll detect the proper IP
+	 * descriptor to use from hardware registers.
+	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
+	 * platforms before GMD_ID. In that case the IP descriptions and
+	 * versions are simply derived from that.
+	 */
+	if (desc->pre_gmdid_graphics_ip) {
+		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
+		probed_info->media_ip = desc->pre_gmdid_media_ip;
+		xe_step_pre_gmdid_get(xe, &probed_info->step);
+	} else {
+		int err;
+		u32 graphics_revid, media_revid;
+
+		xe_assert(xe, !desc->pre_gmdid_media_ip);
+
+		err = handle_gmdid(xe, &probed_info->graphics_ip, &probed_info->media_ip,
+				   &graphics_revid, &media_revid);
+		if (err)
+			return err;
+
+		xe_step_gmdid_get(xe, graphics_revid, media_revid, &probed_info->step);
+	}
+
+	/*
+	 * If we couldn't detect the graphics IP, that's considered a fatal
+	 * error and we should abort driver load.  Failing to detect media
+	 * IP is non-fatal; we'll just proceed without enabling media support.
+	 */
+	if (!probed_info->graphics_ip)
+		return -ENODEV;
+
+	return 0;
+}
+
 /*
  * Probe from the hardware the info required by xe_info_init().
  */
 static int xe_probe_info(struct xe_device *xe,
+			 const struct xe_device_desc *desc,
 			 struct xe_probed_info *probed_info)
 {
+	int err;
+
+	err = xe_probe_ips(xe, desc, probed_info);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -943,44 +990,19 @@ static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			struct xe_probed_info *probed_info)
 {
-	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	const struct xe_ip *graphics_ip;
 	const struct xe_ip *media_ip;
 	const struct xe_graphics_desc *graphics_desc;
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
-	int ret;
 	u8 id;
 
-	/*
-	 * If this platform supports GMD_ID, we'll detect the proper IP
-	 * descriptor to use from hardware registers.
-	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
-	 * platforms before GMD_ID. In that case the IP descriptions and
-	 * versions are simply derived from that.
-	 */
-	if (desc->pre_gmdid_graphics_ip) {
-		graphics_ip = desc->pre_gmdid_graphics_ip;
-		media_ip = desc->pre_gmdid_media_ip;
-		xe_step_pre_gmdid_get(xe, &xe->info.step);
-	} else {
-		xe_assert(xe, !desc->pre_gmdid_media_ip);
-		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
-				   &graphics_gmdid_revid, &media_gmdid_revid);
-		if (ret)
-			return ret;
-
-		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid, &xe->info.step);
-	}
-
-	/*
-	 * If we couldn't detect the graphics IP, that's considered a fatal
-	 * error and we should abort driver load.  Failing to detect media
-	 * IP is non-fatal; we'll just proceed without enabling media support.
-	 */
-	if (!graphics_ip)
-		return -ENODEV;
+	graphics_ip = probed_info->graphics_ip;
+	media_ip = probed_info->media_ip;
+	xe->info.step.basedie = probed_info->step.basedie;
+	xe->info.step.graphics = probed_info->step.graphics;
+	xe->info.step.media = probed_info->step.media;
 
 	xe->info.graphics_verx100 = graphics_ip->verx100;
 	xe->info.graphics_name = graphics_ip->name;
@@ -1165,7 +1187,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	err = xe_probe_info(xe, &probed_info);
+	err = xe_probe_info(xe, desc, &probed_info);
 	if (err)
 		return err;
 

-- 
2.53.0

