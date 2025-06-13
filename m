Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D20C71153
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 23:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3186110E576;
	Fri, 13 Jun 2025 23:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1E8uBcJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56B10E4E8
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 23:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749856298; x=1781392298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KhFIMqx9oyjfZBsJNGNYIpTr7+wdUOX5N3Kh6cXfl4A=;
 b=g1E8uBcJBusldQVVUfwZRtpQEdJmPFyXgh8E69PpSqGtt4HpcrsT/oGd
 SiUTmiKRkGvk7HcYz1xAM5IvUU73Dz8XLu7McYlvNos91EwMJYqoH2h4l
 hkoHoOhh4ibR22RaT7zipfTF5XGTuz8JaYx+Ni7lxFLHp1tpsu9hbyXkR
 B+uemm9Wa8WpNZrttMRHf1wORuxB6zI44L/lkBTYp7WgyekP/PrFWvGUy
 b5Joe+CtElYrJizNivWhaFSpv5etVVttI7XxeQEurcp0O3EwfDkPEVR24
 gAtZNQNu5ZohVDEwuAd7e16SsdeV1XutXKvVaIo9AS3ZHCTl9HY9jmI6x Q==;
X-CSE-ConnectionGUID: aC52dcMkQ7OVR+3pI3IAnA==
X-CSE-MsgGUID: MGOVJoVfR0yLTKHY6rNpNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62692359"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="62692359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:11:38 -0700
X-CSE-ConnectionGUID: 75LtiWoPQh+T2t2xhxar9A==
X-CSE-MsgGUID: I5IsVpgdSWKYMVJ+CHWK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="178944183"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:11:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: Extend WA 14018094691 to BMG
Date: Fri, 13 Jun 2025 16:11:29 -0700
Message-ID: <20250613231128.1261815-2-daniele.ceraolospurio@intel.com>
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

This WA is applicable to BMG as well.

Note that this is a GSC WA and we don't load the GSC on BMG, so
extending the WA to BMG won't do anything right now. However, it helps
future-proof the driver so that if we ever turn the GSC on we won't have
to remember to extend this WA.

v2: don't use VERSION_RANGE from 2001 to 2004 (Matt)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 425cb401c276..63b3fa7fbc6f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,7 +21,8 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
-14018094691	GRAPHICS_VERSION(2004)
+14018094691	GRAPHICS_VERSION_RANGE(2001, 2002)
+		GRAPHICS_VERSION(2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-- 
2.43.0

