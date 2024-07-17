Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B0C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365BF10E3C8;
	Wed, 17 Jul 2024 19:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXM/1H1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BA910E3C8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245404; x=1752781404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UmMA5656oTpv1npLqtr4TuzTYgHHCgnnADK7001wWuY=;
 b=dXM/1H1qxvez3Ybp7Czk4SBkZEEYfXO6PS8iCCIS23iQISf4IPwx3ucg
 3+pC9VhKTDUSFIkuuwy17cIK/0I2w8Z+YG6ARDASpoDPPSikUv0AOzSTk
 QYAXutwtKXVCYLOiHzWqjboScAygkeHnxmnFBrOz2P6ac5CCS1c9dfGIq
 Y7NXVWDkyzk9RKcTwR77i52aHzghHc0qWzoYf0qAD6w6YXFCA8/deenB4
 BKniq/xS779PzJwv5D0rtjvvoldMYShGnvZPauODDIACx7VWlp1sHvg3i
 hvH9FZl1t2cHzNe3pTSHnJra9vjtgcIZewsODpJNWN0eOqInocNxA0VaR g==;
X-CSE-ConnectionGUID: /Sgd6FfaRE+WNah7yAyJBQ==
X-CSE-MsgGUID: OJe01a0QTiu7pR2UVvSThQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29929581"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="29929581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:43:24 -0700
X-CSE-ConnectionGUID: nge+DwOlRa2UDP3j25JbMQ==
X-CSE-MsgGUID: VKFCHzgiTLKuL31pOc4s4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="81149953"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:43:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:43:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:43:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:43:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/Ei4rh7/3eCHWNu4U+DHEyjRkn7/ede6QVqbzSdRa3dvpXFFB3k+G56yfzohxljDwJQBSWgwSPUyFoDwKl9+WKzfRkFkvpWeRyOFOK6SDIbMB0moTzCqkeQpiMyxNF4eVd2DmB6wyC0gjgoYZHZWPOoDLi5ZhZyp2jjz2fZZ7/aQ3sYcQRlvYk2iDSHUBIJpgSb9mWfWNS+rtgzvF8UhBp3ViDpU+6ArA81mUFoHz8RwpYg8wwghf+qDnvU0UYt6ihLhfmFf16ppailo1pqNLxmfoMDrb7hRyHDo4t3aTMlroTdWwgYWYjdA0fpMODR7153UpayPvoXBMuLd1MWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbaSY7P4SUtaQ458EPMBBN50Gan9+rbKEIhpx0ZjZkA=;
 b=vcNLMy91S879HQuDGiDAgb+riW1owT8NkCQHg8AYPeAkwp8YkVdB+r7rvPRSq7FLivdQ804Uo6r/PIyptcygJot1Z8YHZkDaSAbilCUtbTQf9ObOFj755fQTA+ED8x5oBWgjzkzv+4ZIUL2j9t8zQIsVGEBqBtWcTQ2sux4DV8a/OBbU4iudfzhMY9/h3jI/CVQS4SeAkedxKPg0hBAxLbtG15Flk8pe24FWZc/++uNIJFLDsiXRTLva3InBIANho30knbpp1N/5CQsj4BI7e/Gw+RhSJynipuWz7jDHfu6UJ64adkavs8RARGmqI10Fbs98SrCJGjCJsuFdIOdDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 19:43:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:43:19 +0000
