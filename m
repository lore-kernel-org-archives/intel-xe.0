Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D16C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 06:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111210E2B5;
	Fri, 28 Feb 2025 06:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzmxYBOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2E110E2B5
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740725572; x=1772261572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TJp7UJqDOx8tMskbvzKAeQWigjJs4gyEx/p4xf4pbHE=;
 b=jzmxYBOyNyRbxGHNGY3aDAxr3BT5Rq08otPkmm3j7PcYP5D45W6vU1IK
 gkRg9tXrF2qQlB0CupRkQeYkz4tw7Q2oXLPQ9+VzB9DDDKADgYv/DCKrE
 HAzQSndWCjmZ5NUOcQsS5m2Taaip0SA/jMZmCBQCWHRPZnqVmOd+EV1YB
 xME9gTkRelIFyJ2QnAEK2Ep4ZBs1ur4P65riwzW5uPHhE53Ruf7HM6BAi
 nEYfS7lcDrFbmq57dwvsFMop6DQrbCiFSN4cIxldk4hh018xDZzqzYJib
 ES5U7IRWIbpFJFIKe+/zqlpdOHYW4QZd7J5SygSaVRlOcDQdeQRbA8DpF Q==;
X-CSE-ConnectionGUID: TbgaGwX7SIO3NHpFwnfrVw==
X-CSE-MsgGUID: 10eUAFh7Tai/EObPySik5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45562073"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45562073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:51 -0800
X-CSE-ConnectionGUID: YMYzyFI2RgiROgw1Qi1rJQ==
X-CSE-MsgGUID: wrNUHvvjTj6ZX88+8qOmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117442399"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:48 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix the hotunplug NULL ptr dereference
Date: Fri, 28 Feb 2025 06:52:22 +0000
Message-ID: <20250228065224.320811-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

Hi,

This patch series helps mitigate the kernel ptr dereference errors that has
been recently seen on a few platforms over the xe driver, when the core
hotunplug IGT tests are ran[0].

*Bried explanation of the error and its cause*

When attempting to close the drm file-descriptor (fd) after a hotunplug of
the xe gpu device, the kernel runs into a NULL pointer.

This happens when the close(fd) call puts back the final DRM reference. The
destroy migrate-subsystem action (xe_migrate_fini) is called upon, which
tries to put the page-table tree (pt) BO back.
However, the underlying struct device has already been removed during the
hotunplug, and so the iommu group for that pt BO is destroyed and hence,
unavailable.
When the xe_migrate_fini() tries to put back the pt-BO, the iommu group is
unavailable, causing a NULL ptr dereference.


*Brief description of the fix*

The xe migrate subsystem has been changed from being drm managed to being
dev managed. This way, the migrate subsystem destroy action will be called
sooner (during the unplug process) - allowing the pt-BO to be put back
sooner, i.e. at a point when the iommu group is not yet destroyed.

Since we are changing the migrate subsystem to be dev managed, this
subsystem is long gone by the time the TTM and VRAM resource managers do
get destroyed. (The TTM and VRAM resource manager destruction is drm
managed). So, when these resource managers attempt to evict all the BOs
before their destruction, that's not going to be possible any more, as
the BOs were already destroyed during the unplug process. Hence, we
extend the fix by making all the VRAM evictions during the xe device
remove.

Regards,
Aradhya

[0]: Link to the gitlab issue
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3914

Aradhya Bhatia (2):
  drm/xe_migrate: Switch from drm to dev managed actions
  drm/xe_device: Evict all the VRAM objects during device remove

 drivers/gpu/drm/xe/xe_device.c  | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)


base-commit: 873b1a50bb4394e95332cfa611aa6463de6b7cb0
-- 
2.45.2

