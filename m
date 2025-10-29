Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF72CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 22:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CD410E862;
	Wed, 29 Oct 2025 22:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hu7dOurG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC41310E862
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761776673; x=1793312673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XECpb0sB2IMNR8UFyjIXnZJ5N+rlfbyoWtQM3qSaR/o=;
 b=hu7dOurG3Ui2N2Z5mW9w1PqNrwSmr68K5ZlmzJ6WvJAiRnM7JM9bFodB
 EHOzEMuu8nde++OuC9GJmNxHuWIoNwupvuSDRm1/uaF/0F0AY+nRkkIm5
 1iTZplG+JWFELLTpxe670rUmjBcZTSGZRSEUP9gZBZwNmOmO2W9sm6pK0
 MhL35G3yVLOibtTFxlPUDLr8vcr7Q+C+y1tWq/nrzrON1rcXhJ5oj5cwP
 WmuNzUVsPjxXcHYi8pWmQrIi+cpmUcYkxeRyybjdAdSEtL8d1DtyhE1V1
 NU9cutzvr09Ajo7/sX9R6VTUaQ3r+jKVvfrtKTZJUV7hbmSmd4qp7a5wY g==;
X-CSE-ConnectionGUID: KK82ZY6ARoGNWYP81nCb4Q==
X-CSE-MsgGUID: v4d2b3q+RMCMVJR9MAUrNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63794806"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="63794806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:24:33 -0700
X-CSE-ConnectionGUID: PkIKLilcRXqiGWtsS+CrfA==
X-CSE-MsgGUID: 01AXlp/+QZ6AR0BME0atQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="216445869"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:24:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:24:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 15:24:32 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 15:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZw6WH6gnbkDMabb2sBwW4PES8+uvabJSJarTHJWs99Nifacckh3rp3hNHlGTwB3ontMtS/XtOxbYPamTCXqhUhhqZcNkK14q1kdallJDZzoSk9TgtGV5jBNkR+M4YTWOYUQ/gOQcipJ7nWq+f5+F3GnhEDujVA83OSRb+gUqdgc9TpvSZaaj9bZGupZWqGcbUAYOgKRPqYkt9p1ictA1z7Kn7Q0L2nbTM8UbExijr4LYD74Gy57H/nYotNMm6Q98IDYfL8RAcfpY6DjhCi4mzP2SyNDIHfl7ESIHVpy64PyiKbcsBGXGkn0Fc/Roww0bdo/L8TIFVvBXeOh6ID+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLUmG2MaZyXmIV1YEq9lowBU3n7VEVI+qb2uNU6d2Gs=;
 b=yZn3Sm7N2fFLwfTLEXvljcjZxEDQJm8YY2h05bKRx1G3btGFhe1IFv2rQTxORrZeGgK93qYrvD+UPjyKovyYj5RYcYBmlvRowGPuA5qKoSGzoBEZYEJyGUB3nFoZ+Y6jvPbJLachmlMa/5BRt0QMp2DTrgNi00fL61urCIUQeFI17JEsnU53QeyzkaS3vGLs1CH13+YR42XdmkUi9L+jFgYrgtUlWZE8kzF8m3OlyTR7YRGp/VaX4W4kag31XkRjhXmqLY1jBlyr3+nfKRUYERECkV1eKd7b4sTrLJhfYwvA9X8RxK1IA4OLikGsdSn1aDTU3IqC90s+mmrJUXzy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 22:24:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 22:24:29 +0000
