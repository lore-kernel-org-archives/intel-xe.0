Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFBFC4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B410E278;
	Mon,  6 Nov 2023 06:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66C10E276
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253344; x=1730789344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8eQPgDJyjzSVehfb33NXb5Dca8pbhfduQNdmIoiyms=;
 b=AIkZb/TdORxNtR3kqtJ2Bbe0VRAkfZZVxsiwId5wVIhl/Vk0xjCGTyqR
 qrYa5vyvoE8VlMl7FsMUzYA+UCh4yCXrY3S2xWth44Lxpz0h3necVc4Hd
 uuVQ2pqAC1grQxvK8eoOnIS0R1iFmOYS5nSfH7nYD7a2J1PI24HVZlDIP
 akO1LiMuXR+5kE2aOTTfLAFUXWBuEUqafUqdGuqVqt4JsrE3D0PJZxMpp
 e9fg9Bkcvrj1dG5x8FcNu46h26o1LOA0fRGO/1QYoAU8qJE95pu6HAslG
 6S2ETS9dieIvGARH1G4PkWn4Xd0dNyuyawVs3asai8aN/xkdNr2I+rpWA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424657"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534714"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:49:02 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:32 +0200
Message-Id: <20231106064834.161647-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/8] drm/i915/display: Use intel_bo_to_drm_bo
 instead of obj->base
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe. Xe_bo doesn't have obj->base. Due to this
use intel_bo_to_drm_bo instead in intel_prepare_plane_fb.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102112219.1039362-1-jouni.hogander@intel.com
(cherry picked from commit a12480855ecbba6c7473c170d91c7bf41701a38c)
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index a71170a0666d..563b70f6a0c7 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1101,7 +1101,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		 * can safely continue.
 		 */
 		if (new_crtc_state && intel_crtc_needs_modeset(new_crtc_state)) {
-			ret = add_dma_resv_fences(old_obj->base.resv,
+			ret = add_dma_resv_fences(intel_bo_to_drm_bo(old_obj)->resv,
 						  &new_plane_state->uapi);
 			if (ret < 0)
 				return ret;
-- 
2.34.1

