Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80418C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421B310ED1D;
	Fri, 14 Feb 2025 17:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRrG90oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4EF10ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739552751; x=1771088751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=66gyt6cTwBJDDWI1P5oEyVyLndAmVxIQ+ulUXvD5U04=;
 b=gRrG90oqp6mWEe5RVokwaQ4fESYC0ZDDm3SM5cY6UwxAImsthuV2LG8E
 H2C4Mqi0/w1j2oVTP/TMOUH8ZgmEOh58M5j0fsiTFfVTffIpe2h6I9yvb
 7TBqJiqiv+5nYnThFJRJVa8z5nujMhTC7c/GzgZuuhT+j9kAW/+/WEpAK
 MIRIWvvSlEPDwubZwX2Q9accC+wg7MatRHvwP336aNUdhr9hWLg+Iu0se
 cc6TpWhPnDyuC5Pi2QCrJJ3XbaVJiKPdKl1R+6X9L/SELPdoLp4eMrrsa
 wYiZG1sTzOxspGiCa09tgV7pcKIuoF4vBmVcYKY9pX6d0xktct8ZE6HzH A==;
X-CSE-ConnectionGUID: 6L5rrAISRlqZr2RIrABbfQ==
X-CSE-MsgGUID: bs55VpWVTt+1GtnZgd8vsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40575946"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40575946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:05:43 -0800
X-CSE-ConnectionGUID: TvbqDabCSKOBGE39TwmphA==
X-CSE-MsgGUID: omZppB3bTFKFNqjJS/n22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113235224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:05:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 3/3] drm/xe/userptr: remove tmp_evict list
Date: Fri, 14 Feb 2025 17:05:30 +0000
Message-ID: <20250214170527.272182-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214170527.272182-4-matthew.auld@intel.com>
References: <20250214170527.272182-4-matthew.auld@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f36e2cc1d155..62cd71218afa 100644
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