Date: Wed, 29 Oct 2025 15:24:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tapani =?iso-8859-1?Q?P=E4lli?= <tapani.palli@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe3: Apply wa_14024997852
Message-ID: <20251029222427.GH2806654@mdroper-desk1.amr.corp.intel.com>
References: <20251028205958.GE5409@mdroper-desk1.amr.corp.intel.com>
 <20251029085057.54210-1-tapani.palli@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029085057.54210-1-tapani.palli@intel.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 445fd2b9-0b91-4b85-d4ac-08de1739ed5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yMmAG91XHrZTo7xp+jCV7aAUTnhe69B4keAqBYLa7N3uCQwl/OEOpRMBLf?=
 =?iso-8859-1?Q?7ZbjkPv4B6WiQ0T5cl5lNkp3FAr6PmMGmU/R/v9B7d/LDKwAOzdHo34yHJ?=
 =?iso-8859-1?Q?GVZScRiIL2Af9hSjWQGHjaGegK367h5Yp6+0Pc7A2hBysb7m8aMKEahnfM?=
 =?iso-8859-1?Q?MIgM2l41bcVqi50EOiW6uzom1CI/I31x7ziRQT1FPU/UjmvmIl5QeMePwc?=
 =?iso-8859-1?Q?/Q0TDDINdAkJekuaYnt0BisbkHWGM/s1DoruzZCZZ4GwQG3gNDDZPR8d1B?=
 =?iso-8859-1?Q?qTv9L79t6mnNSr8BUjbnQm7R9hhFNt4U/yyGhP73PFh2Ip96MsaD/9+KcC?=
 =?iso-8859-1?Q?CnMz0LLNTRVRqfXPf4hTeSMCKPtX6e3LTF60OhcRK4VHrogrbtwiwNhv6p?=
 =?iso-8859-1?Q?gSsHW3pSYIGjkC+6V8q6xu+xpx/Np60L1rTHui4WdrTZRc2sAVOyCxJAfe?=
 =?iso-8859-1?Q?3zlC1G6KKdwXj9+m866sOJ+Aidho+G3x5rUAimN9WcTMg9FOxNY1M9vzX3?=
 =?iso-8859-1?Q?lbTK68JcjISQDB1bSE+GU4xOkknEqbT7jTUCfxC5IAh6k5oc4yENBRYnFR?=
 =?iso-8859-1?Q?3MXi4xnoNC3Av+Jpau66/wt7ho4GkSoiARAhZGiMz5elC5a+Hddyp4pZSp?=
 =?iso-8859-1?Q?YtpVjhLzmD4IpF7OBsBSZpaddnLL1t4rgtH7393/tDXrT0oaG6W4dhoWgn?=
 =?iso-8859-1?Q?DAs/QrNZ201AgDgXXnJp26u2wFDha8KNMPCiIiW4oQnk55O2v8sGLp2Q4v?=
 =?iso-8859-1?Q?g7W13q4fpl1VqJVZ4qL/S7EgxhKJw6dKLzcYCMlmQyHd1wwBQp2v+Jw1G1?=
 =?iso-8859-1?Q?zhbM3tCrP8m1kLUEyjnnkdvsDVch9EorSKlassd9PE9rKIu675fMqNkcwj?=
 =?iso-8859-1?Q?htXibhehN7WjnuZKc21+JIsv2zEH0uCdv93uo/dZ+WbDw7e/2oBAnBgJCt?=
 =?iso-8859-1?Q?FgZtuCJywHTI8K+cYYeEqFTxbQTiOLZ37V6q1eeWAsj3s6oip5ECb7FJNm?=
 =?iso-8859-1?Q?eHmHYHWCykGaUsmTkCkV3ClzTO1soTcCIjYqPzC6DjI7ZvyHVLQibbt8jO?=
 =?iso-8859-1?Q?FzPiLqAGit93FcHlcN923A+ipTJSXsSWpUcXIF3P+0BHqBQTJ75I+Q76DP?=
 =?iso-8859-1?Q?yZAvET3ZfOras9p1w/TQuJBFzLtgDV4ZErOcyuLcYSDGIbLAvOCfRwy4i3?=
 =?iso-8859-1?Q?ErjYrmnBspD+iPrPQGpp26tetaF5xZzVpmazjEmZ6XWHwsF8cwyRVBH1SB?=
 =?iso-8859-1?Q?zH2cD5CqG8PjxQScsLjQfClIEnXnECDjguS8jecoldY8AcHQQYysHbzS47?=
 =?iso-8859-1?Q?WdkC/UDaX6EjPpFAox6IWbgaP1mNrD/LP391LEluLGr4OTmiaUd3rnnOZv?=
 =?iso-8859-1?Q?urmVUTNQIN9Glr3j1daWWIGY2xRP3H0QxOrvkYYZlbaRgwILcRphw5pn+X?=
 =?iso-8859-1?Q?gcMJlCCQFt6BEvRvEmLQ2q3MZK4aOxclWzpLanPPAmZU09GWVBMv1Jo1wi?=
 =?iso-8859-1?Q?bKXrs8B/feH19UiwIxvYTi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c9sgFbgDcP3ExGuddg+NL6HP+DKxi2KrnD3IS9cmfsxvnd5gRNas8BG4Kt?=
 =?iso-8859-1?Q?m97y4fOqB6ShmdI3Gt25OBJTqqFXe74doc5i7sMtJ9NodC5vZcVzrKjn0P?=
 =?iso-8859-1?Q?nZaZWEUUESmD1jMdGxliDJHTBkG+NBpIKLslAIYjq7l7XnlF7DnBuk+Qdv?=
 =?iso-8859-1?Q?0rd3ah+LCIYue2tvlX7Twm8tjuDE6yy/JydxzZdyuD1u0no4L3ORkf4DZJ?=
 =?iso-8859-1?Q?dj1aT1PGz2Hws4cjurCMB869ireuF/ut5BUxTAMS9pbFKZ2BtVJPerwD7C?=
 =?iso-8859-1?Q?a+S19xv0Lh81EHxt9jxouHTN/0pC8OHIvwyf2tGaCB19su06L3QG07Ndb6?=
 =?iso-8859-1?Q?lCYLlY2K8qs1GsPG0fHJkQCtKtWncNkOnoMYlWKDcrx5ZQXqxIpX+F4Y94?=
 =?iso-8859-1?Q?dGGw+00GjuJbX47Mtd57vhkHvQ7EYlE51ZtuwSC+mz0JSqhYRz4Bs+uVvi?=
 =?iso-8859-1?Q?pF/5M0BUViNsXGHSlCUTpZz0rAwecIwwpohFZFIpdJGHeSLRPctEk8vuHw?=
 =?iso-8859-1?Q?VkjBEphZlH7nOHBX0ftpMZnBZZK/Hm0U30jEI//awEF0hqdcBRQ9JHcKbn?=
 =?iso-8859-1?Q?GBgHfPARSsmcXumvDnOtPMKWnxgCu46O9/7Lk+7ROg8bOun9W0gTl0AtF4?=
 =?iso-8859-1?Q?zJx2WCTI74P1EAKq5pqjoFVWKnjrPBfbhbc52AVwlcsivcQkETgXFzOmbm?=
 =?iso-8859-1?Q?0321UWL7xNLoO6Sir4BqVrjXZs/5vqdU2MO5HM0PJVuA4IV9zmNwn+2qsL?=
 =?iso-8859-1?Q?hTabyFxrPWvq1HmKN8X7peZkTKT6yjZjWek35QJxXXii50moGdCdpjnUPq?=
 =?iso-8859-1?Q?1ADDzN/0u4qYnSdKb4Yknw1bYWFkzqkRxhBmJZLSnQM6BDLmnJvlX09vA4?=
 =?iso-8859-1?Q?eWRsZtd1JbcCc0k8mNxjqiXWjuzjjuIESUXzDSGq1YWYPiMmYviHZBLGfq?=
 =?iso-8859-1?Q?xyPfXmg2WI9dQ+WTF1nUTa2IhmfDy7FQNRtd4tTXfD5pYEDhSktjX1NGy/?=
 =?iso-8859-1?Q?Asv3bA7CQrWUU0ZYejzd7e91NiydApMPkRFrSql2YupoZf+4F4MKcVFCyg?=
 =?iso-8859-1?Q?3G5WP+iTFXLOkBygD2Qd2pQg17eb81117gA5ag5TjJvLYn05vrm7p9U5ly?=
 =?iso-8859-1?Q?G/H0/mTIFuTaRWRSd18buA0buFZQmNRqJ8Wv2E0KC0kp1zFfwGKlpPipy8?=
 =?iso-8859-1?Q?NKuSh2mo4JbVMH6dlVp+hr9WdEyfkya8IboNLFmTi2rS6G9aFqvPlFRQ9A?=
 =?iso-8859-1?Q?Rt4QZgeH4myRVKtgf2dxO6WVnTgQXGirzbrcbQGuNX6d3/doizd8dV7HBH?=
 =?iso-8859-1?Q?28OhSO7LVgfYLiveTMzeFE8TnnOoKVwiw4UfL9q2wz1FA8vQ7eg2PeHZYp?=
 =?iso-8859-1?Q?lkfClo0zxtWA1btiUNbkr1tBdPdx/CAEeYjT8+hi0HSeTnZxhAuR/lx9QX?=
 =?iso-8859-1?Q?+QyehEDpdXQWi7Vss6ndeMRVJNtyJ1uXhwlr5PHtj/NN2bDJaPD5fptQHG?=
 =?iso-8859-1?Q?xWs/1o8K5zIF+OUwOpUWoi6ioSQdINamqRlSVm7azU2sfTgZ9R0TvWBQCL?=
 =?iso-8859-1?Q?xoxINsc9ANKhu4bSc84Nus/ZfZOETUsQEpB7/IABd90U+E97LakP2zj07G?=
 =?iso-8859-1?Q?drcgMcDwfJ3oOwM8hNl5+rgZmZMq/Y2Oydzv19js0ImjyeZN4NYFvJmQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 445fd2b9-0b91-4b85-d4ac-08de1739ed5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 22:24:29.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtcRAIhtQoKuXEnT3RS4nkHyhDg9Gkt0fIo+e6GvBI8p518hPEqiSdxblIypY+zIzZv7UBe+Wxd7VJfI5g71vpXCoh+jiD2dMdfS2dpYFT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Wed, Oct 29, 2025 at 10:50:57AM +0200, Tapani Pälli wrote:
> Whitelist registers needed for userspace to control autostrip on xe3.
> 
> v2: fix GRAPHICS_VERSION to match xe3 (Matt)
> v3: use GRAPHICS_VERSION_RANGE to match all xe3 (Matt)
> 
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 690bc327a363..7ca360b2c20d 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>  				   RING_FORCE_TO_NONPRIV_RANGE_4))
>  	},
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
> +			 WHITELIST(VFLSKPD,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> +	},
>  };
>  
>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
