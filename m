Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD558CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 06:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481110E27A;
	Thu,  4 Apr 2024 06:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIkvZ+UG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7810EAF0
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712210576; x=1743746576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2GPqPQCm/YxKPh0XX59T3Gf918z/OKhzJY0BVsQUpEQ=;
 b=kIkvZ+UGy6Bzy8498CFOJV088Sprdp//qkb/JbZClWRNJ37VydQ42ebz
 B3zFkRiIsElw0iTlGCwcboURRHrV4CNoIkFSp4tgaJqtvTWZb0Lp1b44e
 NBU9KJdpjQkoaauJESHysgIMqOGTmDmPpsWsSnoiY9CAqtN6R+yw2S4yP
 bAf46W1boeo+geA9L2aZhiOv1fLCPU9c+f21Rp8gKW4RVAaTQZT3wKPTy
 dvICQZA51Zycj5MQ3FP2pbFbu3GKVa5EXqKBvmTHEQw0biprtO0expuYq
 5Ju8y4VvtZ4uoafAKiyFlzZXFEXaciashqo0IKtlvTOm//yJdEjWimmfY Q==;
X-CSE-ConnectionGUID: q0OUETXYS4qHgq1ByKuS8Q==
X-CSE-MsgGUID: /dvPf7lOThm4Lv65kMMOww==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="8053049"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="8053049"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 23:02:55 -0700
X-CSE-ConnectionGUID: OAACY38+SzCGSLpecm7YEg==
X-CSE-MsgGUID: t40wGeMxRa2F6CqGyo9RmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18657155"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 03 Apr 2024 23:02:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 0/2] Use hmm_range_fault to populate user page
Date: Thu,  4 Apr 2024 11:46:29 +0530
Message-Id: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
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

Oak Zeng (2):
  drm/xe: Introduce helper to populate userptr
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  18 +++
 drivers/gpu/drm/xe/xe_vm.c  | 118 ++---------------
 5 files changed, 282 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

-- 
2.25.1

