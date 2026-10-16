Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61063CCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE961129C2;
	Fri, 16 Oct 2026 20:03:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA591129BE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792180998; x=1823716998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZYwbKURfcD6+2600QE30Q8bawR0pYr7a3HBTC9ssWQ=;
 b=B6VuHhhj2VKnno4T3HuBB8dv2RHuISfvPlXsDzNcWKVvUohZHa60AeNZ
 rwpZRu180KLlz8uhBD0juuDP6uGA3gau6mUnMDqZZ32+cBHxpcchd8msB
 ucf2nBVzGsWzRZ4Wf+7W5zuzuunZ0c9Kt7iK5nmWZ6sXhyf/q+k6v1cCe
 7+tmlwJwgeLP37P4hQuy6WkxV1jIlbprYb7RAYG2XfMuwzYIU/YJ3KMXm
 hdhpmwWA32RHWJ82mIW6u6GYxsROkAYwQGABGLTbpsRIICA8JQAvSsikx
 h1SAq5SyJnIA2WFUM1dGVt3Mba7njVNR5X8x+4L5IhMC05hi3tUu+Flos w==;
X-CSE-ConnectionGUID: edw6T75jRCOGnZyxZd9x1g==
X-CSE-MsgGUID: rxADxROjRC+OD4iixSDwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="962864"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="962864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:03:18 -0700
X-CSE-ConnectionGUID: viZgCi/QQKmOFDPxwmzzcQ==
X-CSE-MsgGUID: 0In+nOKNR0OiCw3SO5Ki3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2020082"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa004.jf.intel.com with ESMTP; 16 Oct 2026 13:03:18 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v4 0/3] FD close cleanup for XE
Date: Fri, 16 Oct 2026 12:59:01 -0700
Message-ID: <20261016195904.1377149-1-daniel.charles@intel.com>
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

This series synchronously disables GuC scheduling during exec queue
teardown on FD close, avoiding races with queue resource teardown.

v4:
    - Patch 2: wait for pending enable/disable operations before issuing
      the early disable; skip it if the queue has no references, and
      assert the queue is referenced when kill is entered.

v3:
    - Patch 3: use a dedicated kill_wq to avoid waking all CT waiters on
      each scheduling-disable response. See patch 3 for details.

Daniel Charles (1):
  drm/xe: Synchronously wait for queue kill on FD close

Matthew Brost (2):
  drm/xe: Read scheduler message opcode under lock
  drm/xe: Disable scheduling early on FD close to avoid CAT error
    cascade

 drivers/gpu/drm/xe/xe_device.c               |   5 +
 drivers/gpu/drm/xe/xe_exec_queue.c           |  13 ++
 drivers/gpu/drm/xe/xe_exec_queue.h           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  13 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 125 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
 drivers/gpu/drm/xe/xe_guc_types.h            |   6 +
 11 files changed, 158 insertions(+), 13 deletions(-)

-- 
2.43.0
