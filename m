Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803EAC7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5538210E49D;
	Tue,  2 May 2023 00:17:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26110E46E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986651; x=1714522651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEXesxzU94lOiWlaGyBktp6+HnoLVk6tlQmhlAk4CnE=;
 b=ZdZ+EMAHyZ0iW0DZ5Cc0yj7srApht2NIxF4pxD0VU7XZ5g/Dr2noRMe+
 /kUCcDpDPzBEQhi1tdeUEKmsaeyVwLp0QJIhHx0gRimQuAe0BDEVC5PIQ
 rQa+7AKzB/cgdT0//GgqiSrhp3QVh+T3Obi4BCtt0w6Xgp0BnaVRowE75
 CHmFsOsiWGJgSFcUESQYHWvHSCuN0Tq6dBZdn4alxE61uJFkbYa8jrV8O
 GhqhRlN94PB35mU3DUfu7WeUSvdaFajbpZcYQ0Rm4yBsmWQTeA8sP6WAc
 v77uAE0gUhsEEJVGcKfYZvOyuH3BHFvBa99FexDOHuGlhzuZhwER2+Yys Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619600"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541749"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541749"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:25 -0700
Message-Id: <20230502001727.3211096-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 29/31] drm/xe: Allow compute VMs to output
 dma-fences on binds
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

Binds are not long running jobs thus we can export dma-fences even if a
VM is in compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 55cced8870e6..07023506ce6b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3047,7 +3047,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs], false,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_in_fault_mode(vm));
 		if (err)
 			goto free_syncs;
 	}
-- 
2.34.1

