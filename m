Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D557CCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918BF10E108;
	Wed, 15 Oct 2025 23:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fclRn8j0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD510E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760571571; x=1792107571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c7PTR8Q/KP/WCObD5QCiyBuNYTS1ERy+3xS8JiqM8Zs=;
 b=fclRn8j0xld80Bz04Mz+S3w9dbKEMxgRbR77b+ICpkawc+jFb64CB4yp
 0pwhuFvn2rWHsLW/+tlw6KxS0wzGK47PEjpR6hV/TafH+AowVQQZxXjMB
 1l+ALKA+yDLFSaLPJ7GMlu7D7SVn1/Hqm3VCBltpH6GNGxxE8mVvh640+
 6aRbWC9zkn5tUD42MSyc4EGR9nU+aDRg0vV5riJKyKdDb02KM0jVo6Ihs
 0dpTEvfzzDAqoItw0UKw5OHSTVB8xANfjiZF1EK++Z2gN71VUukB+0oGK
 2M7IrYry83/LImEInqckpq25xZ6wocYh8ozLlvgmgK0mSc3GewmGWHAyi Q==;
X-CSE-ConnectionGUID: 97LDBn5gR+WbtoGMlveJUg==
X-CSE-MsgGUID: xDobvMcCSku3NGDMPdkFbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85375093"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="85375093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:39:30 -0700
X-CSE-ConnectionGUID: 2SbQo8lfTpSIJNIpp/hUUw==
X-CSE-MsgGUID: rv5Xrov7QLWX46SWKaUiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="206005303"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:39:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:39:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:39:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbohgtmcLjJjksyA/WhyCgTTOw2mk3L6cUJn+EVPJfCrVVCPhpjnC0N0oqUpIT8zmrh/BFBzcaP/SGFHwM75IEF0aSlqaOXkQ2kbUOifRdTG3qv0lF/x/nYLVKVeJnVqulEfik9+bj6jQjpHs57SNtzQfjP2ZKNSx8NtUPkI901UJjfl2bcx3fmqWsBYQY5EpyKat04jNmjM5DM10n7FzDT+jED87mpNhePYimz4I/9JHMK2S62LOv3tnPzeCIRoUhB0/bT86ViCueeCEOINODZFcNrz+5sQdCCdPsdN0EY8DePBTxqyEvDlBgT5taTkbgAJ9zKgJEaWkv162xjSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKCBNpaws2po+Q+o9tVqRPewht0rhFP8vBoh3ZPoTko=;
 b=ezZV8z2rv6nb6mjD7SyKLECGAVx3odUpkKC1nfPhIhR/FDkwNop0OizGsaWe0WsNplX3phCyNnBdG77d51Q50+iEvMNiuaHQ2VklaVwi/7fg/NylUrw8aUszEmRml4BZYv0ijAdPmed77ZUk29sxvqjlkkAYCBJCaytXaePSVhkL9qjZz7NTTyv4DQeeCqBbJUixyVKlJPonmIGMcnnljAbAKtuNUz85nNP7Db4hIjJvfITfhBMpryhxeFMlmW1lsaQHGNXOqBYXim9L5MHeBVg3S10swWGfpwI7LAdJIXI1X06hv2vxmeg4dnB5OcEevMPZqG3nN1FOIpgPFO2Qug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:39:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:39:25 +0000
