Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F75CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825010E831;
	Tue, 16 Jun 2026 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byeYVRWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0399710E831
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781639665; x=1813175665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PGeC0Rkr82CmV0YVnBwPktSfRLZAmeuyfO9Ffnhp6aE=;
 b=byeYVRWPOU8HIUC7OK1UjIl4zU9pALmHFJK0peO2BwC1e3Y/QTYoNuny
 VWVAzVSj+kIF68wQyUI58aXs+7OOllUV+C7dyCQneA5iof6vIfoAYMRPN
 0K0Gr58MOEZrJecsd3o/wcjZcMw1fC/uB7gFQfY+0YGE3h+IrCEH1FggD
 OdptNzstnHhaFx4ZPZ28LtkVuDlojovqkj/9g95YFKD2cT0jyyrxttLtn
 4w8EJ1uoCQzD8PkncvXowlClbxUsSFSJTqfviBGmO02wBCaV7jk048Txz
 P8ozjV8TKP9vGfMylAb2AsrytA2Da/PJHdKXRoxX/v7P1hUJ9f4Tu1OnM w==;
X-CSE-ConnectionGUID: VtnSlotjQ8mBoM1peNnTUA==
X-CSE-MsgGUID: VRmKXKYiQVKhQ0WXixjhaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82403812"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82403812"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:54:25 -0700
X-CSE-ConnectionGUID: 7vYByuokQe6N1II2FL0PEw==
X-CSE-MsgGUID: f8PuwA9oRKiTW87cJEs1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246979364"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:54:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:54:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:54:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtI3PlcFHJhyRWqmnTtvCdiGScmHo0Ah9EWxFWor3P3SBkY0+GRDJUo4TI9hJaRZwyDi0F+tFV+zUJ1hE1R+CUdPamYJj2i5Xkf9xQnO7zkDiuPwMp+kBOSyVIo3ooH4TAgJs4P/T+DSupkQ6L8VvU7PaySKahxtXRKwpb+jUNoGLmrPmPtBsYrJY9+/+mLNYKO4kv4ldEBxlFL6S+NHUvniZi2/cUCIi21b8dh9khGUNPgkH2Y3sck8G8WSX6hrR/FnrlN4cTnjK6NgLLp+cxk3o/EPQHEsrGDIOzLVz+Fzylw4NfD5qoDkDqzkPe3V0tka0vdS2VCnSJPBCktEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuos/MXi8EXJTBUj0b+5jV17ReQq/innNDtZRjQfGCY=;
 b=CkhpgFBa874UrBT/Qnb6qAqzUSoYN/1V7zrE+MKvrt0CEkxF7+8X5Zh7ye6vWeN60wh+nc5yVQhVQTixWTh2CnRwjVi7n+k2EY6q1aGMHM5JgUb+JgGdJG10lDpzRBla6w36bDk/PRz7AlcLZmapYNKNLtlmoYbmq3vC84o90cHc/dfN1Iy8SX4ai77GcjZKzAXomfzKA4/LhoBOjpiGzPHBu9lr4wcQNHSPshfvNzl0r3ZSs0ICmOdDWbu1CZP96yFQ5eaxSFWoi/QNXSa4g4LODnQg3t3CxlcFhw3DXmThONPp2hJfar5wAiO2OyS6IzoN0OzJg2vGOKEFnsj1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:54:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:54:19 +0000
Date: Tue, 16 Jun 2026 12:54:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, Violet Monti
 <violet.monti@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Move engines' LRC programming RTP table off
 the stack
