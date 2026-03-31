Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2C10F92E9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729D110E787;
	Tue, 31 Mar 2026 18:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHJZBvfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC0410E787
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774980738; x=1806516738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQJwnvQBNtFAUMh9bIRnNkyRImi5sg7dlxkkrWuBlqk=;
 b=QHJZBvfxWD7jCkyLZlrI/f9Pp6IjcONfGQz1z5WrYiRpX9bz4XhANR1H
 lFmFf4tSkt9ugBHkz890BghgqRLjc6Qi3n+3PXpCxXUkbHKxI13xUFXPQ
 mwG2ryRohQZHM8rtNM6/o4uH2OcAxWnHSbK/NxlrXi11MLcXLRHH1no+T
 dMacijg0/v4pcj8GPTleEvTjH5IXvh3lUpc+W29H/fW/wrhGqaiNvGGT0
 0JTAUUZYEFQVmeLyd2g4PFDxEbjndpzv8B0xwBFifqlMJq4Xb5uKmIOrR
 qqbcmQpmTidS8NcVyHlQQxpwO2wI4Eiax4TKISm+2Ioe1ohVg8fiO2FBx g==;
X-CSE-ConnectionGUID: iCnl9CSzTXWluqVNqHssgA==
X-CSE-MsgGUID: kIgmBN7DTrauWk/3PQkOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75722196"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75722196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:12:17 -0700
X-CSE-ConnectionGUID: 4ieSv8ZDR82KAN0npiBBuA==
X-CSE-MsgGUID: f+wsaSHcScO3VdjrynnvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="231367190"
Received: from dut4449lnl.fm.intel.com ([10.105.8.75])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:12:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.auld@intel.com
Subject: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
Date: Tue, 31 Mar 2026 18:12:17 +0000
Message-ID: <20260331181216.37775-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add missing pad and extensions check to xe_vm_get_property_ioctl

v2:
- Combine with other check (Auld)

Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 56e2db50bb36..1720205c09ca 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4156,7 +4156,8 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
 	int ret = 0;
 
 	if (XE_IOCTL_DBG(xe, (args->reserved[0] || args->reserved[1] ||
-			      args->reserved[2])))
+			      args->reserved[2] || args->extensions ||
+			      args->pad)))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
-- 
2.43.0

