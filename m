Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE18BC54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 21:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A40610E0E5;
	Wed, 29 Jul 2026 21:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaOV+XDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776810E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 21:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785361003; x=1816897003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U75gzZKPYAj+tFaaIHhvVJRg/1K/9JcNQTouBJlf5wc=;
 b=HaOV+XDZf0kScmDn1EfZeAdC7uBOOC6cxxiB0n1z6aBzL+adWwMpPJ90
 lgqDIx3E7Ab1rvTfAig2mlAdcfK1EZ4Q9vVnfiWYinpWTRn6wKTJxGSUl
 uecmwfghCYDS4V8qlynhJqKUJiYqPBK0wqnnKH7WO73AOVt55qHizyfkt
 XvxGktt/SYYeQyC8EmVjC3K4n4xfyDNkI4Ydl9BDZQvbkrjoQR+gHfFh7
 MASDmihzj6oGsKt/c2mh3y6UUfHAcyQCF1pDA30ZMUsXqSvt+NiB/PCB4
 CHR8WYU4j7/2FyZmHcsspzD3pUye/HGQRQKHf+fPK6Upkxx2TQdQ2y9NQ g==;
X-CSE-ConnectionGUID: oCXAs2/MQJyhiBH0f8h9qw==
X-CSE-MsgGUID: oQFtnjFBQsOCSP1yq/O8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96338085"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="96338085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:36:42 -0700
X-CSE-ConnectionGUID: /pATJ5MbTwOs6xFRJeUfYw==
X-CSE-MsgGUID: HMrbOxUJSEu/X9Si1DZXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="256786824"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2026 14:36:42 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 0/2] drm/xe: Use IBC v3 on PTL
Date: Wed, 29 Jul 2026 14:31:39 -0700
Message-Id: <20260729213141.374812-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Also add a debugfs entry to monitor the IA/GT bias values.

v3: Use debugfs instead of sysfs (Rodrigo)
v4: Address comments(Rodrigo)
v5: Add assisted-by tag and other comments (Rodrigo, Michal)
v6: Rename to gt_ia_bias (Anirban)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add debugfs for IA/GT bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  6 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 80 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 15 +++-
 4 files changed, 101 insertions(+), 1 deletion(-)

-- 
2.38.1

