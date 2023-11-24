Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2622C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3C910E802;
	Fri, 24 Nov 2023 15:34:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B110E28D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700840050; x=1732376050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wuZB7cik3kjKNH7J/W5jsG1tc/lbGlto7zPb12OtZ/E=;
 b=LziHB+SLjK57oBUsHSysP5qp+Gd4lOCAKApJC4CMY2OzjUaDTC1yZk8i
 +ARCFdzokJ9wCqKKNbiDfL3mWWFZ4Xh3JCI40NKkhNBQPbaKZF/+W8v65
 084NCkcK9Y4PBVobLygXbBrRvcZ7o+M4F7xh159fS2VkUEBsnL7c6/Zav
 tDS+qOY0L4Xh2RuAUHOvnjXQEaeZWUodApZXb2itl5kb9wl27KAs8Z/0B
 SSBk3UvzzfadBe6iqc6gmjqGUdxLOyBVxb4N1mKxTqPIDwPYqPM9AdOXC
 ZKF018E8bQU+jOvsm/QJmkW4aewOJy1A/UFjObxnra2S2Aw8D2Kaq1OR4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391315664"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391315664"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796615233"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796615233"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:07 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:33:41 +0100
Message-ID: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/4] drm/xe: Assorted memory-management fixes
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
v3:
- Stricter return value checking for xa_alloc_cyclic() in patch 4.
v4:
- Actually implement the change in v3 (Matthew Auld)

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

