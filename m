Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D7FC5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 15:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123710E095;
	Thu, 23 Nov 2023 15:32:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDF310E095
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700753551; x=1732289551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zvBvJQnJ8OVZsqRJA5U5IWBePX24Ljno8s3TeBl2emI=;
 b=E9l9JI6PPxwSBpxLpU38XfVygvqAXKrDeYmMe5HB89XcIUAwkFeKQRjo
 MvI1mhQeWyEpS4mOTKshuTjHFUfw7LCNmg7oYvxhFTNUMCqZQykuigtZr
 fcD+1DF5LKz/6GwN1J6CdukZvQfN2C+icAFyR7O7O1RJV6u4e1exy8RYM
 d101cfhVSP0MoGlGQmkdeRJwoSuRkC9kaOq+AVPXR34GaV+TT0WUBkRXH
 2JMlc4GB0lcOBUfCemcp7uyHZQwYWENp7/xGUcENUKpUEixIpOOfkqYJy
 cEz55KomqvZJ8WHVDdm3X0KWsDWCO0DATZcp0LCSakEyhUNafcysgPvCX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377314340"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="377314340"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="8697359"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:18 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Nov 2023 16:31:54 +0100
Message-ID: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] drm/xe: Assorted memory-management fixes
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The patch series addresses items 1, 2, 3, 6 and 7, in the from

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946

v2:
- Address a review comment in patch 1 (Matthew Auld)
- Add extra asid allocation debugging on CONFIG_DRM_XE_DEBUG

Cc: Ohad Sharabi <osharabi@habana.ai>

Thomas Hellström (4):
  drm/xe: Ensure that we don't access the placements array out-of-bounds
  drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
  drm/xe/bo: Remove leftover trace_printk()
  drm/xe/vm: Fix ASID XA usage

 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device.c        |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_pt.c            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  5 +++--
 7 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.41.0



Thomas Hellström (4):
  drm/xe: Ensure that we don't access the placements array out-of-bounds
  drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
  drm/xe/bo: Remove leftover trace_printk()
  drm/xe/vm: Fix ASID XA usage

 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 44 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device.c        | 15 ++++++++-
 drivers/gpu/drm/xe/xe_migrate.c       |  8 ++---
 drivers/gpu/drm/xe/xe_pt.c            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  5 +--
 7 files changed, 48 insertions(+), 30 deletions(-)

-- 
2.41.0

