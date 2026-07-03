Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D9AC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 14:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B75410E366;
	Fri,  3 Jul 2026 14:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru0rLln1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1BB10F832
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783089247; x=1814625247;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lQR/JfCT1dEujgWK/wf4GsueONXLBOOmEUukViKs7Ow=;
 b=Ru0rLln1QbdF24G7NsH3tVkyFu8kaUZlhmccEWJYrvHW1Y0csSrLbXXI
 TsufOhtcwnuAYxYiY611BG9CHUkF3dMQmCJhD+3eUyTRM9COMMXykuKzA
 Dy4pUtPy2nKCCEgaCY6kbZ9pe5iwtHovRcZyMsEXPug2Y0CVTtbla41Fu
 S17JdSSvlnMrLWfkU4Y6apwUv6dihf0yHwttF5VibGuR0BFGQb9OM48QM
 hZVuO/mUeIrHQBl+sY2ogiVyxYWHIUBOFNZwUyLDTQPOcrvVOj+gyon+k
 5TIZdrky/sg97oGxZsuvLCIh+mxGYEOR/nAd/qlwBY3Y4L8DC+o+A9sJ5 w==;
X-CSE-ConnectionGUID: KDuYm2NdQBWHp2JXZ6Jpxw==
X-CSE-MsgGUID: z9QmaxPQTbeNkpfEy/jfdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87524257"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87524257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:34:06 -0700
X-CSE-ConnectionGUID: 3uSY5rTVSuOk9HlebfbXJQ==
X-CSE-MsgGUID: qvKl9dtxQ3GEzoZkO5j+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246759067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:34:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:34:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:34:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5j+4i4LfDlYpXS33hP2K1nFnyM//hpWMwpwTLoMNK5IVBBq0jVPU4QwGYszGFcobg4GTHgt18w3SbHI27c/BXuDqILQj4bz1fFH3VJnL6bLIDlBH112Aze52+9BPtm0BBqhe+uXz0CjESbnYeWRK6VvE6aRDthH4MyjGTlakXhPYkpmqaByS95nEMW3qsOxmKVTXgU3yuo2OpEVfK5zJVsgG0ybatujTAfPwgeRvQqXmDfg54ASvuY0i+pAD9ZVKsFfE1eAdigi+BoHk8N1VsxUZf2OwIohOecmVktRPr3vs+v3Ma0ILhabWHUeQNBNjqRkLkIgJZH6nrOrTE/RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7Ow91dbHtmGulVtkVuNpP5TvmDKMawf6f1rAU/kgP0=;
 b=h0xBb5PctZu50jzHe/rDabv1QvSbCc5tn5duBYcmIrH6LJUNCEINWWb9fJwRHpEhGOwTf2LSVcN6d7Y+mIN9ndc67QFyh1gNp9A5ZfuX6TYuvrAvEvt70le0XvHJfqVMJcfacUP6J0yJC8dHQ295sj9tkOl/8+Q1Ow5GVUVSw2q6oMxPJkoEKZ4tjA1sLcydlk1F/APmZyGPeBmNUR3vwmTS0+4UGY0/CPcWvD94jUF4oeFqJkMkdaKn+AkW7g3GJNDhBKIO8OtuA2hedRSrYiFBmYJIkhCq13bqatB2GinPnLjxgrST7gu5YgmB228c3S2/zi+B9GqsDw11oQ3yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:33:58 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 14:33:58 +0000
