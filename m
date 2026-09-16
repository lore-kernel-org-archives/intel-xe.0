Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA02AC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983210E37D;
	Wed, 16 Sep 2026 11:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGG6XjGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CEC10E37D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557908; x=1821093908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8iQJKEnbljhct1zsOGeGyFpS+ar6l2pElAJfm8CX6pU=;
 b=QGG6XjGIQhucITNVGXnR+gZu6GWbwk2VQ+wgi9KCpwSuWXUzYO9sqq8E
 u5n1wLsVeFATqvk8Mzv+kbkRxWMahCtcCw+10ex00BbvzEox6Ynueei9T
 Lu4kerThgj+l78OcXN0lNATXz0OqdixMrut9rnUtlUPGFTUQWhr760gA9
 /MPL8i7R9XAaqzkj5xJ8hAM6TV7KUUDZ8WZ7OzBpit2PE5YsFBBddp/Zh
 DUosvBhWFIqb+mQBU8rZLRN0m8QouX3ShCCpaxsGe/f540HPB4SJ+M80k
 N20cOgmeWFnMVk+BhvlPp62vxuvx1ii79JfwewQOX8qZPUg2BbSEDHSXh w==;
X-CSE-ConnectionGUID: T6n7pEhDTUisiBs61Bq8+w==
X-CSE-MsgGUID: NBzcg7HCS2uI7fKDceG+wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89067444"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89067444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:25:08 -0700
X-CSE-ConnectionGUID: TWFTsQeyR2W8iPD4r9nZ9Q==
X-CSE-MsgGUID: 4NLgTOtsRlyny14KVat2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275276306"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 04:25:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 0/4] Refresh TTM LRU on SVM prefetch
Date: Wed, 16 Sep 2026 16:58:29 +0530
Message-ID: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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

 drivers/gpu/drm/drm_gpusvm.c  | 88 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_pagemap.c | 15 ++++++
 drivers/gpu/drm/xe/xe_svm.c   | 53 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h   |  6 +++
 drivers/gpu/drm/xe/xe_vm.c    | 10 ++++
 include/drm/drm_gpusvm.h      |  6 +++
 include/drm/drm_pagemap.h     |  7 +++
 7 files changed, 162 insertions(+), 23 deletions(-)

-- 
2.43.0

