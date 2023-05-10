Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583A2C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81BF10E511;
	Wed, 10 May 2023 19:38:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2600910E511
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683747513; x=1715283513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXMdc3TYfCWI9oEuKDWKaD4QXVvKpTm0FdP11n0lt4Y=;
 b=kMGNY6qij7oNpgBEmzNEOnC2I51iOiAkKdw4+dJlbliRPM9RAHypUcX9
 fbDqirLIaaIerzdVM59VK/52A1O8ImYqPfXaNiA+D0PnhRC0BNScA4jjC
 jqpfXgP6MC9LbNnQLoKOact/7zJYYe2XW1638QLpzYx/oo1Ohl7jb4926
 8djR4FHrJxLb6FmMMmvWYNwkwQwuxWhPgeTxUDf2uSxY7/RWidMpACNz4
 ouL+C6Hok4exy5nKBSkvWl0A1icoD34Hssn2fjKnYh+Ib7NoKCcqJrxvR
 NDc1VmVu5KdqnVu2nXfFA6Ah1WmtC88W5nOxG21ad2dI+tZpbHBX+n4QE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349139046"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="349139046"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702396820"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="702396820"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:38:30 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 21:38:21 +0200
Message-Id: <20230510193821.9248-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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
Cc: Jani Nikula <jani.nikula@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Unlinking display will lead to guc tlb inval timeout for
the fbdev vma as irqs are disabled.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 32cc83c43b2a..430bd6eb4053 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -349,9 +349,9 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_device_remove_display(xe);
 
-	xe_irq_shutdown(xe);
-
 	xe_display_unlink(xe);
+
+	xe_irq_shutdown(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
-- 
2.39.0

