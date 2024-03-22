Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A4C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 03:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711B10ED8B;
	Fri, 22 Mar 2024 03:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBiNiOoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5B10ED89
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711078979; x=1742614979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MZHWc5bHLgbYMHlDfk72BfTg2R6pCK6wWdUyBdSqwhs=;
 b=BBiNiOoE7vUrwIV7i2FB6CDnQF6aiARMmLBrxkA9LYdodAm2xCSCZ01o
 tn4fcv0bWujCt4EJG9LbtQWuP0MgChRR1GXcuGG/kUErFu1NpnH/Za/7L
 dwNdozHUUCTQEQABm6553tJDXjS8YRdWYKjAG2iZL7YMC2OkVwgLKKCvN
 I0UZERUxr0rf1HIMwXjG28aEtIZw5rf/ALq9Fy+XGrtimCx1ZbBXpu00d
 E04/VwKpfsoxjrgJ0iwj6OgCZbwYUma2XnrRavhUe5rCnsBNJT/O+7iin
 +4z31DOX7EgNTiO7KFKShNnKL08pmAWhTqP4E+EP7W/w88umfOCcmgrsF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5966229"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="5966229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="19317548"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:58 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/3] Use hmm_range_fault to populate user page
Date: Thu, 21 Mar 2024 23:55:17 -0400
Message-Id: <20240322035520.2382600-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This is an effort to unify hmmptr (system allocator) and userptr.
A helper xe_userptr_populate_range is created to populate a user
page using hmm_range_fault, instead of using get_user_pages_fast.
This helper is then used to replace some userptr codes.

The same help will be used later for hmmptr.

This is part of the hmmptr (system allocator) codes. Since this
part can be merged separately, send it out for CI and review first.
It will be followed by other hmmptr codes.

Oak Zeng (3):
  drm/xe: Introduce helper to populate userptr
  drm/xe: Introduce a helper to free sg table
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 254 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  18 +++
 drivers/gpu/drm/xe/xe_vm.c  | 122 ++---------------
 5 files changed, 287 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

-- 
2.26.3

