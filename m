Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D7C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5930410E19B;
	Thu, 31 Aug 2023 08:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7CD10E19B
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472290; x=1725008290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3o9Og3QUZlmKvpn8J7Xm57f0nrXKruWAqfw8RDChkE=;
 b=budqecTo/p0zL0q9vS2xSt6fxE+eABv7TJg1N2GhyS28tE6HSXlWEIIR
 hGKbdnU78Aem8a/K6nBjAvmMgDqRDqmN7qAswZeVTwV2IDLbu9KlugmKq
 Ha2UVmxtNI3Zcg9ig8ixmvUGEGuY4hRAwygfb1DQMRqQDqxpQHMpvrD1b
 CrX0s3qf9BHnNa86HJcav6H6jDNFFXDVA6QdbyPuUVSatzifmosOodIVS
 vxCoCI+AXYLMqVUufmBEFAEh27gWfnjbFL1ANtkugpFMxhL9MIueM36KF
 5CvL1biaEZTU2akl4xZB4feZnJpdm9wihsaq7/6ZAVZQB0MGQzLFwOmqI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814151"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257337"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257337"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:29 +0530
Message-Id: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] drm/xe: fdinfo memory stats
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

This series enables enables fdinfo memory stats for xe.

I added tracking of most classes of bo (user bo, page tables, ring, lrc) 
which contribute to client's memory usage. This follows similar lines to
what Rob's msm code and tvrtko's i915 code is doing with some xe way
of showing and tracking/fecthing objects which adds to client memory
stats.

Example fdinfo format:

#cat /proc/4620/fdinfo/3
pos:    0
flags:  0100002
mnt_id: 23
ino:    1116
drm-driver:     xe
drm-client-id:  13
drm-pdev:       0000:4d:00.0
drm-total-system:       0
drm-shared-system:      0
drm-active-system:      0
drm-resident-system:    0
drm-purgeable-system:   0
drm-total-gtt:  4 KiB
drm-shared-gtt: 0
drm-active-gtt: 0
drm-resident-gtt:       4 KiB
drm-purgeable-gtt:      0
drm-total-vram0:        20 KiB
drm-shared-vram0:       0
drm-active-vram0:       0
drm-resident-vram0:     20 KiB
drm-purgeable-vram0:    0
drm-total-vram1:        20 KiB
drm-shared-vram1:       0
drm-active-vram1:       0
drm-resident-vram1:     20 KiB
drm-purgeable-vram1:    0

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (7):
  drm/xe: Add drm-client infrastructure
  drm/xe: Interface xe drm client with fdinfo interface
  drm/xe: Add tracking support for bos per client
  drm/xe: Record each drm client with its VM
  drm/xe: Track page table memory usage for client
  drm/xe: Account ring buffer and context state storage
  drm/xe: Implement fdinfo memory stats printing

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |   7 +
 drivers/gpu/drm/xe/xe_bo.h           |  11 ++
 drivers/gpu/drm/xe/xe_bo_types.h     |  10 ++
 drivers/gpu/drm/xe/xe_device.c       |  19 ++-
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_drm_client.c   | 228 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   |  71 +++++++++
 drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
 drivers/gpu/drm/xe/xe_pt.c           |   4 +-
 drivers/gpu/drm/xe/xe_vm.c           |  10 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 12 files changed, 372 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

-- 
2.25.1

