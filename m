Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEEDEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 02:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779E510E055;
	Thu, 13 Jul 2023 02:01:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7D10E055
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689213675; x=1720749675;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yLc5XlumzmS8RrSgtPbcC16PoYhbTMI7Aq5IXFdoWWU=;
 b=K42xrp7uGJlZywzidXdKBVm1EYq9R5wHfLWKlckPmFyRGqXLbbtnRIj9
 9bXRPSaZ+jEOGcI+ImDfjwTVVgeqia6+jY3uce2f6bZk87bgh4jY90vlg
 VbPsK5kfgvqlzptii+kXc0OpSkNCvsmDopOGjGMyXwGThWepwK8otlQsz
 7tYBXhQBUpa8e1s4f3aSl+a+6zZhYqxkU21knQHH8p80ZXYSH5kZMIfcv
 rdt/ZNlbLC0zJFzRBxSLcrwnG1TLxUIbS1ODsizr9BGBB12urrAIRvsVz
 N15EG0CoVChXrc+1M47EVmt2EOQUnCJfl8SVOrELJ3fzbuMJ8Q24Ac1Pg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431207363"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="431207363"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 19:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="672093925"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="672093925"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 19:01:14 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:01:05 -0700
Message-Id: <20230713020105.21570-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning from xe_vm_madvise
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

We need to hold vm->lock before the xe_vm_is_closed_or_banned().

Else we get this splat:
[  802.555227] ------------[ cut here ]------------
[  802.555234] WARNING: CPU: 33 PID: 3122 at drivers/gpu/drm/xe/xe_vm.h:60 xe_vm_madvise_ioctl+0x2de/0x440 [xe]
[  802.555515] CPU: 33 PID: 3122 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
...
[  802.555709] Call Trace:
[  802.555714]  <TASK>
[  802.555720]  ? __warn+0x81/0x170
[  802.555737]  ? xe_vm_madvise_ioctl+0x2de/0x440 [xe]

Fixes: 627d78b9d038 ("drm/xe: Ban a VM if rebind worker hits an error")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index d6e3b76bf590..7532a60a24f0 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -267,11 +267,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, !vm))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
-		err = -ENOENT;
-		goto put_vm;
-	}
-
 	if (XE_IOCTL_ERR(xe, !xe_vm_in_fault_mode(vm))) {
 		err = -EINVAL;
 		goto put_vm;
@@ -279,6 +274,11 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 
 	down_read(&vm->lock);
 
+	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
 	vmas = get_vmas(vm, &num_vmas, args->addr, args->range);
 	if (XE_IOCTL_ERR(xe, err))
 		goto unlock_vm;
-- 
2.38.0

