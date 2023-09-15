Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CEACD37B0
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 23:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D8810E6B3;
	Fri, 15 Sep 2023 23:34:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35010E09C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 23:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694820874; x=1726356874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bmkX6WkjyrUhTXieBzGJF1BKBk7G2p4bAthN5VtPpM=;
 b=lb434UyM6ajFHjYzgDpL4pXgIaRPsVB3IIIWx3x3Se7PA/k4l6d22L9r
 sir1VrFCtYV1aiTU13vkpK4SE980iIjw6tOzM6BuQyBMn9fHmjgz7vxLk
 OWF48FRx7ao2wH11JaetgRDuhY8exZXVJbLQlxr84hp8Bikun38RimVgn
 7r/SRPFuxywWZu7MqoKAFq+i+TorggTeZNxKMAUEgvGj6ICuVVn7CNgYe
 fWYyQMaq0SsIS75Q6DaXeqOmD+AzLwzFgo0dU3sK6YTPK28pfmLLG3Rwq
 Blw0l478hkXOs+W6uscSp5yOQY/KAqU/DnOkKVkx2Vp7RGj06b6CXVojN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376694107"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="376694107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="992036133"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="992036133"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 16:34:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 16:34:41 -0700
Message-Id: <20230915233445.2241554-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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

Backwards backing uAPI changes, getting on the list.

First 3 patches already on the list [1] and free to merge as soon as it
gets an RB.

The required IGT changes are also on the list [2].

Matt

[1] https://patchwork.freedesktop.org/series/123820/
[2] https://patchwork.freedesktop.org/series/123821/

Matthew Brost (4):
  drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
  drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
    implementation
  drm/xe: Rename exec_queue_kill_compute to
    xe_vm_remove_compute_exec_queue
  drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI

 drivers/gpu/drm/xe/xe_exec_queue.c       | 97 +++++++-----------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +-
 drivers/gpu/drm/xe/xe_vm.c               | 21 +++++
 drivers/gpu/drm/xe/xe_vm.h               |  1 +
 include/uapi/drm/xe_drm.h                | 19 ++---
 5 files changed, 57 insertions(+), 87 deletions(-)

-- 
2.34.1

