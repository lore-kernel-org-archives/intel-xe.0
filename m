Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67AC021B6
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 17:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9BC10E9C6;
	Thu, 20 Feb 2025 17:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAR3XY/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E542310E9C3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740072362; x=1771608362;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6FQ8NVCEtJOe0jiOym6L2oUhN707625Mt0E+UVGV3kc=;
 b=GAR3XY/Fzp7Y/fk59Zj4uh9RcXbjxvK+Hi5N5uaUKIdH4iqKhzWQtDyh
 IpN96DQgrdN51NcxSEmYAkmgCV9I4gaus4vUJ4jbjs2kMIG0pKLGEEoLh
 eh+fxX01KWWaS/jFAkphBdF8W55u+wwG1f99gfojJqOXCo9Hs/RDL4WBN
 IWtDy2I8F1KBM/oEPNtpuj4Bxd5MiUQRbaExwV+TKGrD9rSzyvzIBRhPB
 aZZdzXMMLCgyXZRNAdhrbYDi/fwlregwVtMO9PwT356yTFiDqgeWxv1AV
 F1GmTKKNTMfxFaPfmvULZsOt/GH6rFtIhMvnPbfZSXjPhojoZZKlGkJZn A==;
X-CSE-ConnectionGUID: 0I+ruMV2Sy2NqR481CgMTA==
X-CSE-MsgGUID: xDoJlBWPT++C2NWDYuWVow==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40788079"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40788079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:01 -0800
X-CSE-ConnectionGUID: LzoyXeOnRZa9dp3uGAE8Sg==
X-CSE-MsgGUID: Izyrb7AfSVm4mGdtazMLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115634871"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:01 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Rename gmdid_map to xe_ip
Date: Thu, 20 Feb 2025 14:25:10 -0300
Message-ID: <20250220172532.66613-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220172532.66613-1-gustavo.sousa@intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_pci.c       | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_types.h |  6 +++---
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 67404863087e..5132c1961472 100644
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
index a61a8982ab67..8b8111e954c1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -369,8 +369,8 @@ static const struct xe_device_desc ptl_desc = {
 #undef PLATFORM
 __diag_pop();
 
-/* Map of GMD_ID values to graphics IP */
-static const struct gmdid_map graphics_ip_map[] = {
+/* GMDID-based Graphics IPs */
+static const struct xe_ip graphics_ips[] = {
 	{ 1270, "Xe_LPG", &graphics_xelpg },
 	{ 1271, "Xe_LPG", &graphics_xelpg },
 	{ 1274, "Xe_LPG+", &graphics_xelpg },
@@ -380,8 +380,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
-/* Map of GMD_ID values to media IP */
-static const struct gmdid_map media_ip_map[] = {
+/* GMDID-based Media IPs */
+static const struct xe_ip media_ips[] = {
 	{ 1300, "Xe_LPM+", &media_xelpmp },
 	{ 1301, "Xe2_HPM", &media_xe2 },
 	{ 2000, "Xe2_LPM", &media_xe2 },
@@ -584,11 +584,11 @@ static void handle_gmdid(struct xe_device *xe,
 
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
@@ -606,11 +606,11 @@ static void handle_gmdid(struct xe_device *xe,
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
index 8e586d02d089..f46426ef8ed8 100644
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

