Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB782CD11DD
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831110EF03;
	Fri, 22 Mar 2024 09:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ice2Tezu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B810EFAB
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711098156; x=1742634156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THBbiZxacD0jgz9lr8z/10+g5XyzT8usmHBzOA2ZjdU=;
 b=ice2TezuI+t24pjUHui0+/uZTH5WuAqc6hZW4ThlwdsUXq+WsIEy/i9d
 8q8db8YuKnE70AolgGskasaszyaC4UfsIBe0tSqa1F91NuZ8lkPtQA4zn
 28HTlXkmfh0lMxX0se+awQDTLo/kyIjWWTr4m5vVQtDk9acEXidxduqPd
 /tGUKoOIfTLNQb8t5mkMU2S56Th4LASmisBV2BdA1un4fWv6cqGNLEBXf
 mkOhzitKXLDkVjUgvxJjpuwBoBndN4c8/63IBE5qGDSGw43Or4pk0U+iM
 HRiwk05t1j28+cwj2TGsJG7nSNiuJwXXWGMF0KM/NXISUtoShbjF2+tpZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9087224"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9087224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="15238812"
Received: from ettammin-desk.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.178])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v2 7/7] drm/xe/bo: Allow eviction of unbound local bos
Date: Fri, 22 Mar 2024 10:02:13 +0100
Message-ID: <20240322090213.6091-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index db4cd1da8ef3..87e6aff52ca6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1029,10 +1029,14 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
 		    vm->is_validating) {
 			xe_vm_assert_held(vm);
+			/* Not bound to the vm? */
+			if (list_empty(&ttm_bo->base.gpuva.list))
+				goto allow;
 			return false;
 		}
 	}
 
+allow:
 	return ttm_bo_eviction_valuable(ttm_bo, place);
 }
 
-- 
2.44.0

