Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B55E728D6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 18:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7DE10E172;
	Fri, 29 Sep 2023 18:18:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E585810E172
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696011499; x=1727547499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Li5dpeAoMSkcga9VpYdD2bpJnFd1D4BZD7eqwrNPS3Y=;
 b=hkl3iuBb6hCqDwop3vZmZHuCRn7ua6zBSSk2fNc0MyH3IVWge1YUpSw4
 72ol/SPsXRwF1eV+oFYqOydONuKMVauRxtV74Qa2QEjcPfGjw5WheSciq
 84+6ARwxzM/UNdobDYSW5xQiae/uOUQbWGfayk8O2xJ6pYAQzXPCeLwp+
 0MxSriI6n6jFlKIkCMHMpGg8pVaxpDo4EQqo9GIBdGpECbi3xvfcFG+t2
 Prv2gE4AkiPhqjtEyq3VLS/P6uekqyhe4jx7K6kjQtCKXewKblPzuu9sV
 VpdIliI+sxe+VJdx5XUUH1GE47y/uviSFGxXPl1Cw2gsZWIP1yZd2c036 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3919668"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="3919668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699717302"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="699717302"
Received: from dahluwa1-mobl1.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.74.66])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:31 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 10:31:03 -0700
Message-Id: <20230929173104.2014590-2-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/vm: use list_last_entry() to fetch
 last_op
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

I would imagine that it's more efficient to fetch ops_list->prev than
to walk the whole list forward.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e72380cc832e..68bb70b471cf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3117,8 +3117,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	list_for_each_entry(op, ops_list, link)
-		last_op = op;
+	last_op = list_last_entry(ops_list, struct xe_vma_op, link);
 
 	if (!async) {
 		err = xe_vma_op_execute(vm, last_op);
-- 
2.39.2

