Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C787C7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90D410E5FA;
	Wed, 28 Aug 2024 21:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKZUsdDF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDC910E5FA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724881929; x=1756417929;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ze2QIDCIs5Ui6v84oFYQp5moJM6ud9++6ckvkDetkCA=;
 b=oKZUsdDFDhl3UvG9bl1BqKEc8wkl2BqY7y0Zq4d1tYyuBqrBnv9SMrPh
 /vKZAIHkzBI4uVfQ26vWo+AqAXxGmBUbRrF0YpI+EKaTPHIoPTs+xXZt1
 vDhCHRo6TB7tiPH82nPVz3x/PAiWRjj+evVZZw86Phb5kCF2PXGlbxbHv
 bM+dAiYg59yg0Ha+SCIImcQmBy/MZJxpz3O4hdtnqhCCvvFE3lYlCV1SF
 MVAZa/RrJzmj1GWjAP0qyv516CH58ybc2N749qWZ924DuCnWWW+ZZHINk
 WKKxXHUIqMmZJI2LT6joS7uYO6OzhI2z7sDOa+kfQwcXeBcuBj8vohZ0B Q==;
X-CSE-ConnectionGUID: 9Ul0/6inQDuN9qe8quT6PQ==
X-CSE-MsgGUID: Z9dlYjK2SFukhyL4rIStfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23330691"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23330691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:09 -0700
X-CSE-ConnectionGUID: eRqGhdgaQGq4jA9ydY9aGQ==
X-CSE-MsgGUID: 6lZk2FzYSmWyZ/sQGadkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63356537"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/4] drm/xe/gsc: Fix FW status if the firmware is already loaded
Date: Wed, 28 Aug 2024 14:51:55 -0700
Message-ID: <20240828215158.2743994-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

We set the FW status to "TRANSFERRED" after the load completes and to
"RUNNING"once we're done with proxy init, so do the same if we're trying
to re-load the FW and it is already loaded.

Note that there is no difference in driver behavior between the 2
states, but it's useful to be accurate when we dump the status for
debug.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 9614d9e6617e..6a94d51fb933 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -531,7 +531,10 @@ void xe_gsc_load_start(struct xe_gsc *gsc)
 
 	/* GSC FW survives GT reset and D3Hot */
 	if (gsc_fw_is_loaded(gt)) {
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+		if (xe_gsc_proxy_init_done(gsc))
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
+		else
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
 		return;
 	}
 
-- 
2.43.0