Date: Wed, 15 Oct 2025 16:39:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 17/22] drm/xe/irq: Rename fuse mask variables
Message-ID: <20251015233923.GK5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-17-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-17-b9189b3056a2@intel.com>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1a4cc6-bc9d-4cb6-8176-08de0c441351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mjaMV9eoUen/T00q97EUBgjAKSMVsvv6mau2NKI3GV53eaOhT7ZkCd/w1of+?=
 =?us-ascii?Q?VZKCojhv+TqmyZgAE5vjLnXajdnS3v71IYRepgII23SQHgwT5g42BgbR7STP?=
 =?us-ascii?Q?d/hff65+2lMAeW2oklMmUuaOCfulSohE9/1TT1asXRIferhUeyMERolB+vgJ?=
 =?us-ascii?Q?MI2TAJIol3yg8ADI4pVpAmn/DhGKlAI2EgZI0/eI03/e3Fv+bw2YCSS5U89P?=
 =?us-ascii?Q?3CCbZ34Bly9KeXdUaPmncnBMfPDarJiqIXM1YKG5W48rkxSMCrDQ99wlzQdI?=
 =?us-ascii?Q?Q/5nTWB9Ad3tiDWWGo/B2tSOj0xKaskOKq5uwkhzcsxnekUMeTtncyCNW+mD?=
 =?us-ascii?Q?S2BrotikG5cthL8V1TPeEaw9361m2KfJ/ARY0RqV+VeSzD+mxXiIU4hwgqbl?=
 =?us-ascii?Q?gODbnBIYAm8pr+V297Rwe2FmSc1nX8GzdgXr9ATJbZ9dCb0VAz7r2BwRJ6IC?=
 =?us-ascii?Q?xI9+rmO4qkmCYRlj8vV5M2dGT8wU+YuT0KnWZbThUay9Tog6R3d6/5o+FJZU?=
 =?us-ascii?Q?B4FNhWPoY6Q58oQHAoi20Tk/Tn5+1VBp3+wEkQT7faOzm2JKKSeS7BKemly6?=
 =?us-ascii?Q?tFtAxkyRTJ4Xw3BSUi+DWjEkktT0TPIikWoUG3SY7NNiFLOI2ZVILSGQSL5b?=
 =?us-ascii?Q?qJq0mM+SLo35iIoXHi3XqijkD4dMz2Nt/Xc+7Vuybx9QLggAJQW3aZgwB1Cc?=
 =?us-ascii?Q?HTLe67ppmkrASyFA8HRQlHbB0C5ZT5g5QKD1d2yVo8QLKomWwPfXn+1W2bqw?=
 =?us-ascii?Q?esF/ZrMraGZIJwT0wGSZIcCdAgduP3hUsW9ejzfSlJM6LfKQDpf4gM4oGfez?=
 =?us-ascii?Q?7T6of/qwu1iI4QlcqW6MIgsQPgzeS1myFgE/hWuEzSseDmv3Hb4wwB67FlcC?=
 =?us-ascii?Q?VHnqkxd6sIHjLimf77AS4F2Lep9D9ur3/iPjPDgOx5OyEtYfENb0z8pOjghc?=
 =?us-ascii?Q?mNI5gpusUWN889okgwUXTu4x11/MLLeDQ1SK3cI2gE3wc/RFheZ2t0rFNXZz?=
 =?us-ascii?Q?eNKRwfaIAKoeUArehc7OjxJ2wsAERyX0Gvr+NqkLnUYCgcOKkyNxf2OlGbtd?=
 =?us-ascii?Q?fD6jxGZhWon3ADd6eVKiAQg1wUTv7Lnx0pznDIDZmkhPrEH8B38BtBx0qWGy?=
 =?us-ascii?Q?MumNae4bP3q0U+blTprRJtotvyfxFJ+ABHGwzafjjp7gDEPFeY5ArI58iNFF?=
 =?us-ascii?Q?dDNjQV2T7x7StV75yqk0XqrTfnJECwRwC5kyQv1AYi6HGUn5Pa50RJy2AnBp?=
 =?us-ascii?Q?M9CItSOkBAIl405aRnQtnLtqa98+WjhNeqYeaWjY6vnvSHBZsutf34dRLzUY?=
 =?us-ascii?Q?/4gAvBca7v4VtBzxFJBdGX5L9/HFnt0Z71UerWyPEhWqs+w0EpiD35Qz/nuO?=
 =?us-ascii?Q?L96WeYrp58Lc+sbHXgLLQGWH14kFV+bP0jcMZfGEcTX+zrmq+/hSOUpYcZLA?=
 =?us-ascii?Q?VnXTDR8xhjyVueN2bRpwGOtVVHAmK1Qj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3TwseGwn8YQXh9B2JIVCgE6F5dk5IYdvfSAeUlVWjzo7YQlbMW/3XWdYZZQ?=
 =?us-ascii?Q?StoMKBkKg9WfaD4ZdEktwjzik7sJlRUoE7evEnekflDPJBPjlEcC1ixGxWeZ?=
 =?us-ascii?Q?wUkfdHp+lXn6ERtKqlviTEK3lPzU7IXFuFjANLlH9ftQ25+6UfTYkNuUo3OZ?=
 =?us-ascii?Q?hyElgtot7mM1bXw7QKlmMSm/Bj7rLM7lcqYTRjD9E+LE4nnswHTcjMC4F9IF?=
 =?us-ascii?Q?/KqnNbULI4LdXjnziIWfu4aYaIVhmRurjsy/7aYY16T7lcst71DWZoovncV1?=
 =?us-ascii?Q?6MqNGnlqZtMixOcAeSo/P1qLJ56MuNhKVT78AKklYfkA9Gcr5xieRlazVlbg?=
 =?us-ascii?Q?/n+dWnrLFXT95JYy/6qPxgEOhADfzEuc2FlzMtqwMw1E13C7LUk+n/SnNSkF?=
 =?us-ascii?Q?8dADb6H8YsDm55uO3PphOn44z08EPv740GTBx6Asl4NT+0hefFsjASSa/Ugx?=
 =?us-ascii?Q?WExrdUyckL1SLEn7hdVl24ucLOZBwUzoaxnU/JGV1Z21rZWpJLNmCjZXmS1B?=
 =?us-ascii?Q?oEEAYx1N1ing4fvAefEt97Mro614FsUsom5B7kb4c8EUhHJl1G6yDtFsl5S/?=
 =?us-ascii?Q?KfHZ5mBkLnO5yywAfDPLJ/ekabkrB8iYx/mxBNeuZC10nAaNlAXq8jwCYKt7?=
 =?us-ascii?Q?eUCqM/r2vOIGJpnT4cHQHOKnkviPJMlH8AoVef7jic07lCmvKr9e1D/KMtom?=
 =?us-ascii?Q?FOWg1bOO3LQhrPXuATFzViQLY82eiPV3xTOQXDf8RM6XtTAr6SimOtKPMWFl?=
 =?us-ascii?Q?2NbTSPclMgKBVob/mEzr0q4zBzKHUkFy0Tlu/s+X6es5csnd8Csv8MmrqYxN?=
 =?us-ascii?Q?eD3vdK6eFTDKCBBxEl+iRLKPgybklrZB+mwm75EQ4N8TrIaUvtlfYeh1kJwh?=
 =?us-ascii?Q?YmYN99IvZ5XxHbS0zpwbES8WC9RhMK3X/pJP4ZiqAr1Kb9KhjlXBViJNglHA?=
 =?us-ascii?Q?MNBAZqUSgT4OY/cRjzWobkRVkrOKPiAEBPZnXT5a6wZAnr05+eHrxvLpO1Yl?=
 =?us-ascii?Q?P41rFT5pRHqoA8uAKpl8BohGN8AE5iJqbIeMh9Ha8VeVudNhx4Jb+9zdkwOp?=
 =?us-ascii?Q?6WwcvosY35I2+I2q8UUg1kHgloBobXM/JXMFjITQ0ljoS3p1WUeXy8DXmRg8?=
 =?us-ascii?Q?NP5JjwRjDhUGkXHr9ztqyrzGXyz2WX9aKrVHsS05I2UjJee7kKTQqGTVIv8J?=
 =?us-ascii?Q?eFof4xvsTRC+RdtriPPzlMY9pf0oeE0xeX3YgeejjwgST2OlE5JPGYihNKfs?=
 =?us-ascii?Q?5/pyFMv3pWZc5my7PU7IbvB0jegwxKx1gPY/gdrhI0bK7cRswmH4zfp/DOTo?=
 =?us-ascii?Q?8r44JgeHAhPrt4msG7jhoLoysB/iisV6N06nH8PooMIAkKLB4OU1u05ZwQ07?=
 =?us-ascii?Q?fNd3q7vhvHr6RRU6cf7BZNOMRPEOV5QMFtmsn/d6Sv6aQX3cylDTakJD2Nbm?=
 =?us-ascii?Q?+DgywwxGgEx2KNYijp7YPQfCL2w0aOB2W7DLoGRf4ibmA/7fOl17zCSYkrDs?=
 =?us-ascii?Q?7e77P2f5s8JnZwX+Fi5Jx0rgVVUOmb0Ic6qeIIlCF7NQWy3rNmpdqK9mFe74?=
 =?us-ascii?Q?fr2cThYefjcax7icy6ONX/v34/ThpyMnRIhPCfpOpnmD0Cx8OcY6R/jdqpnI?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1a4cc6-bc9d-4cb6-8176-08de0c441351
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:39:25.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itrFlIhxpg1nqzIxsXPCwfFChNQ3AD8HG3qlCyLyAI6ZmhaxRIOY1w7HXdn0WSljIWxw5AdsW1OsB4cGgGJj5cONkAcI7m1AH973GwGTM+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

