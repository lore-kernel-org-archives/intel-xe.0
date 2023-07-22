Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7FEB64DA
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jul 2023 07:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7110E0FD;
	Sat, 22 Jul 2023 07:52:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588A10E0FD
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jul 2023 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690012350; x=1721548350;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NKiJ6NTR9gnefCfu94BD3hVvJJ10N7OihS1TC9BZuoQ=;
 b=KJvJtBg13aHDnlJkoXAYkXJnPhq2VdDY2U04Nto93KqYTnMPSFx2aUDN
 h7ecKVAFzWWR72J3rVOIS5MakdeSOfCw4Wj+kIiNlOysf24SuSvQr5nEQ
 fXAVEulKcZ1rtRsiSa9ZGpMb3eWqaKtQmJjZyCwQo7S8XJUEWHxf39hzU
 YZl+/+fhdqpdutOBxPeyhVz5HHQyw0a36T2V0fpPABVMa45TCVHCPZyE9
 HmVsK0TJOs3Ki8X7Hp1lrkE6k48q9976+Vp8JPiPt51aElfcbsmMpxHYu
 VoeCgTK1CSQ0tRTJQ4SCtpeyQ8mE+lgdK74D9xJJbfp25xaYsXEfSdHAg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="370776961"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; d="scan'208";a="370776961"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2023 00:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790426619"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; d="scan'208";a="790426619"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2023 00:52:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 22 Jul 2023 00:52:24 -0700
Message-Id: <20230722075224.22458-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use kvmalloc_array() instead of kmalloc()
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

Use kvmalloc_array() instead of kmalloc() to avoid
memory allocation failure in xe_vma_userptr_pin_pages().

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 62a99c393d6b..6429d6e5113d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -72,7 +72,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (notifier_seq == vma->userptr.notifier_seq)
 		return 0;
 
-	pages = kmalloc(sizeof(*pages) * num_pages, GFP_KERNEL);
+	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -152,7 +152,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 
 out:
 	release_pages(pages, pinned);
-	kfree(pages);
+	kvfree(pages);
 
 	if (!(ret < 0)) {
 		vma->userptr.notifier_seq = notifier_seq;
-- 
2.21.0.rc0.32.g243a4c7e27

