Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CECC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 05:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F210E178;
	Fri, 16 Aug 2024 05:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNlgtiV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D110E178
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723784779; x=1755320779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TBWV4ErnDmANGALwiajdtcCZw7SqXRM55vKRfNo7Gps=;
 b=VNlgtiV61d3TVhr1j84S5K5UcceBTvWgbPabN6HkeI4y1KP28VVSwT1o
 aLbLd9Ryv6JSKgVDrJjEG6MDGNPn1eaQvcEIkbp+K1+ltTqUCwjNaMP0S
 PfX3lakPC+HJuljHam3LQytCFETUdy6t1QnFLtWafqXyM9ZIQfu9pQYn+
 dS4anY5TLwIUCzWsW5d0gr/h/0N/XW3L6Rh4WGLd5jihUSj8KF91el/Oq
 96SsiBh2pTDbJB32wnnTtDX4eGqr87pEDxSwldVgAWIgK9pSQ1UMoHE9k
 0IO/bA7MnnFsWJu+TPUns9cA7QjYgO+4QZH+oBc4qXz9UYHmOx81Ndl+d g==;
X-CSE-ConnectionGUID: qaP051ZcTmyqKN7vlOEeqA==
X-CSE-MsgGUID: mbqQK8pHRhWymkQTQJ7Xcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21950317"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21950317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 22:06:19 -0700
X-CSE-ConnectionGUID: HYK9Wi8sQDuOOnCV0Cy+fQ==
X-CSE-MsgGUID: /kbXwPkLQc+lxE7DoGwxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59855096"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 22:06:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:06:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:06:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 22:06:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 22:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZbMzAeXXQh3IgefSrPSVjMC5hA8zyTnSEnOHF1keNG+HqMx8Cmonso8XlRgXvgrXsL7HJuopqYMv7gPrizU6mIyu/kDlzeZRBVmoywDobjVGwDwgtk5+F8zCp5WEaIj5ng+LEJZSR5S77F6st/6dR/gWPUV44fv9N2RM5xZrS/l0vfeyLiGQP8tiMYZXh7AzdwZMJLMnwve8Mj4YoZDpx4sZKgHya3LpD0V75zmcPxgUSzpFxp7aUt2bqwcTm25+IQemWyALff2truAYm3WYZ4soVw27qcYXZkWSRgz6XLajfFJ2NXOcSiiOkQkEZZp5C5jzp1F/Wn/jz6nQP1lrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odLV9ysC5vJqnUOuwfouApQmOoGYKap41H5D6lbbhbM=;
 b=h3Ns5Zxoe1cy5tIOo/FcHnohvCLwtuFK0aOtfFeVUGHLXo3wliUB9r7dJQTjMbHu2anR7s1I0+C0COPXqvzl5TAj4Orp/WLrq6Wr5fZ8Av1lXXRqSQTqTvUUlE35YbR/805RRazgUwhSUGVdJVvLyTpHlthIGrgjWZM6Mvx51KHTqckD5WgNRsU8hnLQqa0oGFy/vP6ugUoXHo6/r+jysfB+QgOHZaO3BPh0roUtIPNWwdbayskVWxXBnrL5qMs7WvujFdvmxZRvYP6WXfO9mjZNiusL428fJ5AlZaQS49zC7lL01dPY7DxAt9zqOq+NM+jM1ktACIQiyK8Dl/VGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 05:06:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 05:06:15 +0000
