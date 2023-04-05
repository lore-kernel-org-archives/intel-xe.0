Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2033C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C010E560;
	Wed,  5 Apr 2023 22:25:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C7510E560
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680733512; x=1712269512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5rymhbBnN0mSfG0pF1qA6bn172q5D1Fhe9uIdStS3Yk=;
 b=Qp6unXdHZKHvRWE/HlFFC1SGzKK8b7JqcZywDkKGZ9waudG7WPTet/M4
 Zwr/JNvs6RVECF922WZdRpwdSHtKRtT2kO5vmHKdLhNrYJKjMLXIs/G7v
 lYhmlbDfmfcrsdzgg8LIVx5SRKIBoz/fPecf8BH0FLOmWmpXXeDH0ndGm
 cCXhiOAE6lsKGQ2uhKk8RP1WtLTJsEtyJd34UO+TUt43DULDBiFCE9wiM
 yJgGkaTM9VenK2hBZvAQljsHrCpTdy+2IJKeYIHJ6HIEr6xgbdzLsOxJ+
 4HuVxRA5F9AhddO+WsnAW8pLCo9B1WkKwjZjWsoNqqGyTvJfNmBNtzYq4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370417325"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="370417325"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664208394"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="664208394"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2023 15:25:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:25:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:25:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:25:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:25:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKoV/4gPxTrZ8bNJXD6qS7dYHr4L216HcHvEpoUEJn8EIFnwcxHWYvcOVaJYO5U27LfUjIxHpFTf/huC9km74Md/8UNoGOM880Gh6aPN05q3fiOBPDY/hjwyQmGlZDjuXUnHkwu4GamkifooLdOr/FgOa3x6n4fFtz29VNa/xpkyPGwAuaE9inXr+kfIYg5IaKWdDxMUxb9a8UaOJEwHK6cQOIqXMVf0B1lfIl4I1qqHHUhxYan2geqE8j0ahc+tLnmrk0AmnaVUbBnOXlsLaPwNqyn1d8LnWEBn1gOVBqaHuqWJHuezLO8ERKVRWUSaU6uf9lTio7KgrvwA32Yedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYEsu+/x9mTLwFmK6poY661fdwBOo4jTA1lTCGP2bWM=;
 b=iKPUnNQSOJLS+B9CrUyFrijAI+JzbOmusVwns2zA1+NflsCxukG36SfEdPyxNw2GoHXtb0UCDoVhggGWfVkhDOfzDRDZCGEpfE7pU9AcfcvJAjfWvn6uySRw/vlgEsXyhlAQC7m0JVUtqP4X+nKLd07a/qKzCMLFNPm0gZcBPFsGgSQkLoviTZA6CX7EimvLGTc1sRJJJzffYV3bv0YVUaSTBNZzMoMV6cSTERi1Seu/y+GpZQF8xMXjOxqFQhJg2w+/hB+BwCrGTZouVvKrGWOiKKjfFM6kGnbrQV11k1FlhHmtm7xm1wQStTzfCVTcdDOPPvIqtPfMal1wtPw6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 22:25:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:25:06 +0000
