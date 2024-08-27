Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D989DC52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 08:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047110E2AF;
	Tue, 27 Aug 2024 08:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhyjnrXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB1410E2AD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724748121; x=1756284121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyZtxJS9qM/vMLWgId3sUuCGUP4QSQI87TfU623g+fk=;
 b=KhyjnrXKT3FdJvsnW9x92znFLgXEwp2raPOTEKjpRUO8bDiJAt1qxNJD
 Zo8QAJf02TrQAayEtLKBStYTDq7LAJ/O2LjlzaxqZGpVWOrWAa1Qz6ksg
 UbUsIcv5OPr1Iizu2oMcT5WV/RBmMZcRCjimZCxxpzVKbjYSD+nYzzutE
 qs+4i7OhcUwdsyAdRapl911XsIVezoFTvqloy+/1qbBTHmsBwYvottxGO
 CpIiECwQoqtTI6ipJmX4a1J51M41HaECWehTogfk2lUSS2NydXXMX+li2
 kkDv83DczFZChcAnJYVYbXzwqP/8PwDJr0IvMR5HfzdyPPDl1Ml16u4im A==;
X-CSE-ConnectionGUID: lVzOKHpTRVKqFBvPnMNjTQ==
X-CSE-MsgGUID: SBqQcupxR6u6BANW+hSyjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23176761"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23176761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:41:42 -0700
X-CSE-ConnectionGUID: jRNF7RabRgum7uJVQDpSKw==
X-CSE-MsgGUID: /vTpM5DQTrO63AojzQxGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62622893"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:41:40 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/eudebug: implement userptr_vma access
Date: Tue, 27 Aug 2024 10:41:29 +0200
Message-Id: <20240827084129.328643-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Zsy1DFqH1b4AkKcm@DUT025-TGLU.fm.intel.com>
References: <Zsy1DFqH1b4AkKcm@DUT025-TGLU.fm.intel.com>
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

v2: pin pages vs notifier, move to vm.c (Matthew)
v3: use access_process_vm core helper

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 7e62b0ffca83..bc0b32c47ed5 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3392,7 +3392,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
 	if (bo)
 		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
 
-	return -EOPNOTSUPP;
+	return xe_vm_userptr_access(to_userptr_vma(vma), offset, buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ec4dd2c611d3..f46c8fc05218 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3607,3 +3607,15 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write)
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
index c864dba35e1d..165eab494d59 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write);
-- 
2.34.1

