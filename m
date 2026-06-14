Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E5CD98C5
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jun 2026 21:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837DA10E130;
	Sun, 14 Jun 2026 21:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTU2c/s2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B4010E127
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Jun 2026 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781471996; x=1813007996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DOQiRkmRkvxJQ0AFy51ZtivOWfJMKBnOZczOBnWGCXU=;
 b=MTU2c/s2caHa7m5SQXrWFaDx71s3EGalG2gKCxPB60qKmjpNAV9NIeP3
 EhOi/z5OwRNauoBDiufd48H6Qe8ZQGhyol6Zg7Mw/BUlUZQJ/4Tz4Man+
 8pjfbF2denEpbZNJfq7bCV/lZBsb5ZgdhpmwUxdoH295pTqitQl3IITXw
 t8g311fB6hj0F9h+Wph48urMHO8COcK3lS5+bWtKylvjWJuLcOe8T9ewy
 xXETpmvpsNcmbyFU59ScTX8Sv2+w/VqXQLnzuUx9nVO70F6mQ9zhbXVKn
 FaBikUvOd1gOQ4RmIpZSB8ovIC80PfTVFQnwhPC2kjUEbNGTcUKfM7uax g==;
X-CSE-ConnectionGUID: EACNldKcSpiaPU7kJuc2jQ==
X-CSE-MsgGUID: dz4WDHnkRM+1vrGo5FPwIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92776312"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="92776312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:19:55 -0700
X-CSE-ConnectionGUID: JCra4g1CS7uWnjdQtCs+Fw==
X-CSE-MsgGUID: SiUmF/R0TpyKRc/HUFMduQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="246412289"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:19:55 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 0/2] drm/xe: Reference count exec queue suspend/resume
Date: Sun, 14 Jun 2026 14:19:39 -0700
Message-ID: <20260614211944.1268917-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a reference count to exec queue suspend/resume operations
so that exec queue is suspended/resumed only once when there are
concurrent suspend/resume calls.

In multi-queue case, as only primary queue interfaces with GuC
for suspend/resume operation of the entire group, forward the
suspend/resume operation of secondary queues to the primary
queue of the group.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (1):
  drm/xe/multi_queue: preempt primary on queue group suspend

Thomas Hellström (1):
  drm/xe/guc: Add suspend refcount to exec queue ops

 drivers/gpu/drm/xe/xe_exec_queue.c           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   6 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 159 +++++++++++++++++--
 4 files changed, 159 insertions(+), 14 deletions(-)

-- 
2.43.0

