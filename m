Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D20C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 20:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F210E5D2;
	Wed, 30 Aug 2023 20:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68010E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 20:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693428925; x=1724964925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9VqxFwD17T/mDp6fuvtOz8Z8tlCacxinm8dnt0iOLTs=;
 b=R3IEuUku50R+pvSqLOfcgWA6vERECVfRhxPaenD9U4xdn6ms9YpBpPzK
 kHABXtJkSi+B8XiZujrc+JZn8kM9vSZGzpFzl6ZNYnxyTHER2mf5asJic
 cBKWn6jEquNeswz8ohobC6OZq7DZkQZbNjHN0PcYLWjaWjDiVfGJhGRLQ
 bQQoVvmj4M/2/ZIcIlvZKnaY0hANSVUO4nCB7DsoVG7brJc5qcMvUBoJJ
 VAhtAwYRL9wWkEPkLUYqCD0vL+Ruxev9Ir4hrCtUu8JGaBnpecUudaJ+s
 Rl9ecevWScUWM59Cj/hTU4Q0b8OlRkDV5RM2P2MgC/nHq+hE/tAtdjX2V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378463415"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="378463415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 13:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853870965"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="853870965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2023 13:55:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:55:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 13:55:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 13:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs5KhyDy3qvBM04ufs6cM6Ze35bugH5VbI5CcPmI3l7IZBzUDubnKgsGanxMnOSQRWtSLjdBJKapmcwqmsLYvxxibVRz0wQC8/cD6Nco31Z5o9lkF5cOsE093US3RY6sffxnNGE/ukF/Cwe32VrEs6GABYutm6t2ADmI2pO5iAdHEKrZczYiaGb2QZMhltJSzx786CXlzHBOEfpoXVQ29v1AtEo63hVoUlPwX2waXJKoO7KPRlJOdtderq4ReMT2jLgSqlQRfh+h3lFqfVPdjMG6q0V+KnJPZLyONt2SVkuZJMpyBxB/+gKG1fvAZiNGb/0kXF8RDlphbROOyXXGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS652D7t4nW/nFzNuFTxQh0ycMT1S7Mq6IrC3kfG3v4=;
 b=JjrO7ZoMYw259vruIlyCqprZsR/JaFJwpxz6ny4jR+x2irMYamZxBiC/6kjvLr0zSeMB8BBpsmdgNY1rmKuxRA3LkDcfH+GzepVyRRk/NZNVIELTeg6ciomxYuLro0OSde1iIvGD5Lemmom3IRZa/hLt/gxdc8IJeJCROFOaXY9tzsC4OrVNUOd0iE0TR0YVUTMvgSnX20hD6M7aM/6kcQMEp8u7Xwm0/j9QCSuyOsG6T0nowZbt2Abo9Tlp98+2ezWR2MZzI2xXhAG3iSZZgyho40EZEQ46rrVBQ5+3iHTYHDRjQWvV0sfB7o4OrX9yo5rY3OcUJuTStqOOHN+dtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Wed, 30 Aug
 2023 20:55:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 20:55:15 +0000
