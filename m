Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDD6C3DA5D
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 01:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C6C10E112;
	Tue, 23 Jul 2024 01:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkKUWeoa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4627A10E112
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 01:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721696504; x=1753232504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RYDt6yAm7kOLHiEJqYUy4hxh96RY//scnOrBBlvtz8s=;
 b=lkKUWeoajkyuow8kOz+e/r6qGjHbrY0SCvJtRwfNyhYQQVt9tDBWYGQj
 x1URu75cuyS6F4Ctn37E+vVI1OtywzghHOngKgkc0l48Hpy2BK9l8QC1I
 TuvxJgZbOt4Fi9yjTTPBPaTDV414/XPXhsIYwY80dueY++FQ3MU8r445x
 9OG8ZSl9LMFYe0O6zcWX4scCAA5Z3AoysWgK4qwJn5EbLi9SmLc5THqyZ
 Rrl0bfNDtSq23FJvMT+hvPedkhROHA99k5zrI9/1Tn54CfSu+j5XXukU9
 /jwsuS1PvUa8eRaKoD7QVOCdHBJ+HG2nKoE6cstir6brp37wpcqeWY5Rd A==;
X-CSE-ConnectionGUID: sybWo3f1R/qB9Sipnd/0Zg==
X-CSE-MsgGUID: t4wtTHWpTbalvz4S4OLhBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19481503"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19481503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 18:01:43 -0700
X-CSE-ConnectionGUID: PnLqIueTSTyMzt1kLGHdPQ==
X-CSE-MsgGUID: vh7n8KnERbCFJ71GaDmf/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="75255203"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 18:01:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Fix xe_pt_abort_unbind
Date: Mon, 22 Jul 2024 18:02:30 -0700
Message-Id: <20240723010230.1652707-1-matthew.brost@intel.com>
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

When restoring the childern PT entries on a bind failure the incorrect
loop index has used resulting in PT entries being leaked. This is shown
by running xe_vm.bind-array-conflict-error-inject on a VRAM device going
into a suspend state after the test completes.

Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c24e869b7eae..97a6a0b0b8ba 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1564,7 +1564,7 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 			continue;
 
 		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
-			pt_dir->children[i] =
+			pt_dir->children[j] =
 				entries[i].pt_entries[j - entry->ofs].pt ?
 				&entries[i].pt_entries[j - entry->ofs].pt->base : NULL;
 	}
-- 
2.34.1

