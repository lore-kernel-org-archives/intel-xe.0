Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF4CFA773
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 12:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5D710E2A8;
	Fri,  4 Oct 2024 12:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+lTZN2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3B010E2A8
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728045593; x=1759581593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zy/teiXHDGFCcHEdNxN0i5JNMpyBQfLZWaNspVof6fQ=;
 b=g+lTZN2P5dEdGqFRGDdLIWBLUcCp4SLENaqNlbRbk76GfAdQW9BUqHdY
 xYktJapuyMRRLiiZ15uPmOV5ZtuoAf3EFhngDWDN+rxc+GkOHuTZEdCKT
 1zDVLVWq98IKK4wyJGPI21GosaZcVIYNrIAJPDODWzn+nletnqHWMnVKD
 vQMMXN9jlvcVgAFflkfHnqq1WgntQBR9MMePKqoDnMu/5CwnvAXGzWulD
 BIoYuddRdXOKxaR3JasQJUH4FuRL+5He7KgT31t6KIkAIkP0zc1TzSWwm
 5gqxuw3V7MHtYAoyHsNAeesJiLxpsZ+gQ93x94CJBJCoOqbBJHGZZp83e w==;
X-CSE-ConnectionGUID: snHLE6+5TFCZFiaEc6f8CA==
X-CSE-MsgGUID: x9NMxAnrTcONMaYPYGItWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37923333"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37923333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 05:39:52 -0700
X-CSE-ConnectionGUID: 6ALUgwF+TDWC/TO+9sOenA==
X-CSE-MsgGUID: FqpZcGMrQ7maNsswNb0w/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74707520"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.128])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 05:39:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/tests: Fix the shrinker test compiler warnings.
Date: Fri,  4 Oct 2024 14:39:22 +0200
Message-ID: <20241004123922.38904-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

The xe_bo_shrink_kunit test has an uninitialized value and illegal
integer size conversions on 32-bit. Fix.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7d3fd720478b..1562c08aaf34 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -440,7 +440,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 	LIST_HEAD(bos);
 	struct xe_bo_link *link, *next;
 	struct sysinfo si;
-	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
+	u64 ram, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;
 	unsigned int interrupted = 0, successful = 0, count = 0;
 	struct rnd_state prng;
 	u64 rand_seed;
-- 
2.46.0

