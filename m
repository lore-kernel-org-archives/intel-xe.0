Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D896CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 17:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37410E09D;
	Wed, 10 Sep 2025 17:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpfxwpvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F28010E98A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757523733; x=1789059733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zj/tbFfK+xsCoyLPe4HATQjqaDCGp/U3Z5F0Cx5lexY=;
 b=HpfxwpvPTLVOW0JmJl1WuaGRJeStCRVJS7vO6Jp3gkFDFW9Tj13fhSVU
 mx0KVOWBJuTjBhZtCWK/AUp+3E4DmCY3S1Z6zL/D2PiBB0H+g6Uq+Gerx
 OIxad6dO5RD0FDYChCib5TDg5BhXmRQ1ndsKBAmie7HL43CqNHJfwELYz
 bhS8RN74wx9E8DVAcnF5c1BlCiXNzaXWZYAK/Ee728rX8ooUcwryLFVPr
 mtAqCezNNLOwoQBdusX5Rj227oyD0Ij4nsfFP4ruFjpPFQRXdSaTJ7COe
 jubGnfZMvdnQkiMoiRIT/Vxu5hDzoBbjisPYcdC1+myWry5QSTtQgrJ0r A==;
X-CSE-ConnectionGUID: 1BoVfuiGQ2C0Fz1wCOfBrQ==
X-CSE-MsgGUID: YEwxZ4LhR9OKV/nKJLGjKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58884786"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="58884786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:02:12 -0700
X-CSE-ConnectionGUID: ISSaLWtdQjirqSXvyU7qww==
X-CSE-MsgGUID: DQ0UXylDQ0OXD76TU9PXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="174253373"
Received: from hchegond-ivm1.jf.intel.com ([10.88.27.163])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:02:12 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP 30.00,
 30.01 and 30.03
Date: Wed, 10 Sep 2025 10:02:07 -0700
Message-ID: <a14d4cb5cf1bee071cb93ea2067a337401be9297.1757523671.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
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

Apply WA 18041344222 to Xe3 LPG graphics IP versions 30.00, 30.01 and
30.03 too.

Bspec: 56024
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c1fec526bed0..41ff7c05f12e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -679,6 +679,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
-- 
2.51.0

