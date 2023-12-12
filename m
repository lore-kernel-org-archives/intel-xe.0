Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8ECC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 01:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EEC10E539;
	Tue, 12 Dec 2023 01:05:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9D10E539
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 01:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702343155; x=1733879155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x8xCj9zfDqtags6MhXMyzUaQwz2CCCuWTrSeAAb7r8E=;
 b=DQo2QxasJkDscpcP9sPCh0jkPPi3FTlwl0w+bMwSeLR8SY7hUd9zJgc9
 JhkYUL2iHapW/E8W410EqBoD5VFvU9BcpaVgkP97YtlrpwzkJNwG5+646
 h5NlGa1FKRJ/E/D/L7peFXEmugsjYWVmBsSKZyos6KgY74ipq1TaBUiAC
 rQsBYzuRYe3peRIsSQYsuSa1qfAOw4lkHYwd8s2t2KmsLXRatNa4qSseo
 ktQUFxGESTycxiOOqyppJ/wodmKjf/WIUB74NMTZFvCxANJeLS7u/SJRQ
 6j97visRKdkbe1FuOe/JrKH85mAb4XbrzxN6GpZbnVjgUpXUraj2S+q8v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459047671"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="459047671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 17:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917078931"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="917078931"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 17:05:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: GSC proxy support
Date: Mon, 11 Dec 2023 17:05:57 -0800
Message-ID: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
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

The GSC uC needs to communicate with the CSME to perform certain
operations. Since the GSC can't perform this communication directly on
platforms where it is integrated in GT, the graphics driver needs to
transfer the messages from GSC to CSME and back.
Since the CSME is controlled by the mei driver, we need to use a mei
component to communicate with it.

Daniele Ceraolo Spurio (2):
  drm/xe/gsc: Initialize GSC proxy
  drm/xe/gsc: add support for GSC proxy interrupt

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/gsc_proxy_commands_abi.h   |  44 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  22 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  63 ++-
 drivers/gpu/drm/xe/xe_gsc.h                   |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c             | 517 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h             |  20 +
 drivers/gpu/drm/xe/xe_gsc_types.h             |  32 ++
 drivers/gpu/drm/xe/xe_gt.c                    |   5 +
 drivers/gpu/drm/xe/xe_gt.h                    |   1 +
 drivers/gpu/drm/xe/xe_irq.c                   |  44 +-
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 drivers/gpu/drm/xe/xe_uc.h                    |   1 +
 14 files changed, 735 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.h

-- 
2.43.0

