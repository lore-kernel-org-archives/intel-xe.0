Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ABAC3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361910E225;
	Thu, 25 Jul 2024 00:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBTGgD/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3AE10E1AA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867558; x=1753403558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ekukzxSu5l0cfjySb0v2xMPbTpVvR4uRg9v9xQGWtnY=;
 b=bBTGgD/xefD0FmZOxL8zSlxu+5Rjc1Nppx7VmyxYq+ftqzFVBsbbEpHv
 MtWBppmX+kTHUyIhqEUCZK54HMEUBNS5xjALkT76FL+dcefqWAKvCpIAZ
 tncmjdaZO49CmeybPOvIboH6++ROcr8pHDyTg1iK+ezyx0QAAvUeitzPb
 56c3cTbrxx4zgi7AEqS6+izUC7etuCRM453gv0nlNRkvnnSJs7ob7w/6T
 WyXHoZ2hQWyvOsKOQOgJQE1u4H+pWa3plgPFBkZpXrk56NbJIRJtukMSZ
 Jc6pRh2T408JdCBUBY+/FHFFNsNykGUH7LfVrLr9oNiEPBOfm12JQIQ3s Q==;
X-CSE-ConnectionGUID: ABoKCUfzSUyYwuxUrdLkng==
X-CSE-MsgGUID: 7ZQlSYk8Rcun+AuQYICNMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192536"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:38 -0700
X-CSE-ConnectionGUID: es9kHBYUSquedZiM6BuW9g==
X-CSE-MsgGUID: GA0CKmLbRaCSBxRnOcJRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976364"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/6] Revert "drm/xe/gsc: define GSC FW for LNL"
Date: Wed, 24 Jul 2024 17:32:19 -0700
Message-ID: <20240725003224.516233-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

This reverts commit 666f4c3ecc163ba7a96cd41d358da5f782f5204b.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 62ed413bf1c3..a69c61f6b064 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,7 +128,6 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

