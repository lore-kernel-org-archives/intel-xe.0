Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084BCE79D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 14:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6A410E4C4;
	Wed, 20 Sep 2023 14:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6310E4B4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695218633; x=1726754633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0FNLZFCv31DhObWokrUuGARIHxCY7P9GHenMrzVxMc=;
 b=Fw3U1iNofhm9lqf53+6MQn2fYsVYZKWMZSHIqTbOMTWGI8iamLDqgHz9
 5NqTXVeB4tfr/91jEUQuv/krNC9p5lHzsJK7BSbcWkasmEAUODNjrjahA
 NI9mKXihc4cmfsH93ubxRdhe/sOk//bESi9Lyl19BAkOKz1i1YkSmoj1/
 sFiOom8X5d8IVouHXnkUsSNnjRY+qk5/nwZIYWF6vhQ1GHaAGv9Q+UB3i
 BQTCBdv6d8FbaV1Fbz4B+7UojxIO8I+NhCvSrZUKQhYURXMfjeedrAc+H
 TNW6bgTAprjaXjHqmM9pkjbR2xyH84e2myLD5zla0phhaTvch6hfIS79Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360486898"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="360486898"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781700072"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781700072"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 20 Sep 2023 07:03:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 17:03:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 17:03:38 +0300
Message-ID: <20230920140339.28322-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/vblank: Warn when silently cancelling
 vblank works
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
Cc: Lyude Paul <lyude@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Silently cancelling vblank works is a bit rude, especially
if said works do any resource management (eg. free memory).
WARN if we ever hit this.

TODO: Maybe drm_crtc_vblank_off() should wait for any
pending work to reach its target vblank before actually
doing anything drastic?

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_vblank_work.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index bd481fdd6b87..43cd5c0f4f6f 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -73,6 +73,9 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
 
 	assert_spin_locked(&vblank->dev->event_lock);
 
+	drm_WARN_ONCE(vblank->dev, !list_empty(&vblank->pending_work),
+		      "Cancelling pending vblank works!\n");
+
 	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
 		list_del_init(&work->node);
 		drm_vblank_put(vblank->dev, vblank->pipe);
-- 
2.41.0

