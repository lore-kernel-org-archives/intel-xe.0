Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B31CF9C6E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4811D10E3F6;
	Mon, 23 Sep 2024 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Ue/5miBt";
	dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2024 08:18:25 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D7E10E562
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1726647503; x=1727252303; i=markus.elfring@web.de;
 bh=kInQ//rPSsqlgcK7FpGZP43VvDdx4dvgsVxHv3VH3nI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ue/5miBtymfmWClE8LciHCo5cZfb0DyDBN2/eMhfG9xAUnLrDaVgaHzbt64cfyw7
 b/LHBaJeXwAuC0tqWqxQBh38Zp4I8T2xg32XNkE/7N30bMzstCiJm24cbOJFKv+39
 f88DaSFZc6HDXd1WCCp0DljsmaD6kMnkNEhtS2QKZ/bhmYM+ZxjM7yP8ft5hQt9RF
 N3pkHpgC5/SmnQiv0L6jXjm6JC9BfG6eI2fc6Tb9NBEKx12wakeJhS+dL5lOmz/bK
 +u7+WtbWLQZh0XdQMOwi/YGZL4f+6kikf9vbly3iGhQEdtZwjexPJyHbNKMy9sFQZ
 kyo8STvBjLbK5/cprg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mfc8y-1sJhy70VPE-00ixjw; Wed, 18
 Sep 2024 10:12:43 +0200
Message-ID: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
Date: Wed, 18 Sep 2024 10:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Philippe Lecluse <philippe.lecluse@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/xe/query: Refactor copy_to_user() usage in four functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1KMy0yAdh4GMhkxbk+tvy/qZLdxiPwbW85tozVJiNzbZLOB1351
 y1EfCORR2QuAvKPUa3Uu4Ky2IV+rP4QYTjXAWmNPfRbFlIwWIc00b9COnmrgieUmd6iIzpC
 fdVGkt7xuob2v19OTCBJk5tqpLbZ5+ESSPbTb+cnm9KVR2HlxH3Y4UZ4bb14+s3XPmzZAnM
 bJiYIpXwLw0AGvmQ6xqjQ==
UI-OutboundReport: notjunk:1;M01:P0:bEwwIokSgR8=;i+Y0FoBMpBnbnH0hcDMkoQPYAMM
 I+ccWEz1jOLbv9zlQmrv6N6nZNl/FdeRR2+6QzFimHCnsgNKGn4YODvweNtXKXWool/reGauW
 4XKrbu1g4n1pYZhdi6vtqmXordcX0BFSNnfxC4+mmSruLrNad7ZbSYcpHSmugYdES9Yr2g4zT
 N9Cn4eQYnzjGpTRhKdm14GUVldutqbwKFuaKYilmcJHzcgRzEh6E8eS4SgagwG3Cb9jzMTIXJ
 lwEhp8C13eyR+kpfl3qgvsnDVUjeFoZp1RQHKfM8TQo/lEaN3HeAjL+/fCU3Iduwzi4c8cPrd
 b1yowroZ82WSIAE/eUVCCmDERztgfuNz3zRFVfZ0paNN87rpNJ5u1uhQn158J+d9su/ghc3UD
 f5pA+6Rybd/LzoCR8FTuO+upXoBv30E6pAfeA6VmHD/uAuUFeq8EDfuDMo1OPbSJiNSJK3IhP
 A8I4HePoS/VA4lAgL0E2KDHxwn3r1LNytNcBvRnwm9dDy0OQOZKNHLHuRvjcziDf2uhuZLH/b
 iHPyCK4BwH+WYAwvfllWco18VKyBHwO8Gg03o3CRDXuPTgeI7llhyErAKfDMmO4Ile2bqATij
 qsQhKkYyndjSNtAw7uEf3xb0l5pdg9eCH+m2jn4lqbxWKanZpn5pRRjsVNxNuSxdEfM8I7zmM
 VK9tsBaNldrZSZKGXv9LJ/m1KSjjCgbI5L5M/uZIk7f5uAYMSGwcpyxeyaKtDyfHaA38qZZnA
 mPVVlH1NySTOufkQRewTIwfKmj6DZbOb29+tv814Ap/su7NBvzkL/Tzrpx5m/FIW/Wmf1J0tI
 JbO1TfITS1yranyTetAabHDQ==
X-Mailman-Approved-At: Mon, 23 Sep 2024 12:40:18 +0000
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2024 09:43:07 +0200

Assign return values from copy_to_user() calls to additional local variabl=
es
so that four kfree() calls and return statements can be omitted accordingl=
y.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..6195e720176d 100644
=2D-- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -220,13 +220,11 @@ static int query_engines(struct xe_device *xe,

 	engines->num_engines =3D i;

-	if (copy_to_user(query_ptr, engines, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, engines, size);
 		kfree(engines);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(engines);
-
-	return 0;
 }

 static size_t calc_mem_regions_size(struct xe_device *xe)
@@ -344,13 +342,11 @@ static int query_config(struct xe_device *xe, struct=
 drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =3D
 		xe_exec_queue_device_get_max_priority(xe);

-	if (copy_to_user(query_ptr, config, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, config, size);
 		kfree(config);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(config);
-
-	return 0;
 }

 static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query=
 *query)
@@ -414,13 +410,11 @@ static int query_gt_list(struct xe_device *xe, struc=
t drm_xe_device_query *query
 			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}

-	if (copy_to_user(query_ptr, gt_list, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, gt_list, size);
 		kfree(gt_list);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(gt_list);
-
-	return 0;
 }

 static int query_hwconfig(struct xe_device *xe,
@@ -444,13 +438,11 @@ static int query_hwconfig(struct xe_device *xe,

 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);

-	if (copy_to_user(query_ptr, hwconfig, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, hwconfig, size);
 		kfree(hwconfig);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(hwconfig);
-
-	return 0;
 }

 static size_t calc_topo_query_size(struct xe_device *xe)
=2D-
2.46.0

