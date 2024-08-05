Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D465C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0646D10E2B4;
	Mon,  5 Aug 2024 20:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvqDamrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C00310E2B4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722890051; x=1754426051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V/Zbdgd5HiUlrp6zikXIK8RSOsd0y4xemfqD9mQBwgg=;
 b=YvqDamrLUeEgI172i1i3hmVPVbgGu6PbrkBxCuwVQ1dfoqLD2Zx9e3J5
 TVPPeKKhOKlR8qh5/dEJCIJH1z/jl/49EhlcwPN2ByMkkaSCF1Dz8CSkd
 MNg1hWakkfoc+49r8pber5FbbqiWAfoV1rBxjmfA0gRVTq5l3quFUqy1x
 k3TPI77NfB807hVjDt6vHcqifjpEEiq2SIyY6CHsp2MPVBkAAICmuXkHO
 7xN2F13te5nK/H1BdFY6dPrN1DoGK/YL7BXMI20YV20K0ccUE6qVuRmJ/
 p5Av/H+dJ4kNcZ9NHKYTj90F+9fWlPKdyWa7ic2car5vzSNRpDnDzPqdz A==;
X-CSE-ConnectionGUID: 8r+IZwxhTryQvX912060Rw==
X-CSE-MsgGUID: CzTZF/lASS2xQyzHODrCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21042191"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21042191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:34:10 -0700
X-CSE-ConnectionGUID: H6Q173PFTSi7vSauUi09Rw==
X-CSE-MsgGUID: aCAYxS6LRZuIoB7A0kuhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="61130666"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:34:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:34:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:34:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:34:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2Qk3++D5a8flTFHibgYevtt5kAzhDdrhAf/GTu+Q5pcJwbv2cZVPCPuo8z8siiSZvUitsyDCt6awtpSuAa+JRlXvMN/lVnFmmsfKXapEh7jfEHmmiHXSx/xPENPE36nIqJ06zXg60WOf9NN9MdhyBs/4jQre6YyW0H8jl4PLKoCu74NEZBor7M2nWUT4w4uMmQfGyttmYLWxxz9l/I8j0aNQFvQ0efuJ3xNteox8xTdctvKyMz1Q98amZZJfLPwvp16YrL6/H4v6ECSANB/eF18YRhLOZWhnHICrW+nVh0hg9dcmfx2lo5oOFcBwSdRpQmsMsRxyE7Q8S7fiahsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnKV4SuWB2g26wm7UrvhHJcxmLKAkvLrHSY1yVtF+Qc=;
 b=NSlxCbooX4oBWWTjHDNZefbPMXK6SD35JyuHSOixiccPvJm9l4Ko1hWetpa6nip45Ynpc4+rnxndOeH1OZUS0Xjo7iwIcwdcnyhtpNkzGhUTwrvNU/FZw0icE6ahvygmf3DYltN2Cr+dJ+MFtENv+6YVncc/tG9P9PgHv5u/jj0Uc5rVAozyJ73O+Eyg4IwkLfmr5J9xiKRpg4/pNfHbBw7u40j0XSy1aQfwQ3CZtSPFWwAVekZCCpNSYu0a4G+HNVSMxybSXUWyeZKWCiXQ11OveivjGPdETW8o8vg+ArWZPQ9U21xXH9E6HJaI4oPJ1DKtOGsUDsM02r9cXX/jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 20:34:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:34:05 +0000
Date: Mon, 5 Aug 2024 20:32:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/13] drm/xe/hw_engine_group: Resume exec queues
 suspended by dma fence jobs
