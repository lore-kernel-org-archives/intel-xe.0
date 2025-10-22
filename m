Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A15DCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E426E10E768;
	Wed, 22 Oct 2025 12:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="hucSOQBM";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B55210E768
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761135188;
 bh=3bcCCZjm/ATjvTeHaaW8AdeyZ3SLyrH+0O1PYr66TFg=;
 h=From:To:Cc:Subject:Date:From;
 b=hucSOQBMV3cqWOsdGPIPVe5tDFjiZUVGXxiivCjBS72btXIYzuAhjYAsmfVL20a7S
 M7WRD3Zhf1rQRJyzvzNZKPBfxlo9NsQ4vZ2xtFkxnRRrr+PWnHuG1R/cw+rQL6CqLu
 v7gaN5ZlO6KBSQIBupN7sYJXtJp7FsawuhorM4fDfpUtjTTI+tiqIfQJFLFEAkFg1H
 3JQEMihr3P9NFuWr7FN7N1ognQmNaOFbaW3t2nBOVylfUnfju4JZMGZweP4oHTEpaF
 VoBFmh5Re+H1mT/ys6n4QabJelkiTfktNTIrfmCjKtPufZoalWPiZKz8Sm7yUlFPEP
 t6liQqU2645MQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [FOR CI 0/5] drm/xe/display: Test series with PREEMPT_RT and
 preemption disable.
Date: Wed, 22 Oct 2025 14:13:02 +0200
Message-ID: <20251022121301.18166-7-dev@lankhorst.se>
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

Keep interrupts enabled, see what happens...

Maarten Lankhorst (3):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/xe/display: Disable preemption in the most critical section
  PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 ------
 drivers/gpu/drm/i915/display/intel_crtc.c   | 23 ++++++--
 drivers/gpu/drm/i915/display/intel_cursor.c | 27 ++++++++--
 drivers/gpu/drm/i915/display/intel_vblank.c | 58 ++++++++++++++++-----
 drivers/gpu/drm/xe/Kconfig.debug            |  5 ++
 drivers/gpu/drm/xe/xe_device.c              |  4 +-
 kernel/Kconfig.preempt                      |  4 +-
 7 files changed, 97 insertions(+), 39 deletions(-)

-- 
2.51.0

