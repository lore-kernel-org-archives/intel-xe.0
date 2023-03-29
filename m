Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C539C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D678510EBD6;
	Wed, 29 Mar 2023 17:34:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC910EBD6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680111234; x=1711647234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZIosw29XLoRZ2QXXRKdy7ZOh/6qk7d/O3RmSzVBEiro=;
 b=ngoRsOUnVdHV9ETNpHHcuASHmK2SCH9sp4i8izUDES/xChVTX5qwR6nx
 HgM1u9kQI+284wH9gv//wGIugIndfHUn0kFaXdUn14d7LO3j3I/ON7LDi
 xs5NuaeTWj7hhh2mtKETLE/hz5qO/bJkUkNIp3zlj6xQ96l2lcfp+NvVg
 uNWJQ1eFvMZAhoxleygCiA6ZXd8+IGHRg4/y7vJxkSXf44/mvT3xYCGcc
 w+DQllBYXjMwxmN2U+Xj6XV9cIB9YxZA+9sQMSaOemtbIZNpvlMXIUx6S
 7VbA7JaLNhMMzK4uVZWfpGKoB+ydPB+yRHZgYSEmadirqrLcwJYCxzva2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405896904"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="405896904"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677854292"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="677854292"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Mar 2023 10:33:34 -0700
Message-Id: <20230329173334.4015124-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Don't emit extra MI_BATCH_BUFFER_END
 in WA batchbuffer
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The MI_BATCH_BUFFER_END is already added automatically by
__xe_bb_create_job(); including it in the construction of the workaround
batchbuffer results in an unnecessary duplicate.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fd7a5b43ba3e..bc821f431c45 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -203,8 +203,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 			bb->cs[bb->len++] = entry->set_bits;
 		}
 	}
-	bb->cs[bb->len++] = MI_NOOP;
-	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
-- 
2.39.2

