Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D82E7C4CB
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 15:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3074810E153;
	Wed,  4 Oct 2023 15:03:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77810E153
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696431795; x=1727967795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HNaPu/8nuC5e2bK0wIZF3/qi8Afcx4dzY3VrYclSeK8=;
 b=GfrGSTAf/M5BRqr0ujqvBwCpd/rL2PYrG+Ag34YSDEmC43b33FoV9Y45
 GX72WAY8trkgtDsm4Yahr/i+fESbBuTqJsdLYqFn2AbrDh0IlfKZ4SlC7
 F44UZbJK8UGuOSF58SBubXiRWhcQIHeuBSgWbQ3GiE+PY5XPnmpzfD8Zu
 BRZY7FT7+6OSRfOOrDYVq1DGUuEH2O/SAaSbhcFFwHgWy+41gTXeawEJW
 Zgf8VNysy/y2MwWPkgj7IFmzbwf+AP8xMG7LyaojwcZaa/isxW+ATx3qL
 gIwLfhlIyzLyAkXDvAsuRkDYQp1VyKi/rvF2VCCCyiELBq6CU5ulmYgLw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380465682"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380465682"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="780804417"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="780804417"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:03:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 08:03:17 -0700
Message-Id: <20231004150317.3473731-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add missing mocs entry
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add index 4 so WB on both L3 and L4 can be used by userspace.

Bspec: 71582
Link: https://lore.kernel.org/all/7oqovb356dx2hm5muop3xjqr4kv7m5fzjisch3vmsmxm33ygtv@eib4jielia35/
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index ada3114be4fa..19a8146ded9a 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -385,6 +385,8 @@ static const struct xe_mocs_entry xe2_mocs_table[] = {
 	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
 	/* Uncached L3 + L4 */
 	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
+	/* Cached L3 + L4 */
+	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
 };
 
 static unsigned int get_mocs_settings(struct xe_device *xe,
-- 
2.40.1

