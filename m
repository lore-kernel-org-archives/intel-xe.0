Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B94D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7310E09D;
	Wed, 10 Dec 2025 05:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0sdbcsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBCB10E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344351; x=1796880351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/XsGy48bXo8wao0go6L/O/wRjhggYZX2wJCVNrGvYDQ=;
 b=M0sdbcsLUD7YwnCPUMsmkj9LCjejeJ2bMnkXswT3mQjl8SyWVmw35BbW
 wjhcgipV6mCxed0hS6Id8Foj1S9Stx5XnjR5c1hXbvE0o7LfYhuDb7MoT
 tzmYN7N/iz5geywrQZybIe6NK1YSo+MncjSiOxsrpdzueib9oyaAVby/3
 W67+qA3OSZE4uZrIWJIK83afbopdo1jUiGG9BwZFIXvOhFcOM9kfvfTan
 KjBCVMAKG20TVQW6JVJFpR3a5Y0iSkfJ3J1CXtB3mR8/CuYQMzAmIxBou
 kFKlRa+Ad34HZXbRdyqvAbelTf5WhImzBGHtp+vH4g3zTi92p1kQ7Q+wL g==;
X-CSE-ConnectionGUID: tWlWA+tpSUa7pzEpFWctHQ==
X-CSE-MsgGUID: lRLejjS8QzqOP2+RJnCV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84723065"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84723065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:25:50 -0800
X-CSE-ConnectionGUID: oDRQcJMqQWCBj+ZoToXLBA==
X-CSE-MsgGUID: 6o5MP+EYRhSnRFbGQx4O+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196419990"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 21:25:50 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/2] Reset recovery_queued after issuing RESFIX_START
Date: Wed, 10 Dec 2025 05:25:47 +0000
Message-ID: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
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

During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
clears the RESFIX_START marker. If migration or resume occurs before the
VF issues its own RESFIX_START, VF KMD may receive two back-to-back
migration interrupts. VF then sends RESFIX_START to indicate the beginning
of fixups and RESFIX_DONE to mark completion. However, the second
RESFIX_START fails because the GuC is already in the RUNNING state.

Clear the recovery_queued flag after sending a RESFIX_START message to
ignore duplicated IRQs seen before we start actual recovery.

---
V2 -> V3:
- Fixed review comments (Matt B)
- Updated commit message (Michal W).

V1 -> V2:
- Fixed review comments (Michal W).
- Updated commit message.
- Used scoped_guard for spin_lock/unlock_irq.
- Created a new commit ("drm/xe/vf: Avoid queuing migration recovery if
queued or teardown is active").

Satyanarayana K V P (2):
  drm/xe/vf: Fix queuing of recovery work
  drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.43.0

