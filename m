Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD1EE644B
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 05:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E510EA0C;
	Thu, 12 Sep 2024 05:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWDz3iLz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A894710E9BA;
 Thu, 12 Sep 2024 05:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726118148; x=1757654148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxvA8vQID2ti5QVXHM4L2swT1DSYIoPRLT0ogammRkI=;
 b=aWDz3iLzjPlE1eiDz3agH/J7k0gHSBEZiORgpaEirZ+3LA+gowxIFrDz
 3pnp0UaPdmzQ6/xCkL3M6nAC0dm40GAwIKf72VlnQC42yWivXvOJ9ridB
 Z76UcSirEDA0OudNJ4NwcZix6P7kGT9yegoWGW+c4O6YzTlEJMLlt1QQU
 ucTWaucuSWnw903L1fHAvOG4InmjLJ+2K2ixmfhkAmg8v06G4jlp/r33h
 geA1e71ja2y3mJeKQFmFRlMoqLYd++N/OOVQOrGIl/cc6nuK5k+UHX+1o
 rX8m4GX+apaWaUrQHX/kalowaomMS8LeqAdC++rLngcpBibn856nTfpex w==;
X-CSE-ConnectionGUID: YgHPRO7hTmGWaoBS0du2Gg==
X-CSE-MsgGUID: HS+LqTKIRIqkfhsGdz2Pxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35613929"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="35613929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 22:15:47 -0700
X-CSE-ConnectionGUID: YRkd3XEKR1O1hbJauunRAg==
X-CSE-MsgGUID: syo/zIiISEiShm53oQDN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72388862"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 22:15:46 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Subject: [PATCH 3/3] drm/i915/dp: Include the time taken by AUX Tx for timeout
Date: Thu, 12 Sep 2024 10:35:52 +0530
Message-Id: <20240912050552.779356-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912050552.779356-1-arun.r.murthy@intel.com>
References: <20240912050552.779356-1-arun.r.murthy@intel.com>
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

As per DP spec the timeout for LANE_CHANNEL_EQ_DONE is 400ms. But this
timeout value is exclusively for the Aux RD Interval and excludes the
time consumed for the AUX Tx (i.e reading/writing FFE presets). Add
another 50ms for these AUX Tx to the 400ms timeout.

Signed-off-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ca179bed46ad..b6573934c6dd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1414,7 +1414,7 @@ intel_dp_128b132b_lane_eq(struct intel_dp *intel_dp,
 	}
 
 	/* Time budget for the LANEx_EQ_DONE Sequence */
-	deadline = jiffies + msecs_to_jiffies_timeout(400);
+	deadline = jiffies + msecs_to_jiffies_timeout(450);
 
 	for (try = 0; try < max_tries; try++) {
 		fsleep(delay_us);
-- 
2.25.1

