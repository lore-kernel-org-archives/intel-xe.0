Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C2C369D8
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9910E227;
	Wed, 23 Apr 2025 17:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMcHQduC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF2B10E21B
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745428572; x=1776964572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DEKx5gTY5atL/TfxPOJke/Ps/SCq6TLHvL56RJEsKoI=;
 b=kMcHQduCC/1BR6+v7ceJrqNrkMYpq6k8Pfm/xzQxt2M8+uYJkhWgTMby
 xt6MZwfOiZiIla96TTtoJWoPnGEhQ1gXPnfnBWr5hwPSJPyfw7/CV6jwx
 jVbaZ8zk/9hbklyrXCGjWtLYn3Byd+2MBkXZnnuyEJVTyhtjj/+8gN9zx
 oy3wCILlFGbJboxvp0KQptHI53HUHT96wy7ekpe0VrvRV/8u25gM3iLpd
 zbhyamtTJRayQoVeAvmeSEvnD/zca6dpXPheR8MAsoSjLtO/p7xbjeI2c
 yO5zRkL81gB00KNwaoPOEmJocxDxfGA5gbOKZsuClcBdCUeaVn0sEl8d8 Q==;
X-CSE-ConnectionGUID: aSXZhspjTv2P1or3DrINJA==
X-CSE-MsgGUID: UPPadQc/Q8uPnR09qHAYaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57228676"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57228676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:12 -0700
X-CSE-ConnectionGUID: 8pIYgmcEQb2prW2WI610ww==
X-CSE-MsgGUID: IbjcB7n+Q7WPWMzbyTbTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137459379"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 4/4] drm/xe: Abort printing coredump in VM printer output
 if full
Date: Wed, 23 Apr 2025 10:17:25 -0700
Message-Id: <20250423171725.597955-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423171725.597955-1-matthew.brost@intel.com>
References: <20250423171725.597955-1-matthew.brost@intel.com>
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

