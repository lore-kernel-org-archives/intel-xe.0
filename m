Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E2C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 20:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02110E1B2;
	Tue, 29 Apr 2025 20:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZKoObUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46B10E096
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745957878; x=1777493878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dPKibWWCckQ4y5i8GzHGJMJMMdFDUH3XkaxG9EBgnE4=;
 b=LZKoObUGuQ0BOZ57ea0xko5XrdYFYTMdaBXQde2eFV5j6QnupmIbF/kx
 MGkmzgRzcl+uuVRSARMAE1Dde+w4XlsAKenantd0vkUxkwh8x5tdeZ5HM
 OUrMQZPVbDJy3C5J1uBWZonAulxpZajmxvkICjCpc/n19ppNk4F+6JGCj
 YkSigvPKQADdOS+PA6cTrrs6kuRqfAVO1smJdm5X1PYbwiZBSeunlLiaM
 lwlzziTSl5TlXOgeQr3g2w6jqo+7RYJzlIyzIsQujsIe85Jp/TTlVavfw
 IVLwVzYEaqOycfec565io/Mh2V0O+sPf16PZKPeN+mwEWwRAUtvihbPee A==;
X-CSE-ConnectionGUID: 94G5WiEXSUiKvG+mPw1Yhg==
X-CSE-MsgGUID: hc3A43CpRiaa9nj8uDcN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47481919"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47481919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:17:56 -0700
X-CSE-ConnectionGUID: vzW4Hk9lSe6qRzXlZWjm0Q==
X-CSE-MsgGUID: 9hd5zn+dSVan8Yc18IlUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134876626"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:17:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Tue, 29 Apr 2025 13:19:10 -0700
Message-Id: <20250429201915.1025600-1-matthew.brost@intel.com>
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

Matt

Himal Prasad Ghimiray (1):
  drm/gpusvm: Introduce devmem_only flag for allocation

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         |  14 ++++
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++++++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_svm.c          | 109 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          |   5 --
 include/drm/drm_gpusvm.h             |  47 ++++++++----
 9 files changed, 172 insertions(+), 49 deletions(-)

-- 
2.34.1

