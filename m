Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F5E7E63F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034610E120;
	Tue, 26 Sep 2023 14:27:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361710E120
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695738452; x=1727274452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=55D8G/NQofQM9l5mVIcQXQH5IoIHZ1dwlo7H5Volf9U=;
 b=bPGv3jhezlswuKbOMKQghpJrnOZXlrdcetgqL09aECIqtb5k8SPUuupF
 Gj1hD1kJ8pzUII+CQfBjBze1e5XFKZzZiaGs3AJBmx2wdRB8rLkCJeJFF
 hk+lSw1KJjwVcOyKWykcLeryEJTVceX9H6qd0FEhU5AENPYya5OdpOQcU
 5rl3BLVEP5LKrAIRlJYClgHq7I4ePFaSbWfRYWSzV0y4PC4p+1nFBMUdk
 PXP/bhCvKyhMQx9SMid/BlvDWTD92r4cOEJ/Dd8rOWF1uefzNpfWJZmNq
 naCtYqx98kVysvnIXVEevWhVa/LVPzwwQr0GHnPnFbjH52Pd+JXdNBskO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361828484"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="361828484"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725435601"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="725435601"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 07:27:14 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 20:09:15 +0530
Message-Id: <20230926143916.333958-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/1] Add throttle reasosn sysfs
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add throttle reasons sysfs under device/tile<n>/gt<n>

Sujaritha Sundaresan (1):
  drm/xe: Add throttle reasons sysfs attributes

 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c          |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
 5 files changed, 289 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.25.1

