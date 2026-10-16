Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB84CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2F10E0B7;
	Fri, 16 Oct 2026 13:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4D10E0C1
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792157759; x=1823693759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZPKnHzmnPvR+pTdU/JKk7q6aoJOo0mB+2Y59rx1Fn0=;
 b=WNAr9ahEfcBH1X/VAqS1v3YdF5ZnNmugaB2CCBciZenKsAdYWQa0zqsa
 GW2OQIDlNawjet4tgrrz0ZiVgnkIcL6GVyVOu/U6rQ5a2aDLoAxJ2kL/v
 yqe+xmLgNechQPvP0PrNDXXkFHFm+7xXlCATjbpaPYcflXFvpl9mdL8JL
 tJZKEAvKhWceDjx4FSbkqbgwlDWlI76Gb5OT5e08WKtnQkOHCjVYNUUYv
 YwKuLSB70VWiwoUKY+hkWF6xW/bxJmfAJmTzIrkEvx8TEd6iIW76qrxXE
 N5p1k6SqaJbkw88CPMPIg+r3mKDiWFvxiWOj3P5DMNazppPxwDn6k9LWm g==;
X-CSE-ConnectionGUID: NodlR3y4TNOf3Di1ZA44vQ==
X-CSE-MsgGUID: 51V6qlw0TAyzpDrKi4J4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831442"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="831442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:35:58 -0700
X-CSE-ConnectionGUID: 39geqrgSQLO7YnmFDslMYg==
X-CSE-MsgGUID: JAMgY4FHRiyIEEdPtuhI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2273469"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:35:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 1/4] drm/xe: Don't abort the shrinker walk on -EBUSY
Date: Fri, 16 Oct 2026 15:35:20 +0200
Message-ID: <20261016133523.3622-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
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

xe_bo_shrink() returns -EBUSY for bos that can't currently be shrunk,
for example imported dma-bufs, bos whose vm is currently validating,
bos that are still busy after the wait timeout, or bos whose backup
fails. The shrinker LRU walk treats any negative return value as
fatal and aborts, which also skips the remaining shrinker passes.

As a result, a single such bo, like an imported dma-buf on the
XE_PL_TT LRU, prevents reclaim of all bos behind it on the LRU.

Skip bos for which xe_bo_shrink() returns -EBUSY and continue the
walk, like the TTM LRU walk does.

v4:
- Patch introduced.

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.15+
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index deb4378c1ec1..4e4da76936f4 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -113,6 +113,9 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 				continue;
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			/* Like the TTM LRU walk, skip bos we can't shrink now. */
+			if (lret == -EBUSY)
+				continue;
 			if (lret < 0) {
 				ret = lret;
 				goto out;
-- 
2.56.0

