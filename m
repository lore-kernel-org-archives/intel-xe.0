Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2880CC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 13:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64D110EAB6;
	Thu, 13 Feb 2025 13:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljMNQWuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30E10EAB3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739455109; x=1770991109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XIOHcnEM3sQs81zifD1Y0dIYu8kx+nEJWl9S49RxKo=;
 b=ljMNQWuYt9z6lZ4xF5xbXnk94HMTDfFrPuWtyZveT5i6wDiSEzLMVMRU
 puE3IwhgSoXKE4gscaMslYmUJpvD946WyFEyjTzt04OkEDW+x8U0rO5e0
 wyG40Fl4m0ezM7CxkS/dDZyw8+UlfIsuuVD0/q8Q0JK2gP3qsxxYK5pe4
 hdzwY0LpcKJXY9nk74uVlXsO1Tz72urq1xejP2X25xg5YT9C7HsE+js2x
 LpEnKe+AS7ZjsPkRTsvJ23LkKt/lDe07b8msxVZPxExFsTSeNCWckxB6I
 69TzNSe377g+M2gPlv1C31c/Y6xC8yPorjdkkctgRUmjz0n3a8PhZw97j w==;
X-CSE-ConnectionGUID: bHUpEdMDSS+H6mXihK0dvA==
X-CSE-MsgGUID: Jmx+khipSAexv/eVAAE+cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40020315"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40020315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:58:28 -0800
X-CSE-ConnectionGUID: E5b19jklRuuI4/DnwrYPIQ==
X-CSE-MsgGUID: 5MA/JZBPTS6pdhtEOXWGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118081438"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO mwauld-desk.intel.com)
 ([10.245.245.31])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:58:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/xe/userptr: remove tmp_evict list
Date: Thu, 13 Feb 2025 13:58:10 +0000
Message-ID: <20250213135808.189144-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213135808.189144-3-matthew.auld@intel.com>
References: <20250213135808.189144-3-matthew.auld@intel.com>
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

Doesn't look to be used.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1caee9cbeafb..2d8f99c7c3a9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -660,7 +660,6 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 {
 	struct xe_userptr_vma *uvma, *next;
 	int err = 0;
-	LIST_HEAD(tmp_evict);
 
 	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	lockdep_assert_held_write(&vm->lock);
-- 
2.48.1

