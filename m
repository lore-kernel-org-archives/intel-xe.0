Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A448C61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7810EFE8;
	Thu, 27 Aug 2026 12:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2ZqX1cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0B10EFD8;
 Thu, 27 Aug 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834121; x=1819370121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LocfgT1YQlgoT7Wow6zlpeY6eBjJ4OBKtqizHhTo3Fw=;
 b=E2ZqX1clhLSKl5sHT6K5gEihe78kfhGssJ/4IXI8NBNBIxoKOfkGNQpT
 cNVRsxkPsoGuAyLhcM5JVf/u1pl3DcRn67XrU/753yzV+JDL3fwQvKRN1
 jRxKd0dpF0oPK1cUQ3jfTn0HqFKOREnvHhkNNEWOK67XCbn6gtGIuufBr
 9oaPd+wBCWn3f6nVpaReeQ2ZlbkyuQNU/L92IFlKdjMmAdUlRBdrMk2Ih
 Bh6GbpaS31KXE7+JO9Tv8NidM2CwxORm2ZbXR4msusJgKGy0ARtwwn4a1
 mItgiKNUj9K1spxZHXzdH4rqqMXlFFnkjjz/2gRtZWTWdpWKHyAcGF9m+ A==;
X-CSE-ConnectionGUID: S5YxsblbTHOJHU9U6phnOQ==
X-CSE-MsgGUID: tFZVPhvMQIuGYHtPwyj8XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98929282"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98929282"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:21 -0700
X-CSE-ConnectionGUID: bcUxPgVORx6duokt/791pw==
X-CSE-MsgGUID: 1BkWACNGTvyV8vKvAnIkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="261734684"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 4/7] drm/i915/display: reduce indent in
 intel_atomic_commit_fence_wait()
Date: Thu, 27 Aug 2026 15:34:54 +0300
Message-ID: <6eabe8b3e319aa6490ff68c395d69a97b60a5cb5.1787833879.git.jani.nikula@intel.com>
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

Continue early in the loop for no fence in order to reduce indent.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: 'git show -w' for easy review
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 12916e313821..eed906a30749 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7280,15 +7280,16 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
-		if (new_plane_state->fence) {
-			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
-						     i915_fence_timeout());
-			if (ret <= 0)
-				break;
+		if (!new_plane_state->fence)
+			continue;
 
-			dma_fence_put(new_plane_state->fence);
-			new_plane_state->fence = NULL;
-		}
+		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
+					     i915_fence_timeout());
+		if (ret <= 0)
+			break;
+
+		dma_fence_put(new_plane_state->fence);
+		new_plane_state->fence = NULL;
 	}
 }
 
-- 
2.47.3

