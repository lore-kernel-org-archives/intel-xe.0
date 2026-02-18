Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5081EE9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EC610E07A;
	Wed, 18 Feb 2026 23:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7Kp5WCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107910E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456649; x=1802992649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ipuWKJZHcwkuqpMSA3Bs8/4juEktcmHengaeaH7Dfsw=;
 b=B7Kp5WCWpe79s+2f5c0C/fYrvKPq9DjeEPoSK4yaVY9zx5rzJrAVo8v1
 bF/fRuT6h66m71PkwoGvdoFT+DtBMQRZyOz6S0abrGeXE7McXW604TvjJ
 oByCow7GfII3UdzC9JpgnzFXJFGAafX2Us8IJluFclOy0n5aQ59F32elu
 mTyyYjsKypyzfaKSADo3Q8zO2OOmLcvkiW9VDr5LkNkNzLhkhDu1tuoTd
 ku8zIrXOVCAeylQZjYB/RFO8kC8o720Gw3QsIVKgL7pdTlvbFK3omOJYz
 /RjlzEDz6HAi+ILEYlQkFC+40tafXZ8z/ejFxjVAe00CKsWwDjP5IsHy6 A==;
X-CSE-ConnectionGUID: 4IDIYninTbeOqPW72Yi4eQ==
X-CSE-MsgGUID: 9jRa+Vw7TUuzJ/NwTU1X2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83260859"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83260859"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:17:29 -0800
X-CSE-ConnectionGUID: XQB5xNiMSDKMsennww5BPg==
X-CSE-MsgGUID: 729wwVQTQ1aXeeP7VzZaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214200237"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 15:17:29 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/5] drm/xe/vf: Avoid LRC being freed while applying fixups
Date: Thu, 19 Feb 2026 00:21:55 +0100
Message-Id: <20260218232159.1726873-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218232159.1726873-1-tomasz.lis@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
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

There is a small but non-zero chance that fixups are running on
a context during teardown. The chances are decreased by starting
the teardown by releasing guc_id, but remain non-zero.
On the other hand the sync between fixups and context creation
drastically increases chance for such parallel teardown if
context creation fails.

Prevent LRC teardown in parallel with fixups by getting a reference.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 42849be46166..e9396ad3390a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 		lrc = READ_ONCE(q->lrc[i]);
 		if (!lrc)
 			continue;
-
+		xe_lrc_get(lrc);
 		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
+		xe_lrc_put(lrc);
 		if (err)
 			break;
 	}
-- 
2.25.1

