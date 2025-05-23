Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723FBC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7CB10E852;
	Fri, 23 May 2025 18:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0HFlnRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FB010E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026499; x=1779562499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVpNZ5OqEdR/fpO4hpZsZWR7lRvIYh68OmYBY0oRHFw=;
 b=T0HFlnRgLqgR8E+tLQC4j5ieDLWSzlHApct3CZ7pCIVDgLWKkQvP2QX1
 DD8KcnOdm1BCkCSifcY6KeaOU16TQkDnrzcHW47D1E47siKFrR73zafG2
 7j6p4P2IfA8xZGhx3G+I80MHGWwS4EbFj6+x5fkm4MwFaRFJ6rbizGuet
 Xqh1wq720eVwya88mUxnTwd/ER61jJ8pyHP7YBehF5ztg0qxocS30wxhN
 J0/bCN85SS6Y5Ka9RDwxx2Gb2S3+nc799hZbc3N8IzUNiehcVRJpDccsw
 4OEBjf1M0P9XVuxFJzfV0AWU86P+jY07do2NFTJiAaXRPGeSJEOBQ0s0I w==;
X-CSE-ConnectionGUID: p3tlYORdS8qmanzaKoG/iw==
X-CSE-MsgGUID: t1HfN4b6Sye+fZrS3fhrhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50145876"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50145876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:55 -0700
X-CSE-ConnectionGUID: YDoIvL+MQiq8IQlSMot8Rg==
X-CSE-MsgGUID: yVftEvg3QbqgTk/7XiBcoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="164491733"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 5/5] drm/xe/configfs: Add interface to wa_bb commands
Date: Fri, 23 May 2025 11:54:39 -0700
Message-ID: <20250523-wa-bb-cmds-v1-5-40b337f71bcd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

During validation it's useful to ensure additional commands are executed
on every context switch. Add the interface to configfs to allow commands
to be inserted in the WA batch buffer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 178 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 172 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index d73fe5a6666cb..c1604160ec67c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/ctype.h>
 #include <linux/configfs.h>
 #include <linux/find.h>
 #include <linux/init.h>
@@ -78,12 +79,20 @@
  *	rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
+/* Similar to struct xe_bb, but not tied to HW (yet) */
+struct wa_bb {
+	u32 *cs;
+	u32 len; /* in dwords */
+};
+
 struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
 	u64 engine_allowed;
 
+	struct wa_bb wa_bb[XE_ENGINE_CLASS_MAX];
+
 	/* protects attributes */
 	struct mutex lock;
 };
@@ -91,15 +100,16 @@ struct xe_config_device {
 struct engine_info {
 	const char *cls;
 	u64 mask;
+	enum xe_engine_class engine_class;
 };
 
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
 
 static struct xe_config_device *to_xe_config_device(struct config_item *item)
@@ -214,12 +224,166 @@ static ssize_t engine_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
+static ssize_t wa_bb_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	ssize_t len;
+	char *p = page;
+
+	guard(mutex)(&dev->lock);
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		enum xe_engine_class ec = engine_info[i].engine_class;
+
+		if (!dev->wa_bb[ec].len)
+			continue;
+
+		len = sprintf(p, "%s:", engine_info[i].cls);
+		p += len;
+
+		for (size_t j = 0; j < dev->wa_bb[ec].len; j++) {
+			len = sprintf(p, " %08x", dev->wa_bb[ec].cs[j]);
+			p += len;
+		}
+
+		*p++ = '\n';
+	}
+
+	return p - page;
+}
+
+static bool lookup_engine_class(const char *name, size_t namelen,
+				enum xe_engine_class *engine_class)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		size_t clslen = strlen(engine_info[i].cls);
+
+		if (clslen == namelen &&
+		    !memcmp(engine_info[i].cls, name, namelen)) {
+			*engine_class = engine_info[i].engine_class;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Parse lines with the format
+ *
+ *	<engine-class> <u32> <u32...>
+ *
+ * and optionally save them in @wa_bb[i].cs is non-NULL.
+ *
+ * Return the number of dwords parsed.
+ */
+static ssize_t parse_wa_bb_lines(const char *lines, size_t len,
+				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
+{
+	const char *p;
+	ssize_t ret = 0;
+
+	for (p = lines; p - lines < len;) {
+		enum xe_engine_class ec;
+		size_t namelen;
+		u32 val;
+
+		while (isspace(*p))
+			p++;
+
+		if (*p == '\n') {
+			p++;
+			continue;
+		}
+
+		if (!*p)
+			break;
+
+		namelen = strcspn(p, " \t\n");
+		if (!p[namelen] || p[namelen] == '\n' ||
+		    !lookup_engine_class(p, namelen, &ec))
+			return -EINVAL;
+
+		for (p += namelen; p - lines < len && *p != '\n';) {
+			u8 numlen = 0;
+			u32 wa_bb_len;
+			char numstr[9];
+
+			while (isspace(*p))
+				p++;
+
+			while (isxdigit(*p)) {
+				if (numlen == sizeof(numstr) - 1)
+					return -EINVAL;
+				numstr[numlen++] = *p;
+				p++;
+			}
+
+			numstr[numlen] = '\0';
+			if (kstrtou32(numstr, 16, &val))
+				return -EINVAL;
+
+			wa_bb_len = wa_bb[ec].len;
+			if (wa_bb[ec].cs)
+				wa_bb[ec].cs[wa_bb_len] = val;
+
+			wa_bb[ec].len++;
+			ret++;
+		}
+	}
+
+	return ret;
+}
+
+static ssize_t wa_bb_store(struct config_item *item, const char *page,
+			   size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	struct wa_bb wa_bb[XE_ENGINE_CLASS_MAX] = { };
+	ssize_t count, class;
+	u32 *tmp;
+
+	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
+	count = parse_wa_bb_lines(page, len, wa_bb);
+	if (count < 0)
+		return count;
+
+	guard(mutex)(&dev->lock);
+
+	/*
+	 * 2. Allocate a u32 array and set the pointers to the right positions
+	 * according to the length of each class' wa_bb
+	 */
+	tmp = krealloc(dev->wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
+		wa_bb[class].cs = tmp + count;
+		count += wa_bb[class].len;
+		wa_bb[class].len = 0;
+	}
+
+	/* 3. Parse wa_bb lines again, this time saving the values */
+	count = parse_wa_bb_lines(page, len, wa_bb);
+	if (count < 0)
+		return count;
+
+	memcpy(dev->wa_bb, wa_bb, sizeof(wa_bb));
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
 CONFIGFS_ATTR(, engine_allowed);
+CONFIGFS_ATTR(, wa_bb);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
 	&attr_engine_allowed,
+	&attr_wa_bb,
 	NULL,
 };
 
@@ -228,6 +392,8 @@ static void xe_config_device_release(struct config_item *item)
 	struct xe_config_device *dev = to_xe_config_device(item);
 
 	mutex_destroy(&dev->lock);
+
+	kfree(dev->wa_bb[0].cs);
 	kfree(dev);
 }
 

-- 
2.49.0

