Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00767C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 10:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABFD10E0CA;
	Mon, 12 Aug 2024 10:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMuA60m4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEF588EA1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723458638; x=1754994638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ysm8HuM0CPlvglpD4V4sNrjQFY4ILcsuZ0Gq7ohQpXY=;
 b=mMuA60m4WEqQIQKrS69nzCc58GHhu23M0gfYzb8aMq924xKjuo7RiEZd
 jYCJ0Mm8VrEREHkfF+hGkLAiK8NqT0ZUGnN+T/zkai2JbYjtvO/a/7fmw
 XMYyn2r+KLevY9iJQLYGHUv98yWaZ6l5RMuY7n9lCs1ik7ITWmn2PQaH5
 MaEYKJz8xzEzCBforQmFhGUl2QDwA/Ts/+P4ao/yALf6u1Ajgg8QXEGgt
 cnmx9jBZ7WKp2aM7k3uAVa3b7X6BqUi2g0ugkflhYJHFJ3c+/2k/jmdle
 hLlkeHIEXSHznajc0L+LglAZACS11mWbZU4GFFZkVfqp7bSo9oqZEftAh w==;
X-CSE-ConnectionGUID: a3cbThi8R+ui36ybDcrGkg==
X-CSE-MsgGUID: cFnyk3i0RpKp7Xea4ivfWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21439095"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21439095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:38 -0700
X-CSE-ConnectionGUID: mgAvAy0JRpS525qX5H1D4w==
X-CSE-MsgGUID: o4EipGW9REWUX08E34llzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62876553"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 jani.nikula@intel.com
Subject: [PATCH 2/3] drm/xe: use pdev_to_xe_device() instead of
 pci_get_drvdata() directly
Date: Mon, 12 Aug 2024 13:30:20 +0300
Message-Id: <1b87c2e56200e001ce3a5d2f4a93eb26b294df32.1723458544.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723458544.git.jani.nikula@intel.com>
References: <cover.1723458544.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We have a helper for converting pci device to xe device, use it.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f818aa69f3ca..7bb811b4a057 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -752,7 +752,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 {
 	struct xe_device *xe;
 
-	xe = pci_get_drvdata(pdev);
+	xe = pdev_to_xe_device(pdev);
 	if (!xe) /* driver load aborted, nothing to cleanup */
 		return;
 
-- 
2.39.2

