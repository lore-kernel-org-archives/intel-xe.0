Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D57CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1B410E06F;
	Tue, 21 Oct 2025 12:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Z/cUO74c";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DC110E06F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761050557;
 bh=7C8AFdZfj9PnFBvnU2BK3todWYynv7ZacPLDlaMG3w4=;
 h=From:To:Subject:Date:From;
 b=Z/cUO74c+IHNowOXUQjtM5pGfnjjs839pmSpHmEyO56W4WpxntoUlG0vo6vccE5nD
 8it3m6BvbitvkOTvI9ovsvHsiexXQUKBYJRiiGx5tkBvZzbWJwKLEHWWWAyelmdNDl
 bs9A9e2K2pVKbvw9/ZZIag0VeUMyb1rB2PlE1Y0eO/BAf4rUZavc6g3MRtkUat7wid
 HFFYWaEl1Ow6X0KA9wJDewgcweOjFv+miH5rGnIjR+0lKC+i/IFlKnwvT57Cnue9A9
 DEc3Uub8P83ju0REz3lzL3uL4AetvB2Fm1NipA+HY7n+cjhzRXwNCmFuruWXOF95t2
 Gpvb8X1VyKM/w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] drm/xe/display: Disable migration for the critical
Date: Tue, 21 Oct 2025 14:43:04 +0200
Message-ID: <20251021124309.130121-1-dev@lankhorst.se>
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

Using the principle of minimal impact to latency possible, only prevent migration
from occurring first.

Maarten Lankhorst (3):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/xe/display: Disable migration in the most critical section
  [FOR-CI] PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 ------
 drivers/gpu/drm/i915/display/intel_crtc.c   | 23 ++++++--
 drivers/gpu/drm/i915/display/intel_cursor.c | 27 ++++++++--
 drivers/gpu/drm/i915/display/intel_dmc.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_vblank.c | 58 ++++++++++++++++-----
 drivers/gpu/drm/xe/Kconfig.debug            |  5 ++
 drivers/gpu/drm/xe/xe_device.c              |  4 +-
 kernel/Kconfig.preempt                      |  3 +-
 8 files changed, 98 insertions(+), 41 deletions(-)

-- 
2.51.0

