Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13571CA1010
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 02:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD710E229;
	Thu,  4 Sep 2025 02:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnotYgt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3910E229
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 02:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756954074; x=1788490074;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uE+hZF+1WR9CsGatr0XW6XAaWXoW27lgFGVH7vIXb9s=;
 b=HnotYgt15vBDLPUYflOH6hfSGCELF6ZkaCG47gY5nXqzUV03isne/dP3
 i6pGzXnv7GtpTci0WlSW9JBb5gTQAPFHAbAo/+SWzlnptFBS9hMQ26BtY
 Rq9ujGeu88ziP0D78WR7bPFTPv24DtU/5XHZKOx15Qdv6xU7AbOrkFiAz
 aUGDilsj0Jp2roXIQuy4uwd4Xx4EF+am9Zbh4J9hXBUhKRHaB5CYujUR9
 WKLvAAdUYGs3CabmSLBnunD5Ka1hF+XvDtAEFSBvUXDZw5QMqYtuKHeDh
 rlk+FsVQBdQmmMGxZRygBsdpPZM36bx05uKlwnbigJ+Yjo2ecFVfPVt2J A==;
X-CSE-ConnectionGUID: FytdRtNOTqmBY+GTn4WH8A==
X-CSE-MsgGUID: uXtghOQ3TQO2x2Xz9QGTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69544450"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="69544450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:47:54 -0700
X-CSE-ConnectionGUID: vXEyriKSRmiESNTyYDLcVw==
X-CSE-MsgGUID: Z/O/uU7wTBeFT29f2YkYJQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:47:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/4] Core Xe changes preparing for VF migration
Date: Wed,  3 Sep 2025 19:47:45 -0700
Message-Id: <20250904024749.1849710-1-matthew.brost@intel.com>
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

Fixup a few known issues in Xe core code ahead of VF migration feature.

Small behavior changes in LR jobs, these now can be resubmitted. LR
queue's now have DRM scheduler flow control too which renders
xe_exec_compute_mode.non-blocking invalid.

Test-with: 20250818165742.2648473-1-matthew.brost@intel.com

v2:
 - Fixup CI failures by ensuring DRM sched TDR never fires for LR jobs
v3:
 - Don't adjust ring head on GT resets, this could break kernel queues
 - Resend for CI with test with tag
v4:
 - Clarify commit messages
v5:
 - Include VLK-74448 fix as this popped in CI runs
v6:
 - Minor tweak to VLK-74448 fix

Matt

Matthew Brost (4):
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list
  drm/xe: Don't change LRC ring head on job resubmission

 drivers/gpu/drm/xe/xe_exec.c            | 12 +---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 19 ------
 drivers/gpu/drm/xe/xe_exec_queue.h      |  2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      | 89 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  5 ++
 6 files changed, 99 insertions(+), 51 deletions(-)

-- 
2.34.1

