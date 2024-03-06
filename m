Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFE6C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 20:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8547711319C;
	Wed,  6 Mar 2024 20:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agzj+z9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F11710F0AC
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709757125; x=1741293125;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=So/1mrqbIDPGmEek3WLRxox/rOi3+pxx7nbOCgNmqaA=;
 b=agzj+z9lV5FICxT0RK0glaVdrgSV+VbR89ZbZzbq45B9Y+4X9ZHc9d6d
 3tPP5UKoDoXdih32GS8SCC/zxFkXFuh5FeNHoaD1egd9JoVY82oYifZfs
 z9ra4vs/edwuaKfx8u01EdHJj7J7Uprof8JoFQ496E8EIeyOyAJupxHOl
 E+3yucp8IX/SuSvay2Bmf2khe+ETkHiv5FuEG+z7kIwZukMcCFCKMeFhz
 zNNq74mPH3wUkkqHpyI4qh6E3cQwXoGbmHNUT5nL5M0R+ZJzip71Vt3Dt
 /6t/kuoQSQllFMHqjKvJ/pbNEAaTWTv9muIsHsvpisXthKm23X/1ibHJf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15807400"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15807400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 12:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40762317"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 12:31:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 12:31:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 12:31:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 12:31:21 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 12:31:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjyTeJ0yR41MCRuCabDvYdfy4LvanSrGfBnoUOWeSq13falpexwXxkAEVyvjxos8MVTW8QlzW2UQdPhETmxUa7Uo2VBxHNx1PUlnXd9yCGhmoj0jL5JXjskemUn1Y66wDHCaOxpRb3XNuODQYlzXgzoDu+3cV0IS8lCUhiUVtcJ1FdH3kaNkk3Ixbtrk8nzJOGLoFqaejgwIJ8gdfGenWRqDQqoO+dygEP86oy61siCC+w9mnoh9LWhMkwF2JUhuvlj3nH3aURZYwCC4sJA2lQnY1iLHx1K7EShoqapapmC+K5jSolAd8hLL7PweJLQF1FqBpB7DWREeCD5BXZEQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVsDNP3V/ogilQ/BJzZg1SnEkRZYy0DzcbOf/GhXz+M=;
 b=FF854gUoy72btrqYL9iR8z1IuBWrEnrePGAUZX+Se8whj5yYmt+W5gdyS9uBP+ASrxBg4v7HezMIEWdIFDb9GxOgohkJPX9Gnt7WM1suRXixl5nvZg7nEw5erRb6mWeirn5Z6zEWsLcw7rLEBy/isVAT2aRdgAJ2L/UlpkTBQDksVPQYGMgA5rhDVldgkbCbeHetu4ySP6eLH2yShjet9NwTMHceRU0Q3DCSnsE/XYmKYb5UCRmUDq3GgBu5DK0MB0F3smszIjxvYoCe9jZ/Ds7L87qpvv0mn6rcoo+NxqV9TnQWmBaTmUfjDhq28AFZB49QhOZaOwRHDfGaAHT8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 20:31:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 20:31:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Return immediately on tile_init failure
