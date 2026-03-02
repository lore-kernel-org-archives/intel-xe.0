Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D9D58E7E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB30810E45C;
	Mon,  2 Mar 2026 08:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuPPw6My";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273810E45C;
 Mon,  2 Mar 2026 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772440933; x=1803976933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aET3OjzIhd/ajEiwEnmdhwS6CPEDJogQG+uI1++00WQ=;
 b=IuPPw6MyV5a+FzOWHqSkUtTDnODI7HZ0V4ayyIeTbJepn2itBkpH231B
 e3C/Hs8a/apjo9GcwAcOFH9Ep0u/cEXtkSW6MsXi/Pdq6e14sH1eZ4t4F
 XW4gpaWQJWxQTCAMophfrND8rWyp0iZklx4HcX60/gmbhcUxN6RadCaI/
 ayHbTFmQ+XChORE7ZQKaw5KEYKCZFk91tCSGrr+vRY7V+NWCJc2PwTG0W
 ntXhh5y6UCj5vBxF56sztUG5Yxoai1eku8qWlGLlIot20goouRBX/sTLv
 FtBTf4HINxyIsS0Ed6ZwNqcK7u3G7tZVSM/6n0LWTK0wMxs5TG8mNGQ0H Q==;
X-CSE-ConnectionGUID: BWH+rQjtSWOBeHWEAkdCzA==
X-CSE-MsgGUID: 0nemvFPeQO2iIqfZoTpUkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84079943"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84079943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:42:11 -0800
X-CSE-ConnectionGUID: uEva/LOMRKO/ADRD7AtReQ==
X-CSE-MsgGUID: MkwZlp13QK27JGJx6k7S2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="221737637"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 02 Mar 2026 00:41:43 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 jouni.hogander@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2 1/2] drm/i915/dp: Read ALPM caps after DPCD init
Date: Mon,  2 Mar 2026 14:10:29 +0530
Message-Id: <20260302084030.463284-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260302033630.428913-1-arun.r.murthy@intel.com>
References: <20260302033630.428913-1-arun.r.murthy@intel.com>
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

For eDP read the ALPM DPCD caps after DPCD initalization and just before
the PSR init.

v2: Move intel_alpm_init to intel_edp_init_dpcd (Jouni)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 025e906b63a9..1544758c0bbc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4748,6 +4748,9 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	 */
 	intel_dp_init_source_oui(intel_dp);
 
+	/* Read ALPM DPCD caps before reading the PSR CAPS */
+	intel_alpm_init(intel_dp);
+
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
 	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
@@ -6914,8 +6917,6 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
-	intel_alpm_init(intel_dp);
-
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, connector);
 
-- 
2.25.1

