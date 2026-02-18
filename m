Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB21E9A04A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 05:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4E410E197;
	Wed, 18 Feb 2026 05:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh+GvorB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAE10E197
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771393851; x=1802929851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9zwy/tmcDMEzXrEAwjhgGx5kdLVnlC4UiC3lnwPKzmg=;
 b=Qh+GvorBUISqmFa8wNpu6Ng+yJn7g3H826DFKjEFjjXc58jxFZ8p2aDd
 nkt3mSmnN066mGnExJjDvShTbcY/PEaRAVLjThpt1cYWdcAwVUbRQChhk
 L/7Ni+0Us0SOXtW9nGHWpDwwINloc5G2XeJKVlJzEm+xQabJgYB0xP5hD
 XJIID5B3qbPsBf3QOzrNo7cVv2bAgMnwj1dgrxH2LiX4C77sx0V9s0cEt
 ChuzPmEQbzBrzitfkGiBSwYSJaslXwNei6CyirDG0c4BPpA+99Iuctsez
 1AUEpk04Oq0c6WTNLR/vjLpjLPXzB0KpQUC7GY9AOlnMjBdjTj5Ftm0q6 w==;
X-CSE-ConnectionGUID: wD2ckHPNTaWyRG1i192epg==
X-CSE-MsgGUID: kh8eSumiTIWgnT4/E88zNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72534769"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72534769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 21:50:51 -0800
X-CSE-ConnectionGUID: 84K+bPNRTo6vge5xwwlyCQ==
X-CSE-MsgGUID: f3yZCNxGRV2ueUUcszZQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="242965060"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2026 21:50:51 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: restric multi-lrc to VCS/VECS engines
Date: Wed, 18 Feb 2026 05:50:33 +0000
Message-ID: <20260218055033.327926-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove multi-lrc support on non‑media engines for ModSched
platforms, since GuC firmware no longer supports this and
there’s no valid use case.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..9f5e9d78c8c6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1200,6 +1200,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 		}
 
+		/* multi-lrc is only supported on VIDEO_DECODE and VIDEO_ENHANCE engines */
+		if (XE_IOCTL_DBG(xe, args->width > 1 && GRAPHICS_VER(xe) > 20 &&
+				 !(eci[0].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
+				   eci[0].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE))) {
+			up_read(&vm->lock);
+			xe_vm_put(vm);
+			return -EOPNOTSUPP;
+		}
+
 		/* SRIOV sched groups are not compatible with multi-lrc */
 		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
 			up_read(&vm->lock);
-- 
2.43.0

