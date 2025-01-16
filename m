Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48533E77188
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 05:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCCE10E8B0;
	Thu, 16 Jan 2025 05:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhoLne3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7389810E8B0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737006064; x=1768542064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zvtCawA+jzI+duXFV/5E0vglIo2TyTVKfP45xkgBjB0=;
 b=NhoLne3ZCkj4L8+44UwY1Tk9EvqzdSmYWyZHAAFiAtMmZrvOdQMJYIyl
 4paryndPZHr0UvaELxIaPHJ7sep2u2/B48KYafVsExklv1s56yZ3amzGQ
 9XCl0lxgpNwomB3f55jyUvhhYGysVfglwLzj2r6+T6AtcbTYD5KPZLgUL
 gwY/bPryaiE1CisPcdHVwMag+tCR0P05K26+r1VXGEp0IkbqSgEOE+2u/
 8Xim18REEQoqnUGm4Cw+AT+s9PQbFtnvXEPecwFZN2BPIZr2epT6VZu1Y
 MYWJOWBrlsFhe1nYV/HwOKefYOhvoUSVCLDn6/JTjZ2PvxAb/C1Fl8rYS w==;
X-CSE-ConnectionGUID: kfXIhrsATe2bGm4Fzxft+Q==
X-CSE-MsgGUID: TRqjKeTTQIqbdw8vu5lGRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37291062"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37291062"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 21:41:04 -0800
X-CSE-ConnectionGUID: oh9qfw2DTmy9vLG3RF3KOw==
X-CSE-MsgGUID: Qz/l4WfGToyWJP693G2Itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105193899"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2025 21:41:03 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Suppress printing of mode when running in non-sriov
 mode.
Date: Thu, 16 Jan 2025 11:26:17 +0530
Message-Id: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The xe_sriov_probe_early() function prints the sriov pf/vf mode on
driver probe. When running in non-sriov mode, the below debug message
is seen.

"Running in none mode".

This print does not convey any information. This commit suppresses this
debug message and shows only when running in PF/VF mode.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 04e2f539ccd9..a0eab44c0e76 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -81,7 +81,7 @@ void xe_sriov_probe_early(struct xe_device *xe)
 	xe->sriov.__mode = mode;
 	xe_assert(xe, xe->sriov.__mode);
 
-	if (has_sriov)
+	if (IS_SRIOV(xe))
 		drm_info(&xe->drm, "Running in %s mode\n",
 			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 }
-- 
2.35.3

