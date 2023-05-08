Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B58C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 20:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3510E16A;
	Mon,  8 May 2023 20:32:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774B10E16A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683577942; x=1715113942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3x14tu3Dl1lTp2anoIKTxwgOpDTYL5g2VeTXLD1DIJA=;
 b=DC/7L/xXXeTgCyC/aiia5ylv1YsM1j4ull0gMYHAlVuQ12JNTBVU9NiO
 P30JaeoeLK3U6QAe3jjI0HS+z6pFKyUVcCELj+89htPTbvz9d8NNFWkNu
 X5bBUHToRvwkr4RPocdwJFiFE/feq+4l9Mwp+X2V64vdooXZT4xeG8+Mh
 nnlqkG3CM63D2IhwgeMBx8VbLV5X1SmIOcIMa8UQEdtoYReGoQDqA0Wle
 WG123Zyg5c4tw1doZKE+0wYLZRk/bG10FW5Zkq1OJIhhvGmGPqExdMvVP
 eE13W89+U5KBwjV8Wr6pv6+NMv7cuWbXRyTEoWoRxe6Nxh4r+HNPqAJR5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330111178"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330111178"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 13:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701556326"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701556326"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 13:32:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 13:32:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 13:32:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 13:32:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 13:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R00QjkpUf2HmKalKWBYI6Jhnf2g5Xficp0J8GlFy2AC3wEFvc62kHG+575N9CAP77WTI82Rsw8K7z60ECSomC5+HcYs5mr7BYg3QckuYmwBiYk8191XDwcxahizAApHH8bgAuxziVSCdS/Q8qUOsm9UjTcsK7g3bDPqUiQpfK/vOcAO1a3t07YIsel8DRoA8WGo78E751l7jpmr6tn44C0wTTiE20tnadEtafiLBf1jGHoUKtVHIKZeoKVq5C2UGtOlMazOzR8Goz8xy5PdSL2KGlwor4+KKx5q4Dub6QhkdK+gX5Bbg2obSIdHAC4mCqwdoc2UjXSV7Fbe5aWhXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPmieqSfHfmU9Fz6S55nVXsrH0USjDdEIhY7x8dnsAQ=;
 b=JwobmGjGNnpGsxQuzTXuR4j9WI8YI57kl7uqQz2dI1zZIRbkXn8MQ1LJ6vO7hOr7orOhPl+JqjYcp+Ygba0oZIKq9UpJgeEuM7xuGPDEAGAXZmwhlOWib9cOANxAYHUjnm0w+XgDuKHbIG4El4yLLic6tGZct0Ho0hWcV0DTwcukqAg7ZHkURm7VQ1vRx5k4NSMLT5n+Fi8ita/JwT9yj+LWv9xs97pSNlQp2UvUSzZfm1Q7G/bBNsE7DE3ANdr8BxkNHNKxL30Nnb47H0uA3qqFo0fM0xnBYA6hjq4JHb18/OaaF+i9LZajZn/QfeTazsTvCPyyzyXRHBflpbyAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 20:32:20 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 20:32:19 +0000
