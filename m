Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB853E936EF
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 23:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54AF10E1AB;
	Wed,  4 Oct 2023 23:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E378010E1AB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 23:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696463119; x=1727999119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44ZL2m5Dcae0JhoUtN3DKYYFHSnrg8kMvBgB3sveAtE=;
 b=IQCJPcWSPk0CdopowkE7nuHM4LY4H2J86kDpezwNyV2gENGwQnEFYrDc
 DnACEmAD+LEpZxg3q4+VzdzdtdK769FpIUhEML62Gd+gD5AcMl6Rpe0C0
 viSL9PTSGgQmzowkUgsWJ9gEhp+WlYAYvJwC687iMl8/0PJA7ZikoUuLi
 UL2Ssy5175QyCkplz4CyAC54ZgXq3zcnRF0ke0+00RUwoctjbxCJnAtGC
 WuIIA16nhBr1rjKX3U1GnuZMFc5hmaKeF5Iba9G4NRkQq5bNgMIZhv7o4
 ezLQ5K/9Qk07ftgVqRipoHZ1RQJtORBdoUGnwvC+fgbdLT3CfsxymM7g0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469612868"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="469612868"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 16:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755166520"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="755166520"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 16:45:17 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 16:47:21 -0700
Message-Id: <20231004234721.2076190-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231004234721.2076190-1-fei.yang@intel.com>
References: <20231004234721.2076190-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: don't repin a userptr if mm is closed
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

From: Fei Yang <fei.yang@intel.com>

Ran into a problem where xe_vma_userptr_pin_pages failed with -EFAULT
due to the mmu_notifier.mm had been closed. In such case, the userptr
vma should not had been added to the invalidated list in the first
place.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ea17d026546c..14ba3fb9defd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -715,11 +715,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * userptr.
 	 */
 	if (!xe_vm_in_fault_mode(vm) &&
+	    mmget_not_zero(vma->userptr.notifier.mm) &&
 	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&vma->userptr.invalidate_link,
 			       &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
+		mmput(vma->userptr.notifier.mm);
 	}
 
 	up_write(&vm->userptr.notifier_lock);
-- 
2.25.1

