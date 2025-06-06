Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE0C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861110ECAD;
	Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqZhRlSI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782310ECB2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239478; x=1780775478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKn7u21x6o1WN23/mWTCWqjMwcDwk2NpIO7ptF1fPus=;
 b=AqZhRlSInMNs0cG5vEBSGBSOOv0saM+qBSe3T+dSJDtd7ZZ0e/GTDsYz
 ftiA7bRY9v/Y2raj2yNT1QXXGnBe/KXB5Q/sYJVhtEFsfW2AAkw6i9eoA
 2f7eRTvqUgsypNcqOoOEGuc53dQpBEIRDGeyY1deTt1/sIupGGsGVo07s
 Nkv7HJo2+hKJip2UWHwlXY7uwDvLQTB3bDOYvETD2EhQcPNTU8PMwySo9
 pL2eN4awTq1Urptqvz9rnTCBXipQR6w2HyshWsHTQwatfSPNwLqz3gsNk
 cauORkq9PyzOhUOWYAXp5aNPEZmD7Olg0og/Bv+q8p8FAF3gfNDQR7YoS w==;
X-CSE-ConnectionGUID: WUbY3E2TQI6cCEt1sBNS3A==
X-CSE-MsgGUID: roajmLR/TNaVYdUALUf75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277300"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:18 -0700
X-CSE-ConnectionGUID: cjBIp+OUSaCtZrmv+4hqeA==
X-CSE-MsgGUID: 3bDDYruvTBuP9Q6Fc+pFxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796078"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Date: Sat,  7 Jun 2025 01:21:03 +0530
Message-Id: <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

WCL added a c10 phy connected to port B. PTL code is currently
restricting c10 to phy_a only.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 75caccb65513..59eee0edef79 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -40,6 +40,9 @@ bool intel_encoder_is_c10phy(struct intel_encoder *encoder)
 	struct intel_display *display = to_intel_display(encoder);
 	enum phy phy = intel_encoder_to_phy(encoder);
 
+	if ((DISPLAY_VERx100(display) == 3002) && phy < PHY_C)
+		return true;
+
 	if (display->platform.pantherlake && phy == PHY_A)
 		return true;
 
-- 
2.34.1

