Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1229D64085
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE3610EA34;
	Fri,  8 Nov 2024 20:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXaQLjL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AED10EA34
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731096723; x=1762632723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BSDtYFZv5TU0ywlqPXewV6Afzmi4BQXkA9Ja4kavrbA=;
 b=EXaQLjL337YtTs97bQN+Q4dtikW5Uq1ZujW3g5PfhgQnizvQO+9yv29y
 vpwneFRzt9eho0Ro/0aGjEuV8zm8MiUNqpWpuwlYG2jH9WaPqDaI7S+tN
 wF4wAxcmI7e3veNcQi06rM9En81uG58j3ps83CsQ3QmxAwbj5rgsm+hw4
 GjVEGx2ZBYK1xRQcAlFMlhWDVYfXkf0BZIMnJXzR/bR2uBeT5MeCTwdMt
 tX+L5IUy5aUWfBZgZjZvln8ymmTMmKLn7q6Nbv7YABucK/Cl4XIhczw58
 9s7EQkLMkKZs42xjmN0DpMDIiX7qWUsMmCdlPQMHUuQo9K/3HvGLPTxan g==;
X-CSE-ConnectionGUID: h5jsyzW1TkCnuKio2wVOEA==
X-CSE-MsgGUID: n1q9SFS+SaW/E3wgK6ykWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34779527"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="34779527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:12:00 -0800
X-CSE-ConnectionGUID: hW8nj3jIRpeuH2z4Z0ywHg==
X-CSE-MsgGUID: OZSlCaERRrKkOQtTgU6tBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90828786"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:12:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:11:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:11:59 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOkky4RgTsDTbO47DdlxP3zApnWMhxd+MzFRkPh/REOFvyJyBBfuldgvf9P/l7uehirbOc/uIxNby8pbrg7F7Y4kW9/BvmeG6TU0bJuDUUniWPnPRHj8p/XyVah8vicJAj1J8c8rOX7VUZ08QmQxIY/ken7lI7VzHp4lBMfZqDUM4h2Ei5H0VF5RfB9uGbbhslVfShoiiUOfU2qIBzdCUBSW8JtqOVRI5X2gobiOU+fyi+QE6rz7UkJjWFSfVi+5VAUU3KrNX7KZD9UXjq6AQhfWiNYIk+NVnsnHbQCeQAPYgkYpZ9tcEY0sMNRjjomsORa48cSAoW22IydhqhBfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhdilQo/z+bZozq46GzCP7/nVc/2iLbe/I9dTA4qHvY=;
 b=ZsFhuf/lxcoVdPeMuHYU8TqisWrWSfajFqhZbXsdUc72tCfShtTwWNHH15K4H5pwqNXitp1m3vF93+CisTY64a+4wX5MFOKNAypCz+QjQczxkZGNe8RFS6ohlFt+nSKEiov4/vBn7AluTWosYMt5zyjSiiN/aVYnabe62dYq8+JbHmmM7REyouikAMjMHBVM2m/nE6TV8TxoXRuJHdhAaaTi0FABKzLw59I7fsn8MlBhScSrDd3gwVpOdu8E0eYa4xL4iOVl1pusV7FANzew0VNnqM7tpjbIw6Wv4ZvY3ZxEY3ruxkfyGEfJcDaTtjGRl69IhlWZM08pCfdG2OVQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 8 Nov
 2024 20:11:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 20:11:56 +0000
