Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C2CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 19:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDE810E3A0;
	Mon,  2 Sep 2024 19:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8LhcSvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B5E10E3A0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725304060; x=1756840060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t+6n73JBCmuZcKIleonx7Q4Vz65C4mTMrgVkl3A4NBQ=;
 b=j8LhcSvIFY0WbzDdO6zmC914H8assosurLM5L8LlDSCG31UAa2ee5xTF
 1LPWvnfVnjqZcxnws62zyejTvpl4AQnu47Dp8dQQy+NKdaofUt+4/Fqct
 70pRngjKP5AG3hqe7Bcgy/lO1uBZKojvh1T79cWFf8Sjpn9xrauOhdzQm
 LjPv7GGX2GtyEkUUpyQRIKqapughtEYIiYKK7+T6crbHx0jRXOLjz22g4
 Ce4OuG+RhYNSlZgnRUvf6c7KuxeMTcNrjZ79Wj++A14Bm6YA94JRogDzR
 HTA89CI7o/adAObza0RqKu5HWfDEsmJgjnbe1vXCPlYre/CbWbhWKLAuD g==;
X-CSE-ConnectionGUID: d7Y/BDokQgKDXRHLrh00Ew==
X-CSE-MsgGUID: OOVJVlt9Qhuqx96TrulVUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23404643"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="23404643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 12:07:40 -0700
X-CSE-ConnectionGUID: tMWFYXFVSkemBlziv4UHZw==
X-CSE-MsgGUID: 0veYVmRPTW2G/9Q2d7XQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="68817831"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 12:07:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Remove redundant [drm] tag from xe_assert() message
Date: Mon,  2 Sep 2024 21:07:26 +0200
Message-Id: <20240902190726.1748-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Since commit 178c0a33c421 ("drm/print: Add generic drm dev printk
function") the output from drm_WARN() includes previously missing
the [drm] tag, so now xe_assert() is printing it twice:

  [ ] xe 0000:00:02.0: [drm] [drm] Assertion `false` failed!

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 8b0cc1bc9327..e22bbf57fca7 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -81,7 +81,7 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define __xe_assert_msg(xe, condition, msg, arg...) ({						\
-	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
+	(void)drm_WARN(&(xe)->drm, !(condition), "Assertion `%s` failed!\n" msg,		\
 		       __stringify(condition), ## arg);						\
 })
 #else
-- 
2.43.0

