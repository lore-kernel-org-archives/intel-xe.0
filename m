Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94FDC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0D910F671;
	Thu,  3 Sep 2026 15:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwKjr3rj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA5010F671
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447644; x=1819983644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZVohi5jp4sKByoP5FNj/ggAFQWZ692GamLd2/f9KTQ8=;
 b=NwKjr3rjwXWx9/riPPi507z7XOSqJDGPymRymoFEIPGO9+oR+IvpOCvC
 6QzYM8mVu9afWKv/l/7U3shR9vXfSHGyAR0VUZdyTpg1AFvjl/Q1ZdM8y
 MorP0MpSEa2A4sA0winzYVNEMRGyP7YzWBdXk+61+t5nfNSaCzwz+NFl+
 IIyM92kUJrZPHUxCH9ahA6P+4OpJyzSrHAA4MfseiBbuHra50lVnsBqVb
 EY75NSjDYm0TRO8cR6pjg9HG+Kdxf8rQg/YCErd7mCYMlYkmdaW/0G3F/
 Gwhig00NB7U9h2Rmo4vKWpsESQQFqhgP6aPuUDY7VnamSNAp+M+HVowNi A==;
X-CSE-ConnectionGUID: IeOLTRl5So2HSVYwayvFhg==
X-CSE-MsgGUID: anq9SArtTiqWqbcLrb1WZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486700"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:44 -0700
X-CSE-ConnectionGUID: QrWyNkDFSduyJeia5yzgbw==
X-CSE-MsgGUID: Mbxf4CwMTh++Kq+QoYHYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440767"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:39 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 08/27] drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm
 subop checking
Date: Thu,  3 Sep 2026 17:59:32 +0300
Message-ID: <20260903145952.848051-9-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Always emit the DRM_GPUVA_OP_DRIVER case so the previous break is
effective and we never fall through to the default warning.
This also allows adding more subops in the future without ifdef dancing.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5d990c1c3740..b7749eda6490 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1622,7 +1622,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
 		}
 		break;
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 	case DRM_GPUVA_OP_DRIVER:
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
 			struct xe_svm_range *range = op->map_range.range;
@@ -1637,7 +1636,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 			}
 		}
 		break;
-#endif
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
-- 
2.53.0

