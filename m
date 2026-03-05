Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87283F30955
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D67C10E299;
	Thu,  5 Mar 2026 12:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1vxJVvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27710E297
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772713172; x=1804249172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/0/5xCDuUO8aj1pDtpaSQC7hnDO5o7SWQI0VYfbPoD4=;
 b=I1vxJVvAEk/udEvL6Wnij8xE+NG6KMAZY4RAPyLyNUCn0tZjP9JtmO9/
 Bj6TNvLzIsswKIsjC7rGXVOi0TsFTB1UyA4/LxiREvknnKlhrXbt/O+4r
 8yWdXdSnH5x5r+F8F5T+RvSUfbUFJ+B3Gf4pxKpHUScWiD5g7Yi48iCp9
 dX4aL5L7LD4yacoUDBO2tAqcYLLJnv9O8lat8Wecj7HCZGGgbGSS3M1qC
 Uj+uXle+pFqePR9UZ2dEP5Z8O2bIwQEXN8ubUL8RkLYdQDIiGiqb6xS2t
 gX7dtJoajLpj/sq3I4XDqbFvaruzCDtfl1yxT1Da4qYcqG0Rfhh5m0Svg w==;
X-CSE-ConnectionGUID: 27IMrzylTf6xFgYXf0MsLw==
X-CSE-MsgGUID: T+XPkgmtSemv7aMvB1KcUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91370968"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="91370968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:19:23 -0800
X-CSE-ConnectionGUID: P02IJEHETH2PAgxJwMWrug==
X-CSE-MsgGUID: yGsvPbbDRbaJ791YpsmEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="217904700"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:19:20 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 carl.zhang@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 0/4] drm/xe/xe3p_lpg: L2 flush optimization
Date: Thu,  5 Mar 2026 17:49:03 +0530
Message-ID: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

 drivers/gpu/drm/xe/xe_bo.c         |  7 ++++++-
 drivers/gpu/drm/xe/xe_device.c     | 31 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     |  1 +
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
 drivers/gpu/drm/xe/xe_pat.c        | 14 +++++++-------
 drivers/gpu/drm/xe/xe_pat.h        |  5 +++--
 drivers/gpu/drm/xe/xe_vm.c         | 10 +++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 25 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h          |  4 +++-
 10 files changed, 88 insertions(+), 13 deletions(-)

-- 
2.52.0

