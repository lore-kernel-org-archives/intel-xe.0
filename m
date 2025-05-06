Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BFEC3ABC6
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E31810E116;
	Tue,  6 May 2025 23:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoneQ6Vi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2A910E112
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746572410; x=1778108410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hAQXeQWa8hHfuBaCFTLy3u2NEvjGIO36Od3D5nqo20E=;
 b=LoneQ6ViC4uGPwDizFdRcoYN5Rt2+4fXvb3/Q5Z1i45tx6Cvig5/NDDZ
 RgKch37R359GdKN6fW0K23sUoJoQXkp4aMNZx22XQ5HXZ+Dq4oIYExbMl
 omusvUIGmGUiy9/gOjiM3qsWSDlfO4DYdOGcXr4op7fsxbTBm1SadXQ/h
 9bfLToZtU/iXlP2lqHUjEHmdPA2rsH9/WhjnTYyEAFXRfsrA1pttqMnVI
 8lt3wUk9pV/OrkfBIyY8CkhnbLHqVkAvFnioj0BcOOFqF/iMeoPbRovCE
 o9WiV1CwXgrJPQVb9YNsE3+8TVH4Xml2L9E28eBVODFCAaUCYy0rakGZM Q==;
X-CSE-ConnectionGUID: uJOGUXi4TmucwclyTXtg6g==
X-CSE-MsgGUID: L+DgLle0Q4qDHM8ERf5Zgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48353960"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="48353960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
X-CSE-ConnectionGUID: bUqaZC++Ra2nFV2OfAFS7w==
X-CSE-MsgGUID: GCGOqpTQSzSdx9k+pjcDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="166690637"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Tue,  6 May 2025 16:01:27 -0700
Message-Id: <20250506230132.1188732-1-matthew.brost@intel.com>
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

 drivers/gpu/drm/drm_gpusvm.c         |  37 +++++++--
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 +++++++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  14 +++-
 drivers/gpu/drm/xe/xe_svm.c          | 115 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          |   5 --
 include/drm/drm_gpusvm.h             |  47 +++++++----
 10 files changed, 207 insertions(+), 57 deletions(-)

-- 
2.34.1

