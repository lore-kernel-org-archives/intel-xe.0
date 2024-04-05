Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784F7CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB80113BC7;
	Fri,  5 Apr 2024 12:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iwoi8QkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1830B113BCA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321459; x=1743857459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=32E6szGP34gjCNZ8xDZ75N9lLOckV81OGCBfL0eyOzA=;
 b=Iwoi8QkMxS+/KBhJ3IJ+ns124SoodzuLz9gc14bXYnwMwpt8CXAeyL1b
 409bHAQkjzu7a+6acdbfuDI9hfhtz6Zuf9E2ndtoovH1oGQQkHxwLuvKD
 w7YtUGIuKSLPOuMUDk2Adp01oW4BSiODSl8R+ry51aLX+eW4E/ugNUJnh
 P+6kdUoaHxkt9b6wufSQAociRDMbwvMx3HNaa+cdfUmE5bBv81ZlP0uFO
 qdXVswQElGVnVU1n0bvmUK3xwyOH989Nxcuhojq7YR1trO5V5eZ6NBMg2
 twIDulUiWX2wfH4ZJvjhg0zPJVogo5a4mJ+ecO0llwskPGKiOufZLHtdt A==;
X-CSE-ConnectionGUID: ZvtyeDRBRySOF4euG6IZOw==
X-CSE-MsgGUID: OxBPR+zrSOm1EBA0v6G1fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810048"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7810048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:50:58 -0700
X-CSE-ConnectionGUID: WzYUy2xZSmydTHTEm7wMjw==
X-CSE-MsgGUID: RmzZMJvVRR6IiGuP7jZgRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23643856"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:50:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 0/4] drm/xe/hwmon: Update xe hwmon with couple of fixes
Date: Fri,  5 Apr 2024 18:31:23 +0530
Message-Id: <20240405130127.1392426-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Split changes in version 4 of this patch series into separate patches
as per comment from Lucas.

Made below changes as per review comments from Lucas, Badal, Rodrigo.

drm/xe/hwmon:
 - Update xe_hwmon_get_reg and xe_hwmon_process_reg protypes.
 - Address a potential overflow.

drm/xe:
 - Define xe_reg_is_valid.

v2:
 - Rebase.
 - Fix checkpatch warnings.

v3:
 - Rebase.
 - Fix review comments.

Karthik Poosa (4):
  drm/xe: Define xe_reg_is_valid
  drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
  drm/xe/hwmon: Update xe_hwmon_process_reg
  drm/xe/hwmon: Cast result to output precision on left shift of operand

 drivers/gpu/drm/xe/regs/xe_reg_defs.h |   5 ++
 drivers/gpu/drm/xe/xe_hwmon.c         | 106 +++++++++++++-------------
 2 files changed, 59 insertions(+), 52 deletions(-)

-- 
2.25.1

