Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15494C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 04:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ADB10E46A;
	Tue, 10 Jun 2025 04:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+8NdL19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF70610E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749531317; x=1781067317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+nhjuC7Fm+aP0VD7oks4crsmSsFF9an5uXpKxE3UNSg=;
 b=E+8NdL19dGLZRdnw3l68oeb2r20IHHIsthNatrzX1ufPaSyh8km7D1Gn
 azbbI22drg1PSMuvedaUAb5BnXAyS37xg0p6w7rYwJIszqeKgpd6jPJTZ
 cZpX14vRqwJZCtHDQ8DDtF/hgRNy7wieHb8F83faaVRSQSjgL3tbY1UK/
 BcAkjInoNDtkX9uBGElZISMCWKm3Roscgmm4qIkQTHwbGSUew6HZky431
 zy3w6Enr7Q8ycq2CWR041/Pvl2RMtVWdaZtjphSHdnqp9ggjoLDNun6z9
 7IQz5fsaBO2HSQ85fhmN0COW1kED+jqXsDPEAB1UfB630PNFWXiRyrqgZ A==;
X-CSE-ConnectionGUID: OgOIHF7CT0CewCGjE0sg5Q==
X-CSE-MsgGUID: KCbBxhT7RZ2j0GmV1r5hjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69068850"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="69068850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:55:15 -0700
X-CSE-ConnectionGUID: AA7nRwDdQIub9X3+LNB5dw==
X-CSE-MsgGUID: wFGq5fayTxuE8apb7zjIrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146696433"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:55:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Reorder 'Get pages failed' message
Date: Mon,  9 Jun 2025 21:56:49 -0700
Message-Id: <20250610045649.3149801-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Print the error from get pages failing, not the cast to -ENODATA.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 18f967ce1f1a..d18807b92b18 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2924,10 +2924,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
 		if (err) {
-			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
-				err = -ENODATA;
 			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+				err = -ENODATA;
 			return err;
 		}
 		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
-- 
2.34.1

