Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49828E95A99
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 13:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0270510E103;
	Mon,  9 Oct 2023 13:14:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14D10E0DD
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696857265; x=1728393265;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z3TtmV1kFMTUAojy+y+9gn9Nf7uRT892QPXt7P2Al3o=;
 b=IoMscftscHj22WTvuYb+rQ7KmyY9zJKvHtGmI3xBA4dUSerO1ApWu51p
 qyN8xSgNB1liaIdSlBv3PjgzUEKHw2HZVL5ncKViV2AY2V3vQSXtGQHlZ
 eDuKya6TqX6AFinw5RIZnjFzXyJ2WlIUtc7y8cBbsPoaiVFsAgOectTHw
 ZAgiGgzJ21OMWbjk+C5ZPVk9OtBLPBqfwR/sb2mTKJmdKVY0x2BHI5pNI
 EBL+qi7AuBgSrbDkDKMQvIuovfRnizNkM6vCgUz60Cj9qK+VVIgs2Xqs4
 iNG9DAL9uZej2yJdUC7ZomK3s0g7J9cLpjCyebj932yw6Gay4aHpcQl3u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415128998"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415128998"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843695773"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="843695773"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.151])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:14:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 15:13:34 +0200
Message-ID: <20231009131341.18355-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009131341.18355-1-thomas.hellstrom@linux.intel.com>
References: <20231009131341.18355-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 04/10] drm/xe: Adjust to commit "drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm"
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e46812c01154..70bd36912720 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1380,7 +1380,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, vm->size, 0, 0,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, 0, vm->size,
+		       0, 0,
 		       &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
-- 
2.41.0

