Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFBEC25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4D210F491;
	Wed, 22 May 2024 10:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvrkjiR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A252D10EE6B
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373341; x=1747909341;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=E2UjfIab0hQwed9jVcwf0dHwQa1B+2Jd3fLpEknH4EA=;
 b=ZvrkjiR6T670PxmhC8higsYTgg/TbLMY6Zeq27x3Qg2OZqz8pq3VAPPe
 QajCDV0rjHdw9wXDv62XcSxzFqQtUysbeIPfAoleood3rmsrJPgaV0vOH
 BXqN1TabYeR0LnBo2VlojIQGmGi7HaCJPtS7JNO5VdMZUjE/CWoNi90w0
 f7/5SaWPFZLN21RGQdcH1qia0RTMNN3rcZUgYnWfywXW4QfwOnuo0gE50
 xDIkkHQ52fUybspHYdNxPfocx61X09WPqIddeKuI9ONVpbyZ9AXRQigxg
 jOWO1UkNzwSPfwfKcgdirL2GA2UyqgqKdWb9OA/otfIYBHcj3ba2T221q A==;
X-CSE-ConnectionGUID: oWzUUzUhRZyshz41Qd3h3A==
X-CSE-MsgGUID: s3OxaRo8SJeQcbcKCkso5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562714"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:20 -0700
X-CSE-ConnectionGUID: RrQwPSmgRHeeEHJ23D0dEA==
X-CSE-MsgGUID: u2URo3ExTa267M1OZ6DxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195341"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 17/18] drm/xe/display: stop calling domains_driver_remove twice
Date: Wed, 22 May 2024 11:22:00 +0100
Message-ID: <20240522102143.128069-35-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Unclear why we call this twice.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 18fffa894f7d..7065e34a460e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -131,7 +131,6 @@ static void xe_display_fini_noirq(void *arg)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
-	intel_power_domains_driver_remove(xe);
 }
 
 int xe_display_init_noirq(struct xe_device *xe)
-- 
2.45.1

