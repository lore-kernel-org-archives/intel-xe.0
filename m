Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A0C61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4E510ED44;
	Wed, 26 Aug 2026 13:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCfakJu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B410ED44
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752335; x=1819288335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6jcKEUeak5Z/o2wzp0sgbZSiKUua95fMoU96+EzklEY=;
 b=NCfakJu7lskTiwL4+QtFi9W+rnWcHisC23DHidXOTRuGcTcUcQVDu3Hy
 R+gC8Ktdx5KJRMWNbQPWaZlm5nNg7eNELWyL5l8GzWO5HXml7jBCEmXQY
 TlT6YPC511OBkVnUyGynxv/Uf0PsRRRIHXMuYk5ilaUtpL4nCZlVaGTLJ
 rhd9Hj43hkSrvB2eQZRGzauiAz1TNMuTKZ5uadObL8Fx8UUD9Gs25jMjB
 QJXWVZon7gWM5fJdztN2i55vDAzYLQsqEfeVhyMTtYiTnTZ0AuGWWo/e+
 KbDRj/9xkk4dvPbuYfbdEoAVt0prDJslWfUaHZNpEwFtc1/3E8f3LMKli A==;
X-CSE-ConnectionGUID: KjaBIMUTRlair6P2unb6Lg==
X-CSE-MsgGUID: gSxX3lecQXWsX1GVLGPRPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251047"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:14 -0700
X-CSE-ConnectionGUID: rQUn4LDQR8auAK8v84vdNg==
X-CSE-MsgGUID: ajlFMvk9Qt6itZ26jRqn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533523"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 11/14] drm/xe/vram: Check bad_page_reservation policy in
 fault handler
Date: Wed, 26 Aug 2026 19:21:46 +0530
Message-ID: <20260826135136.204044-27-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

Before reserving a page at a faulting address, check the cached
bad_page_reservation policy from xe->ras. If the policy is disabled
(logging only), log the corrupted address and return -EOPNOTSUPP so
that RAS can report to firmware to drop the address from the SRAM
queue without attempting to offline the page.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index b2b6c1bd2c55..24d134754265 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -864,6 +864,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	vram_mgr = &vr->ttm;
 	mm = &vram_mgr->mm;
 
+	if (!xe->ras.bad_page_reservation) {
+		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
+			addr);
+		return -EOPNOTSUPP;
+	}
+
 	/* Reserve page at address */
 	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
 }
-- 
2.52.0

