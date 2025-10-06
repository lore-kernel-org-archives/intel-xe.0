Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F843CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682DC10E073;
	Mon,  6 Oct 2025 15:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdwMPZtg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4C10E073
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759763268; x=1791299268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=soYDoLuj6UJ6DRwl0pwp1AHxumde1ZfhVuV2gpKlIjw=;
 b=KdwMPZtgcMpWJ6e04Hio9BFM+EDd4gS4cYnbiiJapUMCFs9ymi3i60bQ
 zn3dCRXYN205FhodgJtDgjGt9zGyuK1POOb7Io95KMY9pWytuJURfQBj3
 KaK0PbOfKhCRzIZATg+8OVGxWIu/uDcqQXg3VSHU9Elmrk9kH8oqsa8tk
 bY+0E7/Fqyf4H8W+1ne8P2Z/ufgyYGjUlA/Afy2ZEE2+rJxqRoCP3YyTl
 TsfxzbUOs4VHzm6BCQdXmntBIRmSz+W6fTyfITNNYC2B2UswdPiVXsOwg
 QwIOsa8EA8RxQrLkZWnL8uwA+fpa+M6uQsp6BlfxMw24kDlC97Xc+KMmW g==;
X-CSE-ConnectionGUID: oy/QzXjHR3aRhPdQp4lt9A==
X-CSE-MsgGUID: VTg3ifQwQkOtK6EoZ58Xow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65769442"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65769442"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:07:47 -0700
X-CSE-ConnectionGUID: jm7c0EGiQWa9TzA3g7LNUg==
X-CSE-MsgGUID: DcrWPEolQ9iZjUlPLNTSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="216985382"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2025 08:07:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Mon,  6 Oct 2025 20:54:44 +0530
Message-ID: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
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

The CCS copy command is a 5-dword sequence. If the vCPU halts during
save/restore while this sequence is being programmed, partial writes may
trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
instruction to write the sequence atomically. Since VMOVDQU operates on
256-bit chunks, update EMIT_COPY_CCS_DW to emit 8 dwords instead of 5
dwords. Update emit_flush_invalidate() to use VMOVDQU operating	with
128-bit chunks.

The MI_STORE_DATA_IMM instruction header is quad dword in size. If the
vCPU halts during save/restore while this sequence is being programmed,
partial writes may trigger page faults when saving IGPU CCS metadata.
Update instruction header atomically.

Clear the contents of the CCS read/write batch buffer, ensuring no page
faults / GPU hang occur if migration happens midway.

---
V3 -> V4:
- Fixed review comments. (Wajdeczko)
- Fix issues reported by patchworks.

V2 -> V3:
- Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
- Updated emit_flush_invalidate() to use vmovdqu instruction.

V1 -> V2:
- Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
(Auld, Matthew)
- Fix issues reported by patchworks.

Satyanarayana K V P (3):
  drm/xe/migrate: Atomicize CCS copy command setup
  drm/xe/migrate: Make emit_pte() header write atomic
  drm/xe/vf: Clear CCS read/write buffers in atomic way

 drivers/gpu/drm/xe/xe_migrate.c      | 231 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h      |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
 3 files changed, 215 insertions(+), 24 deletions(-)

-- 
2.51.0