Date: Fri, 3 Jul 2026 16:33:54 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/13] drm/xe/guc: Add object KLV encoding helper
Message-ID: <akfH5zt6ejAjP8Gn@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0284.eurprd07.prod.outlook.com
 (2603:10a6:800:130::12) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 772535dd-65c3-479e-f8a2-08ded9101e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1A29LeMMruvGxdIF8GdzWUsCq4JH2szlPP0KwBK6DNDpwI4QTBDbKeQl+29Km/+WqGH+NUP7TiQ9VICAV3sqChAWbuHchOnWZLEwkBfy6AW8d4ITdXo0P6HOJJwWd3H8xnlMl1vnFQTrDSDoGWuxeKK3/DrSDJpOqUNP6VtW0Obk9vkpbMExOxRDF0ovm5qY1iJTFVlayNt4MjcS1HKJJ/C7hfErF80mg0W8ka7sGMURhpudgEUrFudQdvGiziLHwgXrSZmpjYcaY3x0H1aXaz28IpmU8kR1zTEfoizmwM6DL4GGuVaMn9ajD5xwyB4nXqI53TssjxQ/B6urU507r+BUnpvydjRvpYVridxYU3LQslu254UO4unVTnbvpyrrvPT1fIFdiYDC9ze0iMfF29aPGNr1u1AIgW5/6kKUyNLKEa/zkcAX0XulGxMzMhN3fbmbD9JzkjcqyBOY73a8HVhFY/6r65/B5qKqAEJmXiYT5jUwDGislJXflHYa3qBhTHNmbrP4eAIcM/zRdgA0FP0UO8gv6CRfWa1fT28BTtyplU7IGGsgQa40OQhD9UVJecSmcGcAFLvIv3NUBPAYo6yCik8BmmSDVkX1YaJbe7JM0scu4xresRM7Wo8Ms0xJZTdpUgrIRJYctlvUyZTF2WWcNkcXt1ueS4inyOS/X6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGcrRVY3cnl3Q3RscVplTnpPdTU5QTlJN05pcFptdkVUZkZxNENFbUZVQ1da?=
 =?utf-8?B?UU1ZbWJXbUlpR2NGSzhHd0Y1ZFBteWdiYWFqSGRGTVlkRlB6MzRYbXBTS0pR?=
 =?utf-8?B?M2lXZGpRL0grMXlRUWFZOTBZTjB4SjY4TEtHbzMwUkNsdWc2QXpXRmdSRi8x?=
 =?utf-8?B?UTduakVlbWpXUzBwcTNUL1FZMThIVmZURWlDb240QklHVjBmMDIzYjB2aEo1?=
 =?utf-8?B?VHpaUGFGa2cxckJpSDgwTy9ha2VZclc5WU1kc2Mzc3N1WW1xZll1TlVOdE95?=
 =?utf-8?B?R2N6cmpmYU5IWE9vSFFUTVc5dUxFN1Ywc3o4c2ZBUEFMTlJvL1BxOEJaVUw5?=
 =?utf-8?B?RUtrSFlOY3pidmRnb21XN21HamdRODBtM1dWdlpCeEFnSFlFZS9XN2NnenpP?=
 =?utf-8?B?bU1PTFpxYm1DZVY4T1N4b1BkelR2Qzk0U09zUTV5OUtsVm9FdFRKWU9BNHZE?=
 =?utf-8?B?WmN2R05tZ2xnODBHWFlwbGI2UFJ3UlBNQ2MvamdoTmZNMUV1dVdFRXFWcXV3?=
 =?utf-8?B?MHZqbkJ1bExPb1F0NWZRUm1pM1liVDlJZ2ZVc1F2anFVd25RZlVpQU9wU2F0?=
 =?utf-8?B?USs5U0xQY2llTmpIcENta0F2TXVVR0pHUlh3a3IrN1grRnZJczdMMnRhNVpr?=
 =?utf-8?B?WStmVkEvMmNndzdHU3RzQTVvRjRFWDdYUVBlTDIraERPYkoyUzJ0WHlmcEY1?=
 =?utf-8?B?YTh2S3FkRVo4NTZQUklNajBIMXlPaVBjeDYzL2RRb2xvNkc0SDgvWUpyWkxt?=
 =?utf-8?B?NFFyaE5Pdmp0aXZSWk95LzdpOU9QZk9EUFRoaVFwcE1hRjRTSEcwUHdpRXNt?=
 =?utf-8?B?SjBib2pMYW5jbnJJVUFFV0VOZUk3b2R2SG9ZRjRCdE9yM2hNeWQyZnFuZGJ2?=
 =?utf-8?B?OStLeW1qMGJ2anpjK2pibXl6aXEwV01hZzcycm1URCtkYkNBOStPc2RQY0th?=
 =?utf-8?B?T3lQL0xYOXV5V3ViL3dYR0FDekx1V1Bkc2FnUTB0WXhpNzY0djRYdEMzbCtW?=
 =?utf-8?B?RFJNUkdlOExQS1hxVzZ4RGQyTUJMclA3d2MyNkNWcktNWlhzSEtDemtKalJx?=
 =?utf-8?B?YzRQTHJzcURxQiszV3JkK3lsalcrMXl6NDJ4MEY5bk9QamFIQndNRFRuZWs2?=
 =?utf-8?B?OFpMNS9ScndsNHVWRFR5NC9xQnpLNyttOUt2REQ4Z1BQRWZFeE1YSEhLcDk2?=
 =?utf-8?B?ZzVlQUlJZzFQc21ZTTJ6THhrZkh3QnpIbTRnSnBTaEhQOEpuQm1FT0VPUHp1?=
 =?utf-8?B?bTVqbXNTNFovKzJXTjFIUkgrbUVpamtMU3pYTUIrbEw3TTFRdExRMmZYVVBK?=
 =?utf-8?B?cDFFQVVnZ0s0eFVDL3loUHZ3VGh0ekNFUjd2ZS94ZXZhWTJnVitUVWREL2U5?=
 =?utf-8?B?azZkVjk0dU16VEFyRzFjcS80dW5ScFR2YXVMQ1g5ZXBXbmFNN1NaWFM0RXBT?=
 =?utf-8?B?Mmo4dFQrTlFrRVBONndJR2pxMk9GWlBEZkk3TklSNGY5S0hRVE5WemFWWXlu?=
 =?utf-8?B?NGdWUVhaZ1MrTlFjZjhDM0ZjSVNTc3Y0bGt6andsb2tiU05EdGYyY0ZiRUtB?=
 =?utf-8?B?V3BreGVuNjBnaXFGNDM0T3dtSGZ1YTZScTdGQjhzOXVHYitTT0R0QjhocS95?=
 =?utf-8?B?c0Y1WDZVSDNwN2pPR09uWVNFZFZ0TmxqYTk5U0wrc2R3VFlFYWNMUzlyWmVj?=
 =?utf-8?B?TWgxZUFMS2Z6SnpXdGoreUJJaW9tRHJURUUzSnFMRURFSGJySi9VV0hQclBP?=
 =?utf-8?B?Rng1ZUZ2clBBcWhxQXY2VGxsTVJGUjc0NHphek9Oa0xUL3pRT0xMaHNUeUZE?=
 =?utf-8?B?WmpUTUdlWkxONCtrVU1UYzErNlRaL04rR0JzZUxxaDhCMVBENCt0MjdneVNS?=
 =?utf-8?B?KzFCUTZlUlI1U2ZDbjNJYmN1djZrbldGYSt0T2I1OHpJajl6RE5YTFo1c2NH?=
 =?utf-8?B?Q1ljTFpxWkRIUlJYYjkwSDZuSEt4b09RbURreDNucXVXZGprRnVKclhPcnJ0?=
 =?utf-8?B?eG1ZYTVUdDhqc0lsS0N6SVpRT21SUW5sWWtQTDErdkgxN0tMVnRpTnR1Nndh?=
 =?utf-8?B?L21WOHpPUXNhcTVHNEJIQ1RjT2J5MzErb0dxamFMNUR0NzVSNDJTamNqV3cr?=
 =?utf-8?B?S2UxSzVZRGd4RC9FQ21vd1VtOHpJeEhlaWlIZ0dVTjI1ZFprc2xBRDNtM3Fx?=
 =?utf-8?B?WlBDTlp5NHczYUhHWC9aWlNQc1BsSDdla2lsYSttMjR5VTU2R2dmd2kwK000?=
 =?utf-8?B?M2hRUjNONXFCa0FENGxydmx0Y2I0Y0xuU1JhRjlGUUp5NlF5SkxQbGE3a04w?=
 =?utf-8?B?dy9PbnNUSnliU0VwWE5OVDRPeGRRcUJPWm5yeis5ei9wQnNKVFVKMVdFWHFI?=
 =?utf-8?Q?C53G1aR5rgB1jfeU=3D?=
