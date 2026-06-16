Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA36CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 22:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB4E10E0B7;
	Tue, 16 Jun 2026 22:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0HJDaN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416D10E0B7
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781648558; x=1813184558;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9lo3FXr2TqbOqDkRzDqEzfBFyuUwr/JMPgs8g9H6sl8=;
 b=b0HJDaN8RRT09AIIDjUWNEIdC8eQ+HAz+Q47n+G7Ji/ge5ultOBgqHvo
 yeoK+p5yE/QJkfikUeU4MD9Iykj0e/fqLoBWf4sD9RzKYYqnfiniYXZhP
 hMg8g4toZMJNb01qXVzRFz9aKA35blNhA6jgCOuaLLGhGyw5WNGRUDZxO
 GdhUJnjQbXJe3vZ7Ge92+/NMyezDskGNG5lmJhPfBmU/TeF8UTcIjjVGz
 6+9j2kKgBW9uZpas58alBMbwIiCmb0ce61JE16frgnGWhLYLw9Y/o2s4C
 Pi6f1jED/v6fE4kvp4ytIIbAW+4wZpbL55z3CsqpVxctdh0JwdDbl46Sa g==;
X-CSE-ConnectionGUID: PemEnh+KQ3OwfOGDQGwEdQ==
X-CSE-MsgGUID: xWPYNnGrSL+uvXGPm5Y8OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82630555"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82630555"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:22:37 -0700
X-CSE-ConnectionGUID: R6s4QdkdT8SJuypgzJfM4g==
X-CSE-MsgGUID: niW/nMycR2GXiG51HnWHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="249797639"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:22:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:22:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 15:22:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVSPxhMOBjrYs97oWoHsXDJFTFEUuy2xY2hriN5JrXgh28kKfhDCi2BsO0PsogrXRgk+0ATLMja+snzIE+vbpn7FrE9vzdiuwZZ9cCh4QUBvC+pP7f7tRu8LaBeHtEFNWg8JtFTpUnfItd4PiS7GtLI0RFPiSAcbBGK0tEuHWuj90r8EY69Y5g+3k8CNtJQYG24Z6QY/1nJio+cqgetCxFuONU50u7q5VDbxvRxr/tkVoCdjxVDlbunuv3LKkDdY3H121JZb/73vlSQfH+X/xNnq04A3LcmOjq3i2Yr8MXiI9xVsZ1wN02qswVGnUZzyiH6wjnKinD/Usx3i0YwIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpd4i0uxFEuomH8Wu+4tqJbtkmLechBk1UAQfmt72Rs=;
 b=o+InxdraNtfSfNS9sr3jtc1yETTympVF18e3Aawecxv64iXehIKrDsvzXntGbd9v0+bGUEWDc2s4mg2Y7r3LSfpnnfIPy0tP52SPoRPZU0q2ToaO4tWNSwvnEEUS35l7cu7FoCzKs+5gvQ8kHlmHM0agfuMJdgFwtmBsVLivBp7VPGP/jodxC/YSfhZOaVmbEj3ToCeZHSd7aDiXE1xPBtBHroR48L0d2wqRti/xDawmgQNjr9s8bgGDseM2QHWvuU9sFzfD/AuiFpuYgjQ6cDDQDYzaHE881TvtD2K7/mlTcUZ74anMKgD+Tk/w7cNqwwnHEaTqPSFjvLrYQ3cR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:22:33 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 22:22:33 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/rtp: Add FIELD_SET_FUNC RTP action
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-2-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
 <20260616-rtp_with_dynamic_vals-v1-2-f2b47bea9dd3@intel.com>