Date: Fri, 16 Aug 2024 00:06:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use for_each_remote_tile rather than manual check
Message-ID: <y2p43m2m7uozan642ubnbl3rep7bqefof6yegvo6empostayqi@lyy733cbuy7i>
References: <20240816040208.62695-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816040208.62695-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW2PR16CA0068.namprd16.prod.outlook.com
 (2603:10b6:907:1::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 0613bdba-58d9-4006-d17a-08dcbdb1275a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wEAtn6mZALOjyuLFhpjbCu4WxZCBC4o9pWwx7u7PFmCr4FksXF2yF8WPQnOl?=
 =?us-ascii?Q?THdbtWRxmDJI08juTPJd875w+bmRHkQj/1EGds4w2d5ZLoeJ9/YlRG5WeDUE?=
 =?us-ascii?Q?wB5x3HnSnQ3txv3+F3m0kl9m8OVdsyaOafZ6Py8voP+wBGrPw8jWYRd+f84T?=
 =?us-ascii?Q?R9dIM+WcGOwg7X6FiTeRupC2PV8QYR9H9nGI1s2ZUVTXKmKBM9KWbn9OW0E3?=
 =?us-ascii?Q?7eljufMQSJu0ISsCmP0WuTVnhRLoOZntM+6M7MvvzkraJKh0g3xv1fbER9rZ?=
 =?us-ascii?Q?knHjVgPFTvyCFlhMQ6C9BGCLHW1QRSTqm+aJuXPe4JRp+G9gNqtxKvzyB1xd?=
 =?us-ascii?Q?GDEHOvfYrjyRbMdTdvbgJHd2FqhI15jKWAJbG1lFf8Du+6jk/zmezq0e6On6?=
 =?us-ascii?Q?fkyM36tqmDAiMRA1wA+J+R/t0pHhEwGoK8TmXSoiyTkjersQ0fa6PZJXB3MQ?=
 =?us-ascii?Q?dcL1aTg5vTbuaHBTusb9ap+rP99i2fTHNP6BoJgoPxJ7gFQA/GpuCEMq07ar?=
 =?us-ascii?Q?LWY2gAlxsR+EZL3fEcNr8Wy7C1gvtRM21EyzTU+npjwDagEojJJpwfhdjYgq?=
 =?us-ascii?Q?7imc586Ru4aNXXbYG4Nz4qKofVuOqUGMO/VhD7CfpAYG+H0Mot2BlkWSJ3vO?=
 =?us-ascii?Q?k/GA6nshLCbhnu9pIzJrNzgBPGKWkuH9HmSWs0P1tVxTB88wzmU2bcIsY542?=
 =?us-ascii?Q?M7sPSSsKjhSKBSJdDt2l5uE0Oh66HSJEsBUVjkjOVrZn/yRxqiypDsQ3plLA?=
 =?us-ascii?Q?RB2oyn4QvYuGhe7kg5CmXlV0lJtpksB/0+eWgkU5Sn0Grl4mKa6kpMRlH7Qf?=
 =?us-ascii?Q?NvDD2hqBdXVQ+zmIurDxVYTFx851a+DhKc4EK5NOgiWi3LdueWCUevMYx2bo?=
 =?us-ascii?Q?GCiELpHNVAp+RpQZ6WShiGjf+Cx4elSOyeaWp5+QD5+rIUhhX5WZ/ALAjzGL?=
 =?us-ascii?Q?IyWgGgRuAwxt5kZOZHJ+jHV/p2TGE58skfuVPMVo5IiigLC+oshn0fKXe3Or?=
 =?us-ascii?Q?xw4bqTZWo49Hu8O5r0mhi2XLK70e2V39wzurm/xUzLcr3tZsKorKh3SgLuMZ?=
 =?us-ascii?Q?WWHCRcD1pEIzCm2/858rp9mf/QW8JdIEVboyhXEigEnnxkSQwVBubt3Ys3nG?=
 =?us-ascii?Q?q6+OUfgc+w12LxL93RIdaKEbhDkmCfevvgyCl1vkt9ADJrStGhLtbG/jXlKk?=
 =?us-ascii?Q?nL2V0gu9ZZuCs2Ecvw0a5oECCQAcTA8UwyfoveMtGY511xxZFbkGf8OORbXu?=
 =?us-ascii?Q?cgZZycE8x5YLCUFIuqtYoNZpLdLGfjDtHe0hG21LBPvKbmf+5/2bscLUdVCD?=
 =?us-ascii?Q?SuedSYNKWtLn2u+4v4uwNxeDjYpTb8gzfdyE+pwH8JfQHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSuNcr4rKjdy0e5hnWxhIVfOCQUu/mLjpbuzewwJrxfYsPjPhXaqpqQIntTs?=
 =?us-ascii?Q?woTrn4yx3KaxuHaCR92oTeWeSp0l2ddnMpZmHUMLL0SeKhRcES6OCCqZze6i?=
 =?us-ascii?Q?54xGsJAfLCWPe/Y3oWW0HZob8ZDiqSJqFgNoxSXFOgLaDf/2QpayR/bQG1zi?=
 =?us-ascii?Q?qzjP4cNCqM2uR0jrmUxGhL1p+0CZQ/+wSNk2lIlSpXezq29zXsVY+VBr0xuf?=
 =?us-ascii?Q?vIHBK5BhoMXjrRXM3w1Zj7VppFqJfz8FI9yPRjA92yhsTBII5MdspnzeYHlY?=
 =?us-ascii?Q?R+RmVM+Wl9ShV/hhJ4xe1kdBsvuy1KtDm5Ue6AhDaROWGBoN9+Tk3QflFHBQ?=
 =?us-ascii?Q?j1f2FFn4p61F+pIxah/WWghOkVHvucAFSRf0Z9hY6H4+RNQ1hoilhcUEP7HR?=
 =?us-ascii?Q?w9aO+dzTjibchZl6QtX4jRTNTSw4oI3mp1ed6ExFiBWtUYLNdASprjiE6wWy?=
 =?us-ascii?Q?es3hBs7Jc7sD7UMAseHDFj7rpULZkFyTwByn4xdC/nio/fMsrCYLy2B/xgLo?=
 =?us-ascii?Q?GOZ+/JJiIc9T2oaA3QqTF3AO1eaKsYiX55vUlVkXhBIG+6VNg9VMSTJMh1TX?=
 =?us-ascii?Q?NiUWbz6V/lDbsvUEIwfOJf4krx9x7FnMkYutEQ1iua9BV6PGrZND1EWhy83h?=
 =?us-ascii?Q?Kmu+TjsIzYz56EjcQO7c0e6GIF8PVMtv2qQ56ilQwby82C9CaMYwIYe8JvV/?=
 =?us-ascii?Q?RzB3dUuqBbWAeOmBW5k3wndnS+LU8qZ8HEUHhMowB6O2DkiVks9tkcWwY22K?=
 =?us-ascii?Q?QmnyBa+7Vg9Yz94G5ulVS0efkfHAaLg9w05LnXTwHnkHqWz/q40UOYwUceqx?=
 =?us-ascii?Q?5hV3Jblot8yUi3E/UuRXheYHAxbgwKJI6JqDcA9bTWpxNQwlSRS9sm12zS/p?=
 =?us-ascii?Q?uEFCxPMUgKQweAhcJ3ljqnvu2zQ+g302M0UB1Nsro03h55u9WDeJhfWYzfkE?=
 =?us-ascii?Q?BPJHnWiKl1dQJFeD+EdNd74PJA2zEGqNSL6QJIRDNMn5a3E5LFG8v7E328Pi?=
 =?us-ascii?Q?SYvlrFevkhEgxD7s8Nx6KJKYPRx5ubEEyuhpOJ0VLEdNLaHIWTesQNH8VHwP?=
 =?us-ascii?Q?NE8j6bbdv4y4qZc0MntmcwH7MsOUm3B4iWFwuahM0GibhuvuhQ+2CmjjC/t1?=
 =?us-ascii?Q?l6lgRXfURut8ovwjuy6ar5ePoNXYRt3E+CB/zxHLxLdHuQFNFs8czrzzCXsu?=
 =?us-ascii?Q?bBMHVSJsvxR1TDt0GbvLvBFICpr+RwymXdD6reCSWkwyXR64MZe+BmMjNjhd?=
 =?us-ascii?Q?UPVDnIq7qpQ0QHPttCqMs+CeG31zpvckaHIhp8A0rSupBtuTGpPs95YptDBU?=
 =?us-ascii?Q?D1+OYVUipSqQTzGdD2ZWDIh2U4f3PERyr+5DTnuCEl+X9bWnY2Iw14proCXC?=
 =?us-ascii?Q?UyXMDmKZjxaaGP4qRhuBsFYf8nliJBUCGXk2fqWwr7rYIQoCEDJqgaBzbTLo?=
 =?us-ascii?Q?6Rkqihfj4clGL5x/ZXzwzdM74jvESM2RHqQgFXqhJ9YRoAphUrxOhdNfRKqu?=
 =?us-ascii?Q?SASHMGRKTfvEUUEpfMmUgic7iD9aPJbLyTLhn3pmnrU3C+Yx9F2jCBVttXKB?=
 =?us-ascii?Q?ldBwk+3oKpTRWuxwQJaz+cua+x6OolIaTdqoVb/TBLiSsdKeVNhsdgfvgPpy?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0613bdba-58d9-4006-d17a-08dcbdb1275a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 05:06:14.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x9cL+HtZfnoG1wZjaO3Hnm3h4TvVYS2bkgrGkbWJqmf675KQcW9pd5+mSV7du+GRGZMCoMDiQAwX+i8i2JDc/wQK1XfY3lwJGAWEpPOIbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
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

On Thu, Aug 15, 2024 at 09:02:08PM GMT, Matthew Brost wrote:
>Replace for_each_tile plus a check against primary tile with
>for_each_remote_tile in tiles_fini. The latter macro does this for us.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index f5bdb540e823..3fd462fda625 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -29,9 +29,8 @@ static void tiles_fini(void *arg)
> 	struct xe_tile *tile;
> 	int id;
>
>-	for_each_tile(tile, xe, id)
>-		if (tile != xe_device_get_root_tile(xe))
>-			tile->mmio.regs = NULL;
>+	for_each_remote_tile(tile, xe, id)
>+		tile->mmio.regs = NULL;
> }
>
> /*
>-- 
>2.34.1
>
