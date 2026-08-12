Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387B5C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15AD10F0EF;
	Wed, 12 Aug 2026 19:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkxWcg22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69010F0EF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562148; x=1818098148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SWGfz1bLWjM9sMXopcIFgwwl3aekkic4DUuXs8/McJY=;
 b=ZkxWcg22AHLY8pNqdv8KXnuHcn76pBHLzJIvDqDlzprUnYkvohYR/mGy
 YKMtHdx+ozpDogu/d5YYfzSzGYjxWNqijI46TYaPsNBYWSZEthLthSlDp
 kVfLQUmhEwVJ70hRlUQ/qE86M2Qpc0CxwNnYlI26iyoFNwyxjB6pHGGFx
 r4jwZqbAXfU8dO5hZcPeYN/CGpTknf0jHFv3DxUskoyd0JQ+iJ7maHoay
 EEUT+jc3EM/2Rz4DlJg5vcUf5+brgvkVZpPfY778+YTWWQBr9Xa0csVqc
 jcxNsT+LNaaY8b6ln/i7uH0jcf7CRcqxafEBe5UygCJb4VHoNJZI6EIXA w==;
X-CSE-ConnectionGUID: LR5D8gHWQU2F1liQUWAUPg==
X-CSE-MsgGUID: oX9KaGqyQxWoEPyeKVhP/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987596"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:48 -0700
X-CSE-ConnectionGUID: QXcvYrGfQK2XEejNwRo+mQ==
X-CSE-MsgGUID: TMLYvJr/Q9u+SRKYfo7wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892075"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 26/32] drm/xe/pcode: Report 'timeout,
 retrying' error using SIGID
Date: Wed, 12 Aug 2026 21:14:42 +0200
Message-ID: <20260812191450.11690-27-michal.wajdeczko@intel.com>
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

Report 'timeout, retrying with preemption disabled' error using
xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 014632e11338..14b13a11d1d6 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -218,8 +218,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	drm_err(&tile_to_xe(tile)->drm,
-		"PCODE timeout, retrying with preemption disabled\n");
+	xe_log_err(tile, PCODE, ret, "timeout, retrying with preemption disabled\n");
 	preempt_disable();
 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
-- 
2.47.1

