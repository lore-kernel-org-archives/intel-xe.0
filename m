Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1F6C7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5225410E5F9;
	Wed, 28 Aug 2024 21:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDgLWrZq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136A10E5F9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724881927; x=1756417927;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=78/FxS4HkSKOkC7hLIz9e/NOZO6QDUj88fIcImXCwGU=;
 b=DDgLWrZqZRuDDCWeOHqVuKtxqkV9rWM1iFBlC5NijUtJ34ZifERUSv1a
 BAjQ8kEKSPg2SPKdprRgXu+N+08vZ66yoWl03eAmus7mGnteEwoa0NOMM
 ixxBFvkTyppjREBnSIyJBR649pWodG9QGcDcUBKfN9aYXOVikniaBsJ2x
 ikjph0pHsHDrC/z8eHkQzIj+6ZTk0+TyaA45lKwHGqT+8idH5Bb85L/IL
 HOPSmxrAh4ddiFBZVt3ohVG3LnBR+zYYvu6ySFY9X/z580NNbw9GSkjvT
 kDI8urhWJA/3y8x+GG/nUfQc7ha+QMkCil3dlj5zWHMCM6IEFSZghm7TY w==;
X-CSE-ConnectionGUID: 4MxaWZDdQBGXNLsu3d5V3g==
X-CSE-MsgGUID: XE40voHeSlSiMJc0vtIQPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23330685"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23330685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:06 -0700
X-CSE-ConnectionGUID: 1N68FEgRR0SWcD5d9VrmKA==
X-CSE-MsgGUID: xIFLWoybR7St2KYRIYaPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63356526"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/4] drm/xe: fixes and debug improvements for GSC load
Date: Wed, 28 Aug 2024 14:51:53 -0700
Message-ID: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

A collection of fixes and minor improvements to the GSC loading code.

Daniele Ceraolo Spurio (4):
  drm/xe/gsc: Do not attempt to load the GSC multiple times
  drm/xe/gsc: Fix FW status if the firmware is already loaded
  drm/xe/gsc: Track the platform in the compatibility version
  drm/xe/gsc: Add debugfs to print GSC info

 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gsc.c           | 57 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gsc.h           |  3 ++
 drivers/gpu/drm/xe/xe_gsc_debugfs.c   | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_debugfs.h   | 14 ++++++
 drivers/gpu/drm/xe/xe_uc_debugfs.c    |  2 +
 drivers/gpu/drm/xe/xe_uc_fw.c         | 13 +++--
 drivers/gpu/drm/xe/xe_uc_fw.h         |  9 +++-
 9 files changed, 164 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.h

-- 
2.43.0

