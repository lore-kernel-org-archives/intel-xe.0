Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E03C04FDE
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CBA10EA14;
	Fri,  3 Nov 2023 14:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8D210EA08
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022162; x=1730558162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u9FDUbTR6vFy9iusZAvVvgQT2MM6HTNH8RQrPzc8e3I=;
 b=lS0bjLWyd3aiV0OnW7mHh8LQ17EfYhrvvvIdbJQMY2dTBqUA8biXaiRD
 OFuGH3AHeLj5qb98Ow7zKMnmDODW0VbXNwDOyysvxCQa5iIUz7Drp5Md3
 PvD+6JYFTQzyJHPu/8dCbtz1eFYk5YJbPeZr8VkJhozSVQzCFYUj0UEBJ
 I5CT4c2BbaEolwQREHyAHrg7VQxJx/2fOhAvDCPENt6FjHjvG2VhZkVDM
 iWcYVblAj7iSTlZJKwn61cHb4b//lDHzS5B9HyuGUbuFnYa2KcgWSnOHR
 4xSOilNcvrYnLn2iwT2qBzBsgALWMVQDhv6hMnLpAfuQyhBRMk/AT9vie w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843529"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832542"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832542"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:57 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:46 +0000
Message-Id: <20231103143456.7-41-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 40/50] drm/xe/uapi: Add link to Xe
 documentation
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Warn users of the uAPI about the existence of the Xe documentation, which
provides useful information to understand the uAPI. Currently linking to
the location of the documentation under gpu/rfc, will have to be updated
later.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5b239c48f19d..3e119bb662f5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -24,6 +24,8 @@ extern "C" {
  *   5. uEvents
  *   6. PMU
  *
+ * Some concepts used here are explained in Documentation/gpu/rfc/xe.rst.
+ *
  */
 
 /**
-- 
2.34.1

