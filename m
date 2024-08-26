Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9FCC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 14:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A73D10E221;
	Mon, 26 Aug 2024 14:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEG8x2JL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169B310E221
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724683228; x=1756219228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPjg/yysYyVKnQlacvkU8J0ukfJpP+Vyzegrka9Oz6Y=;
 b=HEG8x2JLlmvGE/TuAQqGXQcos0bpba62wprQTWNJCIIYZHrzqcAnbmEd
 /QTVSHNz7OKSk7DqCT/ygpQufTgqD6AJD/Gha7wpc4oXh021yGoPSRF6x
 ZMmx7UqVb3SsIYzkXO5UP+o2zK+fS9hv1zXagpjw9JbH7HBsW6ZRHXCY6
 4j4q40ISGkmFAOLnPuU8MnjqQTwSm5wKxmheDyHW4UIketbWSaDM+9Rq0
 sSGmgqtypMUsctmz+ppz6YHmv7G+TFWM1BgjekBDYOkgTVV7Xm6sqldeI
 Ied7VBs6z6NIMl5PEs+ZXXJDEszdeYj3PxQC1zlFB84v+rj+1n2Yu9/Zj A==;
X-CSE-ConnectionGUID: quhAwzCtTBimKidpFrM99w==
X-CSE-MsgGUID: jhkNiDt+SjKYkEDKnoXU5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22977390"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22977390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 07:40:26 -0700
X-CSE-ConnectionGUID: AfaXQjw0SjGMlMMdKY+OqQ==
X-CSE-MsgGUID: LmPZvUvnS16YmLYV4BAteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67459696"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 07:40:24 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2.5] drm/xe/eudebug: implement userptr_vma access
Date: Mon, 26 Aug 2024 16:40:00 +0200
Message-Id: <20240826144000.302353-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Zqp5oYGygI97UglY@DUT025-TGLU>
References: <Zqp5oYGygI97UglY@DUT025-TGLU>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Debugger needs to read/write program's vmas including userptr_vma.

v2.5: use access_process_vm

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
Hi Matthew,

With recent changes in drm(?) v1 and v2 versions do not work anymore.
I am wondering if using access_process_vm could be alternative approach,
at least igt tests do not fail :)

Regards
Andrzej
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 7e62b0ffca83..39b33bb7893d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3392,7 +3392,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 	if (bo)
 		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
 
-	return -EOPNOTSUPP;
+	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ec4dd2c611d3..ee6e2ee078f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3607,3 +3607,15 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
+		   void *buf, u64 len, bool write)
+{
+	struct mm_struct *mm = uvma->userptr.notifier.mm;
+	unsigned long addr = uvma->vma.gpuva.gem.offset;
+
+	if (!mm || !mm->owner)
+		return -EINVAL;
+
+	return access_process_vm(mm->owner, addr, buf, len, write ? FOLL_WRITE : 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..99b9a9b011de 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
+		   void *buf, u64 len, bool write);
-- 
2.34.1