Date: Tue, 16 Jun 2026 19:22:29 -0300
Message-ID: <871pe6unve.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:334::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: dee3e875-f5b0-4999-f2f9-08decbf5c31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 4QGD/FJB+aj2fUEaPSQ9A7xc/4WumlBd1MftpgZy9LqZBVazF/uv0zMLpqNKqs+HwKtIhQNAk5NvP8hHl+FO0Zv/RFyRSTT0TIGJObAgCXSNoAtOdZDIKt0tJHD5EHwETdmVJvgPyNr49FNsFlRbmVq7XiQfh/2M3g3k3j09IArSBeQv9lSQhWIcpHv4l6AVUTDzIQNdBh/LlwPDiueDCyOX5chDQs6fvgZzFLaEH/8C453/92yMsvEfNEnchsrp5oEmENA1MHmgS3UcTk9mqdAWyUMA1XxfQu5IYsvqHNcJeBydjz1Unh3YmZctvZCr/pOCLQfFi51cKd7rCMTK/7X+Wo7TX3eM7VrtrSoz75nR3/bsqEjnWPN4RjfAqc+0UJ8ekwOmKf45y5UEG7+lm0Yv8Uu5Q0C8HaBe8TwLIuCnX6YVK+6pM+pCUxyxpDIG6fsqLTWmvVufXy7HYbjHotFAXhjf0FTG9mqXn7LfPLbvHfFgImFCib7Y1p4b52Zl2v1a1+wpTsjXeoAjCcMjdQYODenoQA7qcssNrIQJy+hillVr7etqCVO8olO6OERK5G17LuivrFvSTLAHSaT7mMCwnFgPElIILU/yztXws3LlKH3cwkAvmxUAA93++eDGdqyDLp+Kn+Il/lDotVdodKiEm2dvwXdNe82IlGZ0pQ1mvx8AS+Qt+k3xAitDk9Ji
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBqOnlLClA4BQe/N6ZXaJMj9qxFEL9/HccJmChi84a6lg4qt5OcrUqXS6B/T?=
 =?us-ascii?Q?G8851GCXH9nbTzNaKfCO/S6D+yyGXWdmL0SgcKkwBsP8apPB8qXnTVjYZ490?=
 =?us-ascii?Q?AMlOE2bEteMIjKaJNxbrI0+c3/Qy/Cr2A75A2Uq28kL84EDGAVEvsHLPJzsQ?=
 =?us-ascii?Q?VdXZU0X+g2X4M6Gwb4WX3O3EArIqcvY60B/yVSgdyJJbfQYDpIj9MNLSxWvU?=
 =?us-ascii?Q?Z8TKwan8hb2//aduavD5L0O8Ddu2GjRKZ4I1a9REYIZSGJxxIkgfSxvS9JU0?=
 =?us-ascii?Q?PCEDy0h7r9ONzdoG8pBz+xcw+ZlKJKWwe22suppvgWQ0dk/MRu34rapL9hb2?=
 =?us-ascii?Q?u5646sGZBRAPAUDRg4QNEKKD07p2usHtkLGWwOyITmWlqpZg532Z37VdNuRB?=
 =?us-ascii?Q?/DRHgF07S+4EgiKW0EkDl+X6W7J4KHIcSrGYypLwMFiB67ahtUU2qFGIBTCG?=
 =?us-ascii?Q?jzG18Cxeje7Ujm12wqD8GLKQWXb/7SP7ZJcH6fVID2lgdiD3q3ISARPpGPeV?=
 =?us-ascii?Q?1NvOuHNY+ahAieFi6DaU2b5wqcuS21jJ/zMintaCySbXZ0z8LKKFy8nU7NM3?=
 =?us-ascii?Q?2eFt1qIaXEnudlQoSUh5R5X/z3CU9EY4QfTVGotCgfHxr91QfpMehVqocaiq?=
 =?us-ascii?Q?qlpU3RL5Wrx3DX8y2dYhVEaqzqxW9aPKsbOmFKeg846qHIBLdl/P6txUaAaH?=
 =?us-ascii?Q?IWRWNYrYgbk3RVU6pd+sGXvBm/kQ3Cb3qlU8nLDoO0t84Et09Rf+Q0bHsNaN?=
 =?us-ascii?Q?J3bj0F6TKdSWzcPpcNB6Zhu0JdDZI937phc1eifXzVGxB7c93Z9Akd8sLwKr?=
 =?us-ascii?Q?IKs0G8EVIr73BMCzsWPhGYHZgyF2tlYDC1HsiwTO8lk5qCdjB3LDMkWcUrRf?=
 =?us-ascii?Q?4oKkHVcF954G59nh3EYMlO8qtvF360b03kVogSY/PXWTL0xQO5zfUhcd6A1N?=
 =?us-ascii?Q?vdZWlFxclbN4vpZb4ixomEJn2+Y2WDiKQTlk0BbfoZhfqCALg7zUNJUEtCMP?=
 =?us-ascii?Q?1O3tCILz+NxoKU3RhS1s3yAAsjQ6eJuc7O6TyUHOKbK2aDAFLaFL3A22Cjn3?=
 =?us-ascii?Q?MvNWaT1vdd0dEA6twSNW0RoOjXoe5Bj6w17EfcNItqTjcmgq1Uk9HFemTBkN?=
 =?us-ascii?Q?2en3FdmB0o78vOn0e/9Sfzr55ApIz1LhGaW3RCc0KOrJDTeRv+7wSsr1P7ex?=
 =?us-ascii?Q?LDEbnP77o0yUjP9vMY4ZiO84rxdIf4ioJwgkb0xAMfV3uY1Gp5pxCG7gVffO?=
 =?us-ascii?Q?TqoKNF338iOYHKxqLnw3w4pD+rOqPvbD+8kFGdKQjdDRHW7nm8ioHAwhqS9c?=
 =?us-ascii?Q?cOjLxp6Ce4mZZXmbRYaMdvKuFKx3Q/2POp8kqIwDJDuiAS4UVp9NcUZNEIG8?=
 =?us-ascii?Q?WFkVFlav5deIsxAoNHaxlK8OEik8q8MqNZZV29RAdsF+Wbs2tZ3WQdMrXsnJ?=
 =?us-ascii?Q?EakwFjhlA+1CkjpvUipeXrB9iR1IdrYzPnoFIqcZqXxJIdRE+6DTsPnCRGI/?=
 =?us-ascii?Q?lt1Z+aEiFF19+Lo8+LkQnmZ/Xl+Mo2Lq7EmU+Lsrfci6i0l+zCZvGRiT+WIL?=
 =?us-ascii?Q?V2KkA8Py9HL9KbFtDtMUYn+sRhI6kbK3v6SCL3KBkvCN7wETYSKoevIVbc3a?=
 =?us-ascii?Q?BLr++HNgdo8PKfdDJ7Ry9L3wxDcaaZ2OqqtHurXU5LrhdrFq+oqDxzQfdgxD?=
 =?us-ascii?Q?BcVx9DhDPfyDNtJ2NgBXEwiav9mC170Tz3offX3LzCDTDgoUfbHqpizvi0h6?=
 =?us-ascii?Q?U3ugXNq32w=3D=3D?=