Message-ID: <ZrE2994xDxw/Dg4t@DUT025-TGLU.fm.intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-12-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801125748.355078-12-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f1c806-df99-42af-4b2d-08dcb58df306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2+0fOhpHDvI30qahVce4SHGN8KiHj/n2t+G0cj6nGMCU3Xromk/+zEMCGPvb?=
 =?us-ascii?Q?6XKB8HeUuQjP2FIs4iEWIxQTSaLUrZt/O+3eCA2uc2NadxK0Q4nvpVFwC9gW?=
 =?us-ascii?Q?sew+B0KkaYJM4sc8rueXg7vpd+uESDBypmbeyquG2dbQEVL4wg2aTuVJ30RO?=
 =?us-ascii?Q?fa+/mP4yJkrKePUyLIgA5y8hscws3KoDtR+Wz49jWMKWN9je6Q0dLkFDWJLv?=
 =?us-ascii?Q?JOzfPr5dijSuk/U/xbLHGQEyYQ5btz3XKZW+/zz8+cu/a9gWhYMBHLBnBx4D?=
 =?us-ascii?Q?JxyAI5KjY68As+XopoKEQCL9J1tyLMLLKJ3tr20qTTsd2g8z7EJV8/P/vldf?=
 =?us-ascii?Q?4v9B4Hh7/wnRp32KF6/U/Zg1soLBJP1PhuQEzGOPQ8DCc3Sy2UVNpXQWf8Vk?=
 =?us-ascii?Q?YCoj8UobCwfXSDVJoXj4/Ve1pOZ6olXLHlGbBxhjNmkIa+z+gtPnACfNIqyi?=
 =?us-ascii?Q?N5TbGNyaMSUzopvYHPvnqRPO6Jos2hFYxdL2JQzRuLNnmYVsf1cJ6uFooQwl?=
 =?us-ascii?Q?SMNRSIyNXE6DAeCJ73nf0H30MhbOlBR64wbGxto457i8Yt0xO/lU4kAV5Vx0?=
 =?us-ascii?Q?w6Ze2yKcbINTa7xBBKkPe7abJGozSSKuTL0YJAT+4N/xPhfx2brMxZm7BT3S?=
 =?us-ascii?Q?+LROqhzKi01MJ/2buzhML70FKzWIPvGVScUREwgqjQ/8tCiL7yLyD4bDPb42?=
 =?us-ascii?Q?hZVfxRV0W/LNP6WvK+2RMDdyCGserSLshWxUXJPGjChg2V80zAI3VX7yDqv3?=
 =?us-ascii?Q?Fq30JsSRhbySETPpayayvG8TOLIqWMrpbmpEeKHPWlX+eoMWOgz9XNSvqYyA?=
 =?us-ascii?Q?vniAwFkZsBxdhrzo+sJegONMZaflPaCB6t/fV5X3p4gqaJf7hjcxkEeyzMok?=
 =?us-ascii?Q?+U26Gfidz4A8ew+XB18kCzt8vQmSXIU91Y7O4DTvESyVj7QQzIzXlDW2EBw4?=
 =?us-ascii?Q?NowTNuEX+8CDaW3UC11fnv7FEU3FhWiBRNdVtHoUk/1WPj8rD2DAdTINVy3q?=
 =?us-ascii?Q?MWNKX/S+1eoM/XlrWQVmcX73vEvTDmq8Oi2IXKeLK4GnZdJcnhFVPQOlLpp4?=
 =?us-ascii?Q?F0crcFadKZa9dv0d0lx2GRCvUPgIsEIGzunaP6xq5PxYDmH4q8sOKlV9hVLe?=
 =?us-ascii?Q?s/baSRC0khZLOSd4VS6o6omaskeWTE5k4l8Jjpu+nWTKMn4hPYnHu/YSjZZn?=
 =?us-ascii?Q?SWlTzM8CqWm1ILfm4mSZiwq4jDwoFxJtgEr7+CL5zYKP+FGohlWAwxjjn5rm?=
 =?us-ascii?Q?oTELfU0fcebpGJNXAQRd6onZg0XaRgHZ5eEu6W53KofKIHFlJ7TC2LkZcXaS?=
 =?us-ascii?Q?X44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYUsHAHMtx2b9Wnb7pIw2877uh/uUAGSDlJvHF3nJjYF3h0gXL6UMcltctWo?=
 =?us-ascii?Q?Wt/81835qvR6Mrwf+s0NsVT8+qnPTkBqua8zBNdxQdby1G90+DwfYk7yHrnG?=
 =?us-ascii?Q?6Ia6cbsD7UawdopKsnX5/9cAvKVOG5P2jdLnRXVy3iFYbYfZROxHs7YBd+WX?=
 =?us-ascii?Q?CTh9VNdginGL4TRCH/r4pPUyRY+08jIKC9So4zFGskn4U+KXjIZwbQSJhuhE?=
 =?us-ascii?Q?VuUQcvgwfCiy9K9QYNRlWBgCRzCCZV7WAJZkzpsT4NfwJsaDVjYZOZm1+l7Q?=
 =?us-ascii?Q?6DppQPdWBgbgohSzSwFoRxrvKpGnS+kXl3aexpFLVNteRhvFjW7LoJdw7lP2?=
 =?us-ascii?Q?Eqo+4n3TeoT5DQFAwmZzx4J41qQczaUZZ8YM5AnIxgpp0kOAbZ5cPn6W1mZk?=
 =?us-ascii?Q?tZ0sdsYhL/RUWH0be29iErXpz6AWDPXB5oF84ZRNUotKTNZ1IT0bMe8BTZWW?=
 =?us-ascii?Q?XwCPoePNf4MvwDWo/3WYaeKxAYuir8qKNGqosZWlY8skbFB9nSc5I/h9T9ht?=
 =?us-ascii?Q?V7AJ3ImIsgm8Ao6Krbv+p9xwcj1EimbZr4Ciu/y/lJDchudDo1lCJpXCHuO+?=
 =?us-ascii?Q?Ks2VXgb9p/ocKDjnhcJrfa63ga+/jonA5siWTrDPr2gNe9hvVhDJrELbhBCc?=
 =?us-ascii?Q?zjOWFSF5GJNx5DoCUcOlkiuO9S09ZoqSOt0dY+3KwFFwChaF+Fv23puAl7KX?=
 =?us-ascii?Q?mKnc9FKWXKlnDima4fOYiCr83mb8xGIa00qO6u7B+NReicFIuAKFOklsS4R6?=
 =?us-ascii?Q?palJ/XMfwh69ekTsgE1q0FcjJfo4F0jnVXtKobbV/2FYu0RuN9Dlq/cQmP1n?=
 =?us-ascii?Q?GA4YO32fdokVrW+qCcd8H81mFW7atz3KRN6jrPhYG1HhKxdLXQgFmG8AbkwT?=
 =?us-ascii?Q?+OfFOR70pLvzlNzGQLDedskHo7FItL2edlMV4iVhOrL/frp5s8LnhJnsVupk?=
 =?us-ascii?Q?N/e2AFVhVszd/CZvCMVdjQaUv6zlgDuwe6LCQErTdSEw2IBeqqgsdfU/7XXp?=
 =?us-ascii?Q?4Rh5MjvWcXVEqIFFTHZXVr4GYD2W9x06j0aNHzcIDtjvzaOCqultK4nGzS2S?=
 =?us-ascii?Q?SZPMAhJnN3yy7dzWwjYd4j5eyiYM37pC0AY7h2mQ5XWFiUdJ2uIRa6Oq/KeV?=
 =?us-ascii?Q?lWoudbNExz6F72XkcZR/Mf1/6P6blevjmCarLJCtpW2MUwJgw99oO/8Y5kep?=
 =?us-ascii?Q?WWnEygeFDX8KzzwjbbiP0z8ETDOdgbZ8mMx6kWqDN9fz4rVT33lHDWRanFut?=
 =?us-ascii?Q?FdjpvjjcNuCe0P12X9PHralUhVtHt6vkA2yWnyAm5AIbRaGopsa1tI11A1Ck?=
 =?us-ascii?Q?pVAD5Nouo8kciEfMhk0JHB2VwuNL25MzA7a4OCIpXTKkT7eE8F/FTk0xbSsd?=
 =?us-ascii?Q?GXmH3k4KIXFl4Ch1OVHJwlDXqYDSn6RRDerB6rV2keeN4QF3n8lPQpIJBMU5?=
 =?us-ascii?Q?6/G1Id3d4HJG8SPnc5Oj2keUSKy3UDMccDg9Y3Nd5ge3WJF1pjuYXVCE4oJi?=
 =?us-ascii?Q?cg2fl8LnPBsUqTEmjMsP18BQZzjpPUW6h/byLhpL5SjXEQU9VbLxcPnZhcle?=
 =?us-ascii?Q?qvYwr29eC9K0q27w3dLWskOQAZUWll6VxoerAcNEbFJlQCtfZKwkDrQ0XipP?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f1c806-df99-42af-4b2d-08dcb58df306
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:34:05.3128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLlmRvBdt/s7VQRAyFDaQ2ivzSDnrNtRawvRQxhmXoeTz+EvAjd4JE6+cR2p5SfZnQRqkPoNoE+GU81N0/y5jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
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

