Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4DAEE20A6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 14:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC110E7F6;
	Fri,  6 Feb 2026 14:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPtItGVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46BD10E008
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770389366; x=1801925366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CjAoELWCoyQNnT/3Dnv6v284zp8a8FnKj5ePSohVk9s=;
 b=fPtItGVtALwjlEYp5kTrgWwP+FsY/v9f1u8nce3an1ntBz5/K5m01WEw
 DRNcm5e+z6eJ12PO2VPocmHXHVqFZlFlrT7907EBJh7rV7yUkto9myhby
 C5o3bhngwNteuk9KIp5gLj/mUPiugzcOtqX5wrTi59WiwfjhNN6PetRGo
 TgcA9Kfp39qVMsTAaX82Z18hA1MroVZgrG9U734K7B1xo3BBp2sGoxOgV
 0MK3/llltptyjH2rBUZPhf+aT9CxSXthayniVu4+FXMo3TamnJRvmI6e0
 d2VRr0xkGnySF22I+Y8tBz5fF52V+0fcZOuL4lwdPaBuivc/AQtanqFEM w==;
X-CSE-ConnectionGUID: +zOngDfRR6qzcuCjDWr7cw==
X-CSE-MsgGUID: K10wKBwZQDybC3YUecB8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70789723"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70789723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 06:49:25 -0800
X-CSE-ConnectionGUID: eDIUdhZmTFGFf3lis/36JA==
X-CSE-MsgGUID: cslX5kkWRbW51HxTJO7rRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210767429"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 06:49:24 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 1/4] drm/xe/queue: Call fini on exec queue creation fail
Date: Fri,  6 Feb 2026 15:53:31 +0100
Message-Id: <20260206145334.674679-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260206145334.674679-1-tomasz.lis@intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
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

Every call to queue init should have a corresponding fini call.
Skipping this would mean skipping removal of the queue from GuC list
(which is part of guc_id allocation). A damaged queue stored in
exec_queue_lookup list would lead to invalid memory reference,
sooner or later.

Call fini to free guc_id. This must be done before any internal
LRCs are freed.

Fixes: 3c1fa4aa60b1 ("drm/xe: Move queue init before LRC creation")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..42849be46166 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -324,6 +324,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return 0;
 
 err_lrc:
+	q->ops->fini(q);
+
 	for (i = i - 1; i >= 0; --i)
 		xe_lrc_put(q->lrc[i]);
 	return err;
-- 
2.25.1

