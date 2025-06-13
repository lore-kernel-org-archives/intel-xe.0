Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4CDC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B741510E97E;
	Fri, 13 Jun 2025 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/HKfG2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7D10E9AE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749848469; x=1781384469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jx4vT5Ob4HvquE4Tekt/OTMTJ0GWvtC7IGx63dzzTbk=;
 b=D/HKfG2L7Gb4ml2tPHyYCEW44bPC/JQy77dy3k+RsnQQ58JCZPa1E9FH
 Y3rXXxXg+LAllpFw7Mx5mpUcVKG/EzOB5UoUbpG3bKu2jTSsB9anewIHu
 Wroeyjhm6RdZRWBGVRqVRWXyyehiD0CLwm+GASqlUtAC2vN2fdH4foFom
 yqA2k1G6JbdMFMuyjws41Hlfj6rbBqoOJ7NWC3UQ1AT+lxe9Vhri95D3g
 7O28gu5OqFUo7rtJQTIz+4DtMxUOE2wsLNUJKsKqRFbu0EmGt/02tQ/Q0
 v+Hn+75q9H2gqgUO7VPpFSdNt225/zZjL/NujljFHfe/Ts0bRcsAHIVmK Q==;
X-CSE-ConnectionGUID: vNUvfqwnT+6wHL13qB091Q==
X-CSE-MsgGUID: VtcIFqQaTAG73vzF5mU+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55750678"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="55750678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:09 -0700
X-CSE-ConnectionGUID: 7KVvxnHtTMm6tJ1i4MEvKA==
X-CSE-MsgGUID: R3YE996rTX2t3E+zduyFSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="171108138"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/2] Opportunistically skip TLB invalidaion on unbind 
Date: Fri, 13 Jun 2025 14:02:40 -0700
Message-Id: <20250613210242.718441-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add xe_vm_has_valid_gpu_pages helper and sOpportunistically skip TLB
invalidation on unbind.

Matt

Matthew Brost (2):
  drm/xe: Add xe_vm_has_valid_gpu_pages helper
  drm/xe: Opportunistically skip TLB invalidaion on unbind

 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-------
 drivers/gpu/drm/xe/xe_pt.c           | 14 +++++++++-----
 drivers/gpu/drm/xe/xe_svm.c          | 16 +++++++---------
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 drivers/gpu/drm/xe/xe_vm.h           | 19 +++++++++++++++++++
 5 files changed, 38 insertions(+), 22 deletions(-)

-- 
2.34.1