Date: Mon, 8 May 2023 13:32:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230508203215.GV10045@mdroper-desk1.amr.corp.intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
 <20230508144618.162140-12-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508144618.162140-12-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 73116032-594d-4ca7-17ab-08db500351c3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7QA9CGiwNZk1AaaLCjULc26YOrfd7tTUOdybi+Me7uIydhaFVTc37pOtT/KAhNnQS9NFOw15XlafhnxmBJpiUkR0h4oRt5zevouDUG+4SVqLkuAuG8kNunnKEjwPvGAobvvma2GB2E6XY91ejNBaG96T0ULZWz/upMDhUkxkuYQNRcvceq3idi6ghJmK5zsYjYCxKoKa+x29xqaBTi1j3avv4OYEKNfUPpF8WgxvpvrG8tv07lWA5BmFdlckMcsyUWfwjjGZFsZDg2Lq7t6fUmdkDRkaWrXEnVb0xUzbMauS8+oGNGN33tsfDYZxyc/bVPcTfW+LaXNlV9y8kf0FbyzWWbMzhNxZrlNrStmgoZDKOr/a6Qbtjfx3sZFqEUEekWiiuaFtR9qAGBr04+ir02485TVmuZvdl0xS/V5VUxdfP2bQSCoPZMnhrPO310EKZOkjrFoxTaYBfXV59OtDLr49nqDv1XD78MD+Si/IB37NnzgtaCYIIj89Jmz7E6Af4BNpU3CFncXw5bocDz4rp0Fxg5HbpKzy/I3IrpWwV+f0lWboHVdPWkII/qWseqg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(4326008)(2906002)(8936002)(6862004)(478600001)(316002)(66476007)(5660300002)(6636002)(8676002)(66556008)(41300700001)(6666004)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(83380400001)(38100700002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Sl5rj6LuRQBUJSou50GjaBdi9ZHics18/Y6YMVcFfGgAjp1KOJnV1Nkw53L?=
 =?us-ascii?Q?YWPHHpXC5g/8FozXiQnRpFnhj873fKoElxnFhTXpiAJH/WKBfzCh7QCLWsXN?=
 =?us-ascii?Q?xH6s3kkiIiqiUJAQx78UIiHpJF83C+zmxAgI3zbcPpDWdhAEMQWyMWde8zgl?=
 =?us-ascii?Q?09AWtcoVlUsknTSKyh79rTMepG2CnnjCmkHnVnyZApsfTpUYKZYPwRG+YXjj?=
 =?us-ascii?Q?GlnMLs5UVcu492T6IaVMVcTvCrB7LtY4W8u2UjI4SHdmJVQffH5kf4pR54xP?=
 =?us-ascii?Q?2Q882ZwUFx8jJAx6Ktcq3Gylg24r4baG0GqhUeEHngrWG8tIbUT+XUkTuXEM?=
 =?us-ascii?Q?wO25MZU8+iQHjgmK+e6yYsCCGOkgevNIYIDQd1vlMNQhbgXfsoIURHdlh50J?=
 =?us-ascii?Q?b9R3uBkC+09lSMLTTrm2OfRW3OBUup0ndCHOjKZvrN/PEBPTe5bOO+k8z83h?=
 =?us-ascii?Q?5DnJUqTrVacFi6wPG+8IbvBXOBT+dHbUzkXcJWh5W9C5L9WignDsprnCIjtM?=
 =?us-ascii?Q?kSY6PG4nyykGsFjcgG7cW+LgRLMwCc0faLnyCdb4UzWTKTWwTY4n1BVZsxDk?=
 =?us-ascii?Q?fWQwQtqLWUofNUWCCBshP/j+VGITAlCQMuExMVCNaso5X1xJwQ8KZBGknGNP?=
 =?us-ascii?Q?dulFuN5X9Z1KO09h5x90NGJo8Hb/1IXaXvO8iNO6YMDZdJ0cikp0oNOownb3?=
 =?us-ascii?Q?uyLggnkfgN160mMI8baExE4alA1EmrBkvNqVX5uK4bn5QT0SpMJ7i3tvPwuO?=
 =?us-ascii?Q?95A0EpcJRIb69yEzrmI2xXfZl2U0wFqv7PhDqmCFI8JUVhce2LfA8ckHI5zH?=
 =?us-ascii?Q?myrWrEMVS2gc+4v/i/HdKIFl0sySCkwwGT99CzmBrbCbsSDsjD23Q77ELHRA?=
 =?us-ascii?Q?1wQEGwV4VKpPLqMXj5syQen1SB8E910peaMUH090Hdn14uPTMuxtUOy7fVxl?=
 =?us-ascii?Q?TRjNci67WPtHrG3iK0Z0mqDp3b5NPJHKw35GdGwAD3w20U3+t1GrE3lj5VHQ?=
 =?us-ascii?Q?A9oFRr7e7JsmhITejM/YBkipey9vvXxGDK7NlVQ0O4FlyjjVSpX8P0dWzNn2?=
 =?us-ascii?Q?G5T9qqLFihpyaL5hmZyYp44M0+TAt8BavDFVT3us7ARkSlSOmVhN2IlC1eO9?=
 =?us-ascii?Q?d+2YvvAQg39e8lLkMh58Oq4+S9oGkVnTSgyrRgMEkQFJj0qsk5VGqBj9557J?=
 =?us-ascii?Q?3kMcgWWH+A5orB509JwA9P0GfN86zcNL30urjw2yWRg2v77Y+/ccXDGvslA8?=
 =?us-ascii?Q?oJxRCUyMdA4ddvIT4LhnTVwagsRwRodn+jPChE0LwJR2C4WCwu3lP3Pi78/k?=
 =?us-ascii?Q?luUF1oEOFYWoGVhrKNth4Po4uxdJYwItU8CfqDkfFFVarsWBgoMvMkAWC9bT?=
 =?us-ascii?Q?CUCSmWkTmGzZoqEgRPX1tyhE/UN1lyREt46NtKyxQlR8+Yt+81LAy6TP5bCU?=
 =?us-ascii?Q?PmKVMyWWyotxDkKlj+anIKOJ1QHzxU/bbot+05re1DDIDennfqt1/bLy7Rya?=
 =?us-ascii?Q?rFKL34eBcgtQMwEwBZa1qFMeNLWEYnHxwKHG7N7ky+ju2aMWecL5Hk7VBqvr?=
 =?us-ascii?Q?NJq3YGoAWO//0gSc9Z9Hs4if1OM85kzqLBCr+g87y0HVqKcpZL4+rP/Bwd43?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73116032-594d-4ca7-17ab-08db500351c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 20:32:19.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd67IVZYNhP3M2toPzbgxyMdsI2Lyxqf3WOjE6gjFCxIMApP67eEeU9eeCFwFoVlUDUr6oYDPCfWv4ano2pBGmNKq57XIlnsQNd/Ga8zoV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/18] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 05:46:11PM +0300, Jani Nikula wrote:
> Add the read8 accessor to support intel_de_read8.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 1a32e0f52261..b72a0a75259f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -17,6 +17,14 @@ struct xe_device;
>  
>  int xe_mmio_init(struct xe_device *xe);
>  
> +static inline u8 xe_mmio_read8(struct xe_gt *gt, u32 reg)
> +{
> +	if (reg < gt->mmio.adj_limit)
> +		reg += gt->mmio.adj_offset;

This could probably be a warn_on; as far as I know, there are no 8-bit
registers in the GT, so if we wind up trying to read sgunit or display
registers through a media GT's pointer it's a clue that something has
probably gone wrong.

Of course this MMIO stuff is a confusing mess due to the fact that xe_gt
is being used all over the driver for things that are completely
unrelated to any GT.  After cleaning up the GT vs tile mess, I plan to
work on coming up with something more sane for MMIO windows too.  I'm
thinking something like a "struct xe_mmio_view" that will replace xe_gt
as the first parameter to the xe_mmio_* functions and can provide them
with additional information to also do range validation on debug builds
to ensure you're accessing the subset of registers you think you are,
and functions to hand you an appropriate xe_mmio_view:
 - xe_mmio_for_display(xe): warns if read/write outside display range
 - xe_mmio_for_gt(gt): warns if read/write outside a GT range; if media
   GT is the parameter, also warns if outside the GSI range or one of
   the media engines
 - xe_mmio_for_tile(tile):  unrestricted MMIO access for a tile, mostly
   intended for use with sgunit, soc, etc. registers that are outside
   the GT


Matt

> +
> +	return readb(gt->mmio.regs + reg);
> +}
> +
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   u32 reg, u32 val)
>  {
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
