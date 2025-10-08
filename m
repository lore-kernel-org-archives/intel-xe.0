Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73808CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 09:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3510E0E3;
	Wed,  8 Oct 2025 09:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzwqBrVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5DC10E0EA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759917272; x=1791453272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CVz9BVRKnJg3oNW/3YlBjYgp/xQ1k40tpvs7sgSnZmQ=;
 b=gzwqBrVjSGXMpyDEu7P7cYdRa6b/NkKaqtx8ohScTEnjk+xoKQp0HEGu
 xucxHCBht6qaF6gBr2Skg66NGUrTtLFCutnYb07OCvSCj8F8ksrElGafH
 IPjS8oMrmw9d/nmR+Gntsna2KENa82u/3RjAz65u0RK4mpetf6S6Tzmwu
 7Z8aU23EO5dGef6hky8hN1Vz6TWB9tpZiCoGZzfBSVASj+9dyS9LG4vyT
 p8u4CtmjhPXSQ5z5OvDXjnafuAigw98abIcbalcYvuoUHUYaFgDShiwNt
 +7TkV/9UMzH/A7VDy5n3luflTJnsVuddvwMh+2u/K2bJoNioId5BkECiK g==;
X-CSE-ConnectionGUID: cBYRO5mQRrCOAIbj/tW+TA==
X-CSE-MsgGUID: dpL9ILarSFyooc5KW96/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65958483"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="65958483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 02:54:31 -0700
X-CSE-ConnectionGUID: W7Wsp6W5T+6TI/b7QQem7g==
X-CSE-MsgGUID: g5pn6zhDQIqBE7hXFk52Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180425475"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 08 Oct 2025 02:54:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 0/3] drm/xe/migrate: Atomicize CCS copy command setup
Date: Wed,  8 Oct 2025 15:41:46 +0530
Message-ID: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/xe/xe_migrate.c      | 236 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h      |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
 3 files changed, 220 insertions(+), 24 deletions(-)

-- 
2.51.0

