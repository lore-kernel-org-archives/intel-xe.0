Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2651CCEFCF5
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 19:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB55E10E54A;
	Tue,  6 Jan 2026 19:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="On1yjReX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E1210E548
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767726657; x=1799262657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLlCfB5ada89KLuyqgj205McZ38IRWwO1Dg3FiQ2M6M=;
 b=On1yjReXrSeiPILAhqr0w7vMwDayrZxsdSEuN31FEnsexUJE/8AJucI0
 s6E1IMpV88TAvTKCL9lGkLf+eVNnaEouysA7BlwgG9ojKe0ci7EJ9vR27
 DjmXzlzTbTUsf9VqeYC7U2gM/GU4IiBmr8V7qRQMxaHHIrsgG1FkkOnqu
 dIn+F2Fr1k9cL6GFmeLCHVqrvPnY+rhCVdCLCx5xX/vxwQiqGRo0Gvmix
 Xn0n1jgudw5EfqrKajP5gBMmgtC0Zp1P+7rrDyukDGZxgjKOzSkI/fmEX
 50pd4FfNDb1A7x03p+A91EbB8qH4vBVUe8gYxAEytPRo/1wMM7/Q+ArH4 g==;
X-CSE-ConnectionGUID: X1deGcbgR0qa0VXlwc4WHg==
X-CSE-MsgGUID: AHBSWgJ6RZKaWwt7xJhXCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="71671917"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="71671917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:10:56 -0800
X-CSE-ConnectionGUID: yapdDnckTKCwK+iHIrZlJg==
X-CSE-MsgGUID: /emrxnY6TkO/p2iD1z8fdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202493303"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:10:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/2] drm/xe/doc: Remove KEEP_ACTIVE feature
Date: Tue,  6 Jan 2026 11:10:51 -0800
Message-ID: <20260106191051.2866538-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106191051.2866538-4-niranjana.vishwanathapura@intel.com>
References: <20260106191051.2866538-4-niranjana.vishwanathapura@intel.com>
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

The KEEP_ACTIVE feature is being reverted, update documentation.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 529a40ca4002..b5737563ee14 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -84,9 +84,8 @@
  * group is destroyed. The secondary queues hold a reference to the primary
  * queue thus preventing the group from being destroyed when user destroys
  * the primary queue. Once the primary queue is destroyed, secondary queues
- * can't be added to the queue group, but they can continue to submit the
- * jobs if the DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag is set during the multi
- * queue group creation.
+ * can't be added to the queue group and new job submissions on existing
+ * secondary queues are not allowed.
  *
  * The queues of a multi queue group can set their priority within the group
  * through the DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY property.
-- 
2.43.0

