Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C29CC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EADD10E431;
	Mon, 11 Dec 2023 10:17:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCC610E3F8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289865; x=1733825865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IeA6QGTdYkBqLYY9T2tOM513mqaljkH5tGpwQNdwL4=;
 b=df321zlFPWvahJW5yYD82c4LyNchKwQGGl4mRP2QXrKGlq20bTtGYKtD
 n+MvptZejpSDARESPWu0MyeDPWUeH4nWPZ9VRabKqgjGWzCve5bZWNKgH
 oUKU7QQrEKsi20txWNsUcDY/m1VShQ7wY3GmEdfLEK0wkPNyaqRxypgJ7
 QVScA+m86Mty0SY0RjUl9wdhmeyEbabnYQitIdR7/suE/kIqP/QfrgQHC
 WTZ4kkRcMmKttM/QtCg37Xim3BMQA2f24b82qoaBxKKvZhIGuIFDIdcGM
 qOR4qXHxoGQWoTsfAvK2zU1rpGKIcf6WfvDpvYjH6xu1kZbTR0jq/Vtvk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480816335"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="480816335"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766321920"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766321920"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:43 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
Date: Mon, 11 Dec 2023 11:17:18 +0100
Message-Id: <20231211101719.1659-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211101719.1659-1-michal.wajdeczko@intel.com>
References: <20231211101719.1659-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Tests might use locking, better to have LOCKDEP enabled.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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

