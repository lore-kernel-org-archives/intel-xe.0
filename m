Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F17CD8CAC
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 22:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B8E10F9FB;
	Mon,  8 Jun 2026 22:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMRJh6yk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC1D10F9EB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780958189; x=1812494189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sONpHNAiQ+5Ni0NwVZHxFfQgbbfsxb/L3aThoTsq6cQ=;
 b=XMRJh6yk09U+x449fDgcEVNbIOH/xMyOcn1g27pynZUQtn0VVBYW/n5/
 Hgk0sNvjh62M5oGg0U1Mur5OsxxIECvElz8zaMNpxlWUI5THtWAVBIcjo
 Bue/h1DxzWjiKGK2MmaxaQq/dpfc+3MtKsnkr2zv9xVN3lzan+eV9wzJJ
 DcZUHU+bACIibwGuAOxf33b1fP8CAGn3i8989HlMzjU6kmmHqV24ueoQ0
 9SucT28dp/WGfL14+oPkWEvdlFoJQDZ4UIQsjDvyoCvtEEPOAs9t+wDZ3
 +OluLZoxz5+Zxc7QEtknPzMlMYcEqu9g3EGW6nSqVWMcO3HhVJ8ExS95Z A==;
X-CSE-ConnectionGUID: ALuFODyQTG+I7LcmgYT0qw==
X-CSE-MsgGUID: GikS98eXSO2cvkUY9yFJpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81750972"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81750972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 15:36:28 -0700
X-CSE-ConnectionGUID: FkqQkO6KS5uc5xk9l0GeAA==
X-CSE-MsgGUID: hoQityhjSO6gzWLPgw5+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269684738"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 15:36:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Date: Mon,  8 Jun 2026 15:36:16 -0700
Message-ID: <20260608223624.3711760-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
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

Unconditionally whitelisting OA registers is a security violation. Set
RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
don't get whitelisted by default after probe, gt reset, resume and engine
reset.

v2: Add WHITELIST_DENY macro
    Reword commit message (Umesh)

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 2e84b1c49f374..2d8ddb57412c2 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -104,10 +104,12 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
+#define WHITELIST_DENY(r, f) WHITELIST(r, (f) | RING_FORCE_TO_NONPRIV_DENY)
+
 #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST_DENY(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+	WHITELIST_DENY(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
+	WHITELIST_DENY(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
-- 
2.54.0

