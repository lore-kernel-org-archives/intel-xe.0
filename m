Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A60D3B7DD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 07:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6410E3A2;
	Mon,  8 Dec 2025 07:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNeS4vdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269910E3A2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765178864; x=1796714864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ak+xz/BtGWOdrWwzrmTbXuJkFqiOJcLq3biUBcxcTUA=;
 b=MNeS4vdwPMUkln9LLk8ILcH6ykOiRCYv6dO4puc+C1CJXgFp+DTsUZc8
 UkmEw0bpmzct/qfMiZSOxCd4aEp6OeC7bdhCkL+pGjKE9ixylBzMtMoe8
 oFS5s+0QRSwNV8YswC8hppRHUyby7fgwjSyHrIk28eHbkpBdGXeEAgIxM
 yKIPgDK/xmmL2PIROBZmAwQDhLLNLa08Tym4FeRtcs9wTAMcSwF0NLHKL
 IA529WSfDUZvFEMK4eSkH/igAQDlav/da4s+xdDAGVya0wwnPDSbU00Wd
 xvjHjKzUbp1VCHo8OxVtwfz0K45fc0kfoksAS9YPBWiQRJ2R7J9VzNI0r w==;
X-CSE-ConnectionGUID: qUF3GSnrQB+oP1rFB0fpjQ==
X-CSE-MsgGUID: ikzrAoyWQMyR6gzg+lb9Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54658497"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="54658497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 23:27:43 -0800
X-CSE-ConnectionGUID: 3kvH4JZtRliE9xEKSE/icg==
X-CSE-MsgGUID: 129NKAIRTWGfpRA53miINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195769565"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 23:27:43 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/2] Reset recovery_queued after issuing RESFIX_START
Date: Mon,  8 Dec 2025 07:27:40 +0000
Message-ID: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
clears the RESFIX_START marker. If migration or resume occurs before the
VF issues its own RESFIX_START, VF KMD may receive two back-to-back
migration interrupts. VF then sends RESFIX_START to indicate the beginning
of fixups and RESFIX_DONE to mark completion. However, the second
RESFIX_START fails because the GuC is already in the RUNNING state.

Clear the recovery_queued flag after sending a RESFIX_START message to
ignore duplicated IRQs seen before we start actual recovery.

---
V1 -> V2:
- Fixed review comments (Michal W).
- Updated commit message.
- Used scoped_guard for spin_lock/unlock_irq.
- Created a new commit ("drm/xe/vf: Avoid queuing migration recovery if
queued or teardown is active").

Satyanarayana K V P (2):
  drm/xe/vf: Avoid queuing migration recovery if queued or teardown is
    active
  drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.43.0