Date: Wed, 5 Apr 2023 15:25:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405222503.5ex7ytfehr26wtce@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0064.namprd08.prod.outlook.com
 (2603:10b6:a03:117::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f10a9e-0d2c-4789-335a-08db36249b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEAkn2F9MJq/IhlKpL62UrEiBFKOeJfYVUQcqSTAFh6+Sr7z6505fqciAeYQceSQT5F+J3eOcuhrLbTCzPDeiw6wO8EeND1S845JaS2X+O960s80Cu+2nso0dH2wX7kYlvVskiB3Bh7n+5mRdcosjyMVnNLz2xyPrWje5A1NN/9qcd1d/iX4B3Wei8BnMHpl21Xv+elBOnQdp8DbSCgYxFhWpXjqK9FrZJUMNLrLTt0RvM6d0YlShgpJWYxcloLaKN4gLYA1cOj/sOwac0H9JuHPKpbKkzHYGzzpz8LmK+EONaZdVXGNeHXgTuGBEWbuHyMQ5Oj5Kccif12rcMpRMCdHSLehVA9ejbdbySFXLh73kRQpvLrs2ofMYBxHz26Gxbzm1625W00VK3RwiX/F8K9Oj2tRSdMqqP9DHMJIDBLI6JmKMvOTWOfVBz+1ZLO/0myfumOnFE/BQEK8hDO3UsTOOlyw78eMn8csXxejpYIKkcXnunR6m8/b0xpWbthftFqijxZG76hWg9jDYBNmPMgRx+rbujIsya51Ca3pWLcCXwAqG+ppDe0LkNxM3lQ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(36756003)(2906002)(6486002)(186003)(6666004)(83380400001)(26005)(6512007)(9686003)(1076003)(6506007)(478600001)(66476007)(66556008)(6636002)(8676002)(4326008)(66946007)(5660300002)(38100700002)(41300700001)(82960400001)(6862004)(316002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IHezqZAvsrS7kMXGY2tLbgYndTwn5p1sZ8deE/i3uQ7lX0V2SsWkPdUssHCs?=
 =?us-ascii?Q?gGfgAv9PAE4e0rF4jmAb1BbOnYn/epHnStqFJ7k9LDofWavXiuyRq0PBsVe/?=
 =?us-ascii?Q?T06bWTUvRMMtIso8AfmKf/yI+1U4B3r75mI0JLV5dzxZN+62rU6djvMyAIuW?=
 =?us-ascii?Q?yNXO3XZ4eUzS1er4vtFgpjcg8j28N4CCTOlZxZOj0YCRZKTDptCerQhAdVgB?=
 =?us-ascii?Q?05qhuYYOBPCZYilKh7KX1WnYLiw6SUhvqMXeOkacHx8v1l2RFFwZkspx7P77?=
 =?us-ascii?Q?GbTSN0cjYCRjecL7lpiJmpOem4FJHtoLqb49KdnEt6xzMBo+rx9pJhQytnK2?=
 =?us-ascii?Q?6zhyuWjNjtQ5Pto0frVVrL6M0U+tabl7ZD7ipG/sa7YBeNgSIomlhoD0Uoe/?=
 =?us-ascii?Q?f7vCvG+En31fRfTBqZ9c1I7IBwCY6xMXqYGfo5IcF+NR7wVjpgGtJI2xLzck?=
 =?us-ascii?Q?rReIFf1BxtTMNKHOWaaPQbt43PkslXZLC1TtFjA01538Mh7b0ritTZ9gkYjJ?=
 =?us-ascii?Q?qOfg2p8VFkyUWaWMkOalIf7MtpLAniIyL63X7OibUJ2INyXbzel58JZE1bM7?=
 =?us-ascii?Q?OHKpv5p4hN+kdKv1oLrfJG3XL09WoNSH1DgL9izNNAzq2WFolhFJf8lP3A2F?=
 =?us-ascii?Q?wUKDqZHpUcfFNE0o9lIAwCoWXtTNCpTHhrGeCkIphilRzKsOVrNGr15yjQfP?=
 =?us-ascii?Q?JTu9O4owL/G8Qwl4oSlcFTv5BMRdynIzvHuLc8sdQV0srhIPFQ14/Ez0DeZ2?=
 =?us-ascii?Q?JwG3N72uYsc/1p/Y9zz0CrEz4FuqiA7go0hEcv2V0i4b9MuMuIEvPH+izC+U?=
 =?us-ascii?Q?2n61YDmw3hN6hD6LQ5Jpy4N+aenXuc0QcU0xLS+6emv92nbtSZmVDA8gWXDZ?=
 =?us-ascii?Q?yPUfL2rtad5971+PDI0jb178KH7QoVkmphUtkgwP+pcd1KHRCzmYKTkVtB+7?=
 =?us-ascii?Q?UtwkonkkAjKJaBfpfxidZh466N1iU6ibtcJJk6CGmhetCRJV/5iJ0X58bxzi?=
 =?us-ascii?Q?VIfAC7NXA7tgtMdmZLfIOgkOK8kt5t8NIBIDrbrsoiSvWPbtPJvlTZ5+q6dp?=
 =?us-ascii?Q?jGP+V3QdP5M+Gus/5xh73WmpsBaMyhDTGziN8UwfkuraJWlL3fN9P0OV1c9H?=
 =?us-ascii?Q?4IkBYqDz+zP9EIKiK/XuiYqBUhW5OLLkCf5EmRjbYS9t5IugZ9+NRKpD4yb8?=
 =?us-ascii?Q?FDBbd60IF47Tv74PaoXxY6Xnd6wPx0K4HdPYAC+5FDW/3lms8+h3B/XEEqBc?=
 =?us-ascii?Q?CXQqAi4BWvj7SChTKsDxBRnk3/QWrCo3ZGz1+Lwo/VSnvNyO41D5Sb4stUKe?=
 =?us-ascii?Q?NXrmtt5Eew/dli/yCfsAoimQYespuVoUwTMVi1h2M4nN2H3Sy3YxrO4e/c4J?=
 =?us-ascii?Q?sE5UlkHE0jE8JqL5usLXZXo4y/GrTfdG5x9ZowqIKRWdc+H1vONNlmUlTahQ?=
 =?us-ascii?Q?MA3mab9F8qDuPvk9IZu2e9P2NXoKUj7jzhkXtZYxxFJsPgICUiDwbv+LZU+z?=
 =?us-ascii?Q?8jOb3CVketGIkDYKHuMVLXcRxyqrD3NFBZHGD40aqsMmb8SrlkGQwtnK/b1D?=
 =?us-ascii?Q?qzIIQbSMIvMMfwKLyag+YUaT4WquwTkoZtYdHUajDK4zz2TYFlimvGgd91Wa?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f10a9e-0d2c-4789-335a-08db36249b6c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:25:05.9255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gdpc35R0ziDHLCpxbRLSHUyIV9gwH2h6RrdMQzeoyIUsNNi0kS6KFNpd7wfzuLfPK2QuwP/VvX7sH8GCf9SgTG6o+ydNjMdgHTk4eEmCqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Clarify GT counting logic
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 01:17:01PM -0700, Matt Roper wrote:
>The total number of GTs supported by a platform should be one primary
>GT, one media GT (if media version >= 13), and a number of remote tile
>GTs dependent on the graphics IP present.  Express this more clearly in
>the device setup.
>
>Note that xe->info.tile_count is inaccurately named; the rest of the
>driver treats this as the GT count, not just the tile count.  This
>will need to be cleaned up at some point down the road.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++-----
> 1 file changed, 16 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3e7e57254a6d..d634e781858a 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -46,12 +46,13 @@ struct xe_graphics_desc {
> 	u8 rel;
>
> 	u8 dma_mask_size;	/* available DMA address bits */
>-	u8 max_tiles;		/* defaults to 1 if unset */
> 	u8 vm_max_level;
> 	u8 vram_flags;
>
> 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>
>+	u8 max_remote_tiles:2;
>+
> 	u8 has_asid:1;
> 	u8 has_flat_ccs:1;
> 	u8 has_link_copy_engine:1;
>@@ -152,7 +153,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
>
> 	XE_HP_FEATURES,
> 	.dma_mask_size = 52,
>-	.max_tiles = 2,
>+	.max_remote_tiles = 1,
> 	.vm_max_level = 4,
> 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>
>@@ -171,8 +172,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 		BIT(XE_HW_ENGINE_CCS0),
>
> 	XE_HP_FEATURES,
>-	.max_tiles = 2,
>-
> 	.has_flat_ccs = 0,
> };
>
>@@ -455,7 +454,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe->info.platform = desc->platform;
> 	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
> 	xe->info.vram_flags = desc->graphics->vram_flags;
>-	xe->info.tile_count = desc->graphics->max_tiles ?: 1;
> 	xe->info.vm_max_level = desc->graphics->vm_max_level;
> 	xe->info.supports_usm = desc->graphics->supports_usm;
> 	xe->info.has_asid = desc->graphics->has_asid;
>@@ -464,6 +462,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
> 	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
>
>+	/*
>+	 * All platforms have at least one primary GT.  Any platform with media
>+	 * version 13 or higher has an additional dedicated media GT.  And
>+	 * depending on the graphics IP there may be additional "remote tiles."
>+	 * All of these together determine the overall GT count.
>+	 *
>+	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
>+	 * treats it as the number of GTs rather than just the number of tiles.
>+	 */
>+	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
>+	if (MEDIA_VER(xe) >= 13)
>+		xe->info.tile_count++;
>+
> 	spd = subplatform_get(xe, desc);
> 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> 	xe->info.step = xe_step_get(xe);
>-- 
>2.39.2
>
