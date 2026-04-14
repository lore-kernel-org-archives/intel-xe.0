Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD7CF9D0D2
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9810E34F;
	Tue, 14 Apr 2026 14:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlP9OkBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1993C10E34F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776178008; x=1807714008;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+BzKjMF6Ril+iV/8RThqzSABPhOemCRD6m7ItvNgn/M=;
 b=hlP9OkBYD0mJqjRzOKY1Ufg4toZisldzhl9wBJFQQ25lFp6/K1QEnxRS
 eoEJP11rcNPPaTeJSDsa6CYiqdZupIM/b7s40vxEplWKvQy1ti31OMBbm
 O4pJDM5RO6VgF2ssga6zhHafv72mEsPeCjuWulm7HZTgPAXlKOcRQhjCJ
 IBtbo7VPiNGBLMz2mTqD1OfqYOg7Ta83OXoGkCMtjTXm6YfdWIfXWi/Hu
 /rRPrznUI9W/5aP2NLa9h8+U52O+X7JhcUOrlLrnrQ0G7MO4XEvNyxJEq
 NLFV01VZNdDHIqkIs5bMnHWDr25d/2F76exSIFhxyZcbLWQ05kaJjn9XL w==;
X-CSE-ConnectionGUID: mFuxS8BQTzmLM4yZsykYag==
X-CSE-MsgGUID: 99FsrxC0RoSo9l0NONi4TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87759899"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87759899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:46:47 -0700
X-CSE-ConnectionGUID: bzC7rw07QfiBdsqGOOBvzw==
X-CSE-MsgGUID: FF4ODTwhTvi9SA18pL+Fcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="223609078"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.222.54])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:46:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.34
Date: Tue, 14 Apr 2026 11:46:18 -0300
Message-ID: <20260414144628.19211-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.53.0
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 2104164e136e..927c8a865380 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -131,7 +131,7 @@ MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_34.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.53.0

