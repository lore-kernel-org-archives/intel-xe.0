Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F24C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 23:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A7D10E3C4;
	Thu, 14 Mar 2024 23:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wgu6NzhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736AA10F8B3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 23:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710459823; x=1741995823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u75ly1vuDyaQRklbQkJdk1eajFvuANyvzQTrOXIpaWY=;
 b=Wgu6NzhO9eFS7wP39vPzWLhlimcCy6Mn1/PpTF4LRFXvf780xFdtX17u
 F+MTXdkVpq8wuZlwPebmOa2t/n4ztN8oGJ5tDfZsqWZbzp3NehcR47QvG
 R0g/b3ximv0NSwiY85Syd4Sv2fg/ctPYc7h823r7WP0oZSouHlmzR5MX7
 j7j8U0Au7rFSRI501yaqZ42Cxz3lHbOWKLPNjG9UWBdnGfbrRec4aUH4M
 n+LDLz+XzgAkXVAX9qvsRc0QviRo/jCkeNSzV7tOl4CaG5D5N7GzQijsx
 rBIoo99uLSqiCjbFHy0S3OsnUPIOqyx7PcsGHVaBnxBkNa7mWSiObnCmE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5515534"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5515534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 16:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12375082"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 16:43:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 16:43:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 16:43:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 16:43:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 16:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy0rEDISUtRe228zsGNH40rLgP5Wzwxyyv9I5ZXq7bJM8ldJOdr2RRKxy0Cg5nt5A1jZ+YEyeNlq70B9P1N8xRS4gCGmm5Qr38bKovwSSskED+FqIJYEloT/nRLog9sVD+hvQaRSM6dNdwn4Mk1EOXW+WBXCniBWDTYgD0AJqwIJfULZau9H5qvFTZ6219CHDm/0y3vsbFhXYUtl6qOtGGIW5eVwT8qpMCk2HTm3b3OSCgLNAIYb85til0icyvRcpSNtCcvC2itpogN1ya5Sa0+TSJfP3j3E634oU266KjkGBPKeMjN1Y6WdTsuxTRl3FyCpNNrxlziZMgA12UyFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H02oEkUYoQpE8rqaLyWOR+qj5UroXbh7W8Sbv4ibOXo=;
 b=PtIj2nHHC4Go41LEYFSLWx8s30pMhYNEDajC7N6m+Kp7Y4vLH0AK6JUdanOp2qEsfL1qdTJkA811ouzHcN2GYKdN3Yq8MlTegLwL26pTZla6hMgAucK+kqk/TQEJ9CPEdfxJD1oPo8fQPQLQd1tc7tsWfw5sUkO43GOb9Gu1BVs+rFSpgfrb6ORfCI3N1MXxbBciSNzdYbWC9GoGtbRhI2co+z+ptuqF/J6KigKK8c6cofkgGisNczwrAVsw8ficVThoRmnJuVQBJrulU2C4MuWWYsalecoFQVMqv3XcnKpwRu/IuiWSg7X7DgtV+nbiPF4Bw67IcQ0LjC/BTaIezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 23:43:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 23:43:33 +0000
Date: Thu, 14 Mar 2024 16:43:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for drm/xe:
 Add helper macro to loop each DSS (rev2)
