Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E8DEB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 22:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0A310E37D;
	Thu, 22 Jun 2023 22:43:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D16310E37D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687473836; x=1719009836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QExWwNRPRInX/RVT9MSLfh7jn3iTbbT2qoB7QzGZUuw=;
 b=Px/cjFOEQfHV5rNkGywb02i7sju0yRqN6i2D3L8N6gXfrc3jcGMhG+SN
 3PEK/Rr516NXDTGFNIEk3jLcQGmdUpqKWKUPP9iMp3CNUtHt6qcwa0T4u
 lLF2d+L4eoQ4rbMoO14T1/6Dxg6Z+Ryi0XIEf3mEjLuehF4JDZvYuWL23
 kJM+dwA2/0MVNfELbnmjSp20GoqQzjsyzGEjd2Ar/JKDLPiKlvNXqhyMM
 Kv8Xnd7qENQgPgZe6kIIzeneC3oZooo46HfFVdJELWi8iDLPYU6uDOK5z
 32LQCz0A3V4TwnhvaT3V2Ajt5NphCaKqOfk0Sw4rwT4CV9BwvC/TcnP4h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350394284"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="350394284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="804987485"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="804987485"
Received: from unknown (HELO przanoni-mobl.amr.corp.intel.com)
 ([10.165.21.200])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 15:43:54 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 15:42:54 -0700
Message-Id: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: check for negative 'len' in
 xe_engine_create_ioctl
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

There's this shared machine running xe.ko and I often log in to see my
tmux corrupted by messages such as:

    usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!

I also sometimes see:

    kernel BUG at mm/usercopy.c:102!

Someone is running a program that's definitely submitting random
numbers to this ioctl. If you pass width=65535 and
num_placements=32769 then you get a negative 'len', which avoids the
EINVAL check, leading to the bug.

Very simple reproducer:
    https://people.freedesktop.org/~pzanoni/engine-create-bug/

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 6e6b2913f766..3d35d9f94894 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -530,7 +530,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	len = args->width * args->num_placements;
-	if (XE_IOCTL_ERR(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
+	if (XE_IOCTL_ERR(xe, len <= 0 || len > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
 	err = __copy_from_user(eci, user_eci,
-- 
2.39.2

