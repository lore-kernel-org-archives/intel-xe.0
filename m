Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDD6CF45D9
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 00:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAAA10E442;
	Tue, 13 Jan 2026 00:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XC3T+3pd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7110E43E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768264239; x=1799800239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LbQ0ce9BY7Uch6BAreJ1ZKFucDvHtk9LU/BiGGzheDs=;
 b=XC3T+3pdB/hJ+JPiamhs/kpBqjvW7IQA1yYP5M8pzNYtCD+yNTFFJf6i
 n/215rMgiq+M7TXP8JX4/QpCg8UL+W1EzJIVNsrLRzp83FWwSbWwk4dlr
 td6t/JaPm9929jOZkdVLny+tNR9rvU2hQK9XHSLG22riVdfWlw1/dTMpi
 if4NuNqu4TTwimsU7CEoKWvk7PXnbBLP2PeZFzGkVN84bi2aFfzw+2pj4
 ES1tVenSp6NyvinUfkXeCPYSQHOFdffOO0sNfnznyV01rUoU839bDTIrQ
 slRxGukctAzAbuojoKImUwt2BS8Xx3qPXMPXv+hK7bblgp/SsV02ov+WM g==;
X-CSE-ConnectionGUID: JE3nfPE8TPSMTdZGk3zLaA==
X-CSE-MsgGUID: k7yOdTfGQGK8GGqyRN3ZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68551501"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68551501"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:30:39 -0800
X-CSE-ConnectionGUID: uwEbxuClQBa8CWJukq0/6A==
X-CSE-MsgGUID: +EIb/MMaRCKo4s9z95Gs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208390460"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:30:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:30:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 16:30:38 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:30:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la/4iqYlASLMaG58FyAorTTrAsdiLHezscXfKnfkKuiYrDwWagpZEhxzKr6J16WFQYf53ZJlhD+Bm5IOJjcMavKLmm5fOLllVo1DEEJ+ON9Jn4m63haTII4e30R5Ume6H+jT5HpVrZou2eU6dABYW2A2xW3Jx/4nRy6qLwT/12wmCZ8odMZbK9U/q2GWYeZk9ZUJ67avLiZIjf7Czr33CwFrOC+GTlHkQQVcGhyRb4AxItsxfY4fqb8fFI5uy3XrlAGGVbO99ZVlpXYu6hhIKznWbxLyQ0ilN/Jg6tbAjPomwV5G7+zI7IELqeYbhuR+caHNUwx740nNkAZWpvj0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prBN0C6kRWvbHgMq4ZkuI+QCaZ1SmpHjUcQ7ewTaFvY=;
 b=Ng8XWLOF8Hv4xDYHVRmtdy5J3JHolm/hzr/OXQkNGTWOrFojIR/vdgebvMd+kBG85IKvmM/OWLS15AHjfCZjjIy0EPDjCIFUwVZLBRGQ0dvkALvNfXNWHvuqoNVU1zeohfSYCZmetjhFs2xjnq04H/1njOvKyIkZS2ZFwPcfzRtxtMS15CfiNyJt0Kizv8ckxW4NMnISzrXU4QVtzfTjUB+PmzcswfD3Sk1MQ4TsPp9CiNTAY5GxhQlRIt0AECtZCML8cW8mvvBTwVYHY6r8Jg8lua4rHBIJa1gI+IdtD+a7cSi/KJjQYaHzvwUYoa7vsiRzd9LhRjGBAbcV2VPpQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 00:30:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 00:30:30 +0000
