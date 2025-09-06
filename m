Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B2CA1012
	for <intel-xe@archiver.kernel.org>; Sat,  6 Sep 2025 05:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5341F10E30B;
	Sat,  6 Sep 2025 05:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFMS8rfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7910E2FF
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Sep 2025 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757137853; x=1788673853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QsfzeB7XMv9RMEdEswgIRDBKN7QnJagjP8TtEAM9AIc=;
 b=BFMS8rfOCE9hR0jQY7luJBfiInwpeVtL+ktsHO4gMP43bBizeAsL7pSG
 Gj1xyWoabDuJof5OfizSbnjLFLhKmCrSYiflRwklhUA0eCrqCGnV8fs+S
 uM2mS62faUoRUFwgTB6bixmF3s1BcAV3AlHPsDxmYNBV9kGQ0DmAX6YnI
 WfomR6YMQW/R1kgaXthPkoEZWNsd3hpSTyxTf7RR3R8prI7NGYT6JmbPN
 AlD1UMBsm7Jg5XCPE1fpqWxa3KfMmWigwLV2pTeqhONDyrIzS4C5mhX1p
 O/hKqMW1PcJuETq/nr/xFxVV1Fn3b2fi8ea+YoRIQO18bkoCDa11SmpeY w==;
X-CSE-ConnectionGUID: dpnrwfdvSAe5Iw0AlNmsrA==
X-CSE-MsgGUID: ONOQs5nsT62PlArVzwAZRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59628643"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="59628643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:52 -0700
X-CSE-ConnectionGUID: FCAWACN+S/6FR3DMkXnGZQ==
X-CSE-MsgGUID: DIH/4iorTnCrm3GrQFbTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="203262837"
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
Subject: [PATCH v3 3/6] drm/xe/configfs: Extract function to parse engine
Date: Fri,  5 Sep 2025 22:50:31 -0700
Message-ID: <20250905-wa-bb-cmds-v3-3-3da2b7bdc73e@intel.com>
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

Move the part that copies the engine to a local buffer so it can be
shared in future for other configfs attributes parsing an engine.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index acdabb3a6b50d..d487c0e0b7ab9 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -283,24 +283,34 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
 	return false;
 }
 
+static int parse_engine(const char *s, const char *end_chars, u64 *mask)
+{
+	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
+	size_t len;
+
+	len = strcspn(s, end_chars);
+	if (len >= sizeof(buf))
+		return -EINVAL;
+
+	memcpy(buf, s, len);
+	buf[len] = '\0';
+
+	if (!lookup_engine_mask(buf, mask))
+		return -ENOENT;
+
+	return len;
+}
+
 static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 				     size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	size_t patternlen, p;
+	ssize_t patternlen, p;
 	u64 mask, val = 0;
 
 	for (p = 0; p < len; p += patternlen + 1) {
-		char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
-
-		patternlen = strcspn(page + p, ",\n");
-		if (patternlen >= sizeof(buf))
-			return -EINVAL;
-
-		memcpy(buf, page + p, patternlen);
-		buf[patternlen] = '\0';
-
-		if (!lookup_engine_mask(buf, &mask))
+		patternlen = parse_engine(page + p, ",\n", &mask);
+		if (patternlen < 0)
 			return -EINVAL;
 
 		val |= mask;

-- 
2.50.1

