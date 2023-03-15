Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D702C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7B10E989;
	Wed, 15 Mar 2023 09:15:39 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5EB10E989
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678871737; x=1710407737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tc9rT0hWREeu0CCUx/g1oPwtXxFWXQ57V1CB40YipMI=;
 b=UJXDVhd1864sZNSgYltH7Cyh/zpAUVEXt+bjADaYqqkOZtJURrPLgTOB
 aDYisMptN5XlqZlCxK+LOgryZxqmo/P0yglx+kUqKLpuXblkPWaY4SqQA
 a/e138u+4Vqj/NWxX77Ni3HJRCt0IXtIGK7gKln95Wc7W3tXRDteZGxH+
 QZFn6ctHq6eSLMCYzDdhAwTJACVkeDk0neLwnhrXrTerNpC7tUJgHjW67
 hA5CCyrx+fFsyx0AFgJ2V26NPLy341rEc7qmRkDY5c/UZYCiFDpBtt8ys
 NHwLwAPgRkGNwv5mg6fSnak9urFQd3+u+xVFfb6VlL0CRWCgC4PVQ7BG8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400234675"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="400234675"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681764106"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="681764106"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2023 02:15:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 14:47:39 +0530
Message-Id: <20230315091740.1580755-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] LOG GT hardware errors.
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

Count the CORRECTABLE and FATAL GT hardware errors as
signaled by relevant interrupt and respective registers.

For non relevant interrupts count them as driver interrupt error.

For platform supporting error vector registers count and report 
the respective vector errors.

Himal Prasad Ghimiray (1):
  drm/xe/ras: Log the GT hw errors.

 drivers/gpu/drm/xe/regs/xe_regs.h    | 105 ++++++++
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt.c           |  30 +++
 drivers/gpu/drm/xe/xe_gt.h           |   2 +
 drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
 drivers/gpu/drm/xe/xe_irq.c          | 346 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |   3 +
 7 files changed, 531 insertions(+)

-- 
2.25.1

