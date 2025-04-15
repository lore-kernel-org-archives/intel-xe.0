Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75146C369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 18:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DC210E362;
	Tue, 15 Apr 2025 18:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fd5/23Br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370F10E362
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744742283; x=1776278283;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DEKx5gTY5atL/TfxPOJke/Ps/SCq6TLHvL56RJEsKoI=;
 b=fd5/23BrRfTzBgHvkAygd89+AR5ioScT/qSBvGf+SPtY7L4QDZ/qGIXg
 OWj5E0edID677ld7HYIWgpkwEalZlT5+DbsY+r+oVEQ9vtbJkTTpbmThq
 ZdQX7nvc2v4jmWbCdBDZzelP3L7CzmedHEOWAxacjEh5GErq0jijgzOXe
 zSH/X9Sd3WV8NJKGNg6wERSRpoE0q52vyQVVl4NNPmHuO+DMKLNcB5iRg
 DyFP1pB27vz9qY+B6Ox3ef18ZvaTdmqS82BeO/RGY1FuL602a/j+Gzh6O
 yOFTwnesTP/7jvAZ5rC1ih5ZCofy7y1h/3mytZkfQWXtrfuj0lTnTgrmL Q==;
X-CSE-ConnectionGUID: I4GQheyzQ8+XSp41A2R+cw==
X-CSE-MsgGUID: 91+7BxhgTOS8fiwkvQVGMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71662262"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="71662262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 11:38:00 -0700
X-CSE-ConnectionGUID: NEx03AVNTpSebE8khCPZdA==
X-CSE-MsgGUID: Q5qg44VgTEGOMZsI4oMcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161234052"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 11:38:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/xe: Abort printing coredump in VM printer output
 if full
Date: Tue, 15 Apr 2025 11:39:16 -0700
Message-Id: <20250415183916.332202-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415183916.332202-1-matthew.brost@intel.com>
References: <20250415183916.332202-1-matthew.brost@intel.com>
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

Abort printing coredump in VM printer output if full. Helps speedup
large coredumps which need to walked multiple times in
xe_devcoredump_read.

v2:
 - s/drm_printer_is_full/drm_coredump_printer_is_full (Jani)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c69ef6b5ec5..80e56e232685 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3866,6 +3866,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		}
 
 		drm_puts(p, "\n");
+
+		if (drm_coredump_printer_is_full(p))
+			return;
 	}
 }
 
-- 
2.34.1

