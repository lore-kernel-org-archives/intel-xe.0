Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F05C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3317910E23C;
	Fri, 15 Dec 2023 16:25:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598CF10E23C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657527; x=1734193527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1qP3Jp8JJVqZfcPebOoSRn/W3NUSNs1trHSC9k1CxI=;
 b=boXvQ1fQFgzQ3dwj8IAqjW2g1dKcg14KE8fsB/MaRKzNpbmesJy5ksls
 OBt3jtAxMs+3Zi1396NkqKDZQRxRPkltxqmETTuU23nw0E/J1Pkg0Dm7D
 8RbzlgIXa9qq2SJt4uGPqHOsGMFeuJEU/g7sskBSE89xhxG/1wv63mezs
 3EFYo2uq3RVHjk1QXowOdA4Dw8H88EKLIsp/HFx5WKHexPnlHBvFzh00N
 oTwsgg6fPyOQ8PP6XmvlTPuAiZG8iHejrnEC1MvebzC9JqrVTedshEP9I
 ga+jANoAxtT6VKat7CHFjbZK5KK263gctm71efzRIzNFuhf91zvP7ZVGu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617448"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617448"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984127"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984127"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 09/10] drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
Date: Fri, 15 Dec 2023 17:25:01 +0100
Message-Id: <20231215162502.1879-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231215162502.1879-1-michal.wajdeczko@intel.com>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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

