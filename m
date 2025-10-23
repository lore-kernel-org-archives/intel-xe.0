Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55D4CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B25C10E91E;
	Thu, 23 Oct 2025 15:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="YPTl+4eO";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67F10E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761233648;
 bh=XgW40rUjj/Y4wzugh/lvQR94z2UgkifJfW7r/K2VBfM=;
 h=From:To:Subject:Date:From;
 b=YPTl+4eOz3oxItypx2w6scluQ0O74POBmfwzuJrrbw7yoZdLqm7o0FWzsYR41A72x
 heHNNB5II3I1VvCbDzmjam4oFej4ew+ocrJ3z9NwH8Wq94dXT7xilmTCTGAPV9wgo8
 ZdMSBdl/X7xyfcCIX5E3PyONNNjpdaSonUu9y8AXWxE7B5kGVktOHl1XGXBsSqfgt6
 o7JCrB7FIpTyG7UnTEQry70bu946f2mQR5mbO+D/IkY07QUs+RJfiNJ8I1obSRqpUb
 OyR0M/wy7i1mheiVNcX5KGq29PxCKpRHLtFPUly723LNG2c2EpqvB0P8a0vZjGeYmQ
 brebM991nenOg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] drm/xe/display: Test series with PREEMPT_RT and
 preemption disable.
Date: Thu, 23 Oct 2025 17:34:01 +0200
Message-ID: <20251023153407.7547-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Fixing the issues with waiting from the previous version.

Maarten Lankhorst (3):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/xe/display: Disable preemption in the most critical section
  PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 ----
 drivers/gpu/drm/i915/display/intel_crtc.c   | 23 +++++-
 drivers/gpu/drm/i915/display/intel_cursor.c | 27 ++++++-
 drivers/gpu/drm/i915/display/intel_vblank.c | 88 ++++++++++++++-------
 drivers/gpu/drm/xe/Kconfig.debug            |  5 ++
 drivers/gpu/drm/xe/xe_device.c              |  4 +-
 kernel/Kconfig.preempt                      |  4 +-
 7 files changed, 112 insertions(+), 54 deletions(-)

-- 
2.51.0

