Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0E8C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397E010EB26;
	Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdKUrLI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43310EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163959; x=1771699959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FdymGrNrvBnXXklU8SoUNDF67JBHNYPSe8prLVpdYw4=;
 b=jdKUrLI1vmQ/oEY7DHyyGXkOqfCFSgCtfw2hxhQMH/yF18DhSQcvPnxQ
 rPB+RB5Vq+JvFYMJUsVktscbKsK6vi0jnon66zD6eEPEiudRRbLlkRczv
 0MyTPShmJ5nGoQHaOtGGJmSLfVxuztp1025s0ahBYY+sfxZEjF9XxisN3
 9DYOpJ0udivjyGFtxZqGUFhtvjvxTGCODBEZH/oLe1YuxQ6I2DVIM+ten
 g7NszpJsZHDFZv+Y+LmLbRLwd8dd/QUtZ6kS02fEKmPryXOwU7bJlxmdk
 3LjGgIAvl7xvm+/3PFaendQNClOJXo3zu7UEbZnN5caOqrjWaD0Cw0PBd g==;
X-CSE-ConnectionGUID: OyXKzGwRR6mDDyL5yZ8P3g==
X-CSE-MsgGUID: P55kYjNjQ52IUGaM/7U1rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403683"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:39 -0800
X-CSE-ConnectionGUID: Gr/dmUIfS++13oDU3CycSw==
X-CSE-MsgGUID: TJckhhVEScWHAc0oifuPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071325"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:38 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:42 -0300
Subject: [PATCH v2 3/7] drm/xe: Rename gmdid_map to xe_ip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-3-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

If we pay closer attention to struct gmdid_map, we will realize that it
is actually fully describing an IP (graphics or media): it contains
"release info" and "features info". The former is comprised of fields
"ver" and "name"; and the latter is done via member "ip", which is a
pointer to either struct xe_graphics_desc or xe_media_desc, and can be
reused across releases.

As such let's:

  * Rename struct gmdid_map to xe_ip.
  * Rename the field ver to verx100 to be consistent with the naming of
    members using that encoding of the version.
  * Rename the field "ip" to "desc" to make it clear that it is a
    pointer to a descriptor of features for the IP, since it will not
    contain *all* info (i.e. features + release info).

We sill have release info mapped into struct xe_{graphics,media}_desc
for pre-GMDID IPs. In an upcoming change we will handle that so that we
make a clear separation between "release info" and "feature info".

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_pci.c       | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_types.h |  6 +++---
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 67404863087e78e5a1b3054959d57d29aa7a34af..5132c1961472f7d039783193d608721a717252da 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -21,15 +21,15 @@
  */
 void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
 {
-	const struct xe_graphics_desc *ip, *last = NULL;
+	const struct xe_graphics_desc *desc, *last = NULL;
 
-	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
-		ip = graphics_ip_map[i].ip;
-		if (ip == last)
+	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
+		desc = graphics_ips[i].desc;
+		if (desc == last)
 			continue;
 
-		xe_fn(ip);
-		last = ip;
+		xe_fn(desc);
+		last = desc;
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
@@ -43,15 +43,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
  */
 void xe_call_for_each_media_ip(xe_media_fn xe_fn)
 {
-	const struct xe_media_desc *ip, *last = NULL;
+	const struct xe_media_desc *desc, *last = NULL;
 
-	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
-		ip = media_ip_map[i].ip;
-		if (ip == last)
+	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
+		desc = media_ips[i].desc;
+		if (desc == last)
 			continue;
 
-		xe_fn(ip);
-		last = ip;
+		xe_fn(desc);
+		last = desc;
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 16add7bd3d028df17b1d308f86ecaa11fa6bd670..0476e16da8644711ab7d6eeef37add732a0b75fb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -362,8 +362,8 @@ static const struct xe_device_desc ptl_desc = {
 #undef PLATFORM
 __diag_pop();
 
-/* Map of GMD_ID values to graphics IP */
-static const struct gmdid_map graphics_ip_map[] = {
+/* GMDID-based Graphics IPs */
+static const struct xe_ip graphics_ips[] = {
 	{ 1270, "Xe_LPG", &graphics_xelpg },
 	{ 1271, "Xe_LPG", &graphics_xelpg },
 	{ 1274, "Xe_LPG+", &graphics_xelpg },
@@ -373,8 +373,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
-/* Map of GMD_ID values to media IP */
-static const struct gmdid_map media_ip_map[] = {
+/* GMDID-based Media IPs */
+static const struct xe_ip media_ips[] = {
 	{ 1300, "Xe_LPM+", &media_xelpmp },
 	{ 1301, "Xe2_HPM", &media_xelpmp },
 	{ 2000, "Xe2_LPM", &media_xelpmp },
@@ -577,11 +577,11 @@ static void handle_gmdid(struct xe_device *xe,
 
 	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
 
-	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
-		if (ver == graphics_ip_map[i].ver) {
+	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
+		if (ver == graphics_ips[i].verx100) {
 			xe->info.graphics_verx100 = ver;
-			xe->info.graphics_name = graphics_ip_map[i].name;
-			*graphics = graphics_ip_map[i].ip;
+			xe->info.graphics_name = graphics_ips[i].name;
+			*graphics = graphics_ips[i].desc;
 
 			break;
 		}
@@ -599,11 +599,11 @@ static void handle_gmdid(struct xe_device *xe,
 	if (ver == 0)
 		return;
 
-	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
-		if (ver == media_ip_map[i].ver) {
+	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
+		if (ver == media_ips[i].verx100) {
 			xe->info.media_verx100 = ver;
-			xe->info.media_name = media_ip_map[i].name;
-			*media = media_ip_map[i].ip;
+			xe->info.media_name = media_ips[i].name;
+			*media = media_ips[i].desc;
 
 			break;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 8e586d02d089847cc9b0dbce20ceae894e7c7fcd..f46426ef8ed8555af5587137601de0be4d1f2f82 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -37,10 +37,10 @@ struct xe_media_desc {
 	u8 has_indirect_ring_state:1;
 };
 
-struct gmdid_map {
-	unsigned int ver;
+struct xe_ip {
+	unsigned int verx100;
 	const char *name;
-	const void *ip;
+	const void *desc;
 };
 
 #endif

-- 
2.48.1

