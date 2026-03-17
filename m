Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D595EF33809
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 07:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E58310E49A;
	Tue, 17 Mar 2026 07:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2vdNkH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9DD10E49A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773732471; x=1805268471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2rzDPUhIj1OULlEijyfpgirTcm0b+JZ551eKbsvmOU=;
 b=Q2vdNkH6PhKitgJWqFAIekhZIU/nm79M2Tr9mZWYXkLg5rC9HXodIbEe
 n9aGbFl2d7lum0RCxieiER/5xMICJZG61pzNOGbs80NRsUBag3QEzFbC3
 3p4QvbeExyBm5b7vsYjlzkhxPEcQbgKKh3fqEd1fvevjzwlT5L0hZKeL9
 91Cbb4t1AvaUBZmbJRmIL+JVShf6BKUgu+toA9j/NwjKes7exUfAoM7Bi
 1VHKp7ktTHdPTG0vpfEU80tyBh33+kAskHtYP1V3xj5JeGEKOLy+Xe86W
 pIfOJfOZfqwUO3cweR1KQRVufqOO4ByvcjScQxKShLRtIiWlsdi9EhJS/ w==;
X-CSE-ConnectionGUID: 9BR/T8hIQqeX7B6ABsQ5+g==
X-CSE-MsgGUID: RgVQr/2nTCG3Ot8thviGQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78652107"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78652107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:27:18 -0700
X-CSE-ConnectionGUID: YRdUN/xdS9aJ9e1LVXE+rQ==
X-CSE-MsgGUID: fhL0Ni93TemDdxWqFEkDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="218350691"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 00:27:17 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: Extend Wa_14026781792 for xe3lpg
Date: Tue, 17 Mar 2026 13:30:59 +0530
Message-ID: <20260317080059.1275116-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_14026781792 applies to all graphics versions from 30.00
through 35.10 (inclusive). Since there are no IPs between
30.05 and 35.10, consolidate the RTP rules into a single
GRAPHICS_VERSION_RANGE(3000, 3510).

v2: (Matt)
 - There are no IPs between 30.05 and 35.10 either,
   So, consolidate this into a single GRAPHICS_VERSION_RANGE(3000, 3510)
 - Also move it up to the top part of the table

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 8c55cd187a0c..6905f3638c29 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -656,6 +656,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("14026781792"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3510), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
+	},
 
 	/* DG1 */
 
@@ -776,10 +780,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
-	{ XE_RTP_NAME("14026781792"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
-	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.50.1

