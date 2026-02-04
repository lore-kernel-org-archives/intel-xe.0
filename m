Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3E1E8B39B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 05:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194A10E2FC;
	Wed,  4 Feb 2026 05:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2tqrLvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411210E288;
 Wed,  4 Feb 2026 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770182321; x=1801718321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9KVUITN6kjGOqMrbp7lTYE3UxXfkfwsW3O1FtmF3x44=;
 b=i2tqrLvmGwNE2bTcfU+I+D03pBZF5KViLyBABTGbG87f89cAj/l89QN0
 aWRs3OKyLBsjEljcSv+8GFiYuDXf7vnzg2R8GG0LunXg/sc8mEwiARCbt
 bYVcxfTRYVV9X8jdzYFe56mwOE9dwgQT77Tbc3wzpSre7Dn0/8Z9719EJ
 NAotKSd+cWtYZDtTY0Lm0pTe6Bg0rBKxWIq5U5MrbFegs6SH4aO1gl8HD
 xDfAhHvFSG+j6ZfT3uStfdoXJB7iftzF1IWHDjl269i/k1B6UnFSuTxeS
 NszntPfDIAxrDsscvrTPFyIahWjXh2nOpltHn1VbpIqCh4wRgS5UoeNzy g==;
X-CSE-ConnectionGUID: SZsa0s5uRdeOKPFwC5NoHQ==
X-CSE-MsgGUID: EhygxGHEQ5Snmabw48QMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82102822"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82102822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:41 -0800
X-CSE-ConnectionGUID: 7soI+WjEQzOfOpQwgrvZPg==
X-CSE-MsgGUID: D/SVDBgXR5GSJh/5L/7maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210127490"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:39 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 animesh.manna@intel.com, michal.grzelak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 3/5] drm/i915/alpm: Allow LOBF only for platform that have
 Always on VRR TG
Date: Wed,  4 Feb 2026 10:32:48 +0530
Message-ID: <20260204050250.762718-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
References: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As per bspec the LOBF is allowed when running in fixed refresh rate mode
i.e. when flipline = vmin = vmax and when window1 is non zero. This
implies that we can allow LOBF only when VRR timing generator is running
in the fixed refresh rate mode.

Use the check intel_vrr_always_use_vrr_tg() to avoid LOBF with legacy
timing generator. Also use intel_vrr_is_fixed_rr() to check for fixed
refresh rate mode.

v2: Modify commit message to clarify window1 requirement for LOBF.
(Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 27b26e5813dc..3aeab4bebce2 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -351,8 +351,8 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (crtc_state->has_psr)
 		return;
 
-	if (crtc_state->vrr.vmin != crtc_state->vrr.vmax ||
-	    crtc_state->vrr.vmin != crtc_state->vrr.flipline)
+	if (!intel_vrr_always_use_vrr_tg(display) ||
+	    !intel_vrr_is_fixed_rr(crtc_state))
 		return;
 
 	if (!(intel_alpm_aux_wake_supported(intel_dp) ||
-- 
2.45.2

