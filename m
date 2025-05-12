Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65825C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F09410E4B3;
	Mon, 12 May 2025 21:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwEEnwmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C3E10E28F
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747086810; x=1778622810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BLIR7r+XSA9pHeGn1i9Sj4+9canS4kMPNq15BWG8EsM=;
 b=RwEEnwmWVyDPSUNNJ8+Dv1VZmFvc4yzghFvUbjPTsrm0OqG7i/Ki8OHh
 vYcTs9B3z3+fv9jWFKbO9wgSsnGeZYkuK0EQimx4jnCMhYu7E2CiUz9rV
 1e1BFK4pGtXKtbgbAC/tRGzvcUBUSPlz7FboQKrPW3BMzZxgo+MHjrXcz
 0eMEPlZzzXOSU4wVIP4tW+Xak+PjTkHvrXQZvfM62dIorzzOq5iJV80Jh
 XrnuOdZxPCWGlVkEoxR6zNSDJuSjZ0CBoPc0Mtjd1kiXrIs3NDJ17tHcI
 k/puKRvrQwQSC4XK7RA+GMMgvJa6pNACJuR3N7MorzZpJSdVn3Yh5deni w==;
X-CSE-ConnectionGUID: 67A6THm8QFKwzho87kTtAQ==
X-CSE-MsgGUID: +k3Wuo+ATNue5eyoWihRMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48156815"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48156815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:53:25 -0700
X-CSE-ConnectionGUID: 0SLF1YUOT9GQ8cJ3rImkFw==
X-CSE-MsgGUID: Aso6KfBlQG2Of3uLEJTG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142375163"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 14:53:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/4] drm/xe/guc: Remove double blank line
Date: Mon, 12 May 2025 14:53:21 -0700
Message-ID: <20250512215324.1457009-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

An earlier patch moved a drm_print a few lines lower but accidentally
left a double blank line behind. So fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ff6edf1b14f4..b09dd5788a27 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2013,7 +2013,6 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 		return;
 	}
 
-
 	/* Can't generate a genuine core dump at this point, so just do the good bits */
 	drm_puts(&lp, "**** Xe Device Coredump ****\n");
 	drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);
-- 
2.49.0

