Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B114E728D6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 18:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05810E172;
	Fri, 29 Sep 2023 18:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FF10E172
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 18:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696011443; x=1727547443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LYzrW8s485dxGTxEefk4XDONkC52bZF7eDdm8PAzDgM=;
 b=MAKPcLSR59TE1KyERJld/G7aw69HN8ZVv0amawPihxyJmQ6xagUnC3+L
 nBtccpnUgv76xtPpbcfZRrGquLpu/MepIUIPlWEb/oiF3cx2otyWFjo6S
 peDqeTJZ6MgTFtx48SOZ52X5z+xcUuj5tvg0gm34goxNRXx80xXorkwYf
 xbu2Bm4529J860joLwJ9Z/MvmSJ2wqRbdKLcG5MaGsHv0LdecWKgaJYJ1
 715PyJzevZxj8J2SflkLrBrE6phnfOJBstW2qhrQF4R3KTNIyQL/wN6bi
 3yuUMHaf8SdJMEcb0FqKIOt73IDT/29JZewItA6/6RmaC1JHZwNs84KQQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3919649"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="3919649"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699717261"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="699717261"
Received: from dahluwa1-mobl1.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.74.66])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:26 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 10:31:02 -0700
Message-Id: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/vm: print the correct 'keep' when
 printing gpuva ops
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

Unions are cool, until they aren't.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57ffac324564..e72380cc832e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2351,7 +2351,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		vma = gpuva_to_vma(op->remap.unmap->va);
 		vm_dbg(&xe->drm, "REMAP:UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
-		       op->unmap.keep ? 1 : 0);
+		       op->remap.unmap->keep ? 1 : 0);
 		if (op->remap.prev)
 			vm_dbg(&xe->drm,
 			       "REMAP:PREV: addr=0x%016llx, range=0x%016llx",
-- 
2.39.2

