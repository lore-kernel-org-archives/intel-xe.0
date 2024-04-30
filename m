Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A2C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 13:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24D110FB7D;
	Tue, 30 Apr 2024 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULLJr4me";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8689F10FB7D
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714484602; x=1746020602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zwv32cr9nkDZf0CdbAiqHoMOFKn0w8c3BtSD3Eh1oqk=;
 b=ULLJr4meOvfk5qOhSMpyYpS3CdtQelIF4mD1R5Ic/26pJrcybn2kW31j
 KqiTqVc18JYHzM2yWrkLyxPurOKauDz829d5m9jp60Xq6YjZjzM7orFXm
 5liBVdOwpr60nLXuk1eE25K6xqRCaDawMGU8B2Fun5Mfp1B6YhpYbOWie
 eJI0t3+78JUO7Oyj02IidcQbML3pPCbMXyp3Qa8pCpeS7odZqzSBIM8hO
 wCM2dcmnPGrlFrm3Brajs08X7uytqWJG6eYP3sO6D+IoZ/pXj1ab5EtgH
 6tDJE+s2iOCmwZNq7zIU40BZFyraBBFZxeXLMFv+a/TIm9V2oqYrjP7AJ g==;
X-CSE-ConnectionGUID: 6RzBaqJgRX6j8OfRfV+KbQ==
X-CSE-MsgGUID: vkbNGXJ0SzSE67dGAlVT4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10120468"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10120468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:43:21 -0700
X-CSE-ConnectionGUID: 2stqaTRPQhutRJGt4+nh/w==
X-CSE-MsgGUID: zDAx9WJWSc2j7m0Pqx/SXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="49674284"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 06:43:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:43:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:43:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 06:43:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 06:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQetR8aadep3RzSTBTG7YDe3IJQtFdyZBp4pSVr4BjHWA5yjXoLN2BEeLJRF96fTqQVB/5Hwa1jY15ha4rARgt4POELetoyYf4Cmow5TkqmV6LmD0gGolm8TgA0D9y/5iKwW6gRpmkH0gA/11SIqFRehDrOqcwgMuHc75RLdE2eNa7RUCqhSCT7wF96h5sND4+O+d2ddOAa1C2INw51JKjl6bPkMPx2tpbhJCizB6JPPao2TFUsB609ftrM+hKw+k9xg5Z3vi6D6oskyYMG/qhfCqeAd2SLur4cQExe6+VkxT5bC05eVbg5qZvrJACSKuQRAiJFh8Mmr4kNveai+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULJfG+9Y85okr66k2Mf10xaXmFkQ9hmKcidpivdgAbU=;
 b=m1gVRdZ+xL0fxSuJovlLKUAR08UsYYJ3KBvBTYTfOffsoar3wpbL4G30Eg93zMeZGJ3yvIr3k70bZm3sfl51W76FTcQXUMxVr8dbrwBQougO5bD/zbnBaodnRLCK+0XI3xLlQ+hAiHO8zX0GUz2wqpksHK25Lc9KqShq6+ZV/7xhLrRGb0TBBmfkiC/Zw/wPw39HxoMnsATGGc0anbslcc45weoJuaR0GOUEo/cv+HYNmLbnyBjy6glNytxX570OhMgGprHPbUHHXjYLmqRNigYlbRjVaDn8PKW3JZ7DZ0LW6hrLYGYkfgv5+Dv1Pa/h8Gd8HVwMZCLw462gonVaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6079.namprd11.prod.outlook.com (2603:10b6:8:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 13:43:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:43:18 +0000
Date: Tue, 30 Apr 2024 08:43:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/gt: Fix assert in L3 bank mask generation
Message-ID: <z3yyivof7ofyqa2ckth4zd7pxlbxrt32uraewkkxyrunt5cakt@ttb2su5634yw>
References: <20240430114045.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430114045.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:303:83::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: e915ea92-2078-4531-3bab-08dc691b7e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wpj+XHC7CqWsz0sB3JL4lGAi+1i7JGy75HFNKYrdDM1BHN69+Q9hqu0vK/Nf?=
 =?us-ascii?Q?otvm2QpifNWNzJUVj9W0OQjVviuy8Ngp2jWxDL/XacgoB3+BBn4O+S7wGU3h?=
 =?us-ascii?Q?ZqUquJNAouE2l3X9Ikewuu5ZUx2zAEysgfAtzkG/qh8oC0pDDqKeyljbN0Ve?=
 =?us-ascii?Q?AcWiZiJ7NKmZ3bPYoeKJaiRN+o7FUKUJBjyNTOsa2nEt202A0ord9rFXf+dm?=
 =?us-ascii?Q?sI8lr7qXaUFoxUgrvLO3azoK/it3WvpghN+PqK9oj5eSd6EQULG2lFpVtKC0?=
 =?us-ascii?Q?CD6pcM4D80rr6KSlrlZ8AWlT5sBkKpKFsZiGTh4y91V6PG386/z48KV0/Mmw?=
 =?us-ascii?Q?UPwONUmAwYcC98p5pDn4LgULH2xfIauv9n5fUP9WeXwoU7MhjGbwfvFQ5rtW?=
 =?us-ascii?Q?gu6KoX4PHDg+mOJWm6qxbpFxJFW2YYypXi4wPnEVAwNUV5ccgB5YmUQ5joSX?=
 =?us-ascii?Q?C+ORPHXvuNi0+lzBbxkA2o1j5aVxU9vVbay/rAkGo2ZdOhAXPPnp+coBwNQT?=
 =?us-ascii?Q?hSduF4DTDHPCJXWpCEp0VAht/YIrl1cbxQv2YBxBdlW9pEeSG1eaQP5rbPhe?=
 =?us-ascii?Q?OC09sNxscmKpT8zldyaOWgT6ab9hzH5itI0xqYXMf1t7y5iqbCfk7JFpG24X?=
 =?us-ascii?Q?WMP8nnJ1XDSj3z4xN5dYE3+Xf8r/kica7Q2waE66Hs4MTN21Hj6RztzTOWmr?=
 =?us-ascii?Q?KWL59i3KFlusNIL6lBbzs3jhqL2BZx9oDYndlpVM79uMSY7r+8fuBeeJQsgM?=
 =?us-ascii?Q?DbAV0I5XC4q1JogwmCOvIKq2X9euM+i44+QYqCCOqdn9gNO81MQx8w7mgcoy?=
 =?us-ascii?Q?3EARKVUExusEpJb+JPeC1kdxyb0otGaALX4lBTvthQ/xET3gGRx+4R1WjTEd?=
 =?us-ascii?Q?wrUGxDRNYDoiOjn/nYDIbfiKR6l5HG846GeCuOLcTwRX0krEfwAIydZJIMjV?=
 =?us-ascii?Q?v1B+5UDvxe2YUpYbbK+Uop4BqC+V3EaH4PhvW/f2aOaPTpnALBtcqYtP11Ed?=
 =?us-ascii?Q?W6g/hP0pmJpO17efFV8zf7jibqZRf1NuX+09VdxB4U/uQPsx9JBtu371q03i?=
 =?us-ascii?Q?fKcVrFYtBZYWGCnwOnjNGyT5OirSLgxxk2X5hu+S8Zb3TFNzi09oa6h9+n0d?=
 =?us-ascii?Q?M3KP40vMhh9BpA28DtjUQowTTnRNEluEwHPJ0TNphe62i50KeOsbXrP5Bhlm?=
 =?us-ascii?Q?ch20e7LOcojCPAX71qitK7IOQ1ZMwUcwyvJR1gWQMOPxP6k8+6pMndCpKC4M?=
 =?us-ascii?Q?0NTDNaWHs4WhiknKbEab1HX3NXWbWWl8uoJICfmf2Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pt1Pfy8lUsDZti4yZYannC7LgfmSZteWQGahguydkc98xjzMeA3j1zucEcDl?=
 =?us-ascii?Q?FyZ/evqp5/702Dz8fjJXslU7SlHTAtMYBuPy9gPLjLZDkwRvyj6B4gJymDrF?=
 =?us-ascii?Q?bsKzLx1e5NNR1rKqhZKh75aWLwXNz3TbqhU8KzYMwmn9kK5cqPlt2NxSxR+p?=
 =?us-ascii?Q?FevDejlSHCqUaCil6DNsLGcxKAf/pFtuVpQrPVPwWGucanUpBxspKPToCd6h?=
 =?us-ascii?Q?gaQjxPUwdgFHNYM0JWV+hdfsYRTv5p0b30GinLSpJwZJVAASsdMd1KOkvAD5?=
 =?us-ascii?Q?GHWd3PvdwlSjmny49LeBMJ69QdxMpw33wBsKWDKnNPaVakfjmtvnqLm2Dlqj?=
 =?us-ascii?Q?+s1ySa/WDVEFNxAikmXAfoh9rMmkyWBEg+FDD638dGyCjvKHUKanNtb0cC77?=
 =?us-ascii?Q?LPMSNB+l2+BRf/96LO2gjBFcp/ecUt5tOBbdiMeDtnysdt4rq5OPdCjMU9Ro?=
 =?us-ascii?Q?zvS1a/s/pAGJYLbxz4tw0PuwLa3xhBPATWElNdDeZTHpB24hPbZvRnIUtxtI?=
 =?us-ascii?Q?isJSb2LkKeko/D//bElxrNtcANyehrMSHNKvnfmG2Nhm7LbYC1rhxgD2InOe?=
 =?us-ascii?Q?JNlKWON70qsWqWyHrzMZhKdjYCNMgfjoUq4Pm6sco6to8dWllO5p+zyIXluF?=
 =?us-ascii?Q?Havu48Ry+E6uSyT2mVvATnVEcQ2Ia2iAz5FS3u2otMHbMZ3hXnl5JCmFpJMn?=
 =?us-ascii?Q?1UUkAz/+hxcUBb9HeH4q7uzaytSJ7S1iHSGx0YCGwNMkTOjJrrek1FbNN//n?=
 =?us-ascii?Q?YSVDsy1/Vi67urwY0lL7fpDiZpQFQN8P2Pj6EQkGn6oLpXeILwUJAhDNB2Rm?=
 =?us-ascii?Q?dcm9t6Vn+i+uo6nJL/InzV9xYD5uwEmSxnRAuRYFjjGBv1kIert0tlujxXim?=
 =?us-ascii?Q?KOSoOhN4TwvrHE02evN5pooIiMPLxjahpZQEDShRsMhqz+ro9iV4Ag+BDG3/?=
 =?us-ascii?Q?GCcSKE2EZHhX+MILiyVr8eISfMfcAA2E3BvBfC6YGYGICbO9TKUZthZmZ5rn?=
 =?us-ascii?Q?VnBMR9zqjEeW+5n78e9jA9SwraJxuoWDNctFH1gpB4Ffu2XvDF0C/koz83yH?=
 =?us-ascii?Q?eIeEKbMFX3AHfu3lFYaoclrbRK9DwkKujVt7pj4Rd5aeRj0AkDeR9DoNVKxH?=
 =?us-ascii?Q?uc+505R6CsqKcKXqsBhPuwP1rOiOqxd7vevwK/b0CxcPt259PNAp9oHYuQVU?=
 =?us-ascii?Q?IfoSPkHqSXLBXKw/DxW2oWwrp7O3tUw+abDaQEdiYv3qoX/on7lD8yhqsolz?=
 =?us-ascii?Q?gpZ94GVVcvw7ZGnr9DsU86mJIRbbV8nj5IMDUt1mAdjkB7AgQ29pIDZEwPq4?=
 =?us-ascii?Q?Yez51fW4XNBtNPo8bok3eEzxLTpptD0D+acv/cv6fgl25ArQvpctH4+4AcHF?=
 =?us-ascii?Q?1g+LEn/TRGMdFSvxJA/e9cmRil3LN6eJkbNTM3xCGgkVGU39PvRlMx+odZqz?=
 =?us-ascii?Q?i4yRAaqqO0fe7GmXUPU9EaSSdLM3gfJvkGWjarAje5Ol3nRf/8BeoH4ISS29?=
 =?us-ascii?Q?7glQRCvi0/qVVJ+oxRqAFrJJzvj/MDTQbUfwttQCCTTEprK3EQoVdpxha0QF?=
 =?us-ascii?Q?+/JBU92B1oa+B2iuaW3MnMCCahuNNjfPTTNrx1pyKo1ytuEDxawKdxdGTyCB?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e915ea92-2078-4531-3bab-08dc691b7e1a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 13:43:18.2778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmFLHd9CZ4ZZtpx7r/vSVOPbrsTD19nQHDY6QRhLmC7V58KqrUVytCeiTRc5sZ2K2doN7Tvm2LkvYDWmY6mMkF232h9YnSct674575Y4Tjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6079
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

On Tue, Apr 30, 2024 at 11:40:45AM GMT, Francois Dugast wrote:
>What needs to be asserted is that the pattern fits in the number
>of bits provided by the user in patternbits, otherwise it would
>be truncated when replicated according to the mask, which is
>likely not the intended use of this function.
>The pattern argument is a bitmap so use find_last_bit() instead
>of fls(). The bit position starts at index 0 so remove "or equal"
>from the comparison, and XE_MAX_L3_BANK_MASK_BITS would be the
>returned value if the pattern is 0.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index af841d801a8f..efe9e5d6fd52 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -107,8 +107,11 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
> 			 unsigned long mask)
> {
> 	unsigned long bit;
>+	unsigned long last_bit = find_last_bit(pattern,
>+					       XE_MAX_L3_BANK_MASK_BITS);
>
>-	xe_assert(xe, fls(mask) <= patternbits);
>+	xe_assert(xe, last_bit < patternbits ||
>+		  last_bit == XE_MAX_L3_BANK_MASK_BITS);

then if xe_assert() compiles to nothing we may be left with "unused
last_bit" variable" :(.  I think it would be simpler if pattern was
unsigned long long as apparently it would be sufficient for our needs
and we could simply do

	xe_assert(xe, pattern <= GENMASK_ULL(patternbits, 0));

As for XE_MAX_L3_BANK_MASK_BITS, the assert here doesn't seem sufficient
as you want to check if the final result doesn't overflow the array.


Wihout changing the pattern type, I think what we want is:

	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits);
	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);


Lucas De Marchi

> 	for_each_set_bit(bit, &mask, 32) {
> 		xe_l3_bank_mask_t shifted_pattern = {};
>
>-- 
>2.34.1
>
