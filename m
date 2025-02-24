Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2F7C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14A510E06B;
	Mon, 24 Feb 2025 22:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEcCdkLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF5510E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740437781; x=1771973781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VkOGPzfNZ+TkWAdlYjANb/PoilGv+M9qqdhNF/ynTI4=;
 b=QEcCdkLe7TvUrjRp9b9yW8ke0kdqGwZ/AwzHI7HCr7r7XgnshLaOfLfj
 S7fte1WAEbRe6aPB50q3nXuiGRlGKanvov0dhnvG4xR/yj7mzIuWO5+db
 Y0bw9KNGNMrGJsCL14OP5UYju2it4jVx8XmtH6CvBNfKpc3XSoYn1gq8r
 GSE8QM/2jinOGMCzVbKOuite3rAfeSyO75e7puVNidXf3OGDFMkYwAwUY
 +LPG8KMUXaR2+iHYbLaDghcXFFHKoInUhGReCm+yFKrSXFlrrP1zPUqoZ
 qIKebdljpMGjOGS9CETd6r1ECD+/2FPSIFqF0hLpqkDJBJRtYvPEWgeLY A==;
X-CSE-ConnectionGUID: zeZTUoIuTyi24i4YpTdTKA==
X-CSE-MsgGUID: kv1g7DwrSwGHfoR+uRdWiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41338487"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41338487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:56:20 -0800
X-CSE-ConnectionGUID: 3qYNC2I6S1ynQ6JY1D83eQ==
X-CSE-MsgGUID: E4BZo5CETnOui8pRGjmLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147075386"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 14:56:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 14:56:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 14:56:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:56:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPwoALaHC8jea33KQCaBKE0PnvrP2SMqks8GbjQhmnIw/u8BXuoPQ+edi1r1YVPBvt9GayZGwRTseETa4J1PcEA+vgDY8UwBgA9CwipzSdRp0GwZemj5nVg+I2JpD25+dUOGLrTrNYjZcJuWfEWlb8ITpQZyxAbkEZKf3vT7XHdKsPWdiHsyDiOvJoSerd+015+kwqldAIAaWpork2EIY2MLeiUFn6fNMI1kTMeTHSLrGwRJrT95nNTRAKqq4HZ9m26X82Os02HhbmnB92ocpVth61vjR9Tl1eq3ILYfgQf85Py8hJqNMmQalKsZW5m1Nhhii1plZeTqiWinnA17+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxEF6tXg1sacO6z5Vc73SqdDwq81OzF/yzY8AinK7SE=;
 b=IJ56zJKjryaCISwBhrb4TVCzlqfsmPxMFyY9iHatz9hP1SDQWstSGH1RE/qE8R7wLXHE2UdU7ztQP2ag2sbYrwp5eAsqwabyuSAGd+l08wLKgKWMODmgmqYZSwf/eLb9x2ghnSxORMe+Y4OLzK74P+amzfUCA7U9+/1zL4Tt6L8pjTPVkISCGnr0lPwf/kRFD2K44IYwrZ4Tb4rGyN0cGfqNjpUssBwm0GNRbZDDRRLkCfCTC/yrRf864VOrjJKHwdG790/6L8Tpq43O1R5XvxRvGsF2HW+tg5+08DklouigrBW/ViBuitSmgP2pI/w3Xvz5nWobxc4MksXwqnzBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 22:55:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:55:30 +0000
