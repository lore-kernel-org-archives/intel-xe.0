Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1D5CC6B2F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 05:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA18110E9D0;
	Thu, 15 Oct 2026 05:05:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D246E10E9D0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 05:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792040752; x=1823576752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B6R6gFd+JgbFmQOuRVugtjYm9ptTmxhYvIQ0nKMCEkQ=;
 b=NntVJJFZbv1aHxIZjiJ5DSwnew+uaM3N4aSQ157J3+gg20fqP+KgEABN
 9PDnEaplaGnSN7BLGyFYnQY5sC35Yh6BvdaAzcrGfR4S0KvZ5uQWcIgvE
 2NNHbe/J3b59laQjKyuo3JzDx7J3KA8tmgRdEVJwRI+FrTepqfMyx3j6c
 //U5izz9AxWtecsK+XmZzGbHWTLucwP+8uy8bPwSHdwkhqDkPehN+ElhO
 tDWSL4bXGrHsh+f+I7vOUNNT340o2AhSCeUMYBtHq6337odScCZVtp+PW
 QVRLAlEyuiSyevASwW2EOZ9nU4SslcozhVn2V0PQJD1FWenZMrV4poXCp w==;
X-CSE-ConnectionGUID: 8WLDgkDySsqYcu++8emAzw==
X-CSE-MsgGUID: MIc1aSGWQC204tOTejo2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="687116"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="687116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 22:05:51 -0700
X-CSE-ConnectionGUID: vjDBH5VUS5eKkcPUnxPkZA==
X-CSE-MsgGUID: oTLUuP8BTNSf3+8aZFViTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1525107"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa009.jf.intel.com with ESMTP; 14 Oct 2026 22:05:51 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v3 0/3] FD close cleanup for XE
Date: Wed, 14 Oct 2026 22:01:33 -0700
Message-ID: <20261015050136.1069815-1-daniel.charles@intel.com>
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

This series adds the suggested logic to synchronously wait for the queue
kill to complete on FD close. This is needed to avoid a race condition
where the scheduler may still be processing messages for a queue that
has been closed, which can lead to errors.

v3:
    - Patch 3 only, fix GT reset seen in CI (xe_create@create-contexts).
      See the patch 3 changelog for details.

v2:
    - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
    - Drop the flush_work() loop (Matt B)
    - Use xe_assert() for the killed-queue check (Matt B)
    - Merge the put loop into the kill_sync loop (Matt B)

Daniel Charles (1):
  drm/xe: Synchronously wait for queue kill on FD close

Matthew Brost (2):
  drm/xe: Read scheduler message opcode under lock
  drm/xe: Disable scheduling early on FD close to avoid CAT error
    cascade

 drivers/gpu/drm/xe/xe_device.c               |   5 +
 drivers/gpu/drm/xe/xe_exec_queue.c           |  13 +++
 drivers/gpu/drm/xe/xe_exec_queue.h           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  13 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 101 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
 drivers/gpu/drm/xe/xe_guc_types.h            |   6 ++
 11 files changed, 134 insertions(+), 13 deletions(-)

-- 
2.43.0

