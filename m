Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EAB606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iNM8ARXg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19710F798;
	Tue, 27 Oct 2026 18:36:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092B10E475
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793126209; x=1824662209;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JPCM9HpFgAzNhl7/vxtc6ub57mfU8egNff71t7jYCqw=;
 b=iNM8ARXgFDE0vLeP/eQUIsGdMCl+/HATl6RIXeJ13+hWLCcer+xgQu5M
 TslxxgDi/gBlcrd6ZzNsRYujKA4TiOKhMujAiK6/66O/RC0g3APilL/om
 i+pB4FLPwUvrI0MmjlaHQgVHd4aS0deM1JpualADROPDUze5+CcJL5jKn
 psz0rFSDGxHQ8n2Qn9GqC9K14fBcVvKzzOJAcoeYs38H0Vv0WJflOq7Ay
 oiAjS7kwZwZmTLHGkjLrcg8Hf9CenqhBjm+Mc54bTncAr4QrobU8iZ5zJ
 HX76J6xZm5gtrIpSU4BakBIYOtS6tnKumv40s07I5YMSO8ePS6xPNb0xh A==;
X-CSE-ConnectionGUID: YC2RU9n2T6y8Opy3IxaFhA==
X-CSE-MsgGUID: cToQ0MdMQIq9AGYBic16vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1725995"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1725995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
X-CSE-ConnectionGUID: XMHMw9A/TX+ZLOHHrnQSyQ==
X-CSE-MsgGUID: 7iLDXgqeTSivbYMSTXqDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579013"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 2/5] drm/xe: Bump the LRU on a successful page fault
Date: Tue, 27 Oct 2026 11:36:35 -0700
Message-Id: <20261027183638.1031299-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027183638.1031299-1-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Servicing a page fault validates the VMA's backing store and binds it,
making the BO part of the VM's active working set, but unlike exec it
never moves anything on the TTM LRU. In fault mode, where a VM may run
for a long time without a single exec, the BOs the GPU actually touches
therefore drift towards the LRU head and are picked by eviction and by
the shrinker ahead of genuinely cold BOs.

Bump the VM's bulk move, and any external objects locked for the fault,
once the rebind has succeeded and while the objects are still locked,
the same way xe_exec_ioctl() does.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Assisted-by: LLM
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805e..3719258aa6f0 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -221,6 +221,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_REBIND);
 				break;
 			}
+
+			xe_vm_bump_lru(vm, &exec);
 		}
 		xe_validation_ctx_fini(&ctx);
 	} while (err == -EAGAIN);
-- 
2.34.1

