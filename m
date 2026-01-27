Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90596D25959
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 07:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054210E4C6;
	Tue, 27 Jan 2026 07:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJ+fgTNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A947C10E4CA
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769500199; x=1801036199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3/wwhG52bXc0LT9Pecd4SCAww8XaeRWb/QtfzVKVv8I=;
 b=fJ+fgTNyn+zt5pcQF/2VgHzxUmHyBpJ5916THbFaol/P07smZOpMZ76d
 My88SyKKP6QGvVMhtRpKvdvg7BwBuiBXnPXWld0+FXhphHiNYdTOIUAlc
 RKbtMv0dKtbJAvPFQJzvpmduW6JSB04UdQ3MApvEbyp+wU8uLMFY1d40j
 LACjyUiWMer+5bGxuBz4i/hw371VkN5eerqAVuIvt27yxdFMm7C9GSzyC
 kXguhelKIiEdW9zMy6yJp8IPBXD14qkr+adGbDAlgd2hLz8/ltszfNECF
 Wnjj0UbBGrjgPvygqfiDH9gkT7x8lBPOxTmnoce/J/6s37b7R055xVF4l Q==;
X-CSE-ConnectionGUID: +14QZpxQRZKue+4hxvm8Iw==
X-CSE-MsgGUID: yjhi5KAqROmPZT31oY+dAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69707595"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="69707595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:49:59 -0800
X-CSE-ConnectionGUID: c+MkqqZKRiO9ZY78cnP5vg==
X-CSE-MsgGUID: 6MDq/OBqQMeQa1q8FWaehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="238587855"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:49:59 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP 20.04
Date: Mon, 26 Jan 2026 23:49:50 -0800
Message-ID: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
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

Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.

Bspec: 56024
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a991ee2b8781..1153a7363cff 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* Xe2_HPG */
 
-- 
2.43.0

