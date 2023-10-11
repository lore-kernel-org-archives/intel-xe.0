Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B9CD6E71
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBC510E4FB;
	Wed, 11 Oct 2023 13:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FED710E4FB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032776; x=1728568776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JZzxM+6zA2ujA0negwJ//AsXWIGxfQhUVxbLEMrd3Hc=;
 b=P43hWzVkzalOteexSdLP6xcYUFl5+7JKUhdprFoI8XFKqtjsZICmpxe5
 mZe9TAECm0F7GCaxgPtqNSJHxU2vaHAOsyB2kChjv+U7kk03UocABG0Yl
 Zj367KIDbi0iBViRZYncgSeQAfr38LaFOm+sNGU5Iwm6hYAuXAq7RFX09
 fudoTNTqpt4myXxbr8wUh8a971sCXf1/hCofItTXpOk/XlWvCchOWUlds
 KERwI1qhUhG3bwBYa+edvYI/Cx4XWmFDeawJMyV0hWvwJIfp2WxW1lWFO
 8i7BclukEFrw0V3eg7CTG/7oQhFqs5Lb6GpyuvDbYixgd449KlITVeVTq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156177"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753828991"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753828991"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:09 +0000
Message-Id: <20231011135926.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 00/17] uAPI Alignment - take 2
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

This is the second take of uAPI updates that would lead to
breakage in the compatibility, which it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

This series is not complete yet but it is sent for early review
as some patches are already a few weeks old.

It series is intended to be applied after take 1 [1] which is not
merged yet, so it will break CI.

[1] https://patchwork.freedesktop.org/series/124710/

Francois Dugast (10):
  fixup! drm/xe: Correlate engine and cpu timestamps with better
    accuracy
  drm/xe/uapi: Add documentation for query
  drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
  drm/xe: Extend uAPI to query HuC micro-controler firmware version
  drm/xe: Remove useless query config num_params
  drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
  drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
  fixup! drm/xe: Add uAPI to query micro-controler firmware version
  drm/xe/uapi: Make constant comments visible in kernel doc
  drm/xe/uapi: Remove unused inaccessible memory region

José Roberto de Souza (1):
  drm/xe: Add uAPI to query micro-controler firmware version

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (4):
  drm/xe/uapi: Remove GT_TYPE_REMOTE
  drm/xe/uapi: Kill VM_MADVISE IOCTL
  drm/xe/uapi: Separate bo_create placement from flags
  drm/xe/uapi: Be more specific around GuC Version Type

Umesh Nerlige Ramappa (1):
  fixup! drm/xe: Correlate engine and cpu timestamps with better
    accuracy

 drivers/gpu/drm/xe/Makefile             |   1 -
 drivers/gpu/drm/xe/xe_bo.c              |  27 +-
 drivers/gpu/drm/xe/xe_bo_types.h        |   3 +
 drivers/gpu/drm/xe/xe_device.c          |   8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c      |  20 +-
 drivers/gpu/drm/xe/xe_gt.c              |   2 +-
 drivers/gpu/drm/xe/xe_pmu.c             |  20 +-
 drivers/gpu/drm/xe/xe_query.c           |  95 +++--
 drivers/gpu/drm/xe/xe_sync.c            |  16 +-
 drivers/gpu/drm/xe/xe_vm.c              |  86 ++---
 drivers/gpu/drm/xe/xe_vm_doc.h          |  14 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c      | 299 ---------------
 drivers/gpu/drm/xe/xe_vm_madvise.h      |  15 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  10 +-
 include/uapi/drm/xe_drm.h               | 478 +++++++++++++-----------
 15 files changed, 435 insertions(+), 659 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

