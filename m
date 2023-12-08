Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18CC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B6610E9EA;
	Fri,  8 Dec 2023 06:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93310E9DF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018023; x=1733554023;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zqo2i4YF8u3Z3xAGHOklnF2EIVG2DZiK7/vUraeApsM=;
 b=SUYAETpLLntHywEM6F5WdYdkbtWloLrGc5ekL1uHzOqhTysvfCbUg3Lu
 L0he2COIFhv3I2eoL6cm0+K9Q0WpfKeKPNjWMBCqTj1T8+HBul2Zy4iZc
 oSwEfUgl14Xcx4GcGE/rGg6pc/3aFAfZTgpUVxhHT4wELQNO32BYTxIxG
 h6Hx7fhIk1QBFN4dzBDQwMtom+do9Z8rqc15zB/sl/4xR4yXTA+CTwdWk
 USRu93Xz2aK70osCEIFGq+ofC2fjUvSUZQR86ahZ1SqKUrVQn+47GhB2K
 THO+ZrkPfoEBhyDSyNnIKu4wNC2678NRpCPtMucrgJXgGYG/g1SeYSce0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398234896"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="398234896"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945321358"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="945321358"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:00 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dctN0oo1G82R463qHMGeqDjlYfgAikb7jim0tF1DOPfK+Z0+99yGkmI7kRxdLZlGUZ0LIhD8dRjtL7rXCluaJiTewqMYtIJcbZIikaP2CNJLhgJ/ljkjhuGd/4+RJHqr6konXK1wfkhtVgS/fp3Qk2VMgqXYwvecEI29A8ebQGOYSRFisj3s1hCroXgLZ7leUg9kspMmByAUHfjbSpIum8yucTBhYTRs1Ic04iId/7P8tcQ1jQbJZrKCet/ENm+5UimbEtJuHKbNjXMTqn/CqwU/yvoqiIr+XuQhit5LGpPkm8y0qUpQQnO9Jl89yewsDJRQBQkcc+ou4019UUr54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVqJFHfSHHXUOR4mHe0QIx7qRJIn5/no/v2p9bkNEl8=;
 b=VgZrHZQCetk9fe6IsL3xRCc6e9LXb3umEr9QSJENJaWwB/EW/cViCybmwnDQXCsj+414o9KZD+6LDABpLNj8Q1KB+S90V/fnJydFQYg6x/PVi/UKmUpsg2F6F1wywEGqvMyN8IEsvbDVMaeLSh2b7WUUEJaJHrj2yCYXqVOzWqNI2EpK6p4+ONGQcEhmHBFSpP1tqdVZ8mu3Z2WhRGFqnwFgNDPmK6DOZkNatTi+pc0qlY5dGfC6emeWxEBei/j3BuDd+jI41ZpWYu+vtuPXT+Ql9Qa/JmOI5DtF02syQ3+BZnB4zXnRwykQTlhBL4gOzGXJmr5h8jZ34YILKrX+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:46:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:46:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 04/16] drm/nouveau: make use of drm_gpuvm_range_valid()
