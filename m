Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E9C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEFC10E138;
	Wed, 22 May 2024 16:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALDzZvQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687CC10E1BB
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716395357; x=1747931357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Au+6vih4WTlwoZnrMA+Va5HJCcTZTouCh8bWRZbpDr0=;
 b=ALDzZvQlXWYA2R54y0NPcpqCb3U4w7qou30L6OOuNGfXpF80wJmLvGQv
 m6ACetBr3PpngLU3yYEY2avrNWHbiCfCwQlNo12VE3qQ2/pDusjO4NnuV
 +mqV8bJmK5M+4XxK+hIJq02W4J3hM09uO7i7GeOTCd5cUENqKfnbgQwks
 33uADl6mouo4xzDwYckFhxlQjHABraSJIz/9Jkdj73EjP0Fv5f6pcN11+
 r6WYx2ais4wNOivQAFrTyxcCrfz7QfD4dCBtPuJHwMCd7Q3RsfLHoyjLL
 QfZCtRRGBXmwZppa/rnuwQFKAx5lDtSLgnVQR7ARXUr1G/sfi2RWUux/K w==;
X-CSE-ConnectionGUID: O4ASD4eLQsaySlr8td3Dnw==
X-CSE-MsgGUID: 6CkiR8o/SQeOSMzjshytYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12445377"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12445377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:29:17 -0700
X-CSE-ConnectionGUID: LQLV0y4rRFq4Z4TiFWuf9w==
X-CSE-MsgGUID: RLgXTc8PTFiMJQdEKmZIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33924168"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:29:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:29:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:29:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRi2Q3TfFg/j8P9iEyJLd5zsIaHzxSJ3iGiqEhwcM4iMfON1MI6GXQc3I2j+5yaEvkWD5gbQd3JEYBN1vdMV6OqVRg5CFZeTlZ05BnpfYJBpf8BQg4xPGKwIvVw4fKmvHZ6Y4UXG5Ng91PFN1es59qIe4/wOulMQ9sdQYBIiMpCTT0sSjRhj07D8BGMVVaJKJspg94jaDK063/4hS9RbCLs/q/h1xgdt/xZZM76lOjA7XFWvb8JNnpm/5yTrMrtSHtJawebYBihHR+sps5OaOSp/40IGUxO5cWt2aBKl+Usy7q20GHFsHDasuOvrCj1xFFKgIjOVIMwpkT77j74/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoA7N9CSUof/OtWmLc7itySnElqA+DmqBiaYnBvusFY=;
 b=HsXzPRyyo+GSpjhHaYqrlomEms2P95bljq6yuUcELSWPtZr+1RdNsUHFy9+4nm+ttshsBGk9ExwsOyPToQfsmGZ94my9WfxPqkyp8MwowYBzu3Dd+TZpaxzEyi9L9xO2Dg5m0iClQYZ37UNl7f5fdVJnu92sNq1Z9HbiOdOkIc9GlQoGTWBGp1L8aYu3qDAmQYqJNJg4DN/mRpEGOmpLZpxb3KCuagTB5etMekvjJoEJFfeTHL5YRyMnsOvBleSljkOxzSyEsNy5+oiP2ga9qR7nsu/xk2weXmhXTXRab4ezlrAeUyxz6H6mRHK04FhFQZqt7OQcPNbXnsivEXWOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Wed, 22 May
 2024 16:29:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:29:13 +0000
