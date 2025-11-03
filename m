Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27473CCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 05:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281710E37E;
	Mon,  3 Nov 2025 05:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2D988gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8810E37E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 05:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762148483; x=1793684483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mo47kWYn+bXvlHHgxQSL249T5KMuxRxe7ViG3oqLf7I=;
 b=H2D988gw/H1dgV4+ZOBua3V30DTwlYJHPmG4kzLfhqkOPfG+TZQlHQRy
 032mT2zNq3U26Rurwuv4ZlXz/ehGJ4uWKqSctb+sPydPE5BHuwmICQc+J
 YXHNPG4F9iDU2WzimQEXTwUh9SAFqGcglyeeOft7ZK0fxX1CQp1NBADf5
 lRW61WUOr9P4pxPPGZIgs34+Dq/cH2r0KsZSd7tDYBRynrK6BnylyaX66
 3VYxt1tA7xUokMfDNF8vBp4FllcdiVtHTPJAXKRBB8rU7mJnrlBntJYIs
 MuvY1Nylc5ovqEd0gleEVCtGaEvLIVEg8Z3jCJPzIm30k+VkepeXVAJNT w==;
X-CSE-ConnectionGUID: 6ZugEs/HQo62GBLXDCoXJw==
X-CSE-MsgGUID: K2gBLMPZSBmchf6pQAUoQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74896319"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="74896319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 21:41:23 -0800
X-CSE-ConnectionGUID: gAjfQGxQQGyRF+XO6yp+GQ==
X-CSE-MsgGUID: q3fZamhdRpagiv0l96ND9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936219"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 21:41:21 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 5/5] drm/xe/vm: Skip ufence association for CPU address
 mirror VMA during MAP
Date: Mon,  3 Nov 2025 11:39:57 +0530
Message-Id: <20251103060957.957760-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
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

The MAP operation for a CPU address mirror VMA does not require ufence
association because such mappings are not GPU-synchronized and do not
participate in GPU job completion signaling.

Remove the unnecessary ufence addition for this case to avoid -EBUSY
failure in check_ufence of unbind ops.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12354e03c3e2..79c7383bf247 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3202,7 +3202,8 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		vma_add_ufence(op->map.vma, ufence);
+		if (!xe_vma_is_cpu_addr_mirror(op->map.vma))
+			vma_add_ufence(op->map.vma, ufence);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		if (op->remap.prev)
-- 
2.34.1

