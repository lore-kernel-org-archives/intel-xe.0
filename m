Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3FCCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33310EB60;
	Fri,  7 Nov 2025 19:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="TDgO5Z7D";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A9B10EAFB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762544387;
 bh=2//GzXeJp4ehDfYiv3TgcwNdqA3/dlsSxAomGtzZe7o=;
 h=From:To:Subject:Date:From;
 b=TDgO5Z7DxVHoBroBXA2U4VIwlJXzHXNZeoLAnjTrgMBPF5DeZuRAW2cE5Pl0nslcZ
 G74MnEzcAYEkHzqVyIkjlRYTLWr5vbC03d0RvX9OTstaeDS6W7ZqH7HfPSFAUcxjVZ
 aq6RiuQjoKlzRLV+pa4rdaMyEugVRrLxyDicmuoBo5NJ0jejx2IVpbFwuaKU4N+aaM
 U/KhbqWNcE4KEuLvjREPEy3X/+y9ofHBGxKS7VCoSXXEXBdkSSnehmgR5kkohvwI1X
 ElzRvv1akRcJv0dK7g9kZSXRnlFYFSsEMr5rJwHSxZVqxCC6KEj7NSLyIXhXqltI7i
 DCvskPj+j0T/Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI 00/10] Fixed PREEMPT_RT CI run
Date: Fri,  7 Nov 2025 20:39:35 +0100
Message-ID: <20251107193946.1075137-1-dev@lankhorst.se>
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

Not for review.

Maarten Lankhorst (9):
  drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
  drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
  drm/i915/display: Move vblank put until after critical section
  drm/i915/display: Remove locking from intel_vblank_evade critical
    section
  drm/i915/display: Make icl_dsi_frame_update use _fw too
  drm/i915/display: Enable interrupts earlier on PREEMPT_RT
  drm/i915/display: Make set_pipeconf use the fw variants
  drm/i915/display: Remove dirty_rect from fbc state
  PREEMPT_RT injection

Mike Galbraith (1):
  drm/i915: Use preempt_disable/enable_rt() where recommended

 drivers/gpu/drm/i915/Kconfig.debug            |  15 ---
 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  10 ++
 drivers/gpu/drm/i915/display/intel_cursor.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_de.h       |   6 +
 drivers/gpu/drm/i915/display/intel_display.c  |  49 ++++---
 drivers/gpu/drm/i915/display/intel_fbc.c      | 124 ++++--------------
 drivers/gpu/drm/i915/display/intel_fbc.h      |   3 +-
 drivers/gpu/drm/i915/display/intel_plane.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |  80 +++++++----
 drivers/gpu/drm/i915/display/intel_vrr.c      |  16 +--
 drivers/gpu/drm/xe/Kconfig.debug              |   5 +
 .../drm/xe/compat-i915-headers/intel_uncore.h |   2 +
 kernel/Kconfig.preempt                        |   4 +-
 14 files changed, 147 insertions(+), 181 deletions(-)

-- 
2.51.0

