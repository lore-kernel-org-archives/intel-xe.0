Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB20EBFD3E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 11:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BF410E104;
	Mon, 13 Apr 2026 11:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP73mLUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A169A10E104;
 Mon, 13 Apr 2026 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776079441; x=1807615441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iI/QH+BncmYUzNfTGdAuXn7COAG6QUx6ILaw2qbVcrA=;
 b=bP73mLUYZ5HDO06DDhaGSurqcm5IyDNp5XO3ZlAYkSN6U2w1UE/c9A/H
 ubJZhFlBBRpqkeWQk6dnubMt9JCh00c4J7rhmeAVL/S8Qh8ZCmwWw9vyb
 DaEx7Wa7fr8oXupw1Y/vh0/NBdOAxAq+/oi80I6d73O+0hQIW3Tginw2P
 XM17z9az4XCkCbU4YmWeuiTpU0DW7EFz/mEiM4sPNM1mpJviSaFblcKnp
 bZCfanNlX4hfm5WnSBsrWjzsuezJA3OqisB5udIuX/+aKdUoyp/zZmn90
 GYz5X1jHl5QWq7PsUOktOGzZzJKb5daofoALPC7Kb2tyFFk8UoH3FsvvL Q==;
X-CSE-ConnectionGUID: JhCjkm0eTOmA9If2DZRnsA==
X-CSE-MsgGUID: PhGDykmwTB2uBQbJTPSP7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99656714"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="99656714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:24:00 -0700
X-CSE-ConnectionGUID: burOrOHLT1WSw4+oQ9230w==
X-CSE-MsgGUID: NoJrNgoLQ66n91tb0o9kBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234681914"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.251])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:23:58 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/psr: Init variable to avoid early exit from et
 alignment loop
Date: Mon, 13 Apr 2026 14:23:45 +0300
Message-ID: <20260413112345.88853-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

Uninitialized boolean variable may cause unwanted exit from et alignment
loop. Fix this by initializing it as false.

Fixes: 681e12440d8b ("drm/i915/psr: Repeat Selective Update area alignment")
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b4ca5843d098..63c19958a9e3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3002,7 +3002,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		return ret;
 
 	do {
-		bool cursor_in_su_area;
+		bool cursor_in_su_area = false;
 
 		/*
 		 * Adjust su area to cover cursor fully as necessary
-- 
2.43.0