Date: Mon, 24 Feb 2025 14:55:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/kunit: Update RTP tests with SR-IOV rules
Message-ID: <20250224225528.GD4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224150700.1778-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 182b4b0d-e134-43e5-b031-08dd5526566c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5XGgZnvkMG4n/B63g8zEezRH4aaeZ9t3CteKQJU+1JZAVfDC6oOhK8/mj13B?=
 =?us-ascii?Q?nro5ZpMTRWWEL6D4hC6AoI/e512yqpBGCOVtKBiH/n+X6f/xtfevv91Bm+S+?=
 =?us-ascii?Q?HbcXVPsIpOtdfE612saAGu4BQbKMGYoZaA8Xyfc0MwHUJm/tYFCXdgdfRyx2?=
 =?us-ascii?Q?gtiutLH7PXYjzFdN1BztHTviGkxM1u1muXiWQaY5ffnCnCZ+No+KdW9bH5s0?=
 =?us-ascii?Q?qGFPnaEN5V7Y5DShDhTR3TR/nYNji3JXTnFlbyZWv7uWprIY9k52IAZaJTye?=
 =?us-ascii?Q?c4NItSxtiDD4qvNRl+O4KjBuNl5bu/IbzZbX5PXZu7ff4ip2VYhr4JK7re3U?=
 =?us-ascii?Q?L+tqpulHr9jgN9I0UTBp1HR/AqAyAMuSj40FptSJ7H6n0xlteQWyt6PcKubf?=
 =?us-ascii?Q?1ld7nIn/4Xfes0FUrePqdHDgYBXH8B+w3kcQPmyU+UGx2rlPRtZm0cxq2W8h?=
 =?us-ascii?Q?nie3xC1lk9lm3POzFq8kjwdWpATHcE3jlBMzTe6yb3B3zzyjaYo/PqbDV1fz?=
 =?us-ascii?Q?olC9/2N/hp0+DtJrllBhkxUNsIfRhizSwb5wuD/Wsv2u7yEu1h2OVsnnzraK?=
 =?us-ascii?Q?PkIxM9XxfWOvf1kWbaNIKKcsg6jHdQbWzFX3qv+4GvBgH1Pw7VgeEPly6pjf?=
 =?us-ascii?Q?xt/uO49e/M0xipDIpjlMibbNK3cBeL1t/mptXCGl7VTITgB8VALh8Wo8KLty?=
 =?us-ascii?Q?h0+Tl3l1h5vn0H5WBF92xSDkbWBhv4AxmhZBD4care1x9cN/uIDUB9Ekd9qv?=
 =?us-ascii?Q?rFfXEeXI/q7q88/vfDwgR97V1KK+8ahv+7vDJdpEdIAT8V/QsSxaulY9nSYN?=
 =?us-ascii?Q?JBsMNf1HpIBWjOjdJjakAIQBk72GJ+VY+hCQ/sh822COnv1gGSKoi6ZJ7eyH?=
 =?us-ascii?Q?CDyZtup9LtQiQJkQjsXzCdh6zlMFMObVJI+OvOyfS1f2vAFFjJs7KenGGmr8?=
 =?us-ascii?Q?rF8BBqf2g5SQqTXYA3C3rmDuQWamdbeMxEVWWeHR54Pf8Mjsk27paWKSqJue?=
 =?us-ascii?Q?qJLBr04Se9GuKn6KWlSWLTyung7Y8ALa0dRbSbF5RYKuZEzfSa5IZpEKWYwV?=
 =?us-ascii?Q?RCdoaDxINV8diqB/yZzQ6hCHCQTgV3dSotW7qu0VqUJUHt1U7IyLveCulLzU?=
 =?us-ascii?Q?lRffteU9qxXUNGd+SB0OaNX4+VmmaNVlvRK2da+KeHS94Xji67oCEvY9u7NM?=
 =?us-ascii?Q?gv612zRkavvh3O4nOcDAUYD1UZx66a39yfig4Zjjia1w5Pw2OOh0pfQSHGlg?=
 =?us-ascii?Q?xU9HNdsmGdqonkgmeNo2DfNmNxa6OhqobcTCoUlpmacnnz0GG5XGy1VsrNvc?=
 =?us-ascii?Q?0Xn0YS3cXPLnBVq0JKimfEeWqV0c0Not+xjyvApseGAmEAJFcAH0KfOIagag?=
 =?us-ascii?Q?OfMJxxp1KGXrJ9gg9EAld2a2FWom?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PYwD8JhUWJVFMpL9bJxr+nNUK+AhVOuLNcxysR3tMQ4BVIDMcqJ5grdlap9N?=
 =?us-ascii?Q?blibHb7QXbgPr652Fd6wV3JdoN1mAgX8UY0d3IfAeTAmZ+/fcHDwz7QhpC0/?=
 =?us-ascii?Q?M19dWXO+6TrKpgoLO/iiiyIBD9py8YbtdyoVuYlP/XeD5Y9HirGtbZn+RgBs?=
 =?us-ascii?Q?jj5OaHzK55IchxzenWSv4n4YfCFIfK+7Ql71tftlgf1iC24fs/UNz0tNGeFd?=
 =?us-ascii?Q?HNJebKxHlAy8MGbXNTbKbGoGDDTQRjcUtaZwyqVjkNiww0UaWP8taroEF4uW?=
 =?us-ascii?Q?X9NBS+s8EJwoCgSUSqn1fH94/gplZUOW6uUa4DD4Vic+qKf/HIYzzBKN4IX9?=
 =?us-ascii?Q?UFLNFd6f4RrbgeV4Kgru63MWJhe66ivlyYkcABXqnDbBuEUrode1NedBIBFq?=
 =?us-ascii?Q?WAGbqrzvQ7USSAKEBjKzMWIvllSW0CCPc+UXK6o4Wb9iAWSS6twTba1kJQow?=
 =?us-ascii?Q?rXMll6JOfpIfo0wfb96nSLaKpSbU3T8F9qFLaFMxEzkqoo9ng59+r26zQArU?=
 =?us-ascii?Q?Gy1U0cMjKdgflSmGB7Grl4BmWFXgwsFV/kHit+9jpBvOMdii4BfRLCF6dRk/?=
 =?us-ascii?Q?F21JXT62FhZj4QkN41FtOQz0HMIjEHaKf7gFCCYo6DEXFuowuPiN7iywIvNm?=
 =?us-ascii?Q?gEih6aCElBmq8EibvX+A/exQGQg6jJ2Pi7TnjYyavo58N3rPIiTY9Zg/4quc?=
 =?us-ascii?Q?ePB3klcxsHbQJK7chTe5mg19/vdfvVMMF9/06doli+ueKY3a1CHpcD4TUDli?=
 =?us-ascii?Q?skwGy2LTepxXyWhkLqYac7joTX5JInM0P1IsM55zSYGJJi4+XDbrQnDYazBn?=
 =?us-ascii?Q?3WcsFuf3xgF/Sw7QtK1MvIL8y+nJbTsn4e6vsrzrNKEYt8YJdMRdgHPbKPsR?=
 =?us-ascii?Q?I9kiRkDHkRDuO4d1lIuNYlQQUkh2SRZPkYNmlCXd0/rbZBoWAP9nkpJZrdl3?=
 =?us-ascii?Q?QGcpW8FWnLaAG3AxLZyX7XH15shasHAQb7hKEAJb/Imhjju3BNmdTLmzif8q?=
 =?us-ascii?Q?gZVnbwcr+gQsdMxbJCZOhRE/un53vJK+o07rsXhfaDCTGaNuzePgtptkWwPo?=
 =?us-ascii?Q?xyfZaqBmbRmIFGAtg9Hzt+q0TWvt6fGDqxjGp4rAS8hFkGcBQ7kTNzZSatnB?=
 =?us-ascii?Q?IJzNw1AebsIwliZFHwcri2PsHv57jPm/BofFpKXx1HjTvUAg6GYGyzq8qGda?=
 =?us-ascii?Q?fnsoijEbjxJFBBEjFSaXR2W8G4m0AmhY/aFCesx5G8QukEX37M3dF+3ZKZMA?=
 =?us-ascii?Q?wnjQ7Bk6VdSxaqPZA/tylI0snRsg+3fzX3opnW0VZ3Oz42cksa3Cvhy4Hui1?=
 =?us-ascii?Q?1/E6xBHHVnLoAqsXib1yvJRiQXaPXPQoCfT6516G2Bg5OhsC5VKeeJAdIfZ5?=
 =?us-ascii?Q?3WgxqXX2alAVjUEPpak9Mgd+FZd/dCndou1bHtnBEMZktKwDkhXFu/gyoKGp?=
 =?us-ascii?Q?MJI8UTOejKb+Ef5qRG1v6tg73v+wpTEJfdwwyn1RIBXCFxzRQuskJ5ZT+DrQ?=
 =?us-ascii?Q?NuB3Bw5JKvdT9BshW3y8exKzQ2ea34Tbz336HD/pP4RguD8fcDsY71S62mf0?=
 =?us-ascii?Q?oldv3bBq2z7l4T036j9uAnK3hOCaX6n+0o0j0V2i9A+0yhyTmK3imORBHlAJ?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 182b4b0d-e134-43e5-b031-08dd5526566c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:55:30.6663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCH12lRRRg9cVJNooK+bMv/3zUqWxpStDVOoyt3p44LQDmO6rosYvcwD3Cse7IwVOUTI2D3DE5m7PCM6MJ4o7SJ3QV2bSKG2Bt9FyZbRG0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

