Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF23CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271C112044;
	Thu, 28 Mar 2024 18:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buzqEe6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA2D112044
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650089; x=1743186089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lK8IjUMY4vP6HIblzAbHVo6daAG+qZNieGtrEw/Xx5o=;
 b=buzqEe6d7EzDc3mDOwb4ZRzxxoQ2dUliWwB5FTsSmsi08Ny1Qeh1t54P
 +spv+m1CiXlc9UkdVsS5Z915vTBC1G/mHT2Yik9akCIMpVRyJPKiCpnZL
 dHmLTQpAkFj4m+6O3pliMxNE6NGMUQlg+OgdQaTCK3TrsJ7xti9N7dTeY
 QDN3AgII0KE3TYN1fpBGJ52mcZqNf93sZwQkWpiFOqwONR1HAa/elCgq/
 KGpp6fKm3z31xmfLOvyrxohCAs8Fv8LFQM+qIBqzwICfoEO0RxztHmxRI
 xYO9/NM0MhfiicO5UJwXkr7jygVgjnRGj3yrbvV+vX//eD3ndjLi+BCKJ w==;
X-CSE-ConnectionGUID: gFSgfdbURpaU+iivisj5+Q==
X-CSE-MsgGUID: PkVRRNJxSImGQclo2Vcdpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29307490"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="29307490"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16784205"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/3] Rework work queue usage 
Date: Thu, 28 Mar 2024 11:21:44 -0700
Message-Id: <20240328182147.4169656-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Avoid sleeping or grabbing locks in work queues shared with the system.
Recent changes to work queues [1] have exposed deadlocks [2] in Xe.

I believe only patch #1 is required to unblock CI in 6.9rc1 [2] but
likely all patches should be included in stable kernels.

Matt

[1] https://lore.kernel.org/lkml/Ze7Jz9cQcUMtCqfk@slm.duckdns.org/
[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-984-093d82c02921344d8d400989af156aaf79b9d961/bat-adlp-7/igt_runner0.txt

Matthew Brost (3):
  drm/xe: Use ordered wq for preempt fence waiting
  drm/xe: Use device, gt ordered work queues for resource cleanup
  drm/xe: Use ordered WQ for TLB invalidation fences

 drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 8 +++++++-
 drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
 drivers/gpu/drm/xe/xe_gt_types.h      | 5 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
 drivers/gpu/drm/xe/xe_pt.c            | 2 +-
 drivers/gpu/drm/xe/xe_vm.c            | 4 ++--
 8 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.34.1

