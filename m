Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70780CE7B1C
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5410E605;
	Thu, 28 Sep 2023 10:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E72210E604
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898737; x=1727434737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S+5NKSUlozMZxDKugSukOHXOpz8XLVQV3wF3X607PF0=;
 b=FLpT+V9/stNYSN4MK912ti/Rpl7ds0QmGIIqAdLDTJNRjvE8IoOhwQmL
 XmFtBcjLCRdSxsWCOVy3HUNv/RFZl1QsmU8kJmzRinEvpRUkZNkKjbol0
 zbdskZUFJw7nFoMZhs79kL/cQaXBl6g2Dv3Lwww2Z+KrN8DaDuoSYwnfY
 ufjDo3dTlHOpg/7XDtyVvqsBtdRFbVuuiUCBZTn4bNQP0qZJhs2cZb9tN
 nWSsJhil5J2LMDDMHsdlm2QthCNhaaMJ6FHZ2d1FvxWdd6cw6zHS5CcRp
 p7XTZVKi6AOmgK3ajGBnty2w+yG5DsfJOQNTLGOX30TZOQcSCPw7GAHDh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640114"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640114"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174400"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174400"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:52 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:23 +0000
Message-Id: <20230928105843.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 00/20] uAPI Alignment - take 1 v4
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v4:
Rebase and remove patches which have not been reviewed yet, so that we
can go ahead with integrating this first take of uAPI changes.

v3:
Rebase and add more fixes to uAPI as well as drm_xe_vm_bind_op extension,
query for microcontroller version and documentation.

This is still not the final version as we are missing at least:
- a fix for GEM create flags [1]
- a uAPI update to go per tile rather than per GT [3]
- PAT and cache coherency support [4]

v2:
This v2 has 3 extra patches that was missing on yesterday's submission.
But that aligns with the IGT series sent yesterday.

Also I'm glad that Mesa reacted super fast and we already have the MR
ready that aligns with v1 sent yesterday:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300

Thank you Jose!

v1:
As a result of the uAPI review efforts started by Thomas[1],
we have identified many updates on our uAPI that would lead to
breakage in the compatibility. What it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

Most of this work on putting these patches together for a single
shot was led by Francois.

The IGT counter part of this series is available as well[2].

[1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
inux.intel.com/
[2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
[3] - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/633
[4] - https://patchwork.freedesktop.org/series/123027/

Ashutosh Dixit (1):
  drm/xe/uapi: Use common drm_xe_ext_set_property extension

Francois Dugast (4):
  drm/xe/uapi: Separate VM_BIND's operation and flag
  drm/xe/vm: Remove VM_BIND_OP macro
  drm/xe/uapi: Remove MMIO ioctl
  drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY

Matthew Brost (7):
  drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
  drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
    implementation
  drm/xe: Rename exec_queue_kill_compute to
    xe_vm_remove_compute_exec_queue
  drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
  drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
  drm/xe: Remove async worker and rework sync binds
  drm/xe: Fix VM bind out-sync signaling ordering

Rodrigo Vivi (5):
  drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm/xe/uapi: Document drm_xe_query_gt
  drm/xe/uapi: Replace useless 'instance' per unique gt_id
  drm/xe/uapi: Remove unused field of drm_xe_query_gt
  drm/xe/uapi: Rename gts to gt_list

Umesh Nerlige Ramappa (3):
  drm/xe: Fix array bounds check for queries
  drm/xe: Set the correct type for xe_to_user_engine_class
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_device.c           |   1 -
 drivers/gpu/drm/xe/xe_exec.c             |  43 --
 drivers/gpu/drm/xe/xe_exec_queue.c       | 181 +++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  14 +-
 drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c             | 102 ---
 drivers/gpu/drm/xe/xe_pci.c              |   4 -
 drivers/gpu/drm/xe/xe_query.c            | 184 +++++-
 drivers/gpu/drm/xe/xe_sync.c             |  14 +-
 drivers/gpu/drm/xe/xe_sync.h             |   2 +-
 drivers/gpu/drm/xe/xe_vm.c               | 783 ++++++-----------------
 drivers/gpu/drm/xe/xe_vm.h               |   3 +-
 drivers/gpu/drm/xe/xe_vm_types.h         |  42 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  |  43 +-
 include/uapi/drm/xe_drm.h                | 331 +++++-----
 16 files changed, 648 insertions(+), 1108 deletions(-)

-- 
2.34.1