Date: Fri, 8 Nov 2024 15:11:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
Message-ID: <Zy5wiFy_ZtrNzZtK@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108174312.272792-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:303:8e::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2f87c2-9adb-4277-f521-08dd00319806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?87RB3bRpba1q1xDDJxXtIA3ZyVeVhjVS/VCT3U6bGlxFcLjig5xGXzPM+lpn?=
 =?us-ascii?Q?bocqnjngoW38+lydHg+SDpmwhzJNSVAFPO20SxMO078hNIS17D3jOXwUbMLS?=
 =?us-ascii?Q?cUU1rfDEsCHJ5xLZ4QgRosnGJTs/ctpkcKJosdpQrF2OODCAPKhSOz4Mt3va?=
 =?us-ascii?Q?fNypj1KeOk/tuv2EaVt0+ttWVN0KUUNEk1Ogp/UCQ9MG+rFEr9Lk9+4W6O/H?=
 =?us-ascii?Q?I2KIXA5VVjbttSwtSuoeAmHqWQiOZUN8sSsZlTv7D0PKKNrfKgFz3Ch7iKYP?=
 =?us-ascii?Q?o99G6KidjNn+zE00l05rx2nSksuwmNnItXeZnlzyBwStvQ3GqZpfBlkYukSW?=
 =?us-ascii?Q?IlYJpc+4oVlNr0T0UorpusMutfyhldOh2lAZzmWtNEyjiuFYMPDLUqcEx3r/?=
 =?us-ascii?Q?xINX/4svGQMePgcg3casEcVwOcFdoxTJLIXkbFSzw1+4cLzGj8xGIH5WeGq1?=
 =?us-ascii?Q?c3rmtxJepcoEyZOBCRFrZg0C42RSpDwln7CiB/7fFSkTfmgS/QrM4GTGBo2E?=
 =?us-ascii?Q?SojiAhcpsXgMVqWjbdSOrbeIdKY2p+jSy5We7ilpaSa5DQybkML2JSD5PiFG?=
 =?us-ascii?Q?3Rv+8yICTM04vq19uKQlBo5yK5o0krFeK8iIES5Kek5ZxWAfeNBYhCIIz4pf?=
 =?us-ascii?Q?GjSQ+KqIz7OykS6hypWzTQaux0fLTT7FYK4kBX/O6Indp1AhgNgI8J4SsQXw?=
 =?us-ascii?Q?igzl6J8xF7l+PZZMub3xShADIY3meq3yb9Ey0Kp9YUnvriDSvBAD5SYS5kHU?=
 =?us-ascii?Q?WvlXyn/EztzR5tA1zI2U0j+Bxq8MsO6YQBbdBROeVrXn2pEAQN076zfqWO/j?=
 =?us-ascii?Q?vwDULGqWm1RYhvoXT+wgw00yingQqRfHrNcA7f0dEWqTFP+ZgDJNe4pYyqpK?=
 =?us-ascii?Q?h9k8ODoFH7ODntplqBfkyTb57tIuQhdahN6pW2jRfS4h4XB9XOP12/Gh9n4y?=
 =?us-ascii?Q?+ZAl/hpRvVtc+HcH94zl7d8pk2tdOstkcNUUO8C+hNrB4I+VtN27dbo7HCx4?=
 =?us-ascii?Q?ayHeFU1AGvzLatweRJa9FR+TV+V+pp3bqJfyvW/jueXnE6glPyks+x9+8TBm?=
 =?us-ascii?Q?eU3Wx06rjzo5bEi1Ba1D90Rzir5T+bejJKXguABK0brkRj1nGyVXqSXg9Yjt?=
 =?us-ascii?Q?r6DqLbTwAfoaNegKFjJRRc6z2PUXf1gOZvTNgBZUX4nf2/OyT/umWZugKNBO?=
 =?us-ascii?Q?59qhTQQgYAaVNVrIJyhjpeiefFv3ec5/8zSqKScIEbdDqyx5RzcWcg42bWhS?=
 =?us-ascii?Q?ILUFFAG1yB2qgdkB+wliqEUlchndY4lggSsnrYPCcbN9xSKRMTpwpeLQGUdi?=
 =?us-ascii?Q?fbwmxAKTnTYL4piQeuOaRvoQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5isbqsrftN0gQNZ2pTb1YcYw+40LtW0TDNcJOYLUTlsXUjyERRkfcrEcNQRH?=
 =?us-ascii?Q?mbIUMZT6lk99a2i1wiPi23Ua4nq6sOZvP70AamHxryMtG9Y8fEevmG7yaEdH?=
 =?us-ascii?Q?PMC/W4/WMHLnaoxVB/byqT5hOlTVYha8hY63OZcFkx9fW4p/q9PRwzK+V/2z?=
 =?us-ascii?Q?X476JbSGNZU4+Sw52oLSF14DglBij0ZRFwjzP5sM8J2mY2bztXqQUkI/usyU?=
 =?us-ascii?Q?HRX8HAUFdqDsYL85g6sBnojbTjdtW/J0EWR/jX8aMV8f3LZ+JD/FdOp90PHc?=
 =?us-ascii?Q?unrU6CzS9s3HiAoWvwqu2ZjNjI7Fh1tv/lXN7YYvueGq5tPujo5R3HX9JyEA?=
 =?us-ascii?Q?CWhFWYFjuvvtwwysuD+zLZf7mC0KSm6OB/WtuYlVBYvi1GLy4lstMGaxdnyR?=
 =?us-ascii?Q?GubVjUj4L+oZhux6mnel48t6KtdryUeYQuxev0YpZz4oTDBzVz/IUQu8aHdv?=
 =?us-ascii?Q?vUc77V/VaxXympEW1W6D+qZgS5YGyjaMOZZRpTnpYLTLFzao5QP4z96zJVMV?=
 =?us-ascii?Q?hNQVARsJ1fKB7fkt6ryAmbc5f4sxkqWQuyhc7qssX5arUsfEBsrdej+4ZZKC?=
 =?us-ascii?Q?dqkIzpVmKEX/h6A77ZaKuC3dyMtqhRWREQeZVzEHOViSSlbkmnZ1dC2DM1UF?=
 =?us-ascii?Q?ihH5qG2Zszny/FXUz5NP+q0DyF14IcY5p8NmFLOAZHm9y9fx3N3H8RiA2+Aw?=
 =?us-ascii?Q?xGZCyLOfRB+prnIvhRJEn9ESRNDrpTODOgkWuAUs/rByk5k8k3hV+cRsgo8O?=
 =?us-ascii?Q?BI0SD58htH6ietIHq7yQXP+IleEcO6+BO4SFpEPw/2R/m0xfL6KAJWuQjZ5B?=
 =?us-ascii?Q?VrvfSh6iL0EHkgPJt3j2YzqtaY8Uu473hzY12DoXGpvR/ZTluuhP9zURN0hM?=
 =?us-ascii?Q?4wDXC8NKQtPA3xDJ6onD2RuFLIGo1f6jeatdl+S+im1h0JiGl8VWiKPkhuMk?=
 =?us-ascii?Q?/IqvEIjcrcL9rRD+aQSzRvOdn/+9qvchYdRCdu9CsMy/AmfaX4xbLtq/VWml?=
 =?us-ascii?Q?DGICM4NgYHjt652+WjMaT7q5NlPAqggIAtT89mq51Hg8YOR2EW8xboRwvI+3?=
 =?us-ascii?Q?4O8dv4PMPYypcRnnQ+yui6XD++DgeAfXRAv//gGfvd8gfD1h5TsCRkuNVKab?=
 =?us-ascii?Q?ZHTt7c5fen2ArRzqUigeZyBTc3HdcF+kYhA6bi7uD1CeCOvEZC3wSVkjyqxX?=
 =?us-ascii?Q?WtXjSg7cDYb5CinZWqc3ek96igFRZmkSii+CtuNpijHc0NW3fxXTfbe5OHRt?=
 =?us-ascii?Q?2JyMiJhRpQBEt9mKB8P7oIc5Yl+pkc547LNAeH3lJ0XtITz7+rOFZj3d5mmK?=
 =?us-ascii?Q?ZjorvMzfK9/7/1+HOmW9ha3io17BEe5lcwDNDYGE9AupwiOfbaVJT/tHNYok?=
 =?us-ascii?Q?pD/AzZvF1nXUMeP6/zYd0tizO6U6UEBAPks7nL0JJJjZN7S/n2JPu67B5y3E?=
 =?us-ascii?Q?X+4gxLUdKm542QpyYqECgvgOkoZEVLRPYRR40ccX7BbYQRADUISRT1aRpxAR?=
 =?us-ascii?Q?a+IrVBvHb4S9QDh5L/87qFgFvgR8O5ADulqOoOd3I4grQrlFadquOxBxJSyP?=
 =?us-ascii?Q?t6vRB3zWNSPd6RRgpH9CWNICBfHknZs96ktpH6hWkSxeJfnHAQMkQGZRFNrx?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2f87c2-9adb-4277-f521-08dd00319806
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:11:56.2543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bMaDPrKvmmmxEXO7NFg5dpPy9+F5PF5YBF3SXA8IZAJUAzdVdLt/0ABSfsv0HGqviHSgoJ88DXb/zYFsooyDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
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

On Fri, Nov 08, 2024 at 09:43:06AM -0800, Matthew Brost wrote:
> Add helper to compare ring head and tail to determine if LRC is idle.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e0f86f3778b..e7257c681278 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1705,7 +1705,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  				ban = true;
>  			}
>  		} else if (xe_exec_queue_is_lr(q) &&
> -			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
> +			   !xe_lrc_ring_is_idle(q->lrc[0])) {
>  			ban = true;
>  		}
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..e219657535cf 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>  
>  	return lrc->ctx_timestamp;
>  }
> +
> +/**
> + * xe_lrc_is_idle() - LRC is idle
> + * @lrc: Pointer to the lrc.
> + *
> + * Compare LRC ring head and tail to determine if idle.
> + *
> + * Return: True is ring is idle, False otherwise
> + */
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_ring_head(lrc) == xe_lrc_ring_tail(lrc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..9d64cedc4d14 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -78,6 +78,8 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
>  void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size);
>  
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
> +
>  u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
> -- 
> 2.34.1
> 
