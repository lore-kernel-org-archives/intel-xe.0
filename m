Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEB5CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E36D10EDDD;
	Tue, 29 Sep 2026 09:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjqUixln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610F410E9C7;
 Tue, 29 Sep 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675105; x=1822211105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N7QYwbtO28AXoGht4Y1+Eu063EGuMyhRrNs473XocuA=;
 b=EjqUixln0AaXEEukVz+89Cj/p6S4wRfls1cDREBGsfBw5lzBXuAHV2tK
 2Ohiuis4+pkZV9bnYW0MmvQ0IuSh5EINGam/ExJDWdj9zARph2Zc0VpBz
 jBZauZkeUvAuLObsnCLoqqN/oJ1XvqjgMMzDdzX85hukU3maJm910YAet
 WpJaDLiZz7+fmV1e0YWCX89mSfg2X0hdU4ndgU5zurmTxTJOASpLSxKtb
 CacTJBqx062gWyxAMjYcx5++3Es8NXEWXccek2iPsG+We5Pi0vNfl/8xy
 3HAMlcdWB1A8gPmRtECN23vDeYbNyGUE1CFNUjxZfp/R5ApGzUXSjMiE7 Q==;
X-CSE-ConnectionGUID: J3tQpIchQzGhfKqiQO4yyg==
X-CSE-MsgGUID: dCeBY303Q7CXO0LL9WOyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250073"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:59 -0700
X-CSE-ConnectionGUID: p+tTg/mXSxCJ2dYjB6QsAA==
X-CSE-MsgGUID: Wt3NnvizTACuHL8c3GmhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283415003"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:58 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 5/8] drm/i915/psr: Skip sel fetch support check for invisible
 planes
Date: Tue, 29 Sep 2026 12:44:31 +0300
Message-ID: <20260929094434.77129-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929094434.77129-1-jouni.hogander@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Calling psr2_sel_fetch_plane_state_supported on an invisible
new_plane_state can trigger unnecessary full update. Avoid this by skipping
the check for invisible plane.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f2ec7b0e0668c..e2b35b9fee5b2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2948,7 +2948,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		    !old_plane_state->uapi.visible)
 			continue;
 
-		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
+		if (new_plane_state->uapi.visible &&
+		    !psr2_sel_fetch_plane_state_supported(new_plane_state)) {
 			full_update = true;
 			break;
 		}
-- 
2.43.0

