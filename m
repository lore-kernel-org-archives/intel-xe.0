Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B80AC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B3810F0F8;
	Wed, 12 Aug 2026 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGtoTZMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067210F0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562158; x=1818098158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQpEus5xjyEg/F2YBcj4aylHiZSjprJH4x7ZX4diVk4=;
 b=EGtoTZMBq8aYddDB4bCOVRtDU2IbtFJiP5BvB8aKdC2ONZsdxg8DIKub
 9pzZoZtomwK8r9HfkC6nTfsatj2SzP98d/9Y1j2UhrSDJAkhysItF8+IW
 UK15b8806IDgmuEPgnC/8WdtShTd69BwS/J6JFzLVmbyAJvResOAs7QXf
 o6IBPLKXjrujxtShsCBXIcLEcP2cjsjbo9clRJT1t7dLPcF+xNQ/9sVmh
 YVvH0pdm88tLz+gQynZBIsnqyyIuV0GNduDnqrd++//uUroeFLoAv1s7V
 6UM6EjmueLMBnW+ruTYcmbM8cekVQtMj91tzwqZ8BmzApuL0zzVnqn+uy g==;
X-CSE-ConnectionGUID: vhWPrhW0S+m0za81IdSVZg==
X-CSE-MsgGUID: fr0L/OdZQJalFdxouC2VQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987622"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:58 -0700
X-CSE-ConnectionGUID: 2Vq9agGVRF67weGJvr/QMw==
X-CSE-MsgGUID: 6J3Dn2CeS7elA0AA5ZnKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892133"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 31/32] drm/xe/gt: Report 'Queue full' pagefault error using
 SIGID
Date: Wed, 12 Aug 2026 21:14:47 +0200
Message-ID: <20260812191450.11690-32-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'Queue full' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index eb600c466187..f0e173a251e4 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -328,8 +328,10 @@ xe_pagefault_queue_add(struct xe_pagefault_queue *pf_queue,
 
 	do {
 		/* Not possible, warn on and drop page fault */
-		if (WARN_ON(xe_pagefault_queue_full(pf_queue)))
+		if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
+			xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
 			return NULL;
+		}
 
 		lpf = (pf_queue->data + pf_queue->head);
 		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
-- 
2.47.1

