Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EEDC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1697310E760;
	Mon, 31 Aug 2026 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABzDEKgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BF910E72D
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165389; x=1819701389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grQgpIJOAYAPkkEzDamzwBodw6LdzeG3azc+4r7QgM0=;
 b=ABzDEKgYK2qo4qAHPP8o7vIrcoOJvSi1WuGjMN6++yK5Fw5eQgnWouFV
 7AxfZ6S3h8Baa7D0DxUATb2+uZt9eJCqAK4rZl3tGFkBe5MnkUQHYyA2w
 5xx5eNrDVwTC1144a/sEzWLmVdMYqucwLF04RgCgPqC5VvV9AwKgurYCK
 gw7u0g16toeV4p0pDTF42Du2vFyC4XYN+s0OT+Cg6RVpjqJrVLlgDEva0
 kKHO0CcaIfCD+jOElJMqNeYFzSvcXQe958gnxuqny6iBR26GEkxeAHJ6N
 Camf2CClb9mIWaedr0PXUcA+HuSGWDQWyclEMBRYm9/akXztVYyz7KJ53 A==;
X-CSE-ConnectionGUID: ZifOAvWcRBW5/Oi+PilovA==
X-CSE-MsgGUID: vLJXsDJnShSbPnjEd4s/Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089724"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:29 -0700
X-CSE-ConnectionGUID: exSUDCYBQPSov72cYvTZ+w==
X-CSE-MsgGUID: 3vM1lpKCTOu1ZeuRrLQTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546369"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 09/10] drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
Date: Mon, 31 Aug 2026 14:06:11 +0530
Message-ID: <20260831083605.2115328-21-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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

Allow to replace xe_ggtt_shift_nodes() with a stub so that VF GGTT
provisioning can be exercised on the fake xe device, which has no real
struct xe_ggtt instance.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V6 -> V7:
- New commit.
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 51d4f1d91637..9ee1b72ef35e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <kunit/static_stub.h>
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
@@ -609,6 +610,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_ggtt_shift_nodes, ggtt, new_start);
+
 	guard(mutex)(&ggtt->lock);
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
-- 
2.53.0

