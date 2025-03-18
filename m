Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BD3C35FF3
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 16:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FD910E4B5;
	Tue, 18 Mar 2025 16:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T59tU4lb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EC510E4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DqEH4F25KJF5MPCjvW6l78yh2ZOAQve0Mq8h7olg1NA=; b=T59tU4lbhM2ON35iSYUG/EXeV4
 6kRbFLwCShvdZPEf5g2yz5/g1FraB00hxRcRvuhthMoOxfzi6qiXzgOc8vFv4WhtF4AjNvtp0dJh1
 Gte61aRtEoXnLBXItcwnQkrpYHKujNdvWOwmf3JLbnCscHYt2ShiwT/1+HIvWfXEsiWFlV3nL8nBJ
 PHzJTvqKK4xSIzN3dNgNe6WN2Ux+OKuGVc3Lf34c7W14rTZwEFaNidL+WBrf2PjDPqp3DipOBpMZn
 g367sCmiUZr1dHc3PyWsVlQlTXYz91OGMMOfm7CufZu4/zSsgKTsMDlT9JzMvKX4uBtMniYFC5HoK
 nlTknZzQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuZi3-002odF-WD; Tue, 18 Mar 2025 17:22:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 0/8] AuxCCS handling and render compression modifiers
Date: Tue, 18 Mar 2025 16:22:15 +0000
Message-ID: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
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

Display seems working fine - no artefacts, no DMAR/PIPE faults. CI also appears
to be happy with v2.

v2:
 * More patches added to fix kms_flip_tiling.

v3:
 * Rebased after some cleanup patches from v2 were merged.
 * Added people to Cc as suggested by Rodrigo.
 * Adjusted last patch title. (Rodrigo)
 * Apply GGTT flushing only to iomapped system memory buffers.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Tvrtko Ursulin (8):
  drm/xe: Add ring buffer handling for AuxCCS
  drm/xe: Use fb cached min alignment
  drm/xe: Reduce DPT table alignment as in i915
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe: Force flush system memory AuxCCS framebuffers before scan out
  drm/xe/display: Add support for AuxCCS
  drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++----
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++--------
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 8 files changed, 261 insertions(+), 123 deletions(-)

-- 
2.48.0