Message-ID: <20260616195417.GM6214@mdroper-desk1.amr.corp.intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
 <20260616-rtp_with_dynamic_vals-v1-3-f2b47bea9dd3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-3-f2b47bea9dd3@intel.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b1bc9b-dadf-42f9-cd40-08decbe10e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|11063799006|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 2QjiVVYWtFpeEtUR4mrLIRkcEugAedXmTgGMp7rnaI8zqRJAK4c+peRpYH+MMxExQAubrRviNEsytgvFeorIPMNFonl6l34m8n7zsihN1ZGS4/9LQV3YcWZLxThu5TFbFP6TvaFIhUVGNlaSwSKtGi5LdNEndDh09VW/kroJmC31aAz4d8wrWeo5ngxzpiQLULj/Sn0DUnYGShumZWgY66DqOXuKlGCygdAftiGklXa538o2lxZlopoLRXy9jY05m7FtB4SbtBJ/Q9uVkXPZUjLhQ8+/sWCYLN7meuFqdjb/ZbjFy9ZotEO/LKllSwU5EkQIkIyyyZ2Ja8k4ShqiMjvJ/Pn1WWsNTbCL05tex541Ugy+EGt6oIvZ4JAveGfSlndQVvU7IC0BJWWUlOmc43drbrPOFwOXgx0rZBJt7VQ43xzu3qWWOzWfsY61yM13LdE98zeGsKfxdEJ8NFAhzE3WBfDIv2QQALHMUpBDkUeTkkQ4Ytal3e1Co0roj6PcBW9HqLgDV/lkADbBYPolLpguiOfwO17bOlSYim3kBvbfeDjCS2gXNVxHOG5MrEzyl/+KLXEv4NLimZvoyj5vvDzfKc9YFETQOW+uLlogkzQ+Xc2baHMvT+l9kFXCV7dBqoKbHlF18pRU9SZt/MkgYV71EbRG9YEqZEQpcnVWLGH5HR+CKOVUHkRPkcRooVIu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(3023799007)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yf90S6XLfciYWBDxkaTTwsXYq+H6NVA2fJUg/lNbZKU4P9N3oWbatggdPpoE?=
 =?us-ascii?Q?D+Ig0admVs9iCmnjcHy1K///P27QGCx7vU4aWjYX9rJNW6JplfdiwOwdnvWe?=
 =?us-ascii?Q?pid8vZKZ6WR25UFD6bs6ylN+sKlET9HMKLuITOiJkCh/6ZSUmTMVtXna+yBg?=
 =?us-ascii?Q?p5b3Ie+iyVtNVerDGKEleUIC4gDVG2PR/95SEvxzxVVFxIIfYTMLPCsyney4?=
 =?us-ascii?Q?j0aMNqc+Ps6FrzDvZSx5970sDQrIwxT93yCu5YZIpPHcu2Iq3CxxGeXuMCFL?=
 =?us-ascii?Q?kAf+0GxV5A0I+z6cQgPUCGy3ee2w7BNJ7W5S2sQh8aOsMtlvbxtU945aBg6D?=
 =?us-ascii?Q?ocrrZN9XjApVREyU/KHDILGKOgDrxIn3jBeVOWfOcPBbGJ6oPJWVvlH+H+zr?=
 =?us-ascii?Q?XaBOZLUV1/MHI2G1SEwpxLkYZvHn6Du/CZ65qkCurnaePkossXHoAbRI/Kvr?=
 =?us-ascii?Q?AYeovgDnMk647eMEEGr7e5cNMCTs3KnCAL97qE+rPqhbXWff7eLOY0lI6YWG?=
 =?us-ascii?Q?7pZ62AQ2BDDoPCCQi0DGLDT135h4bO6e4nbMswPt78yh4zRZbSi6mlUFMVNB?=
 =?us-ascii?Q?xGKvxaE9potS39Codl0eU6SrIsJs6izvT0Y3V77ilUNnyUzotlUlYw7sm3w0?=
 =?us-ascii?Q?5FAC018MnDRn8XXywgUJJ32avyjAcdFbTAFMH85DVC7raxNaLrseIJE0By5w?=
 =?us-ascii?Q?XX9ByeLnWT2RPpMHOE3ACZ/rc6aqtiUCkaq5OqpWVc/AhJ5CKQdQSxpEq+9s?=
 =?us-ascii?Q?FR+y1mQhGXV3dm9FNzOnD/E61l0lZ2VSDGhhPtmql1NulORkNMnLwU89nOMw?=
 =?us-ascii?Q?Xyahp/ynrhZyDpfkZCOvjhHLtOiK27ZQrV+vnfC5ipHQZmjnKk3AaPRxMYN3?=
 =?us-ascii?Q?BPOBNBhVKmmU/6fRZ8fXjY5UjaMk3+xeOvN95hgICJOEqdJ+zIjA/pY5iD9T?=
 =?us-ascii?Q?vMMDg6DKC3qyElHBHQyrlebPi4BDLX2XvOZwrqPMxw8H6kUHvaMKHdATcFuA?=
 =?us-ascii?Q?sS4rndLvKC5IWSJcF7B4iVq25q73yR7pRRJjJSowgrwLGv2wLlWq+iZiNpBj?=
 =?us-ascii?Q?P2rfnWCXe3bapVjiLA6WItzxDvqbjw9h3VIGMYMoURuzKd8gVGg5oekTE6Js?=
 =?us-ascii?Q?ivMhAlgdPrZmfCNjxXeWH6nX2nW3bKwpi1f/IRyoLAwUVOWH6KzXk/rrxmTc?=
 =?us-ascii?Q?b1BS4B+ZXqhM4VqN8cTuTqTPbzI3FHGHWCApxv2Lafe9e6nJm+n4xeTY6mwV?=
 =?us-ascii?Q?DVD/gx4nnFuYTE0RjferRfXVu+wp6FOPL+gROHsHZIiQzVudaq1hIzhqvD7c?=
 =?us-ascii?Q?KTXDsNLt3G0yZXyfh1sCkeZjhcst1L1I6nGYnRHri0Y6rfRgCayZ4252Hu0n?=
 =?us-ascii?Q?Hxj1R5WukrUj42Tbf7QhuY8QuELPFi5ZK9OGbrw3XlTdR0IXscX45QGeJPAz?=
 =?us-ascii?Q?AuLtExG+Vpr370fke80qaKJS9+8WqkFJ3OiM4yYf/fFU6+bA4TlT9CY4jDoN?=
 =?us-ascii?Q?p/zTnjOyaOgbVaObdGdT4cSMZQQtplATieQIya+bLm42rxOfESZMkuaHxcLe?=
 =?us-ascii?Q?vqFzLKazqkgI+uQZkSxCYijrB47d/hwC9vSuevcEReiUhOsChlfegRchzx/P?=
 =?us-ascii?Q?iXUZszaUXAlPRt5A474qfrjHZnyILP6A7r7HLShE/REpmgdo75idzO4EsF57?=
 =?us-ascii?Q?68Q0PaHojrmEZ/osWiT86k0RIb98CzuYPdfjjStamZtiCHgDVPHZU4prwSu8?=
 =?us-ascii?Q?pILJg2LaYFjtsFAirhpGvPXNgO2/Bqk=3D?=
