Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3CEC54ED1
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620510E192;
	Thu, 22 May 2025 20:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoQhENhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DAC10E192
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747947313; x=1779483313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8UwRMyHORjk/1zTs0V8+2EBvTAXh/Q03ds1DT4eevD4=;
 b=LoQhENhj7zqGQFQBAW5/VMRllFp8idzcsnuVGtG45f+qt0HgXLZSLdhm
 8V0uy5jn/53ndcukf3EdhrQSKUaU2AG+ybsiy8RLEHOcaGZKuCDWnxkF5
 Kp6siJV1as+CcQlM+Bw0hDB04FjOsE1IIUKCpG2Hz3zqvaYktxDaYzAw2
 Yr615r9bM2ia8Xq0D531J0LuyDbszQ+uJYJA5Gk59X8RUZHgtylIjUI4a
 h5vVy8QcZKx1VVGb58VdvfxsV2uEDW9SctS7rIjMdQ/8iacmJW8enXfkP
 eDVDyK6tlVEPzrI87s5iQvgHXdnm70efsaUaw7nzdDSiH5j4y0jHf4BPe w==;
X-CSE-ConnectionGUID: 8je8ypJ/Qs6QtOn/nedC6w==
X-CSE-MsgGUID: uZejtH/MS/KZbfbuPJrZog==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49699423"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49699423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:55:07 -0700
X-CSE-ConnectionGUID: ajjY+3KhQC6G+rA8CdyY/w==
X-CSE-MsgGUID: omWaZEfZTLCOAqiEEt6iIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="145634497"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:55:04 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v1 0/3] Add debugfs to expose G2, G6, G8,
 G10 and ModS residency
Date: Fri, 23 May 2025 02:19:34 +0530
Message-Id: <20250522204937.545284-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

    The changes in the first patch is taken from
https://patchwork.freedesktop.org/series/149026/
Thay are  added only for compilation and does not
require review.

    This patch exposes G2, G6, G8, G10 and ModS residency counter value through
debugfs.

Soham Purkait (3):
  Utility function and macro for telemetry reading
  drm/xe/xe_debugfs: Exposure of G-State residency counter through
    debugfs
  drm/xe/regs/xe_pmt: Macros for G-State residency offset

 drivers/gpu/drm/xe/regs/xe_pmt.h | 11 ++++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 64 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     |  2 +-
 drivers/gpu/drm/xe/xe_vsec.h     |  5 +++
 4 files changed, 81 insertions(+), 1 deletion(-)

-- 
2.34.1

