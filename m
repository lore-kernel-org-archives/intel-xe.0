Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79329C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 14:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4410E231;
	Mon, 12 Aug 2024 14:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8S0aRLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A03010E231
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723472037; x=1755008037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLTlY1dWLUqi51wzLbjZeIdkOJbup70Wl8AZdJcYqzM=;
 b=N8S0aRLfvQnrYCQ5XLjCepdP7W1aiQ3bFwzF3VGZLNPoezUfYD6QCMj+
 tm7lu9CjuxLcqhvflG00UiQXcg1t3LdnxpOVar5ZyJuirhcWH5qbRQtsV
 hR9mAL+bh63QHTNjnCKLzaVA9LYBbGw/yghdZ20kt2HJf7IeSrIhWQ6Qx
 TfYPhKFxmf/d7fUAXLFvLyFKcxi4G5eQGrqudhw9AqiIRRUd788GiAWRw
 JSWXknF1rFgo5Ga0ZRpcIzrU3z8gjbHvo5xyJinMfRx5NBrrpkvrBv31f
 XjUOHDObxSlChb/lRi02L+mdERoe6CeMRx97IClruMfO5++SyP77TS1ZZ g==;
X-CSE-ConnectionGUID: mvZ2tfjhTG+XI7nzLdaW7g==
X-CSE-MsgGUID: KP1a4BXGTlK7yzfB8fKEQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="46984004"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="46984004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:13:56 -0700
X-CSE-ConnectionGUID: ouORB+qZRpmcCgjEonWBPg==
X-CSE-MsgGUID: a4KKMlpkRbaXO93kzfM3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="63126843"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.46])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:13:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: fix engine_class bounds check again
Date: Mon, 12 Aug 2024 15:13:32 +0100
Message-ID: <20240812141331.729843-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

This was fixed in commit b7dce525c4fc ("drm/xe/queue: fix engine_class
bounds check"), but then re-introduced in commit 6f20fc09936e ("drm/xe:
Move and export xe_hw_engine lookup.") which should only be simple code
movement of the existing function.

Fixes: 6f20fc09936e ("drm/xe: Move and export xe_hw_engine lookup.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 402dfa748e16..e195022ca836 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1189,7 +1189,7 @@ xe_hw_engine_lookup(struct xe_device *xe,
 {
 	unsigned int idx;
 
-	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
 	if (eci.gt_id >= xe->info.gt_count)
-- 
2.46.0

