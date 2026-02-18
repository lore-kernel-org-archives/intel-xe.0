Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6170E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1B410E07A;
	Wed, 18 Feb 2026 23:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG8GsZRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F3A10E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771457905; x=1802993905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NewheNcmXscxgwJeqEsSbbvU/9bB4ozHzeahyqKSIoo=;
 b=SG8GsZRGvZvWQ/jrp/jOwyfRku4TA0X3bCg41McCNJxcLOxgf0W6aOEs
 /kpnFJ4MKV1fhHTkzwBXWwVBm8ObOqflNlBJ/8LqF/kjLnLcoj+UFjS5D
 OM3MgBjnadskxj3eMyOazF+cCjZy8lIgU+rFliALKHSzM++OSH5mOxFkz
 tl1L0MOBkGb8LIS5V8jvdbqCQBs4IjN8AjL1xtvsd/niMaeTUquP6jz0t
 I05Ugu8FvEipblMSyIUOC2fMu25s4SIp6stXyQyO4jrdbcCfocJxCuaL8
 r0CRCjoSUhitUnzH6JNDPuqa1m6MPqn8AK3HG0pnJUdx/UHgZ9cVc4qC4 A==;
X-CSE-ConnectionGUID: Ydm/5vVtQMuTTmHUCMA+sw==
X-CSE-MsgGUID: Qh87f43tSU20U/Icdec2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83262571"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83262571"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:38:25 -0800
X-CSE-ConnectionGUID: 6P5FRgiWSWii8kqSFKSv9g==
X-CSE-MsgGUID: IymVlHRFRL2t9DtLZ8obWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="212645048"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 15:38:25 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: restrict multi-lrc to VCS/VECS engines
Date: Wed, 18 Feb 2026 23:38:23 +0000
Message-ID: <20260218233823.369988-1-x.wang@intel.com>
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

Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
VIDEO_ENHANCE engines only. This check should have been in place from the
start, as the driver typically avoids allowing uapi cases that we have
no userspace consumer for.

Additionally, the GuC firmware on ModSched platforms no longer supports
multi-lrc on non-media engines.

V2:
 - correct the typo (Shuicheng)
 - move the check earlier to avoid VM lookup (Shuicheng, Matt)
 - remove the graphics version check (Matt)
 - input more details in the commit info (Matt)

Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..36bf570ab221 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1184,6 +1184,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_DBG(xe, !hwe))
 			return -EINVAL;
 
+		/* multi-lrc is only supported on VIDEO_DECODE and VIDEO_ENHANCE engines */
+		if (XE_IOCTL_DBG(xe, args->width > 1 &&
+				 eci[0].engine_class != DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
+				 eci[0].engine_class != DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE))
+			return -EOPNOTSUPP;
+
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
-- 
2.43.0

