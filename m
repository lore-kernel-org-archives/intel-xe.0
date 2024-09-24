Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C18CF9C72
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 06:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370C710E4DE;
	Tue, 24 Sep 2024 06:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeYy+IIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A97B10E1BE;
 Tue, 24 Sep 2024 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727160392; x=1758696392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZjTrM7atK559NeNWom3xCSv0LB4ProkECmvc+HX/JIw=;
 b=YeYy+IIJGUb1BPKZoZb6ftE8zEF7JZujyN31isE9OJXea7CgPUVcObrc
 wmfW5JfbNheJaLqn2rBd3q1Q5mmaerIC1Zx+f2PHB+jui01uUt3VKlK5R
 zaPVrCPnuTFrscBqIXNnmuRMtj/o7y9qTW1I14HWJjX4t2CSet3aoD9HI
 PJZXXT8MIpsKdPd6XKw4ncf4ByoIjgFiBmY+ZmObqr3uN+Z0DzhyfiGbt
 7WPSSvR8/03V77f5KUeQsx0QWWm3sagKq7HRBs7S0W4LEgG8pkwhsf8u4
 XNdo5+Dehy+pBgmonj/fb8n0WS248zrII+M+qHfK25V8MSTWlIFJwF1Ir w==;
X-CSE-ConnectionGUID: nJodRWWwS2+YOF/Xsegr7g==
X-CSE-MsgGUID: k7P/BGkCRoGTnAc21nfnKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25610982"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="25610982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 23:46:05 -0700
X-CSE-ConnectionGUID: GjPf2atOQrOhDV7naalP4Q==
X-CSE-MsgGUID: edowLvR+TxeoezBUWnYKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102058168"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 23 Sep 2024 23:46:04 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCHv2 3/3] drm/i915/dp: Include the time taken by AUX Tx for
 timeout
Date: Tue, 24 Sep 2024 12:06:16 +0530
Message-Id: <20240924063616.1726369-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924063616.1726369-1-arun.r.murthy@intel.com>
References: <20240924063616.1726369-1-arun.r.murthy@intel.com>
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
Ref: "Figure 3-52: 128b132b DP DPTC LANEx_CHANNEL_EQ_DONE Sequence" of
DP2.1a spec.

Co-developed-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ec6c323a49c0..ddf91b3533a4 100644
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

