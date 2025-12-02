Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33606CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 14:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDCC10E08E;
	Tue,  2 Dec 2025 14:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI3opiU7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD88C10E08E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764687027; x=1796223027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tXcR5Lxj8B/u7brHo5FHL50c4zBA+Cnz1wZlzgTDjpU=;
 b=oI3opiU7Sn02z2VnB8Fa3adeMAKHlkkiZFneDMcYavpXohH1+uG2341b
 m8erY/c3Lv9QwsMkxr1GJdF5wx5ZzEBXc4tM+XSSWOzWDyZIG5RpLFG7P
 qm4G33TzXIgygzxY2ufglB3PjO95wG+WvBPHkFnfYUg6MboNfLgedt1UQ
 lly4WAMS+LbLWYEw5H3tM5lxydbqs4SwudDCMHa4jblSko0k7imNhK3vt
 E0kkWgp2DPrdhX56o4Iujp5o9cLHOlVS6zi7ZwaMPTIfUL698QE4bukCL
 oPh/rMeE7EwPTm5SWuNVfT9NVq0UPQthcz47Bah7ZylHG9FFaXME9szHm w==;
X-CSE-ConnectionGUID: lD3B+MwCS7ipQAEIPWiLVg==
X-CSE-MsgGUID: CV1+W+hUQOq1LxRyZkIXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70512392"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70512392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:26 -0800
X-CSE-ConnectionGUID: DCBFySSHS1i63J96glPrdw==
X-CSE-MsgGUID: MzcWoMRaSoSAVtkM47e9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198793314"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:24 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 0/3] drm/xe/hwmon: Expose new temperature attributes
Date: Tue,  2 Dec 2025 20:20:10 +0530
Message-Id: <20251202145013.3273400-1-karthik.poosa@intel.com>
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

Expose tempX_emergency and tempX_crit for package and vram,
representing shutdown and critical temperature thresholds.
These values are read via pcode thermal mailbox commands.

These are read using pcode thermal mailbox commands.

Karthik Poosa (3):
  drm/xe/hwmon: Read temperature limits using pcode mailbox
  drm/xe/hwmon: Expose tempX_emergency
  drm/xe/hwmon: Expose tempX_crit

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 32 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 99 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  5 +
 3 files changed, 132 insertions(+), 4 deletions(-)

-- 
2.25.1

