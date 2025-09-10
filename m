Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D858DCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 16:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38A810E964;
	Wed, 10 Sep 2025 16:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ/uTQUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3210E964
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757520613; x=1789056613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JP6tk8r4Cz6MMhekThMps39SJcRlBJ2nmFIqp7RYjZQ=;
 b=LJ/uTQUaIImrDFWKSMVEK6DmXcbnnjZONn2qKDo2OmYooHHZHm34bT4r
 cjbUCVna6Pyvo606rQiFpGpO8A0je/qzAoHGuNaL4jRiv6VSOVhjAyaM7
 WseX22B6SQUQJ3DylrNYe+PaR1MKqCXWZiqgU5mve1EXzTlO8lsfUwO5q
 +XL+F6ZNu0evLDEJDmOETBPJYGmheBCXaid30N+kZTFz41XPO1Dap/O3G
 KnRJVhOAY9FOW86NVZixFnfBHjd1MActbtuJy6RXJCNCsnEGRG1GyWFFK
 Rk6d6AGppUyvpUpUz5EHO/l8TnqDYo+PKdaP4/1cnIsdZwVLuC19JFi2q A==;
X-CSE-ConnectionGUID: D5J/liX0TUOvAS+nrBRKTw==
X-CSE-MsgGUID: A66udMKnT7KohKrjVUf2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63668055"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63668055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:10:12 -0700
X-CSE-ConnectionGUID: AxkC2Jv8Tkav2CrjYzb5Bw==
X-CSE-MsgGUID: XXgJf/FuQOa1v6jiI8y9LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173881902"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.22])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:10:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: Fix an error path
Date: Wed, 10 Sep 2025 18:09:39 +0200
Message-ID: <20250910160939.103473-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

The exhaustive eviction accidently changed an error path goto to
a return. Fix this.

Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..1ffff251d763 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -425,7 +425,7 @@ int xe_migrate_init(struct xe_migrate *m)
 		xe_validation_retry_on_oom(&ctx, &err);
 	}
 	if (err)
-		return err;
+		goto err_out;
 
 	if (xe->info.has_usm) {
 		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
-- 
2.51.0

