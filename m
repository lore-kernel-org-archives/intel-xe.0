Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF723CA1017
	for <intel-xe@archiver.kernel.org>; Sun,  7 Sep 2025 13:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFF910E1D0;
	Sun,  7 Sep 2025 13:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UcfBxMnd";
	dkim-atps=neutral
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Sun, 07 Sep 2025 13:51:18 UTC
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5508D10E1D0
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Sep 2025 13:51:18 +0000 (UTC)
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id vFeuu1DSwECYkvFeuu0Mz1; Sun, 07 Sep 2025 15:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1757252542;
 bh=2ap9eqNKHrjb2ikA96D2NiiXoAmBGSsCtA7NlR3rYcM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=UcfBxMndMvX+7k9SekCbrbLmxPlAJCfkCfjEloogd0dezlieosh4yEr6+y1JTX9Eb
 jUVfJkoqCy40YuUQ9SW6g7NVsGnEPrCJBlKPqwcYZJ+rkRr9Q7pN1c2iZSNG0tWSn6
 PBYgR0iA9ygw3glxgQKndaq5F9i+QjOyM8p2GAl1nNfhZ9MPRvaD/KJ0h8suUqKPsB
 PgLEicMK1nPj02NKb9DhJdsCLam/w/Cd7JjwK/3SGnbBmL/9yM+vmSsCRVN3bODZtR
 ipCD8UVBCC1KG7fwlq/zTcGzQCZW0q71UtNeb087egEliH/0mXQUho17hopVHGShPN
 BCxFAljoxZKLA==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Sep 2025 15:42:22 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/hwmon: Use devm_mutex_init()
Date: Sun,  7 Sep 2025 15:42:17 +0200
Message-ID: <989e96369e9e1f8a44b816962917ec76877c912d.1757252520.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
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

Use devm_mutex_init() instead of hand-writing it.

This saves some LoC, improves readability and saves some space in the
generated .o file.

Before:
======
   text	   data	    bss	    dec	    hex	filename
  36884	  10296	     64	  47244	   b88c	drivers/gpu/drm/xe/xe_hwmon.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  36651	  10224	     64	  46939	   b75b	drivers/gpu/drm/xe/xe_hwmon.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 32a76ae6e9dc..e65382d4426a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1294,13 +1294,6 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 }
 
-static void xe_hwmon_mutex_destroy(void *arg)
-{
-	struct xe_hwmon *hwmon = arg;
-
-	mutex_destroy(&hwmon->hwmon_lock);
-}
-
 int xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -1319,8 +1312,7 @@ int xe_hwmon_register(struct xe_device *xe)
 	if (!hwmon)
 		return -ENOMEM;
 
-	mutex_init(&hwmon->hwmon_lock);
-	ret = devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon);
+	ret = devm_mutex_init(dev, &hwmon->hwmon_lock);
 	if (ret)
 		return ret;
 
-- 
2.51.0

