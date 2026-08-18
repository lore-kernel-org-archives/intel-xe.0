Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C4CC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 21:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870B110E06D;
	Tue, 18 Aug 2026 21:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/n9RXfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FF910E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787088937; x=1818624937;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rHp5UPa1MA6hdSxVOxdfEZ73tMLD/KpKDtQpIH0sg0g=;
 b=V/n9RXfulNR2+DqB7ZC6vvbOsMcZbjlBrLKO79rDS9PAQr1+jnNqDuLQ
 5TpxvRMyXsEaFstd0xxwECSEJOaEN3MqPosU1Itr/n7r0U52T8BcktD4n
 eyFvEVYf7QcWuNZaOqgKrJLjMugeKvLnES8X1a8GMEahzswMuqGfylSwP
 Vzo8t+Noomzh7z77JeLMS7C1v5tANbrlWIedqZ81jDPd+65HroGROuLy4
 P0iURrPP4uzv+cW1ywrh6okh8Iy0M/HP9c40EnNfvtO2PCtMJ+0tLY8Qm
 9V3MniMHNMuf7yna+SugkKXAC55TLV+f9CG50y/3LhXIL9pNDJ/MnkBz1 A==;
X-CSE-ConnectionGUID: fYpB9s63SPiQtayX2KVIuQ==
X-CSE-MsgGUID: pvAnlmhwSpSlkCEmp7aUgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91466545"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91466545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:35:36 -0700
X-CSE-ConnectionGUID: BcRe//yhQxSxZmrEXKqL8w==
X-CSE-MsgGUID: JeisPldUQ0CnSPQcPS0P0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261601746"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:35:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Do not apply WA 14025883347 to media 3503
Date: Tue, 18 Aug 2026 21:35:20 +0000
Message-ID: <20260818213520.283063-1-daniele.ceraolospurio@intel.com>
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

The database was updated and the WA is no longer listed as applicable
to media 3503, so don't enable it there.

Fixes: c57db41b8d2c ("drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f02ac9bf7424..dd69ad07f7a9 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -63,7 +63,7 @@
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
 
-14025883347	MEDIA_VERSION_RANGE(1301, 3503)
+14025883347	MEDIA_VERSION_RANGE(1301, 3500)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
 16029380221	MEDIA_VERSION(3500)
 22022079272	MEDIA_VERSION(3503)
-- 
2.53.0

