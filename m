Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492A2E810CB
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57010E4DF;
	Wed, 27 Sep 2023 11:00:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145EE10E4D9
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695812427; x=1727348427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z42SLi7FSpAGVBpu2iOdC+m6GIjEY0oWETvlFBAy71w=;
 b=ZA0V+2D+Hi1zeckfroNQE1jOYRzC0Zmx6CBoFd3twjyU2TE3jjFxmpah
 jc7ZkQm6+/+fIoYlwgryI+czOBq4aHIyrT+DBT+q94mnJ9r6XiNDSAeL2
 zttaUkUoI2Z7n24nbtLnORe981LBCcGt2IQznaLuwH56ueg2QWLvXz0KA
 Z7evM4VoBzNBnp5ZfO4Yx2hBrWjFACTbSXc9del0s1+pkWYCyo7Gw2Q68
 /jxHzdHYckFVrG0y9x9YMYiCQVzncWOn6pVBY0olb8Zeugmy+dMQKlvK9
 NzNqi+zEUWP4N4hPf0JeZ0jW0amZdP4+cuYHlWtG6F31icHya0ADKZ6zX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372139518"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372139518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080109511"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080109511"
Received: from wangyuan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:00:07 +0100
Message-ID: <20230927110005.291917-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927110005.291917-7-matthew.auld@intel.com>
References: <20230927110005.291917-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/5] drm/xe/pat: trim the xelp PAT table
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
index 6efa44556689..2c759ffa35ef 100644
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

