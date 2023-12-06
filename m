Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5666AC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA1410E7CA;
	Wed,  6 Dec 2023 22:21:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2E10E7CA
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701901282; x=1733437282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KNSM+MwtgzVeGjlinclWRIWxOCAR1wVFHc1W7CF/Et8=;
 b=a1zf3wSVfwoWaivGA1aHf/LvjS9Ng8uyvrP/1a1p8xTDxcIufuOI82ne
 HI22Cx6EMkoANl32T9OC8RBtnXC3ogkpxtVMVuEbetpO5QJESnZ/Q+ZYt
 8eHPhXEFOMwW0aXmfkviz66K4gsj7cebOeS2Vrn/4j8nz5Q3IEHcgUOS5
 a4npF/W8vmRi7JVDqUspXByK8uCtwu6D7JP/2uPCK6lr45CHsCwkK32F3
 ys7AOGR/2I39d/DjBavzGA5ZnlQOnSGe8jRZRKOg39TdJrNrcewYWaoxU
 Io4xYJqNt7tlav11HferLtvfeV1qFiA74O2QKtIOT3M+8pC4YVgHdSJHn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425286687"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425286687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800500658"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800500658"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 14:21:35 -0800
Message-Id: <20231206222141.398040-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/6] Allow num_binds/num_batch_buffer to be
 zero IOCTLs
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

Easy way to flush exec queues. A semantic that VK will likely use.

v2: Rebase
v3: Bug fixes
v4: Address Thomas + Chechpatch feedback

Matthew Brost (6):
  drm/xe: Use a flags field instead of bools for VMA create
  drm/xe: Use a flags field instead of bools for sync parse
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe: Take in-syncs into account when num_execs or num_binds == 0
  drm/xe: Add last fence as dependency for jobs on user exec queues

 drivers/gpu/drm/xe/xe_exec.c             |  32 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  14 ++-
 drivers/gpu/drm/xe/xe_sched_job.c        |  17 +++
 drivers/gpu/drm/xe/xe_sched_job.h        |   4 +
 drivers/gpu/drm/xe/xe_sync.c             |  82 ++++++++++++-
 drivers/gpu/drm/xe/xe_sync.h             |  11 +-
 drivers/gpu/drm/xe/xe_vm.c               | 141 +++++++++++++++--------
 9 files changed, 249 insertions(+), 62 deletions(-)

-- 
2.34.1

