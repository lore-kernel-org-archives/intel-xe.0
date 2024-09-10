Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3A0EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E033810E8D8;
	Tue, 10 Sep 2024 18:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFwfcZVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9017110E8D8
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991989; x=1757527989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vXymaZzUDf8MGwUgS88l0GGdWCcudENBM+FQEHx613s=;
 b=PFwfcZVnrSnmNRQ7e9m87GoMYz8HY8oYd2hvFm39ZV+3h83GYYhoS+0T
 QLPL4VtAvJlNP648/22G6P0TiPXlNroQOIN5QwOIOJEh0JBXy30zJv5gQ
 uAcjXGOB1KPBuW+E1IggHQ+041y3sMiVueKKgsqbvRltaDnruGyoj3onc
 9O8goJDtyKMIiucvUmLF2A6VvEhizXbWH5n+6VtSShxZoER37yqOnmV/m
 kWshNiZr8KElPLHYRaFiZogp+XsiXtJSLP6JUouGgFZ6DsWelHkwy34nO
 LOrxMP47azzoL8+Am/Yz4noJ9DTtYu9MzHa9vnO7jSO4Pkk4im1TcDW/5 w==;
X-CSE-ConnectionGUID: bXuKXjBFRLiOQD8qv6lzVQ==
X-CSE-MsgGUID: 8Jmw/IYRSVyKgQ2ddogxxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42237212"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42237212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:13:09 -0700
X-CSE-ConnectionGUID: /uRxNXeKTtuI9a8ESgDgxw==
X-CSE-MsgGUID: CqfzSziSSLacCKFO1Y7gqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90388510"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:13:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:13:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:13:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:13:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OemppbDz7eRrpz/MwjR74jhC0yVtpHP+D16GU2VCCPHQbaN53UmRE4h0jkeYCv/TOn6nkS53WtwEsl44FONjp5s4laF/j682pq4xi6Etn602If09eskzB1Y5BY0ckFYbuvU5W2s+bvHfqiEnC2PGR83GR9pVRIHvBARAs8CCIHSeeLTSA1eTQXlkc81FQRGNURxvY/mTYx6JLe34SfCvb4eeDS8QRg0t2VEC/cgIksqemaIi46bMeyiXMz+fESBl8nG/wrpST7L1arPsPaX637EseC/dIdrox9FTfk521VCatc3TKVb0t8ugxqoJapc1Sr5GddOAOW41N52z52js2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8NuWs3OHJ0A8P9dEJ49C4ZxoYu3qXsXDvvTwrimde8=;
 b=BEEg2MMEoMDOE2H8dlkGSobd4x98aG07cqli8krFZKoLil0VNgtC+5I/xFIgd3Df5k72rbRWoJy5iMVZDxWsUcPviuJjDJnFGG9XPOqD1ImXTdn57U8C4l24r4kCbh6f4LKkqg7Pf2dgQeRW19uHTMOYCe1/sVs8WFT3b/Iex+VG+IGYPzZLuxxc3C9W61OQuRzOpK73rLc80yrgr3OP23mRHtN00tM4nfEGgoRHQ4FNg9BENKCBX9OE+TDgIdmS908qQgUSRGJ0Fe1fPb7tLnn+sycio/nALgXMPOdnNU8W6VLIXfnS1viik73HNXyHKC8ozqYFAQ2TQ7CgXoYrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:13:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:13:05 +0000
Date: Tue, 10 Sep 2024 14:12:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 39/43] drm/xe/gt_idle: Convert register access to use
 xe_mmio
