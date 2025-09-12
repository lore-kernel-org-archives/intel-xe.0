Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C3CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 22:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607A510ECEA;
	Fri, 12 Sep 2025 22:42:00 +0000 (UTC)
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Fri, 12 Sep 2025 22:41:58 UTC
Received: from smtp112.iad3b.emailsrvr.com (smtp112.iad3b.emailsrvr.com
 [146.20.161.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5210ECEA
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 22:41:58 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp23.relay.iad3b.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id D7C1DA0290; 
 Fri, 12 Sep 2025 18:32:59 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-xe@lists.freedesktop.org
Cc: Kenneth Graunke <kenneth@whitecape.org>, stable@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Increase global invalidation timeout to 1000us
Date: Fri, 12 Sep 2025 15:31:45 -0700
Message-ID: <20250912223254.147940-1-kenneth@whitecape.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 0c9dd40c-3302-4f88-900b-9c1781919b47-1-1
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

The previous timeout of 500us seems to be too small; panning the map in
the Roll20 VTT in Firefox on a KDE/Wayland desktop reliably triggered
timeouts within a few seconds of usage, causing the monitor to freeze
and the following to be printed to dmesg:

[Jul30 13:44] xe 0000:03:00.0: [drm] *ERROR* GT0: Global invalidation timeout
[Jul30 13:48] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] flip_done timed out

I haven't hit a single timeout since increasing it to 1000us even after
several multi-hour testing sessions.

Fixes: c0114fdf6d4a ("drm/xe: Move DSB l2 flush to a more sensible place")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5710
Signed-off-by: Kenneth Graunke <kenneth@whitecape.org>
Cc: stable@vger.kernel.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This fixes my desktop which has been broken since 6.15.  Given that
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6097 was recently
filed and they seem to need a timeout of 2000 (and are having somewhat
different issues), maybe more work's needed here...but I figured I'd
send out the fix for my system and let xe folks figure out what they'd
like to do.  Thanks :)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a4d12ee7d575..6339b8800914 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1064,7 +1064,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_lock(&gt->global_invl_lock);
 
 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 1000, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 
 	spin_unlock(&gt->global_invl_lock);
-- 
2.51.0

