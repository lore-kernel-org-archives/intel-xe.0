Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D4CCFA09
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B88210E239;
	Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7+kDpAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B710E112
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6w8SusIp0AqNTuI6kLYCYF77vh+bF79J0OT5SOBaZ6k=;
 b=Z7+kDpADzlOI66A2MKagpiTEBkveyfp7ApqdeB0VWC4utk/x7dW4REtB
 bRd5HjTmV47NUufXyjOvVfjBx1Ur6IxVq1HDtLeggQxICQ3BNAkvTaOuG
 MFxDPHvm/HUOAuNpX4dh01/VoVizr0E/H69usXSs9icBH/fGYlBBJUQIf
 x0OBNh6tzAmnklh4655+noR8jtJUwuxA+53M0xZ0g6Sd+slvkuiu1O8v4
 IzhMb//NZCQZyCNClSYa0JQpjGU7mTp8Nbcl+ADbaX34kDXhlWkzkoVP+
 tQYXcTp6be9OmUeD2qubeYMWk2aa5Mhf8Tht6CwDmRUyCoW8dr+2OTu9d A==;
X-CSE-ConnectionGUID: 1fl3jIoQSi6TcuMOj/z1uQ==
X-CSE-MsgGUID: PjwmH2piSZCoLaVOaIxcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575697"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: mnV7NZBRSPCXyVX1Z153Dw==
X-CSE-MsgGUID: B3HBu2rfTDmt3B4vCRuJPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020164"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 02/12] drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
Date: Fri, 31 Oct 2025 18:02:15 -0700
Message-Id: <20251101010225.3095457-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Ensure the asid_to_vm lookup is reclaim-safe so it can be performed
during TLB invalidations, which is necessary for context-based TLB
invalidation support.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 00f3520dec38..84f4c8f1be33 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1632,7 +1632,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		down_write(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
 				      XA_LIMIT(1, XE_MAX_ASID - 1),
-				      &xe->usm.next_asid, GFP_KERNEL);
+				      &xe->usm.next_asid, GFP_NOWAIT);
 		up_write(&xe->usm.lock);
 		if (err < 0)
 			goto err_close;
-- 
2.34.1

