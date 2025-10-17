Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F6CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02510EC62;
	Fri, 17 Oct 2025 15:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="eVAUADt5";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3DE10EC67
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1760715360;
 bh=QY9SBQHiQaEhRxzN5k4pWRmnU7LzK/L6Teoe5P268DE=;
 h=From:To:Subject:Date:From;
 b=eVAUADt5/KizJHWsbTTBGLTxRcQCsM88MVMVay9B2+ujwJcCAEuvNEihC/HwNSr0L
 sgOP4nrrS7rYvCMREvOrNC2yACM9JV557t45xJCs+1iLubSOLmYr2lp/Cs+/DLTXGY
 MU5t/UA/6uFCP9N3Ts/kADHDwp/sEx6pCCjH8e3+bewgawiejmHuZ+j57D4Kdy0dqW
 kCgB6CwIYpnL4IMsXiF8ckvVvFeDiMas23PeRf4lV9IUNBHgWsIZ0fxI9EfvwdL5AI
 kf2Nr5rg21yU1lMvOp6Qp+VZWxeQ5/cnD9OUc2OeZ92F71n8AHGkLqrlnPAoDYEanc
 qpGM+yO4xnAhQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] Test PREEMPT_RT with irqs disabled.
Date: Fri, 17 Oct 2025 13:57:46 +0200
Message-ID: <20251017115752.398805-1-dev@lankhorst.se>
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

Just a quick check to see if PREEMPT_RT runs into any issues without
IRQs.

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

