Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0FFCA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 22:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086B10E9D6;
	Fri, 15 Aug 2025 22:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxU0kwTg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290A10E9CA
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755296540; x=1786832540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ttbwTpIEwfQyo2Wsi8vw57EFqhtxyuqxJDuiZycRFA=;
 b=YxU0kwTgMjL7gLJJF4FcIsp+2Y+7qxO8drK0cGTw3eKi126AbSa11CDA
 tNTx2TPkqlOTxFwVlKYR1H3k/px839XCTa/WTZ9aALP7vPC1Q5BVGJUAj
 rB5N/lVpnvyYJJwTIMOknu74353Awt1/0NU1P9MFVSi3VsaezcHu3oZj/
 LPm/pskNZqwY6AF7ljbb4kC5lkAkAzkVeQUW0awgdaV0lcxeOm7D8fbaH
 0u586MXFzyUGlJ/uFzExNqNUVDAV/B+8p+3tfOgkBpG+UKVM8wJ3n3hMm
 +J3/Fr/YbPECDezb07faVPbtPC3grs+uE+7Cl+5Ym3Nf76BuZyie/un9P w==;
X-CSE-ConnectionGUID: WA89/J60THa7L5YMJwtlRQ==
X-CSE-MsgGUID: oRjHcrg4Tj2tTLIc4gUOmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61252012"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61252012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:22:20 -0700
X-CSE-ConnectionGUID: pxFwxcEjRWCKir1OutiK1A==
X-CSE-MsgGUID: v68vZ/3sSwynwtGyBTyT8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166330481"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:22:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, tomasz.lis@intel.com, stuart.summers@intel.com
Subject: [PATCH v2 0/3] Core Xe changes preparing for VF resume
Date: Fri, 15 Aug 2025 15:22:12 -0700
Message-Id: <20250815222215.2547894-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fixup a few known issues in Xe core code ahead of VF resume feature.

Small behavior changes in LR jobs, these now can be resubmitted. LR
queue's now have DRM scheduler flow control too which renders
xe_exec_compute_mode.non-blocking invalid.

v2:
 - Fixup CI failures by ensuring DRM sched TDR never fires for LR jobs

Matt

Matthew Brost (3):
  drm/xe: Take preemption into account when resubmitting jobs
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list

 drivers/gpu/drm/xe/xe_exec.c            |  12 +--
 drivers/gpu/drm/xe/xe_exec_queue.c      |  19 -----
 drivers/gpu/drm/xe/xe_exec_queue.h      |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      | 101 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ring_ops.c        |  23 +++++-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 ++
 6 files changed, 111 insertions(+), 51 deletions(-)

-- 
2.34.1

