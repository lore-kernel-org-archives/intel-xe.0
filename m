Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B8C71149
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9A210E119;
	Thu, 12 Jun 2025 18:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA6peWQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF75A10E10D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751569; x=1781287569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6dSknyvoP4c3S09tEG+GNmCCxxfv1TrCABwdfof1fk=;
 b=HA6peWQf/V8EQzaLzK77z4E86zbqbNNldqIY+Ot0Mc3M4EMGpoIvtq9n
 QiLi2GFadEPNgFDNzuhZdG1J65/7rxugN8XLUSluu+V+aSy4byzlh7RuN
 /97eBojRbvHJ85KiadYeHHr9qcrupX3hdvZ22Fz6jFaYkem4L+iFnukFc
 P7dBQ666ZmrhKNqETMpH+rnBF7vevbIPvtIZcfRz+OrBVcOo2i/kzscw5
 dkNL2icFOqUwCb7c5+M7gMDvmwHkD8E1Y5wquF3VkzHLunxBQG/3vZbVK
 sKc0Ltxux8VoKute6wtSlLoouUyVVWwKVbHY4Mgw3jIH9XDQQxjDR3+ZN A==;
X-CSE-ConnectionGUID: bm7DvQ67Qb6Hgk6EFoFbZA==
X-CSE-MsgGUID: SoZkrx8DSwuk8mdW8m7Jnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51174706"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51174706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:03 -0700
X-CSE-ConnectionGUID: sVtHXmg+QGCUuzVsDRP9jw==
X-CSE-MsgGUID: 9R0/ASjYRGuOH5bZj3DM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="151416881"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
Date: Thu, 12 Jun 2025 11:05:32 -0700
Message-ID: <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-7a402
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

