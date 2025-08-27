Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ED6CA0FFD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2E910E91E;
	Wed, 27 Aug 2025 22:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adiBYfAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CAA10E919
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756334165; x=1787870165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5XXYi9eNHpWf2yLgRgYJtCKQ7Ppss+W6WSBk6wqk5k=;
 b=adiBYfAxcHx2DCsgPbG2T0dziN1G60Hnw9mPYMHqPglCi0JEG5ZtJb5r
 vvjmrEGtH0xC5dJNpL9OCi5+9bgInd5Nu7tgmCj3zLAVQO+U3K0iKu1O/
 3TMyZCPgwpkjiL+3eYL42qA0hS7fb2aj8xYhjR3s0guT8ll0gbD5IoDMT
 vHSO6/7ElC7Ny6Tm+TjNA2m0HtfOWhoe6yMMJkfWm06ikdHoUeqibKFKA
 s6i5BtbWF8zQPQAV3HY3p8Qo8JseFbCczQZH1dS5CrlhbhzuJWVnpTgTI
 2pgRrhfkYU1qhpUCg8KzghU7BXNI64rrBLU1y+yhfXX6VxzIgHjnO1eQB A==;
X-CSE-ConnectionGUID: w7mNkltFRoy4Puz8l8pf4w==
X-CSE-MsgGUID: V0Cg0s3lQqa4lZqmBj53cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69308118"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69308118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
X-CSE-ConnectionGUID: jcFyti+NTDmLazMUphLsKA==
X-CSE-MsgGUID: SJR0MgblREuYU6jGlgB55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170117864"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 2/6] drm/xe/configfs: Allow to select by class only
Date: Wed, 27 Aug 2025 15:35:27 -0700
Message-ID: <20250827-wa-bb-cmds-v2-2-3cdf4d63c72a@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
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

If the caller is only interested in class, allow lookup_engine_mask() to
return the matched index if mask is NULL. This allows parse_engine() to
still return an item if the caller wants to allow parsing a class-only
string like "rcs", "bcs", "ccs", etc.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 53 ++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 6cccab5456811..a1d230007cc05 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -150,6 +150,7 @@ static void set_device_defaults(struct xe_config_device *config)
 struct engine_info {
 	const char *cls;
 	u64 mask;
+	enum xe_engine_class engine_class;
 };
 
 /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
@@ -157,12 +158,12 @@ struct engine_info {
 #define MAX_ENGINE_INSTANCE_CHARS 2
 
 static const struct engine_info engine_info[] = {
-	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
-	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
-	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
-	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
-	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
-	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
+	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, XE_ENGINE_CLASS_RENDER },
+	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, XE_ENGINE_CLASS_COPY },
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, XE_ENGINE_CLASS_VIDEO_DECODE },
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, XE_ENGINE_CLASS_VIDEO_ENHANCE },
+	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, XE_ENGINE_CLASS_COMPUTE },
+	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, XE_ENGINE_CLASS_OTHER },
 };
 
 static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
@@ -251,7 +252,19 @@ static ssize_t engines_allowed_show(struct config_item *item, char *page)
 	return p - page;
 }
 
-static bool lookup_engine_mask(const char *pattern, u64 *mask)
+/*
+ * Lookup engine index from engine_info. If @mask is not NULL, reduce the mask
+ * according to the instance in @pattern.
+ *
+ * Examples of inputs:
+ *
+ * - lookup_engine_mask("rcs0", &mask): return "rcs" index from @engine_info and
+ *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
+ * - lookup_engine_mask("rcs*", &mask): return "rcs" index from @engine_info and
+ *   mask == XE_HW_ENGINE_RCS_MASK
+ * - lookup_engine_mask("rcs", NULL): return "rcs" index from @engine_info
+ */
+static int lookup_engine_mask(const char *pattern, u64 *mask)
 {
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
 		u8 instance;
@@ -261,30 +274,34 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
 			continue;
 
 		pattern += strlen(engine_info[i].cls);
+		if (!mask && !*pattern)
+			return i;
 
 		if (!strcmp(pattern, "*")) {
 			*mask = engine_info[i].mask;
-			return true;
+			return i;
 		}
 
 		if (kstrtou8(pattern, 10, &instance))
-			return false;
+			return -ENOENT;
 
 		bit = __ffs64(engine_info[i].mask) + instance;
 		if (bit >= fls64(engine_info[i].mask))
-			return false;
+			return -ENOENT;
 
 		*mask = BIT_ULL(bit);
-		return true;
+		return i;
 	}
 
-	return false;
+	return -ENOENT;
 }
 
-static int parse_engine(const char *s, const char *end_chars, u64 *mask)
+static int parse_engine(const char *s, const char *end_chars, u64 *mask,
+			const struct engine_info **info)
 {
 	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
 	size_t len;
+	int idx;
 
 	len = strcspn(s, end_chars);
 	if (len >= sizeof(buf))
@@ -293,8 +310,12 @@ static int parse_engine(const char *s, const char *end_chars, u64 *mask)
 	memcpy(buf, s, len);
 	buf[len] = '\0';
 
-	if (!lookup_engine_mask(buf, mask))
-		return -ENOENT;
+	idx = lookup_engine_mask(buf, mask);
+	if (idx < 0)
+		return idx;
+
+	if (info)
+		*info = &engine_info[idx];
 
 	return len;
 }
@@ -307,7 +328,7 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	u64 mask, val = 0;
 
 	for (p = 0; p < len; p += patternlen + 1) {
-		patternlen = parse_engine(page + p, ",\n", &mask);
+		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
 		if (patternlen < 0)
 			return -EINVAL;
 

-- 
2.50.1

