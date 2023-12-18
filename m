Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5B3C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCC010E3C1;
	Mon, 18 Dec 2023 19:07:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6051E10E144
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926407; x=1734462407;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fblA+pL2ejW5EKcJGWGCcnzftP5m04FFp0OrHWcz7ys=;
 b=H8tIv3pBo76rS4wH5Rh0MmqO0XX2rdVAuW2Q2qdlXWJygQVOd9sSUGEe
 cD4MkA+z/qGuxJ7P/fRL4pMqC5Ad4JXNuoCHNULtufMAN7hOyBc6L372r
 t1k2woDmUtN6ukVvpHjBWX6+TvOCJQ3yyO7qNPQMCcG7InAxnw8JzYAyC
 otY1TN4f/xw4N44RNyV4Ka1mOiTOg62tMpOoAMYuoQEx4Jrmmlj086ftk
 ibypEjKsX5S/OsNM/BpjeymnhngUIz1yGOCLxnVuxmxc0k0iFiBOeNoLN
 JGzdeEUzrw76fm5hVDtn+n/hGGe3POdysK5fQrEE/iMT4g7WX0O4l4rnw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382204"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330886"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330886"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:46 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 09/10] drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
Date: Mon, 18 Dec 2023 20:06:28 +0100
Message-Id: <20231218190629.502-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

Tests might use locking, better to have LOCKDEP enabled.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/.kunitconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
index 9590eac91af3..ad4b9b4a9f55 100644
--- a/drivers/gpu/drm/xe/.kunitconfig
+++ b/drivers/gpu/drm/xe/.kunitconfig
@@ -11,3 +11,8 @@ CONFIG_DRM_XE_DISPLAY=n
 CONFIG_EXPERT=y
 CONFIG_FB=y
 CONFIG_DRM_XE_KUNIT_TEST=y
+CONFIG_LOCK_DEBUGGING_SUPPORT=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_LOCKDEP=y
+CONFIG_DEBUG_LOCKDEP=y
-- 
2.25.1

