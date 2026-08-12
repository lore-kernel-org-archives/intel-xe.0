Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4C7C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4C610F141;
	Wed, 12 Aug 2026 22:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYle9WeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375410F141
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 22:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786574366; x=1818110366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ea64/3ltdweEVP9awF6QGjbMyj52ZtH1FMrZeYIZKqY=;
 b=nYle9WeMfBdjI6D4HfX5mfdrHv9iz3TR3t2wSy2OtGQYlbU1UxJP26pV
 kt1SJM81fHpR/aycNmeczdJ8ljsw3FE3rU//1M7W67fz+pvLyilDzCB/P
 wRijmntMxCtK9OV0yTDqAbsN5SCKmXo6RRLuz/GI9GsLFM9CJG3RIG2Al
 rECzAiDtfV4LW+tCX1CQnJCHR7BhUKXKqIrH1tyoPCja3V+N3KTu317eT
 WwO8P1mAgpqMATOXyVgWkht2jX86d1/+dGJ48eOfoCQ59QsIcJnOFt71C
 1rYKoyyksucLoLpLPx4JuthcSP2/BCyuHsCfkMikbT0Njnln+tk/Fwfun Q==;
X-CSE-ConnectionGUID: RsGy0mC7QgmCPfZOJuWPpQ==
X-CSE-MsgGUID: UbOJ6E0xSt+DD+2J3sGfSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87360143"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87360143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 15:39:26 -0700
X-CSE-ConnectionGUID: Mks/7X1wR7mw543/H6Qm8w==
X-CSE-MsgGUID: XA2LjRcpSrqbvp/ulKF5bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="261150584"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 15:39:24 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Sk Anirban <sk.anirban@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Do not apply WA 14025883347 to media 3503
Date: Wed, 12 Aug 2026 22:39:15 +0000
Message-ID: <20260812223915.273611-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
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

