Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE0E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB1810E6E6;
	Thu, 19 Feb 2026 11:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkR2A8Iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0082610E6E2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771501098; x=1803037098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wav2/T4UQyP+8uteim90OSSlCoKKp772jNfSuP5NF5k=;
 b=VkR2A8IwVzpOAVNvuNpAb7oRc973RyEftzOEF+Bgak3zt6B2H4jc9jH1
 Bnk1qUj29lL6gw/dKIqe5/WbpBIKDyMMKeSVMWgJKnAHhyv8WhP7v7i1U
 eGAisv1iBYVWUu/IoLRtCObtijeU6ucr0VTpPzou6tQA14lSP0Oz9Akoz
 uVUjXEcGv0u1iSMV/9IwQ/17zomxSdlvhhLNI61Y7MNt7E5ol7xuT6dNw
 Xl0MNDJ0nUkSFeim9RFTU0CugXeq+3FEvMTSuKk7fSe3/A2l66kKzf87p
 hlVSJBd8+H1gR5gI/0vF3F9Wd4xKyNMyfS6i3BzZU849Uew0kMuQSa6Za Q==;
X-CSE-ConnectionGUID: 7NXQ9izlS5Wng19elbpUhQ==
X-CSE-MsgGUID: Yk0EO/omSvqrnjfJAL1C2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76199658"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76199658"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:18 -0800
X-CSE-ConnectionGUID: 2PdAznt9Su6GXA1LtjHSAg==
X-CSE-MsgGUID: GT6LaNN0RvKfwK/pT12rYw==
X-ExtLoop1: 1
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:15 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 0/4] drm/xe/xe3p_lpg: L2 flush optimization
Date: Thu, 19 Feb 2026 17:07:44 +0530
Message-ID: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c         |  9 ++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c |  6 +++++-
 9 files changed, 61 insertions(+), 12 deletions(-)

-- 
2.52.0

