Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB157CA5FC1
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08A10E046;
	Thu,  1 Oct 2026 03:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYQzyRWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3D10E046
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790825546; x=1822361546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jiR7WxSCXqEcTd/DdXTHogACYY7+vDr4tm+IG97U65M=;
 b=EYQzyRWpbIWbs/LFAk3FbEz2wjLe/OLcOWfpi5tRMXtzaWh2790yMe4q
 mRmzG/v02bUjZsHmF7jIbN5+2R9dVRGEgwEw2lkL3R28Yd/Bh10TGcfrJ
 +2JHb8MxWOwG27nzz0DhhfE4LhmG7qKZ1eRfW/7qlbDIe8rECuKA0dJEn
 QNRLdZxUiPiAdUQ6oCKjt5IXW+NoJQOFPpYIsZtvAMFVjFh8CExXLV6Bk
 5hRt8hv5VMWhkzEMnJX+cRBVkzY03YX69GT75qEKjnloWF7hdYoSsHQCK
 sJ0LQ175L1nk0hswll+Hqi7WfFF1VSpACARCQYQdwYipqzAsitEGnnoBU Q==;
X-CSE-ConnectionGUID: nkSGAlBDSaKiEiUi1KIjvQ==
X-CSE-MsgGUID: 9Nnr0EDsTqSgHpn5QqfwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113362881"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="113362881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 20:32:26 -0700
X-CSE-ConnectionGUID: YyojnAeHToSoTq/x1RU5Yw==
X-CSE-MsgGUID: khkSmxMkQJmuQXxBnC/VWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="275909697"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 20:32:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 0/4] Refresh TTM LRU on SVM prefetch
Date: Thu,  1 Oct 2026 09:06:03 +0530
Message-ID: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_svm.c   |  68 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h   |  18 ++++++
 drivers/gpu/drm/xe/xe_vm.c    |   6 ++
 include/drm/drm_gpusvm.h      |   6 ++
 include/drm/drm_pagemap.h     |   7 +++
 7 files changed, 200 insertions(+), 25 deletions(-)

-- 
2.43.0

