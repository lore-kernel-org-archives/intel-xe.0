Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B6CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 13:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094110EC3B;
	Fri, 17 Oct 2025 13:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+DEKG/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0810EC3B
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760709309; x=1792245309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=034FAMNh0lzrtuJaugBzmyD5ggeMPXmUtctYtZibyDE=;
 b=P+DEKG/ATZvp3EQtrt4pTXbAt/3aMFVQNXxGlT6IAWcsmR7fn1yzE0A7
 E18xZMbL98hZa4Ns2C1SwesKEPb91CRty1fkLWzbjCdAbKi7XieKE2NPh
 qZU/trGeuxtwd8a17TCf0pJS3reLNz/OEC2eWtnJrU0HAd0kcZVsNe8pG
 DnC7bd0+mlx6pAYZh8R1CKy+WLEXFUU52qOse0bwXuo5ID7wJpcfE7NwN
 x0/eJ66VkRvpLB3AuZCsSPr//b84pdQRsaaA0ruBfPe5sSF2t18CcImLW
 ImC6mpVGaG0+9teFd0zQROiv8+Dg3zldnP8iGZAsq6a7+54nCoGRNGP3v w==;
X-CSE-ConnectionGUID: AYJYGfR6S8mdKf8/riansw==
X-CSE-MsgGUID: m906eh0mRjic7vQuNcBK3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80549756"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="80549756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 06:55:08 -0700
X-CSE-ConnectionGUID: CivHgeDfTOKUaw0cwYlD0Q==
X-CSE-MsgGUID: pD52yNvcTXC+y1UkokD5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="213338054"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 17 Oct 2025 06:55:08 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 0/3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Fri, 17 Oct 2025 19:42:27 +0530
Message-ID: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- Added description explaining why to use assembly instructions for
atomicity.
- Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
- Include <asm/cpufeature.h> though checkpatch complains. With
<linux/cpufeature.h> KUnit is throwing errors.

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

 drivers/gpu/drm/xe/xe_migrate.c      | 260 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h      |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
 3 files changed, 243 insertions(+), 25 deletions(-)

-- 
2.51.0

