Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04847C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2308F10EF2A;
	Fri, 12 Apr 2024 09:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iznOplSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27710EF2A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914732; x=1744450732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5VKtMzaBOptfcWhdL+Cd76L0496pJ4q9xqFo3tg4MrU=;
 b=iznOplSA+033zrmM2apIn+BlYbhF1uyIy9yuyQeDsuc3JXyNVbfFYM+R
 UcQbI5EZz3AEAPWnGiRs5K0Mtvn+A+kbK7UXR/KlPABZY+SJhOZfIqPsa
 qmh1MC22zbmQjK7NG8uQmepiC8YeExII6RyegcqvdsIvN56Oei+m+z2vy
 EnlKKtqq7T1TQtSlYAwaOXmzGBVr3FR+Ej+NC6FUd9AQ9ay48jif/fM1d
 JHDIKef3td9pnNxURjvUkuSvBejnCCorD8+LUlRYIuzm+cZwUZj+RknDO
 TuhqeosQIbo6kh2OMoaFl44FY+GN/LYsS8rpyScPWRN/hENXE0zWThqfE w==;
X-CSE-ConnectionGUID: 1PTP0js0RSyBluj2V2VIAA==
X-CSE-MsgGUID: dA3gN9fdRM+8Jmnv/sadvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12156168"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12156168"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:38:52 -0700
X-CSE-ConnectionGUID: kbxuBW3EQFqlDWllAQ8eyQ==
X-CSE-MsgGUID: oCls0N6NSkKZWwlwMWtM5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25840588"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2024 02:38:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 0/2] Use hmm_range_fault to populate user page
Date: Fri, 12 Apr 2024 15:22:35 +0530
Message-Id: <20240412095237.1048599-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

The same helper will be used later for hmmptr.

This is part of the hmmptr (system allocator) codes. Since this
part can be merged separately, send it out for CI and review first.
It will be followed by other hmmptr codes.

-v3
Squashed patches 1 and 2.
Address review comments.

-v4
Fix commit message.

Oak Zeng (2):
  drm/xe: Introduce helper to populate userptr
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  11 ++
 drivers/gpu/drm/xe/xe_vm.c  | 117 +----------------
 5 files changed, 273 insertions(+), 111 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

-- 
2.25.1

