Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8316E67A6D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 06:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651EF10E120;
	Tue,  3 Mar 2026 06:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8cmOrdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9DB10E120
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519094; x=1804055094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gUoBa4VVGyMIiPIcANtfTtp24+YwT2tMRLPTjwJFdDU=;
 b=j8cmOrdjz0P+dIdoGn+E+t9xd4ReYbsxV4+CrbFKTh9wf/77nUekbfio
 9K92HZ3IPxXa7BtV/ucDajFUqp/HgC7SddIrTcXqiZXESwcJCSfrX068r
 R5WAlOGUfgnty2d1QYuOUQDZnPzsdp0uUhK9aG+gzTSTNgQ3odyfw68Gj
 +DSowFfwXZ/r0o4ubKP00SEYT3WUsW1JX6Zvck5EJkka+sAW8CKXWU4gf
 RU//YFTHQrUG4o3PwBRR6PjuCfCERUGc8/vyOEVOVZ/yjexR+JyEb67k8
 15+9GHOlFJoQNbjfLlo+aXYE6RCocs9amTBfWZ2CNeEGHSdsP3Bq8n5eY Q==;
X-CSE-ConnectionGUID: WKkio2kGRiWaXxcTD73zKw==
X-CSE-MsgGUID: w1w8yTkXSXiAgZHD0zyBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="85008895"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="85008895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:24:53 -0800
X-CSE-ConnectionGUID: JtO7V6QHT5WrokK1dg+94A==
X-CSE-MsgGUID: BPYhUqjrQ7mGNWsP2uDt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222383684"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:24:51 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 carl.zhang@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V5 0/4] drm/xe/xe3p_lpg: L2 flush optimization
Date: Tue,  3 Mar 2026 11:54:42 +0530
Message-ID: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

The optimization involves two key changes:

Hardware-assisted Transient Display Flush:
The new hardware can automatically manage the flushing of "transient"
display data from the L2 cache. This eliminates the need for manual
(software-driven) transient display (TD) flushes by the driver,
simplifying the code and likely improving efficiency.

Transient Application (App) Cacheline Management:
The hardware gains the ability to flush transient application cache
lines more efficiently. The patch handles the necessary integration
to utilize this new functionality and manages manual flushing where
it is still required, ensuring data coherency and optimizing
performance.

Additional handling due to L2 flush optimization:
1. Need to flush cachelines manually via async tlb flush for internal/shrinker bo
2. Define coh_mode 2way for differentiating coherency modes
3. Add restrictions for userptr, svm/madvise and dmabuf to use either 2WAY or XA+1WAY
   pat settings

Tejas Upadhyay (4):
  drm/xe/xe3p_lpg: flush shrinker bo cachelines manually
  drm/xe/pat: define coh_mode 2way
  drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush optimization
  drm/xe/xe3p: Skip TD flush

 drivers/gpu/drm/xe/xe_bo.c         |  3 ++-
 drivers/gpu/drm/xe/xe_device.c     | 31 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     |  1 +
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 14 +++++++-------
 drivers/gpu/drm/xe/xe_pat.h        |  5 +++--
 drivers/gpu/drm/xe/xe_vm.c         | 10 +++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 25 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h          |  4 +++-
 10 files changed, 84 insertions(+), 13 deletions(-)

-- 
2.52.0

