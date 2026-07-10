Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD2CC44507
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 14:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7D10F90E;
	Fri, 10 Jul 2026 14:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBesZITJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F99A10F90E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783692793; x=1815228793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TpmaFu654cwOORK4VqKyWiFi/Yis+tDTaOsOy7NF32o=;
 b=YBesZITJdCYYCSsAQTzVGD9NvCsJrr6YHEZ2f0nglIJO8KqbkxzxeSf0
 ++dPaoH60Y7SvYiuIJ99UHXWFoQflX3Vw58a/hMAmq+iocmt4ELiUSA0Z
 srQhGXg67ZLYtffgbGK8eFMqXmNlE3HMuJcXKusVEpnpucE4t3ym0uo09
 FtewpJKZL+k/ntX1abUHeZyQbmXRl1mYuPmZ2PktfmNAgxMLSgikmv/ky
 +cEE5G96IpgpbFyff5felFsdFzt0abfwKQ3i+XdEhniIpZprx3XSjHJhR
 ZOvSTyx6lFlWEr4EmHmgcREZUIJwJr00zkFIyJMDFZAmgHfrN1vlqJRRJ A==;
X-CSE-ConnectionGUID: H9S9uohTRtS1+mjNUjCrFQ==
X-CSE-MsgGUID: o96mjHOmTeiGBi9EPt4Khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84442956"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84442956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 07:13:12 -0700
X-CSE-ConnectionGUID: cOoXtrPfRCm/rHvc7cLb3A==
X-CSE-MsgGUID: 1L4KFQ3gR3G2DaLkUaCbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258496756"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.248.117])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 07:13:11 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Don't fall through on DRM_GPUVA_OP_DRIVER in
 op_check_svm_userptr
Date: Fri, 10 Jul 2026 17:12:59 +0300
Message-ID: <20260710141259.1512070-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The DRM_GPUVA_OP_DRIVER operation is used by eudebug (and potentially
other driver ops). Because the break was inside the #if GPUSVM block,
we fell through and printed the "NOT POSSIBLE" warning.

Fixes: 7477c4bd20dc ("drm/xe/pt: unify xe_pt_svm_pre_commit with userptr")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7111b5d0f6aa..f5ce1fcf484c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1547,8 +1547,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
 		}
 		break;
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 	case DRM_GPUVA_OP_DRIVER:
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
 			struct xe_svm_range *range = op->map_range.range;
 
@@ -1561,8 +1561,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 				return -EAGAIN;
 			}
 		}
-		break;
 #endif
+		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
-- 
2.43.0

