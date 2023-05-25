Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C4CC77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 08:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B49610E7F5;
	Thu, 25 May 2023 08:16:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4F10E7F5
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002587; x=1716538587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4n8Yvc9ITGjxW66pjEXgifAkzmd+L/dEydea9oBS1I=;
 b=dA+Uk3aUi0apR2Qb1who1a062R2HzS+bnLwJHnt4cTFmjK9FzexDUUVQ
 uvfxr/4oXMRMhhb/QYcNSbmAtYkO+ePkXKut0Z3U76c4m6lgTiFak6vTj
 3sbd6wQptoWZQHJHBVipso4BPsNqCQe84/sAcuq6lXi1fGyGPR+p6FnFG
 lOG4IeHjWRBi7VKDNPRqjrSWGjkR1d1bTKuBlpS9lAvx8Dze0waU2mQwd
 fIPbAw2LEnffDq6JreZ4Y+vbIZ5xp+V4JAluVeQZPfGxy1wNSqrOdCOJo
 E3rb7hiqk4X+Dk2Vc3YE5qFRugUF/SxgBtppjY6Xpm9uXSoKGiXuvEYfO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="351333884"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="351333884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="828944166"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="828944166"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:16:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 10:16:15 +0200
Message-Id: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix engine lookup refcount race
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

Fix a race where the engine could disappear between lookup unlock and
xe_engine_get().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 094ec17d3004..3a400a546dfe 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
 
 	mutex_lock(&xef->engine.lock);
 	e = xa_load(&xef->engine.xa, id);
-	mutex_unlock(&xef->engine.lock);
-
 	if (e)
 		xe_engine_get(e);
+	mutex_unlock(&xef->engine.lock);
 
 	return e;
 }
-- 
2.39.2

