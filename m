Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54998E936E7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 21:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506610E14F;
	Wed,  4 Oct 2023 21:06:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C2F10E14F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696453596; x=1727989596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QPx8wH4aVb3JtVKu8L2Ut+90C+8RxKtXSAp0va++YYM=;
 b=NpOOv7gPSlXcVXEk0RtAPo3CQgQg+UOauhOniJpTmZxlVLzrZ6dm/3C/
 /wZ6pKN+ucnVuY3Kqk8cPEKAyl+SAa+uotqqNvgeFsVB8O+RGeTF/hOOj
 pf6CpyKPf0UstLq7kUQw5VNObCkG/6EITefPlVzuZI13i96GB5bObma8+
 VQCa1swKjpr9SJx6cwIgWbVjJq2qRCEhCCR60llRMmuvpLYRxQbhkXPB5
 nRmEsczOvI/TBJkLqVCe3woDkc3DCQI9isuqz7J9S4t++m5yybSTWLuK4
 WZsvkG4i4EusFl84344nwTbrhZ6AShllUnywBnX4v4duqj5LLRF3Y6T5a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382173552"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="382173552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 14:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867577555"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="867577555"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 14:06:34 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 14:06:24 -0700
Message-ID: <20231004210624.123779-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Allow atomic operations in pages for Xe2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Without this if a atomic operations is executed it causes engine
memory catastrophic error.

This bit was already being added in the pte_encode_vma() path but not
in the pde_encode_bo() path.

This fixes at least the 3 failures in piglit sanity and 2 failures in
crucible.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ea17d026546cd..6be5d92706932 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1261,6 +1261,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 	pte |= pte_encode_cache(xe, cache);
 	pte |= pte_encode_ps(pt_level);
 
+	if (GRAPHICS_VERx100(xe) >= 20)
+		pte |= XE_USM_PPGTT_PTE_AE;
+
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
-- 
2.42.0

