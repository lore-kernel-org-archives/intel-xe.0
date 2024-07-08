Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB6EC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190BF10E191;
	Mon,  8 Jul 2024 17:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBo08aBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7FC10E2BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720459992; x=1751995992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WW4qBkJ7EigDTE95H92iUReAIp7S+VE1RZCc5WTAd9M=;
 b=MBo08aBQahEBF6cdPCblwglAf0qT85LCnCDekmlWzcz1NNnt7iDio/6d
 mwWSq+/q6BL49AoL8cUsdhjaAUGmxwB8oCD9/bJzjko0jWH75LfxXZUWG
 ErbUzsk9dT4F7keIT2zYyLvEZRg6Tcv9pX/o4DNaP8izw1I/PNgWV3U/q
 CQt9wdJcgPjPDe01bG4S28864ZHC9GEf1F9dREidLJtOj2JKU6GTVvAOC
 wk+z7OkfjBLso+5km0xRfMuaNYGDivtkPn2xHL2OHtMhGbOgYuPxrsJmE
 lg18YJO5JRbN3Npd/7qRCms5MOEjsGxsLqQ20r5abuX8wW3MwYk+IRXIX Q==;
X-CSE-ConnectionGUID: oAqM4QyiQX2zamOfshmXDg==
X-CSE-MsgGUID: ArSl6KrDSxCh5mpIMjB99g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35116351"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="35116351"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:33:12 -0700
X-CSE-ConnectionGUID: 1CuR9wPZTnqj2/HucBnOZw==
X-CSE-MsgGUID: 8y20xv+dT+iF8272Jh1xRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="52383888"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe/gt: Remove double include
Date: Mon,  8 Jul 2024 10:33:01 -0700
Message-ID: <20240708173301.1543871-1-lucas.demarchi@intel.com>
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

The header generated/xe_wa_oob.h is included twice. Remove one.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202407052122.AzuWSPuo-lkp@intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ce8994b808fe..b04e47186f5b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -9,7 +9,6 @@
 
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
-#include <generated/xe_wa_oob.h>
 
 #include <generated/xe_wa_oob.h>
 
-- 
2.43.0