Date: Wed, 22 May 2024 12:29:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Drop undesired prefix from the platform name
Message-ID: <Zk4dVrOHnqiNRqrr@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
 <20240521142257.756-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521142257.756-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 78614833-0ce7-453b-6899-08dc7a7c5117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QAowh5RZlGcRHGntOIgAHOZwFBrrLuwcEofYGyBIGya+8rKGDRoL4+IjrJ/s?=
 =?us-ascii?Q?kigkNP7iHevqgchr8PDsb5J6NkWm/Mz+EXfWhNi7+BdLVC2XK0Yx0QzJ8wEG?=
 =?us-ascii?Q?NqyFpFUkIC+eCgAuXhLxpACZBQWA840gk/+uhdfinjyAT0BalnSt1wqTQ7NS?=
 =?us-ascii?Q?VE0EUHqgLRRrIYB/7JJrASkXzc888KNe7QHiwbET0Eq4x2YAa9ayHLyC2Tuw?=
 =?us-ascii?Q?J86RVloldKiNYn0ZEW6V6kvqYRGrQ20N5M6S9OHR7G/H50JbUrHy0y03n/Ay?=
 =?us-ascii?Q?aJQd9XMbDMDliEGuHFpOs3DDjzJRZhPZ0ZqF8p83Yof2g4ipTO/4gg6u9sss?=
 =?us-ascii?Q?ju31AjQYr5vshcFRYxZd/vEaNUpAOX1t9lnI/h8JSirtr4t5KR7X85ZCm2cX?=
 =?us-ascii?Q?J05IX/bTJFwjRJH9awtZuMsJque9r5eUsBqRZQJT3AO9w2Obx9hRzYujo8Jq?=
 =?us-ascii?Q?xg5CXDeL+XHb25NKFgSUrg6b1x8Wa75MQIPNyJQ3rvwPRPPmq7utlKfNaWAk?=
 =?us-ascii?Q?cGy5VAIksfR9NANFutwo/6ilaCPjvcoayce94Qcx84tSmU5z3idVJdQAs3KH?=
 =?us-ascii?Q?KcuEvFFIvRAPt12rocISoQYfHqXaVXha2A6lMRpQq+bpvZ/V0+ctkRs1TUJ4?=
 =?us-ascii?Q?hnd2bowpATp+28cUDwDTHqUaUeDFvUUBuKyBfrTLHxj52HL5SbDLQYXJS4KL?=
 =?us-ascii?Q?8nua+djqM4U62xxN+BKEbgtawj6tmsrDF2jLYY/uLe7+sNFnWvNXO5HNA7ss?=
 =?us-ascii?Q?04vdZ+BWIw0eKjVhiCjPLMQZU/z6tqTqPPm6OCFbf+rYkvh4OQfHowoH5oJ7?=
 =?us-ascii?Q?qdD7ozVswMBnjIXWzTpH/SDAsHdB8ktMuOpN/ro2CX82XAA5qIbrM2sJkz5G?=
 =?us-ascii?Q?Q4n8GBAwejDRSa2doZrE4FW5j0DtGFL4ykid7Oj5I7w8dvhWDHkesKO7VxI2?=
 =?us-ascii?Q?UelfKvQ4HW182OT5A6VXDqAM7sGZbgM6Mwco/fuSuK2ultLiR4hp7d/MNQUw?=
 =?us-ascii?Q?PbfZbGJA93x+DapxhnvJLZS4GYkphbRsuY6bqrVaadWxygpELb5FL/vuSxsb?=
 =?us-ascii?Q?BJgxdbPTVp5jOWOzglVxQLRxbqKuCY03fgIpMNEc1A8mLimxzlcw3WJMusSG?=
 =?us-ascii?Q?YMYRU3t1YqHmp8PMulZ6iVPfqN6Kin8NkBk3ng8WVNQool9nlJFLM4c1jAug?=
 =?us-ascii?Q?cGxopUQp4u4G7kwvI/Rwz/Q4/OCVYJSLwUDsdI3BIDxJTnPln8drHzGdZY7y?=
 =?us-ascii?Q?K0Q0dOz0wELIDM3+11gsjfrG6qw+y+pr7/z0o9VGrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncM1aYiiEpvJKV7XY8kFSCbfZhBZJiUrZ7usehwqxwO83PE4jCHdXbpMf9r+?=
 =?us-ascii?Q?ds+Z4K0KKSkPFSK+jc1/LGty3lEtuNmJe4DpSTmfHEHGaNJdKk9yBgxct0if?=
 =?us-ascii?Q?aqZdWmSI3ux2ssOAEFonv4owXM6VrUPrSb+L4RE+nC9QL64vdL3DWF7Qm9y1?=
 =?us-ascii?Q?cGdaRabLKTMx8XJlUEjx86GFx3HyZQRQWc+AuFqehuBRDnGSmmxzRfC0iuJN?=
 =?us-ascii?Q?FoqqtgYVycBc+a4x8TF9mqs9rJpC3lOh9XJrnZsyEVsnEvzGloHTZLWWSUMl?=
 =?us-ascii?Q?jrs7Cdtc3J5WZmTfoWfOoUXfcSGQ67brm28/xBjoVQ1ng8G9kRQ0HaFKmyIy?=
 =?us-ascii?Q?WxfCucrAPalUa6uP5XbMNVJd3ZuM0DZAwT96AKiu3nKpsNrVPCYIgg2/GbX/?=
 =?us-ascii?Q?6+hHJWd8gGnAa3xWRioBd395yTJw3YxrAIyjizgdh7UZOULFx6H9cS23mR4b?=
 =?us-ascii?Q?NjbhrDXEJzz2FU0nbQ9xDBwvdchSyBWQZiT/Va4uR42YOqE1+6wd6Aw9w9RG?=
 =?us-ascii?Q?qEfZ4lrZmV+gROlu8fAB83ewqeJDCU9ek4Hqp2dFbvED25deSEOaa++Vx8R8?=
 =?us-ascii?Q?tgDeyMWVdfHNY9+mVncuvSWgQk/CBRqVrAbacfWa1iNwCtPjIowymd4uZBl8?=
 =?us-ascii?Q?pFcm2e66oImr/gkGL27JLkhYtKj6Euu34vZXP1Dh+sP99rPwEW4VwfhB7SUk?=
 =?us-ascii?Q?myYQ1G5mAn18yxXWumlG9bD6PjmhdWDEvjdjxsIRC/FSUS1AgLa2o7bO1+tL?=
 =?us-ascii?Q?iw4zKI7z5Z1SoLTperm7/9bGc1qYDU4e1zwu0lNPGLfPWHATry0EAiXaS4od?=
 =?us-ascii?Q?x8tegTH08/wZCmsLTOTR8dHwUCJK1cHa2DlDGljdVRg+vcCrxV1vROXht84a?=
 =?us-ascii?Q?N/tvTBH9yGhhF1aR5v0esgB4AKqiBI43trY4F+ZqWSiHsQCDbXOFGteWV7Hc?=
 =?us-ascii?Q?1BF0Pr/IiEuFdBDwMLMK+TU3+LGk4k0EU+CTvuW0Mx6jLvaH9tGOahv4xQC6?=
 =?us-ascii?Q?kMJU4JPEXGAsDfqebLFhmx6VLCtbWpiaX/Kb9h0Eo1NxYC4K3lSLYjV4i8gI?=
 =?us-ascii?Q?05z2iJ4kNDzyf8bB0j6YvIKJSnH3oAONyAddYTQSwAaEz61XIEOY17W0AoFT?=
 =?us-ascii?Q?LRwLOyLmmXN9nM6d4GxDCl+umFq3/jHLT5BV7az1TFXB7dSMLfcNfoxT/utN?=
 =?us-ascii?Q?Mcx0u7iMQuaO/ZC6b8AeWBMlWfIhzIGvDkxKYcNUZCmgNzEyeP+TajkmduRp?=
 =?us-ascii?Q?N6OUNMZnHasmkW1XBlhgWh6ASg+/zJrYVgRg3O8cPvOfOLEa+nhqI8NzRMJD?=
 =?us-ascii?Q?2w08dSvXg44M/pTg58vIY52Sqvw71jKbTBYtJbP30MyzzN0oFtIlkHrOSrvf?=
 =?us-ascii?Q?U0myRAaJOMpK1XHIWBGfvi2Xom3/IKXQYg4bio1+ahmWs63q7ZLjaju54dc/?=
 =?us-ascii?Q?RP1g5cekH1SYtIBgUCtRTAMiKiLA/e2GENriHBdmFJqWbaGReu4fB7av5mR0?=
 =?us-ascii?Q?ouV0Xz7YbkqNW2y+6IFtKb62rJ3d7ppMUUr0xhqPKpAD2sRhUBVBwQ0yplzg?=
 =?us-ascii?Q?hwm+RCY6TLHisv3KjUNzSYmv+7fViSJ2qZjjJMnhqll6Ipw6ZLE3z5U547jO?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78614833-0ce7-453b-6899-08dc7a7c5117
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:29:13.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDbWZdJjBEjdJwxTU1zTlsSecnL9+EM1XlAFn3JMTPFLplT4KVJHca+yLjTVs2s+DOowMoJ9d2JNR8sb+VbSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, May 21, 2024 at 04:22:56PM +0200, Michal Wajdeczko wrote:
> We don't have to use exact names of the enumerators as the
> potentially user-facing platform names. When constructing
> platform descriptor fields, use the unique platform tag and
> add the XE_ prefix only to the generated enum field.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b30fe4849038..34ff997439f0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -75,7 +75,7 @@ __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
>  #define PLATFORM(x)		\
> -	.platform = (x),	\
> +	.platform = XE_##x,	\
>  	.platform_name = #x
>  
>  #define NOP(x)	x
> @@ -222,7 +222,7 @@ static const struct xe_media_desc media_xe2 = {
>  static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> -	PLATFORM(XE_TIGERLAKE),
> +	PLATFORM(TIGERLAKE),
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -231,7 +231,7 @@ static const struct xe_device_desc tgl_desc = {
>  static const struct xe_device_desc rkl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> -	PLATFORM(XE_ROCKETLAKE),
> +	PLATFORM(ROCKETLAKE),
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -242,7 +242,7 @@ static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
>  static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> -	PLATFORM(XE_ALDERLAKE_S),
> +	PLATFORM(ALDERLAKE_S),
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -257,7 +257,7 @@ static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
>  static const struct xe_device_desc adl_p_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> -	PLATFORM(XE_ALDERLAKE_P),
> +	PLATFORM(ALDERLAKE_P),
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -270,7 +270,7 @@ static const struct xe_device_desc adl_p_desc = {
>  static const struct xe_device_desc adl_n_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> -	PLATFORM(XE_ALDERLAKE_N),
> +	PLATFORM(ALDERLAKE_N),
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -283,7 +283,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.graphics = &graphics_xelpp,
>  	.media = &media_xem,
>  	DGFX_FEATURES,
> -	PLATFORM(XE_DG1),
> +	PLATFORM(DG1),
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> @@ -295,7 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
>  
>  #define DG2_FEATURES \
>  	DGFX_FEATURES, \
> -	PLATFORM(XE_DG2), \
> +	PLATFORM(DG2), \
>  	.has_heci_gscfi = 1, \
>  	.subplatforms = (const struct xe_subplatform_desc[]) { \
>  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
> @@ -325,7 +325,7 @@ static const struct xe_device_desc dg2_desc = {
>  static const struct xe_device_desc pvc_desc = {
>  	.graphics = &graphics_xehpc,
>  	DGFX_FEATURES,
> -	PLATFORM(XE_PVC),
> +	PLATFORM(PVC),
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> @@ -334,19 +334,19 @@ static const struct xe_device_desc pvc_desc = {
>  static const struct xe_device_desc mtl_desc = {
>  	/* .graphics and .media determined via GMD_ID */
>  	.require_force_probe = true,
> -	PLATFORM(XE_METEORLAKE),
> +	PLATFORM(METEORLAKE),
>  	.has_display = true,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
> -	PLATFORM(XE_LUNARLAKE),
> +	PLATFORM(LUNARLAKE),
>  	.has_display = true,
>  	.require_force_probe = true,
>  };
>  
>  static const struct xe_device_desc bmg_desc __maybe_unused = {
>  	DGFX_FEATURES,
> -	PLATFORM(XE_BATTLEMAGE),
> +	PLATFORM(BATTLEMAGE),
>  	.has_display = true,
>  	.require_force_probe = true,
>  };
> -- 
> 2.43.0
> 
