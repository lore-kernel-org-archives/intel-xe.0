Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E495C61DD4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E815410F11E;
	Thu, 27 Aug 2026 16:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBU9IWuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D97310F11B;
 Thu, 27 Aug 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849091; x=1819385091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JcplhJnFLY1/LbsTbNjddgLTuXOGaaHxwVcSwO4dok=;
 b=KBU9IWuycPD7erghjqlH6nPF37EHUOuIUpNxGOVWQBxo4cNOReE44iLs
 defBJbxydz3prmVnbaMDMR7rSLeus5l0aoJCmA90Vl91mUFITcbF6teyL
 PyycXnyJUuTUrGqf6s4VSOtyrmM+vzxChWuIvjZzEXvfMf2aTkHnbHxQQ
 QWVg+BluJXZfYgkaU6ZZSwHT6bHuKN0ApAAYPDoYToHfYqPVkpmUPYQTC
 BnKX3fwbqQgOG5+mOoj7pTf0r3bov7TXHHTiODSAQtzrFVKP6d/dbmtvs
 VKHdWjbWDsDo4cVAlQrn1/tYN5GdWNrpNRjFJVvajUY1QEYHyv/KoBCxi Q==;
X-CSE-ConnectionGUID: XJ0SEnKPT/yWxg+mkzUCvg==
X-CSE-MsgGUID: GCB0PUR0TJajnfF/W2YOMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88276137"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88276137"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:51 -0700
X-CSE-ConnectionGUID: ZNXf29VwQgyxUDE/VJEkuA==
X-CSE-MsgGUID: OilwdAGaTPW3ePUaCQc5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306134085"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 27 Aug 2026 09:44:50 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/5] drm/i915/cursor: Allow joiner cursor fast path update
Date: Thu, 27 Aug 2026 22:12:03 +0530
Message-Id: <20260827164203.2371794-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
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
index ec20319834f9..c3ac138f78b4 100644
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

