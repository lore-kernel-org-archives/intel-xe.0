Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549FDCAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843010EB85;
	Thu, 11 Sep 2025 19:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EejICtVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1410EB85
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757619405; x=1789155405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XvdmM4ls2xRvPYkIUrcy6EbsdRD1vzkHgGV+OguiGAw=;
 b=EejICtVfeg+BqYSE+xnwEzugUqBoCDkKPmiKZS7e+YTu70fAjy/iubUR
 8j+4p1YX5UK57fhJxa0gGH4NwUyi1T2pvmpJ4NIsIfuGLhrf72gZ1B67x
 V7pbiYOkNfVf74lp5z+PtkRaw5deHD7HTQsttSexvYqClHM6vsUuZjill
 nlYSrFJwFfEjGfhQTSNxmRwqBimvxwy/ANSRR/dMM0GdpeTU8Xv44OgoU
 JQ57doXHF0HwhZ1zSrKvy0AfUoN6oKW9bDB6zaUIwsUZHkLaVj7x7Iu5o
 OKoSt+0IsClbHPMwj6Iv1KTK5ACrECfzCxfb/iwSGbqYe8SZuR0C0+Nar Q==;
X-CSE-ConnectionGUID: frS1JcyyQwSxNGSRyAT2MQ==
X-CSE-MsgGUID: FC3tQs/LQ66YC/TiL0GIbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70582684"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70582684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:43 -0700
X-CSE-ConnectionGUID: 6pnuBVBsS46sJyfgfg/TTA==
X-CSE-MsgGUID: t6pWIykCQ9q+CINcqBi+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204544716"
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
Subject: [PATCH v4 3/6] drm/xe/configfs: Extract function to parse engine
Date: Thu, 11 Sep 2025 12:36:27 -0700
Message-ID: <20250911-wa-bb-cmds-v4-3-c8f7e48f7eae@intel.com>
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

Move the part that copies the engine to a local buffer so it can be
shared in future for other configfs attributes parsing an engine.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e52808e3199fc..8db7a2af11011 100644
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

