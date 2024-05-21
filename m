Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1293BC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 11:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C992D10E3F8;
	Tue, 21 May 2024 11:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/qQbYaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74710E3F8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716292164; x=1747828164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h1qNyT5h9IiofRH1gvHif4+O59YQhijlJRf+mb9tpOM=;
 b=I/qQbYaTQUXVPbCRxMmvktqb7OAqBr2daKITuPOeqFa7BI6rN3t8/5Vu
 EgTTuNQoDZ8gv0t7BvsGtb+8h+8x0tq38cXiVKvRcRcECdz9PfDdITtyb
 ZpA9km6mREevPHVVwDCbtAWuefBqJYjD96e4ZCRaOVpjFmV6Jm+gAeDkg
 ePcgos4NFh9o3UCNclG+htAK3IAplnfTOcneh0euuU5JZlOjW4bBCMduq
 LoWrj5qCOgRqhCiWqsAGpvFGHjGmFSAfuNHJw2wnBDH2fIcDElOdXqFr3
 CJhzmthuqLSan6iLeJ87BLgv+SIYAhveuXZ9y7JASIQDrh2gWvzDmcQ5M Q==;
X-CSE-ConnectionGUID: Giw2jdljQtanZ+idtaqQ/w==
X-CSE-MsgGUID: 2UUtiraNQLWETN9Y7xAJ/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12704877"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12704877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 04:49:24 -0700
X-CSE-ConnectionGUID: PYBvvwyYQMidsWa2n9rrKQ==
X-CSE-MsgGUID: pXc1kQMdTJWk1gHWDxZHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32797748"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 04:49:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/uc: Don't emit false error if running in execlist mode
Date: Tue, 21 May 2024 13:48:57 +0200
Message-Id: <20240521114857.712-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

When running in execlist mode (using force_execlist=1 modparam)
we incorrectly select the error path in xe_uc_init(), leading to
an unwanted error message like this:

[ ] xe 0000:00:00.0: [drm] *ERROR* GT0: Failed to initialize uC (0000000000000000)

Fix that by doing early return like we do in other similar cases.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0186eafc947d..85808706d1c8 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -51,7 +51,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		goto err;
+		return 0;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
-- 
2.43.0

