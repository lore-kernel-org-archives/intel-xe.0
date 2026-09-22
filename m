Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBD3C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 04:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523810EB12;
	Tue, 22 Sep 2026 04:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCnMe6tR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ABE10EB12
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 04:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790051671; x=1821587671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uT9A2QkkqHP2YkAaMjPirpde0lRcn77nuKjvo3cCUv4=;
 b=JCnMe6tRPh2+WdnRpZCjed0cOj4CA7RHBqaNs5H4vQHBPtGAqT7GYqfe
 jHwx//isrFSOuaAYNOjy/MIzo6d4AhEJqV4DNMeFQ3TMpPu+yrx2DWTtM
 tR5jLiZUKHCacYNPPXkYwcfUm8VyRPFW5jYCmo8XEd/QQxzurZPmE576h
 /jdDXsEgwRR57bpD5LqA/V9fl+dGr3OpLSZjS5LdteWkozGLrUnDSLYBk
 c/KdPdzUHNp1zDV0HnJnrJ62AV7NxheZszf337bLEl4rM0N0SpWJ9ui5F
 oxDzaddpbv6CetuurRZyb9k6wDuiK379na4jyFzBdVSfgj8w/5xbZr72D A==;
X-CSE-ConnectionGUID: M7EM5VpCSR211CtfYRuEJg==
X-CSE-MsgGUID: P55AeUAGT+y+PK8NnZIojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78175376"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="78175376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 21:34:31 -0700
X-CSE-ConnectionGUID: qrLNP5fLTneN/FBdYSJnpQ==
X-CSE-MsgGUID: klTDcJ+OSI+H3xbrwH5NnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="269489199"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2026 21:34:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 0/4] Refresh TTM LRU on SVM prefetch
Date: Tue, 22 Sep 2026 10:08:00 +0530
Message-ID: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
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

Himal Prasad Ghimiray (4):
  drm/pagemap: Add helper to access backing devmem allocation
  drm/gpusvm: Add devmem callback to get_pages
  drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
  drm/xe: Bump prefetch BO LRU for already-valid ranges

 drivers/gpu/drm/drm_gpusvm.c  | 105 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_pagemap.c |  15 +++++
 drivers/gpu/drm/xe/xe_svm.c   |  64 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h   |  18 ++++++
 drivers/gpu/drm/xe/xe_vm.c    |   6 ++
 include/drm/drm_gpusvm.h      |   6 ++
 include/drm/drm_pagemap.h     |   7 +++
 7 files changed, 196 insertions(+), 25 deletions(-)

-- 
2.43.0

