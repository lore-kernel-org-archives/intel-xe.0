Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C925C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 04:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800D210E857;
	Thu,  7 Mar 2024 04:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxmZFDzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DDB10E857
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 04:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709787459; x=1741323459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+DfuoVXvhafnu59uDnH6fOJggLrohL93KonhxS3slW0=;
 b=fxmZFDzwn6TJiI4BBzECjNO+Tb1/KxtV0HdZBXMTM3QNCEZ1eEwSvSV1
 uRM2tw89uaaBsIBI5pIwBof+sdAE3uXligbiWaW1sfDOJKp3lqoJmoaAs
 0O6fW2RpWqKj5WXRQp7iP9ZlOR9SJSUxbJ5Pxq9WyHoZENE249RJ5Gw65
 aDi/hONHbBOWSJXBUNcmgTzWiz2eE9lWDDu3Wq5lF8AfoAwOsD8Cm20Vm
 DfOCl1OTZhYvC2Qq7AjduI45UNFIn63gjJngQtioCQJ3JnbYlsCaNoJDP
 3+QrZHfm5D9QxIvcyo4HuO18QKeBTgtbiFDUnrwpIwzsBU7eCleNV4z5i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4372444"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4372444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 20:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14644324"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 06 Mar 2024 20:57:36 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, lucas.demarchi@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id
Date: Thu,  7 Mar 2024 10:25:34 +0530
Message-ID: <20240307045533.1867892-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Fix documentation for xe_gsc_create_host_session_id which
was xe_gsc_get_host_session_id.

Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index 9a18f5667db3..d34d03248843 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -41,7 +41,7 @@ gsc_to_gt(struct xe_gsc *gsc)
 }
 
 /**
- * xe_gsc_get_host_session_id - Creates a random 64 bit host_session id with
+ * xe_gsc_create_host_session_id - Creates a random 64 bit host_session id with
  * bits 56-63 masked.
  *
  * Returns: random host_session_id which can be used to send messages to gsc cs
-- 
2.43.2

