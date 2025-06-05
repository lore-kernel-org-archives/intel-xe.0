Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BCC5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 09:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7900610E96C;
	Thu,  5 Jun 2025 09:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meKVj+DN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BDA10E96C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749116644; x=1780652644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=paMzJ99qQ9dMGPLu9t+uZHM5U46ymLoKpOqZTo6RsWY=;
 b=meKVj+DN3lxeaoYN+4GRqeQ6J0IAGHHfJcmoPRsA6XaDZuQP5KjUIAyg
 PxI49jGinTalT2u0AE4CLkIs7by5yqIhkylEt01sXw9vJqmpySV+6sUYd
 K6R7XhbVOmVJJS6nhOZuCzdKqAtWt95Feh1GxN9GT6jTrwWLUAPCoCUT0
 Drbihr76S0/wAvR6MfNwixcXaa4wzll1dBD3CbLieNiMy3TCvr0Uiz8Qu
 xfKmemEZZsQagfpNfJ7EHpB1u8F3IwH60umuliETbqVJ4tDUPiJaqMjpf
 j5WziPc2IKZUblQ2lofuduo47y8IMWkyQo6bzIf7aLRoxUs0ZgG0oej71 w==;
X-CSE-ConnectionGUID: w7pd5gBhS1KwtzeMC3HPbg==
X-CSE-MsgGUID: gQGv3p65R3KdLg/nslX/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51296476"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51296476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 02:44:04 -0700
X-CSE-ConnectionGUID: gy/fhCmAS7urKE+TWaQ7xQ==
X-CSE-MsgGUID: qMpfO+Q/T4aYEew3vpYAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145427120"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by orviesa010.jf.intel.com with ESMTP; 05 Jun 2025 02:44:03 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.d.roper@intel.com
Cc: gustavo.sousa@intel.com, intel-xe@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, himal.prasad.ghimiray@intel.com,
 tejas.upadhyay@intel.com, nitin.r.gote@intel.com
Subject: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Date: Thu,  5 Jun 2025 15:38:12 +0530
Message-Id: <20250605100812.2547808-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Set DIS_NULL_QUERY bit of RT_CTRL register to disable
null query for anyhit shader for Xe3 IP.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---

Changes in v2:
  - Use xe3 IP and not ptl in commit title 
    as this is  not platform specific.(Gustavo Sousa)
  - Update a commit details properly (Matt)

Changes in v3:
  - Use XE_RTP_END_VERSION_UNDEFINED as upper bound. (Matt)

 drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 49ddbda7cdef..828b45b24c23 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
+	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
-- 
2.25.1

