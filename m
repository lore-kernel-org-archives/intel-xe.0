Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A4CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32A310E401;
	Tue, 12 Sep 2023 11:44:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B492A10E401
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519096; x=1726055096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yn3B6EBjGB+BerSu/jqP8cW3YsxsA1xO8qCAc14i3SU=;
 b=aT0eGzuhHlvq3V5MUaPJGvlsc1dvqMnKxj/G4U6gm9mXrFCwS5eTdLAg
 INMFY8qT6a6Rbw65JRzNoiGuE6mvk2kh6no2FvKrxt57Z62Cn9Y52B78h
 571/ITUWYA120qhJ6fQuttXwbnxjdpJ1b2Z9GqC9j1Es7VXk+7krPiqtq
 MHZnNGj7+/6XF8pIl9ofMHUJq9Z8bbQ2SsKAB623DkD2G0QjoDbgCBqUl
 yhSDqs2M9s4P2jbzlxIakyg+wHWSuRg1+NvvHoxzf4cJZGhBjNkwDMhI6
 3IKN9knTQBS3kPzMw3AmkALuGLC0KEWxsf79NX2OwX3qY4qwuDbCIPc02 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050169"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050169"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700024"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700024"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:44:54 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:32 +0530
Message-Id: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 0/7] drm/xe: fdinfo memory stats
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
ino:    1140
drm-driver:     xe
drm-client-id:  19
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
drm-total-vram0:        20 KiB
drm-shared-vram0:       0
drm-active-vram0:       0
drm-resident-vram0:     20 KiB
drm-total-vram1:        20 KiB
drm-shared-vram1:       0
drm-active-vram1:       0
drm-resident-vram1:     20 KiB

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
 drivers/gpu/drm/xe/xe_drm_client.c   | 210 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   |  71 +++++++++
 drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
 drivers/gpu/drm/xe/xe_pt.c           |   4 +-
 drivers/gpu/drm/xe/xe_vm.c           |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 12 files changed, 352 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

-- 
2.25.1

