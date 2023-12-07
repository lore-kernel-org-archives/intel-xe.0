Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED11C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D77110E7E6;
	Thu,  7 Dec 2023 05:57:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A86610E7DE
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701928630; x=1733464630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8aDVPlJzURfibTNiETThNrty2kz6xUIRul1SGpuaids=;
 b=j+wUhBGTSVVK8LogbUEtuo+j7Cc/HQNeo5Gg3luwSpJxOVgz62RoWyiE
 PiviYxv2pJOkxTgy/GqrurtsVI3ZAgRNsqwP3r2qxn96ojb82A+hebj9g
 VIMyLKHtGYtS4iHQ7ao63SngvtFz6WkdIwPVDDHeypmnOZlYamBFtXm/X
 0J+8RgmMnBGF/3Xbn/rV4xXNdsLIyTCAB7a7AkySWg6DOjMXxXrMqvJvf
 GDUNDEitzWSCNpxk8EP2uU6/UHXNZB3csOI/Bveyd4zjBHzGktRhhUUUL
 Z/TxPBEk9JgadEL5ApMyy6JJ+Fq/JEBaF+3MaJtgGimCWW7fQw074H0mA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7540171"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7540171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895019842"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895019842"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 21:57:22 -0800
Message-Id: <20231207055729.438642-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/7] Syncs vs async exec/bind uAPI change
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

Last patch should explain it nicely, built on top of [1].

Backwards breaking, IGT change will be on list shortly.

Matt

[1] https://patchwork.freedesktop.org/series/126546/

Matthew Brost (7):
  drm/xe: Use a flags field instead of bools for VMA create
  drm/xe: Use a flags field instead of bools for sync parse
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe: Take in-syncs into account when num_execs or num_binds == 0
  drm/xe: Add last fence as dependency for jobs on user exec queues
  drm/xe/uapi: Uniform async vs sync handling

 drivers/gpu/drm/xe/xe_exec.c             |  88 +++++++--
 drivers/gpu/drm/xe/xe_exec_queue.c       |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +-
 drivers/gpu/drm/xe/xe_sched_job.c        |  17 ++
 drivers/gpu/drm/xe/xe_sched_job.h        |   4 +
 drivers/gpu/drm/xe/xe_sync.c             |  82 +++++++-
 drivers/gpu/drm/xe/xe_sync.h             |  11 +-
 drivers/gpu/drm/xe/xe_vm.c               | 242 ++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_types.h         |  15 +-
 include/uapi/drm/xe_drm.h                |  56 +++---
 11 files changed, 373 insertions(+), 175 deletions(-)

-- 
2.34.1

