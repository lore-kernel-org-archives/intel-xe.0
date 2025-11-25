Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB99ECFD379
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 09:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACBC10E3A1;
	Tue, 25 Nov 2025 09:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mveTJVMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DC310E39A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063843; x=1795599843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m8w8SwVMHxDMlV4rC+zwWLYInw9722mLgmTkB4K7Jes=;
 b=mveTJVMiznWN3MO95ECrKENxlOfoBqnhOGSe+o6rjR9YUj9C6L5+5aLE
 cNXND76SkT+Z8UihMfaYe3ZLtRV90sXeSuoxsXXcR4eEBoMXn9Q+CvQIp
 fWSAE1p7jwSWEcEN6oOTifNQJ36WWTVqJjbr7Zd3u+4QfH4M2xYAcVSLa
 oXKHrvOlMnoNckLUf22RY8ALo6U0q5yUqsvp9GLxk88z05MblvUpi22q0
 CAaBGoP7KAbvPyzOsamHyRkqXGolt/MlHcm3KSXf7FGaEj03ylHjwDlD2
 thUhmvqJv9Agnjg+CXtpc3Ez6eMSmTgvzq7Q6bpXDwWOeBUFmYuSzK0Om A==;
X-CSE-ConnectionGUID: 7OXFarIAT0amKylrWaPXKA==
X-CSE-MsgGUID: x8KqMYQuQQGFPcXAHnX9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69934126"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69934126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:43:58 -0800
X-CSE-ConnectionGUID: SQ2FJU00T2aF9ervHY4c/A==
X-CSE-MsgGUID: P8ROMApBSzqvGwntwWQVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192405207"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:43:57 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/3] drm/xe/xe3p_lpg: L2 flush optimization
Date: Tue, 25 Nov 2025 15:13:32 +0530
Message-Id: <20251125094335.12028-1-tejas.upadhyay@intel.com>
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

The optimization involves two key changes:

Hardware-assisted Transient Display Flush: 
The new hardware can automatically manage the flushing of "transient" 
display data from the L2 cache. This eliminates the need for manual 
(software-driven) transient display (TD) flushes by the driver, 
simplifying the code and likely improving efficiency.

Transient Application (App) Cacheline Management: 
The hardware gains the ability to flush transient application cache 
lines more efficiently. The patch handles the necessary integration 
to utilize this new functionality and manages manual flushing where 
it is still required, ensuring data coherency and optimizing 
performance. 

Tejas Upadhyay (3):
  drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines manually
  drm/xe/xe3p_lpg: Enable L2 flush optimization feature
  drm/xe/xe3p: Skip TD flush

 drivers/gpu/drm/xe/xe_bo.c       |  3 ++-
 drivers/gpu/drm/xe/xe_device.c   | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h   |  1 +
 drivers/gpu/drm/xe/xe_guc.c      |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h |  1 +
 drivers/gpu/drm/xe/xe_userptr.c  |  3 ++-
 6 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.34.1

