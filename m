Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E7FCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494510F084;
	Mon, 12 Oct 2026 12:41:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B510EA7D;
 Mon, 12 Oct 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808912; x=1823344912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rd+Sum6a3YbWBhUwHltvOPB/oPjq0wRb8FdPHgldudU=;
 b=iiiBAMWBhXh+YtrG0ZV4Qi3mul0HJXN7u0vmSfH2N4tbnW6g3n7DuUhK
 +/8xUdqMzXBmAsjvZ22aYx/X6BH1h6Z4Hgk8RUkz9vrmZbe3pfrkWGlvP
 tUcMxEnJuFGII5GTt771ipTHn4hYJdmLQMcWuTfUMYWdmWbGpNZnKDvU6
 FN1b1Vb5qbR06DdeIU/zaZ4T7eGvo2UyHWxcyBZiX94OWZwK+SAaSHyIQ
 6xmmN1CmvPKI/KRDmLlRSe/K9SXKd9473sqfjjcqihV6R+V9/Au+/czeS
 rar1RrTzsmNM6a/eyQ+OjJwgT7usmE+b7CwDYlZ/jOejrGk4ZN4aKQcbm A==;
X-CSE-ConnectionGUID: a0fvSRkAQiy8SnBgzjycjQ==
X-CSE-MsgGUID: YMO/7jxFRsCqeghC+P0iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506206"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:51 -0700
X-CSE-ConnectionGUID: /mc7nMwnR+OPiyJveIuqzg==
X-CSE-MsgGUID: jLjqGlDSRIaKg6R29yXMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808154"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:51 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 2/6] drm/i915/psr: Exclude the joiner secondary from
 active_non_psr_pipes
Date: Mon, 12 Oct 2026 12:41:41 +0000
Message-ID: <20261012124145.1960050-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
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

active_non_psr_pipes holds the pipes that are active but not driving
PSR. Masking out only the primary leaves the joiner secondary counted
as a non-PSR pipe, even though it belongs to the same PSR instance,
which blocks DC5/DC6 and keeps Wa_16025596647 applied.

No functional change, joiner is still rejected in compute_config().

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 0d4f71f14396..76260ceb49cb 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1858,7 +1858,7 @@ void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 	active_pipes = intel_calc_active_pipes(state, active_pipes);
 
 	crtc_state->active_non_psr_pipes = active_pipes &
-		~BIT(to_intel_crtc(crtc_state->uapi.crtc)->pipe);
+		~intel_crtc_joined_pipe_mask(crtc_state);
 }
 
 void intel_psr_compute_config(struct intel_dp *intel_dp,
-- 
2.43.0

