Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBAC54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 05:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8BA112327;
	Thu, 28 Mar 2024 05:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Szmrjq6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71DD112326
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 05:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711605135; x=1743141135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dMb6XRp8PZSPU4vYoKYzrMy/7VUJf0MZAD6xs8RWhW0=;
 b=Szmrjq6U72iou7wsnuJ9DYgYGhx9JjQM/CEmm9wEb4ZI7vud0Y6uvpON
 /li85fmiN7BZHbpnfGrY1RNXcT9jwI+mOalAzfJhx0fX0LOnPshgo+QGI
 IPkHY0ZoQ2PFS6/5z949aHgwGiaJkU0zu+hlcPGDGBtAuOfnigL3aByCo
 R3Ybqhy6gPfL768Jkt0/wGvLa6tMpKgz7yArjhTTvTbLN8Uafv/m4apI4
 DdmDZd/oxclY3yXoauNgq9CjUL5aWIJ4W3Vrl1HljzsbUbtY3Lw76vk2I
 doJsXYtHC6HcPjSyl9dCMKy2mMDAVUT4yQp/adXbcywaWNwkqRrv7/Io8 g==;
X-CSE-ConnectionGUID: i+qRvAoWTZ6qitu0AVzM+g==
X-CSE-MsgGUID: 8ELdciG9TF2Ur+8E3IRTYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18123956"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18123956"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 22:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="47735575"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 22:52:13 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [CI 0/2] Pcode init status and lmem check
Date: Thu, 28 Mar 2024 11:32:55 +0530
Message-Id: <20240328060257.3690986-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Check pcode init status on root gt of root tile and
reorder lmem init to be after pcode init check.

Rev2: change function names for pcode init check
      fix review comments
      add fault injection for LMEM check

Rev3: drop the fault injection patch. This will
      be added in a different series with a different
      approach.
      No functional changes to the first two patches.

Riana Tauro (2):
  drm/xe: check pcode init status only on root gt of root tile
  drm/xe: re-order lmem init check and wait for initialization to
    complete

 drivers/gpu/drm/xe/xe_device.c |  81 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mmio.c   |  29 ---------
 drivers/gpu/drm/xe/xe_pcode.c  | 115 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode.h  |   6 +-
 drivers/gpu/drm/xe/xe_pm.c     |  16 ++---
 5 files changed, 154 insertions(+), 93 deletions(-)

-- 
2.40.0