Date: Fri, 8 Dec 2023 01:46:31 -0500
Message-ID: <20231208064643.877688-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: be2cfcc8-846c-4376-a4e7-08dbf7b97945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5I2nCCnqDSBu6VA7/qu91hhj24a32VQ6eYgfR5dataXo2zcvb/sa33CJgDTFgvXHNnEwmctmFLsR5Tj9zraTRxEsARpjWJiXr3pVRhZ9TJM3U3Sp+yhJqcoXK9T5V6aTeLGpMST4F461j6wczmt05kt1ImMUQMBQx5yGPQgQ5m+eewvEj6RtyEtvDvcGD2njg4mJaGTuKgYxjJgQrQ23l1O9x36/20RUJwaI092jqK4ZBCZUjja9AjYSzgVRkVOu6NuEf+eLWQPoE/QWGuAsSaNLg0GsiiEmnFbWOBhtR9/Q40YXnryXXXTnnmMEzQGiU936GaAcSdFzyr53b7k5YxkyvLJZX68ntXhJ4nLkv3UPt7PUS7LrP8j9riWBlbZTLjhLo2nkLkMEF68OCY3P9IT8V61APPdESLKb/4Ek4n3K+gOk0d9XANLipxf4lxPG+KLhf/fVFkcQx+j1rNMSmdTtufj/EqODr1/w1NcGdba2b5Y6TMvIv5Bh1fCzHKfs646RpH0AOY3cEdXt8rf5JX/PpuaW1cFVGtWLIsx9I3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?huYrSKNzvKquJdWmjsdl2Mbt0G67vT3hvBbCzuyNYWoy2vGDhNajbehNUCXh?=
 =?us-ascii?Q?QWk4PaSg2u65OD5ovoVL88eUB3Qg9Tzexj1hqoBROKI4n6gd3GQeWzexLF0M?=
 =?us-ascii?Q?QLPgburAkrEJgzDsNKyIbJdcbR86RyZC/64SR7kjcajA9L71BPcFz4kcVjo6?=
 =?us-ascii?Q?q6gLISrPDj4Dxt9y7dRSy4Ym1vRbL1ykCtZz7LSE0+hghVxgIeSgDl0lDmVy?=
 =?us-ascii?Q?ja4zG1zTfzASlNUPWJOmgCjDcZhdyfIaFQgHlHF1mspvLmddI5rSPqdIpTfC?=
 =?us-ascii?Q?3Whf8rPI97xitJ2P1fwDQVbHp5hCj0IzQMg1c86oL6VGSzj3bw6HNg1FZXWk?=
 =?us-ascii?Q?5+Fg5vszYU/t4VSjr01cX9WjUcsd6yx2T98xSLECngMz67a42AjjnuS5vqSc?=
 =?us-ascii?Q?TmkUMfoUgonli18+WovSInxOsLEruuVIMvVHFDBOPFkFsS8eDGqbgrX0vaw3?=
 =?us-ascii?Q?ZU8Il726yUzZ8HaHc5z6o6ksQnq3VQnmRtV6hmRFucgcm05VmOvxnV9WapRY?=
 =?us-ascii?Q?GcSzeGC8k3JK2Y9FE1ojLBEGkP87eqjwFevQLAVDdV5i08ipD5vi9JVTijcU?=
 =?us-ascii?Q?BzhQgqtuWNHgIMisAxBNmlMah7YH9oRRLo4Wm63sAGEa/xSus6Oa1nWNddbJ?=
 =?us-ascii?Q?zuQidpnp3a4iNy+yp1ts/QCVA5JQP30i1cP95OIvqKFc2IvRS7F4J0SaUhJ7?=
 =?us-ascii?Q?5Zpf82FFeD4tP7P/4FHnrtTViDfrdgThX07aPovzJiyZ9FADcMWyBAZNjhaC?=
 =?us-ascii?Q?Wly/6GefEqzSdhxWehTtOJFK/O1vfwl34CGM4KyWR7QvvKFGlc7T3bgZH0fU?=
 =?us-ascii?Q?zCr9egd+uKMNv6j5SryFE2EvKqby7oRILBSwsQzAivCDdjzpTt9ZZRQTQfeJ?=
 =?us-ascii?Q?fHaA+oHwa8SqXvfLm3RvGJWkBOVQe4ovxJufQKYegURqcPG1dOxOzLjU1IrZ?=
 =?us-ascii?Q?BrLXN2Y3NkjxWdQ8tH8E4jHIDxuYHZRbBa2uZI9ab1QZIvJAygrn2Q02Ljwk?=
 =?us-ascii?Q?TSS5gra/mPolaOghanKyQsr4y0fgW6kFM2Ygn5DXy2pBMnkTNS7gT4c6lxbh?=
 =?us-ascii?Q?JyJcvK40D2nOghuVGZ7m1orO98LOVarmcNJgNeXB8Kj33WrJwXDUuSThF/jx?=
 =?us-ascii?Q?F333rc+jXD2C+/XFmdeKTpEh9l5mVkle64SIkVM8gYMwkjZZfRz2PdUzI4Zz?=
 =?us-ascii?Q?1WMH56EiW1tjbw8+j19zq/lGHrBtZ3CSDdw95vzCsbnW4XFm8AeYJYYTLFP5?=
 =?us-ascii?Q?HUsK+wSsv38S+y/GPqjHLvN02QXpUkcTYedDauDyFj+ZtAaPc/6sgwaFii59?=
 =?us-ascii?Q?jhjK262hn4ESKitTWw6GwqTBZMN4c0xmvZmRvjNOMROrEfnj3JCcKAd8/iRx?=
 =?us-ascii?Q?39AtQ3uNaCpsH+ADVuu7iefyt5mpuVtvt59RJixw1vEyVifyFjrFFdSAqbU8?=
 =?us-ascii?Q?9NkE2nl/lMe5a+0CxJ6xcV9UWajAbVHb1As53b+TQeelPhQYhOi+4AVgQBe/?=
 =?us-ascii?Q?q8bMA4J/BeTkblO+gowZD9qKqGFPKVIHLCLieu7cZ+/1yPzI9Vr5VIQzXjjY?=
 =?us-ascii?Q?yT9IBwfrW85o4TjmCDR1Lbra2oA9b3i0bZHET2D2L3bnCqyvO6xoomFFVQog?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be2cfcc8-846c-4376-a4e7-08dbf7b97945
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:46:58.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AY+4PZmWm3osPNGUOTXHTRImder58n3A84NG5efe4zhSexDwPpxmFn99hXR7a1lK/TnwfNbmQUJvmv67TGltVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

From: Danilo Krummrich <dakr@redhat.com>

Use drm_gpuvm_range_valid() in order to validate userspace requests.

(cherry picked from commit b41e297abd2347075ec640daf0e5da576e3d7418)

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-5-dakr@redhat.com
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 17 +----------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  3 ---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..641a911528db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -929,25 +929,13 @@ nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 static int
 nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
 {
-	u64 end = addr + range;
-	u64 kernel_managed_end = uvmm->kernel_managed_addr +
-				 uvmm->kernel_managed_size;
-
 	if (addr & ~PAGE_MASK)
 		return -EINVAL;
 
 	if (range & ~PAGE_MASK)
 		return -EINVAL;
 
-	if (end <= addr)
-		return -EINVAL;
-
-	if (addr < NOUVEAU_VA_SPACE_START ||
-	    end > NOUVEAU_VA_SPACE_END)
-		return -EINVAL;
-
-	if (addr < kernel_managed_end &&
-	    end > uvmm->kernel_managed_addr)
+	if (!drm_gpuvm_range_valid(&uvmm->base, addr, range))
 		return -EINVAL;
 
 	return 0;
@@ -1834,9 +1822,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	uvmm->kernel_managed_addr = kernel_managed_addr;
-	uvmm->kernel_managed_size = kernel_managed_size;
-
 	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..06a0c36de392 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -14,9 +14,6 @@ struct nouveau_uvmm {
 	struct mutex mutex;
 	struct dma_resv resv;
 
-	u64 kernel_managed_addr;
-	u64 kernel_managed_size;
-
 	bool disabled;
 };
 
-- 
2.43.0

