Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D6FEEAA40
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5210E56F;
	Thu, 14 Sep 2023 14:19:09 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB4410E298
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:19:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:18:52 +0200
Message-Id: <20230914141856.5647-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 0/4] Cursor tests for CI
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Small test for CI. Should hopefully work better..

Maarten Lankhorst (4):
  fixup! drm/xe/display: Implement display support
  drm/i915: Swap ggtt_vma during legacy cursor update
  SorryNotSorryCancelling
  drm/i915: Handle legacy cursor update as normal update

 drivers/gpu/drm/drm_vblank_work.c            |  1 +
 drivers/gpu/drm/i915/display/intel_crtc.c    | 28 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_crtc.h    |  6 +++--
 drivers/gpu/drm/i915/display/intel_cursor.c  |  5 ++--
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++---
 drivers/gpu/drm/xe/display/xe_fb_pin.c       |  3 ++-
 6 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.40.1