Date: Wed, 6 Mar 2024 15:31:10 -0500
Message-ID: <20240306203110.146387-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: adce6f67-2dd6-4ac3-aa0d-08dc3e1c605b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ti/XHSWKoJmVxQDl4qbGNY2NYwf5uNA0Vmme+eIdi3RCi1c1CtBI0F8pEt+AkoZgmtPQROy3qZ3mVXWOOatmk5YtfimD9CW9DBrUwKSDZ1P2v1bRrRyC9PYrsVp0/VQAvA5hDW0KFhIqIFBspnacUR8hND/5Tufq9pXOcVp/9zJT/exB38Ilf+0B57BgKvgCLP45YyXXOO3ecyN4WwCMxFNC4+eJsvznzLXnQPIQ/vnh/scRcgGG1+2BWO2XcTxKqwQxsYqTr2UjL5uFGJ287UmE+ild4xN9SYruwmu5oTcfXKiSorzVMs6WUpO1Blg2LcvcQl0N+av81hXjduzrenxkYhd0eFf5QnFg8+UXUGnkAZpEebidmNRLog4hSsV6lAnBv0hol8OC+nDQqYeLmfuGu2Cc1mXw8keCplLRRy5lY+Ds68eOWeKXckQg1lqzskvk0RN1SGtrmcE0meqtP3kCjdlctf0Y5RYiC4Lf3mwjBfmDDtpQNKZ5uQbZCDyn8wH9YDNY8pITkJM5bHUzcfDgJFNN6w4ba7cf4dM9ZN+8m+9NFt9XwUn18EgoQ4mkLHYj96OoDhwQVB6NlS3v3NPHP/RXVypdoEchRG+bn/miLZBEsF/6Gqp8SpFtzD3yUooB7cnFpB2xLcwYlvm019Ag6Wgof2UTJbee0BM/5Gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXnH3uuw8x8IKkkhWGyfjLjFf/rbSLAt5sFWGS9FrxKsE3Zqxow0IMNYaQBb?=
 =?us-ascii?Q?NY+nvL+1kxtmhumtr986KGORYK+gMXbXyWMFaiIJrefViUcM1SdNqXRSeQ1D?=
 =?us-ascii?Q?mMymqC2mwdQt1Bm22J163YAtRhZDmFkifjLS0kZfJk7QYAcnsM0dfYIt8300?=
 =?us-ascii?Q?ZjxcPtNH+1gX2atcO1gN8O5jIdUbcu1ovRc/zmihmxKgFH8bEzHSBBItt8Q3?=
 =?us-ascii?Q?sBuYCkIdAi/mDCKgVcKAozNmaQpvAOWgv23zyVmI0fAGm7zjB4rAhg4KzZpV?=
 =?us-ascii?Q?NZ+YdHgT0G8aQnBc0fuoPCOhxQveIWaxKJTJQfnDwhUlDJkIhvc9VqPtIWlW?=
 =?us-ascii?Q?G6NVcXqUx4t9vZ8TX7YitJX1dJ/znot/w6Or/acNfAMNrvw7EQ3lJOtVmynk?=
 =?us-ascii?Q?y+iWVGnhlbbLzrSlI60quWbqgkRNLLO5yJvassBTgLSst8p4lDxiS8UwsRTh?=
 =?us-ascii?Q?HG8rX7I849cgRfYat0izr5zzf6m56A/JurMuzxobwuMi5sjK0220TRRAFfut?=
 =?us-ascii?Q?PkEYXHptzjuiy29lgaP8l0q4TDI/TpbuEFKAO3Ecb+NiqO4Nn+Ex53d6WK6v?=
 =?us-ascii?Q?H8w4dsxUaFp8geku1rr/sPB6aqHkhAXNOvn1wUbPM716ZqxsU772d1BPd+Ek?=
 =?us-ascii?Q?4Mr+EckIn3RrgQbCCj2E7lXWFGReHUlZ2hPITMZ+U0zJpY8A6GCWgXV3c0E+?=
 =?us-ascii?Q?WHUn9SpvohhPF322lxMiSXEEo4Tqazx0DzUXVTNQHXt4a60WdRetVwxFgk0P?=
 =?us-ascii?Q?QGfKStzv7ImE9bk4DlchH04z0rLIHqSApwxu9kxO1wvwc3IMb06mJKKVQwMQ?=
 =?us-ascii?Q?wbYCPr0SnotgWGIYfvoh4BiUi7gnfeZ8TR1SwrYclxDUDB9rZ2GwLbTKhicM?=
 =?us-ascii?Q?9s0YdWDT3ZdwMvm6iy9+MMJKFApuNY+LK121KNuzfTowMmWMD5dsDM5l5aS2?=
 =?us-ascii?Q?hP8arR5ei+ww+QHEuEzuaK9vLKZmG3Vu0h54paXO/+iHFEXjltJS4xRwfEXL?=
 =?us-ascii?Q?gppTky7TxtIZn+Lbat+ORwF4f5GMBq7p8kB2NLsv6gJU42fchqhDaNMdZufS?=
 =?us-ascii?Q?o0bj8xk5OGWIHYT7nT4tBa01Rq6dUSqaFeD++e2eNGGTdkLYvZkgkBpOg+i9?=
 =?us-ascii?Q?Fbb05FpslUkqxWHVCZTeIE3MG23b+69qQKGY9TaiWvJPeyveeHhj/CyXTbH9?=
 =?us-ascii?Q?Ay46J0fkrLrlqfymGo9CMoR05VcMBBSKThVZ9rmmPMEErgAHlraj5LlY7pmb?=
 =?us-ascii?Q?DG/nspt7NuS1N3UXhP9vQE6IKlZrS1g+fPV3QSphP13xqpijFNldIfmscvZ6?=
 =?us-ascii?Q?KI2bQVyqLViwvKnQypnYbgAqhl0YydR6VFZi7ULlwAsWN80lXvIvomDbLqMd?=
 =?us-ascii?Q?Qytt1Jg5hTI4VovUCmxpTgFh4jKmJwRnjQVyYinfrZxW3sB5CJsokXTRZ28X?=
 =?us-ascii?Q?Vk1Av8KX3rieHcTbbDfkjsoFYuXdH9YmsFFVqRPAAWCiPPrlbyDbEeBSyFZV?=
 =?us-ascii?Q?vq7SsligxFMFb+ffzMet9+TXxrID0cuLnxR5g36XmYpn7JWMw07Swbm5ygwF?=
 =?us-ascii?Q?VBVi9mgfU5vTCxelze6yXjND4adud6k3p985yn294wXv/iqOZoTkE9gpceX1?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adce6f67-2dd6-4ac3-aa0d-08dc3e1c605b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:31:17.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHTL0slXl5P5NO74mxgmE7NNkk3UZaji0nzAAdbzPdDwgFSEQcEwjtNu1mRp66PH8mzrXda+BkPh9nvJOHuYqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7748
X-OriginatorOrg: intel.com
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

There's no reason to proceed with applying workaround and initing
sysfs if we are going to abort the probe upon failure.

Fixes: 876611c2b756 ("drm/xe: Memory allocations are tile-based, not GT-based")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 044c20881de7..0650b2fa75ef 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -167,9 +167,10 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		goto err_mem_access;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool))
+	if (IS_ERR(tile->mem.kernel_bb_pool)) {
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
-
+		goto err_mem_access;
+	}
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
-- 
2.43.2

