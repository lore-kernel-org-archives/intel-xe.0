Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F31C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 20:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720610E4C4;
	Tue, 23 May 2023 20:24:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBCA10E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684873460; x=1716409460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ghhDGxVqX9vsXMuC04CmPB2RGwbEc1o3UScU1JOGRxo=;
 b=Ut6lxMhmt73ZgpxBoit4h2R++Y3ilAIpJezNq8Jg406iN3gpcMJ+lBX7
 tpXy90V5EnNMsqA0FxiKJBCNQ789wS+YP5M6qMQD304AkROSr3vawGh4d
 6ZrZNmk1zMNQ4Fm6ZU4vtkFvE7LAvb/K3B6OG30U1JwhukcQIYwjRoeQP
 AE12KGLZD3o7sMlLNC2n+HqivnsZ8bub1vEO+jvFkQjiFBoqXBl4cwWZu
 t9MKLfzaeBCu7UMRQIwQWXvpVeR2LgUdx5e8KRInMy43MLr6csilAUdqf
 +4/+LFINE6sZMxEhaVmgW7xxsuc9yzKNn+iQCFJnfqyJsJf1OvdUlWSco w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="350861824"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="350861824"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 13:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="950693992"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="950693992"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 13:24:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 22:24:12 +0200
Message-Id: <20230523202412.14671-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Do not unbind destroyed vmas
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix a vma UAF when userspace calls unbind ioctl more
than once.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..7a9f1ba432b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2769,7 +2769,7 @@ static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
 	xe_bo_assert_held(bo);
 
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma->vm != vm)
+		if (vma->vm != vm || vma->destroyed)
 			continue;
 
 		prep_vma_destroy(vm, vma);
-- 
2.39.0

