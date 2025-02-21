Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC63C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 14:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519E10EA71;
	Fri, 21 Feb 2025 14:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9NrGz9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1D010EA7D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740148766; x=1771684766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQDXD0hopPOGEy+GclRnMbNAXwz9SQfN0V/cr+VmgfA=;
 b=m9NrGz9zT9TXf43lQmcXmzL8G4EHaT/i50fLdSxHzihSXpDgGLnPZnCZ
 I6Q9oW0PQ9Pa2VUxFKTnfT2vnIvEXajLnBptZ2vyOMbGnQLcjBiHxiKuT
 HTHYAoUzeexqAGsHJB9oNxhV/QJOqU6ee+1aSQIUGEfpUB9E7/WPc9Vpa
 K+GgFJawgItKyo0k+wEqeLnef0im07+wYbmAJAAMOmDmyhtoes7vOlPey
 vY20pUV556NWhFwgWFfhk0/w9gXYTNGNPP+n+br0RkG1SsFdnAa8ClGN7
 JPJlvMbbEynd/LkkeF06l2MmNXHZxB0Ebm64+xDpwKNSJy3G2OLa+j/Y+ w==;
X-CSE-ConnectionGUID: mSkD6MEwSO2c+pHR8108sg==
X-CSE-MsgGUID: 1epbL27iQcGtjOQUS2EEXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58377723"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58377723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 06:39:26 -0800
X-CSE-ConnectionGUID: uTyW/FZwT4WN1LPMmNVdew==
X-CSE-MsgGUID: Fg9gFFTdSS6/YqPYv3AUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152580330"
Received: from sosterlu-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 06:39:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 3/3] drm/xe/userptr: remove tmp_evict list
Date: Fri, 21 Feb 2025 14:38:43 +0000
Message-ID: <20250221143840.167150-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221143840.167150-4-matthew.auld@intel.com>
References: <20250221143840.167150-4-matthew.auld@intel.com>
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

Doesn't look to be used.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0118a1147668..996000f2424e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -660,7 +660,6 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 {
 	struct xe_userptr_vma *uvma, *next;
 	int err = 0;
-	LIST_HEAD(tmp_evict);
 
 	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	lockdep_assert_held_write(&vm->lock);
-- 
2.48.1

