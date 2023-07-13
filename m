Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE51C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED4B10E6CE;
	Thu, 13 Jul 2023 13:17:25 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7823210E6CC
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254244; x=1720790244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=71nilmE8LolCXyeWu5A6lUvfBajGxJGF0Pp6Pv2UZ90=;
 b=RMbnDmXOltZFHqJhETPSJ/m55WVXQWW2rJODKrJxq9tG2UtlopkITEUF
 S+p3MDF9ISXCmtqPBoyI7a+OtjqxB0lS08DqlzmcOk0/VcMEiroCA0NjK
 89bcSarrrU50XjN8BYXNLlvf7a+P7ja/8zCSyGcpSzSRgbPf8yClKyfIC
 uamSK13/n9Trjp2lasho0Y4bQyyu0EH3rL/LGo75l9+VoL9fibPk/Xmq/
 UCm9Gmdki6llwydrHtIyvPykuG6jUloDj66lsvHrJE7IHHAFMudEZZNRv
 15rQ2C8NWD2MYumzCHJpxDyuhN7e5cP2Ma68P0Zn4I8/eAlccLNk8SFld A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344776723"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="344776723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751629318"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="751629318"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 9e807311ecad.intel.com)
 ([10.251.221.219])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:17:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 13:17:09 +0000
Message-Id: <20230713131711.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: switch to using drm_exec
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
Cc: Francois Dugast <francois.dugast@intel.com>, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make Xe use drm_exec (execution context for GEM buffers v7) which was just merged to drm-misc-next.

Christian König (1):
  drm: execution context for GEM buffers v7

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 Documentation/gpu/drm-mm.rst         |  12 +
 drivers/gpu/drm/Kconfig              |   6 +
 drivers/gpu/drm/Makefile             |   2 +
 drivers/gpu/drm/drm_exec.c           | 333 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  29 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  30 +--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +----
 drivers/gpu/drm/xe/xe_vm.c           | 246 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h           |  32 +--
 include/drm/drm_exec.h               | 123 ++++++++++
 12 files changed, 644 insertions(+), 226 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

-- 
2.34.1

