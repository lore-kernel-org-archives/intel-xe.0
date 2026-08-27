Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B7C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8E510E32D;
	Thu, 27 Aug 2026 12:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVXgRLKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E9310EFE0;
 Thu, 27 Aug 2026 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834117; x=1819370117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFYVoCbl4v8FcZ5EzL3KdFlj96azPY3aT198Hn0j7u8=;
 b=HVXgRLKDBmbft1ehJexPm9PbZ9l/z0MPEvetgvSkFYK+4hTZLfwr9OUo
 0rgewpJgPKKFDkZGVhn69mV05rUvi1w+uGF6TEEiQ5yFGUbwx4XDSk46M
 DieaOBczQ0KJbHksF8/aAcVqA/1AtB3qkPWo4cE09cQlWOPpda2Q5rjMU
 wkHBYtB7r4+vJEhJ+tjcrHp4DOZhSQLN/mbZX5UiLSwPGaV9j0zE6gzLm
 jj4LgxRM2YiHScY1M1uK7bWuLYebzG53jBGebvlwkECGerC+CzG3PwNLK
 MDPBWvJlcNb4WwXRJXcWv17dfxiYWHg51lgY3mlaQFzX9GraBbrJwLF7H A==;
X-CSE-ConnectionGUID: rku+JynIT42jY9yX1REDkA==
X-CSE-MsgGUID: oOrTgIljRVO8PgS1ZYCYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98929276"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98929276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:17 -0700
X-CSE-ConnectionGUID: hAOrb4GkRMOb/P9Y4Bwcyw==
X-CSE-MsgGUID: rWYZWN63Q+OXWslHKuvddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="261734655"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 3/7] drm/i915/display: use struct intel_atomic_state *state
 variable naming
Date: Thu, 27 Aug 2026 15:34:53 +0300
Message-ID: <e77c97fac147ba65add6e564591452f5165608c8.1787833879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
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

The struct intel_atomic_state * pointer variables and parameters are
named "state" everywhere. Follow suit in
intel_atomic_commit_fence_wait().

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 553c60d452dd..12916e313821 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7272,14 +7272,14 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	drm_WARN_ON(display->drm, update_pipes);
 }
 
-static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
+static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
 	int i;
 
-	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
+	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
 			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
 						     i915_fence_timeout());
-- 
2.47.3

