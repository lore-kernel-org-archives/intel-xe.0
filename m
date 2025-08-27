Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3DCA0FF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7E510E13E;
	Wed, 27 Aug 2025 21:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jysxVt4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB8710E0B0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756329014; x=1787865014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W+OK863wY1FRHRF1zlHqus4qqiTf5VPEtw4laLP+Lwc=;
 b=jysxVt4HLA49x13q++cHipyaEmtCjZLtatQDhXHi/aivywRet917uiMe
 o4K1pc+4klCkST01Q7Ot3KZjzcrSQ8Z22E3FkDQSxxAPWjmq3aZTUR+19
 VMnnqvWFNZn85YSURnQ85+RMN9dVUAf9R5+g16Ktfs3WAZopF1iWB0HJu
 gBrCZuAdpcbf7nOxWa3dh2+rdTJWpGa5Y2p7BCBAeIOscra5V6r0LowcM
 6szrTRjiGGKi8Rd0WSBeaRmls4FxfI+pPtCEJyZrwKvbUxePJGnA3zHFJ
 o54sVsm8/D0adZrkJZg4Zl+h8Bxv8Bvs47sA+UscyE+Mp/iN4FSyycDGZ A==;
X-CSE-ConnectionGUID: YqyMYWlkS5uJOQYH+ByUQQ==
X-CSE-MsgGUID: yNHJuj40SHa3g1HCQuhvIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58658331"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58658331"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:10:14 -0700
X-CSE-ConnectionGUID: eaY9x7YNSRKXkMDmTIC/1Q==
X-CSE-MsgGUID: M9pRWAY0TfC3/rIOt6Vzow==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:10:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tomasz.lis@intel.com
Subject: [PATCH v4 0/3] Core Xe changes preparing for VF migration 
Date: Wed, 27 Aug 2025 14:10:07 -0700
Message-Id: <20250827211010.308372-1-matthew.brost@intel.com>
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

Matt

Matthew Brost (3):
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list

 drivers/gpu/drm/xe/xe_exec.c            | 12 +---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 19 ------
 drivers/gpu/drm/xe/xe_exec_queue.h      |  2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      | 79 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  5 ++
 6 files changed, 91 insertions(+), 49 deletions(-)

-- 
2.34.1

