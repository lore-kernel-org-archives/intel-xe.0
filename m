Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32FDC25B79
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 07:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696A410E1D1;
	Thu, 16 May 2024 07:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecFnHBUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DD10E1D1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715845611; x=1747381611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n874GnxclT8yqK7YClcHJVStrvMTOvlNyKivKYxyLII=;
 b=ecFnHBUT0LTJlBHOFNycJk2EbLN09oV0CYIHW4RLC7pjQ2ClZwUTnyL3
 hycLyVOYlc7Di6EBXwYOri/nciB4K7nfrUw/T6Bur2asQkoDi325G1bU7
 RnvlxPZytdZGxyaur4jUbpeqq+2gkxEN3HrxzZLof8cv0OU77CngccBAp
 P+NvMNB5hE6KJUSsYsW1BMdX+gkH5zHAOIuebSuTORTr9Bq5q0UbmLZp9
 Aanzx0jmlmCX5aERvTPi1mbYUtsumJIDWxo6w3pZDOFwqhtyEgcf7fwxi
 mP8A2X7Ae5kNcWoDshMgUfKnXDAn9V11PsJ9cyZ6uysDWfG/bm7enk+V1 w==;
X-CSE-ConnectionGUID: VF1+78d3Qqa5iUXkhDmjsw==
X-CSE-MsgGUID: SWbe91M7QAGiL55gATLTDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15720014"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="15720014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 00:46:50 -0700
X-CSE-ConnectionGUID: Ju2G9w83TbaJLkNTbhijlA==
X-CSE-MsgGUID: RydLS20gRvSc6OeYPzDeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="31269859"
Received: from tlonnber-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.12])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 00:46:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] DO NOT MERGE: drm/xe/display: Disable PSR by default
Date: Thu, 16 May 2024 10:46:36 +0300
Message-Id: <20240516074636.1514540-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch is here just to trigger BAT testing with PSR disabled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 1208a62c16d2..54aca1c559eb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -44,7 +44,7 @@ struct drm_i915_private;
 	param(bool, nuclear_pageflip, false, 0400) \
 	param(bool, enable_dp_mst, true, 0600) \
 	param(int, enable_fbc, -1, 0600) \
-	param(int, enable_psr, -1, 0600) \
+	param(int, enable_psr, 0, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
 	param(bool, enable_dmc_wl, false, 0400) \
-- 
2.34.1

