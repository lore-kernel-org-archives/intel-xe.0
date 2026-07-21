Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F328FC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 18:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E210E3A8;
	Tue, 21 Jul 2026 18:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8h9zYnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED310E3A8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784656831; x=1816192831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0CKXXxnWS3khLQuwBquseyX+aHYbh1eGM+FhU5snvAk=;
 b=k8h9zYnZJ/SpuCngD8XTb64A8FhquXusM1HZ+83cQbgR40pJ2LXL1jCm
 dvz06r+1vFvZ628uYu54obKH4ZkoF78gMcmdIxDoeRw1vZuvONBgipc6l
 p3kIioXDsXoGsFsn9NgY87J+5fgK9r6UFowDiB+NloliLlmZ4l/nlNVQ5
 /sPH63jFaZYn8u+s5KzPkONxyY9w0K3pf4LBmspsg/FPjmkPAdKNMqwCG
 QcWnh6PARQYqdexWnVobhY6CUnb4CxHhRDzF3E+Y4JXgonO/ReuEeQpwm
 x3n9ZApY7wygp1u+5ir23irfUG/yUmhyF0NLqRqDKoXb7kL49jEjPdlA+ g==;
X-CSE-ConnectionGUID: P8Z2WDo8QQePFQ6mE34qIg==
X-CSE-MsgGUID: f5CpvpvRRPuoOjHMdrUOyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96401987"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="96401987"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 11:00:30 -0700
X-CSE-ConnectionGUID: PqdOKiG/TpKZoKA1cdUJyg==
X-CSE-MsgGUID: 6focz8jSRAy1BYcuojLtsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282352674"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2026 11:00:29 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 0/2] drm/xe: Use IBC v3 on PTL
Date: Tue, 21 Jul 2026 10:55:32 -0700
Message-Id: <20260721175534.654743-1-vinay.belgaumkar@intel.com>
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

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>


Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add debugfs for IA/GT bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 77 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 15 +++-
 4 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.38.1

