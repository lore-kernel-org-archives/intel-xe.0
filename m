Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17DCD64076
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 06:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC2710EB48;
	Wed, 17 Dec 2025 06:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPUVJn3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2C010EB48
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765952356; x=1797488356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BqDjVZRY+CsiVHDH8WxC3bTE559dg9gFfCxtsm1cYcY=;
 b=OPUVJn3w//T2xazA9XOz60h1XFOYllnEUN0r/Th2LTpOHM/5DjeKFKBt
 /CLgHmtVwZ42hcX71NfTFKmNsP5UYg+gA6O3kVVR4kjju4NsMhGelKCvR
 ITbPCzOcWO4A+EJmZRMEBgN3eTGlibapGyHDkg0f2O2VbbkElenHDY5WV
 0EpgSH1mkT4PjNYNndH267BbY2nyW4OWvZYK6TiRNMEUvcFasd89CpO7l
 UGjrXa5WHID7nhgmLoyg0jeekghfwKNqX29IMFloZyJQLUnUnB5BlpNEG
 q5h5gsUWCmMqPX5VlvOMJL8aU7qW0hSm/iEb38et95WuaKO7PI7oryqX8 g==;
X-CSE-ConnectionGUID: X3KqdI8HTLez0zb8Mejb3A==
X-CSE-MsgGUID: TIReDbauTc2ik5OKSulpyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70459320"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="70459320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:19:16 -0800
X-CSE-ConnectionGUID: l+/QWzi3TRCxB81acd9tEw==
X-CSE-MsgGUID: YLywUgatRqun5WVrvcRctA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="235614264"
Received: from abityuts-desk.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:19:14 -0800
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
Date: Wed, 17 Dec 2025 08:17:28 +0200
Message-ID: <20251217061728.35768-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.52.0
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

Helper function xe_sync_needs_wait expects sync->fence when accessing
flags, patch makes sure we call only when sync->fence exists.

Fixes NULL pointer dereference seen with Vulkan workloads:

[  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]

Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 730a5c9c2637..ea368f02cb9f 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (xe_sync_is_ufence(&syncs[num_syncs]))
 			num_ufence++;
 
-		if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
+		if (!num_in_sync && syncs[num_syncs].fence &&
+		    xe_sync_needs_wait(&syncs[num_syncs]))
 			num_in_sync++;
 	}
 
-- 
2.52.0