X-Exchange-RoutingPolicyChecked: L5ttkXqm2gDpU/mfLIty0u7+A5T0TIw7Ooa3MEm54ASHZH9eGLAKD9MxFnaKxJsVvQUWuFhmfgA8VgR5OTAr1fQoKhcCZfY0N3XiFSw++ZQ7pXzmE6VdZFPOTI6ScgFxLAUz1z8oPpeaaMjrZBlZ6uyHIGl29vur2KNH98lEVqztI79NpwsX1RHUGBf2cjKwS63dsl0lruZi8rZAei+VLg4pNwxkdZYpe96xpW2mf0MLH0o8HgfOpyTq9WjndE3sos/JjXWjzlgXEZK6xd36ApZ1PkH4Xh6WfoMzQMJh53MhSGL4OuKwUbYk0DZwwHOOlY0W7qVKRT/L58hc9fNakg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b1bc9b-dadf-42f9-cd40-08decbe10e00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:54:19.8051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4GZNj2NPqiUq3wsZZUcuFnZZOXb9wRMeiQzkRdnpELJPH06SSSQ1qEvEX87fuaceUu+T4zVurEaQgz0OkZOHSqIF7TaaJAUcNzbfg/ndqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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

On Tue, Jun 16, 2026 at 12:21:53PM -0700, Matt Roper wrote:
> The 'lrc_setup' RTP table was allocated on the stack because it wasn't
> truly constant and needed to calculate the proper value for BLIT_CCTL at
> runtime based on other stack variables.  Using the FIELD_SET_FUNC action
> allows us to make the table itself truly constant and move it off the
> stack; the BLIT_CCTL value is now calculated during RTP table
> processing.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 60 ++++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 98265293f2dc..0b688b851b71 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -337,39 +337,41 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
>  	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
>  }
>  
> +static u32 blit_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	return REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, gt->mocs.uc_index) |
> +		REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, gt->mocs.uc_index);
> +}
> +
> +const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

This (and the table in the next patch) should have been 'static.'  I
initially had VISIBLE_IF_KUNIT here, but decided to drop that
until/unless we actually have kunit tests that operate on them.


Matt

> +	/*
> +	 * Some blitter commands do not have a field for MOCS, those
> +	 * commands will use MOCS index pointed by BLIT_CCTL.
> +	 * BLIT_CCTL registers are needed to be programmed to un-cached.
> +	 */
> +	{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
> +		       ENGINE_CLASS(COPY)),
> +	  XE_RTP_ACTIONS(FIELD_SET_FUNC(BLIT_CCTL(0),
> +					BLIT_CCTL_DST_MOCS_MASK |
> +					BLIT_CCTL_SRC_MOCS_MASK,
> +					blit_cctl_val,
> +					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	/* Disable WMTP if HW doesn't support it */
> +	{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
> +	  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
> +	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
> +				   PREEMPT_GPGPU_LEVEL_MASK,
> +				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> +	},
> +);
> +
>  static void
>  hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
> -	struct xe_gt *gt = hwe->gt;
> -	const u8 mocs_write_idx = gt->mocs.uc_index;
> -	const u8 mocs_read_idx = gt->mocs.uc_index;
> -	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
> -			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> -	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
> -		/*
> -		 * Some blitter commands do not have a field for MOCS, those
> -		 * commands will use MOCS index pointed by BLIT_CCTL.
> -		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> -		 */
> -		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
> -			       ENGINE_CLASS(COPY)),
> -		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> -				 BLIT_CCTL_DST_MOCS_MASK |
> -				 BLIT_CCTL_SRC_MOCS_MASK,
> -				 blit_cctl_val,
> -				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		/* Disable WMTP if HW doesn't support it */
> -		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
> -		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
> -		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
> -					   PREEMPT_GPGPU_LEVEL_MASK,
> -					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
> -		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> -		},
> -	);
>  
>  	xe_rtp_process_to_sr(&ctx, &lrc_setup, &hwe->reg_lrc, true);
>  }
> 
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
