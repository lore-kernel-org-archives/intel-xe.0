Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB13C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 05:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37C210E350;
	Thu, 23 Jan 2025 05:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hISjDZwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94410E344
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 05:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737609098; x=1769145098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ssycmhs/rEg6CF5reOHte6X9HdlzuBr5hWiWb/bRQmY=;
 b=hISjDZwpxIR+6vwsbyE7PUbEVr+nQ0utwMlYYslIfizwJuFXcjX34EsR
 P+Kge+XAf2RdwOIo6iujwpz9P6+QdtbnLjdQIQmPWuPLbqnLwUO2y1Id5
 8ICrr7zPS+dy56UrRvDLG79irdHvyiFTbMMMi/3utws569eX6eptpfYV6
 i2CBOtFRweLUm3G2jW4AqMNE3flM2C+zGa9KvbkFTsO+nY3Mjl95vaA+7
 +NfQe74DJEU1WiUTADz8Kafqr3k3V0qkuwzeuUpGKYtebrR759DmXyyyO
 qXcb5tQjV6cyYozZpiXS1XyoQzHVxyhFdreusawxkm4m9KKHJJyAlfumS g==;
X-CSE-ConnectionGUID: 2bO5lRDaTa2WaJLS/y/7YQ==
X-CSE-MsgGUID: ggTkuZE5T3mLZbSau/k0OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37353641"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37353641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 21:11:38 -0800
X-CSE-ConnectionGUID: tMvg4AZURamEYAZqEovHDw==
X-CSE-MsgGUID: uOuCLHphQWmrWK4uW6D9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107459877"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 21:11:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/devcoredump: Move exec queue snapshot to Contexts
 section
Date: Wed, 22 Jan 2025 21:11:11 -0800
Message-ID: <20250123051112.1938193-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250123051112.1938193-1-lucas.demarchi@intel.com>
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
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

Having the exec queue snapshot inside a "GuC CT" section was always
wrong.  Commit c28fd6c358db ("drm/xe/devcoredump: Improve section
headings and add tile info") tried to fix that bug, but with that also
broke the mesa tool that parses the devcoredump, hence it was reverted
in commit 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa
debug tool").

With the mesa tool also fixed, this can propagate as a fix on both
kernel and userspace side to avoid unnecessary headache for a debug
feature.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: stable@vger.kernel.org
Fixes: 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa debug tool")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 81dc7795c0651..a7946a76777e7 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -119,11 +119,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
-	/*
-	 * Don't add a new section header here because the mesa debug decoder
-	 * tool expects the context information to be in the 'GuC CT' section.
-	 */
-	/* drm_puts(&p, "\n**** Contexts ****\n"); */
+	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
 	drm_puts(&p, "\n**** Job ****\n");
-- 
2.48.0

