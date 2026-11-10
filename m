Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA98606A326
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5cAxUAJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AF910E9A6;
	Tue, 10 Nov 2026 23:14:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8A10E9A6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352492; x=1825888492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2EXr85bOzhkl0Ah3pd4A6/O3ggl9qWx1PYA+80hqBY0=;
 b=S5cAxUAJF9BpnHkvyfnIs/ZgnNpVYoFbiIXPJyK9vFwSzqAAfMe156wT
 lAA+VLkLNtzLZ6wPa+yvAmM8ZH52Yos//5nrIo2zdlerARrHyGX/4EMej
 LvWJoxWFFWLZ3AMwdLRK4cKBa46VpGBfpoEIZBdSH5p3E4N0XdUAgDa8q
 4J395bovFnNTk4EZD06h5EeqbTnpD6z/aqle0Ej30tSJEE3bAaFD6qR6e
 uyKV90lPePR5h3LZauCm8Rws1rK4Cp/XAubZlyamcfx0dO8v3TV0IsHaH
 VpYOlFoMFgch2VZ/GgIGlPB2bBDgZMxAXlK7BTrYUYML7KsqJ7ZkbRoTe g==;
X-CSE-ConnectionGUID: t0jPTf0MTICkMmGhtJBBCA==
X-CSE-MsgGUID: aU/1uJqRQdWHv1LgasWWAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120823"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
X-CSE-ConnectionGUID: uLI6/sVOQf+Cx1yq8s4pYw==
X-CSE-MsgGUID: MIzkQ0c2SNWYKOWzk1FzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133947"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/11] drm/xe: Detect each GMD_ID IP in a loop
Date: Tue, 10 Nov 2026 23:14:43 +0000
Message-ID: <20261110231442.218721-14-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

handle_gmdid() open coded the graphics and media detection twice, with
the two copies subtly disagreeing: a missing media IP was tolerated,
while graphics reporting version 0 was reported as an unknown version.

Describe the per IP differences in a small table and walk it, so both
IPs are detected the same way and an absent IP of either kind simply
leaves its descriptor NULL. Deciding whether the resulting combination
is usable is left to the caller, which is unchanged in still demanding
a graphics IP.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 70 ++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ba23ec60477b..a59bb1c9b478 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -704,9 +704,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
 	return NULL;
 }
 
+static const struct xe_gmdid_desc {
+	const char *name;
+	const struct xe_ip *(*find_ip)(unsigned int verx100);
+} gmdid_descs[] = {
+	[GMDID_GRAPHICS] = { "graphics", find_graphics_ip },
+	[GMDID_MEDIA] = { "media", find_media_ip },
+};
+
 /*
  * Read IP version from hardware and select graphics/media IP descriptors
  * based on the result.
+ *
+ * Each IP is detected independently and any of them may legitimately be fused
+ * off or otherwise absent, in which case its descriptor is left NULL.  Deciding
+ * whether the resulting combination is usable is up to the caller.
  */
 static int handle_gmdid(struct xe_device *xe,
 			const struct xe_ip **graphics_ip,
@@ -714,36 +726,38 @@ static int handle_gmdid(struct xe_device *xe,
 			u32 *graphics_revid,
 			u32 *media_revid)
 {
-	u32 ver;
-	int ret;
-
-	*graphics_ip = NULL;
-	*media_ip = NULL;
-
-	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
-	if (ret)
-		return ret;
-
-	*graphics_ip = find_graphics_ip(ver);
-	if (!*graphics_ip) {
-		xe_log_err(xe, REGS, -EINVAL,
-			   "Hardware reports unknown graphics version %u.%02u\n",
-			   ver / 100, ver % 100);
-	}
-
-	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
-	if (ret)
-		return ret;
+	const struct xe_ip **ips[] = {
+		[GMDID_GRAPHICS] = graphics_ip,
+		[GMDID_MEDIA] = media_ip,
+	};
+	u32 *revids[] = {
+		[GMDID_GRAPHICS] = graphics_revid,
+		[GMDID_MEDIA] = media_revid,
+	};
+
+	for (enum xe_gmdid_type type = 0; type < ARRAY_SIZE(gmdid_descs); type++) {
+		const struct xe_gmdid_desc *desc = &gmdid_descs[type];
+		u32 ver;
+		int ret;
+
+		*ips[type] = NULL;
+		*revids[type] = 0;
+
+		ret = read_gmdid(xe, type, &ver, revids[type]);
+		if (ret)
+			return ret;
 
-	/* Media may legitimately be fused off / not present */
-	if (ver == 0)
-		return 0;
+		/* The IP may legitimately be fused off / not present */
+		if (!ver) {
+			*revids[type] = 0;
+			continue;
+		}
 
-	*media_ip = find_media_ip(ver);
-	if (!*media_ip) {
-		xe_log_err(xe, REGS, -EINVAL,
-			   "Hardware reports unknown media version %u.%02u\n",
-			   ver / 100, ver % 100);
+		*ips[type] = desc->find_ip(ver);
+		if (!*ips[type])
+			xe_log_err(xe, REGS, -EINVAL,
+				   "Hardware reports unknown %s version %u.%02u\n",
+				   desc->name, ver / 100, ver % 100);
 	}
 
 	return 0;
-- 
2.43.0

