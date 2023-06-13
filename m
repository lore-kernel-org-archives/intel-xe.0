Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A4CC88CB4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 10:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2E10E357;
	Tue, 13 Jun 2023 10:20:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AE510E357
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686651630; x=1718187630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdDl+YtqkQ7lF9GvoskyiMdxv7a1iBcRIjE64oybyVE=;
 b=Mi/H7z3ui9D8H26WWEhImsHkcv5ja0Ic4bItmRZHf98Ak9lE8SrqUxy2
 Oz2EmZJeKlwZQMxbzBJDkd2WT7DcNFhSKIQIufDRUgJ+vFdhpnHBxDU09
 jr7/Z+7BkU67RDwqXv89KUSSSwrQgEGlFiIQOvOZCQyIDQaheywnS7qrF
 a9x+jyYOJ9nFsVKC+Wmtc3g0/rQaAIlAyjSHXEASbnLR2+IWnoK+W3idN
 cjlVMCtzc7mqwFmNvkyesdEuwUsk7ooGzWsktmQk3i0DRi7kyRST9C92k
 OvfftJQz/sRme6xRPThzQWQI7IiwX8G7wjZEfpqEQ0icWzMkC7X2gr/mw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="424169446"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="424169446"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 03:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801409488"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="801409488"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.22])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 03:19:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 12:19:09 +0200
Message-Id: <20230613101909.10193-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI] drm/xe: Always flush TLB on rebind.
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2c472fafc811..e817fa9fe65e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1309,7 +1309,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	 * non-faulting LR, in particular on user-space batch buffer chaining,
 	 * it needs to be done here.
 	 */
-	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
+	if ((rebind && !xe_vm_no_dma_fences(vm)) ||
 	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
-- 
2.39.2

