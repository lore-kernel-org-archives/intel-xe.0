Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464FEC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 09:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149EB10EB43;
	Thu,  6 Apr 2023 09:19:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57E610EB43
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680772780; x=1712308780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dak6FJSPd8vRf/QmiGCQFxTkU0I0v5R8F5Fb+rYzOOA=;
 b=BbkJrdM2q+DiU8hCiz9g7ysga6bIZVUjv57BRtELYN7ewLitJdns58BW
 Z5166w6A+xFK7lu4Qm1DcKOCCxjMcbcq82KpEJqTDQrrkpLyLgyhyM454
 /t+1BTM9Rrs8fQpyD8aRTvXj3tXhhPV4dkFH8LTiNyDS5W6Kf6nZM10y6
 iLcGJFfgywTY/c/3bZIwexMn+Ly9wfDGykArVYz+cJzNZsgn5wF+v/wB2
 va4q8xBPAumCZL89uNV5/qfdY/WzFkiKCdlqfLCDsSTHLRcRXD6dQrLAc
 dcFGbzQl3ASzIV2tCErK56sXfUlV7K9XouhID9rgyUgy90B8Z59eN14MU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322341869"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322341869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 02:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680598080"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680598080"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 02:19:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 14:52:19 +0530
Message-Id: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] [RFC] drm/xe/ras: Supporting RAS on XE.
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These patches in series are for adding Reliability, 
Availability and Serviceability support on xe.
Patches provide the infra for various hardware error
counting and logging. These error counters will be exposed to 
userspace in subsequent patches.
In current patches:
1) We are adding support to handle new interrupts bits.
2) Counting of GT errors.
3) Soc/SGunit error counting.
4) CSC HW and FW error counting and sending uvent.

Akeem G Abodunrin (1):
  drm/xe/ras: Add support for reporting CSC HW and FW errors.

Aravind Iddamsetty (2):
  drm/xe/ras: Log the GT hw errors.
  drm/xe/ras: Count SOC and SGUNIT errors

Himal Prasad Ghimiray (1):
  drm/xe: Handle GRF/IC ECC error irq

 drivers/gpu/drm/xe/regs/xe_regs.h    | 244 ++++++++
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |  30 +
 drivers/gpu/drm/xe/xe_gt_types.h     | 105 ++++
 drivers/gpu/drm/xe/xe_irq.c          | 824 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |   6 +
 7 files changed, 1219 insertions(+)

-- 
2.25.1

