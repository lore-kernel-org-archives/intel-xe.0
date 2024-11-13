Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB6CD637D2
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 23:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB210E258;
	Wed, 13 Nov 2024 23:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QM1CBuW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B464810E258
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731540582; x=1763076582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vdy23o3RIPyImBSMJulNFu5+fUpRTDv+0F7Bo8MKq/U=;
 b=QM1CBuW4QQlHu7DvdbIGG7KIEUyiRraTZRlS0IUOuTTiLjnLBX+oLewm
 H0bBaKnNSoUS635Yqth5FsFNvx/RHBisV41D9ARnqdBOQm5fMLu+4sFG2
 iH/0TFwhtMELV8TaTVFyZp/gst6W08mjkjbsAFgN+XyZFLX6s8XBshSlI
 85B9BnXaqe17JgTVxgDGq1OVBy94RPEJhjHSETEcxUuQ43yIMfrL3L8bn
 utYNKDMPZkV1oTmpL7hRjwwATtmjZ7tnv0MLkEEhR3bTtKEpTsS470J05
 APhs0i2v2Y7GOboaUyj/LjEWWlz6zATXMVzlymgnBdlkwlE3qSC0HJ2Ei g==;
X-CSE-ConnectionGUID: dtGImiT/R5ytZaCyfeh+1Q==
X-CSE-MsgGUID: WAc2RTYCSmCLf/zKlZ+IyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35167727"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35167727"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:29:41 -0800
X-CSE-ConnectionGUID: yjn30yg7S6isYYzQXoxZiw==
X-CSE-MsgGUID: M7H14xKoQfqAoh81Pf8ElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="111330102"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2024 15:29:41 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 0/3] drm/xe/pmu: PMU interface for Xe
Date: Wed, 13 Nov 2024 15:26:57 -0800
Message-Id: <20241113232700.151910-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and C6 residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |    2 +
 drivers/gpu/drm/xe/xe_device.c       |    6 +
 drivers/gpu/drm/xe/xe_device_types.h |    4 +
 drivers/gpu/drm/xe/xe_gt.c           |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |    1 +
 drivers/gpu/drm/xe/xe_module.c       |    5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 1044 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  155 ++++
 10 files changed, 1263 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

