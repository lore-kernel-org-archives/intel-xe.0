Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03D9CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 22:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2B810E919;
	Wed, 27 Aug 2025 22:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkqfFXCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6CF10E91A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756334165; x=1787870165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oN324MxxSZ7JhB+HC/VT7GWL/f/TsXbWEjHBwJateZA=;
 b=PkqfFXCcKfv2M4t/hsobj+UIp2AnPhu13eEgOJti0MXU3T6XCJw1+lHT
 dYvK51tZmOrlpjR5MiNu9PCthVGjQ2JWvD9swh7piQw+AgYmIrCmRxLhD
 jNTnroTUNzADhrgIf9rUyCEE8+Fse4CxSDok6QDXXYroyOaRcWVlGu3Q2
 5LKgDAJjBxoIPLAZ9niJqB6ddCjvKJshwP+EUYJTmVm9M5YBZXFAYbjfg
 xQapU/6ul42ONqYBrUxoMQ4Jo4U2iD2pYZ5aCxqIxF5uW/MimeYZXlHxb
 pvka8F1oaxyJiC08ORFAuMKeVDmCSeP9nWPeYnLHi9T9UchWdv3EyjEMB w==;
X-CSE-ConnectionGUID: XL77y9t2Q6WNr7hudh0Bnw==
X-CSE-MsgGUID: tTyvlHRASfCl2OfMsPfIgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69308116"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69308116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
X-CSE-ConnectionGUID: yks73p5MTY+dJsfT9F1p6Q==
X-CSE-MsgGUID: X+gfQvswQ2WD5HUiZwea4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170117861"
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
Subject: [PATCH v2 1/6] drm/xe/configfs: Extract function to parse engine
Date: Wed, 27 Aug 2025 15:35:26 -0700
Message-ID: <20250827-wa-bb-cmds-v2-1-3cdf4d63c72a@intel.com>
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

Move the part that copies the engine to a local buffer so it can be
shared in future for other configfs attributes parsing an engine.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1025d3979b066..6cccab5456811 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -281,24 +281,34 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
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

