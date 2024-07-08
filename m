Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B6C3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23B10E40B;
	Mon,  8 Jul 2024 20:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+V3/IIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90210E408
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F7D4akLc3qb92OgQOgCTh3fn0sSyoz3kkkVnv9Eo2QY=;
 b=H+V3/IIHVyE4LbKFmPLDgNBvC9TcypGRpt0dUzFynwGa/ElLrL0Poj27
 gLhHNnz3QdSu6PlVEgh5m0tH0Ar6oDeVt4ny/mHB07a6PtDuJ1iEw8yHs
 JIO6MChhojBpe9V6SDm+hY9F9XDnFockij+f+0pWLBFJLxoZrBRM2gLVF
 4NeFtUvzh2Uc49Ayb1vr9I/X0XSBOoqozrj8l41vdu7IgLps6s6EzO8Ad
 2BEFjFfvPcwSJDWchlF1u2RxRY7UzEgdqD/AORPHbBcOx5tjaSRn/ttSW
 tkPXBD++Xm8n19HvRlcLUsr4ddUB1Neldf3Ly3yXlQ5/dcbMlYabpR66O g==;
X-CSE-ConnectionGUID: AYCbOcbLS9ibE5NGgy5Baw==
X-CSE-MsgGUID: fxPOIWYITVq5i1LSUog8iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114138"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:07 -0700
X-CSE-ConnectionGUID: rJ0U+7ENSIq981p692Ed/A==
X-CSE-MsgGUID: Y5A/XNDkRLeIRs/6FMhlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47494966"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 0/5] Have xe_vm and xe_exec_queue take references to xef
Date: Mon,  8 Jul 2024 13:20:58 -0700
Message-Id: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

xe_file_close triggers an asynchronous queue cleanup and then frees up
the xef object. Since queue cleanup flushes all pending jobs and the KMD
stores client usage stats into the xef object after jobs are flushed, we
see a use-after-free for the xef object. Resolve this by taking a
reference to xef from it's users - xe_exec_queue and xe_vm.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

@Maintainers
I need to use the below tags in the patches, but not sure which patches
to apply these on since all patches are part of the fix.

Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (5):
  drm/xe: Move part of xe_file cleanup to a helper
  drm/xe: Add ref counting for xe_file
  drm/xe: Take a reference to xe file when user creates exec_queue
  drm/xe: Take a ref to xe file when user creates a VM
  Revert "drm/xe: Do not access xe file when updating exec queue
    run_ticks"

 drivers/gpu/drm/xe/xe_device.c           | 39 +++++++++++++++---------
 drivers/gpu/drm/xe/xe_device.h           | 12 ++++++++
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c       |  5 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++---
 drivers/gpu/drm/xe/xe_vm.c               |  5 ++-
 7 files changed, 58 insertions(+), 24 deletions(-)

-- 
2.38.1

