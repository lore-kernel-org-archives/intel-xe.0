Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A28CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579510EB86;
	Thu, 11 Sep 2025 19:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noI2F+3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D305A10EB85
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757619406; x=1789155406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwvouTKOc6zO5RTBn4vL4UaqqKGN1eVtgn726ZGn+Hw=;
 b=noI2F+3KC/JFdjwFuzo6bycQg6ArSRnw99CEu/w5ZCOlnrW54QGEE5NJ
 sfr9BT56x2ahud8NdXjvMkKw+/DQqreaXIGhB09V53Cn4etFROSHDSS9k
 Ac2R0sG9/tE70SrlWkBH66xoKBBygDDo2VCGyhcybtsZZHKv3250I0Dee
 CUpzrJPHuHpZUhbhJ26iFnUbf3IkEcm6rZyiyY8ekc3o5EFQlPfJJZcyb
 xfY76/mcAcPhcenec3en28QSpKp8+A2M9sdtmVEoyBkpXLBZgqOU13ogs
 U2f149U0AlW4PaD745As5xM90p25ytre9OtOLR/4PQLmyUfO2uKvd0TwY A==;
X-CSE-ConnectionGUID: /u6Hn/yzTHuLwG5sbAng8A==
X-CSE-MsgGUID: WMSXLSoiT+GBwrCyAZxBFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70582686"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70582686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:43 -0700
X-CSE-ConnectionGUID: mVITEX7uSgaxd9R9WALa9A==
X-CSE-MsgGUID: 3oeYTDm6Qeq8XQ5EcsgJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204544719"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 4/6] drm/xe/configfs: Allow to select by class only
Date: Thu, 11 Sep 2025 12:36:28 -0700
Message-ID: <20250911-wa-bb-cmds-v4-4-c8f7e48f7eae@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

For a future configfs attribute, it's desirable to select by engine mask
only as the instance doesn't make sense.

Rename the function lookup_engine_mask() to lookup_engine_info() and
make it return the entry. This allows parse_engine() to still return an
item if the caller wants to allow parsing a class-only string like
"rcs", "bcs", "ccs", etc.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2:
- Rename function to lookup_engine_info() and return the entry
  directly instead of the index (Raag Jadav)
- Add named initializer for new entry for consistency (Raag Jadav)
---
 drivers/gpu/drm/xe/xe_configfs.c | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8db7a2af11011..45fdb6cf26b5d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -152,6 +152,7 @@ static void set_device_defaults(struct xe_config_device *config)
 struct engine_info {
 	const char *cls;
 	u64 mask;
+	enum xe_engine_class engine_class;
 };
 
 /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
@@ -159,12 +160,12 @@ struct engine_info {
 #define MAX_ENGINE_INSTANCE_CHARS 2
 
 static const struct engine_info engine_info[] = {
-	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
-	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
-	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
-	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
-	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
-	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
+	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
+	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
+	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
+	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
 };
 
 static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
@@ -253,7 +254,18 @@ static ssize_t engines_allowed_show(struct config_item *item, char *page)
 	return p - page;
 }
 
-static bool lookup_engine_mask(const char *pattern, u64 *mask)
+/*
+ * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
+ * instance in @pattern.
+ *
+ * Examples of inputs:
+ * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
+ *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
+ * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
+ *   mask == XE_HW_ENGINE_RCS_MASK
+ * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
+ */
+static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
 {
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
 		u8 instance;
@@ -263,29 +275,33 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
 			continue;
 
 		pattern += strlen(engine_info[i].cls);
+		if (!mask && !*pattern)
+			return &engine_info[i];
 
 		if (!strcmp(pattern, "*")) {
 			*mask = engine_info[i].mask;
-			return true;
+			return &engine_info[i];
 		}
 
 		if (kstrtou8(pattern, 10, &instance))
-			return false;
+			return NULL;
 
 		bit = __ffs64(engine_info[i].mask) + instance;
 		if (bit >= fls64(engine_info[i].mask))
-			return false;
+			return NULL;
 
 		*mask = BIT_ULL(bit);
-		return true;
+		return &engine_info[i];
 	}
 
-	return false;
+	return NULL;
 }
 
-static int parse_engine(const char *s, const char *end_chars, u64 *mask)
+static int parse_engine(const char *s, const char *end_chars, u64 *mask,
+			const struct engine_info **pinfo)
 {
 	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
+	const struct engine_info *info;
 	size_t len;
 
 	len = strcspn(s, end_chars);
@@ -295,9 +311,13 @@ static int parse_engine(const char *s, const char *end_chars, u64 *mask)
 	memcpy(buf, s, len);
 	buf[len] = '\0';
 
-	if (!lookup_engine_mask(buf, mask))
+	info = lookup_engine_info(buf, mask);
+	if (!info)
 		return -ENOENT;
 
+	if (pinfo)
+		*pinfo = info;
+
 	return len;
 }
 
@@ -309,7 +329,7 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	u64 mask, val = 0;
 
 	for (p = 0; p < len; p += patternlen + 1) {
-		patternlen = parse_engine(page + p, ",\n", &mask);
+		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
 		if (patternlen < 0)
 			return -EINVAL;
 

-- 
2.50.1

