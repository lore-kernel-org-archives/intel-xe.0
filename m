Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FB0C5518F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A31C10E159;
	Fri, 20 Feb 2026 10:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1fyvvQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E12610E159
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771582613; x=1803118613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mGC9eDGXt08XQ9hi3Y/C/HMq8kzGFOyfuEr1+2TFvs8=;
 b=V1fyvvQzyNMe7eYo+ZQ4k+vpcBVcKgoLIp1FA3tkM3BmmV/Fzf5GehX8
 sB2GfVHs9Sn31nkJSl4CKAMECIzYmIYHbm6OU+QWbX3ZQ2ZAB5+k242hw
 Jet0pWjnPjJgz3q7cLynY67WAkfSgMt6f19RVXe0ShZg+zhRVoDxCZXVk
 LA8lr4fCss5GSUfvLB9zvcpxwkxlp0UeQ2Wfv1EAwVUy97zxyeqE16QnF
 L9RU5wXBImwA2/wuAlX1kPLmHVftfMZikQevTQj5hzeIEX0LateThWibs
 UxoDwQ7YwCwHvbs50p2KQyYmgCcGy894Lp4WatDcZVJWCn0bylOrG53l9 Q==;
X-CSE-ConnectionGUID: uSsluGBBQQWT+Rw3o5ClVA==
X-CSE-MsgGUID: FN92WeM6TyKjXruxXwOqeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72579905"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72579905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:52 -0800
X-CSE-ConnectionGUID: V8nDyiD5R6W3lMLl1Ed72w==
X-CSE-MsgGUID: vr0xeqDITQGMBxFCmnrQXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214666659"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:51 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 0/4] drm/xe/xe3p_lpg: L2 flush optimization
Date: Fri, 20 Feb 2026 15:46:39 +0530
Message-ID: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
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
  drm/xe/xe3p_lpg: Enable L2 flush optimization feature
  drm/xe/xe3p: Skip TD flush

 drivers/gpu/drm/xe/xe_bo.c         |  3 ++-
 drivers/gpu/drm/xe/xe_device.c     | 31 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     |  1 +
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 14 +++++++-------
 drivers/gpu/drm/xe/xe_pat.h        |  5 +++--
 drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 20 ++++++++++++++++++-
 9 files changed, 77 insertions(+), 12 deletions(-)

-- 
2.52.0

