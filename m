Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3B1CF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB6310E732;
	Thu, 19 Sep 2024 17:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCIUf1l4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F6810E6E9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726766146; x=1758302146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqopalGQ9QzJdcGzGOkxroTn87T+V5LQintTIVcHmwY=;
 b=ZCIUf1l4fW6WKk7lNOkYUY9sRLENcFRgPqKorSiV2wpONeNY3e6f6TFV
 +HVHJ9Zgk7STruvypI8gAubEdDKooFDO7BWvCJR/UksoIR4oiqm3pqJDB
 fXLS9J7StEmXSKW5ImEUOo3HleKl2iRto+o3l/TCEPiQ9Qq+3IO+Bkbpi
 kAPjjcNzWleSZiXZVbsC4oOOk7S2YHXHpzZXgCtqKCqNLHYSVI72j+96S
 0UHzgAOnYNu6p3B5jQ0cHKDulugtwB9PV1YedXERN+ICVn10Ca+vfKKOX
 jix/0jbQjkVSuO4onj4ieZPWjzEh2LtVQVUjYLt2UB9W5bIovg1PWaa8r g==;
X-CSE-ConnectionGUID: olZwosZPRJCP3Pxcoe0xew==
X-CSE-MsgGUID: +VBdNOYEQjSnKtViduQGoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534496"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29534496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:46 -0700
X-CSE-ConnectionGUID: pNlh7+EIRTCrW0iPZl3SAA==
X-CSE-MsgGUID: rBt9ioTFSHyy5tRNNLPNAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107481128"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/5] drm/xe/pf: Update success code of pf_validate_vf_config()
Date: Thu, 19 Sep 2024 19:15:25 +0200
Message-Id: <20240919171528.1451-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

This function may return negative error codes on invalid or
incomplete VF configuration, but unlike other int functions,
it was returning 1 instead of 0 on success, which might be
little inconvinient if we would like to use it directly in
other functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 8250ef71e685..27a593b1d52a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2042,7 +2042,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 		valid_all = valid_all && valid_lmem;
 	}
 
-	return valid_all ? 1 : valid_any ? -ENOKEY : -ENODATA;
+	return valid_all ? 0 : valid_any ? -ENOKEY : -ENODATA;
 }
 
 /**
-- 
2.43.0

