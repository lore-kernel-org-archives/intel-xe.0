Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF5C28B23
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DBF10EA94;
	Thu,  6 Mar 2025 22:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcKRGkSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6288410EA56
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741298898; x=1772834898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SeuswG8RHQqmHpsJcEeGNuF6KtLBUiqyQd+GBeXP2J4=;
 b=VcKRGkSaf1daX0Lbgg+aonfoRW+CUUqmYl/SlVTr+zS5q30mxZMA/+Sk
 MkCW6LYIjowK4EogBDAc4F3bFDW1F+gqBO3cAt1J+ju8QweHlAxnS483v
 AWPVdaAb+aCwdmsbBdbxW5T4OtTg/YpoBAuolmcbNHTDMoxrp75dRuF3s
 m9K8yHoD7iEdK2mK6pMiL1WsF1nzH2g3/JL9+XxoorQ1nOJr5/x/A6wcw
 aGgMheryw8E8Xa+In9PKeF2ebvs11MQkAUCZVKBgNnRJjXBVHepi1Q4eD
 vmM7/GyTUC1Y4Nv3iJF50wFPegNxvP9fo5Z/4sLwm5BWyk1JvllJxN+U/ w==;
X-CSE-ConnectionGUID: ld7+rFewQMOIdjM23gPR1Q==
X-CSE-MsgGUID: 1Tc+u37gT7apGnQY3Gl4HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53735089"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53735089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:18 -0800
X-CSE-ConnectionGUID: coSiaiaRSS6QC+b2xnp7XQ==
X-CSE-MsgGUID: 7/M54pVPRxyasgTDzpcKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119659576"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] drm/xe: Drop gen11 usage
Date: Thu,  6 Mar 2025 14:08:01 -0800
Message-ID: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250306-drop-gen-a51cec766835
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

A few places still had or got gen11 reintroduced. Drop them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe: Remove pointless gen11 assertions
      drm/xe: Remove GEN11 prefixes from documentation

 drivers/gpu/drm/xe/xe_force_wake.c | 6 ------
 drivers/gpu/drm/xe/xe_memirq.c     | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)
---
base-commit: 7f20d05164065bf88d6b34fec900f63fae45d9fc
change-id: 20250306-drop-gen-a51cec766835

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
