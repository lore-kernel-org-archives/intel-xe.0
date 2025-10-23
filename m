Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2853CCF9E0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 04:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F042B10E86D;
	Thu, 23 Oct 2025 04:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAOhtg8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503D10E86C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761194696; x=1792730696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3xF57tDEcG2YbOrleTm+xiZlQtMao+K5fkDYpyTXDF0=;
 b=TAOhtg8ycvkwxWWbCUpwn7H6MfxgFjPV5kwui62jxbAL+Jpmkej3viQh
 NjWSWTRcB1n5rbIgDEsYeGnVzOONh4RcL9gzZ+LzjaSwq8CCL0LvoVlVf
 N0nxvB8+Qr6p8XzsJkkt0vUXa2vI23v02A1taDBPZy3w+MM8KcSsmeFsy
 a0Yfpl0mVK/u0XqoB6oA5mtIb2Bh6WGhh0xUbNOGrsG73Bw70xJvtLTLY
 yH1GMiDJc8A8sp3+0wGPRIbkX9kfYqr4X5ogTHHqaUcmLi8lb5jMPaeml
 7wHnDkUvwuEDXMsLClcsLgNwkbCE2pJjbE2VF2BRRvCIpqIO3Tp2f+IsD w==;
X-CSE-ConnectionGUID: zieAhUUvRDGj5lGHE4oGvg==
X-CSE-MsgGUID: zUBOU52JS9Kxd9bgLPA3qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73959395"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="73959395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:44:56 -0700
X-CSE-ConnectionGUID: zY+ooXexSPOKxFRV2tcUSQ==
X-CSE-MsgGUID: IwwhFC0jQoexLUZAvocRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183949323"
Received: from hchegond-ivm1.jf.intel.com ([10.88.27.163])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:44:56 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com, lucas.demarchi@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP version
 30.05
Date: Wed, 22 Oct 2025 21:44:49 -0700
Message-ID: <e7274c1ca6463600c03e9a989f4aa54aa1fa0994.1761193711.git.harish.chegondi@intel.com>
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

Apply WA 18041344222 to Xe3 LPG graphics IP version 30.05 too.

Bspec: 56024
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b6dcd9827354..e3dee5b36ba6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -700,6 +700,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups), OR,
+		       GRAPHICS_VERSION(3005),
 		       FUNC(xe_rtp_match_first_render_or_compute),
 		       FUNC(xe_rtp_match_not_sriov_vf),
 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-- 
2.51.0

