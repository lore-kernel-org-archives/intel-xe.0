Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A103C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 00:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4E710E540;
	Wed, 10 Jan 2024 00:43:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A9110E540
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 00:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704847429; x=1736383429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6fcSr5RZa5VDIU83fsr2CJ172nNPj8kaVvcrOzMPlfc=;
 b=kQpmz3zQO84ywbwAnr0dorK1m/Mx2ZVQUp69mLig2gbR61R/AOgF1HbK
 xm7iH1o5fkeo4qixN0Bsdbpcx9A7XQPHSX5tfMoI8qaZCwFxtidb4PeG9
 rM0Xk0izfpqMmeLfDLH1L1UVBSaqeeSUQB6BVGI2ztwJC4yuFwqMSYLPS
 kWi6Xi9wsEsLSAiHLoXRxrv/R+BLvJxe8wrJFUELSjXjH7g2RmL3GEZZu
 TRCOOPrUV9lpMxIAoKtFv928yw8sM6vZbsOOvwy++hYGitzdCL/Hboe5r
 Gc+71UIyXmwU3nru9H5jdf3swk/fFs1fsUig8nowbVZWaHXXKNDzMZQEf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464767455"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="464767455"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775041863"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775041863"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:43:48 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/xe: GSC proxy support
Date: Tue,  9 Jan 2024 16:44:13 -0800
Message-ID: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
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

v2: better doc, comments, naming. Minor cleanups/fixes (Alan)

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>

Daniele Ceraolo Spurio (2):
  drm/xe/gsc: Initialize GSC proxy
  drm/xe/gsc: add support for GSC proxy interrupt

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/gsc_proxy_commands_abi.h   |  44 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  22 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  66 ++-
 drivers/gpu/drm/xe/xe_gsc.h                   |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c             | 537 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h             |  20 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            |  13 +
 drivers/gpu/drm/xe/xe_gsc_submit.h            |   1 +
 drivers/gpu/drm/xe/xe_gsc_types.h             |  32 ++
 drivers/gpu/drm/xe/xe_gt.c                    |  13 +
 drivers/gpu/drm/xe/xe_gt.h                    |   1 +
 drivers/gpu/drm/xe/xe_irq.c                   |  44 +-
 drivers/gpu/drm/xe/xe_uc.c                    |  14 +
 drivers/gpu/drm/xe/xe_uc.h                    |   1 +
 16 files changed, 789 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.h

-- 
2.43.0

