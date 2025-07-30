Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573BCC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195EA10E690;
	Wed, 30 Jul 2025 12:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxamBqau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567E910E688
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878842; x=1785414842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h1KYa1hG3qhGMol5csXguHfTpze5+o1Ug0Wfh6LqaYA=;
 b=NxamBqaun71C9ANL5zWpMjW3XwvhCkegKXLONKGhBzNoEkADLdPs7EaQ
 OvCxRzm561naYt3Tr1nxmpTehI32j5aEy6wpZGhqOUOU2hwisuGF4LOEf
 wxfa4zxx110IuJZTgsbpxRP6COVXtnycqPDiALb5lg8PHaTA1H/9R5rHi
 ngHfhNuzRJIQVJ6iguPkXDO19iJqniyMNZ8TuQzzmqr2BBlDdcexd/m+I
 JbJWU1aL1MEs0CmYQ5uwr9PLjkUt4e70XygbRLEp0anfBYfg1eYdJLj5u
 FB1DHmm376qCIKv/PUmGYHIf0QhLXqV69II0AdBaHXnDOz81J8Eiq53Jg w==;
X-CSE-ConnectionGUID: JYindD7iTw6hoVGbBENkUw==
X-CSE-MsgGUID: FWq/y3PPS8yIluYnMzKGtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450110"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:02 -0700
X-CSE-ConnectionGUID: EKPm/C3CSIuu01EtEh2Q6Q==
X-CSE-MsgGUID: KSlO63OJRPeeCl8getIzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649423"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 02/25] drm/gpuvm: Kill drm_gpuva_init()
Date: Wed, 30 Jul 2025 18:30:27 +0530
Message-Id: <20250730130050.1001648-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

drm_gpuva_init() only has one internal user, and given we are about to
add new optional fields, it only add maintenance burden for no real
benefit, so let's kill the thing now.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 include/drm/drm_gpuvm.h | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 892ffe75a62f..2d24d000f2ee 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -1079,8 +1070,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
-- 
2.34.1

