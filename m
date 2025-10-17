Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF04CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03710EC62;
	Fri, 17 Oct 2025 15:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="SkNIgHuQ";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DCF10EC62
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1760715439;
 bh=xFDLedbM6hvfz8uTJfsm3zKpA0cbMpEEaLbEuzgJR28=;
 h=From:To:Subject:Date:From;
 b=SkNIgHuQGuJeQVmpNOY3cLPR9ixAjqe+e8TJ7Z5SVh9DBp71b/o/12B/5yKBELYvT
 0n84bspiSG8vECZSrVeyblD7+eQc7w5MAHwCVW1Z4Ucyc62Yz5R8SEjbSQyPyWjl4Z
 5VuJCAxnQWzW5AJiUY+KXFZjA6NaHH649tCPo3kgKcGt6Uvwy2kdUFnn4W396dqe0V
 oEpGbbrp9pDb1lzzO1DxAdS6IdF1SwoQ8QSR+hkNZ+5YCnHRRQupWoNaAKdVVnf19O
 Leztz2c957erqDu2b+RPnHruFKI1LeXBteAtON7/kJtvl2lKRMdVKxvZN5/GO4ydQl
 WHX3PqqATgcQw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] Testing PREEMPT_RT with disabling interrupts in the most
 critical section.
Date: Fri, 17 Oct 2025 17:37:43 +0200
Message-ID: <20251017153748.26059-1-dev@lankhorst.se>
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

*** BLURB HERE ***

Maarten Lankhorst (3):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/i915/display: Disable interrupts on xe for realtime preemption
  [FOR-CI] PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 -------
 drivers/gpu/drm/i915/display/intel_crtc.c   | 13 ++++--
 drivers/gpu/drm/i915/display/intel_cursor.c |  9 ++--
 drivers/gpu/drm/i915/display/intel_vblank.c | 49 ++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_vblank.h |  9 ++++
 drivers/gpu/drm/xe/Kconfig.debug            |  5 +++
 drivers/gpu/drm/xe/xe_device.c              |  4 +-
 kernel/Kconfig.preempt                      |  3 +-
 8 files changed, 69 insertions(+), 38 deletions(-)

-- 
2.51.0

