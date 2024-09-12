Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600D3EED617
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 15:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE710EBD2;
	Thu, 12 Sep 2024 15:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkE1xfjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972E10EBD2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726155533; x=1757691533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DjOCvPDmCgbrv8fffdRvTKRJ1HiO5QX9MmGvITKNP3A=;
 b=NkE1xfjzLP/ZTaeGvodAy7E7f1TmQwZYxP2abuX2pueio1wOilfm1pA+
 SamVbKnekeYctagaEnaLlI71p//HJS0MOnATkmiL/uZYOJ2wWM3dYKjJA
 UH28S+sIhKDA88MJw3OoZmwHCUqVPbL9eCA9G8LRJdXLL2NbYKIs/Deq8
 CmxVYlWYsgmMeNCHCQJwrVrY4WwbTYg8c04Y+TbHXlv6CvZILXjm4oNTv
 1ImEjthvXOZnm7yuMt+db0as8oXSYLQQ/J1Mkgdntx2o5HdpvYhP9QNRW
 9zFmWUlUFEa1C/KLWFacgVldlqhKs1XYEBo6J7/h+TSGGZ4cvbuHZsFmw Q==;
X-CSE-ConnectionGUID: EDV3gHCvSoqW1zYtnZC9gA==
X-CSE-MsgGUID: GEh5ryBNT1yUFzqeHCSZ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24845384"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24845384"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:38:53 -0700
X-CSE-ConnectionGUID: hPeyvQVgQWia0BsPl5k5Kw==
X-CSE-MsgGUID: qUttqXHHR3aGdd1ReHuyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68261811"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:38:52 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2] drm/xe/oa: Fix overflow in oa batch buffer
Date: Thu, 12 Sep 2024 08:38:42 -0700
Message-ID: <20240912153842.35813-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
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

By default xe_bb_create_job() appends a MI_BATCH_BUFFER_END to batch
buffer, this is not a problem if batch buffer is only used once but
oa reuses the batch buffer for the same metric and at each call
it appends a MI_BATCH_BUFFER_END, printing the warning below and then
overflowing.

[  381.072016] ------------[ cut here ]------------
[  381.072019] xe 0000:00:02.0: [drm] Assertion `bb->len * 4 + bb_prefetch(q->gt) <= size` failed!
               platform: LUNARLAKE subplatform: 1
               graphics: Xe2_LPG / Xe2_HPG 20.04 step B0
               media: Xe2_LPM / Xe2_HPM 20.00 step B0
               tile: 0 VRAM 0 B
               GT: 0 type 1

So here checking if batch buffer already have MI_BATCH_BUFFER_END if
not append it.

v2:
- simply fix, suggestion from Ashutosh

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index a13e0b3a169ed..ef777dbdf4ecc 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -65,7 +65,8 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
 	u32 size = drm_suballoc_size(bb->bo);
 
-	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	if (bb->len == 0 || bb->cs[bb->len - 1] != MI_BATCH_BUFFER_END)
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
 
-- 
2.46.0