Date: Wed, 17 Jul 2024 19:42:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <ZpgepGsNCzptMsjr@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0035.namprd08.prod.outlook.com
 (2603:10b6:a03:100::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbcc7f3-fb76-4226-784e-08dca698b5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q1QBZsWxq+c+6sO1KE6aVLuRttJD5Vbx15KB1xba+lgkW8eEa8vLBSBOLbPh?=
 =?us-ascii?Q?qpjcvw55EFjnbmouGwW5bwoa/GyA/dXBYOQ+XKe7T25Odb01f0elbmQbg4zs?=
 =?us-ascii?Q?5yQ2gF5N/h9K9PM2Chpd7TmRWQ2sF71Qv+SxY612AmMPetXsNE/DgucB5KXu?=
 =?us-ascii?Q?4+6KFf0PAXiXxI1lGAZChLDwYsbbEeJdrjgJDBkfjOX+Z4MQEMkjujVacfev?=
 =?us-ascii?Q?sNbLSmsgWy8b409dA/O1EhKc6ZDp0G7EYquYvYOoHhXbNlOIlOvQY1W5dwFH?=
 =?us-ascii?Q?KTe08Yz5wHvN/KHxyVhrTXjYbuff25rd296xwAC5rs+k3xdnCr1uzasO54nB?=
 =?us-ascii?Q?bVcOzv+Zul5zS98P+fLOaHicTzQcW1Qw8y8oxYl+6ab/NNBaeYtghemZjvXI?=
 =?us-ascii?Q?Zfuh8Uit+j/K0nVjfu1VECpA3Efktr7QuZofNGN/5XSiMHFDrXrx8JTqpM14?=
 =?us-ascii?Q?jftPodJodUS2aKDd6URNpFQM0KmlzZWJc++VKT6S80NAXGHklgba38sqRuWC?=
 =?us-ascii?Q?Yc6SKhJ16WgVEXououLMBu721pGBDcHPHQmNTc4HJS/ZLX/kG/nDnH172aP4?=
 =?us-ascii?Q?3RWQMIeXXM3OXSXHTCVbGffQY0aJw/kIvUKaEhiRQ4urK3JuYFjJ10dZgrfH?=
 =?us-ascii?Q?fwi6TtaLGwgQlKD5UQjD6npHjK+yP9cjIzdV7HtaqAeVieBwhEMSyamltfAF?=
 =?us-ascii?Q?aKA1KY5V/Vwt5yYRj1hCG2MXi6UcAX/OmKzXXq+L2hTLrSZ6HS0MON3/SS2C?=
 =?us-ascii?Q?2CyfweW93qs9I8ayj59TeVuT9CO3F53ENhuQhc8YeJXg7shd1AU8PWtfYr44?=
 =?us-ascii?Q?x5ryYqCbB5CRem8eJ0vd5m+t0PrJGuj0xIv8RYJOOxUM5hwpvetZsgixl3WV?=
 =?us-ascii?Q?nA7+ngyX3dbO8SEGZ6YOFufkISi7LY62GZ14W1W+ElktjNWwhQ6T7mItMi6j?=
 =?us-ascii?Q?ycI7dPKngg4WIwBIi9hHPB+drHNIkkDTIBBD6IQ/pBRmzJhdlZu8EhDEFq9+?=
 =?us-ascii?Q?mSNjnMTCjpNYuyi4ZmEsGjpVptFww4aiTfdrnd1d1VToYW4g84T4mUwhMklF?=
 =?us-ascii?Q?EemxsUN+vao5Hbiv91Iz9kwZwk3yeHKqxH8Df5d0einu4Msk4WKSPcupDbie?=
 =?us-ascii?Q?ca+3dQVQfU6BGt4I/rcF0Y5T2eKj4O0hveCw8huUcltyhRC5IC4uGE8CdDhz?=
 =?us-ascii?Q?cMU2X9MlWnFgcTPXmI30qwSj540aMd0ycmaIcC1y1KX6hHH7Cc/o1LyMCo0e?=
 =?us-ascii?Q?A0td1lMtsdYMC5w/GIuIE5F8x1+iHptReJjD3x9CeTRAhJS9Y9RHYb3qV/LG?=
 =?us-ascii?Q?xINIzWPpEbL6bRbZ7InwZjfGtAkH512tSJ5hEyVXd7/gJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETVxAlzdZW3SYbICzZnFC47E8VRyUKC2XaXlTIVZCv8WKo2poMzAraOD+kpf?=
 =?us-ascii?Q?Ay7NXcE+ShF2mo5A7cJiSk+CaHmSx8CjZNdpB6yp2sAKoST/tda526dJqI3r?=
 =?us-ascii?Q?ot8lpUGAEFzjPyegiTNm9wksFXAeLjndCcfMxFPbxRNIEt0E+p6bG8K9XfBZ?=
 =?us-ascii?Q?wNrCzko9TjsI4TmYpFlbQExSMyXuXkCFcaq7gCcD9N0GT+chJZpvOh3xY1gp?=
 =?us-ascii?Q?7b4rK7uRH7aianB3FoOxULxhujg5fkE7HOhS4RRqfT2pblaaL1v9D7GfDTou?=
 =?us-ascii?Q?nXVKFui8RqAAMi9dRowZdpC2GI5CQ669PiukgegB/G6PByRAgapWB8VZsxWJ?=
 =?us-ascii?Q?BxsYTHnqKqqR/VfMPWb0dgD9R7opIwnykL5G7csR3LUNhZfZiQzx+iyWsT4U?=
 =?us-ascii?Q?1k0OOM85Hk4zyceXcHBdQF2T2ouBN2eU2pNEPpy3HnX5BFoQITj/JHzQLOnv?=
 =?us-ascii?Q?b/TcsK8dmzvLdncqspLjaEqHEMbKTuJXO0rQkrrhY2yWzpJtGXqJpZQiV1bj?=
 =?us-ascii?Q?Z1J2BhA2mWM19JEVMPmrPErkeKJyDp8QtirJNGVvm55U99yOVHid1QAq67NW?=
 =?us-ascii?Q?KW3JgqtoayW0q6szH24hxOBMXHcaiULNo+8yp0/dvHYtc8NUBfunuP3RgMUl?=
 =?us-ascii?Q?ggDcyDFti8mPxMf31jMsa/tdLVANEM73lrJAVzAnbRiHMIJWRTycsb4YoAbD?=
 =?us-ascii?Q?wGy7FcHz1CMnXb8fpwIlR2vJUzDKjtOw38oOidw6uEVKqLdvTprDXj2Q1E1G?=
 =?us-ascii?Q?3h9uIlIvUBfD1EJLuqW4vZf3jRPWrZ7vo8e/gKOBrqH5+2JXMpHA23FNOkYS?=
 =?us-ascii?Q?rOpHCB3vvfg6C6ar6K+tQ+qFd0n1bxF1kZZP9hP4Ic7nselkTc68sE/5Imdm?=
 =?us-ascii?Q?gH5zd0NGdlP6ADe0OJgYtd51M2xLA2y5OmoVS7aHtvZ21jJT6s2O3Lkd+jgx?=
 =?us-ascii?Q?iUaJ83+E2NAlRefKkjrEj8Nqrl4nM8q+A44yiEryohlc9H3nOJcNFXMmFhrV?=
 =?us-ascii?Q?1HnAbFs4+tZKRb3b3uonMTImkSE5qLSaTgiiFZ4rBQq5b7HSXOw7PrZy5ABx?=
 =?us-ascii?Q?6FRpaxhWGltDNx6BAZvkoNaHtiz5I+i+v9/8RwgmE2bg0wYWcVkD9DKW8PCc?=
 =?us-ascii?Q?PfTHZDTdL/E7nGYLo8y8vh5lr8i7CCduv9zcHct/kE+4F0S9YhXp1aZTZfoa?=
 =?us-ascii?Q?XhLypqc5VYx9Cjg1riRFRDX3mL6cRHWn4/BHsV2ta3Q61TRb/dTMZmgtzlki?=
 =?us-ascii?Q?iyYPZqYWDjNXhTIRwgBX0qFXW2Xc5BCckVz0xXkoct2Zb8osOgiMz1tGi7PG?=
 =?us-ascii?Q?NLmY5n6Wdd63f4QqUqRn6PnS5gZbXTILvU5LcxrzXl1i4IiYIaX/O2WcTQac?=
 =?us-ascii?Q?MtnXZ1AWp/0DI07Vx2BCLk44Y/e05dgb42EWRIllwUdUCVsXrETZ53aIW71V?=
 =?us-ascii?Q?zKd85G5N7Esrmg52gNX0pjNPg0w6g9l+MHMQlGjGXDt/CyJASxdai1MQ3cM/?=
 =?us-ascii?Q?QLKZTw3CENOAmbd28hcbOH74B/z4yfhYOxvSL0PeHUYoB6cmIrq2ejk+55x6?=
 =?us-ascii?Q?H9y0UcoUGcctQ5UMoPi/6yw0HgZzVr72YF7XXQKCdvwxBhBWcuPr3MbWqFVY?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbcc7f3-fb76-4226-784e-08dca698b5c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:43:19.5917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU6UVWh2D909AyCmfHUyX/P9Dk5AbAza2MsIGdtqQ1ZvbHeQ+1OYnPPtUf0nAnte9B94z8d1Q7UEQ1q4promnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction
> of the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 

Missed one thing...

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..645423a63434 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>  			xe_exec_queue_put(eq);
>  	}
>  
> +	if (q->vm)
> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	q->ops->fini(q);
>  }
>  
> @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> +		if (err)
> +			goto put_exec_queue;
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index f8df85d25617..4dcc885a55c8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +

Let's be paranoid...

xe_assert(xe, q->vm);

> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +

Here too:

xe_assert(xe, q->vm);

Matt

> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	if (!list_empty(&group->exec_queue_list))
> +		list_del(&q->hw_engine_group_link);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7f2d27c0ba1a..ce59d83a75ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -9,6 +9,7 @@
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> +struct xe_exec_queue;
>  
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
