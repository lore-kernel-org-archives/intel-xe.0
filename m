Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C3F54ABA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534289151;
	Tue, 24 Mar 2026 13:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3/Xop+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB0E10E6E3;
 Tue, 24 Mar 2026 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774360158; x=1805896158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6r8KECnlj1SVsMlrNERTd3eski1AJkDI8fZE38Cn3js=;
 b=m3/Xop+3bGyumLg65GOynTopGwqy1HflDDIZV4alrPKQjF8/tIkXsyvx
 qLMno606Ivbkz/O7luf7ZMGFrFzKBt4yNqdGrAQ76za/VdeOyEVvtKUmh
 pkHT9sdox9RXrfAgkoNCUtC5h9liByCyDCLgkgf3iT2tNypBSywvJYynV
 QnxtH0V0qUz0fcwWyL+DPCA1XlWaVzHbhVAJh2rL21X6fsik6rDqg9qFi
 EFbnVjNpOmd8xrYh66D31cTdu+EwVXFrZlVy/JPw4N+J7Bv1Z7g+HKqO7
 M2jspwRp2Oej2OcJRPXrrv1iYNFrVt1/F44deCX8Qxq4WPQ0WTvuLF6Th w==;
X-CSE-ConnectionGUID: RvnRfCk5Q66j1ZKBFevTDw==
X-CSE-MsgGUID: Xi3TUj/sS2SvokwtsPW9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100818975"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100818975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:18 -0700
X-CSE-ConnectionGUID: IC4aV4geRvC1fkGtGGb8ng==
X-CSE-MsgGUID: eApkD4SNQsSusf2EqmQmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229105203"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915/wm: Verify 'ddb_y' as well as 'ddb'
Date: Tue, 24 Mar 2026 15:48:41 +0200
Message-ID: <20260324134843.2364-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Verify the pre-icl NV12 Y color plane DDB entry. Thus far
we've only verified the RGB/UV DDB entry.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 17faf090a154..1d932c37d768 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -4022,6 +4022,10 @@ void intel_wm_state_verify(struct intel_atomic_state *state,
 		skl_ddb_entry_verify(plane, "DDB",
 				     &hw->ddb[plane->id],
 				     &new_crtc_state->wm.skl.plane_ddb[plane->id]);
+
+		skl_ddb_entry_verify(plane, "DDB Y",
+				     &hw->ddb_y[plane->id],
+				     &new_crtc_state->wm.skl.plane_ddb_y[plane->id]);
 	}
 
 	kfree(hw);
-- 
2.52.0

