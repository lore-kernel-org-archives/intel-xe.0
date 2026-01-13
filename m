Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518E6D29DC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 04:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88BB10E2E9;
	Tue, 13 Jan 2026 04:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/VkDV7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387C810E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768278558; x=1799814558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jRdqYJlUf2qdu6NVOqrMcJoQDcshXhPssT2vvamffaI=;
 b=G/VkDV7NKmKyD3RWu5M6++/5AhNHGTFWVL4bKMtZcuoI5IBJby6CH+Aw
 wi809UNg18UMv+Po5FsIM1Bgpt/NH/3BMylG0Bwd1g/PVVrN8yFuT9+VT
 t8c5agyK/3zeCHhvKqrdj97DX0wDXWUYFD7rPSu4/djyndgqGZHE3pEw3
 JNV3Sq+ixxl+sXNLeoffq92Erzf4WDkTzeczIpWnbhI65K+wh4gzY1fA8
 w3wHRa7YHt5gcK1MkJET5IxFJQBAS8DDNuUEGCtZk+UNldsmsk3+7p0JM
 7nfNR8DTh/Nmv8nBr4GOp/rn9WOPuneTc7bSPmjGHKA4JGFiU1jvRD8/t A==;
X-CSE-ConnectionGUID: RcHD9YFvQkaVkfbqNKywEw==
X-CSE-MsgGUID: pwgNdkp9T8SDVH5O8DvEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72141439"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72141439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:18 -0800
X-CSE-ConnectionGUID: uPY5WtS0Q2mMKj/ry3oIRQ==
X-CSE-MsgGUID: DHL3iNTISmSGx2A6noPWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208793269"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH v2 0/2] Enable multi_queue
Date: Mon, 12 Jan 2026 20:29:11 -0800
Message-Id: <20260113042913.3517169-1-matthew.brost@intel.com>
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

Fixup job timeout support multi_queue and enable this feature.

Matt

Matthew Brost (1):
  drm/xe: Ban entire multi-queue group on any job timeout

Niranjana Vishwanathapura (1):
  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc

 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 103 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 3 files changed, 83 insertions(+), 24 deletions(-)

-- 
2.34.1

