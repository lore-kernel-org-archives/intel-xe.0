Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715BAC369D9
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 17:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D4310E60A;
	Tue, 22 Apr 2025 17:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMumC+Uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2B10E32B;
 Tue, 22 Apr 2025 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745341378; x=1776877378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPyp+VSUMHj8QkQdWEbER9eupyYH904t1BLbcRP6i3s=;
 b=mMumC+Uyz85jQ/7RBAFkz1vP6BDWk7knZc23KNgqTBcKaVlPkg8F23Z7
 k/Ep9xD4kj0Iv5a9WiIUClvOo9HN/CdO4j4GbDldaZmOo6BhkJQPgHcTJ
 BQSPArLN6OotDd63khckrpzJ9941fP0jIYCnrRGrZw+unD4v/TKWFY5S1
 q7yWAQ7sEKdifRMIJq23KFnKUECfyAYSnyS7q24Vu5vwkj8AKeaTUj3s+
 DYwrwWG6nygU/xWgOc4HCuwilDF+G2SR/qPSlhlWudCqKcwSF5yLSSWS/
 l63ZBjqcONiseUONADAKZMSYE7bo2+FaC73IUN2hhegtInIdyp0eBJNbU w==;
X-CSE-ConnectionGUID: LXNgsuqxSm2AcabWKp7/Gw==
X-CSE-MsgGUID: kvYY7X7eTeeQS6FRaLNs5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46794351"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46794351"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:02:56 -0700
X-CSE-ConnectionGUID: k19IJ4QXRPOvK561Wzk7UQ==
X-CSE-MsgGUID: I0N99KKKRqmc6xaEjk+PBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131964233"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:02:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Tue, 22 Apr 2025 10:04:10 -0700
Message-Id: <20250422170415.584662-1-matthew.brost@intel.com>
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

 drivers/gpu/drm/drm_gpusvm.c         | 14 +++++
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_module.c       |  3 -
 drivers/gpu/drm/xe/xe_module.h       |  1 -
 drivers/gpu/drm/xe/xe_svm.c          | 93 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          |  5 --
 include/drm/drm_gpusvm.h             |  7 +++
 9 files changed, 132 insertions(+), 33 deletions(-)

-- 
2.34.1

