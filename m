Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616C4ECD6F5
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD4C10E669;
	Wed, 11 Feb 2026 23:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvPSgTQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E597810E66D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770853659; x=1802389659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U3HtaFysgbjBRPHVMUdz9DlFHrciAh2itiygYLak+IE=;
 b=TvPSgTQJzqQvuON3yh+N+wO3AJs3NR52rPM/n0plrrT+ellDVdM2PM9E
 rmz4z4vDqzKmwRs6PJjT40jPHVT7IwGsdPqj1VzVuo5ZVt9ux+ZzCsdt0
 tzR7Vm0tqR3WVeGekv6qlPTTxFcSfBBwvhqYus10qqlUyYpTB++dUIN4W
 HztMSN9Q4YYNjyR7NQYzJDzNjUFX3VYXOPK+zzIcS/5lT+KPAoNSrw0d7
 9+vDKp+hR7T00uFQ6CP8bT5pBYeOLwUI8W/qFTo0MRKgehKY/7ltH0X4q
 BPtWxMA6I4s+S2UxmKFcpE7FJrs0OJmR5HDWd6bi4g9MJERfI/yl/xieX A==;
X-CSE-ConnectionGUID: b5wOaoR0Rr26brAdA+JCCA==
X-CSE-MsgGUID: vf1LeXLuQq28hiXVJNnjJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83114932"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83114932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:47:39 -0800
X-CSE-ConnectionGUID: VbzaexsqRqaT6Sh1sc6a0g==
X-CSE-MsgGUID: tR53tuXDTeai1TQ+rKJjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="217367411"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:47:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Stop applying Wa_16018737384 from Xe3 onward
Date: Wed, 11 Feb 2026 15:47:36 -0800
Message-ID: <20260211234735.620087-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

Wa_16018737384 is one of the rare cases where the hardware teams mark a
workaround as "driver change required" rather than "permanent/temporary
workaround" in the internal workaround database, signifying that the
implementation details of the workaround should just be considered
standard programming instructions on all platforms going forward.  Cases
like this are the only time that using XE_RTP_END_VERSION_UNDEFINED as an
upper bound for a workaround's IP range is warranted and correct.

However in this specific case, the register bit in question (0xE4F0[1])
simply no longer exists in hardware from Xe3 onward.  Trying to write to
that bit on Xe3 or Xe3p platforms is harmless and just doesn't have any
effect, but it's possible that the register bit could get repurposed to
control something else down the road on future platforms.  To avoid any
surprises in the future we should replace the unbounded upper bound in
our RTP table with a value that accurately reflects that Wa_16018737384
can only apply to Xe2 platforms.

Bspec: 56849
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 843ce9fe7aab..61c4187dc0ae 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -588,7 +588,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
 	},
 	{ XE_RTP_NAME("16018737384"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-- 
2.53.0

