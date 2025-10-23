Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E663CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 08:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431610E8F7;
	Thu, 23 Oct 2025 08:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="JJgBt4Dn";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9310610E8F6
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761209730;
 bh=a3JhAVSJy8iJsEuIDtC/Od0bqgqzvuYenG6VuDT6GjY=;
 h=From:To:Subject:Date:From;
 b=JJgBt4DnimtjKRz+Ocl3B585e8syGlwpy0PE/1IX/3YgJtTohFJR8MlUTHr0UI9kH
 IG4ssYZxHiEJ3ZzLgZusd8mqLmgGk90idUNN7lmpFZgITSOw8YVEB9Kk6m4AzxBMXv
 ahuZogdngnLYZ7B5dyrQAIXQdlSd5FyKRl4kujV7bcO0lo2u5zUBxr1VTsGRG0PNau
 uPQkyUz1yk3dwOvgz1M35yuzPVgEU6/45yS9SFPosEXIRIHKq0sJME6AbehzC3dTBJ
 R05/aMIrAWE7M1gdGROtoNk1YI5OkAiCvkMH4QbGNwdOC8AGXnoQFW26XiBP3aNw85
 hzl8Vimm5lXXw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 0/5] Testing PREEMPT_RT with disabling interrupts in the most
 critical section.
Date: Thu, 23 Oct 2025 10:55:56 +0200
Message-ID: <20251023085601.90831-1-dev@lankhorst.se>
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

Only disable preemption in this series.

Maarten Lankhorst (3):
  drm/xe: Bump xe_device_l2_flush even higher
  drm/xe/display: Disable preemption in the most critical section
  PREEMPT_RT injection

Mike Galbraith (2):
  drm/i915: Use preempt_disable/enable_rt() where recommended
  drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates

 drivers/gpu/drm/i915/Kconfig.debug          | 15 ----
 drivers/gpu/drm/i915/display/intel_crtc.c   | 23 +++++-
 drivers/gpu/drm/i915/display/intel_cursor.c | 27 ++++++-
 drivers/gpu/drm/i915/display/intel_vblank.c | 81 ++++++++++++++-------
 drivers/gpu/drm/xe/Kconfig.debug            |  5 ++
 drivers/gpu/drm/xe/xe_device.c              |  4 +-
 kernel/Kconfig.preempt                      |  4 +-
 7 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.51.0

