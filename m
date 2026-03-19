Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F11091927
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 21:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B655C10E988;
	Thu, 19 Mar 2026 21:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jmwa8weH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B158E10E989
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773955875; x=1805491875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvhQCs4aQGtqO2namQj6cHbr7MQ3SwSVn2xV2ogny8Q=;
 b=Jmwa8weHVdEyKnxiXQ3tu5m4ksuG97jrenSGtb73EhE9FQbUt1sLZet0
 eNF6UdONARCwsS42h80Ue04tIFJQTWMPIFdNKzd4Uber0Z4S+PtJ6BUWq
 PC2CZQOna8ME9PsZgLnBM3ebxuohh25XloMze02PIgL9DU7hVX1a4DZcM
 I4QVt8t4G7mU0YUrjhFZAjZFpL0+O8SqyITjt++ZXKqRtE613YzpYeP5z
 1SdqLS7g40JF1dN6EWtbtW0/FPhLAN4XVHISROVJCNpFcZX+jPcx5ZJ2S
 Xqh6K5qk3bX70MWZE/iDVt/NTZS5iWWZYdAF8mIHMhN9RXaaQtDWXXcKo g==;
X-CSE-ConnectionGUID: FHjdpHCZSZafo4tvbkje1w==
X-CSE-MsgGUID: kDY7QZrQT/qGTJDhpi2X5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92613557"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92613557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:31:14 -0700
X-CSE-ConnectionGUID: UwKR1mcrRkqx7znaSSsezw==
X-CSE-MsgGUID: AhpA2BMXQHql7sLfh3OQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218500713"
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:31:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: piotr.piorkowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, intel-xe@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/2] drm/xe: Add an assert that the TLB invalidation op is
 available
Date: Thu, 19 Mar 2026 21:31:05 +0000
Message-ID: <20260319213110.259170-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319213110.259170-1-stuart.summers@intel.com>
References: <20260319213110.259170-1-stuart.summers@intel.com>
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

Basically, it is the responsibility of the caller to ensure the
given TLB invalidation operation is available before calling it.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 10dcd4abb00f..3bcdeecfa3d8 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -271,6 +271,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 	int __ret;						\
 								\
 	xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);	\
+	xe_assert((__tlb_inval)->xe, (op));			\
 	xe_assert((__tlb_inval)->xe, (__fence));		\
 								\
 	mutex_lock(&(__tlb_inval)->seqno_lock); 		\
-- 
2.43.0

