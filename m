Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A9D73E9B
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 22:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B086C10E8D1;
	Thu, 29 Jan 2026 22:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0+0lg6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EBC10E8D3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769724004; x=1801260004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bg0FQ6549vPye3KniorxT2tKwvQSWTztHiAY5iWmdrg=;
 b=b0+0lg6Dg2r5jeN90JMn5qR+Nhaja9rRoNxeGHiFhqM/EWsgTNzbwDKa
 86CEXPJXZo1bqMbZt2Q4wvt1Zxj2M1f2cgPbNNB0G43K7BBHV25LYgeHd
 RHmZNQaGf7mDZ4uo6aQQNgUB1KskbTA30NaSz9exNiyCf/JysuW7w+F/M
 jlD/KWK3Z05VfO4dH28xO6l9lMuptfwLFzDax/DdqRuEmcZCw0+j9o6dS
 fLiSDpVoGVAJgwzn357MlAVT0DeS3UkaqhLsyqmZUJokDhV3q1FTY5toV
 VIgh88Ahvv5FfEhMFXIfaB41vYpyZtpJoKZxKKQ/nKq3fviGc+CsdBoZG g==;
X-CSE-ConnectionGUID: v4KK0DjPR+qamVa9NFHvuA==
X-CSE-MsgGUID: zO8ejz7yQOmt217owtqa9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70871854"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70871854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:00:02 -0800
X-CSE-ConnectionGUID: xHaseIpZSnaEsRjtcnN8qg==
X-CSE-MsgGUID: TbnV0cQUT8ecowvAMlxz7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="209111931"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:00:01 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/xe3: Remove SRIOV VF check for Wa_18041344222
Date: Thu, 29 Jan 2026 13:59:56 -0800
Message-ID: <4eac51df7bcd91950dbce008164fa8f36c1f7d3f.1769723894.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <928d363f96c55923f7765afdbc833d515fdb80b9.1769723894.git.harish.chegondi@intel.com>
References: <928d363f96c55923f7765afdbc833d515fdb80b9.1769723894.git.harish.chegondi@intel.com>
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
Fixes: 2a810401aa054 ("drm/xe/xe3: Extend Wa_18041344222 to graphics IP versions 30.00 and 30.01")
---
 drivers/gpu/drm/xe/xe_wa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 63a81d9c6e9f..63575c88034f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -675,7 +675,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
 		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_not_sriov_vf),
 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
 	},
-- 
2.43.0

