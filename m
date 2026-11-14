Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62FD606A323
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6xgu+/P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3B610E2FA;
	Sat, 14 Nov 2026 07:17:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4538C10E258;
 Sat, 14 Nov 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794640619; x=1826176619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zycnUAnU720S400NhnYzs+dFnikglYbF7hfXGIyrZQ=;
 b=S6xgu+/PQw0Ek+VwcCgJVa0przvGumIetCaGbKK+XsfJNyNhJJ7/ob/O
 GacseYXbHFZnUFupDtwYXyOPQJNbdhR1fKSW/F5vbRCtG+pMjrG+X7/oT
 RdQELdZokeHZsCNcpR1n4mBFpNHfuAnscJidcPGTN69qAQSJNaCY1mTjg
 N5HupEleIPIWczUIR2cXof5IjDDhXNg7wggtlNygy898kmUP6oUj5W/Hv
 f4thSNkVtdyVtucuouzct2wIuQdp0j60qfy0nz+WP4cxC9nix/m5H68y1
 pzRZ86gINHpr2jW0/5rAjf04lbLV58byN8W1K0w2bNul+kgQhhQ3Mit77 Q==;
X-CSE-ConnectionGUID: 7yh2H18VRDGZnm0bboNFVg==
X-CSE-MsgGUID: bZXeidg9QjeMmdGGg7YCzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3366146"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3366146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 23:16:57 -0800
X-CSE-ConnectionGUID: dc1kbF9uSty/02xzcMt5SQ==
X-CSE-MsgGUID: n2UNkuk0Rxu1QGN7elkeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9110541"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 23:16:55 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, stable@vger.kernel.org
Subject: [PATCH v3 2/2] drm/i915/dsc: Fix the helper range_bpg_offset()
Date: Sat, 14 Nov 2026 12:31:14 +0530
Message-ID: <20261114070114.3308451-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261016101713.230013-3-ankit.k.nautiyal@intel.com>
References: <20261016101713.230013-3-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The helper used to compute range_bpg_offset() uses an incorrect divisor,
causing the interpolation to occur in the reverse direction. This can
result in incorrect DSC parameters and visual corruption on some panels.

Correct the divisor used by the helper.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9247
Fixes: 3abe2824e1af ("drm/i915/dsc: Use helper to calculate range_bpg_offset")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index a6556a6e45b7..7a6452557a0c 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -122,7 +122,7 @@ static int
 get_range_bpg_offset(int bpp_low, int offset_low, int bpp_high, int offset_high, int bpp)
 {
 	return offset_low + DIV_ROUND_UP((offset_high - offset_low) * (bpp - bpp_low),
-					 (bpp_low - bpp_high));
+					 (bpp_high - bpp_low));
 }
 
 /*
-- 
2.50.1

