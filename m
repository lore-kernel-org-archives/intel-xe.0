Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8781C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F41810E24A;
	Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T6FYT2s8";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD59010E24A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w/regvBpVTW4aDjQxhu+7FmvqPX1uoreEne8wqyciD4=; b=T6FYT2s82PmNIDU6UFWct0cL5u
 +cgZCXO6PH5GpedSr2bQLFSD6VUkjh5skdI4+j81VAVjWXjZ3xpJrfmJmuu630MMvG9WVXaxWXes2
 8seQz3h5WhN9sXZSequ7cbDJbwAiQGxqllW5LxmxiHyHkBgBmcCEnu4EQzXOUQ2ezrRvbhlkFrmNw
 JMtz4oTM2XDNVw8gTT5UVDTqStsn3icZVHz33uTYFN4HPRNR5EzrWWy2uMRz5YzIMG6BZ5XsnUQ4l
 RyZ0JoaBnpKspVuSUwO20or2bK8k+Zrpz6LrefT0LQd5pXckp1MGW1mMNKgLBiBJ9Hi2pKAqxne6Y
 zqpLTKqA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlQ69-00G2aq-Jf; Fri, 21 Feb 2025 11:17:39 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 00/12] AuxCCS handling and render compression modifiers
Date: Fri, 21 Feb 2025 10:17:19 +0000
Message-ID: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

A series to fix and add xe support for AuxCSS framebuffers via DPT.

Currently the auxiliary buffer data isn't mapped into the page tables at all so
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
had to disable the support.

On top of that there are missing flushes and invalidations both from the ring
buffer side and from the CPU side.

Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:

  [PLANE:32:plane 1A]: type=PRI
          uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
          hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

Display seems working fine - no artefacts, no DMAR/PIPE faults. Lets see what CI
will say.

v2:
 * More patches added to fix kms_flip_tiling.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Tvrtko Ursulin (12):
  drm/xe: Fix MOCS debugfs LNCF readout
  drm/xe: Fix ring flush invalidation
  drm/xe: Pass flags directly to emit_flush_imm_ggtt
  drm/xe: Add ring buffer handling for AuxCCS
  drm/xe: Use correct type width for alignment in fb pinning code
  drm/xe: Use fb cached min alignment
  drm/xe: Reduce DPT table alignment as in i915
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe: Force flush system memory AuxCCS framebuffers before scan out
  drm/xe/display: Add support for AuxCCS
  drm/xe/display: Expose AuxCCS frame buffer modifiers

 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 195 ++++++++++++++----
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |   4 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              | 195 ++++++++++--------
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 9 files changed, 280 insertions(+), 144 deletions(-)

-- 
2.48.0

