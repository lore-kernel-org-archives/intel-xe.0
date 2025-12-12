Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EE3D49223
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 13:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930D510E116;
	Fri, 12 Dec 2025 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jCo2UCRJ";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255E10E032;
 Fri, 12 Dec 2025 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765544536;
 bh=KbaXjfFy/IbPFywu7qlNpHIL1KEUKHSQFvEirSdfkZM=;
 h=From:To:Cc:Subject:Date:From;
 b=jCo2UCRJ6kgLbf9X9GsBl2SWJCbVQLL3jHP8G0ciz/NGpAlSNreNbCu6XKx/WCo3m
 +VzN119eq/EGRFS+3xleR73shia9P/93X0NmgedacfRAERZhwRGgdg+XWCDnxBH/XH
 Pbc1SD7PpT3CzrMwiyNXENhYoF5+lcVpO146+XE0OSzOlC9axSSSGAZeNegbH94uy1
 aX9IEdGV7xkn7ki/ufqucT8wruBg34WUUavQP4cXmoa99SVKT+wsXnthbxVF/BVSX4
 Ut28FsK7QORoUX3/l7DeDMTWK59V0i+PcwPBvSTylFzyY+K90SoGf+XulSBEJWyROc
 xZa9YgR8lQP3Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 00/11] drm/i915/display: All patches to make PREEMPT_RT work
 on xe.
Date: Fri, 12 Dec 2025 14:02:06 +0100
Message-ID: <20251212130205.963029-13-dev@lankhorst.se>
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

I messed up my from address in the previous run, so please review this series.

This is the test run for Xe, the previous patch series appears to have caused
no regressions in CI for !PREEMPT_RT, so test PREEMPT_RT too.

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_158814v1/index.html

Maarten Lankhorst (10):
  drm/i915/display: Fix intel_lpe_audio_irq_handler for PREEMPT-RT
  drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
  drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
  drm/i915/display: Make set_pipeconf use the fw variants
  drm/i915/display: Move vblank put until after critical section
  drm/i915/display: Remove locking from intel_vblank_evade critical
    section
  drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range
    too
  drm/i915/display: Make icl_dsi_frame_update use _fw too
  drm/i915/display: Enable interrupts earlier on PREEMPT_RT
  PREEMPT_RT injection

Mike Galbraith (1):
  drm/i915: Use preempt_disable/enable_rt() where recommended

 drivers/gpu/drm/i915/Kconfig.debug            |  15 ---
 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  10 ++
 drivers/gpu/drm/i915/display/intel_cursor.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  46 ++++----
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   | 106 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_vrr.c      |  16 +--
 drivers/gpu/drm/xe/Kconfig.debug              |   5 +
 kernel/Kconfig.preempt                        |   4 +-
 10 files changed, 119 insertions(+), 97 deletions(-)

-- 
2.51.0
