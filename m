Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F03CDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 18:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB1810E43F;
	Wed, 18 Oct 2023 18:55:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247BF10E083
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697655356; x=1729191356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbrTvftN5b1NI4nd7zv+P8d9j4a8DFO/ZW2Hvt544es=;
 b=AyJaMpt8ocMZ5HYmkcThyYRZ84/glnooQyRZpjRoL/rTjZBm5egbUFz8
 lLtH4Ghmy7tZ3QIBlyXG3GR5oJPjRCH/QlUyj7HMbpKDBBSW2Q/5lpC2+
 qWTaZNfwsedvKwcXaNloFKgyPfWxf33cdKZ0xeIIGLo97yrnSfudiqJxj
 QQn+42w2M3FW1dSVivPLBGzwi2dftukAnJI8HWNGHtsHGQvZ0tMpYJAqH
 nfDTblqjCM3V+iGYSs4X2tK2SLDqBlbLxQBlo6uSk0W8hVfSv/9Xx1OAQ
 Qty7BTwbpD5i2cJyimZFyMPFGR3ha0F2vxeu0gG+nRxpReQZzHIkFaF6u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388946330"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388946330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900447212"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="900447212"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:53:48 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 00:33:38 +0530
Message-Id: <20231018190341.726098-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] DGFX HWMON Enhancement
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series contains some enhancements to xe hwmon.
The patch "Expose power1_max_interval" is, with couple of fixes, from
previous series https://patchwork.freedesktop.org/series/118934/

v2: 
  - Fix review comments (Anshuman)

Badal Nilawar (3):
  drm/xe/hwmon: Wrap 64 bit reg accesses to xe_hwmon_process_reg
  drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 353 ++++++++++++------
 3 files changed, 257 insertions(+), 113 deletions(-)

-- 
2.25.1

