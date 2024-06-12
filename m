Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BCBC2BB85
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F0C10E77A;
	Wed, 12 Jun 2024 02:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lU1Z5qxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8810E785
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158542; x=1749694542;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lE8EU0shY62gbbLD2ah1Wf+kX2F63MTHLyHNAp/1YSU=;
 b=lU1Z5qxoUkfWAqqd7dYkJ7nG3dZ/ut7ssO3jv0ZKn/3e7HSxYIu0n1E4
 J1NAHbWvSVvYtQV+MaRHgMcoNAMtIzwb2iKY5jmlnW/MX2tDDJdzQWY4I
 h6z3fNzf8ooXaOg/EzYAi1d1aX8Z61er5899iT9YJtBw9fRiNnwYnWurP
 Kset+A8EQfNE8w1iVS9eVoUIxhBGZsNewBr/N4vxZB8LBfr16AFcxcN3g
 DfeIDhpXSDlmKYrLRmo4ZIg7IwwNNEO4RkSGvb3Mhjv3yc70zw7/LVUpS
 BneMNTntELfFyhirTTHPNrsczL1jV0tbcd/teptxWA2pV6OM4TalyRB97 g==;
X-CSE-ConnectionGUID: WUPxpAbNRC2EF97CDTmF3A==
X-CSE-MsgGUID: oCy6oOM3QvOhgOgqyz0kFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427830"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:28 -0700
X-CSE-ConnectionGUID: kMIvjo4EQ26hjc38V2VqVQ==
X-CSE-MsgGUID: l+oYJ3+2Qoan8UASbPqpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763662"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 43/43] drm/xe: Enable system allocator uAPI
Date: Tue, 11 Jun 2024 22:26:05 -0400
Message-Id: <20240612022605.385062-43-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a5f732db9e1c..b12af2b39657 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2870,12 +2870,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling system allocator for now */
-		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
-- 
2.26.3

