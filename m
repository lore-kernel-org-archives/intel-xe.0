Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9B9C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7010F3EA;
	Wed, 13 Mar 2024 10:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljiMzK1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11E10F2BD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710326513; x=1741862513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2dmPlhhQfwxu2sfzgNzRb1vYyl88ALV7Ky3SKs3nLk=;
 b=ljiMzK1nZPQvsd147nQTHJHctRVsjO41mspeq0JI6Xa1vlnSjg0ZFZX2
 i2BM5b0lJBqzYmJOH435y0r4K3nHvUsHCU5VTdt24VXeu/PRRUp36+VPl
 1DAcisgUTS+28PDNXCaSZ+xAR66KFR+093PDW7fxdEbYIxy6e1kYPZubl
 aEwgq4ByRaNskRgw0CKKRhZeArIx58W0Vq40bPp+KAtjQmboH8wJM//99
 ey/lCGxzW6jXByzR0h69BNXY1Qko91szXSmM5rb+dGRWiWCuM7qa3mMoy
 geFvYfVfkkOtoMHKJ1cZAhC53lRmtWhTsoXKR6WfPMWFUBBzkCVh39jAp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8025298"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8025298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11798999"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pf: Always select Multi-Level LMTT for
 platforms 12.60+
Date: Wed, 13 Mar 2024 11:41:32 +0100
Message-Id: <20240313104132.1045-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313104132.1045-1-michal.wajdeczko@intel.com>
References: <20240313104132.1045-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The Multi-Level LMTT variant is not specific only to the PVC.
Change logic to select it for all new platforms beyond 12.60.

Bspec: 52404, 67468
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com
Cc: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
v2: prefer GRAPHICS_VERx100 over PLATFORM (Rodrigo)
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index dfb0e1887615..7f504392a8bf 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -35,7 +35,7 @@
 
 static bool xe_has_multi_level_lmtt(struct xe_device *xe)
 {
-	return xe->info.platform == XE_PVC;
+	return GRAPHICS_VERx100(xe) >= 1260;
 }
 
 static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
-- 
2.43.0

