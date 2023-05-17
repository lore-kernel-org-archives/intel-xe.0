Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F467C77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 14:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FE710E428;
	Wed, 17 May 2023 14:20:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246F10E427
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684333215; x=1715869215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rqddVctgsKfINREHXh9nnhpek7N3unYg5iv+9nLLIPM=;
 b=Qzx+4tMbYVtMWQ/oS3qt4V62bMCLs2Dz944t9HH9x6V9SARgcio92Ytf
 5F3H5nN1YmGg3IbFcKnWY9NnX5Qwa14V2jGxINNoMfEMXnU8/p8KoNHe3
 rpnH+rdXXYqoNvi6vshexfzQqSbjJn+UvcVuG2OO5QGRCNjU7Gzg55PIa
 NZPLd5SNLCIece6hVwRB/C0sbLHUm7dTTr/muLlVoYM7y178d1Y7AgBGF
 26vERTk4k44XBvuv+8qtZLEytLG6QjLOOP180APz4kvMjv+1ed/rRW5+T
 1wxoe+uHnIpYcc0ZQf6Eel9ff6b8xPBdkWmI1cnikiGFlM0UXPCjgIFsH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354942988"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="354942988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="701772290"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="701772290"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 17 May 2023 07:20:19 -0700
Message-Id: <20230517142020.3717595-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517142020.3717595-1-matthew.brost@intel.com>
References: <20230517142020.3717595-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Allow compute VMs to output
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2aa5bf9cfee1..cc3772a540ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3145,7 +3145,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