X-Exchange-RoutingPolicyChecked: Zaq0Z+pvIUlAax6DozUoXx5tyw9YgRDCCojvuSz6PF5LlMeNwSsuNJQJAeACKqg83ID8OJxE0fETH1Hds06depdhxf4sy07nXQ443YbSNm5OKM8ROnZ285LndfKj+yq/KaUWahqE+fJ86bovEdDGGwJF0OIqoeDVhAMGMqblaBur1+Pv29C27t5DC1Rj7J3RCFG2+XJ5rW5E4jzus7htpA4k+DLusOmPbydi5Y0uhjEr4H+hjrR3d+9KVLxNR2DYcck07Xzz7N8RwkTHnmVRkU9wLP8GWYjehww4ZRIkj7I3AZUcxgju0bGjzanbkdHc4AXpVLLS4ZkwD2JkVdgp0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: dee3e875-f5b0-4999-f2f9-08decbf5c31f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:22:33.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+IPReZcBVvaJJNX6+QaMHMf78PdLpLJilKrTj8AkYpQGBjLmNCUf17qdmn+FFsljbWBif2TZsov9kuWCGewCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
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

Matt Roper <matthew.d.roper@intel.com> writes:

> Most of our RTP programming involves programming constant values into
> register fields.  However there are a few cases (e.g., RING_CMD_CCTL
> programming) that rely on dynamic per-GT or per-engine checks to decide
> what value will be programmed.  Add a FIELD_SET_FUNC RTP action which
> will call the provided function pointer once at RTP processing time to
> determine the appropriate value.

That's a great idea! I think it would be nice if we added a test case
for this in rtp_to_sr_cases[], for completeness.

More feedback below...