On Thu, Aug 01, 2024 at 02:56:52PM +0200, Francois Dugast wrote:
> Submission of a dma fence job leads to suspending the faulting long
> running exec queues of the hw engine group. Work is queued in the resume
> worker for this group and execution is resumed on the attached exec queues
> in faulting long running mode.
> 
> This is another entry point for execution on the hw engine group so the
> execution mode is updated.
> 
> v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
>     destroy it after use (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c            |  3 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 46 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  1 +
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2169fbf766d3..484acfbe0e61 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -324,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
> +	if (mode == EXEC_MODE_LR)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 16635f00c5f0..ca8b06df63f6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
>  {
>  	struct xe_hw_engine_group *group = arg;
>  
> +	destroy_workqueue(group->resume_wq);
>  	kfree(group);
>  }
>  
> +static void
> +hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> +{
> +	struct xe_exec_queue *q;
> +	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
> +	int err;
> +	enum xe_hw_engine_group_execution_mode previous_mode;
> +
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
> +	if (err)
> +		return;
> +
> +	if (previous_mode == EXEC_MODE_LR)
> +		goto put;
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->resume(q);
> +	}
> +
> +put:
> +	xe_hw_engine_group_put(group);
> +}
> +
>  static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
> @@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	if (!group)
>  		return ERR_PTR(-ENOMEM);
>  
> +	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> +	if (!group->resume_wq)
> +		return ERR_PTR(-ENOMEM);
> +
>  	init_rwsem(&group->mode_sem);
> +	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> @@ -125,7 +157,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
>  		q->ops->suspend(q);
>  		q->ops->suspend_wait(q);
> -		queue_work(group->resume_wq, &group->resume_work);
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  	}
>  
>  	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> @@ -151,6 +183,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  	up_write(&group->mode_sem);
>  }
>  
> +/**
> + * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
> + * faulting LR jobs
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	queue_work(group->resume_wq, &group->resume_work);
> +}
> +
>  /**
>   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
>   * @group: The hw engine group
> @@ -174,6 +216,8 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
>  
>  		q->ops->suspend_wait(q);
>  	}
> +
> +	xe_hw_engine_group_resume_faulting_lr_jobs(group);

You are going to want to skip this call if none of the queues in the
group are in LR mode as this would needlessly queue the worker which
waits on dma-fences under a lock, serializing all dma-fence jovs in the
group. This is source of CI failure [1] too.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v5/bat-bmg-1/igt@xe_vm@bind-execqueues-independent.html

>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 0f196c0ad98d..797ee81acbf2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -24,5 +24,6 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
>  enum xe_hw_engine_group_execution_mode
>  xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
>  
>  #endif
> -- 
> 2.43.0
> 
