Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0228C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A89610E282;
	Mon, 24 Jul 2023 08:12:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3387D10E27C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690186362; x=1721722362;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IvyKCSDhLqlxAbzl/zY1L8bJ5kPWhR+jFyhHm+mQWCk=;
 b=VLz0detXzs1M0Afpv5ZGLNKpmiQzxTJNvdDTqkqJrRmNywKg8XEaFE1d
 HmPtLAhcUJpGZQmB/1kQMgj6+pN6Xa4/kLtH13ajG1CBQUw8Zb/AasnDP
 drqg3Va4giSsVtKgShRCpqoaoLRZykOuAKmuABcCk4VtXmpICZJkVpRJY
 SMzyInNbHgGJZhOYrPpU5adMI3RyM+Qx9/25T8AMKYhYygr8khRaruTUO
 xel7LrKGstAgPgQJIxgneitUp6zu9SGfzfRZ4yc1FFUxt0i4vvn2gnVEA
 njgiaF/wig1iwN4qTeghwgFdqf9KKgmPhzpm/SZal6e7KyFuXCyouXHZx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398280324"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="398280324"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972176994"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="972176994"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:12:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jul 2023 01:12:37 -0700
Message-Id: <20230724081237.15350-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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

v2: Add fixup

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

