Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F58CA1017
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3845C10EC5E;
	Fri,  5 Sep 2025 21:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b519py4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CE110EC5C
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757107382; x=1788643382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpnF7WOTE9GdhwNUJqR71hf/HUWjH4mkJ/LayBIA/dA=;
 b=b519py4SbH4ix+s5mt/3v6jIV9WMReuldMGmk2azE7WEWteAJzW68Fku
 cViu+S0RJUUhjIATOVstpQdPSdgXEGL1a+gdMyholw9hbk7x2dxaBtFfC
 1RnKSXPuS1LgDSXbcGBJEY43vTfvjnnU/DiUxUAZmLsd/cocOOOZM0epZ
 hK00Zor/AimVhjl6fI9ht3j/l2SxbM2zEOlVy0yObe0B1hKqPshDBu+cS
 gYWBogrPxCEfxdE5I5sOMbhl6owg1ozhUBZsetQsJHlbCihyZr5fJDUfM
 SfILAgozRaRrtBikJhcmgiMxYI4022tj6RnOsV5F6IMD7E2sQWTzjQ346 w==;
X-CSE-ConnectionGUID: +/95WVfVQAKsP2LK7+/jSw==
X-CSE-MsgGUID: sPqs6sL+SJKnnj0sBJRWXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70841710"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70841710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:23:01 -0700
X-CSE-ConnectionGUID: Vje/Dh4ETzaADwX2EGWZjQ==
X-CSE-MsgGUID: RwqXnpjZTcSBoW4UusrECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172143158"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:23:02 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/3] drm/xe: Allow error injection for xe_pxp_exec_queue_add
Date: Fri,  5 Sep 2025 14:22:51 -0700
Message-ID: <20250905212248.3312537-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
References: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
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

This will allow us to simulate this function returning an error like
we do for other functions called in the exec_queue_create path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 3d62008c99f1..bdbdbbf6a678 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -688,6 +688,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_pxp_exec_queue_add, ERRNO);
 
 static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
 {
-- 
2.43.0

