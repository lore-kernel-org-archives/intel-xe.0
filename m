Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636EBC4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06F10E499;
	Fri, 17 Jul 2026 15:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+KOr5+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3C10E493;
 Fri, 17 Jul 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302980; x=1815838980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OFq/rXskxpGdoEJrWbmTVghyC0Mfx/ByWq8FpV3CVO4=;
 b=I+KOr5+/78cLO4eQJxg4wzXXVlvMoEaucKg1SEw/o+zu3hwFTZCzB8b4
 3TGKBUtvQBv1Uy60adIuKATWMX9TpmANqlN8am2lj2KRkVoMsp9QSTVMj
 YDU0tE2nL09rxn7eGj0EV9OI7k6lPUilYPamvflJTEQxhWtsfbd3wMXLU
 fbZ3zUckkZlW6IR7JiMAHM5TjLRbqGQ6yux4LwCXU3n/TOHPASq/eELVh
 FiaNhyOizmgQi8YdvP/eLONSXdr9B34UQixhHw5TL6+dnSPKMTdfwWaW3
 TVDsnOMIRlSgacn+0VWENTL2+HdEX5a7h4W/QmY2J0WakTR9wC0BqYljF g==;
X-CSE-ConnectionGUID: CwrS0XQsRtuduzOkXYj+MA==
X-CSE-MsgGUID: X1uLR+MFQAarxtsNUgQ7Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88797413"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88797413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:59 -0700
X-CSE-ConnectionGUID: A9FvvGv6SQqEEwNvVq19BA==
X-CSE-MsgGUID: E32NUUO/RR6e/+6Im7cpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="261089164"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:58 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915: Simplify intel_reuse_initial_plane_fb()
Date: Fri, 17 Jul 2026 18:42:35 +0300
Message-ID: <20260717154238.10792-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
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

There's no real reaosn to check crtc_state->active
and plane_state->ggtt_vma in intel_reuse_initial_plane_fb().
All we really care about is the presence of the fb, so check
for that instead.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index a19c5487ccf3..67e4bbbd0d6a 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -55,13 +55,8 @@ intel_reuse_initial_plane_fb(struct intel_crtc *this,
 			to_intel_plane(crtc->base.primary);
 		const struct intel_plane_state *plane_state =
 			to_intel_plane_state(plane->base.state);
-		const struct intel_crtc_state *crtc_state =
-			to_intel_crtc_state(crtc->base.state);
 
-		if (!crtc_state->hw.active)
-			continue;
-
-		if (!plane_state->ggtt_vma)
+		if (!plane_state->hw.fb)
 			continue;
 
 		if (all_plane_configs->config[this->pipe].base ==
-- 
2.54.0

