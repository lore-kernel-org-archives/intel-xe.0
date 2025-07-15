Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEAFC83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 10:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C4F10E207;
	Tue, 15 Jul 2025 10:16:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1017110E207
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:16:51 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI PATCH 0/4] CI test with PREEMPT_RT
Date: Tue, 15 Jul 2025 12:16:37 +0200
Message-ID: <20250715101636.906092-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

Just testing the XE enabling parts.

Maarten Lankhorst (2):
  drm/i915/display: Use drm_crtc_vblank_count in
    intel_crtc_get_vblank_counter()
  FOR-CI: Enable PREEMPT_RT

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/display/intel_crtc.c   | 11 +++--
 drivers/gpu/drm/i915/display/intel_cursor.c |  9 ++--
 drivers/gpu/drm/i915/display/intel_vblank.c | 49 ++++++++++++++++-----
 init/Kconfig                                |  2 +-
 kernel/Kconfig.preempt                      |  4 +-
 5 files changed, 53 insertions(+), 22 deletions(-)

-- 
2.45.2

