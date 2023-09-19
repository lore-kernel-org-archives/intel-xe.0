Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A16CD54A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 09:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC610E261;
	Tue, 19 Sep 2023 09:48:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A5E10E261
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695116878; x=1726652878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tg+GXz6alSX5FJLXpnK9BNuBIZNs050Q/+psiuz/UHM=;
 b=D4qjhnQZt+N9jsH6uIHLkpTlevXr8M4xCgN9+F4BRJXSmj9qbn2Qw7FB
 TR9kV6wGVLRd5KcHfe0fmHxQG3q0q6piuF199FJ/49tEjBpnPHXPD4Ids
 6r7vX7r2glS7OccwBOIHSCJIaXV382KFzPxcdEcSTDnUxnLcv/tck9NEl
 jbjOCrVfBStVyY3t9axamjIioPhxKgcw2oXY2LdYR26/pwUJMUSYPVair
 TCU3fqdxTNjEOgR7yFCtK7lu4E8zZ92JuEzNRViCTazKgdiN6MONIdQFa
 ySo/2tEqLXyDhWzJRCtMC0DmLn9uO8Kri2lO+t7QJaKmoMsJ2+BUnOFMs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466225454"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466225454"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739621361"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="739621361"
Received: from danilova-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.251.219.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:57 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 12:47:36 +0300
Message-Id: <20230919094737.743358-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919094737.743358-1-luciano.coelho@intel.com>
References: <20230919094737.743358-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915/crtc: use irqsave
 for locking event_lock"
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

This reverts commit 0aff77c2fbd20da430763bdb25db5eaa6245650a.

The interrupts are already disabled at this point, so there's no need
to use _irqsave()/_irqrestore() in this context.  Most other callers
of the drm_crtc_arm_vblank_event(), outside the i915 driver, call it
immediately after locking the spinlock with _irqsave(), or at least
_irq(), and that may be the reason why this was added unnecessarily
here.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 23bb3bb9c7db..182c6dd64f47 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -670,15 +670,13 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
 					 false);
 	} else if (new_crtc_state->uapi.event) {
-		unsigned long flags;
-
 		drm_WARN_ON(&dev_priv->drm,
 			    drm_crtc_vblank_get(&crtc->base) != 0);
 
-		spin_lock_irqsave(&crtc->base.dev->event_lock, flags);
+		spin_lock(&crtc->base.dev->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
 					  new_crtc_state->uapi.event);
-		spin_unlock_irqrestore(&crtc->base.dev->event_lock, flags);
+		spin_unlock(&crtc->base.dev->event_lock);
 
 		new_crtc_state->uapi.event = NULL;
 	}
-- 
2.39.2

