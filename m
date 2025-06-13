Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33110C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E291D10E9A6;
	Fri, 13 Jun 2025 20:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqG+ep2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14AE10E9BA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844847; x=1781380847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWBRm6qlpKUy7TjokBXJvadATUmAaVgBBq0FdWsQL4c=;
 b=lqG+ep2cbycE8ym24NHKtcAX68nD49+ilebzbVBtaYSBseeOImUvRa5r
 LPoWDvr7HKfjlzKtLvPKfqUr12jEzKIUfxawSN4P9qxbeHvkVGDZZecGr
 ry5hY/5Y6ve9cqYLf0/QtG9OEnURwcJ3lg7SE4Jcrp5mROWJgM5xycDXU
 6wVZ4Fg1IsxNETU7QEnJo+CgY3XP+teVjqdjuB4omjYw+QVx3Lw2pz1Ny
 vIHu9qyrXYrP9A3EAP6iER9PcQ/jPoEmtqls3HdQ4MQwvf7I/PT8/MBIR
 i7IuEvG2HAGsnkRCEnbwovQoyAejKSLeyfp6+nOtTX0+K7mn1kfE/ihj3 A==;
X-CSE-ConnectionGUID: oGs7K22bQPChZ9t44FPRBA==
X-CSE-MsgGUID: O+5dTF8/QpKEZf8lNl3vbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52054313"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52054313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
X-CSE-ConnectionGUID: NnUNq4FvSDisCJFLcfim9w==
X-CSE-MsgGUID: jsJQyzf1SJaIEBJem2FbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152875670"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc: Default log level to non-verbose
Date: Fri, 13 Jun 2025 13:00:37 -0700
Message-ID: <20250613-guc-log-level-v2-1-cb84a63e49fe@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

Currently xe sets the guc log level to a verbose level since it's useful
to debug hangs and general development. However the verbose level may
already be too much and affect performance.

Michal Mrozek did some tests with the L0 compute stack for submission
latency with ULLS disabled. Below are the normalized numbers with log
level 3 (the current default) as baseline for each test:

                          Test \ Log Level                        3      0      1      2
 ----------------------------------------------------------- ------ ------ ------ ------
  BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
  BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
  BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
  BestWalkerSubmission                                         1.00   0.62   0.62   0.96
  BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
  BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
  BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
  BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78

Log level 2 is the first "verbose level" for GuC, where the biggest
difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.

Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 1c4dfafbcd0bc..4809afa7ce3f9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -20,7 +20,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display = true,
-	.guc_log_level = 3,
+	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,

-- 
2.49.0