On Wed, Oct 15, 2025 at 03:06:32PM -0700, Lucas De Marchi wrote:
> It's confusing to refer to some masks as the interrupt masks and others
> as the fuse masks. Rename the fuse one to make it clearer.
> 
> Note that the most important role they play here is that the call
> to xe_hw_engine_mask_per_class() will not only limit the engines
> according to the fuses, but also by what is available in the specific
> architecture - the latter is more important information to know what
> interrupts should be enabled. Add a comment about that.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 838fb512b7779..9c3a85c4585ed 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -139,7 +139,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_mmio *mmio = &gt->mmio;
> -	u32 ccs_mask, bcs_mask;
>  	u32 irqs, dmask, smask;
>  	u32 gsc_mask = 0;
>  	u32 heci_mask = 0;
> @@ -157,36 +156,43 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		       GT_WAIT_SEMAPHORE_INTERRUPT;
>  	}
>  
> -	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> -	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> -
>  	dmask = irqs << 16 | irqs;
>  	smask = irqs << 16;
>  
>  	if (xe_gt_is_main_type(gt)) {
> +		/*
> +		 * For enabling the interrupts, the information about fused off
> +		 * engines doesn't matter much, but this also allows to check if
> +		 * the engine is available architecturally in the platform
> +		 */
> +		u32 ccs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> +		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> +
>  		/* Enable interrupts for each engine class */
>  		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> -		if (ccs_mask)
> +		if (ccs_fuse_mask)
>  			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>  
>  		/* Unmask interrupts for each engine instance */
>  		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>  		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> -		if (bcs_mask & (BIT(1)|BIT(2)))
> +		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
>  			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> -		if (bcs_mask & (BIT(3)|BIT(4)))
> +		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
>  			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> -		if (bcs_mask & (BIT(5)|BIT(6)))
> +		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
>  			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> -		if (bcs_mask & (BIT(7)|BIT(8)))
> +		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
>  			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> -		if (ccs_mask & (BIT(0)|BIT(1)))
> +		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
>  			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> -		if (ccs_mask & (BIT(2)|BIT(3)))
> +		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
>  			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
>  	}
>  
>  	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
> +		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
> +
>  		/* Enable interrupts for each engine class */
>  		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>  
> @@ -199,7 +205,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		 * the heci2 interrupt is enabled via the same register as the
>  		 * GSCCS interrupts, but it has its own mask register.
>  		 */
> -		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
> +		if (other_fuse_mask) {
>  			gsc_mask = irqs | GSC_ER_COMPLETE;
>  			heci_mask = GSC_IRQ_INTF(1);
>  		} else if (xe->info.has_heci_gscfi) {
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
