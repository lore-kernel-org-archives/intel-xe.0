Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9D9C79FAF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699E710EAF8;
	Tue,  8 Sep 2026 10:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHapg6qr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7C10EAF7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864364; x=1820400364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wuSAdbzWriQ7edyjikDswMcs97obPOj1zwgUGPT+POg=;
 b=ZHapg6qr+T8HUrFKrpzCiG7JlFIpcspiEr3901vW+GeLeUzZCJkwHks0
 krYJMkPpD3s88N7UnNajPTSfiO7VqpdNlyFp1yRBSMcA/Fxkhy0XpGca4
 pzYERaMs4GAp8FplevnFF4G17k81aP1meq5CO0+HVl+qgK5tQglhz6PiI
 QiX6ylbsdK1PvrTt754K6X7lM/CExkPClNWizU0klyVnojTRJAXAimhn6
 IG+kfIOL53hHt8A9YPRpcSBnomFy8up5yApfwjsUxKLugDcXf+qfjL1b0
 dclWtHeZ6+3M54r1lLCj3yxOwsnZaeVOzpcNGwsd24W8p6ymPB6pClwrc w==;
X-CSE-ConnectionGUID: 8ssV9z+AScSqX78JM6TAAA==
X-CSE-MsgGUID: W04DKlBCSPaJOWmqihAxbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773081"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:46:04 -0700
X-CSE-ConnectionGUID: hQCJTbG6RriiQ8hR35GTSA==
X-CSE-MsgGUID: HSAYjMcPTlaPv+EQotWNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759121"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:46:02 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 10/13] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
Date: Tue,  8 Sep 2026 16:15:47 +0530
Message-ID: <20260908104550.1283933-11-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the REGS component tag when
hardware reports unrecognized graphics or media IP versions during
GMDID handling.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1e04e8ef2611..249001ef77b1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -718,8 +718,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -732,8 +733,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown media version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	return 0;
-- 
2.54.0