X-Exchange-RoutingPolicyChecked: snox3dafwSxAWv27jQqZn2KDZIGnsgVkcBkT1YFJh5Z6iBgE8k5k60bMo26GcydWdQUyTyqm27UMqgg4id3Dui1G6UzxG0DBhnfH8m9FHYvZSU9LuflIP3WJl2iKGT+5xOV7qxkhXBzoH+aXM8wX2aL8BIK/x91CIcrfoM0yD6W3u0fj5vXl/NKoqnGpChz8FSZkRKsy4pbnO2Pxfg8SOCSnQpCTTXG4nhyTGsGF+7BLxFj1Cwtc4HGTDE2qRbFc423MoKhT9Kl/8MJx66ognHJSVI/R2WWn8LjeWqJkYrn6yfXyqp9wKFCS1EpRrY4id6PvOwTXJSaQN330Je3T3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 772535dd-65c3-479e-f8a2-08ded9101e30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:33:58.4220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztk17yY3BeXxvA7NMHRHDn7xNOk8is3p9wwDNNvAXtWL+Zcin2w/wPlv4M7RaVwpKtAV/WY83eO5F8IIu7h/vlJkBgsQRuqgfvnAPQlwhN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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

On Tue, Jun 30, 2026 at 03:26:24PM +0200, Michal Wajdeczko wrote:
> We plan to encode larger objects as single KLV or set of KLVs.
> Add helper for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 36 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  2 ++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index a5fcfc4a6c37..53a8beb9af04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -274,3 +274,39 @@ u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s)
>  	strscpy_pad((void *)klvs, s, to_num_bytes(len));
>  	return klvs + len;
>  }
> +
> +/**
> + * xe_guc_klv_encode_object() - Encode object using custom encoder as single KLV.
> + * @klvs: the buffer where to place KLV
> + * @avail: number of dwords (u32) available in the buffer
> + * @key: key to be used
> + * @obj: opaque object pointer
> + * @encoder: function pointer to the custom encoder
> + *
> + * Return: pointer to the buffer location past the encoded KLV or
> + *         an ERR_PTR if there was no space to encode the KLV.
> + */
> +u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
> +			      u32 *(*encoder)(u32 *klvs, u32 avail, const void *obj))
> +{
> +	u32 *end;
> +
> +	if (IS_ERR(klvs))
> +		return klvs;
> +
> +	if (avail < GUC_KLV_LEN_MIN)
> +		return ERR_PTR(-ENOSPC);
> +
> +	end = encoder(klvs + GUC_KLV_LEN_MIN, avail - GUC_KLV_LEN_MIN, obj);
> +	if (IS_ERR(end))
> +		return end;

Similar to string helper - we might want to error out if the object
would get truncated (also spotted by sashiko).

Thanks,
-Michał

> +
> +	if (WARN_ON(end < klvs + GUC_KLV_LEN_MIN))
> +		return ERR_PTR(-EPIPE);
> +
> +	if (WARN_ON(end > klvs + avail))
> +		return ERR_PTR(-EFBIG);
> +
> +	*klvs = PREP_GUC_KLV(key, end - (klvs + GUC_KLV_LEN_MIN));
> +	return end;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> index 1c576456efc5..855805f4463d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -20,6 +20,8 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
>  u32 *xe_guc_klv_encode_u32(u32 *klvs, u32 avail, u16 key, u32 value);
>  u32 *xe_guc_klv_encode_u64(u32 *klvs, u32 avail, u16 key, u64 value);
>  u32 *xe_guc_klv_encode_string(u32 *klvs, u32 avail, u16 key, const char *s);
> +u32 *xe_guc_klv_encode_object(u32 *klvs, u32 avail, u16 key, const void *obj,
> +			      u32 *(*encoder)(u32 *klvs, u32 avail, const void *obj));
>  
>  /**
>   * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
> -- 
> 2.47.1
> 
