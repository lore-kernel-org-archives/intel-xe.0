Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C87BECE589
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 22:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF510E33A;
	Mon,  9 Sep 2024 22:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDs3m9rc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662A10E33A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725921087; x=1757457087;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3tLhiQbmNzVeP5E5iIijKFyxy6e7PrBGdmseTAiDo1M=;
 b=QDs3m9rcBaMz+VpYK9LPFPuwr63eTc3ZUMmOj7BWzJie0y7i2tibrvYY
 kjA2V1rYMDb9W0zIWM0rtZQK/Sp9lLvSDrqpH3fD4vLSr5wWEtdvf0i5y
 SDZ7lmhZPmfhLcF8W4FC6EZOYMh2erD97qwdluhIkC/iwrWMEX5isZTjm
 pNkV16nxNq/jRcBQKAlpEAf5uvNjXvntgjzdseZae1rAGZyAarV/6Brur
 45WctnTCr9bQcgA7TIfuz90zzXG53BYlH3ENSQ0lH9BgEVnrlSvYIe1Rx
 EPXCktjd2w0fhWE/tFeKg+UZS+u5dURuKjWB6HW6DBGG7RFBKq34jdR8h Q==;
X-CSE-ConnectionGUID: qmi9xy2YSw+kFLjbHAFbsg==
X-CSE-MsgGUID: Olj8+vuUSKKpP9nZN4aJFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35309101"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="35309101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 15:31:26 -0700
X-CSE-ConnectionGUID: FmDbGaR8R2i12BHTkc4ezA==
X-CSE-MsgGUID: HM78IaKGR6yFLpoDZTpZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67073472"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 15:31:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Flush all page faults when closing a VM 
Date: Mon,  9 Sep 2024 15:32:24 -0700
Message-Id: <20240909223225.665761-1-matthew.brost@intel.com>
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

Needed for SVM work, doesn't hurt so posting now.

Matt

Matthew Brost (1):
  drm/xe: Flush all page faults when closing a VM

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c           |  7 +++++++
 3 files changed, 24 insertions(+)

-- 
2.34.1

