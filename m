Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125DD49234
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 14:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9A210E31D;
	Fri, 12 Dec 2025 14:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="kU8EP/fE";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6D10E31D;
 Fri, 12 Dec 2025 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765550113;
 bh=uSQ/UyLwXmmRIaxkvUds1hom87jjy4dX+fVSPAodvu8=;
 h=From:To:Cc:Subject:Date:From;
 b=kU8EP/fEyPCTQDZyTEoInf8tHpO0KlvdL8MRs3tASlV7jas+CCCk0Tjnt/3zYWgAT
 aajet8Z7sUx+zzglAwIslUouFAFXoNWhiVMmPRcdAO5UqhQmanYTLKXrZqD45VR5yr
 +K0sxz7En0WPmsVfK38/n8t/TQcAIXHOTFC75ZDpU71r1CggO3j/2Y8/Q4K8xTrVMe
 fg4a77fHQLXmrztLZZBpT38AcZ2t++VcDodGH8IlD8hIc3xCSxabjluVyZlEQ1+quA
 P6Jq6GI2pbiHpqie87nx6g/qXROeCEoMN/fhGVePSFkAvDNwqL45hHkKQOoAxIjpMr
 yN2BKhP/78l/A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 00/12] drm/i915/display: All patches to make PREEMPT_RT
 work on xe.
Date: Fri, 12 Dec 2025 15:35:04 +0100
Message-ID: <20251212143504.973839-14-dev@lankhorst.se>
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

Maarten Lankhorst (11):
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
  drm/i915/display: Use intel_de_read_fw in colorops

Mike Galbraith (1):
  drm/i915: Use preempt_disable/enable_rt() where recommended

 drivers/gpu/drm/i915/Kconfig.debug            |  15 ---
 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  10 ++
 drivers/gpu/drm/i915/display/intel_cursor.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  46 ++++----
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   | 106 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_vrr.c      |  16 +--
 drivers/gpu/drm/xe/Kconfig.debug              |   5 +
 kernel/Kconfig.preempt                        |   4 +-
 11 files changed, 121 insertions(+), 99 deletions(-)

-- 
2.51.0

