Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53F9E77188
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jan 2025 17:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC8810E07D;
	Sat,  4 Jan 2025 17:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elgG7XlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA310E07D;
 Sat,  4 Jan 2025 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736011802; x=1767547802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ooZ5uLlD5Z0zmlhyT27OhqQvWoEC/3xqowSG8ylfU+A=;
 b=elgG7XlFIFU/uX6+JeTp44FFtxt7W2gtFKI7J0yD+SGvFzr6q/F6PF/U
 Xy2vtmEnLNl+pbn2TAaOz/3gvAG+GcZ2MYVtNmqhN3FYBkXCpHH35pHsa
 Ur20OodMawrDLXuyK4ydlUIBlRFA1s61cET1C6oEH35vcrSV0mdcR047C
 FTUW034oJzQRubqSL6fWcodDtVefN3ULgWSr7DnnRgXkkWbyJJgDSeMDi
 bHmTwNzdUZ0ZNthS0ysakRstqhpXyq/WdyLns6kuSsLrI7ylO16e6wYwg
 1W3xos34P8JDYfJxCl3Rdn5wIzf3JFFOOdjN10vFMa4IfW9x3bn5sIKeF g==;
X-CSE-ConnectionGUID: CYt49sKcSzOFKlqU0L0FHg==
X-CSE-MsgGUID: D5l8rmHoQiGUWvuLmMHmcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39989585"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="39989585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 09:30:00 -0800
X-CSE-ConnectionGUID: 9M/zepFlQ22I/TjDnrtATA==
X-CSE-MsgGUID: OsA6ac/VRIGqtQlIGmiwgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101839899"
Received: from ldmartin-desk2.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 09:29:58 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 0/2] drm/i915/cmtg: Disable the CMTG
Date: Sat,  4 Jan 2025 14:29:24 -0300
Message-ID: <20250104172937.64015-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.1
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

Next version of [1], with review comments addressed.

Note that I have added one extra "squash patch", because I was not sure that was
the correct way of handling sanitization and thought that having it separate
would make it easier for reviewers to check the change.

[1] https://lore.kernel.org/all/20241224165408.43778-1-gustavo.sousa@intel.com/

Gustavo Sousa (2):
  drm/i915/cmtg: Disable the CMTG
  squash! drm/i915/cmtg: Disable the CMTG

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 251 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  18 ++
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  21 ++
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_driver.c   |   5 +
 .../drm/i915/display/intel_modeset_setup.c    |  20 +-
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 10 files changed, 318 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg_regs.h

-- 
2.47.1

