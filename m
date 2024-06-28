Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F88CC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 16:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E9310E224;
	Fri, 28 Jun 2024 16:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2OCYbGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC5010E224
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719591462; x=1751127462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DSk0P+x5D/1c1tOlEL7nev0fQLtDkYjNLPdgIjv9LiM=;
 b=M2OCYbGcd/u5/P2kGOTyAr9P1hL0kxF2uTitJtaZTQyT5n5ssAZQlRyr
 ruMfq7JAGlhQWBouGbKJkEIjJiV4PD3i67bhJdlYbu27ZVK0YsstOW10C
 U+LAXwmCt5D0WsXojxFBX74vgVn+PbxKRc9fuTiQb4ZogV64kbXjKVVWC
 wye6T3H9tYt7Nr19v0s2qkGXAX39qXoTHG9OQXEdi7QU9z5NiZ3NOse1L
 WOsmvl4vhH/XEg7Nz9XhiIssoGVENyZK9L+XiumokdvX/w3yr3dd6IY0b
 h4ixdH2lBCQ1elDkiWnst2LOEUWcN9wOwohd19D+2wbnvDH9dJ5QjjySg Q==;
X-CSE-ConnectionGUID: zsIiA56ySSeQVWzCogYCNg==
X-CSE-MsgGUID: vTE9Kk7GTo6b2cXgLnMnVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="39297933"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="39297933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:17:42 -0700
X-CSE-ConnectionGUID: hnYTOawjRHWPToBvSEYXkA==
X-CSE-MsgGUID: hQ3O95oaQSad85kpG1gRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="44624721"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:17:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH] drm/xe/rtp: Fix out-of-bounds array access
Date: Fri, 28 Jun 2024 09:17:26 -0700
Message-ID: <20240628161726.836734-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Increment the counter before checking for number of rules, otherwise
when there's no XE_RTP_MATCH_OR an out-of-bounds access is done, as
reported by kasan:

	BUG: KASAN: global-out-of-bounds in rule_matches+0xb6d/0x11c0 [xe]
	Read of size 1 at addr ffffffffa0a50b70 by task systemd-udevd/243

Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5b27f7c45ea3..02e28274282f 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
 			 * Advance rules until we find XE_RTP_MATCH_OR to check
 			 * if there's another set of conditions to check
 			 */
-			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
+			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
 				;
 
 			if (i >= n_rules)
-- 
2.43.0

