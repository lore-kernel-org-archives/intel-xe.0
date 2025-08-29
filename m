Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7E1CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7C10E29B;
	Fri, 29 Aug 2025 17:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJxyt9l1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6CC10E223
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487986; x=1788023986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgZ3Vt3GVe/jN6zvyTKsEEFgbrVfD1iIMn+hULSZ3uM=;
 b=AJxyt9l1jCicCaFaG9D8lDKwPW86HUhNxcE6hOoDDsPDz1KnbaOgFZhp
 BRGlX1dJMYPnFNdccPYkA1LPF/w+L4sK9Y1F9pwbsv5RgRTnYAsLoGu0r
 l2Ro+UITIWXRQ9We8aMchzeerYhpanpj0fN555kbH9F24F1Rv5ewWwT0K
 t3uM9UPTgkXrMHgg0R+ljgkM2A9hYo6rwSxKLne8I5mhVDKZlkSKz+IS8
 kWL/iNpIe93OW/AbgljrR4Jo64/k1j0KwMT567CypOEm2Nhfb1a0Bs6XU
 4xdfB5ulsea2E1PE9rvqkP1EiB3unzOOSEv+egwzmuVYnUSJEIUfjjifi A==;
X-CSE-ConnectionGUID: VLQ1CpxGQW2gEXDoMr6wfA==
X-CSE-MsgGUID: UQwg2cHvRoukq5hfSdccKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212759"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212759"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:46 -0700
X-CSE-ConnectionGUID: ez2hd0zqT1W7lRewQDJkQA==
X-CSE-MsgGUID: vXrpHnJuQf2IqRiOQJeDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818265"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/7] drm/xe: Allow to stub lookup for graphics and media IP
Date: Fri, 29 Aug 2025 19:19:16 +0200
Message-ID: <20250829171922.572-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

In upcoming patch we will want to replace lookup code during the
test to relax the strict match that we use in production.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 38 +++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e9005dc5677..701ba9baa9d7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -511,6 +511,26 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
 
+static const struct xe_ip *find_graphics_ip(unsigned int verx100)
+{
+	KUNIT_STATIC_STUB_REDIRECT(find_graphics_ip, verx100);
+
+	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++)
+		if (graphics_ips[i].verx100 == verx100)
+			return &graphics_ips[i];
+	return NULL;
+}
+
+static const struct xe_ip *find_media_ip(unsigned int verx100)
+{
+	KUNIT_STATIC_STUB_REDIRECT(find_media_ip, verx100);
+
+	for (int i = 0; i < ARRAY_SIZE(media_ips); i++)
+		if (media_ips[i].verx100 == verx100)
+			return &media_ips[i];
+	return NULL;
+}
+
 /*
  * Read IP version from hardware and select graphics/media IP descriptors
  * based on the result.
@@ -528,14 +548,7 @@ static void handle_gmdid(struct xe_device *xe,
 
 	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
 
-	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
-		if (ver == graphics_ips[i].verx100) {
-			*graphics_ip = &graphics_ips[i];
-
-			break;
-		}
-	}
-
+	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
 		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
 			ver / 100, ver % 100);
@@ -546,14 +559,7 @@ static void handle_gmdid(struct xe_device *xe,
 	if (ver == 0)
 		return;
 
-	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
-		if (ver == media_ips[i].verx100) {
-			*media_ip = &media_ips[i];
-
-			break;
-		}
-	}
-
+	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
 			ver / 100, ver % 100);
-- 
2.47.1

