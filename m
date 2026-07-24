Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97DC531D0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 00:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43FB10E2E9;
	Fri, 24 Jul 2026 00:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrnxBzIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442E10E2E9
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784853074; x=1816389074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g9LP+t4XwgQl5Om+c0o2lrUYGXTjzKeRqRFcNRzjYV8=;
 b=PrnxBzIFyUhANwFWjh2Hv8Ri2tSGgF8Ma+g5bB0rdYSZdYPkq2YEr22A
 ZuEdz59jPsgMq/sLCG29qmmx34/vDkQ8agS7nosywM5enngTSAdHmcI20
 azJspEzt60umSCxa5qpfiXxZBKqz1KZs2CoYv3mWLPBaGcRekBbDaVTyB
 s0BCGpB7dOeBMvYwgsZQS5wKMi20GdvJRIJ/t1IoCP/bq0iwV49zb7edI
 TO6EAOvqEJjC0upDzBmv1ZrURkiQie0pHtKKccM63wL1r82jiOfE1n/Is
 k7mA+kGApUyq0kuNM+5TIUkOLcr50jMF7v7TAHMeXR0RKOokH+QyNYnXO w==;
X-CSE-ConnectionGUID: mRRyj+OpTQOq25f3AKUOSQ==
X-CSE-MsgGUID: rXr4mwZJQnCRfrIzv+S7wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96891694"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="96891694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 17:31:12 -0700
X-CSE-ConnectionGUID: VPAh/0aDSWyW9nsHgbkzww==
X-CSE-MsgGUID: R3Rjy0RaRA2kuTB6pFD4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="259238750"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 17:31:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/xe: Add memory barrier before H2G tail write on wrap
Date: Thu, 23 Jul 2026 17:31:08 -0700
Message-Id: <20260724003108.1561414-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

When the H2G buffer wraps, it is padded with NOPs before updating the
H2G descriptor tail. However, the tail update is performed without a
memory barrier, allowing the GuC to observe the new tail value before
the NOP writes become visible.
 
This can result in the GuC reading stale H2G commands, potentially
causing a variety of failures. Fix this by inserting a memory barrier
before updating the H2G descriptor tail.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index fe70c0fd85c5..49031497e9dd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -993,6 +993,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      (h2g->info.size - tail) * sizeof(u32));
 		h2g_reserve_space(ct, (h2g->info.size - tail));
 		h2g->info.tail = 0;
+		xe_device_wmb(xe);
 		desc_write(xe, h2g, tail, h2g->info.tail);
 
 		return -EAGAIN;
-- 
2.34.1

