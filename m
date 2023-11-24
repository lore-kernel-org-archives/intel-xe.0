Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19A6C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6710E7BA;
	Fri, 24 Nov 2023 09:11:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F210E7BA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700817093; x=1732353093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2JPQAg4ETkOwmHUxL/QnlX7h7/iw/GtWUXVXnJFSJsQ=;
 b=hVyXwiJpl7xB4B9RRmZ033SnbajGsfwufHAOk6Io3ovagmf+3VXuPWyy
 9bLWsdpSmy2EFbGkCjdw3KEzdd5jixFfdor8uqGuhS6/mxh1Afpa/7TNO
 S7i+//efqOjr6wbNHQMvye/m6CwWyKqKDcsYOPfYsZYNwJpSWc6Ec3Xlm
 4Mx1bsReitSBhg6FufLNTyMJSXiQM+woKlkUTAlumPo7eD1CxNgCPDc8R
 montXrTviiS2JUxTl2bqUDs/rcyisekZdzgmwkCmjGpr9OOeFV5fAaMKA
 SYeMZWWFXSPBoxwsf70I+sx15v3AMfmE33ZgpgTadfr6R7pYzAZsDn0be Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377423909"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="377423909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771208054"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="771208054"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:31 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 10:11:07 +0100
Message-ID: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/4] drm/xe: Assorted memory-management fixes
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

