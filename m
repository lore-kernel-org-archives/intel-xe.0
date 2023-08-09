Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877AAC0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 14:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B3F89D8E;
	Wed,  9 Aug 2023 14:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6448C89D8E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589646; x=1723125646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5XZ/2QBYNVaVdeCv6A2hWA7hMEspsb9JIeUiKz5PdC8=;
 b=XextyRUPPNa3KFxEK+a4rerOu5OZiwTBkvkXQFdyUUxbg3QTAMVhRMc8
 RDd204BkigjzjAc/irJ4ul4k/0l6WRihXceZkQggyNE9mw1d7zjFuLavr
 I1OcvQEW60R0hA/Bxfc4KPXMfpq8rdiFf7Ys6zZPV6ONfb3sUU2YUGIoQ
 9QXCgRJe+X6MDhUftHcdt9sJDWthPo78fk+n0AlLlrHokwPcYe2dQwwwj
 lCkdJD+vyO3l9j6NOnGGKb4uc6BU/TbgDooq+ogCAbJ5RbHAfqLr9V2BX
 rZ9ocnq+JVWfAkvdq7cF0RWN1K3iBHa7+Q6vKXqlWJGo7rEfzASxhLiCk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361256999"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361256999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062479902"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062479902"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 07:00:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 19:37:43 +0530
Message-Id: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/3] drm/xe: Add drm client infra to track client
 stats
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

This series adds below in corrosponding patch no.:
1. drm-client infrastructure to identify each client and its related stats
2. Interface drm core fdinfo API to drm client infra
3. Adds API for tracking per client buffer offects

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (3):
  drm/xe: Add drm-client infrastructure
  drm/xe: Interface xe drm client with fdinfo interface
  drm/xe: Add tracking support for bos per client

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_bo.c           |  5 ++
 drivers/gpu/drm/xe/xe_bo_types.h     | 10 ++++
 drivers/gpu/drm/xe/xe_device.c       | 14 +++++-
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c   | 71 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   | 71 ++++++++++++++++++++++++++++
 7 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

-- 
2.25.1