Date: Wed, 30 Aug 2023 16:55:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Message-ID: <ZO+sriu2Zt8cv8je@intel.com>
References: <20230830063332.347344-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230830063332.347344-1-kelbaz@habana.ai>
X-ClientProxiedBy: BYAPR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:a03:80::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f34d5c8-5c41-44d1-d7b3-08dba99b68d5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QaGwEVZn8HW1D+YE8Tks5UTFp5kBym77ILaZp7yeRqacEJ/epNOVVeoR+nZG9MSDOP9MnfrOOPN9UnyUS/9UUpnA62EWDNUALkk67BDJJZFOgeGMhbb3GAl4X2mO60o5VSafHcxgV+G6g2U/XC4TJpZyDEX8OF07TcR63mLDR0geMvM+jMPhb8sEeJF8HX0qnJfwTOiK+ISPNZtvzcLrTzSTAgZF9sbawWw6duf9vcDR9gMpdDSI777u5l6cIxhJ90BgwBmWw7ZPqK14JfGVrJk+NK+JVXc01mJW+GhOWL2xeA8bbWJw3Hkd1l6v4MSnIe5+RN0UUcW8WVn/AU4NGzp9lc3FsVNkoN43+oY3H74J6nm3FDO3PLR8KUE77jkWn2hUvj9A1JyIpF7EVVVwokdRmzSICmkuzy1lgQx4oKxl9Ie5ty7/dnO09BJqdGC6sLS2WHQivGMeb3gj/whCC3VDxKKQT3fj0x9UN5kBCe/EG4eQW9NPqFgTcRWHXcOupst/3PuxYkdQasAx/dTa1v9Hs2QE8J/K3lA3JfwMF9g2Hn4sPmaFVe0o99lo62Zr7cdpXZdcmSQ2bV2Jo6ST9xmkDY8gJLuWTaoNfBwjBtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(6916009)(82960400001)(4326008)(2906002)(2616005)(86362001)(36756003)(44832011)(8676002)(5660300002)(4744005)(83380400001)(26005)(8936002)(6666004)(66476007)(6486002)(66946007)(66556008)(6506007)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/Jfp2Kx+YwOyP/fNpu/g6omx1wg9uzkrdGwMTj6HY+rK58idvntGdeBLebk?=
 =?us-ascii?Q?dhd4LADLIxlLf+KQi1ZN7Al7apQVKlr4plKp1sp1EBUFsxTUcShX+WhU42aH?=
 =?us-ascii?Q?BTmoFaa2CwbX1AKccW4XYr5QEYH4ErE7X00cU12rxDGjcP5+u31et9vNpxCg?=
 =?us-ascii?Q?QPmPtKf51eF7saC5pKwcIJRt5CogiXqh3TXLtt2x8hsLAU0j9gyxKxk8HBFa?=
 =?us-ascii?Q?coYTtnIEhKEaL7zt1ZslyCblNsUxSvnsxGWbdxkjrFDeQPO5tbzh/OpY7doH?=
 =?us-ascii?Q?xRz0wPSPt9m+2ywij+uXdA9gMZYCKj4vDyhbUCAQE9BIBRFtHuAWmsETjaf5?=
 =?us-ascii?Q?KIZFv/SJFrc5OjQnno4cN3fk0aVBw0XqPGEk3FsWht4xIJdtNKjn0qRcg/H9?=
 =?us-ascii?Q?moxGppxVllrE75+zNq/WHRFmRhMlzR2yEm6lNGhA2Mfmfa0eqDuzry1eUS3S?=
 =?us-ascii?Q?TW0L0VKAoyI2biZoOdhf0rYxAczVn4ZhaEwoHSDZqSVOxhj4kjcOzIwKLQEm?=
 =?us-ascii?Q?jMe8A54tP7tQQehcDpCjH1b8xRBBcLXjFbWcmQ3zehGs/gLQ4BEJXHpIPK4x?=
 =?us-ascii?Q?JQCg+D1Dv7TLAUtnWvTQFYXvq4R29I3C1TJfo8taUW8OnlYMTdvWZijYr0/d?=
 =?us-ascii?Q?WB1PzDajriG/AiupTNuPwzsIi23ouo3WDZf5lBYPDglisA1xrCG8E7fupdDb?=
 =?us-ascii?Q?cdo2tUsos2P41SdD/wHumAeErFC8wzK0UWx412CMN+7r1MzZXBR9LnQAvsJ6?=
 =?us-ascii?Q?gVyZpP+XPYHYsZl44Y8xU7g6ByzOcqaMAJjIC97jDkBdcqSsqAfp/jk69Yfj?=
 =?us-ascii?Q?SzNMcGZo1iISTH306vNkzN87LNCzdK4u6J2fskIqacQZZDiK1rFVrjahYSKI?=
 =?us-ascii?Q?4lWlM6MBXLe6C8vrmpMbmyTMFBA3Vxc3WlGbaemCX7qi74aKSWfrs0fX4s8S?=
 =?us-ascii?Q?S2gE34qstn0REBy7/jLP2uZiiP8RCoeTfehYrGkjfwivL2Uc1v85Dxbw0jol?=
 =?us-ascii?Q?CbvZA1pQNbfPh9wbS3bc6Eu1QyrmcofN2TVj/MrPG54bxp/zQ5DGZrW5wL7P?=
 =?us-ascii?Q?lD/CfQ50ouXVQsOIdYmXUVepcQ3i1Scv+xcSEtOphUM7sxmNEZqcgYjpi3/k?=
 =?us-ascii?Q?B5H830JEQU0P4iCG+gjXu2wa1yI8q3miAVt6/OUmhHXodLTnAh2vLS3+R7/O?=
 =?us-ascii?Q?4gFJXjDH73UOG6oEMAN9deROMXvDxe3G9MWwU4m+07P++7ap7R6X6Jg8y02H?=
 =?us-ascii?Q?8XgItRZAX1csFwhv0ULnfkndZxSh5q1Jie+z3zWbXJIo6FditnL5kbvWlSV9?=
 =?us-ascii?Q?cb7KLW/fiT7Plop77EX2/7F6mvZdWuRz8Bwf2tQiRNmFAExk4NivJClMTvt+?=
 =?us-ascii?Q?UnVC4IE8/+FGf6K+PRuL0/sPGCS8qLxJwaeE8GfbQDyQMFoxzRxrx4Y1/+HH?=
 =?us-ascii?Q?UlmhVNJiWhVm/+HA78IGIhtDRkpUu23b2DDCObteh2rmrOStGU4bpqKLr1iX?=
 =?us-ascii?Q?vc6604kgKoNXFl2MaQ7wtA0vFet6wglJXpYlxhmM+nVTGwipjayrhZXVsCQX?=
 =?us-ascii?Q?WGud1I0fhahqxMl30JgE9I0JIcRMY9WrkXjpFPCUq4DUxNy3GlQUQclqD3sM?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f34d5c8-5c41-44d1-d7b3-08dba99b68d5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 20:55:15.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RabnFnaqGIOUkcVvIRlXpnYmFJ9rZO3TzulwKfdn2gSL1xqccCbhiknBB1gWmHt7EL/J7MXNIVGIJTiHYakPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix error handling flow when device
 probing fails
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
Cc: Ohad Sharabi <osharabi@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 09:33:32AM +0300, Koby Elbaz wrote:
> Upon device probe failure, rolling back the initialization
> should be done in reversed order.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> Reviewed-by: Ohad Sharabi <osharabi@habana.ai>

pushed to drm-xe-next.
Thanks for the patch.

> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 766df07de979..109aeb25d19c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -325,11 +325,11 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	err = xe_display_init(xe);
>  	if (err)
> -		goto err_fini_display;
> +		goto err_irq_shutdown;
>  
>  	err = drm_dev_register(&xe->drm, 0);
>  	if (err)
> -		goto err_irq_shutdown;
> +		goto err_fini_display;
>  
>  	xe_display_register(xe);
>  
> -- 
> 2.34.1
> 
