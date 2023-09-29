Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B8E743EF
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C220B10E6C2;
	Fri, 29 Sep 2023 05:04:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0A10E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963868; x=1727499868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=brcwtJKnIyTN+HuBezGK2wnL3Oqud5pqQoMsx4v4YWE=;
 b=O3bKc1k/4+2XFUGNvQGzB7WxFIGmLZSK95IV0w7IOLy2OduszutUYVWE
 ItRLIsS5XGn46zAjuczMjU7W/QOzbwcQQmlh4yMalY0VfmjDvje2VgQhZ
 fwHlHM2nias+C/9Hb44C40qWTtR8VlI87uoeLg1BH3+mhVDYwXuqPOYgq
 EySDoZ/jyFyr6aZWrhA3AcpsPtj3Lr6ZNq2uMjdq1mWPleBNkyM/CN6Qg
 i+BuiAGcMfnl8qwA+qHgy1rAyGFMkBK8rCR8wp3XA7kcsbcZs9D5+mftG
 FYwuiJPejiaNOfaaq+Vw+z7HR0ndk/AKnkkhotHdQ9N5iY0CZmplBq+D2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142023"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142023"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570951"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570951"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:46 -0700
Message-Id: <20230929050253.3153804-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] xe2: Add PAT programming
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the PAT table and allow PTEs to be encoded with the additional bit.

This also adds a new debug capability: allow to dump the PAT table via
debugfs and to dump it automatically when the driver fails to bind to
the device. A wrong PAT table may be related with GuC failing to
initialize or other failures that go away with additional debug
messages. At least dumping the table allows one to quickly check if the
values programmed are the expected ones.

Lucas De Marchi (6):
  drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
  drm/xe/xe2: Follow XeHPC for TLB invalidation
  drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
  fixup! drm/xe/pat: Prefer the arch/IP names
  drm/xe/pat: Add debugfs node to dump PAT
  drm/xe/gt: Dump PAT table when failing to initialize

Matt Roper (1):
  drm/xe/xe2: Program PAT tables

 drivers/gpu/drm/xe/xe_bo.h         |   1 +
 drivers/gpu/drm/xe/xe_ggtt.c       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  12 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
 drivers/gpu/drm/xe/xe_pat.c        | 190 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pat.h        |   8 ++
 drivers/gpu/drm/xe/xe_vm.c         |   6 +-
 7 files changed, 227 insertions(+), 4 deletions(-)

-- 
2.40.1

