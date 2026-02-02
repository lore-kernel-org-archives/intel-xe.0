Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F05FE7FDF2
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25F310E3DE;
	Mon,  2 Feb 2026 21:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIBW5fe6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0210E49A;
 Mon,  2 Feb 2026 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068660; x=1801604660;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=m2SQyYBRHQruoBB/Z3qAoxk2tuOXT2cTrvoWKkRYYq8=;
 b=hIBW5fe6szm4KIaQ0c9JRMLY6aGyxIBJcu9M+/kYraSJmYPLIxTD2G8M
 xAdrOE1JYtPMzc+WrOx4PWmbKB4IUmsjJiFZ3i/os/jZNx5SiH4RXMBEZ
 1v3HlUAJdphfqWyWehir66+goKPYFvoNGaUX29DRQ47T07DGc787wFKqb
 Iu30TqSQmPySDLZPjfW7jmA//AH/oNPm7XHWmFIj91JYAIC2qzpkdWmpx
 6Kw8ISqDMRbkd7/7EjhcI0pANU7uF1CRznPGHT9y4XyznAfL5IRSsfhy0
 j7sHxhKq9UIlgYyqmpRrB9HfpTtXMGz9NRVDNZNEnJf39fZurJDUlj29X w==;
X-CSE-ConnectionGUID: Q185HXdcS/WGN9gHIg0juw==
X-CSE-MsgGUID: 4jZEQkl0QcmWC6a97UljKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814355"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:20 -0800
X-CSE-ConnectionGUID: YwrkHJLVQ8u/wgQ4+P48pA==
X-CSE-MsgGUID: seDrr59xRoeqn30QBi6S0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646860"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:19 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:16 -0300
Subject: [PATCH 10/16] drm/xe/xe3p_lpg: Update LRC sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-10-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Like with previous generations, the engine context images for of both
RCS and CCS in Xe3p_LPG contain a common layout at the end for the
context related to the "Compute Pipeline".

The size of the memory area written to such section varies; it depends
on the type of preemption has taken place during the execution and type
of command streamer instruction that was used on the pipeline. For
Xe3p_LPG, the maximum possible size, including NOOPs for cache line
alignment, is 4368 dwords, which would be the case of a mid-thread
preemption during the execution of a COMPUTE_WALKER_2 instruction.

The maximum size has increased in such a way that we need to update
xe_gt_lrc_size() to match the new sizing requirement. When we add that
to the engine-specific parts, we have:

  - RCS context image: 6672 dwords = 26688 bytes -> 7 pages
  - CCS context image: 5024 dwords = 20096 bytes -> 5 pages

Bspec: 65182, 55793, 73590
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e58eb8b9db78..38f648b98868 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -113,13 +113,17 @@ size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class)
 	/* Engine context image */
 	switch (class) {
 	case XE_ENGINE_CLASS_RENDER:
-		if (GRAPHICS_VER(xe) >= 20)
+		if (GRAPHICS_VERx100(xe) >= 3510)
+			size += 7 * SZ_4K;
+		else if (GRAPHICS_VER(xe) >= 20)
 			size += 3 * SZ_4K;
 		else
 			size += 13 * SZ_4K;
 		break;
 	case XE_ENGINE_CLASS_COMPUTE:
-		if (GRAPHICS_VER(xe) >= 20)
+		if (GRAPHICS_VERx100(xe) >= 3510)
+			size += 5 * SZ_4K;
+		else if (GRAPHICS_VER(xe) >= 20)
 			size += 2 * SZ_4K;
 		else
 			size += 13 * SZ_4K;

-- 
2.52.0