Message-ID: <ZuCMKxDXudfDNcfZ@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-84-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-84-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: cd56cf5f-1846-47ba-4965-08dcd1c43701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?INhryd2rHiP/LcONdvR7hKPamkatIyM2BL3yRzi+m9X3FjuBGI5oDtnQiBEx?=
 =?us-ascii?Q?jOZXvHCgaDyZ17Y6seBlBkFqcA5qoP4rMzbngAmXA3sR1qZTrgmCT3C6jJCn?=
 =?us-ascii?Q?Nl2vST0xTiic0I6X8kNMR28MgvDXQPVc5KQxvUqFSskbtH92lenrVjs9zYwv?=
 =?us-ascii?Q?t8tI9nyLvVeC23yrrv38H/nT5W55zeA00t7k7GZAt/guth4wujC0pTTCtlCX?=
 =?us-ascii?Q?YHh0uzKnjyYKF31Z1ucPYz/0QLZF9YrEKIwORP0jKx2CUdKgKJ797Q2IC/Nq?=
 =?us-ascii?Q?cvBI0EWuce2kcSwk253iOeE91SqlSUImfan6g4CCPq6g0tVHiLFV+3hAyFA4?=
 =?us-ascii?Q?v2Wi/35hGD13/unX2W+D7qNwmfwn/+cTumEBd1bpos51L5dcchp+BJfPPKhs?=
 =?us-ascii?Q?6pndw2oYY/nnGlvQ7Td8ArOvj9UKE9PJjY1nstwho6mHF8WnEQ4IV/9p1Tpb?=
 =?us-ascii?Q?5dssn/sLRR5CSQglDFDMo8YDui9XYEks8b2Lyvsqfr0CtKkBOYPM1ZOJ2keK?=
 =?us-ascii?Q?DNvsgztHy3jqgKI9qAItxpGN1ywcGtEAYWuC8ii+JvlgXLgWv78X1KBNzY54?=
 =?us-ascii?Q?MPwlt9j9kNeh4RypPlCTtJ1Komgm+QsJeeMwM6Xd9Fj3506a0XEF6npSkPOG?=
 =?us-ascii?Q?81Vu2YDXoSYrI4ql9yZsFv6qut10ZxM7yTX69Pgv8Qbb5nfrKdNbQ4kawT5A?=
 =?us-ascii?Q?5PyE+AAszqDvAxRg+eUtexnbIv2/9jEk9wYaM9aQ9ccG+YfrTu2t6mdjiYCV?=
 =?us-ascii?Q?etO5Vra485uinysbJiBtW+thYgo1Bau/cK/O8msBuef0nn6yDn9Gce7V4UHf?=
 =?us-ascii?Q?hh5grKIPSAT4xLzpP5U0WlrzZRLz68H9mncvXXrrVtmuIjtLjBOXNhWu4Smo?=
 =?us-ascii?Q?TGDCeUTmxSUCnyqDbcbSqtu3FCuF5PH/JqjFaOicSGmP9VQSqMtigd/V/HMe?=
 =?us-ascii?Q?S8Lc+rDnn6SYtBOQ+fGJIsjoVFM0/J+8IO4HV/EZf9sB2o+U8NC7OOX2St7H?=
 =?us-ascii?Q?AifuF3KVaApsOCXU7+5WYY9UQCz1J0PiqD0Zb1hJxdlnAz+PIiDgbfCtAEc3?=
 =?us-ascii?Q?IxQvIqyOXxVvLqcYku34RlpM5QJinIPF28/5koIkaGYMvS7vNCT3j0rzwLuH?=
 =?us-ascii?Q?P6JQtl9uKGCq8SvpvGw+wc5HcQBapjBp6ZypnK61/u4lfxYG9mB3EfZUF6t/?=
 =?us-ascii?Q?ujk74CXVKkW5qsZOmWAFI56xj8IhONK2gV31ImucNcQMwOqm5eGmwQBmKJ0C?=
 =?us-ascii?Q?CFjo0UBFIVmSppinuJ4LcFIfMEotEVcm0qOkToc49ZP0QHXuPB1YI/yFE0SK?=
 =?us-ascii?Q?jetxs8oa9R0zrZhet7ODnpWINICawvPAOxLg+aKmgVA2jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pMyBTWscStHL7mlxG65SuVZ6Ub/uC+u9y9ryYFLcY1C69fQ0vRK7odnY0Fv2?=
 =?us-ascii?Q?1GH9H89ohijNUECKSR8tgHlENRKoJ7tM/VNBI9BcIc+4OGP8McTJNA5cGLQ1?=
 =?us-ascii?Q?022hQ5gzVRDOzJn4410Dq4PEcPcqjfGW0YN1H5+x9/jByxN0euD8Nq53lpfu?=
 =?us-ascii?Q?AvO3c1pZ9dv+ER6vldiD+Xu9nM5jwKgaRqwuB/04PqfDJCZ5QMpXJGCjH+do?=
 =?us-ascii?Q?i6grwNK/qS5GMVq8AJgMue/ASnYbtPdNXjbng5viHqJnE5BIyS6XjeaiwldC?=
 =?us-ascii?Q?q9ZMyPO0vnL3Slb06GpR9rLJ7+3pHCGKEiJct2UUbShqSWd6gihEpl24iNBS?=
 =?us-ascii?Q?MN+WGoUsDjy8VwSdXWNZlUnP22F1kVTrJhJwQTULpu0sgwk+7yFOoTokTf8A?=
 =?us-ascii?Q?1ZaproDyTQlHnqnMpr5f/AfIenk+GR6cf4Hl5tYmxy6yyfFdKHpQZ7ktpiZD?=
 =?us-ascii?Q?sk45Gb70gEsOzva09XQl/YPHtyHUNPnBi4xRm4c1Lm130t9cwRp9FMX9Tc8J?=
 =?us-ascii?Q?TVyud+AbTN2YGy10ARuE+W7ETNdGq3hnKuUdGWyVGZ83R7lFfWawZgJr7/bq?=
 =?us-ascii?Q?qb5GATQk8OwrLB4Q1sVJhlA7XSj+3OsWzGD8kn7mWTaWX4gY9Tv1lQu+dUor?=
 =?us-ascii?Q?S/89z/+561wWeJspUc2pDBtPs74wq3na0UuUSgDr6qyvRFGVeCAOoJjHhIoc?=
 =?us-ascii?Q?NbSbb+gS7PsPBIuAWtdfHc4MS+XWUagGASGJnTV9LN5Wy3W9tiwtYahq+GST?=
 =?us-ascii?Q?1bYby5if6/nBSoSRQaPU96gJDaAuVfPSmbAE8XqQxEk2DPB3eZAaMqM2DSxu?=
 =?us-ascii?Q?gh+plbu+Q7vs6zjy87TzJm7sd9jPGFvOYqwSiCjW6ck6apCefyZerL6A92dX?=
 =?us-ascii?Q?eePnTAGQqGg3tyYWqNU7MMPhYNLUEzg3zNIxJ9jldzQijGl66fv8l/PSAR4m?=
 =?us-ascii?Q?YcdfYffnM2VbPxhY/KNdDDU6SQkByMhz8nSe57F1FR+N7EAYfKiWu7/HF5cC?=
 =?us-ascii?Q?G7Ili98tYa1S79f8zUYZh8Ygj+nKzyFaUTiy1V8JaecGCBKLiFh0+3uPe03T?=
 =?us-ascii?Q?PjfN5/FAac5sbE/ugEnrBUIaqzQv3w2sFkIHEFJWhTRZHlL1L9mqhgNsVZNb?=
 =?us-ascii?Q?xu0G31pd4j4lORgNpNpct58xPRo88lD7oMRvcdW193FHvWunVBHczE9qT4Wg?=
 =?us-ascii?Q?wNbgrJjhMimp8zqyZxy1lwjNhwWE5XSyUwIlRj5EoP48FSBO38rxD0PbqBCU?=
 =?us-ascii?Q?shjzjtYmFwSqEBVNn8V5fLKNPTOadE/n43cJos7RR9yrdMNZi2Us+JEsX/Qd?=
 =?us-ascii?Q?2qT7Cjkv1CwcEX/JWayA39TG1rMIt+jEVGVTeSbmMMPd/yhuwE6TONU7bdzY?=
 =?us-ascii?Q?6nso+yE4LrqTXri0xk615eQwlEaXC0TL6Q99u/LzHkefiBYrulOjC2nsJ6HD?=
 =?us-ascii?Q?L/7iFLOBDgensGdaKLpBpy1+WDNL+D0p3YiwIj/+w5PO66fL9pOeTuIJOQLX?=
 =?us-ascii?Q?/oWSTlIt7+GkVhTr42Ggw0zjtm0DV4PfmPVzFG+Q/IQuS8AXAQuwMrw/Llen?=
 =?us-ascii?Q?3pwbq31rqNTWTD4XDvp9cFYHfn2uCRXOgKFutgISwgCsLqeStV4+2FUS/bU4?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd56cf5f-1846-47ba-4965-08dcd1c43701
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:13:05.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ndVtFMbvBLKt0PgOf9RLX8v/EM8h7w0oLDER+AiYrEew1ylq9IL/ITDxz8bosjWhHdO9apy1DAZ58CeKGbI+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:28PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 85a35ed153a3..531924b6c0a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -104,6 +104,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 vcs_mask, vecs_mask;
>  	int i, j;
>  
> @@ -137,11 +138,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  		 * GuC sets the hysteresis value when GuC PC is enabled
>  		 * else set it to 25 (25 * 1.28us)
>  		 */
> -		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
> -		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
> +		xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
> +		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>  	}
>  
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
> +	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);

3+ looks your threashold indeed :)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
> @@ -156,7 +157,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>  	gtidle->powergate_enable = 0;
>  
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
> +	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
> @@ -216,8 +217,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  		if (err)
>  			return err;
>  
> -		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> -		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
> +		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>  
>  		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  	}
> @@ -361,9 +362,9 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  		return;
>  
>  	/* Units of 1280 ns for a total of 5s */
> -	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
> +	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
>  	/* Enable RC6 */
> -	xe_mmio_write32(gt, RC_CONTROL,
> +	xe_mmio_write32(&gt->mmio, RC_CONTROL,
>  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
>  }
>  
> @@ -375,6 +376,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
> -	xe_mmio_write32(gt, RC_CONTROL, 0);
> -	xe_mmio_write32(gt, RC_STATE, 0);
> +	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
> +	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
>  }
> -- 
> 2.45.2
> 
