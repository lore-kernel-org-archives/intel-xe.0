Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA24C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF5E10F6CA;
	Fri, 14 Aug 2026 17:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQUSK9zR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E78810F6CA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727957; x=1818263957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r86Je8vpOaYr6madFu9GU8Xex++YUwANeVyh84nhzmc=;
 b=TQUSK9zRSW6DFMHzOC3SahdVJoZIiLk4sxjEF4NkALws1arTL6QZk2O8
 Mugnf4vXWFiGD/bdD4JTBhVy9K7moGrOTnWjy5EWcgOwXIc0EIogLkd82
 hkRaFBHy9u1NEcItgHYPhmQftoxqKIcM8414U3qmCOxivmby3z9O1J7j+
 EVgHlR/p4weUZCl4A5QVeb+MmW1uc+dw+ZKZfLY9+oK9gj7gd+NSf4L+G
 CDH+eYPAGhAmpto4dE7Hja6gcGLV6ALRAKGAVTURUhDGzWjX3JB1fHOig
 iejyTmBxmRZEPmU+5cwBx9P7CTRXPenJIvwkL80PSwDLGiNse5CSAaYU5 g==;
X-CSE-ConnectionGUID: 1JqLzHiAT/WAg4DFRjtG+A==
X-CSE-MsgGUID: Egn0WeRQQ5SLTywqMYk/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464125"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:17 -0700
X-CSE-ConnectionGUID: GeoLYJyyTW+cfK/7/w+I+A==
X-CSE-MsgGUID: UsCfGE+cSL6fckTg2QOzmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946383"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 32/33] drm/xe/gt: Report 'Queue full' pagefault error using
 SIGID
Date: Fri, 14 Aug 2026 19:17:58 +0200
Message-ID: <20260814171801.13347-33-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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
While around, replace WARN_ON with WARN_ON_ONCE as there is no
need for extra noise each time we hit this unlikely condition.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: mention WARN_ON_ONCE change in commit msg (Rodrigo)
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 8b1f6f5448ba..9e89d7b37395 100644
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

