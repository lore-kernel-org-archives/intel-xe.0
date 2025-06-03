Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1257BC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53CF10E908;
	Tue,  3 Jun 2025 18:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ih36iJCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B9110E960
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975079; x=1780511079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXwKpcyRYK1xX3g59DVtT5ly4wLeFUiZXMLxl2qPIco=;
 b=Ih36iJCZBXC2zCubooPsI+N/SvlhfqjpRWVG8R4RxN1SZ2G9P7yc66uJ
 RfsODd2j/xQ7Tx6jpW2SYQqczyy5VyD1e1plve/riVG0j+e5iHI0gCL7o
 97syj3QbvE7kQD1ChMNQjk3yzJbEgzCFyUw1ffr8L8Mu33CpsOG9QqCo/
 tJN9vPmCXYLotwKOASzt2Quk0C0Ont7spaoSg/GMvR7wC31iyBBikdLXf
 fhMfumvUJVLRcLe2h96y4n529Usq9CRb6b6ZO30j2dr32tomXjWhMzWyu
 XL05G/eK/P/QIvMHdhDiRELM6xROZi4vg1J7w4+bgoa3pqsQ8NbLQWVPV g==;
X-CSE-ConnectionGUID: uRV/XD/cR1ygNfgdJF9hYg==
X-CSE-MsgGUID: 65MKx61OQe2yk45r3C50yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693863"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693863"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:39 -0700
X-CSE-ConnectionGUID: paqAbNomSievA7nnT0LgUw==
X-CSE-MsgGUID: cEAmEM06RYaW3bJfVCaUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562038"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:36 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 3/6] drm/xe/xe3: Add support for media IP version 30.02
Date: Tue,  3 Jun 2025 23:54:27 +0530
Message-Id: <20250603182430.1016734-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Media version 30.02 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        |  1 +
 drivers/gpu/drm/xe/xe_wa.c         | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 247cd928b933..7b84afe873f7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -195,6 +195,7 @@ static const struct xe_ip media_ips[] = {
 	{ 1301, "Xe2_HPM", &media_xelpmp },
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
+	{ 3002, "Xe3_LPM", &media_xelpmp },
 };
 
 static const struct xe_device_desc tgl_desc = {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5f750054a9c4..7ff79abe23e7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -285,6 +285,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16021865536"),
+	  XE_RTP_RULES(MEDIA_VERSION(3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 	{ XE_RTP_NAME("14021486841"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
 		       ENGINE_CLASS(VIDEO_DECODE)),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 557d23c1bb9f..e46b4975ebef 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,6 +59,7 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
+		MEDIA_VERSION(3002)
 		GRAPHICS_VERSION(3003)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
-		MEDIA_VERSION_RANGE(1300, 3000)
+		MEDIA_VERSION_RANGE(1300, 3002)
-- 
2.34.1

