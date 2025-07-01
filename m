Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C1C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 22:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F0F10E688;
	Tue,  1 Jul 2025 22:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbbnQVey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19F10E683
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 22:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751407265; x=1782943265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LXf//xieTQ+94EE4Xrt9EoIQLnwXQ15mqym0LsBPQJo=;
 b=lbbnQVeyt3naoP6Auvjnu4ZTlFS3IKJjUQYk8lkcmxPw9ihSK0G8nG3Q
 XVbH1MQFf5mc94Va9/f8JI4uI9rBVLu7gB7e7QLY88fT4iV2kQazniUNj
 kFVmTMjghmzXyS2ilJbDmX5jzqQchd5bOliLYDFRA6Qu44dqU6SPUmdIQ
 w0FDcJWU4L3ivaZDiEwB0ppkdFCxf9hrBrC1JslUzG7Tf3dDND4uyej0D
 sLGiBEgUqAMuvI/HGa02EMOpJ0ch1UZUxdxCKW1jbrknWm2os4jjjanr3
 7IrKwd5TOgOi1vWOBFi46J2jczoiWly01sqD1o3znstOmIYIwbYXL82zX w==;
X-CSE-ConnectionGUID: dQeql4fMTi21cN6g4M5Z1A==
X-CSE-MsgGUID: RANd8gF9Tiy6BA4wVvJP1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="41321944"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="41321944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:01:05 -0700
X-CSE-ConnectionGUID: wqp4pvqsTWelHo7Pn/ljqA==
X-CSE-MsgGUID: r+Cl1UwXS/65HgNxkEhmtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="153987724"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:01:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH] drm/xe/pf: Clear all LMTT pages on alloc
Date: Wed,  2 Jul 2025 00:00:52 +0200
Message-Id: <20250701220052.1612-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Our LMEM buffer objects are not cleared by default on alloc
and during VF provisioning we only setup LMTT PTEs for the
actually provisioned LMEM range. But beyond that valid range
we might leave some stale data that could either point to some
other VFs allocations or even to the PF pages.

Explicitly clear all new LMTT page to avoid the risk that a
malicious VF would try to exploit that gap.

While around add asserts to catch any undesired PTE overwrites
and low-level debug traces to track LMTT PT life-cycle.

Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index b56437a816e4..381f576036d0 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -78,6 +78,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 	}
 
 	lmtt_assert(lmtt, xe_bo_is_vram(bo));
+	lmtt_debug(lmtt, "level=%u addr=%#llx\n", level, (u64)xe_bo_main_addr(bo, XE_PAGE_SIZE));
+
+	xe_map_memset(lmtt_to_xe(lmtt), &bo->vmap, 0, 0, xe_bo_size(bo));
 
 	pt->level = level;
 	pt->bo = bo;
@@ -91,6 +94,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 
 static void lmtt_pt_free(struct xe_lmtt_pt *pt)
 {
+	lmtt_debug(&pt->bo->tile->sriov.pf.lmtt, "level=%u addr=%llx\n",
+		   pt->level, (u64)xe_bo_main_addr(pt->bo, XE_PAGE_SIZE));
+
 	xe_bo_unpin_map_no_vm(pt->bo);
 	kfree(pt);
 }
@@ -226,9 +232,14 @@ static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
 
 	switch (lmtt->ops->lmtt_pte_size(level)) {
 	case sizeof(u32):
+		lmtt_assert(lmtt, !overflows_type(pte, u32));
+		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u32), u32));
+
 		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u32), u32, pte);
 		break;
 	case sizeof(u64):
+		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u64), u64));
+
 		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u64), u64, pte);
 		break;
 	default:
-- 
2.47.1

