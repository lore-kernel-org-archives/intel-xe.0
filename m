Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D016E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F1A10E38D;
	Wed,  4 Oct 2023 16:18:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5347410E38D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436293; x=1727972293;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pCHctYudkOOvWraiP02knnyILh1f0NqddB90JGXjXwo=;
 b=eKny6GM5zFHmPch3X7yluujwI/9mVeYqKjPmyK6/LZEadiU9gcuztW7s
 greIx68BAz7NfO016muEHZSrhuPD/il9YeBAGMg8kX2G2eUiBXxGhaf2w
 QRp6GfRruLJjiljqkDOeUTAvOBQYsU5u8P3g413hRxl1kFEY019KMqQir
 NCi/Cx8U0VxvHIVlts9NC6rkh9HldVHjunPRpF9NmGN/pOrECnt23Ktph
 WhJTAR4p4yCGgNdS4hd2T+KGn0Cvah4vKbVYRGjzoWlbo6sqifP5WvINN
 dEnO0FtobZI03blHFipWUoZvhUIFk9lFCU75n7jjNirWJyxloXI8a1wC0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383122076"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="383122076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895038310"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="895038310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:16:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:18:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:18:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:18:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWU190pBo/9nRVxk3oTGPS8CRMLBzjIja/RduLodTl2mBk8/dFXxN9aSs3k7+kecsqWrFb/lYhydgAIPjF/Yl3muDo0hoCeRuhZw+f0yizh1p6uYpv431hh0YwyvdkJ3JJMPf+Jy83lbJqkEbUuTLNezoGVZXCvpDTXCU5xQYFWlLfeEKj+B2jdqwd1mbKa/WW8DeNRDfCjtg2PZA05o2xatSs9sh+bosqFicxhQsZGa1YZCjDy2c5BvVfXtzZF9Nv7tR0z3/BS5/t+RP4j929/jI39oRkJchgiQ2YMp74tuTAXmCWQ5mLSZvjErYX0/1YZPyTY5jYw7ZojpbM7HZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9RAWiqGldas9z+t6YNaEVESv3lstlgJoAUJTl0Wf+k=;
 b=Kn5BF8p/2ovCvWxO2jCAMRImO6wD22KRQkKypyP9HW69viKuQh+a2WhDWNP1getqc0UTKPSMM3It9owVCmM0KKn/W82W4zOFGV8Utu5OUAKUjOUe2TfveI4jNTeqQp5W/FczRZYSeCr/TsOTvB2yMtoQvhLi5kg5HPzchM7EKHLhDysdKJ1EzZVvKo/vc7NqTRvDZ5Z2hhvVUVKogcoWlnWz8RPCCI8fwvZo4zjQXajVZcbJExXTop2gAhBvsU5R0zCTxtK9YUUSQjjUewrjHH/564pCxrdltpbUMLtnFR65F1fhxIlgE2rjP3KWhLd51tYxFqjUAJkICZdeaN4qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 16:18:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:18:08 +0000
