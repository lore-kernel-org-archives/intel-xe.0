Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92957C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 22:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F4C10E07A;
	Wed, 29 Jul 2026 22:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEUdzV65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE53410E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363687; x=1816899687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xE+w9J+fheIzkA1/HUpfI7Vp+CQ5zMyM2sLh2nljfp8=;
 b=AEUdzV65PZ01eq96QdiIlPkFt1pPqFFtBoMzq2+ruWSEFGxpXd3XIkpz
 J9xwugi+UdRtYAsC/btnnK2eeMRSGUE/TR4ctOV5ob9rouF2wKH2HQvK9
 AYhk3i5AQqUYz3jbGJLOMSmIWSTjkRwxhRso3P/pp9j7YPqWLCZ+xuk7+
 9JTxb9s4Myy0djr2HDFWehHsGxFsaw1eR8v1HqeoVqgtsTcWaR5IXi4za
 YAAhfWaMRjcIqUEnLIwKmfQZfW3LglC/b7b/h2FM1p0WVdfCKfcatDWmp
 B9RtX8oNrwrhtviN2vmeo0oEL1tAX2lFcTtxerThOtuMOmcJca0Vj/C3o w==;
X-CSE-ConnectionGUID: EUFULSU6Soy+VTzXHTt8xA==
X-CSE-MsgGUID: quYHVQ83RpSari+LbQV/oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89869912"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="89869912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:21:27 -0700
X-CSE-ConnectionGUID: 8cTJsXBXRx+abLMt3XtnKA==
X-CSE-MsgGUID: WZklinyVSP22B4Qm/yN0TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="256198531"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 15:21:27 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 0/2] drm/xe: Use IBC v3 on PTL
Date: Wed, 29 Jul 2026 15:16:27 -0700
Message-Id: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
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
v7: Correct the commit message

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