On Mon, Feb 24, 2025 at 04:06:59PM +0100, Michal Wajdeczko wrote:
> Add more test cases that verifies use of RTP SRIOV() rules in
> driver running as native, PF and VF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 36a3b5420fef..b21474df933e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -45,6 +45,8 @@ struct rtp_to_sr_test_case {
>  struct rtp_test_case {
>  	const char *name;
>  	unsigned long expected_active;
> +	unsigned long expected_active_pf;
> +	unsigned long expected_active_vf;
>  	const struct xe_rtp_entry *entries;
>  };
>  
> @@ -469,6 +471,89 @@ static const struct rtp_test_case rtp_cases[] = {
>  	},
>  };
>  
> +static const struct rtp_test_case sriov_cases[] = {
> +	{
> +		.name = "non_vf",
> +		.expected_active = BIT(0) | BIT(1),
> +		.expected_active_pf = BIT(0) | BIT(1),
> +		.expected_active_vf = 0,
> +		.entries = (const struct xe_rtp_entry[]) {
> +			{ XE_RTP_NAME("and"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			},
> +			{ XE_RTP_NAME("or"),
> +			  XE_RTP_RULES(FUNC(match_no), OR,
> +				       FUNC(match_yes)),
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "vf_ready",
> +		.expected_active = BIT(0) | BIT(1),
> +		.expected_active_pf = BIT(0) | BIT(1),
> +		.expected_active_vf = BIT(0) | BIT(1),
> +		.entries = (const struct xe_rtp_entry[]) {
> +			{ XE_RTP_NAME("and"),
> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_READY)),
> +			},
> +			{ XE_RTP_NAME("or"),
> +			  XE_RTP_RULES(FUNC(match_no), OR,
> +				       FUNC(match_yes), SRIOV(VF_READY)),
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "vf_only",
> +		.expected_active = 0,
> +		.expected_active_pf = 0,
> +		.expected_active_vf = BIT(0) | BIT(1),
> +		.entries = (const struct xe_rtp_entry[]) {
> +			{ XE_RTP_NAME("and"),
> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_ONLY)),
> +			},
> +			{ XE_RTP_NAME("or"),
> +			  XE_RTP_RULES(FUNC(match_no), OR,
> +				       FUNC(match_yes), SRIOV(VF_ONLY)),
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "pf_only",
> +		.expected_active = 0,
> +		.expected_active_pf = BIT(0) | BIT(1),
> +		.expected_active_vf = 0,
> +		.entries = (const struct xe_rtp_entry[]) {
> +			{ XE_RTP_NAME("and"),
> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(PF_ONLY)),
> +			},
> +			{ XE_RTP_NAME("or"),
> +			  XE_RTP_RULES(FUNC(match_no), OR,
> +				       FUNC(match_yes), SRIOV(PF_ONLY)),
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "sriov_only",
> +		.expected_active = 0,
> +		.expected_active_pf = BIT(0) | BIT(1),
> +		.expected_active_vf = BIT(0) | BIT(1),
> +		.entries = (const struct xe_rtp_entry[]) {
> +			{ XE_RTP_NAME("and"),
> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(ONLY)),
> +			},
> +			{ XE_RTP_NAME("or"),
> +			  XE_RTP_RULES(FUNC(match_no), OR,
> +				       FUNC(match_yes), SRIOV(ONLY)),
> +			},
> +			{}
> +		},
> +	},
> +};
> +
>  static void xe_rtp_process_tests(struct kunit *test)
>  {
>  	const struct rtp_test_case *param = test->param_value;
> @@ -483,7 +568,28 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>  	xe_rtp_process(&ctx, param->entries);
>  
> -	KUNIT_EXPECT_EQ(test, active, param->expected_active);
> +	if (IS_SRIOV_PF(xe))

The xe here is a mock device (from drm_kunit_helper_alloc_device).
Won't these SRIOV tests require something extra in
xe_pci_fake_device_init() to ever be SRIOV-enabled?  Or am I overlooking
something?


Matt


> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_pf);
> +	else if (IS_SRIOV_VF(xe))
> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_vf);
> +	else
> +		KUNIT_EXPECT_EQ(test, active, param->expected_active);
> +}
> +
> +static void xe_rtp_process_tests_pf(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +
> +	xe->sriov.__mode = XE_SRIOV_MODE_PF;
> +	xe_rtp_process_tests(test);
> +}
> +
> +static void xe_rtp_process_tests_vf(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +
> +	xe->sriov.__mode = XE_SRIOV_MODE_VF;
> +	xe_rtp_process_tests(test);
>  }
>  
>  static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
> @@ -499,6 +605,7 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
>  }
>  
>  KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
> +KUNIT_ARRAY_PARAM(sriov, sriov_cases, rtp_desc);
>  
>  static int xe_rtp_test_init(struct kunit *test)
>  {
> @@ -533,6 +640,9 @@ static void xe_rtp_test_exit(struct kunit *test)
>  static struct kunit_case xe_rtp_tests[] = {
>  	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_process_tests, sriov_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_pf, sriov_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_vf, sriov_gen_params),
>  	{}
>  };
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
