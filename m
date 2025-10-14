Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665CBCCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 04:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5B010E532;
	Tue, 14 Oct 2025 04:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a++K8f45";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B7610E53D;
 Tue, 14 Oct 2025 04:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760416198; x=1791952198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HhNo7tK05exLFDSavBURdfIe0jqz+ScIHLKEybcvTzg=;
 b=a++K8f458tyNpP50nGXVNfGLwMGjAW/RYVxsHFlsK8B8EcLvEfgciUla
 geg1tI0Ii74dHmkBU+QUpkBvrbLa7EAJhwsZ8QtgBnEt9SI38fSt8AEUw
 0A+IElIPmdXW17dRirm1HcLYjS5fYKLj0QM1xzndQKASVhJBLP5Vcew4O
 r+iUTsjREymIWhh5lpmybzjBsWjLnMSa0Z3lpHUhGmgbqp6U1Orv05B8I
 HZRl+XVAxv4XyMek3wKx12Vp6OEHuQ2sllK1pVXJSSQ3iP+aE3+0zp8tV
 MEi6ZlZQxwFwGzmrSyhNXZ7Z/hu/CKu6QMyeqLNdxPrW6HmrUJU8DIgDz Q==;
X-CSE-ConnectionGUID: uKLhJmgFT1yAqSeJ39/BUw==
X-CSE-MsgGUID: 6O9av0yERcW9kaVCKfNQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88029798"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88029798"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 21:29:58 -0700
X-CSE-ConnectionGUID: /6asXH/tR+CjGD6QndLOFA==
X-CSE-MsgGUID: BVviPd/fQvWD6TVt0VImGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212399851"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 21:29:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 8/8] drm/i915/display: Prepare for vblank_delay for LRR
Date: Tue, 14 Oct 2025 09:46:28 +0530
Message-ID: <20251014041628.1291117-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014041628.1291117-1-ankit.k.nautiyal@intel.com>
References: <20251014041628.1291117-1-ankit.k.nautiyal@intel.com>
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

Update allow_vblank_delay_fastset() to permit vblank delay adjustments
during with LRR when VRR TG is always active.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ceee5ae99c2c..65a7da694ef6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4958,9 +4958,15 @@ static bool allow_vblank_delay_fastset(const struct intel_crtc_state *old_crtc_s
 	 * Allow fastboot to fix up vblank delay (handled via LRR
 	 * codepaths), a bit dodgy as the registers aren't
 	 * double buffered but seems to be working more or less...
+	 *
+	 * Also allow this when the VRR timing generator is always on,
+	 * and optimized guardband is used. In such cases,
+	 * vblank delay may vary even without inherited state, but it's
+	 * still safe as VRR guardband is still same.
 	 */
-	return HAS_LRR(display) && old_crtc_state->inherited &&
-		!intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_DSI);
+	return HAS_LRR(display) &&
+	       (old_crtc_state->inherited || intel_vrr_always_use_vrr_tg(display)) &&
+	       !intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_DSI);
 }
 
 bool
-- 
2.45.2

