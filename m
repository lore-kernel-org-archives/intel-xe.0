Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2669FCD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 17:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD4710E849;
	Mon, 11 May 2026 17:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVhn4EiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E676110E83D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520539; x=1810056539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uLBCnoakxUXLVGKg5Mn4kdyMX9dj1yCO4fKrDmQHII=;
 b=CVhn4EiUeIhts/VYwbu75g4IQ6o2V35DI6672gV9b5YwyZzIQjDCGyQu
 2NPjdN9h9w+8kF8qTsU1D0qEkaRyI94pGHRbaGm35jPEfvfXi00K4JucF
 d7oPPbp3mqlSGHek7neDNuwJN5xxdvrQCU6YkoHvbuRXZZRPIf2euUL0p
 E1vuIrwXdDIb2u52ZculOtzUmlVSx7B7+u80akuJb6XO/qXTB65kTh4l8
 0k4LPE6SpOLLha6OGr4dyPzc0LTy+Em6PEf04Cyac7iUI/7WjM9RUnjcb
 lQEQ0Spsa7rZHE45RBD+gC5KvnaZCz/Ife8mQOnmkVitjx+NKYAXpqmQi A==;
X-CSE-ConnectionGUID: UePfP4ugR2O7vhY99KwHMg==
X-CSE-MsgGUID: dd4AbxKQT+GuIkSWFvN1dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90001357"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90001357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:59 -0700
X-CSE-ConnectionGUID: 3+LazJo4QfO97shUmc64uQ==
X-CSE-MsgGUID: Qq1Rdr9mSxeejnN9WozQqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="261256901"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 2/2] drm/xe/memirq: Enable GT_MI_USER_INTERRUPT only
Date: Mon, 11 May 2026 19:28:38 +0200
Message-ID: <20260511172838.2299-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511172838.2299-1-michal.wajdeczko@intel.com>
References: <20260511172838.2299-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We only expect and handle the GT_MI_USER_INTERRUPT from the
engines, there is no point in enabling other interrupts, like
GT_CONTEXT_SWITCH_INTERRUPT, if we don't intent to handle them.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 579af47edc61..3848ff81c1f9 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -212,7 +212,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 
 static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
 {
-	iosys_map_wr(&memirq->mask, 0, u32, enable ? GENMASK(15, 0) : 0);
+	/*
+	 * We only care about the GT_MI_USER_INTERRUPT from the engines and
+	 * the GuC does not look at the ENABLE mask at all.
+	 */
+	iosys_map_wr(&memirq->mask, 0, u32, enable ? GT_MI_USER_INTERRUPT : 0);
 
 	memirq->enabled = enable;
 }
-- 
2.47.1