Message-ID: <20240314234331.GI2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240314210735.258553-1-zhanjun.dong@intel.com>
 <171045897396.794417.11121374104807192868@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171045897396.794417.11121374104807192868@8e613ede5ea5>
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7ac358-2aad-4e6a-a8ae-08dc44808fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fPb3g2qw6coyigWfqLP676YLbP9gGltCLMXVKb8V0SD9zH3ohuIA4C5rtvuK/3BycHt/qHXCyE/+7q6gW1H1uRyA4A5aNb7DAbkkbdIYIYdJd6twrrWY/xERFf72Fxlxzypx8fX8fXxTpUsm2sFORkfK6mpwYUnpDZcD0kO7nzbWDOGBpnbMzVdboR66kfzbYQTUEuszOUVQFP0VlF1XF591VNpg4qdPWBmjhbbzlLXBjHbucB51r+XkKwTvBS42UdXWBOmPq3Dp5IvO7q23Xuks0CBo3eZlM1xCDSeL8Yc9G1ipfg9tI2asOBf9mvUkzMxVMC7hl6jr5a0+fqgEjfEU4qV7S93+hUNoeQXJdO3g6Olr7fE/NuVNqN0iBGeRjLBK8sinsvRkabilrhyg3Wk1MVRZ5NZopxPC7H1MY15R3QRTgPyZx7QgSAFG2GTYCUTBOEM/cYKGu0jFCbJhTHZHhGtvfOTjkn++cAz98ezuxDN0VVm+vMXdEElkK1m9h4lPX3gHahgLF8d+tkhsFT7bl5alNIn5yHA2F/eDPgXX3xquK2003VWLc/Dgeo919u0G2T+1cwWZmx/GOj2Rnylz7wQcQSMscgDjkqfPC5Xtq+/YyFL/KL5BJbkNO81D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+BaSW5tiinJy/u2SZkkvpiQpNfhDeA/FJejKcaWeeW/xLtc23GlI9o5YZ21?=
 =?us-ascii?Q?re1Z+B4Qszzur5wXdI9dwnkSnOalrSuODofM7oj8ADT6yThYsHAS05K4kneZ?=
 =?us-ascii?Q?B/eQfYfqKUmw/aFd4l0I3NU3PYMUS/amCSDQkZv/eQAB8W2af/jw2DuMunwZ?=
 =?us-ascii?Q?64JRIv7o8G9JxlYGtUL9rShJuHZ0eatKI60mnXyvrYKjGiiICDP3PBy7CNdX?=
 =?us-ascii?Q?SDZtVyvwW4pYrL2AE5pEP/7qAVA4bKr6SdMDY4TSpiyLR/x8G06woXhIQKNp?=
 =?us-ascii?Q?Vo4Jy2z+cdyP1saiMmpVpXCHQ/72KZnNs6wB0gwqDhYaO1GNxzt+RdOeEZ6W?=
 =?us-ascii?Q?+DEXn74hWqHgLFO3q4heWXAGRps1n8i8y2mQVQcALe7LDCo7MsseSE7YAc+p?=
 =?us-ascii?Q?RB2ZQqaPAggipg7/F5QOZqIEEOPz8+8J6f3QsWN+4S6Qut1k1FasrzWsnriX?=
 =?us-ascii?Q?ZmFnGd7yMXxU9sBVDckCSjBAEYnYQOTsA3dERll2ddMI3qrKP+D5novMikH1?=
 =?us-ascii?Q?xTdxCS8Sv620fPLPPA9z9YrhIVNRugpmfZChbSSxrS/vfu0glZXMnbHJmrcp?=
 =?us-ascii?Q?l9rzI4McvauBfJPay1eyuVhJepyd4PReUm2LWocgvIVWt8YbtGHJygL+6iEt?=
 =?us-ascii?Q?KEPFmYmSsT7rhOr2O0vJln/xibUIX8B6bWPF94mS5z9EjwAZoF8mmWzhFHxk?=
 =?us-ascii?Q?r7fDXRssxzS+6epeMAeQSlKIgVl4OqwTjv0FTxp1o4lzEw4YU1mjZRAzUIKT?=
 =?us-ascii?Q?/FxbkDQiR0j0L00QCsOTM/mCAkAJolKJSMNy0qrC73sU67p1SgzPisFm/0O7?=
 =?us-ascii?Q?sVsK7gSThZZ9nQY9yBeeg3kTdbJ2CDVVycY0SQjmwZ9QT7s0sKDzl545JAS4?=
 =?us-ascii?Q?pCf+8ExEKPNGTRWl1zMLxZQTxVCW7MAH4Yh8RF3RL6lFABoGppgeMzSrH0wi?=
 =?us-ascii?Q?SJMNLZVeM1+CmJYdyUxjiSrG2kLZh6932e51FagZiStPFbxNhVPkjzS3zMwV?=
 =?us-ascii?Q?O+oiOb24q/WILmKjhHfOCnxzCGaJ3deY18cWJj37/WsR8QArYCj+NmBgdDfZ?=
 =?us-ascii?Q?4a3Bvwhf+dkv/gUy08tlsbiAqOS1B3ah1LRk/7yUbA5EjMBGaIE4lDYAVFkR?=
 =?us-ascii?Q?7v+hrhlkBE4XtqmlLL71SECdcgndXXUVWjG2V+NjgmLXmpZI6OOUFKeN9DKP?=
 =?us-ascii?Q?bDm4hMbubdcpqSX6bUI6u3IhA27ruyoaWeu43VLHgi0ppP+2iCqH7Zd88tR9?=
 =?us-ascii?Q?KJxrcWBxv1SmttCSt3nfwO6xuquhCuBIDrEQISs5t3JEI3e1x4qL0FTWHY5M?=
 =?us-ascii?Q?QRg0XAHvT8tSphndJSKTxfHyKyGCGQ9EAPK4EhGgDEI856UVvXFrIK8lOoUN?=
 =?us-ascii?Q?RCPTz2iFe9BGHUWhftzHNrwhUbu5FrF62SBDTfzQKoXXddJuojByLCM0Ogsz?=
 =?us-ascii?Q?hTK9T6Ij8Pf5Zl/uVnGwVi8DOZ3NX9c58XfGb9gIRRTOa3rQwp33BR8pww2J?=
 =?us-ascii?Q?SxqJ18BdWZXjMK4bHvQUbJZ/yOwUYtgzxCBgA09tZAsLPx8LT3EvUyf1LBRQ?=
 =?us-ascii?Q?U+xYYSHttT2zC1vkzqc7oobhQ5bHxjg8LcDIbcdsuXgU7F+3MIl4On5PNjmA?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7ac358-2aad-4e6a-a8ae-08dc44808fbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 23:43:33.8786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC8LicLcJGPbDjKAXQg4Ix60oULiu63L9eCLKrGSBcjRxLSByy+i6LpkTVLbWVZ11x7DXFK2EaWaxdrTIRguggwH0s1gA8RFZZwoHSwQX54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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

On Thu, Mar 14, 2024 at 11:29:33PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add helper macro to loop each DSS (rev2)
> URL   : https://patchwork.freedesktop.org/series/131153/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-944-609a394a29ae2c1af09617064a18f5f068fcdfeb_BAT -> xe-pw-131153v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-944-609a394a29ae2c1af09617064a18f5f068fcdfeb -> xe-pw-131153v2
> 
>   IGT_7766: 08cf1b2fa6b2f422f417ea74f41b12b93e91156f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-944-609a394a29ae2c1af09617064a18f5f068fcdfeb: 609a394a29ae2c1af09617064a18f5f068fcdfeb
>   xe-pw-131153v2: 131153v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131153v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
