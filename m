Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841FCE7B10
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0010E602;
	Thu, 28 Sep 2023 10:05:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A2D10E601
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695895551; x=1727431551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dv2mLE2EDSKmNfh9BFnKL1wFXS2ts1KFCELbFLdN8Eg=;
 b=gXz0KOzKs9vn75B1IpjXoJR5DV6u+qM73kP7LeUn0gugdfofWiG3uIjy
 SnShxjAVbNsb1mF9Hvu/c+7r0zcE4V68d/vR3Bp7Myk6HxF+ozriXNHmO
 vXQ82jIHDsU9OOat1RPEuni6l3zIL4xRXmVh9ST5UAvw8KcKxXKKIhFEM
 ef7gazkDNU+0WHqsRx7O8mzvJXyndGGUkssNQXy2FmnxPsjUV2RvyxCk9
 fytkfubMl9QsALv/c/w7h5aMzoE8m/3IeVf+mFLsGmgae36QH505YXpbY
 5dOPJs3tLlj5Y/IIQG0avVWQuypE28f2kiJLrlrlPGmftiIP4+IYkQkpq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380901686"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="380901686"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:05:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819782243"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="819782243"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:05:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:39 +0100
Message-ID: <20230928100537.392675-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928100537.392675-7-matthew.auld@intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/5] drm/xe/pat: trim the xelp PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't seem to use the 4-7 pat indexes, even though they are defined
by the HW. In the next patch userspace will be able to directly set the
pat_index as part of vm_bind and we don't want to allow setting 4-7.
Simplest is to just ignore them here.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 869aee64641f..36b79d675e54 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
 	[1] = XELP_PAT_WC,
 	[2] = XELP_PAT_WT,
 	[3] = XELP_PAT_UC,
-	[4] = XELP_PAT_WB,
-	[5] = XELP_PAT_WB,
-	[6] = XELP_PAT_WB,
-	[7] = XELP_PAT_WB,
 };
 
 static const u32 xehpc_pat_table[] = {
-- 
2.41.0

