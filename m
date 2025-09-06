Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73C2CA1002
	for <intel-xe@archiver.kernel.org>; Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46510E301;
	Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/1SqzoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A810E301
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Sep 2025 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757137853; x=1788673853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jVNoQInJ5J0YH4cDfC4ISkIXGAPkZB6lFd5QahVq/g=;
 b=C/1SqzoKYDpZbCkxZepmlzDzc/UMy+j2uAJy8pPWrc9NiumZ4XVslRIZ
 /trLPEawaHLSsEYmTGW1f6/Q6Q+hDurPTBK6Zo47mSsWBC5HzgvDYFZAh
 bpivkrbpU4SoawquOpe03Knp1gZhai8ZQO/6vvMN98giVw+BcAV2Gd+BE
 W5NVuGpZYkTb5LN8rnMrJ78BIH+yRUK2gJNc/EkCN6ADiwTQYOTySc00W
 Z2fjYeYMAT/+E2O5O641RAax5RzfCPFID81knvFu2D7QOE32IzOiP1QZv
 U9JNE7AMrH7sJm6Hpw1AUvz3xjh4P5VgNy77WXIzFMs/BRHjf153s0Jif Q==;
X-CSE-ConnectionGUID: eiYhZXqcSmOn17jgYuXFGA==
X-CSE-MsgGUID: HOMtytnoQSGWtjwM/bKKFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59628645"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="59628645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:52 -0700
X-CSE-ConnectionGUID: CTZKnIMwRRqj6xDrI13OsQ==
X-CSE-MsgGUID: QxrVaxlkS+adMvVZ7L2uxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="203262840"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 4/6] drm/xe/configfs: Allow to select by class only
Date: Fri,  5 Sep 2025 22:50:32 -0700
Message-ID: <20250905-wa-bb-cmds-v3-4-3da2b7bdc73e@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
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
---
v2:
- Rename function to lookup_engine_info() and return the entry
  directly instead of the index (Raag Jadav)
- Add named initializer for new entry for consistency (Raag Jadav)
---
 drivers/gpu/drm/xe/xe_configfs.c | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index d487c0e0b7ab9..f42178a30383c 100644
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

