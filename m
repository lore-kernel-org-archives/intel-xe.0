Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E4CCFA08
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 08:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554D510E55D;
	Tue,  4 Nov 2025 08:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="EWrhdmAa";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9DA10E552;
 Tue,  4 Nov 2025 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762245403;
 bh=3JOp8J3mU4x78xdMwwRxbanqKQyjaYk8PaRctMS9fmI=;
 h=From:To:Cc:Subject:Date:From;
 b=EWrhdmAajLm1J0S1Dz0wn7gWzQhpU2Fontkh9SR1ph7aIXn+shAJ3IHQuOtx7ZlTV
 144rwry+1w08yBEydB6I7KDGyzo+/FGbVdUNO0qrlRSp1wqXQVIALTJfp/Zv2+S8XG
 IV/I1bm31K1YTFxZBlLL9w7fdUFZCZnu44m+EvRyF10LsGZBffPRIbJHkhEwlH5JHx
 kTQ4rGQgNdfUaHjuD81uNwDumXcE+vvldOHpkjW++FG+4UJJEKgvSfGzQ9ovGpnMz3
 M09qfZ6UBR5I08OPkIDrGHw5ZkHRfyA5F34VopB+V4d+mSP0gVBjOE0BSpmhy5e9vw
 Mw8MHEZuI0YXw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, Maarten Lankhorst <dev@lankhorst.se>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 0/7] drm/i915/display: Handle vblank evasion with
 CONFIG_PREEMPT_RT
Date: Tue,  4 Nov 2025 09:36:24 +0100
Message-ID: <20251104083634.670753-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is a critical section between intel_pipe_update_start() and
intel_pipe_update_end() where we only program hardware registers,
should not take any lock and complete as fast as possible.

The previous approach used to remove the local_irq_enable/disable()
in this critical, but that increases the probability that the time
sensitive section does not complete in 100 µs, potentially causing
the hardware to hang.

I went through all the lockdep splats that occurred in CI, and fixed
them 1 by 1 until there were none left. This additionally improves
latency by not removing any locks in the fastpath.

In intel_de.h the implicit DMC wakelock was added, ideally we can get rid
of it, but for now we can simply use the same _fw variants as are
needed on i915.

I believe this series is enough to make xe and perhaps good enough to make
i915's display RT safe.

Changes since v1:
- Fix compilation on i915.
- Submit to intel-gfx ml too.s

Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>

Maarten Lankhorst (6):
  drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
  drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
  drm/i915/display: Move vblank put until after critical section
  drm/i915/display: Remove locking from intel_vblank_evade critical
    section
  drm/i915/display: Make icl_dsi_frame_update use _fw too
  drm/i915/display: Enable interrupts earlier on PREEMPT_RT

Mike Galbraith (1):
  drm/i915: Use preempt_disable/enable_rt() where recommended

 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     | 10 +++
 drivers/gpu/drm/i915/display/intel_cursor.c   |  8 +-
 drivers/gpu/drm/i915/display/intel_de.h       |  6 ++
 drivers/gpu/drm/i915/display/intel_display.c  | 36 ++++-----
 drivers/gpu/drm/i915/display/intel_vblank.c   | 80 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_vrr.c      | 16 ++--
 .../drm/xe/compat-i915-headers/intel_uncore.h |  2 +
 8 files changed, 103 insertions(+), 59 deletions(-)

-- 
2.51.0

