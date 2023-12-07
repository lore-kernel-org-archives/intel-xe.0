Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E433C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE1910E060;
	Thu,  7 Dec 2023 00:23:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16410E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701908606; x=1733444606;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gzQeEhRnMMih9N34xxK6i0JP60kiDZoSj1+R0IMuw6M=;
 b=UZrJYsC3MgyvUKxmhCzUQeC1KfZqUTOp9C2ZGIqiyu8F71QxoK1gLTfg
 hoahG2u5FpeQuGEH8Y2U8GFnZUzxRBFBSTJdFtZ/m5hN0z+b0hDpZtRX2
 edCYq2jnHFsK7M+P+Kn57yF6TdzOKxkyDPuKcX9coBobuxrxYGr5a5E+B
 Ief4CcNJiNnkXBAOpRUIZ1shhJGKzK2GiEHP+z7zjeHXSku7SDjxAHZ4v
 3iLCi+zuyHe+epC5rcgCWQkx1lzj49o8JezylQ4c1Uz8djU/8BvKv5x1l
 CrWJggIOJf/JGrOXbsQhDT7RR6ddHnHolz14j5KTQJuaFrrW67HNnbQb4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393022429"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393022429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944829009"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="944829009"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:23:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:23:24 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:23:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:23:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPgGBAcoDPDxwkU2Hhe94QBm4el8B9IIJVQL+fqHQFq7gtthxwzoKgcE9los4XG/QXupO2xuok5otza6B5JpJoTdcFBK/qoVj4YFN/KBTszYRr9QMRD7EueuiYFEmXN8ivaF4QZxm43oC5QI+SQt57M9z9sQLs5GKcZb4cXwfJCrjdKO+KFkONfZBnXmTqkwifiLxCCLKQOX4L1jLe3QVD2jsCfyNwysg9sKl0qIN4PiRyrSC78LVpbDV5SRadlXAIAefTWR6V7P2y2/9QCImkF3e4C00075MCtqjTxbF52TM8AX5lyc+olRoezsz2nFbxi/i/bfLu26zyjIZ5DRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bMKnIpXAY8PNfqrlPLEgmeophUjKwrZBFqCbu60roQ=;
 b=Y0gwkh7ljXV4DaLXU1KsKBq3BDRfSqcPQrFY2nq2aVJYXEIKLq3WqU/KT9UPF6n2VMCqiFRxqtepy7u/wXeAJ302FKwK6uuBa2cA8ORm6qH+2uk9ygqNAdnhWZlKSwjuJ1Z5FaL1xKVDUt20axPsQzaVjOBiFCG+X9vniwLCOxrcZPml3PtKCbE5Kcl5Ltb7duW9M3N8/MBq65WGAsXT20UDQ//iLYQEBJkC0jcQgkez8JrKUrU8bcZfJowxHQMx8ByTGRkpJO3pfL73JuEg20Ky0DhMWw22zBvFpjd1x47RocAxx5r8JQVJG47G61wc4R4tuynf2cbh6F+MvDvK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:23:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:23:16 +0000
