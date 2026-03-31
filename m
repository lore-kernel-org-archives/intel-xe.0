Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01CC10F92E0
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8810E385;
	Tue, 31 Mar 2026 16:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yhd/PF2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7366510E385
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774975444; x=1806511444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YGo/dA+O9qYWYZEFUQDNV5kjvmi2UEyfjxy6OFzG6PU=;
 b=Yhd/PF2Xtcl7EJeKQTeRjMSVj7SQjcqw760B7wCtJ5be0pSPx1x+9s3A
 r83RzjjocK5dTkH1CVWhS8kcdBtaknm6mQiAwxYZJVtaOdAU2RWfNYm68
 qM1E8YczN5wm0BVhUwQEUDcfWObLWLkk3uO4HX1Ee9Ja/7Mf1BqTkCdjL
 YpPXiGiprl+jd0+zemwrDhETFRl5d6NovioYSAmlSSbjZh167iI2KQ9xm
 npo8yZ7Pu7gsZpzxARfUsnH/rMhyMss9C7LsSv9Muglfm7UBuCFZEtchI
 K9N/5fpcNXXIqe3/VGj6QQ695ULyqkeO9NdvI1g/7ujy2nSpmKkn16MDR w==;
X-CSE-ConnectionGUID: a9TVkHQHQEKx5aWI3g1mnA==
X-CSE-MsgGUID: nlEyZAn3T9aVCF/73r3sdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86296424"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86296424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:44:04 -0700
X-CSE-ConnectionGUID: RvegNnCTTK+BOKpuBhcqSA==
X-CSE-MsgGUID: gZIQmBKbRE+j3+Mu3s2+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223538692"
Received: from dut4449lnl.fm.intel.com ([10.105.8.75])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:44:03 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.auld@intel.com
Subject: [PATCH] drm/xe/vm: Add missing pad and extensions check
Date: Tue, 31 Mar 2026 16:44:04 +0000
Message-ID: <20260331164403.11687-2-jonathan.cavitt@intel.com>
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

Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 56e2db50bb36..03f129927b0f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4159,6 +4159,9 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
 			      args->reserved[2])))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->pad || args->extensions))
+		return -EINVAL;
+
 	vm = xe_vm_lookup(xef, args->vm_id);
 	if (XE_IOCTL_DBG(xe, !vm))
 		return -ENOENT;
-- 
2.43.0

