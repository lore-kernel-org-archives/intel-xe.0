Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDB7C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 16:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7F010E445;
	Tue, 29 Aug 2023 16:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA5D10E445
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326808; x=1724862808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=59B2AuVZrFxVrs2/qRTEzmeiVjvWKCSRyNNbBUOMs5E=;
 b=eR9Aa4SqO+UflVRJb1wgEZ2ynmRS4Zz1rjObJP0gmvXaVY19YL9glBkB
 /63pc5VIp6zeO1OibRAbX8ymPdJccM7fDFEn7HIuqBTzqs37/kuLsxDXc
 1j/HVhP5Iiq9DSn/ohzpZb801Urk+ngMWdFsGWN0vh1i9DcblxZNH7aiY
 6qcJTcbx408Kp66OB6XqYeIYD1kQ34407KTIVsraGte1r/OZMXOW57T8g
 Y+5DHXEgHDWpA1RAoFqQYZYn/kPOm5anOFNOxtBNM7XQadyQpi1OuEyhV
 4tJyHEaT7a7YgA55U0ro4NK2OuzaaUNWmewGbWNzxBkP13qSxN8vT5O+s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379186183"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="379186183"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804189257"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804189257"
Received: from gtmcgeac-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.125])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 17:28:43 +0100
Message-ID: <20230829162840.73444-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829162840.73444-7-matthew.auld@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/5] drm/xe: fix has_llc on rkl
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

Matches i915. Assumption going forward is that non-llc + igpu is only a
thing on MTL+ which should have explicit coherency pat_index settings
for COH_NONE, 1WAY and 2WAY.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7fb00ea410a6..791107dec045 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -240,6 +240,7 @@ static const struct xe_device_desc rkl_desc = {
 	.media = &media_xem,
 	PLATFORM(XE_ROCKETLAKE),
 	.has_display = true,
+	.has_llc = true,
 	.require_force_probe = true,
 };
 
-- 
2.41.0