Date: Wed, 4 Oct 2023 12:18:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Message-ID: <ZR2QPM/V8p5+5cb3@intel.com>
References: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: c23e1691-e0a0-4fa6-9c57-08dbc4f57f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LctLkRjG0fpbymtS2DpwJa4xGLn6z/mUE/8CEvNoJhRjoB09WBurJh5Hp3zTZFwlXQ32X18VYWdylBT9+Lsd77xzrWANpXfbcFFEgcuhh3mZdipy+gFRFtHWWBgE6zFZE2EeS0Ok+R/PwotP87UTEyhMqW36Vl79pbyi4iXlmpIolf37vHTBH4pK5hQhwn4HViqbt5rf4fhT3vzlsesD/1Fri2KUvsTbSOsgFomN88wO3okY+NEXGZOpfAXuFnHWrZIGGD0ufGfW9YQcSBtXYgGEuYzbblc3Gn9pKQZ4ARST/wwOoQf837RbjKNe9DBnWl5pz93uEWFnfqEmvxkYa/sIyRpmTlieJB6SZ8Q3zySnkwYY2SL7wGV3SUeMWl2tDSiT88pjbBb/4Z2aGUdBHukfX+mYDzuVtYfZmGGOCCA2PO0bvtbSOT15WHTukStj6o8ON4Ox9u9p4Ww5nWPIJjQ1VumazqXIkE2ssNPTg4TaYeNPOXTWlXZ5kVWcSpiSFFj7iQ7/r/bIsDv8wu6isU6zHQBaES2F3Vny183Sz1g8mRCNAjthr5/fAGoRGff
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(316002)(6636002)(6666004)(41300700001)(37006003)(66476007)(6486002)(66946007)(478600001)(38100700002)(66556008)(86362001)(36756003)(2906002)(4326008)(8676002)(8936002)(44832011)(5660300002)(6862004)(82960400001)(107886003)(2616005)(26005)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nc5hxwiVvlGdV/KptexP91nIt2Dp8shLSMtP0SRiA7MukWFFXG23FH0FzsVn?=
 =?us-ascii?Q?sA/5OC1GVUSFOskcMXU6ISXkV2m0RkOqIn3Zdq1HuHuMYIGDp066K3MiYLMz?=
 =?us-ascii?Q?IVRTsjyc0XY+44O1LAY3jrp8ESQztkLxZbjr8EktyHghG/3MXgBnDwPRZzKS?=
 =?us-ascii?Q?FqhMMiz6dMjN2PBNPeQ9hBnE4k6lGyQu61I48AKtx4ymWjQLv/3DF9nS7k6+?=
 =?us-ascii?Q?xGIwBhBEH7FUzendMO/W/1YyWmLjWhtnFeepjoTLbNUOTakqu69rX7TWrGaI?=
 =?us-ascii?Q?duFwTcgxI33WSgYrfO4Xux52/JXNF8YbKsoacNYEMJz4nQIVgcgVaZ+0gNei?=
 =?us-ascii?Q?wghMpV/9+fLTGptOrz2bVt3qU7iU8uPCW9IAbhzhMDAjaFzy8Cs4O7Mula4I?=
 =?us-ascii?Q?4vYojX6MXW6SnNNR7dsKIPMNjKLR2PgsypmAB10AUSFuJpFpTNbKuZ4nikoI?=
 =?us-ascii?Q?ZMku9RUxYtSUFDFiSApPQtkIu8UE+7odXuI4QpBTvjD85ZyI2kjz/GqACBq/?=
 =?us-ascii?Q?sWab1m5O8uUzGFa/v2tGFe5J51JL5IEEmirAsTpp+7QfPSKYmhfOLvkTqIz3?=
 =?us-ascii?Q?79assTOrq9MwwBDPeTkPUTj+/5JvXO9JZiaDtCC5lJzOB4Bb9nW0BpbrjrFd?=
 =?us-ascii?Q?g31D8RHdxBf2N1p7Stmdlize9BWZbBPWoSWbV/m58JSgbDve2Ejtb/iPZQRw?=
 =?us-ascii?Q?Eu1StzZiiALedh1+UNqCukAvhJw0xGPrnFOP1SmqRzut7oLXmU/wHtR0ndj+?=
 =?us-ascii?Q?OfFQC2OkbCzr5CSqg0D6QV5X0jTPAc3kqf9HTJM5i2rKfK+LwtuFrPDgirIC?=
 =?us-ascii?Q?03EDJArJjHuvO+QUQR8q9Q2I3Biy0wgqp5KnMzTyEaFxYRteKDebSbdWSn+4?=
 =?us-ascii?Q?OUKucYbCW2KLIs9PnLYa24mHcN8rMkHWgwNzmPTni819HU6r8ecB5F0wXuKU?=
 =?us-ascii?Q?ucboegnFWwrkK3DQ6XgeIVelujoMkovjRsFo81ylmG1EdB3z7CElXLhyAX4p?=
 =?us-ascii?Q?y/3NTgYoeKXQ0JkyXcBg/Sb+VVMUEPm2xQ1RXsXekn0XT/t7ZgseJEF6oFtG?=
 =?us-ascii?Q?WwB0STjKnKkAK2C+K8TZg8OlcfuD7W2f2akCsp6fbAaruomNNftXT9fkTf++?=
 =?us-ascii?Q?38Q1hYWfyAbRC4WdMBGc+V/ICw2qZsSU4XN9UFVYTLVuKyO/xECohssqi5Iz?=
 =?us-ascii?Q?6VjS9mfiyjeYhAN9CkD0Jz7jKDwX+cYqOKylPVB42kx/MVoEfoAPkDGcWasb?=
 =?us-ascii?Q?Cx/zh8pHSzMne/tWP1YbQJ8Xof/OYySeLq2o18mtwjviT00vUwnDxXtduR0h?=
 =?us-ascii?Q?pEazHNuJsdncX4BUvIBCHZAda2l+EJb1O799cTZZs4rf7jnKTFfAQXEsthRO?=
 =?us-ascii?Q?WRChYAp09NcyhMLdZnFb9fzMoajodZ1cL0bQN9H8mH3mX3NPJBdsSbZTl3FG?=
 =?us-ascii?Q?RlkVf4wIb3mvPT4dN+QITIRDT7FApczz58ZGla6ZgOFAgDUjGaXLMsLDdg46?=
 =?us-ascii?Q?aG+6L5QqiFgEucW4LKfnwDEUtseZNQHrhXTASttiZi1SiazFVJ2veSXqZApe?=
 =?us-ascii?Q?LBUo0IGn5cEWwU4YFUUPiaF4L/4HNzoq0MSY3Lqrid+pFBsYobLeG8gx/v6Y?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c23e1691-e0a0-4fa6-9c57-08dbc4f57f53
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:18:08.7884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwYch/IYMlu5UzGJDJ1AUmb9nU1GIlR8bI65oJPnl93NYNlxdAc0n3XYmw4Of9Exv5l8ML/PDeKBvs4HuT+8pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
 count
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org,
 ramadevi.gandi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 02:21:38PM +0530, Janga Rahul Kumar wrote:
> Tile count can be queried by UMD's using the query ioctl.
> VM bind ioctl has tile mask param whose valid range can be
> determined based on the tile count info.

And what exactly UMD is doing with the tile count?

Please let's hold on this idea for now. I'm more trending to propose
killing both tile and gt concepts of the uapi. For user the important
parts are the hw-engine and the memory-region where the BO is placed.

> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 ++
>  include/uapi/drm/xe_drm.h     | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index a951205100fe..ada1f26dc1d9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -200,6 +200,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		hweight_long(xe->info.mem_region_mask);
>  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
>  		xe_exec_queue_device_get_max_priority(xe);
> +	config->info[XE_QUERY_CONFIG_TILE_COUNT] =
> +		xe->info.tile_count;
>  
>  	if (copy_to_user(query_ptr, config, size)) {
>  		kfree(config);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d48d8e3c898c..1d207b5398ae 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -257,7 +257,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> +#define XE_QUERY_CONFIG_TILE_COUNT		7
> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_TILE_COUNT + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> -- 
> 2.25.1
> 
