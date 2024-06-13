Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A27C2BA2B
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DA210E964;
	Thu, 13 Jun 2024 04:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/GDQoc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6310E048
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252028; x=1749788028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5CkwzO55EzMAuk+e+WdVq9SUlqfUv+gGSF7eSYeYvvQ=;
 b=k/GDQoc8tbuVcvbyv7l/ql6xLtaq70XaA+p5TOMG+OR9CEpacGp+1LFK
 +gQhC2lM0ORh9et9wXtHwVK7Jy4UBWiHsfVlg/k92VW0PTojAI10wAgoS
 gOETbxmci1ecUmaeLjkdqAikxCxP4W1DeKV0JxIrbne5GuHhvAknTECb8
 tCMLc9vr2Sltq256nIid63ew9FRSbnUF6b0UnmYju6B0R/i40UknqM0hv
 mwtNJTexMhHekLzf2BLohXS1aWjh7Ww4vaQ1nSKJGOpzVjM5y/urvYVY5
 0iBtbaPmQettTLfmKHV7C2vsAOdlfDof1tCR0BogAl0Rn9SOq+2j4E/8r Q==;
X-CSE-ConnectionGUID: EGvs9oK+QY2MFwPwcgqR1g==
X-CSE-MsgGUID: cEyKB7PrTISr7mBwgghenA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847956"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847956"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
X-CSE-ConnectionGUID: FCLMeX5uTVGeFIfdimTeJQ==
X-CSE-MsgGUID: mQqwgh+hSy630MCzSh0Tyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476323"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 07/42] drm: Move GPUVA_START/LAST to drm_gpuvm.h
Date: Thu, 13 Jun 2024 00:23:54 -0400
Message-Id: <20240613042429.637281-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

Move them to .h file so they can be used outside of drm_gpuvm.c.
Also add a GPUVA_END micro.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 include/drm/drm_gpuvm.h     | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..7402ed6f1d33 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -867,9 +867,6 @@ __drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t *lock,
 
 #define to_drm_gpuva(__node)	container_of((__node), struct drm_gpuva, rb.node)
 
-#define GPUVA_START(node) ((node)->va.addr)
-#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)
-
 /* We do not actually use drm_gpuva_it_next(), tell the compiler to not complain
  * about this.
  */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..429dc0d82eba 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -38,6 +38,10 @@ struct drm_gpuvm;
 struct drm_gpuvm_bo;
 struct drm_gpuvm_ops;
 
+#define GPUVA_START(node) ((node)->va.addr)
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)
+#define GPUVA_END(node) ((node)->va.addr + (node)->va.range)
+
 /**
  * enum drm_gpuva_flags - flags for struct drm_gpuva
  */
-- 
2.26.3

