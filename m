Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64235CCF9FE
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8182810EA0C;
	Thu, 30 Oct 2025 18:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Vfx+Nhzr";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7510EA08
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761850031;
 bh=ul9DkYkoOzZeescpcCamwHI4DTkOAGTLEGpTyO9c8Fo=;
 h=From:To:Subject:Date:From;
 b=Vfx+NhzrXIeQCrZcOxLd6lLfoLlfDwQK+6ut5oS5dT9AY1QKez4oY02Vtd5s3wiXX
 hxSa89q+61scheZReVuknZtgdzVEMgzaXke1okfZz9HtQMXgcwbVa1SiLUVF5KyUUJ
 Uzf1A8GXNsT/6sdVF10ae3O/9XETZu+tOStwaObobm/R4dGZmEkDFzT93RbqNO5EfI
 8eDitdZCgK5MdGSN21GfR0gLAkGK42Cgk3O5f6VJRZoyecMtl0vrpfySGA0YZzQoKq
 2e0cxDPaOBQdWA4OP47sbkyaE8vJOJ8E79uV1J9rMyIfyUx+bCdsATYGps6qE6ESmX
 o3kstYPSgGKRg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/8] Testing PREEMPT_RT with disabling irqs in the most
 critical section.
Date: Thu, 30 Oct 2025 19:47:02 +0100
Message-ID: <20251030184710.359870-1-dev@lankhorst.se>
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

One more try, I believe all previously bugs found by CI are
now fixed. I just want to know what CI thinks of disabling interrupts.

Maarten Lankhorst (6):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
  drm/xe/display: Disable preemption in the most critical section
  PREEMPT_RT injection
  With disabled irqs instead
  drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug           | 15 ----
 drivers/gpu/drm/i915/display/intel_crtc.c    | 19 +++-
 drivers/gpu/drm/i915/display/intel_cursor.c  | 21 ++++-
 drivers/gpu/drm/i915/display/intel_display.c | 36 ++++----
 drivers/gpu/drm/i915/display/intel_vblank.c  | 94 ++++++++++++++------
 drivers/gpu/drm/i915/display/intel_vrr.c     | 16 ++--
 drivers/gpu/drm/xe/Kconfig.debug             |  5 ++
 drivers/gpu/drm/xe/xe_device.c               |  4 +-
 kernel/Kconfig.preempt                       |  4 +-
 9 files changed, 133 insertions(+), 81 deletions(-)

-- 
2.51.0

