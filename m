Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C5CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BF410E272;
	Fri, 10 Oct 2025 12:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUcI0aip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63DB10E272
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760098908; x=1791634908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YOJP4opDjWfUH3UOqsqluJLDbUyfgtf6idfGoISXLGg=;
 b=FUcI0aipWHyXPwHYmKki/gOKJHMVhbG3UokD21/5sak3lUw4K/dtxpqC
 viWDnXuoCrH2Irtk20qr86CVzysjSD5LdVxik8KX++E3Mv8AaPuSzcld5
 Hxfq2Bdc5Mg6CNR7qJu/SuHfLdTt7W2w2HGEkmH/UuHqaw5PeiWHBKlsh
 A3vETZkhWYCJirDsUYUuQHvJ5gJYQMEaS0XM53ItwhMd4Ykt/wQP3118S
 y0/2iRvYHz0gk1+TOtew0JwStoJsP20VYsSs34W/GA4goKjMt8LObUFkC
 m1UvsvEGVtLlhwjmBxlCB2Y0G/f0NM552Ij2yOlc4uI048xYquu1A8f/4 g==;
X-CSE-ConnectionGUID: eEB6zp2KRM6zb9uBahwRIA==
X-CSE-MsgGUID: GYkyLVNhRJi0Jfgd7Kmbrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61525553"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="61525553"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:21:47 -0700
X-CSE-ConnectionGUID: 9PAUXOxYSi6vA+SzZnlVtg==
X-CSE-MsgGUID: U+gkncndR62QFLgX87Rf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180913229"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 05:21:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 0/3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Fri, 10 Oct 2025 18:09:01 +0530
Message-ID: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
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
V5 -> V6:
- Used xe_gt_assert() instead of xe_assert() (Matt B).
- Use emit_atomic() function to write MI_STORE_DATA_IMM instruction
(Matt B).
- Fixed review comments (Rodrigo)

V4 -> V5:
- Fixed review comments (Matt B)

V3 -> V4:
- Fixed review comments (Wajdeczko)
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

 drivers/gpu/drm/xe/xe_migrate.c      | 253 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h      |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
 3 files changed, 236 insertions(+), 25 deletions(-)

-- 
2.51.0

