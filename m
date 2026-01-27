Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B5D2F03E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 14:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F9310E0B9;
	Tue, 27 Jan 2026 14:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCm2MQ55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC12A10E0B9
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769524899; x=1801060899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JJih2Ty+ba7A3dQLKe8KlW3deXYLiiO1ITo2WZSTcj8=;
 b=QCm2MQ55b8Op7vAjNd+pWWCw2TfuMR9n7aOpf8VGsfj3/eGP5S1bX8G4
 c7Jay2rfbdADmSxLNnxESqPBZuDHJdGG1pscBT2TMW9C+KlLzV2fplLFK
 +ucV/wgvPM8TNCoOqSJ1M/cvSoKqv4dce3lutgKPOYqZs2nJ547stOq9X
 xeQVPopicOzv+i9JrKQ3vN1zr9UEtf211/dZjrR3HS/z0zL+83/cAO6fX
 i6M7dTcExalA2Yr+WBRMVrBRt3XRboqGhP/t5gpVOwr6RqvgdPB0QDUq1
 jznnOMm+1Ay1qw8ODkf/5Z1U93AOJOf8qdJlTdZrnLB6Lex869g0+hsRL A==;
X-CSE-ConnectionGUID: 1V4g0yY0RN6BiEazKdzTVw==
X-CSE-MsgGUID: d5+2fF+qSvK9zlotwvo66A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82149769"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="82149769"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:41:39 -0800
X-CSE-ConnectionGUID: KvMVHFlWSJO3eT9/03zARA==
X-CSE-MsgGUID: S9vJcdLUTKOVCGBdWFOvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212456379"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:41:37 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe: Apply WA_16028005424 to Media
Date: Tue, 27 Jan 2026 20:13:41 +0530
Message-ID: <20260127144340.1396752-2-balasubramani.vivekanandan@intel.com>
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

Apply WA_16028005424 to following IPs:
Xe2_LPM, Xe2_HPM, Xe3_LPM, Xe3p_LPM

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a991ee2b8781..32d4993c0d69 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -306,6 +306,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3500)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
-- 
2.43.0

