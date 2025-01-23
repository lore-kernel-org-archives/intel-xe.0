Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F9C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE4010E890;
	Thu, 23 Jan 2025 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H60pF2Ez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B2E10E890
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737655425; x=1769191425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cW7jcUFNrj2mvWw8jeu+Rtam0fH1JHAfuTg3AyxzGTM=;
 b=H60pF2EzEvQwbV8/o2obkWAqKa4PD/HOEKn/52uWNVzLxzLV0PswD+eP
 ULDS0/E68vLRwtP2MTma1Wo0TAhoLia1ymb9dYQAvJtkv5jhevm8RCvXb
 wfnPiKEsdOY+cTb+EKCLzoEp+v+4uGxKLGquk/N9TdWGrZT/nADfAHmvP
 JY3M7tZuHo3znJIqMSjCboTTo5Yq841OBEI0XCs9FW8EfCgQ0OWE56RlS
 BGf56MBsk0V72mh2obwyFH211ZyLmE3ssBqMWB1cMPOzfoph8FhLl9MZg
 gqGmCNKeKxD3e18BfgAx/DLrbCwwU161g8knc3zWRhp0SLiRd28mc9anx g==;
X-CSE-ConnectionGUID: iPIFpUJ/SgW08nkzu6cVgQ==
X-CSE-MsgGUID: ncT6NqpzQpibJ4d63ysnkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49162879"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49162879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:44 -0800
X-CSE-ConnectionGUID: okhSLNUaSSel23ilxu/8JA==
X-CSE-MsgGUID: VBikDHsPR3ObltLr8GmBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107964073"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:43 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Date: Thu, 23 Jan 2025 09:59:43 -0800
Message-ID: <20250123180320.66198-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123180320.66198-1-jose.souza@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
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

The GT tile is already available but was added again in commit
c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
so here deleting it.

Here a devcoredump example with the duplicated information:

**** Xe Device Coredump ****
Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
kernel: 6.13.0-zeh-xe+
module: xe
Snapshot time: 1737573530.243521319
Uptime: 2588.041930284
Process: deqp-vk [8850]
PCI ID: 0x64a0
PCI revision: 0x04
GT id: 0
	Tile: 0
	Type: main
	IP ver: 20.4.4
	CS reference clock: 19200000
GT id: 1
	Tile: 0
	Type: media
	IP ver: 20.0.4
	CS reference clock: 19200000

**** GT #0 ****
	Tile: 0

**** GuC Log ****
....

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 1c86e6456d60f..2996945ffee39 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -111,9 +111,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
 	xe_device_snapshot_print(xe, &p);
 
-	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
-	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
-
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
-- 
2.48.1

