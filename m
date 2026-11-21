Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A0606A32C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GwQvJ7DE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA710EA17;
	Sat, 21 Nov 2026 18:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590AE10E9DE
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285411; x=1826821411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ni0rLpgHYhBx5lpGYP/Nc/zjpUiOemwZg0ReO0pSq/4=;
 b=GwQvJ7DEPthM6F1DP3rkSNuI6JQnxXBiwmsVoNqahL0NvGo8B39G4+0b
 aMN1sNBFfxAf1Z2VqJaAMxOL9wBCjsnhvAECIixxDYPzSDqKujM/fZW32
 u55iE3wbCGjVeM1ympNR+YUJiY/OLnUgyggEWPty4uu64C9ldGlKDU4Hx
 lodalghg8+a4zpRt0BJ7GxU9IqcsVAl4S1QOUJwKkSPeRLWxw0JMuYHX/
 v6OtDRvZ+9qfLMqgxDtwpK9UgKFOJjvDPqpGrDHqPj2Em/dqtiGvae27c
 kVpgzwSvdvfhnAY3fyfssfdgO4LRYn9sLBVae3eaAnbYq6UshjPKstPXP A==;
X-CSE-ConnectionGUID: bzJlxT6hR2SPpNyo3R+XpA==
X-CSE-MsgGUID: RYSrIQgYRfeBHVbnbgmk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034060"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
X-CSE-ConnectionGUID: 2dtThPl9Qs6sSJEijXaPXw==
X-CSE-MsgGUID: rp7DYookQeG/I+fqZTsWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934416"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 05/17] drm/xe: Detect each GMD_ID IP in a loop
Date: Sat, 21 Nov 2026 18:23:21 +0000
Message-ID: <20261121182317.48981-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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
index 7a5c4939a0ac..1fce1c993a2c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -708,9 +708,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
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
@@ -718,36 +730,38 @@ static int handle_gmdid(struct xe_device *xe,
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