>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c       | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_rtp.h       | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h | 17 +++++++++++++++--
>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 83a40e1f9528..6a8d6ea68f25 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -227,17 +227,23 @@ static bool rule_matches(const struct xe_device *xe,
>  
>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  			     struct xe_gt *gt,
> +			     struct xe_hw_engine *hwe,
>  			     u32 mmio_base,
>  			     struct xe_reg_sr *sr)
>  {
>  	struct xe_reg_sr_entry sr_entry = {
>  		.reg = action->reg,
>  		.clr_bits = action->clr_bits,
> -		.set_bits = action->set_bits,
>  		.read_mask = action->read_mask,
>  	};
>  
> +	if (action->use_func)
> +		sr_entry.set_bits = action->set_func(gt, hwe);
> +	else
> +		sr_entry.set_bits = action->set_bits;
> +
>  	sr_entry.reg.addr += mmio_base;
> +
>  	xe_reg_sr_add(sr, &sr_entry, gt);
>  }
>  
> @@ -259,7 +265,7 @@ static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>  		else
>  			mmio_base = 0;
>  
> -		rtp_add_sr_entry(action, gt, mmio_base, sr);
> +		rtp_add_sr_entry(action, gt, hwe, mmio_base, sr);
>  	}
>  
>  	return true;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 2cc65053cd07..e374b57a066c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -322,6 +322,27 @@ struct xe_reg_sr;
>  	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
>  	  .read_mask = 0, ##__VA_ARGS__ }
>  
> +/**
> + * XE_RTP_ACTION_FIELD_SET_FUNC: Set a bit range to the value returned by a function
> + * @reg_: Register
> + * @mask_bits_: Mask of bits to be changed in the register, forming a field
> + * @func_: Function that returns value to set in the field denoted by @mask_bits_
> + * @...: Additional fields to override in the struct xe_rtp_action entry
> + *
> + * @func_ will only be called a single time, when the RTP table is being
> + * processed.  After processing, the value in the reg_sr entry is fixed and
> + * will not be re-evaluated.
> + *
> + * For masked registers this translates to a single write, while for other
> + * registers it's a RMW. The correspondent bspec notation is:
> + *
> + *	REGNAME[<end>:<start>] = FUNC(GT, HWE)

I think we could avoid duplicating information in the doc by referring
to XE_RTP_ACTION_FIELD_SET().

So, before "@func_ will only be called (...)", we could add a paragraph
along the lines of:

      "This macro works like XE_RTP_ACTION_FIELD_SET(), except that the
       field value is evaluated by the time the RTP table is processed."

Then we can skip the last paragraph, which is a copy/paste from
XE_RTP_ACTION_FIELD_SET.

The change itself looks fine to me, so, unconditionally:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> + */
> +#define XE_RTP_ACTION_FIELD_SET_FUNC(reg_, mask_bits_, func_, ...)		\
> +	{ .reg = XE_RTP_DROP_CAST(reg_),					\
> +	  .clr_bits = mask_bits_, .set_func = func_, .use_func = 1,		\
> +	  .read_mask = mask_bits_, ##__VA_ARGS__ }
> +
>  /**
>   * XE_RTP_ACTION_WHITELIST - Add register to userspace whitelist
>   * @reg_: Register
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 1d7c63d0ae94..b78092fa06e0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -30,8 +30,14 @@ struct xe_rtp_action {
>  	 */
>  	u32 clr_bits;
>  
> -	/** @set_bits: bits to set when updating register */
> -	u32 set_bits;
> +	union {
> +		/** @set_bits: bits to set when updating register */
> +		u32 set_bits;
> +
> +		/** @set_func: function to provide bits to set when updating register */
> +		u32 (*set_func)(struct xe_gt *gt,
> +				struct xe_hw_engine *hwe);
> +	};
>  
>  #define XE_RTP_NOCHECK		.read_mask = 0
>  	/** @read_mask: mask for bits to consider when reading value back */
> @@ -40,6 +46,13 @@ struct xe_rtp_action {
>  #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
>  	/** @flags: flags to apply on rule evaluation or action */
>  	u8 flags;
> +
> +	/**
> +	 * @use_func:
> +	 *   Internal flag indicating @set_func should be called instead of
> +	 *   using @set_bits.
> +	 */
> +	u8 use_func:1;
>  };
>  
>  enum {
>
> -- 
> 2.54.0
