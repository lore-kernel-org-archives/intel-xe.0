Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCD9CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 18:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37FA10E4DE;
	Mon, 22 Sep 2025 18:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZ5sSEZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7717110E4E5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758567450; x=1790103450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+fEJigZoXXND+k6gnhrVs3TyEC3hoFKnd3RCxvfNXs=;
 b=JZ5sSEZUL70PFExDs3ziesFzUVf+b7cBjkYqJOV9X/A0/ZL2Qya8/YfB
 vlc+gFOxiiHNU4D/7kHwqQhMLnZwoJhsDckx7OChBIPPiMHPdm7tbY0sB
 zf1P1/X37ESwfGfdY1VarX0kODnhr9n5hNP4EgtUv0GmFs6MZKV8H/6Uw
 jIjIitkNlZyBL8dZ1phF3kfmJjDUsDWbnTK6iOgtSE7+0KJzjeD6oNUXL
 d7b4RUQl1cP2OvGtQztcyHancKAs747d9zVJibI+FOZ6lSA1fQUhNlZPZ
 CwlanLqpWe2fjxffZMRqCV00hHCqvKo1A0b+voluR/fSC4W7KBTznxYDK w==;
X-CSE-ConnectionGUID: L9pi5LI8Rpakqe3zJZjWpg==
X-CSE-MsgGUID: 78atzcpNQ1aiVFWg9WKeBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60895227"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60895227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:57:30 -0700
X-CSE-ConnectionGUID: lbf465h0S7SXgD9A38M0aA==
X-CSE-MsgGUID: QGEWMS0uRMWSflfGoM7GJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176123921"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:57:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 raag.jadav@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v2] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Date: Mon, 22 Sep 2025 18:57:28 +0000
Message-ID: <20250922185728.73828-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

lookup_engine_info is described as such:

"Lookup engine_info. If @mask is not NULL, reduce the mask according to
the instance in @pattern"

According to the description, we should be exiting the execution early
if mask is NULL.  However, we appear to only do this if the mask is NULL
AND we have reached the end of the pattern string, as opposed to when
the mask is NULL OR we have reached the end of the pattern string.  Fix
this to prevent a NULL pointer dereference.

v2: Update commit message for clarify (Lucas, Raag)

Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8a9b950e7a6d..0c048d4a33ab 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
 			continue;
 
 		pattern += strlen(engine_info[i].cls);
-		if (!mask && !*pattern)
+		if (!mask || !*pattern)
 			return &engine_info[i];
 
 		if (!strcmp(pattern, "*")) {
-- 
2.43.0

