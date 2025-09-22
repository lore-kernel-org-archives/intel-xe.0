Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85050CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 22:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAE610E1E6;
	Mon, 22 Sep 2025 22:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0k2HPUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231DA10E1E6
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758579148; x=1790115148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w6cIaw6yFUc5R8CiWvJ5c8YOtsaHDAmUFm3aKjBs+hQ=;
 b=P0k2HPUaqSNL1gmszIxtRZdcS2k/7UWDiTdOYeNky/oGHWQigb8uhnPs
 Z3Gtj9Bk2gqYAhir7nhVQjo1ZYD33z6UIbftLQhZHx1Krcad9YjGLzkG5
 vshgW5zxkOQa9vLGa6P7S8B+KqWCa1PUPVBgAUan5FleaBWoHdn8Lrlfx
 JTlcPwf3clTM9F3XmS0oTZ+7Gn7km97UgQPMDYua8mGctGWnjgRQVAK0O
 wMv3G7vAMVc8IAB2up3KQCNpeMMazCQjQJuvBALON2+u5uOvAGHUMc9A9
 Z41DtFyoN3OHpGK4l+T8aUC+dEzgSi4kxDQak91dHzmmnrs93ug08Zpdh g==;
X-CSE-ConnectionGUID: L6tgAepkSheqsdXXdLqMzA==
X-CSE-MsgGUID: 9gI4yvT8T/+RgCrOHUgFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60740097"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="60740097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:12:28 -0700
X-CSE-ConnectionGUID: NGdWL6fnSvS9U82xK7MqKg==
X-CSE-MsgGUID: 4/8mb9J7S5qCOyj6Hy0JXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="181749373"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:12:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe/configfs: Fix engine class parsing
Date: Mon, 22 Sep 2025 15:12:10 -0700
Message-ID: <20250922221209.110737-2-lucas.demarchi@intel.com>
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

