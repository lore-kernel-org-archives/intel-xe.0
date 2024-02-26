Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F39C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE9210E7C0;
	Mon, 26 Feb 2024 16:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+nmQ3L9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089A10E7EF
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708965912; x=1740501912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SKwU8rJN5fNZRK+mkYekWZZIFJQF1vTl7J58C8uslsI=;
 b=Z+nmQ3L9e/zd3jwvxaO1DkPObczNZD8iLScum5Y7h/wiApRySJghNKwR
 v5mDqZYWz95eM5BIupCxGmk7pNIfyxhbQFKG9gu9O2okib0MqMe6OCi0d
 8JyYenqQIc0FmGoHba1mGNuxYBU/TgyBRTrmn1c9BBUDcYGOwCF8zzcb7
 Zr0w83yUqHwvYd/uNCo1CsNfC1OHtOiMahlkhLxqM/SwjhuFugcT1n4cQ
 eglcq51fLrT5KKgscPo1pmNcOAwstpmD34Ez2/Zt4WRMWEcRW/DeR7N3J
 FXWSNS4Z25kC4WKvDOKcxyMhEgOUEgDdpsIrhoz6wsJRGANIez2Cy6qTI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25730059"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="25730059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6751893"
Received: from shunter1-mobl.ger.corp.intel.com (HELO fedora..) ([10.252.3.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 2/3] drm/xe/bo: Allow eviction of unbound local bos
Date: Mon, 26 Feb 2024 17:44:54 +0100
Message-ID: <20240226164455.10179-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
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

Local bos that don't have any gpu_vmas set up are allowed
to be evicted. Support that.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 143d93632253..2931b9030503 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1057,10 +1057,15 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 		struct xe_vm *vm = xe_bo->vm;
 
 		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
-		    vm->is_validating)
+		    vm->is_validating) {
+			/* Not bound to the vm? */
+			if (list_empty(&ttm_bo->base.gpuva.list))
+				goto allow;
 			return false;
+		}
 	}
 
+allow:
 	return ttm_bo_eviction_valuable(ttm_bo, place);
 }
 
-- 
2.43.0

