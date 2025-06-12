Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7187C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20D210E10D;
	Thu, 12 Jun 2025 18:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD90X/iZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807C10E101
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751569; x=1781287569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iOcS9i/fExapLbM5q7XNKdzaL5Di+4hP0Rvn/VDJIhQ=;
 b=hD90X/iZaW93EPERlJCfRsHzxZ/ExNzBEKtrASJh2YtMfz2DtsRBNHnb
 6KMefTAO5tac8XV5mt/jMlT9naaxFEjx+hbIbKE3hsy6RjPgtztoxr/+o
 3PcKnKupe621n4dDKMVoiww2RsWshAlg8lM1TFkyTMCG0HpsD5pci5vTY
 eccTNaqw6mx28/7D0liK26gs2WQbJ5Jd+hjc5tPs7RSKmvToCSnE9+3RO
 +xj0L6ztv5wBVIpGaw3oLbpT8XXC7SfS11PWLXAzA4hwBj/4fj/hm0oj7
 1ufKLypWvIkjd4L9NjHv0a3pYkx7cn9nTMQAg9pum190Z6t9SKnjuf5+y Q==;
X-CSE-ConnectionGUID: ACIKwHH2RTKZDdj8QvSokA==
X-CSE-MsgGUID: MZDObfGbSAypytowI0L8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51174707"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51174707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:04 -0700
X-CSE-ConnectionGUID: /cAYIIZJShSLtEa5IN3pzQ==
X-CSE-MsgGUID: tKARy1G5QPawavfo+VCx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="151416884"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe: Annotate default for guc_log_level param
Date: Thu, 12 Jun 2025 11:05:33 -0700
Message-ID: <20250612-guc-log-level-v1-2-51f124a3be6d@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-7a402
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

Reword the parameter description so it's clear what's the default and
what are the verbose levels.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4809afa7ce3f9..3ca25bea5a15a 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -43,7 +43,11 @@ module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
 
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
-MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels [default=3])");
+#else
+MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels [default=1])");
+#endif
 
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,

-- 
2.49.0

