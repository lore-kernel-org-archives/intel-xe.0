Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42048C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAAF10E551;
	Tue,  5 Dec 2023 15:04:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7CF10E551
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701788685; x=1733324685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ieEGHGjdUfYnO7E7JGJxbX6W8MViqawCXwPWRp3fQQU=;
 b=Tqa4C2UsDuIu8YHbaVi96RN+y51ix/ePtYIuKcEB+RtdwNaV803K/mw1
 /m1LNpLU3IM5aY8LZmv0n6ZvQxsNs3a71W19nodzObYn1+9cb0Tst25F6
 OhglwPWtp1aihpvOruIaoGQ0NDDReedvATZyys8s2gkBU+qUxwayrxsi/
 LksUYW+NA022sN5a4k4AXw+3YBtiF/t/qKC5S4kNn3ATdXEGx7GjxlkRz
 dXTPeDvRbEnmBtpIqh7rtlKhmAlPSuQUSztdtTZ8KUQugM7E/fOwzm+vf
 97hu7UjTM4KwhT8Ilhrf8G0TJIM0z4rmg2bZg86ID4hJ3uHmeuvclzy8e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374093550"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="374093550"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764351023"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="764351023"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:04:42 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 17:00:39 +0200
Message-Id: <20231205150039.289135-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/vm: Avoid asid lookup if none allocated
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The destroy path can and will get called for incomplete
vm objects on error paths, where the asid is not yet allocated.
This leads to lookup fail and assert triggered.

Fix this by not asserting of asid existence if vm never
got assigned one.

Cc: Ohad Sharabi <osharabi@habana.ai>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e09050f16f07..40ee256eb36a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1620,7 +1620,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
 
-		if (xe->info.has_asid) {
+		if (xe->info.has_asid && vm->usm.asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
 			xe_assert(xe, lookup == vm);
-- 
2.34.1

