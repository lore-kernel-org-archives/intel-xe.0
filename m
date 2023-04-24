Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E7C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686E810E570;
	Mon, 24 Apr 2023 16:52:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB710E1BF
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355126; x=1713891126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1cTC4lmZnc0aGk5FjfX7A+wGt0GBz+NDMQI6XeiJKNM=;
 b=aPtS5lp++g4LE5HXCQY7cwyw5OhlEESvEY0cSb7bYL+rZy8LjOcdXAou
 hCeXRxiOtGYd0XWK0lDiJh8hJE2XIZ0aj+NiAX34qP6PMT93fAtUuGSc1
 RNYOIid7i3X/VLQlQNu1fURsuferj2zHn+3IrsJufBfdkIgIYLZWJyOCA
 FnOJi7lTIfydAzjF2Yh3aCA1sJoL6bRjTMhZVRTYywlcZE+ynDhPT7Zjk
 ZI3URKrQhyykqbHUQK2ECIxjuRAHSWvF7jwV+EEmF5A/fnPvNrhKJwysy
 0iULDOP/GKLcz1RxgUZ+NmLwMEk/0Lu3brR7NICGorl4DUYtYw6BRxWmi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704312"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704312"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785593"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785593"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:04 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:33 -0700
Message-Id: <20230424165135.132494-14-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/15] TEMPORARY: drm/xe/display: Enable modular
 fia in TGL
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm-tip don't have has_modular_fia anymore but to backport it to Xe
would require us to backport several patches, so this patch is
intended to only live until next Xe rebase.

TGL is the first platform tha has it, this is needed to properly
initialize TC ports in some skus.
Enabling it for DG1 don't cause any issues as DG1 don't have any real
TC ports, so intel_tc_port_init() will not be called for DG1.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index af18e554f57ed..9bfe93c3aca64 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -489,7 +489,10 @@ void xe_display_info_init(struct xe_device *xe)
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE:
 	case XE_DG1:
-		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
+		xe->info.display = (struct xe_device_display_info) {
+			GEN12_DISPLAY,
+			.has_modular_fia = 1,
+		};
 		break;
 	case XE_ROCKETLAKE:
 		xe->info.display = (struct xe_device_display_info) {
-- 
2.40.0

