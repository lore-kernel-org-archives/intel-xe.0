Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CECA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1885A10E2B7;
	Thu,  4 Sep 2025 02:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ue4aWURz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585D10E224
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756951813; x=1788487813;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=op5WWInKnvPijxIJtLGl5KwZcOpdBPZykA+pxLYWsGQ=;
 b=Ue4aWURznhhXy2+2n5qL7mwv8hjzc+hM81bcV7ngBsdf2OOZCpB+6mCR
 B6wI19Z/qEiZUrv0qna8tNVNAEPe63GVyUuRvB3fyRMtsJsrAtu/EoVmm
 SQu9gMyHY4/IQRdLulvj+9WQtdNTBZSPMlQLUXnOdyrQkEL89pOG091YR
 6d3ZpAsbjra9uDgOdb0IDNBDlcgnGT7+6BgCmjBoLh+A4pVq40VHxo9f8
 GcDoNNsiTPAztCuf9SCrjKj6CozmBkuDQuu1n8br0bsJMfFBBM5faY7uD
 tpV6Qvcy1rpTy3y6XaJbud/cc2ArZgK4ECGL5pgXlbo/jVLoFpTtLcAa9 Q==;
X-CSE-ConnectionGUID: xcN8lWSNSfqaXXNwU4h4+w==
X-CSE-MsgGUID: d05DMoh1StuymFAslyT7FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76728292"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76728292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:13 -0700
X-CSE-ConnectionGUID: GRfc+bF/SjO3JfaO2aViWw==
X-CSE-MsgGUID: T+fzapnMTu+hH3ruGL5yZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="176112242"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/4] Core Xe changes preparing for VF migration
Date: Wed,  3 Sep 2025 19:10:04 -0700
Message-Id: <20250904021008.1827802-1-matthew.brost@intel.com>
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

Matt

Matthew Brost (4):
  drm/xe: Save off position in ring in which a job was programmed
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list
  drm/xe: Don't change LRC ring head on job resubmission

 drivers/gpu/drm/xe/xe_exec.c            | 12 +---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 19 ------
 drivers/gpu/drm/xe/xe_exec_queue.h      |  2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      | 86 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  5 ++
 6 files changed, 96 insertions(+), 51 deletions(-)

-- 
2.34.1

