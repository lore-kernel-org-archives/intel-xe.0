Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A9CEDDBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 03:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3010E847;
	Thu, 10 Oct 2024 03:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKitbfk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226810E846
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728532149; x=1760068149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bEHE7OhqqvFM7s3OWKTB8zgE2Fc2V1AeaPJ2Ffl5Fjo=;
 b=CKitbfk3ouBp16msnJ3/iejKnllTV3mXRHbCrMkpGIdTKTXAey7OdQaI
 uZGJm7n+PixIINT2jvanZh/8J7VxfGRi3YwYT23/+T3uixgN0Vfh9yYtC
 X61cYBXL2zTl9a8B+D17S4U4ViuEtzwdkJ3mW8R6hKTiADp6fIS5YYwHg
 jDpaequSxyYfKNjAoWXkc0Dp4NoQrKZtXnK/lieQMBFNDg5INQBw7hBXe
 d2inVsZH/x0YOx9PHCuTQaepjw2xU3CVXI5EDdPWmvPgNcmCuwDOstxUV
 US/FCfMJijvjUm5yJ1qmTTLdJX/PAdaM3syqu0ARr0B/dc6q+ZMzyrlsJ w==;
X-CSE-ConnectionGUID: A+NL+pA/TVetOPMrueFunQ==
X-CSE-MsgGUID: e+ITWRPvT5qukLEbbp0J8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39260302"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="39260302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:09 -0700
X-CSE-ConnectionGUID: iA4p+UB6T9+C4mCV89nuYQ==
X-CSE-MsgGUID: /o5M7Q0eTwmu+YLSpzNxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76353497"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] drm/xe/query: Tidy up error EFAULT returns
Date: Wed,  9 Oct 2024 20:48:47 -0700
Message-ID: <20241010034847.389734-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241010034847.389734-1-lucas.demarchi@intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
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

Move the error handling together in a single branch since all of them
are doing similar thing and return the same error.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d86959076b078..cd2799c0ba510 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -163,16 +163,10 @@ query_engine_cycles(struct xe_device *xe,
 		resp.width = 36;
 
 	/* Only write to the output fields of user query */
-	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
-		return -EFAULT;
-
-	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
-		return -EFAULT;
-
-	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
-		return -EFAULT;
-
-	if (put_user(resp.width, &query_ptr->width))
+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp) ||
+	    put_user(resp.cpu_delta, &query_ptr->cpu_delta) ||
+	    put_user(resp.engine_cycles, &query_ptr->engine_cycles) ||
+	    put_user(resp.width, &query_ptr->width))
 		return -EFAULT;
 
 	return 0;
-- 
2.46.2

