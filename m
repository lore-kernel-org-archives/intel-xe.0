Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0C5C3ABD7
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 13:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409C10E411;
	Mon, 12 May 2025 13:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDTAObSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58310E19C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747058019; x=1778594019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x7J/jow58nrO7KkH2vgVql0K5zC1FyzNnhm8EmCVyrY=;
 b=NDTAObSBDkczqFWhhwfbv8yYT/HGksBMKbOJ3eRFFO21fsZZDuA2vbJ+
 XpEue3iaD7alE5Qzx7ZwMWYSOzU99NyRt3lcBymWCv95nRRhrX8u2tnkT
 QBznUybpberSOxis8o2KSFFGBXHjsXQzvJfBEeDNS67bp/TH+lvjyxhTo
 Fr1IAl1QHoXCf+wVhhnLUY3pvfde2ikyHsK0OdnZpxtEqArE2Z7gBczq5
 H5S5/mZOubEx0wMAa7XMUZephFEafPPvub7M5kPE43wZ2QN11inZbqM3U
 6JNzk4Qvru/dzS0hcwhaxWiFlel4ciFSvdbPtrvWh9HfudV4JnOn2hXFU g==;
X-CSE-ConnectionGUID: Wvgf6HJlTO+tX9eL0uFkHA==
X-CSE-MsgGUID: 4K1akHLqQm2ZSXqzNE9RoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48933088"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48933088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:53:35 -0700
X-CSE-ConnectionGUID: NhzG1SbVQpSZzAnYgkB7Rw==
X-CSE-MsgGUID: LGPvEQEFTHStRolj/6l7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142320418"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:53:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v8 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Mon, 12 May 2025 06:54:54 -0700
Message-Id: <20250512135500.1405019-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Minimal set of patches to enable compute UMD SVM atomics.

Collaboration with Himal.

v8:
 - Rebase, resend for CI

Matt

Himal Prasad Ghimiray (1):
  drm/gpusvm: Introduce devmem_only flag for allocation

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         |  37 +++++++--
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 +++++++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  14 +++-
 drivers/gpu/drm/xe/xe_svm.c          | 117 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          |   5 --
 include/drm/drm_gpusvm.h             |  47 +++++++----
 10 files changed, 209 insertions(+), 57 deletions(-)

-- 
2.34.1

