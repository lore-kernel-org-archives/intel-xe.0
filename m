Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003DFC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86F10E191;
	Fri,  7 Mar 2025 18:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAgCR3h8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974310E191
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372177; x=1772908177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q5g9D8U1aQMAyBZWdFeured8emjnSNiMu4WNnrVO+7I=;
 b=DAgCR3h8OTjbQVmp0xgqM+ad0BbjxveBnNKeHDx/48qxAbsLY3JQo1Jv
 xv3YPZODVMh9cp7TcyjFaZGk8tFZ3oduZ4A5z3MuwoSi4rdNEYEMuqphK
 KH68jR0xtYV+qQBKFFFmGuK/F2DiJeWdm5+wL3sjYMYri4SaO6ODhMnhT
 nTLChzVE0wIV9i+aWxXrsLF6Un7wCSPjq28Jg9L2hnDv8vdFHdkjzq4pB
 r6Fc1+UFD6h52hDNmgGqFXjfFkJSmZDl03WjuExOzT9MPOKhSWrxj7177
 0Y7cThECohJ1DV+WvYCE71PK484F7227eFhlCmeFqv3vDoGjK+pVnlJTW Q==;
X-CSE-ConnectionGUID: sX9+LtDvTSa0Onc4PQ+kXg==
X-CSE-MsgGUID: alp9uHxGSDS2V8F0WeYRQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639840"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:30 -0800
X-CSE-ConnectionGUID: 1mRTmfwkQZqha7M6ad9c9A==
X-CSE-MsgGUID: aW3gJ/NLRxKlqsGQN9jK4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625679"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 7/8] drm/xe: allow non-contig VRAM kernel BO
Date: Fri,  7 Mar 2025 18:29:04 +0000
Message-ID: <20250307182856.304850-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
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

If the kernel bo doesn't care about vmap(), either directly or
indirectly with save/restore then we don't need to force contig for such
buffers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b6d22ba54bf5..501c77ec6161 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -189,11 +189,18 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
 static bool force_contiguous(u32 bo_flags)
 {
+	if (bo_flags & XE_BO_FLAG_STOLEN)
+		return true; /* users expect this */
+	else if (bo_flags & XE_BO_FLAG_PINNED &&
+		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
+		return true; /* needs vmap */
+
 	/*
 	 * For eviction / restore on suspend / resume objects pinned in VRAM
 	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
 	 */
-	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+	return bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS &&
+	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
-- 
2.48.1

