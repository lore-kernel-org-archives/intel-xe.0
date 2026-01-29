Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9CCD73E87
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 22:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A8C10E8D3;
	Thu, 29 Jan 2026 22:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs9D6XEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF710E8D1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769724003; x=1801260003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbE17XBzHj0dBj8FLD8he9Tc2Yn4DYQZPnfCL3GsCo0=;
 b=Zs9D6XEOuRRxPlbulm9V8jmR6U/SrJpIEU1Wh9Uzmkc05kRjYBANncaK
 3ZRWm3EXXU/snfYowO95yllq6mndiQ5gYEedBdFmkAcs8O31+t+LMMERt
 WPil7hKXWAf0mkChPvGQ9q3K/fd58tnxn4zQp8TvJeN89NkNl+7Mh7NFJ
 //9MV0h6JB21+A8YFw5DCuumvA/3Dh2oWBvqPGWXKfsc+OSC667ZKN6aH
 GeF6okDPRQJDMhfG+9oRxI7wlI0hMCpdkWDUi6XZ1uq4StsbaKm2bfaIK
 w9UaQXe28P5AU3UOoyVdJHwWi/12JAnG8F1UCxwvPjcN0zCscDwg6/iQG Q==;
X-CSE-ConnectionGUID: rbFja7FZQyWgUVSvnO8BWg==
X-CSE-MsgGUID: udCXZ69SRy+5NKEeAxNssA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70871853"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70871853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:00:02 -0800
X-CSE-ConnectionGUID: K6L9bAUiS9C974bBHIOz8Q==
X-CSE-MsgGUID: GG9Y4G9JQhKacCE5Y8neVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="209111920"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:00:01 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/xe2hpg: Remove SRIOV VF check for Wa_18041344222
Date: Thu, 29 Jan 2026 13:59:55 -0800
Message-ID: <928d363f96c55923f7765afdbc833d515fdb80b9.1769723894.git.harish.chegondi@intel.com>
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

Engine WAs are not applied to SRIOV VF. Remove the SRIOV VF check.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Fixes: 5952d80514054 ("drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG")
---
 drivers/gpu/drm/xe/xe_wa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a991ee2b8781..63a81d9c6e9f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -607,7 +607,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_not_sriov_vf),
 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
 	},
-- 
2.43.0

