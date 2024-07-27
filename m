Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D678FC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33D110E16C;
	Sat, 27 Jul 2024 01:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnEGQ4sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D6D10E16C
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722044609; x=1753580609;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kowcbjFEhhJMBgEwosn7W3V2KQMMZqWDHA4kVNMnAn4=;
 b=TnEGQ4sr8c66qHY1d2MdgqS3aTGUZtocKj0FteFisYDsIcnYzHwS4IIb
 7jJL/WDfKCrck3ZSEiY924CUmaQM20JpTopkefh0cwYTQ44HVxfOT5WeS
 EWkmhFTCY4rJ693n1dRgJzMINNCZQoD66OdfYmELHvvOk07Ssh5LhiSx1
 qhfY4oyaOCkeBn58G0DBuOljPlSpdVpbl2KAtuUSDcYbHXtpEfScyNRsc
 P3xROZHl6CLCJ6j+WAKt6jhlBpA2itW73Hw/KvGu1YFw1cHSODtUpbSag
 nNR54qS1cw0PC/jr84AP+4oyjmq2ZqG4ZH9BG3xlQAByxtI2VMQFRDzsC Q==;
X-CSE-ConnectionGUID: 7R3jbXFmSoWd7dkXxbT71A==
X-CSE-MsgGUID: M2xVk8v9TEmeANRFe5picQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31260065"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="31260065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:43:26 -0700
X-CSE-ConnectionGUID: eimrGKATTsGLuBfsV9P6IQ==
X-CSE-MsgGUID: ySSLpMzxTYKDMhNKfFk/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="84392827"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:43:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Annotate xe_vma_userptr_pin_pages with might_alloc
Date: Fri, 26 Jul 2024 18:44:14 -0700
Message-Id: <20240727014414.2127079-1-matthew.brost@intel.com>
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

Let's catch corner cases with locking early by annotating
xe_vma_userptr_pin_pages with might_alloc so if it is called with a lock
in the path of reclaim lockdep pops even if the userptr hasn't been
invalidated.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12d43c35978c..3bd5527b1ec6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -71,6 +71,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 
 	lockdep_assert_held(&vm->lock);
+	might_alloc(GFP_KERNEL);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
 	return xe_hmm_userptr_populate_range(uvma, false);
-- 
2.34.1

