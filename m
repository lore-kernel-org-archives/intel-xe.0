Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC3C48292
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 22:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E72710EC21;
	Thu,  1 Feb 2024 22:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej4e6R/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBB510EBF0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 22:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706828072; x=1738364072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BjcLIfWLJB3sFCB3Ge6V/4vIldPGmOlyUK0/4+a40A8=;
 b=Ej4e6R/7RIYyMO5yBvVJlSAahi1MNszAgoYDpmAc7Ut5wTnXxIzSkNZy
 kpa98LCnd/DTx3JWEQ/ROTjNN8WykA6LsF/guZKSbJuGBBKFuaGr3eAtx
 bk+3AIWYd1UjzHEDhFHiDbrN/42gVj0N7FDDt+VTvLuY4Q4Cz1u+bL32+
 Lkl+aBncHYlC5fm3EDcUAFlgF3WJiMQuDAgJv+c89sylT73fYJjmarkCv
 6GvG0/+l+O1fSNqwFh8lakxGDHz36hxpjPIiNkdgDB5UtnN3olWNMHYSU
 NaagfMGa5FBQiByB5g7hvjvT8awgTCGDJtWeMfFpGRoQMnSN0Bo9+bC63 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="248432"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="248432"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="37338205"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 John.C.Harrison@Intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 tejas.upadhyay@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Always allow to override firmware
Date: Thu,  1 Feb 2024 14:47:23 -0800
Message-ID: <20240201224724.551130-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201224724.551130-1-lucas.demarchi@intel.com>
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
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

The current logic for firmware selection is reminiscent from i915 where
there are 2 backends and several platforms support only 1: execlist or
GuC. The xe driver has only the GuC backend and it simply doesn't work
without it. Allow developers to override the firmware path even if there
isn't a firmware entry in the table yet: this allows developers to more
easily test the very first firmware before adding it there.

The justification above is only true for GuC, however those override
paths should really be viewed as developer aid param. Simply make the
same logic for all firmwares and allow the override path to be used
for all of them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 8debea47a5b4..c7541f1a5c0b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -660,6 +660,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	xe_assert(xe, !uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
+	uc_fw_override(uc_fw);
 	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
 			       XE_UC_FIRMWARE_SELECTED :
 			       XE_UC_FIRMWARE_NOT_SUPPORTED);
@@ -667,8 +668,6 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	if (!xe_uc_fw_is_supported(uc_fw))
 		return 0;
 
-	uc_fw_override(uc_fw);
-
 	/* an empty path means the firmware is disabled */
 	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
-- 
2.43.0

