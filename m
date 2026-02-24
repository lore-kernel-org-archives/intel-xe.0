Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAFDE9B251
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 11:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC32B10E567;
	Tue, 24 Feb 2026 11:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJlWltU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782FB10E568
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932747; x=1803468747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61y2WycmMhnZn8+9E+l2pMCnYVezYP7bqhORj//jYOY=;
 b=XJlWltU6MgKdjp2jLPLMOjnU1F0kzK/TZp4fJkcEnK0IeweZbCT/0rZZ
 ZvRAp9UZcT6CsM30jTdwkvkxJNm3VJSiYWjA+ja340QCqodEzcyzboK/1
 orX15P4Kmi87n/pe28c3odidRZsvTETbfp+CweSMyIR8/Bl+UXZ5a7ryz
 yevuLwBFqbYTj96WGP1VKaM1hUhhheXd3HlLnFAml7ZIZBe+H2S/x5UrB
 wNRl1K4jGCTPdOcLptBheYfcN7ygZUl8iShgBoymLbeT4w892oRse2tk7
 SMsTUJnKqUaONE1wUi/COFFzHk/oHzG4ESpBf6xltPBrjxXFb4vHV0coS g==;
X-CSE-ConnectionGUID: YWJz5hhNTKSs5Fn2qMGLkA==
X-CSE-MsgGUID: iarzKs+cT5qwbjkUIJhEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72918083"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72918083"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:26 -0800
X-CSE-ConnectionGUID: 7QlFlHOPTI+wuu01M2omyg==
X-CSE-MsgGUID: qyMQ6O6hQ0a6KvnFKRdqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219972508"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:25 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 0/4] drm/xe/xe3p_lpg: L2 flush optimization
Date: Tue, 24 Feb 2026 17:01:48 +0530
Message-ID: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c         | 10 +++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 25 +++++++++++++++++++++++-
 9 files changed, 81 insertions(+), 12 deletions(-)

-- 
2.52.0

