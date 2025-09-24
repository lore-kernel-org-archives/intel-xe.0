Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C343CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66B210E75D;
	Wed, 24 Sep 2025 15:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W30QcFNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BA10E75D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758727649; x=1790263649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0RpZf5UGg+5vtFnsCY0HfvwPyhr1AMLpfUjpbkIs0yI=;
 b=W30QcFNC0MFpMWXMjaGB8BkI9tnnAjJAProEkn4tHunXC9c+Xf0eOL3J
 ib9NAHjlxHxIHtRiL+hsPogRkqMvcd89y9u8VHPQC+Qms53xULPwFMizs
 1ZEa0gI+uEUgf4wOyrMDSxeBmqPX8RNbfnn5tDPtaxXqchG/fudBE6LwS
 Envdw3W8AFSkaJ228LhbsPAVwYYH8B+BEKcohN/qVQGOKTR1SgkYmdNlN
 u5jxuo+YUO0W9a4iNh8KkAvw2cQAAWPXpqaabnZOUsu4ZHZjhC+35R8Cf
 L5DmFb9+u2b/XRBtuYc6UocCF8Eoh680H+ZsTAiGeIQbYjf8xkUziXnGl A==;
X-CSE-ConnectionGUID: 7xmNk92yT+KFaAidoFRovw==
X-CSE-MsgGUID: oNs5BFM+R9OKbhf0Q0apaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60953159"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60953159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:27:29 -0700
X-CSE-ConnectionGUID: 7uAI/1PRRrqSpkpr195SzA==
X-CSE-MsgGUID: o8Lz5Z5fRtuhkx8vTIrEGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176988619"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 08:27:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/2] drm/xe/configfs: Fix engine class parsing
Date: Wed, 24 Sep 2025 08:27:10 -0700
Message-ID: <20250924152709.659483-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

If mask is NULL, only the engine class should be accepted, so the
pattern string should be completely parsed. This should fix passing e.g.
rcs0 to ctx_restore_post_bb when it's only expecting the engine class.

Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@intel.com
Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8a9b950e7a6d1..beade13efbae7 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
 			continue;
 
 		pattern += strlen(engine_info[i].cls);
-		if (!mask && !*pattern)
-			return &engine_info[i];
+		if (!mask)
+			return *pattern ? NULL : &engine_info[i];
 
 		if (!strcmp(pattern, "*")) {
 			*mask = engine_info[i].mask;
-- 
2.50.1