Date: Mon, 12 Jan 2026 16:30:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: vram addr range is expanded to bit[17:8]
Message-ID: <aWWSJKGcDgHuLv6R@lstrano-desk.jf.intel.com>
References: <20260112220330.2267122-1-fei.yang@intel.com>
 <20260112220330.2267122-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260112220330.2267122-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFC0624F2CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b47e06-1283-4d2c-b5a8-08de523af528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qmsupu1voigxMiynfnjyrbKoTfKBjwZFHXyUB0L3aHfOfqKi23mdqlP/L8PW?=
 =?us-ascii?Q?KfDAk87RT5B0ItokXHYdPiaJiCt2mpLZXeh4b08JycDUWwl/JU/cAlgPYY80?=
 =?us-ascii?Q?7SRjNx2OHwUNeEJf03opk1s2vC+tA/MUvKlAZdi8vFxgxn2E8Aojnc7k6idK?=
 =?us-ascii?Q?MYVXLM71IFtjuEOaQA7NL0DOj74OM/T5dGXdyKnC3M0jcE7slLlIfEjKa5qJ?=
 =?us-ascii?Q?ac9UBMqBcbM0aoHL+/Dfsonwn4FWlMYnI454loV5REHVoRJSRPk/hD2B7Gzn?=
 =?us-ascii?Q?29bIUFubQuKKDW0QV6S7Py75Ae/tbC8VcNvI9tJYz843O/AcQNEY5sDrD6DH?=
 =?us-ascii?Q?vUYxagj92s/Kg9aGyrbyivXkQIA3+XgUU/Cr9hV9TpPZprBLINW6CQC9j1iP?=
 =?us-ascii?Q?DEO/rqSMI2IcSHISOFM3V99+y6IUQOYVcBTrRSJGNsF4qjn8OtKg+krWbuaB?=
 =?us-ascii?Q?SztTele9PYVvyC+ihK23MhuTxUMqfVO7KRXJCulwCDcXzRpXbdbQlkc4xmVV?=
 =?us-ascii?Q?gdJkx8GDA2YRj6FN5lve+2S6VywxIYV1s5sX8zqmZilQKPURGU+5jQpsz1RP?=
 =?us-ascii?Q?m342LSqmmcBCyKrqlBqbpIEktvMEbqG1Lzl4DYnOVEPjydQGvtChVZIFOldU?=
 =?us-ascii?Q?i2hWhM7qjrF3aLwDdabUVssO0aUiFCUCyTGfPHFazjVUukpuFG1RUEmaULz6?=
 =?us-ascii?Q?oIP6k1i0K20COwNw0e2LuTDXTqSi8QDO6x1V2upm+v23SS9Dsxq5U4sfS+s9?=
 =?us-ascii?Q?UGxpQrrmDNGHf1xWk9GmUVwxfD7K+8MF3iF/xBubZaHsc0Ot0DGp735NMoIo?=
 =?us-ascii?Q?I4yt91AYfIuJqi/VCN5lOWkSVMitk+vwf7x4uf1rBwTBLFPuy+gjOa3mB6l5?=
 =?us-ascii?Q?GdxIfDlfpKLh8JzZW9+pcchVyuV1rhBJ1BivQ8Oeo3UJJtOOJqBeFT/I9L8L?=
 =?us-ascii?Q?6TdCOIm03VYNrKerBMesy56txGyKMM+ltoiMYWpei6LKw1WpY9eSEdDZO9Qp?=
 =?us-ascii?Q?xiG0BC5Z2KB4qSUhMJCQcPwHVWb7Wz7f7AV3WdhVUTy81IUTDv8Fi4TJv8Jw?=
 =?us-ascii?Q?8P0AItPTlJn07oVGfDT6uNrPdeQ0e2iuTqE0ilKUyYt+ezMD9lJIGYbOMfMa?=
 =?us-ascii?Q?SReYJ9WYzMBTBNVwZSxMmdOkE6gefPfzPZxyRYgMhRahZv+f08U+ysUKej3h?=
 =?us-ascii?Q?5alZQ62bVqzRwmo4W/OpfMDUySN2HhRdreF1X8vtXu3enHTkr8Yl7QyW458m?=
 =?us-ascii?Q?7CL6QUmyX+DERZY8PSIaRMM5qDCkfzXPbibLErFrP/lK6K9BrEU0CI0x8UQF?=
 =?us-ascii?Q?PVgsyYe+mXXbse9q8N4+Rfv4+DgfwxrvScVdsL05Q4Dw8RjxVEOTOJ2ylxWX?=
 =?us-ascii?Q?zhIZk7/4vrQkIuh9jB9x9Sl4AVQu+Yg2dVpnVCmRrt+aY5n4HnKZTnz+dqBd?=
 =?us-ascii?Q?Aem2qrLpOSg9FBKH8tME7fzfgWv52E63?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k8/umJjGNO6Gu8Hovh3DsEsERNZcwkSPLcpBGAViefJ9qvQxffrSFI2YZQms?=
 =?us-ascii?Q?wVuY9CyfW1q1113LX6hgEo39+eceyJtMMIGAyxXVhZEjZhWamkmhWlJ/QT1B?=
 =?us-ascii?Q?RPd3OFTfqI8jzmaOokCmT/Zn0ZeHAMbXApg3gxkxuGNbHzcdcddn4t98Nkml?=
 =?us-ascii?Q?aKPs4IBsrdldGocohfTx29qh5Z+smADj72qjsJZiRLbfvwxpSQGUrQ4/ICos?=
 =?us-ascii?Q?6zf230RviNxazwrqdISm9gQic1/H6qVlWFi/pMBY3KQhnsi+Ns2fqL2pJ2d6?=
 =?us-ascii?Q?kz8DMr4SF5/N8CGK+cFFSVMv72nM4Ak+JDzHh2qgL8Pc0V8Q+PryRhmJk+14?=
 =?us-ascii?Q?OL3DAtq9KZREhz+8mVDM1UTyt779KMgp4a3s4ENCDVA/r10oj72u0a7Zftqt?=
 =?us-ascii?Q?R1xF8CHm35zcAB4oyQl7q5S9rMrTpNVQyRk65FJxfEBfs1eTheYcYx4FH7gn?=
 =?us-ascii?Q?LnPHSe+8m6WCAmJ+lt2G+lxaunUm2wHGSo/8epDNwny36A/OJWKVCnV5eaQY?=
 =?us-ascii?Q?tvuI5sFA2l5CDTn9mpvP8onhgPdWNUG5kFSWYLQ4WksMZrDmR7TNVE6KT5xk?=
 =?us-ascii?Q?1WQ2Nyajwp1uS8/2Lqug3oDiZy61x06RWZQl9SXVK7Zzua9g8siNCoSwJA1V?=
 =?us-ascii?Q?KDIID4mqQirZ+r37T032uPzu0M1HQy7RS7iSF+lvgeLPH9Y/3pDXmVx3p8cZ?=
 =?us-ascii?Q?nvZbX40uoOWRiq3nO79zxE132Ngad+Io/9p0YZVzUpRJ+ql+6uNQHUOixwtT?=
 =?us-ascii?Q?kFVgp6q/MdK8f2g+ypgbrpx15R9v+kUVZaSCY7xsEOJlAaFK+IbqE7ttnLLX?=
 =?us-ascii?Q?Ay4OZD5eu5Il2tjCwkGf/omdnHj4QL25Toar4kDaGF977TzZRfcZ+Z35zwcl?=
 =?us-ascii?Q?XrDNz1rzXWuW3T224y0CvA3i2lXXPSeL3XXgpUKWkHlxRdQExzYzbjfsH48+?=
 =?us-ascii?Q?TZeOIKcdoz0JMwo1Mr+7bq2NS+vvZxvKX3UbI47gcWQYIEDFUK+AC5JNyAjg?=
 =?us-ascii?Q?jpmcD8dQHN9tt7bT8XxunbQ2S1mmyKD1s6UsgegpWOpwGpFchWiuRsdvhySW?=
 =?us-ascii?Q?lp+UDnvw8qRz+DVM4npSOpWMMmnxGLKBZq19VjD1+aN4etoK6d8DS54GLNhf?=
 =?us-ascii?Q?k7K1B2EHZg7AJ8tsnx3JQIrtvHky4pCHefRJhDdXx4t8abSdqmsQLY7ay8dz?=
 =?us-ascii?Q?SzGmLU5Bo5e4doib7a85/mKmhPcG+G+a2p3+N/0dVug0x+iGHcRn78Ytcnb8?=
 =?us-ascii?Q?UC3wOeQ4WcbsmVDnQMcB2YU+5fUj3eztGfGAuGhPhkqnjCw7VhIGJi1rvjOD?=
 =?us-ascii?Q?i6vUDy8AV8AzYxjS/CqKOY+s6QD2EQhPjdKBR8td9A9ajyttp7Ahi3H4LTxT?=
 =?us-ascii?Q?YiOE6GDaY9b+MgoY7V1e7Mcv7a0V6DvfwBi0s8rtrf0tBwcGB4nnvAOlcOcK?=
 =?us-ascii?Q?AG4WTltYbz29AcmIPwcCbDh9ghbsZ5Nf059VuNhvCIH/VPTmwtseRNed0j48?=
 =?us-ascii?Q?mCOEZXU/MEirpL7/6YUOmqgJdzvR4pNDTyydWtsxeGQp6VOiPXvQX3LL4vZj?=
 =?us-ascii?Q?UWP+wvSZCAXncqFbhYbWKV0KT0emGuHxSlTYX6zmlna3X0T1fp4wOjFdwVW5?=
 =?us-ascii?Q?W3/u631f8CaHWGMYVioXR81SwlQKUD777VSVPkvllnKT9P/DiqTrfZIuw8/y?=
 =?us-ascii?Q?gLWpHrvcYzkOdUy4QFalAmg8IH9aY3MB1cQ3ecVm6xgEX3FdNAuzAIkGuUT2?=
 =?us-ascii?Q?CmfgsuKTyCvSEF7blGEqSaFzLfq3ACg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b47e06-1283-4d2c-b5a8-08de523af528
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:30:30.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8egwahMuFkWOXguY/K/CrGiXgBIJ615y6+0qmyvSeReBsYGWrTbbGSjQD1ZSDmUm9sMin5s5IrsoBXjz8W9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC0624F2CA
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

On Mon, Jan 12, 2026 at 02:03:30PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The bit field used to be [14:8] with [17:15] marked as SPARE and
> defaulted to 0. So, simply expand the read to bit[17:8] assuming
> the platforms using only bit[14:8] have zeros in the expanded bits.
> 
> BSpec: 54991
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Also future reference single patches series do not need a cover letter.

Matt

> ---
>  drivers/gpu/drm/xe/xe_vram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index c64d98bf1723..4f807eade2b7 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -155,7 +155,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		*tile_offset = 0;
>  	} else {
>  		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
> -		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> +		*tile_size = (u64)REG_FIELD_GET(GENMASK(17, 8), reg) * SZ_1G;
>  		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
>  	}
>  
> -- 
> 2.43.0
> 
