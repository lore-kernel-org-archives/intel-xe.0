Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784BFCD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B54F10EA03;
	Mon, 18 May 2026 23:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTS6tF+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52B010E26C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148051; x=1810684051;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5xFcrAYqFQTNZIdgIMv/eYoNGxJrIu/HcjY72hZkJ5s=;
 b=NTS6tF+kG0b3/utY93JniDnFF8TYHCpM0lIWIobkh4wMlCH8AuFppFsS
 48efEDjvPE1t9NW+iJwJHAqaPUNRiCOY5yVtyVc3HrW8lQMB3m4jnC7ub
 S7jHHtG4Tt2XcvwX0i5ZREMNJq68OOCPYi54oF42mnJLjOIDh80VABeTm
 +EJmc+mrCdzW//GmN6/eRkminaPwNEPGUjFgxm6tinmNvoiYpknSG/UU4
 OIp4z1EbatWg+oA8jJDlCjbA/hg1ewfI/Sl0WhH+TiM/wfTLPpyLbz8iB
 xcvxVEMRaQlTsWgYHd+ojCksn6eHCDlIii+v/qepWQXdfgCw2zSKzN+PL Q==;
X-CSE-ConnectionGUID: 3j0G/uWIQmetytcxOiuLPg==
X-CSE-MsgGUID: Oi9FfLRHTDqHgDFIna0brA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866828"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:21 -0700
X-CSE-ConnectionGUID: WWwL6+31TzqTZAwH9zr0SA==
X-CSE-MsgGUID: FihvZqvWQvetMt2b1sUv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959324"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/xe/rtp: Save OA nonpriv registers to register
 save/restore lists
Date: Mon, 18 May 2026 16:47:12 -0700
Message-ID: <20260518234716.1540123-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
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

Now we can save OA whitelisting nonpriv registers to register save/restore
lists. OA nonpriv registers are saved to both hwe->oa_sr as well as
hwe->reg_sr, for reasons explained in coments.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 6d42c00c1d75b..18053582a6afa 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -216,6 +216,17 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 
 	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
 			     &hwe->oa_whitelist, false);
+	/*
+	 * Save oa nonpriv registers to hwe->oa_sr, from which oa registers are whitelisted
+	 * or de-whitelisted, by toggling the 'deny' bit on oa stream open/close
+	 */
+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->oa_sr, nonpriv_slots);
+
+	/*
+	 * Also save oa nonpriv registers to hwe->reg_sr, to ensure oa registers are not
+	 * whitelisted by default after probe/reset/restart
+	 */
+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
 }
 
 /**
-- 
2.54.0

