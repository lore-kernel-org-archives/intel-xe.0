Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC8CAC59F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0910E103;
	Thu, 18 Sep 2025 09:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdxMRPnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBCC10E0F2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758187350; x=1789723350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o62IgxppByvf1UamDAzQ6GW1JgxOKWtl1wFnIbCsGIw=;
 b=KdxMRPnVoSmRJxh9A0BrkQRyOiamL5MbW/Hj/pKg9jS0UMgtSZxJkclh
 es+18vFEVQeh2ktH3f3zLihXmdoWJ8b/nuSru0AZFqn0xYDqXMJUsbDoG
 KHPU8OSA5zMOc2vBeqlvxbmU6ZKa0Id4rYQowShfYrTzY2N8frK0hhhu6
 4+DLz+rz+prZMt0CgwY4hSd08rconKhVO16OS+y3P4UX2xd/lGmpXdgBN
 sYUT6NyoRQs72LD/zBUG/pDMWzkM6lV+FYHABiwnIk6sAj+Jjy/W6m2KT
 GQtd/3f4bztvGC0jnDo9XHqWHgflUii4u9C0hAXBP9uZ08LO/XpwnWQu9 w==;
X-CSE-ConnectionGUID: ASxcZw4pSKmr97dcP4sMsA==
X-CSE-MsgGUID: j3rM/WoOT+adx0eft+I7KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48081688"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="48081688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:30 -0700
X-CSE-ConnectionGUID: DBfBCONhQk2GmHHDmiaWHA==
X-CSE-MsgGUID: 6krv/U/2Seq9qWLDRMvQRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206284854"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/xe: Don't copy pinned kernel bos twice on suspend
Date: Thu, 18 Sep 2025 11:22:05 +0200
Message-ID: <20250918092207.54472-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
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

We were copying the bo content the bos on the list
"xe->pinned.late.kernel_bo_present" twice on suspend.

Presumingly the intent is to copy the pinned external bos on
the first pass.

This is harmless since we (currently) should have no pinned
external bos needing copy since
a) exernal system bos don't have compressed content,
b) We do not (yet) allow pinning of VRAM bos.

Still, fix this up so that we copy pinned external bos on
the first pass. We're about to allow bos pinned in VRAM.

Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7484ce55a303..d5dbc51e8612 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -158,8 +158,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
-				    &xe->pinned.late.evicted, xe_bo_evict_pinned);
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+				    &xe->pinned.late.external, xe_bo_evict_pinned);
 
 	if (!ret)
 		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
-- 
2.51.0

