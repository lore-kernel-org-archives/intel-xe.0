Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431EFCA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB9310E4B1;
	Mon, 18 Aug 2025 17:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXonuI9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D8B10E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755537770; x=1787073770;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Q33LaalsPIn+spfdU6qYeVaTiTsGUH0RZfpD5UNwwE=;
 b=nXonuI9dQRwcLVHadJU5QQNixlKrwVYcJOhaG8bcD4QOG7uR5V07Gg7g
 uZBq58SCv3k/f2EY+VfvGTlYkCfM+sd5498dIRg2yOAcfSUKpPvVNfnBj
 8CcQ7j7pc1s3YufD5KbXQ+IufwwuxZBdlYj3kPciQt5xmccETfideN4SE
 mCJD1U4w6Td/xZfHCBNBYWm6micC2Bcxunp62KzEXwTpun64HxEFmWi10
 TEyniZhEVO07fPrRHzXIamJ0WA9HGiXF5M7StqJxDVTDlDOluLMVJk14t
 HYIptEn0eErR5isKw6z9d+riyrrTci8T1+vm4KPzJtSWZolbj/FthoPZ9 w==;
X-CSE-ConnectionGUID: CZuGkKp/Sp+BkUzQ1SVJDg==
X-CSE-MsgGUID: 45buI23tQpCgUMHKbctgdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68478662"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68478662"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:22:47 -0700
X-CSE-ConnectionGUID: YBxvEoW5QnmFyOQyDwoObA==
X-CSE-MsgGUID: VEESeIrWR2+0yOcGZsZpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167871633"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:22:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/3] Core Xe changes preparing for VF resume
Date: Mon, 18 Aug 2025 10:22:40 -0700
Message-Id: <20250818172243.2649863-1-matthew.brost@intel.com>
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

Test-with: 20250818165742.2648473-1-matthew.brost@intel.com

v2:
 - Fixup CI failures by ensuring DRM sched TDR never fires for LR jobs
v3:
 - Don't adjust ring head on GT resets, this could break kernel queues
 - Resend for CI with test with tag

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

