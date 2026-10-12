Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E1CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 16:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742F210E611;
	Mon, 12 Oct 2026 16:40:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1A10E645
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791823221; x=1823359221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2MRTkb+hku/KRL3bNYjuHmrZsWjtQWg2IJknpo5DJdU=;
 b=HMyjoXVkbKdBVIR+XJFLJJLe2Kt8TBTH7mqODEcJq4qpRoj2euJG1/jI
 JlI5gGjZeqHDVobvDC+zU5xBgQ6ZJMJCSKcHKlbe0aZ4MtXHxylhyOEmR
 1uHJGiZrG+xy1cOK4gEU5Xz7gkh5nYAvyb6CTt2q41X0uuSkDuwrlF30P
 n6W2Vs420O77ozr2m/86d3XRjif4RqaypNUv47o3upSyTi8wBaWA/WAXi
 YvizI0PEjWY69u7FoqJl+KTsvArD1i/CDf2Gcr+E4y7xDmphQ0MYkmUjn
 4wORIc8nKeYHU5fq5MbDLPGUQll4hiXqH1t4JlF9l6uB5s119oozpuG3H w==;
X-CSE-ConnectionGUID: 2BuqG+S0QG6F9Yq+en/mtQ==
X-CSE-MsgGUID: +uDtiwHET8Gqdx9mYpSN0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="550664"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="550664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 09:40:21 -0700
X-CSE-ConnectionGUID: Chb7PEBSSh2TvleyuXl+JA==
X-CSE-MsgGUID: MjMrBdQUS52fH+hhrBou9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="896782"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 09:40:19 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v1 1/2] drm/xe/tuning: Stop applying media
 CCCHKNREG1/L3SQCREG3 tunings from Xe3p onward
Date: Mon, 12 Oct 2026 22:49:03 +0530
Message-ID: <20261012171901.19508-5-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012171901.19508-4-nitin.r.gote@intel.com>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
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

Commit 288b775a1cd4 ("drm/xe/tuning: Stop applying CCCHKNREG1 tuning
from Xe3p onward") bounded the graphics-side Compression Overfetch
tuning to graphics version 34.99. The media counterparts
(XE2LPM_CCCHKNREG1, XE2LPM_L3SQCREG3) were left unbounded and kept
being applied on Xe3p-generation media blocks. Both were caught by
igt@xe_debugfs@check-gt-reg-sr on a CRI media GT:

  Mismatch on 0x82a8, expected 0x800000 got 0x0
  Mismatch on 0xb608, expected 0x10000000 got 0x0

For CCCHKNREG1, the tuning guide (Bspec: 72161) still lists this
programming for HUB_DIE (media) projects on this generation, but
bit 23 (L3CMPCTRL) no longer exists on CCCHKNREG1 on Xe3p, and
bit 25 (COMPOVFDIS) is also absent. Bit 18 (ENCOMPPERFFIX)
already defaults to 0, so clearing it is a no-op.

For L3SQCREG3, the tuning guide doesn't document a removal condition
for bit 28 (COMPPWOVERFETCHEN) on Xe3p, so this change is based on
the observed hardware mismatch rather than a confirmed bspec removal.
Bound it to the same Xe2-only version range as the related tunings,
and flag it for confirmation that bit 28 is actually gone on Xe3p
media, the same way CCCHKNREG1's bit 23 is.

Bound both media tunings the same way as their graphics counterparts
so they stop being applied from Xe3p onward.

Bspec: 72161, 59928

Assisted-by: LLM
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index a9bd3f8969a5..514deded1163 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -49,7 +49,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
 	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
 	},
@@ -58,7 +58,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
-- 
2.50.1

