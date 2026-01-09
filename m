Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10585D26D64
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C184810E8E3;
	Fri,  9 Jan 2026 15:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJE2Je6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8910E8E3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971557; x=1799507557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+/ZQ3I4hlJxv9G8PCko+ufAR5rjp8fwJNS1Nk3jQLg=;
 b=FJE2Je6sVd4mufv4ks9Q+s06iBMh0avU/fi2dRXK526d7G3fxD5QtahZ
 J4E/LoCK43yX0SiAgDRr+yFfKOyVgZngVrMZGQm8puhDT3/VKEeEcsYWg
 /I205DhUTzXznlgiLGd/4onJoQoEWHRMhkQIxD5pMPJnmp3ewtnLyMUMt
 f+Yc6FvfySj5dLk1RAP2CioscNTUGQsvXsKV+bRhx7Je5tAusp9KTs3Vd
 Im2XZey81cUfsN59I/zA4s2JfzG5QWx9lhWI3F0R1dCSATAIlX2ylik/E
 dPQa3dcxgjVvJORSYI9t6ka7JQ6f69g2s7Az4t8E2JkyT0qoZbnINX6ol A==;
X-CSE-ConnectionGUID: bWTtDxU6TdqK26wxE82kZQ==
X-CSE-MsgGUID: gOjbbnHLQ3yUcS5EZcAYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990716"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:37 -0800
X-CSE-ConnectionGUID: u0/LVgyJRMub3PJjGLHmEw==
X-CSE-MsgGUID: luVPs+dtQKKwWdaaoer4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687631"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 2/5] drm/xe/mert: Fix kernel-doc for struct xe_mert
Date: Fri,  9 Jan 2026 16:12:16 +0100
Message-ID: <20260109151219.26206-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
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

Add simple top level kernel-doc for the struct itself to allow the
script recognize that and fix tag of the one member.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_mert.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
index 0de8243e46bd..0e27f9fa24bb 100644
--- a/drivers/gpu/drm/xe/xe_mert.h
+++ b/drivers/gpu/drm/xe/xe_mert.h
@@ -13,12 +13,15 @@
 struct xe_device;
 struct xe_tile;
 
+/**
+ * struct xe_mert - MERT related data
+ */
 struct xe_mert {
 	/** @lock: protects the TLB invalidation status */
 	spinlock_t lock;
 	/** @tlb_inv_triggered: indicates if TLB invalidation was triggered */
 	bool tlb_inv_triggered;
-	/** @mert.tlb_inv_done: completion of TLB invalidation */
+	/** @tlb_inv_done: completion of TLB invalidation */
 	struct completion tlb_inv_done;
 };
 
-- 
2.47.1