Date: Wed, 6 Dec 2023 16:23:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231207002314.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: afc1b788-54e2-48ee-221d-08dbf6bab507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5guKremZZ6Rrqszz1MtSTHmrYnWHy1mmaXb8ux4x/to1qgvpPU7nJ4WGP4k71Zk5dx4m1vquuUpzGFKwppIUXhcFoq7XqjJDMw4wXGbi69dIwU5Rblb4uqPmtLzWyYq+0G5hZG+mO6BSgRhGBkw/lz162kystHWxgW+MB/klAZqTp4/HC7hnuCL0RQcEP8zpol+z9pnXSgA/W/aLqtxKwm4nduRKDvP8flMWWt06eRC7nEzqLQz+YzJeznvQzqDOARHNVCQcAobo6iWkf1KnXuaStSMrXhr2mOKbNdtchF9xKTL3lRWwYxvBUksuHR2uGJVV9Ekd/VjHzEGb2OYr4b35rre8SxLcrG7aTiqHXenOMedIgY5aCo1kawFjcoyH6lU5xVOzvNBB3M8rNh1pJtfJRolvTX/0dEk/w4OkuuikPLXvMhQVGzH5Y7P51YtwxHFyJNfsLk1Y3fzKuoeyL0RWD5w3i++U07mUv0hWu7CjzmDUECRFtS3A6nT8gaW9WGlUoCy7/RhOVVePkLUdkV792R6+1moz0veqEajIvBYdrViDwgywgHd4DyMzyQwU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6862004)(8936002)(38100700002)(5660300002)(86362001)(2906002)(316002)(41300700001)(4326008)(8676002)(478600001)(6486002)(26005)(1076003)(6512007)(33656002)(6506007)(66574015)(66476007)(66946007)(66556008)(6636002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dXSMI4Gsh6QwL9bTeTkhvyBGIs3ugvUEtwKOPA2W/I6K8R0SwcgWdgNcES?=
 =?iso-8859-1?Q?dFizQhxH8JTUnMTWCZI1IEIQlZkq4YT8I9rOejn0cKcvRYiJMZCyMKUdRb?=
 =?iso-8859-1?Q?7h3Hyk2PGGaeH8qB+SRHT7WyOPJ2ve8AvccP4eZ79VJUL6vU0TtqVYIYTj?=
 =?iso-8859-1?Q?Bp00ZXoOaeiwm4n5XIZX4ic2HeO1yGWPtn97ROM2HvqTzefXW/Xm66xO02?=
 =?iso-8859-1?Q?wjgQxBAkd4P9Wbja7pl0yOGC7+MuXvCvyGEbWHOTQdU+vIjo4QqI7RLsjk?=
 =?iso-8859-1?Q?uT8Ct19ulcuxAznK2eqBtBptCEx21A6HqgAahi2BqjFKsJYorv+VkNe/vn?=
 =?iso-8859-1?Q?hGAWu7VAJPhgIHj8LTBiPUgzLypIHdyTUMkeFyJawMvb6wvdR607tEGsCt?=
 =?iso-8859-1?Q?WIdGaPMqms9LA0TGhd3fw6MCls/OxvbxzOLZTYYbJThEZzpVxmklI/oS/0?=
 =?iso-8859-1?Q?hnMASkC5LaOUCE52yIKOSXwcoebJOxINI1pvUSl1VqzereUePJrAeASEnI?=
 =?iso-8859-1?Q?zgVfY0Q4sEh9lf0NRijJBOM4IfL21VtTliGgHEXEX9Rv187Xex54OspOyF?=
 =?iso-8859-1?Q?29JfcX2PRM7ov+lTHqzjnB/ALeP/k6b+lbawIsKLwjR61e6a3CPf6vkUgc?=
 =?iso-8859-1?Q?arf8WOXn2Z7qC2sV1c8UsRgy3Lveo963mS+5p61YlK+hyJeeqVEGDYAYFK?=
 =?iso-8859-1?Q?sEbEJwbD/9TPkioJ+XroQjPAKlUOaQiJLijv0XOWwK1yj9oHbgFoMo4F+b?=
 =?iso-8859-1?Q?3+rB4xNrYTNO6Xd64QKuc2K/fwr6MC7ir/cY9sEFzit7jNP5JtfYIityaf?=
 =?iso-8859-1?Q?wz57losXm/jefWuSkQBadQo31Xypkr4ilF/AkZ138BFXD69UzX/N1+Cbwr?=
 =?iso-8859-1?Q?3lMObT1f2l2pAle7nKjrME5HanbbOLVb0zdvc9SW8RV7pBjXfKU0JI/Qn4?=
 =?iso-8859-1?Q?01jkhdKNUieH71BcGZPmnIA9bVBWm/O+5Y6ZXyMjxxNfH4Hp5QKDt2+cWZ?=
 =?iso-8859-1?Q?UTFLTOyM8NySzeaWpkvTjkCZXs14mAMPI3YiFc7jGdW54cberF4CIQ0t6o?=
 =?iso-8859-1?Q?F+6eeAlo8/D2ly6mqBgM2+xM7t0slJ94qUTRby4DFFicAiYD2BYlCTXmcB?=
 =?iso-8859-1?Q?edzuLbElb2KMAgKPT7N/91xwbdda+7rjMfOAHSW6SzA26UK89Y/ewwlrdM?=
 =?iso-8859-1?Q?0ug8f3oXmtPWy+M2GW4nWMZh9RpmrYIvfk/mPlF89Vx9VtizYmONZb2bF9?=
 =?iso-8859-1?Q?Fjm/FnHoidzTi5mbrwhpAsJ0++6/2COHFHw6JJV4m17v+Xjy4cOI7Jlj9x?=
 =?iso-8859-1?Q?rhesZMVCMKSGBsXzXFXtVWMXol0X3GiU54QB3vzBK+wOEExOZZSQ4PwKSJ?=
 =?iso-8859-1?Q?j4UZubUgDOgrFCU0ON6r0LOfCNwmK2DZAFgxKRAo+PbQMW9Od4vAMbvTfa?=
 =?iso-8859-1?Q?XjL1GwxyLSFyTcIzmjg8bNB7w96919jzrjGmNB4+brNjH9Sc7A5r+B3qma?=
 =?iso-8859-1?Q?4wyIdvfQclrDacZ+x5UonHqVAf3OxXt4H7HW8fvS1GtML+jYzoIVHR8a6f?=
 =?iso-8859-1?Q?1owdRQS4s3zCsBj01xet+W9R8gZihA2nOQNqzEoXzUyj98zzmsPtlE8+0a?=
 =?iso-8859-1?Q?fLEwLMbpSKAX2/swKY56UQ8pq14Dqc55stqzVZmqVM1/npK7OqC6ZwbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afc1b788-54e2-48ee-221d-08dbf6bab507
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:23:16.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpZWSo9zo1nqaX9Kof7Al2UNYbqa2KbKKOZ0hfnGIHaboLEqLnGHNQ+dlvSe2uab7cI2pffQ4MTTXIbhz6xO3+yLnH3xRmPt9jupPguIypU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 8/9] drm/xe/xe2: Modify xe_bo_test for
 system memory
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

