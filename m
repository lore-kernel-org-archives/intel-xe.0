Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5596BCA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087BD10E1CF;
	Thu, 18 Sep 2025 13:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtbwH94x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4E610E1CF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203794; x=1789739794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=REChttYlXUVDAuFtH7ThR153fiR7VgJ54BhAWRc8klM=;
 b=FtbwH94xNWafxsiCW7GlITS7jTFFLN1vIGa7t578iJxznHQKLrnxyDQf
 3nV2sqzHrl2zqo2jLjUJSujZLkoVlx5hnsEB+yw+Gt7URox4HF2VnMGyS
 njJlVv72JEQtm4uCj1AbEukcSbTh1nTWndK2il2tkVfh4+A2olq27XErD
 Ss1TGdZtwZ6jqCBWqFQgwdfNCTU5SkxdJt3gVRdu5GG34NqYIY8pE8PY5
 7PeJ2eZwKP9BhJubmO/WuZCRO1an9xYSVC9MbiupZPUffSE3rdi3z/rCr
 8rhEnt3dcm0idhBRhivKOB4+G4hUxk9+0EZ11EUn3Bj05TPgHHuT50h4X A==;
X-CSE-ConnectionGUID: 5Rh9YMPESuiqeT0ohNv+gQ==
X-CSE-MsgGUID: ma39WH+IT8e6Izd+QkwtOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337074"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:34 -0700
X-CSE-ConnectionGUID: z/NXne2uTrGQSkYaLsLrgQ==
X-CSE-MsgGUID: QmcEfScpTqWc6cbJufa9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828022"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:33 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 0/5] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Thu, 18 Sep 2025 19:55:24 +0530
Message-Id: <20250918142529.608432-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series implements VM_BIND decompression support in the XE driver
and adds on‑demand decompression at VMA pagefault time.

Tested with https://patchwork.freedesktop.org/series/154711/
which validates basic VM_BIND DECOMPRESS behavior for both
regular and FAULT_MODE VMs.

Nitin Gote (5):
  drm/xe: add VM_BIND DECOMPRESS uapi flag
  drm/xe: add xe_migrate_resolve wrapper and is_vram_resolve support
  drm/xe: add drm_exec helper to atomically lock VM (+ optional BO) with
    BOOKKEEP retry
  drm/xe: implement VM_BIND decompression in vm_bind_ioctl
  drm/xe: perform on-demand decompression on VMA pagefaults

 drivers/gpu/drm/xe/xe_gt_pagefault.c |  41 +++++-
 drivers/gpu/drm/xe/xe_migrate.c      |  90 +++++++++----
 drivers/gpu/drm/xe/xe_migrate.h      |   7 +
 drivers/gpu/drm/xe/xe_vm.c           | 187 ++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h            |   1 +
 5 files changed, 292 insertions(+), 34 deletions(-)

-- 
2.25.1

