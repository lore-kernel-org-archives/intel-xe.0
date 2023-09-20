Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4980FCE79D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 14:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55110E4C0;
	Wed, 20 Sep 2023 14:03:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C55710E4C0
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695218635; x=1726754635;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7CaSz3evXoLTBFMvjPRkjDVD5JQ2fcPSakoG5yn4QyU=;
 b=ESz/IzpGNBafy/JdnQyr6UwnLLVId9e8xjWUcpRQwdd3jEfLp2r7N9T6
 r8BfaaeMgWpOLQK1TRH5TeUeiwnRyx4tZFP5MVqd1sW1rZJxgloTtKvFb
 maOM/X0Ro3tRIwV8E8K/C3NEiQM3xDOZotWbQBuLTm4WYjcm9ec+ujyoC
 FvQcBqt8bBPYvdpNMR4YccI5O9/7y8VBLFk7q5QOPpK9zcVsNInwlnP7v
 LUw2+C6ehh+o3v2boapkEO/yNrfn4yrjRklme0I7yfBd/yzSczqY3rSvy
 CoB1zdqHIX1wD0fLqyku1u7UpOHTXdPSVLSolhz1My5k8T0Tug+zGB0oC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360486912"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360486912"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781700123"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781700123"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 20 Sep 2023 07:03:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 17:03:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 17:03:39 +0300
Message-ID: <20230920140339.28322-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] maybe xe is broken enough that it gives you
 a new vma every time?
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

---
 drivers/gpu/drm/i915/display/intel_cursor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index afe1d0fa0537..ab6a56ed40a9 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -752,7 +752,8 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	local_irq_enable();
 
-	if (old_plane_state->hw.fb != new_plane_state->hw.fb) {
+	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
+		drm_WARN_ON_ONCE(plane->base.dev, old_plane_state->hw.fb == new_plane_state->hw.fb);
 		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
 				     intel_cursor_unpin_work);
 
-- 
2.41.0