On Wed, Dec 06, 2023 at 10:01:25AM +0530, Himal Prasad Ghimiray wrote:
> Modify test to valid ccs clear and copy during evict/restore on
> igfx.

As on the previous patch, what exactly does "evict/restore" refer to in
this setting?

> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 549ab343de80..5e4e19a246dc 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -112,16 +112,21 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>  			    struct kunit *test)
>  {
>  	struct xe_bo *bo;
> -	u32 vram_bit;
> +	u32 mem_bit;
>  	int ret;
>  
>  	/* TODO: Sanity check */
> -	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
> -	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
> -		   gt_to_tile(gt)->id);
>  
> -	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
> -				 vram_bit);
> +	mem_bit = IS_DGFX(xe) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id :
> +				XE_BO_CREATE_SYSTEM_BIT;
> +
> +	if (IS_DGFX(xe))
> +		kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id, gt_to_tile(gt)->id);
> +	else
> +		kunit_info(test, "Testing system memory\n");
> +
> +	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
> +			       ttm_bo_type_device, mem_bit);
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "Failed to create bo.\n");
>  		return;
> @@ -160,8 +165,12 @@ static int ccs_test_run_device(struct xe_device *xe)
>  
>  	xe_device_mem_access_get(xe);
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		/* For igfx run only for primary gt */

Even on a dgpu why would we want to run on non-primary GTs?  Should this
whole loop be switched to for_each_tile() instead?  There doesn't seem
to be anything GT-centric in this whole test, so it seems like we should
be passing around and operating on tile pointers instead of GT pointers.


Matt

> +		if (!IS_DGFX(xe) && id > 0)
> +			continue;
>  		ccs_test_run_gt(xe, gt, test);
> +	}
>  
>  	xe_device_mem_access_put(xe);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
