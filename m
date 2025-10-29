Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69306CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 09:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D62E10E76C;
	Wed, 29 Oct 2025 09:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="MA2FGQFo";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF81E10E76C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761731975;
 bh=OpAQh+7jQZXM1prafNpB4k0WtY9DO1gr13ElVCbtTrA=;
 h=From:To:Subject:Date:From;
 b=MA2FGQFoihXqwhYxELkBXJZmosUaxLP5fC7KpWyGTz4UNuPRhCzAxsnJLcIrUTLhH
 LFIwPTLQ68OnelvPqPCsDJdm+jmII4z8I8GhyIamWPIRyloKhOtGHqlAhq+JDdMD4E
 i1mO+q49Q7J20ZpQGNBWK2XkVge46LwJ/dTjYY+ZwdjO3UscSV7SeDezWSC8uf3RSn
 u+QRqPtck30w1F4FT0OmL59BvqldYBo5jefBJAzbu8uxN9vFUdYYqSXfk4UJ9KbsOO
 AZ+W33Ls3dqRMAqRc/4pifMHemhFMCSFrjlGj5eNPiXYwXHZdNmpTtCQIeP/6pfEce
 YR8WV13e2C+3A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] Testing PREEMPT_RT with disabling preemption in the most
 critical section.
Date: Wed, 29 Oct 2025 10:59:28 +0100
Message-ID: <20251029095934.16813-1-dev@lankhorst.se>
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

Fix get_vblank_counter() and try to disable preemption in the most critical part of the code.

Maarten Lankhorst (3):
  drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
  drm/xe/display: Disable preemption in the most critical section
  PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 ----
 drivers/gpu/drm/i915/display/intel_crtc.c   | 23 +++++-
 drivers/gpu/drm/i915/display/intel_cursor.c | 27 ++++++-
 drivers/gpu/drm/i915/display/intel_vblank.c | 90 ++++++++++++++-------
 drivers/gpu/drm/xe/Kconfig.debug            |  5 ++
 kernel/Kconfig.preempt                      |  4 +-
 6 files changed, 111 insertions(+), 53 deletions(-)

-- 
2.51.0

