Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B20CCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7AF10E0F1;
	Mon, 25 May 2026 09:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrWLlVvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00CE10E0F1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701601; x=1811237601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0b8CbsPnUmfSw/I0ZZgmbwzRx1wrR03iuj0PysrxY0=;
 b=TrWLlVvJSKq/aLoxAAtFrrY3wtEa7/0XG5mHHVm70iY2UaTID5F6cQ6E
 T7aC54weScjyYogkNwRBiJTycnuhJiAPuJMim5EbaQkylzbQPpNJJQTaj
 +krSRvCXfEpgNaqTrb0NiFolFfHxEH0Eu8YXDtmuOpd0f2Y2VNA5R9Ppj
 qhh8pO/Zbd2WZtBqgayboCQwF1haO+dXnk5F1LZ85XPKufsRJNfj4DMvH
 m7r52ALkz5U/cTWUp9U/LNp2+Xig22DFSYYFdJNDW00MCR7gJhKjkfG7v
 /3loMpwZi906l6zDzgzWoRKORvGhc9eC4erg1PP5yX5FWqhGt89EetB1B Q==;
X-CSE-ConnectionGUID: Y/5Am1bISYiI89nOzrPRCA==
X-CSE-MsgGUID: rrzdwycMSkWF5MtIOLfKNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046794"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:20 -0700
X-CSE-ConnectionGUID: hrKLGoDIQP2o2jk8cJISxA==
X-CSE-MsgGUID: x0JIjBMAR3O1mg0j49s4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669608"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v6 06/15] drm/xe/xe_drm_client: Skip run_ticks fdinfo during
 device reset
Date: Mon, 25 May 2026 15:36:25 +0530
Message-ID: <20260525100619.3155663-23-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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

When a user process crashes, systemd-coredump reads /proc/<pid>/fdinfo
for every open file descriptor. If the process has the Xe file
descriptor open, this triggers the fdinfo callback. fdinfo callback
reads the timestamp mmio registers by acquiring a forcewake.

When an AER is triggered and SBR is requested, xe device quiesces and
wedges the device that causes the user application to abort.
systemd-coredump then tries to acquire forcewake but MMIO is unreliable
when SBR is in flight causing spurious failures.

[ 1593.570091] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: Force wake domain 1: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
[ 1593.570218] ------------[ cut here ]------------
[ 1593.570220] xe 0000:03:00.0: [drm] Tile0: GT0: Forcewake domain 0x2 failed to acknowledge awake request
[ 1593.570224] WARNING: drivers/gpu/drm/xe/xe_force_wake.c:206 at xe_force_wake_get+0xe6d/0x1f20 [xe], CPU#5: systemd-coredum/9237
[ 1593.570916] RIP: 0010:xe_force_wake_get+0xe7e/0x1f20 [xe]
...
[ 1593.571082] Call Trace:
[ 1593.571084]  <TASK>
[ 1593.571087]  ? __pfx_rpm_resume+0x10/0x10
[ 1593.571095]  ? mark_held_locks+0x4d/0x90
[ 1593.571104]  ? __pfx_xe_force_wake_get+0x10/0x10 [xe]
[ 1593.571220]  ? __pm_runtime_resume+0x85/0x130
[ 1593.571225]  ? xe_pm_runtime_get+0xfd/0x2e0 [xe]
[ 1593.571379]  show_run_ticks.isra.0+0x31b/0xa50 [xe]
[ 1593.571497]  ? __pfx_show_run_ticks.isra.0+0x10/0x10 [xe]
[ 1593.571619]  xe_drm_client_fdinfo+0xde/0x120 [xe]

Check if device is in reset to skip MMIO access during SBR.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..266ffb60412c 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -326,8 +326,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	 * RING_TIMESTAMP registers are inaccessible in VF mode.
 	 * Without drm-total-cycles-*, other keys provide little value.
 	 * Show all or none of the optional "run_ticks" keys in this case.
+	 *
+	 * Skip also during PCI error handling when a reset is in progress, since MMIO is
+	 * unreliable. Attempting to read RING_TIMESTAMP registers would return 0xFFFFFFFF,
+	 * causing spurious errors.
 	 */
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe) || xe_device_is_in_reset(xe))
 		return;
 
 	/*
-- 
2.47.1

