Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77180C48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53D10E008;
	Mon, 19 Feb 2024 21:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDGzy6dK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1E810E088
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377533; x=1739913533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wczAp8pOovPgLzEoSqABuQs/zorDPd6uzkYBAGtZTwI=;
 b=oDGzy6dKz4fWyUNVkPk0wb6QlyZFShxjFnQfZCX2avePW+Dddn2vL8mw
 6xKuC5JanYfb9Ryua/PHjDzv1VA3K7UE4Iz3wWxuiaLZs78oC6ZkELhI8
 cVgjvJlcwmmyqWSyxhCAooqQnM5fyPbNn0914WqGRMfqKhb8KYvj0aMv+
 9oAq7NTpdqegDa+fJtMtwq322Yj2b+HJp/4TimfE/d7sPVr9VRk98lZRk
 nQnR751ML1Y2maOjfHwkXj45T8sSYJkzVNX4rShTPblDk5M9kLZqnSlTk
 tGtW3ApAPFRC7iH1mAMJNLZVyh53DDp7FGWZW0MbgB5jSQLrUiOzyxLBa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2334994"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2334994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9246349"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:18:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/3] Skip remap fixes
Date: Mon, 19 Feb 2024 13:19:39 -0800
Message-Id: <20240219211942.3633795-1-matthew.brost@intel.com>
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

A few fixes related to skipping remaps.

Will put together an IGT showing failures too.

v2: Including missing files

Matt

Matthew Brost (3):
  drm/xe: Fix xe_vma_set_pte_size
  drm/xe: Add XE_VMA_PTE_64K VMA flag
  drm/xe: Return 2MB page size for compact 64k PTEs

 drivers/gpu/drm/xe/xe_pt.c       | 11 ++++++++---
 drivers/gpu/drm/xe/xe_vm.c       | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.34.1

