Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3CBC61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE4110EB88;
	Tue,  1 Sep 2026 07:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLsBBDWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163310EB80;
 Tue,  1 Sep 2026 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788247866; x=1819783866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4dwIjv95A9Wni0v8Skdcy1gBgByDfZ78LLlEp4CtO8Q=;
 b=PLsBBDWFDXqnbLzGpeIF0zETfKJo2Tcq5m48FTVJsWuhkYNkEbPiynaP
 vaSFfJL3jTY5hyITIbolcwXEmaDfDxcMAhzgrLTOYlmXJoFG9mn40hzKp
 k+vhxAmRhAcC6s0KKHS1v7jiauHw2VxgPxMNUFsMzQ5PdG2b3Qgl8V5Em
 AqjtPOpQMqOvVf+7pVqjMw2WZWOvJhVykDDsENIjAcWGOpTJ7ucnWYmjg
 vWwqlfpPWsrrKQyjV7LW8AxAX2DEABWzFRkXMoGliVkNyUrXn1DgDv/la
 0y24O3IHnPNthMS4KK6KjmmN/0o2kQCUguweie+DKbwDM20U4H0xunl6C g==;
X-CSE-ConnectionGUID: 5PlAuOqmQCCjykHtmEgIiw==
X-CSE-MsgGUID: yU7RP3MwSViIbBEw1cbhUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88692050"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88692050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:31:05 -0700
X-CSE-ConnectionGUID: Ed0014vhTja9chtBKyQjQA==
X-CSE-MsgGUID: jb/OZ9pSQLiJDY/AkQlgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272803125"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 01 Sep 2026 00:31:04 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 5/5] drm/i915/cursor: Allow joiner cursor fast path update
Date: Tue,  1 Sep 2026 12:58:13 +0530
Message-Id: <20260901072813.2596383-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901072813.2596383-1-nemesa.garg@intel.com>
References: <20260901072813.2596383-1-nemesa.garg@intel.com>
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

The legacy cursor path forced all joiner updates to the
slow path by checking joiner_pipes.
Drop the condition so that joiner cursor updates can use
the fast path.

v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 894bd1df5f42..cce041e1da51 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -914,13 +914,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * PSR2 selective fetch also requires the slow path as
 	 * PSR2 plane and transcoder registers can only be updated during
 	 * vblank.
-	 *
-	 * FIXME joiner fastpath would be good
 	 */
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state) ||
-	    intel_crtc_needs_fastset(crtc_state) ||
-	    crtc_state->joiner_pipes)
+	    intel_crtc_needs_fastset(crtc_state))
 		goto slow;
 
 	/*
-- 
2.25.1

