Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82DC5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D2810E8FA;
	Tue, 25 Aug 2026 06:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDkzToks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E610E8F9;
 Tue, 25 Aug 2026 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638786; x=1819174786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=st59Bg952GNAStYyRp5XZ5vyG0EdVM4+mgSG2nztkfM=;
 b=jDkzToksBcplG8vqYozRQfvqf4AEPD0HkZBN6qH9qixNb7ompDl+F7p1
 C6VUwDitykEZUiuWV2dIQFWC3SO9VNmNXrbSafzzzdio0ofltgXRTFpt3
 rAf889KcfB2EsPfmqPLA/1/QX4X5lF+j1v1z99UmVI8qrEprQi/AeSDWU
 MTY9SlfcTGI7NhHZ/9XL1KMuzl/Zw4hBGwpgI3CFi6FuuiDqCH9wA2nxj
 vKgfyei/HRyNWBjTpXXk3/+bjTp/DeEchtlEgQtrUSIcL3y29bWjhE0NI
 1EDfQrlrS7CZX5bAvlNKpjcXmjtGlRUiWqwbSJLy9ePdMeqIcKn8atf2s A==;
X-CSE-ConnectionGUID: sah7DyAqR9a1N5w5zwJADg==
X-CSE-MsgGUID: wnmIHBRERGSvRCiLhTfA5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112708"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:46 -0700
X-CSE-ConnectionGUID: EMQXbGvTST6ug50b1mUDbg==
X-CSE-MsgGUID: w83K184KRsiHG45X3sI9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263913034"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:44 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 15/15] drm/i915/alpm: Program zero-based LFPS half cycle
 duration
Date: Tue, 25 Aug 2026 11:15:36 +0530
Message-Id: <20260825054536.3455704-16-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

The LFPS Half Cycle Duration field, as well as the First and Last LFPS
Half Cycle Duration fields, in PORT_ALPM_LFPS_CTL are zero-based: per
Bspec the value programmed must be N_Symbol - 1. get_lfps_half_cycle_clocks()
returned N_Symbol and programmed it directly into all three fields, making
each half cycle one symbol clock too long.

Return N_Symbol - 1 so the programmed value matches the zero-based field
encoding.

Bspec: 71632
Cc: Jouni Högander <jouni.hogander@intel.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 5d2ac7561567..9768279f94ef 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -123,8 +123,16 @@ static int get_lfps_cycle_count(const struct intel_crtc_state *crtc_state)
 
 static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 {
-	return get_lfps_cycle_time(crtc_state) * crtc_state->port_clock / 1000 /
-		1000 / (2 * get_lfps_cycle_count(crtc_state));
+	int n_symbols = get_lfps_cycle_time(crtc_state) * crtc_state->port_clock /
+			1000 / 1000 / (2 * get_lfps_cycle_count(crtc_state));
+
+	/*
+	 * The LFPS half cycle duration fields (including the first and last
+	 * half cycle) are zero-based, i.e. the value programmed is N_Symbol - 1.
+	 *
+	 * Bspec: 71632
+	 */
+	return n_symbols - 1;
 }
 
 #define ML_PHY_LOCK_LEN		252
-- 
2.29.0

