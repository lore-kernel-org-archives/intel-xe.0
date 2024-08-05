Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AE9C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701F510E2B1;
	Mon,  5 Aug 2024 20:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgbLIZ7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851D10E2B1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722889595; x=1754425595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=swLPxQBqk74oM0iUSrmjkcjsDa1/O97EC1JL2eKIXkI=;
 b=UgbLIZ7sEvdeZM8//YFUD8qqtt9DMyUV8/Q88sKOq3sOBJS2T3lrfCoP
 oi1Y8H+2T1+5g1V7eZUMYzUoq4Cgqwiks/mYuSNLPfpxatUbxTGbyzH4Z
 JK5+H5AgUuiVpWjoeHfCln+4T/EENuGjfn6VUuMCKsQpc/kKe7LQ/11Tu
 2W8KNmUjZ9gZADoxWD5ACF5+gnH+ty4cUZTogJtoOIuX8/XDef419XLZq
 vSCBmZHRkvXHnyfKphG39tVPVESPKpJJMW1EckbG0Im82wcATmyeJ3Msf
 tDhZccG1G4oJmRHiA+olHIAgfSHaB2037Ht7R85yBfZlyhRY9icLI5vjG w==;
X-CSE-ConnectionGUID: dU2RsK1mRDuwUPOaHJrubQ==
X-CSE-MsgGUID: lUeFkuYASZaoLOtm1MkYlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="23789601"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="23789601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:26:35 -0700
X-CSE-ConnectionGUID: m6423Y12RjW5r15QV/Qd3A==
X-CSE-MsgGUID: 9KDQa3R8Q1mgWMpnzONhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="61094268"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:26:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:26:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM1Lxaw2mT7BmakkoF7Dmn5yMvEDEsuOjW7DHrGkFSbLaLDjPv5Wtd8SSRKNJruK+k0uz2O7IhdJ5pdv4YY2iNge8FuH5kWFFw45emrfNeHkqqI3K61ML92WRcTSZR9g79/Cp2Ad2bHtWSSNPJVhN+tOZcrOmViyyAs95GAV8QxXoPEUFpSrh/mwCZNDpKFrhqscn7suH9jzI7xLgrxjyCsm4KGG7PHuL0vu5q/gYGKPm/DEj4baMgTccs2VP22ejFIjQnl7qB8klyqmgwf2ZvUdgQrVDSmUAPE7OHJWqp4RY38Rdacb8lvJUASfmGDSF3RmUeZJkyXd6YsA+gRZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPqSwMGNT8M5pfj7MGuLjybJE+1bW9QYdybvRtvAdUo=;
 b=QtU4+1N74BewD+CMr/OCW5f+Xgc5/VjljmHJmB2nmX1zYNqm2CltuLshqM5SEc3pAU0HvbaxnTg0Ty1DnaxmyoZz6lnklhoT9Lac+OAdpEVYvUOrQGXGQbviY1j3aYqcPjExyYuqzDeZ481xlrJIJeYmMUhMrGOTE6cj7kqWqaCpUuRhYNl1Oy+Tm3PcoTMv+F7vMUcT4k9QZ5OkWhrd6VJxC3BqGDEqw3Ih21AZUahouNikOC5ye65rRKTvhakbi/DZMBVfElTsHYTpm+bt9xPM7yZsqbjJLxh6ATuxYxq5N1kc4UBBYSvd3XRDPfQVOuSg97UWtTVDxqE8UDxgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Mon, 5 Aug
 2024 20:26:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:26:29 +0000
Date: Mon, 5 Aug 2024 20:25:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/13] drm/xe/exec_queue: Prepare last fence for hw
 engine group resume context
Message-ID: <ZrE1L2hhrsFndmrP@DUT025-TGLU.fm.intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801125748.355078-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 94607385-9268-473c-fb9f-08dcb58ce354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KukGEhyOaq9ZVTxsuwz+C//b+VTotW/foqofljVj5bqD4Xj1uaXWE6L2bSmf?=
 =?us-ascii?Q?GSi7s8f7nBZdsT2gfftKOOiJUw1y5/4C23OISBZKi85ByXnT5sfqS+hmxAUF?=
 =?us-ascii?Q?VaBPIWx7tyz4kIGsXbNFZjJfafCBAImN+hmNrtiioAKdax7bQxbEl4dkua0j?=
 =?us-ascii?Q?+0uzGMWX81fm9qZlVZNCp8DSOXSzKwYktRLihrKsA8SyJS0ftqvHABvrsVqO?=
 =?us-ascii?Q?yLT/TophuqbQ45/jSTRHbfRhr0o2rCSF71NB99JIoLq+XPfs8qA0GUiF1SDQ?=
 =?us-ascii?Q?a+EOmnCXuE0mpZ36MZn+dbUTpPAnGYiEWkgwxlZ8Hmh0C51DzC0ZqqjJHZY5?=
 =?us-ascii?Q?+fdO5/zpnydVuyPzR6C688tqkqgWQpBNc7QsConr5KlgdBUbAkYoDOLWcV3V?=
 =?us-ascii?Q?yg2r/t8kO70oItRWupOYI3E/A/FhhiAyedYGAgRWC3PpoYabegl7DejwdhwZ?=
 =?us-ascii?Q?tvEu6lB3u+52f042L8TbEuYV4TFO8SIgRDpnAejmB2aDWy+R7m1cxW7nQHU5?=
 =?us-ascii?Q?SdLkfcIASC/nWHTW1caJe7ULI4qd1FGu/C6VNTjAmyAby4gkA5Rao9JJBqzr?=
 =?us-ascii?Q?uUCMClQgUNvvRW6OAAsOc0BSufLRxapM/D8TcsBdgRngxXrqd5BgXz0Rc7B9?=
 =?us-ascii?Q?4NLbjBNpZt7S1BgM9AiHeAfn+uB6xhC40tqu7yVngKNA77o+rhizU/NmaM5d?=
 =?us-ascii?Q?jRjAYySyrqx18i3voKwLCQJxe7nqu9pAttYNjLvieUyXyCcn84AE0SaeGxXT?=
 =?us-ascii?Q?PBppbjrlXf4iTTb3Dmy/aCY2GSa4SNeIDtFlsZ/17D+qjGJzDqa5aAsbain4?=
 =?us-ascii?Q?oYlUI+h/zZJmEimtDTitM4F8E45Z6ZXL7SVC/V7CDyvoGa4XAB/2+SnYnOzN?=
 =?us-ascii?Q?tCjYNbpNUinZmLROIJsS1jnW/oxPyN5P1SaZNBt05cmJng7cnaFgeGl4zZMf?=
 =?us-ascii?Q?Qi65Rqo0T6axiGhQSDwexy7TSRiKj3uw2cK3WtjHdhg9686kl3C7p6dt/R4e?=
 =?us-ascii?Q?vlx8eqJ9f5tOHJeueUpT3nwaI4OE9hN1xplTaHPGGFgHO/h3m5mejnxvjPmc?=
 =?us-ascii?Q?5lFk+8KemWy5/YiFWuneikjreIsK0QKfzab2UIUOp4NMLQV0cga0+BPjNz/T?=
 =?us-ascii?Q?OW33YJycffOTMvkReiW8peKgwli8ADp056JrxfvcpocqpvLtKIzlpfwMtBW2?=
 =?us-ascii?Q?nwxrprfPNxz/CzsA4gEGHwTOCtcK53iJ9A4l72UZrBbHvirzjDuQji7myG/y?=
 =?us-ascii?Q?nN23s/mE+w9KO247BAxV+Z0MIR/BB6ld+vO9eglAO1b9W2/zBhOnam6iPKaY?=
 =?us-ascii?Q?Bgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZQq166BuF+1blIdfbdbaTesqs6gzSyYt/FWEmQKItvoD7S0F8lqPMw+UuZd?=
 =?us-ascii?Q?6QrsD5suDe5HUVDNxb5yCTyfJmvXQTvRPW7xbSRJuF+TMjQeYpbnriV30nyU?=
 =?us-ascii?Q?p1kBdgWfm4oGRXAw33sNrJgPIb6vJk2NMN37WgN8Vw9mo57tpLpKLziBvRg7?=
 =?us-ascii?Q?7oqeRqyJjyqntluXPbS3vSPZWcD8kYaeVPMYfBSTQh6lcObWYolxtklTvhZx?=
 =?us-ascii?Q?zmvtioXtUBy1bBbSZoWmsSI94Rz2+p8AaSE6fTtOh45rZ3RXLvNnNLVZWbEs?=
 =?us-ascii?Q?aXNAyAXyDQMGVkT4iYsfz05PyMYGIg4wIDI3jgicVkNTLwXohmAE7OQb0Ggd?=
 =?us-ascii?Q?HRVxYKkf58sxHcrvy/MEZ6K607Hl9jHDtou9ySCaN89sYa2WEYsukuWksKGx?=
 =?us-ascii?Q?XNbZZoAHbQ/ZtQFzbNEjYrpH5lYY2R2/SqTh5+2qldDyTvDsZVerJ993uf56?=
 =?us-ascii?Q?H+0EMGdGEcOktb+8j/S788b7vJkZOzUqjj0yc51E+3BKUe2ozO7VrIR+lr7b?=
 =?us-ascii?Q?dBaYGim6btSb9XcHB7WisoxYMkFxMOL54VV2fN5eg6u3MWqEyc9Oqbiq+emq?=
 =?us-ascii?Q?8mWiL4N7UAY61lPNMX4d24vJ6UbPMMTjKb+br9C12anItLkf5b/7i5tqhWey?=
 =?us-ascii?Q?xpxhlwojYgNdBEpHOJhaOnBEy4kIb27NHN6/JSyoS/Hej48VWUD1AB+UGsJY?=
 =?us-ascii?Q?/zJLJfuQeXctwdGzZNSmXKEp8VlRgdO1+DvtD75Znp+0EZtZgsNtuwoOzndv?=
 =?us-ascii?Q?xxtuCUYYT5FSwZ8+KH+ki/kVCoGIlCts2y0T10X5q2MRY7BY5E47p4ce/frg?=
 =?us-ascii?Q?5Nxb12Iar3R1KYYMjbAvJ1QjO4PceURcAxHcbfpn4wnh0dsqUWJKz5OLTc7j?=
 =?us-ascii?Q?Tuc8lgMnqh/rr6AYnLKsQ1FoM+Ld2j+vgR5JBY/Hhv1hSQsXdxiAct9s9C6+?=
 =?us-ascii?Q?Yn81ZTRJHHuln4HnpsjSCk9+gMJjLb7klyv/yTsRjPqrQldGFIH8F7p4DsBS?=
 =?us-ascii?Q?xZ8WoEKBm+HE9u0WJAc8HqRlD0x7La5125fVaklNzqAUA209Kp7h//C9sof9?=
 =?us-ascii?Q?8Dc8WUMk+U1EIeCr8JFa7Yz3sQB/GiiUtpj5AswXDjJou/F8G2R2CLNW2WxV?=
 =?us-ascii?Q?kXSmAyr2+Vq3usvU7rB6+79tgy6khzTBizY2MSasreLZsHHoKagTjdRIv7aY?=
 =?us-ascii?Q?hzFpOyngMRBHgfzRjx9pXEL+LMSgNqZJewkRP0dCZLlKqxxh5D/y3zUAJmFB?=
 =?us-ascii?Q?criYBqTV1b8hGaeeiyAhGIJeCk/VNj6TTZzELU/J8T66zg5Wqg1hH5/EZsFk?=
 =?us-ascii?Q?M4njOIr0clw3Jfz8u/vch0ETgiNYvWbnxyyEKbtZUT/X6rasDAgWQeHo4kZf?=
 =?us-ascii?Q?xcHFlhlmc2YEinxG9FQm0YLJmIP70vwNhbsweBTCYtoHHZH/yfbQfJpclGMs?=
 =?us-ascii?Q?Jh402XBeePPv26oO9D5vCCqDNisQv5lTfuEnsrSTj3ZADsYxLh7woBcBDup4?=
 =?us-ascii?Q?1t7V2gjXMFvPFb6+n9qz1gMydTWzwzZvAIuPULrfxzC/O8MBz/KPfpsFGxVQ?=
 =?us-ascii?Q?1RFJcRSK6g2gbJ1Fs+FaIuE/2sfyJpI7o+qyJYld6Sn50RHQK5icakTbff+d?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94607385-9268-473c-fb9f-08dcb58ce354
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:26:29.4951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2Hq8kQGoegO2Ad1VuXv1vPLtLnCq9JJttQWjvsDgk7FDUtpqxyl6YhtaRspsFMeujVdqmQLVOWZ+j3AF/9oMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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

On Thu, Aug 01, 2024 at 02:56:47PM +0200, Francois Dugast wrote:
> Ensure we can safely take a ref of the exec queue's last fence from the
> context of resuming jobs from the hw engine group. The locking requirements
> differ from the general case, hence the introduction of
> xe_exec_queue_last_fence_{get,put}_for_resume().
> 
> v2: Add kernel doc, rework the code to prevent code duplication
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 123 ++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_exec_queue.h |   3 +
>  2 files changed, 113 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 85da2a30a4a4..a860ba752786 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -815,8 +815,37 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> -						    struct xe_vm *vm)
> +/**
> + * exec_queue_last_fence_lockdep_assert() - Assert locking to access last fence
> + * @q: The exec queue
> + * @vm: The VM
> + *
> + * These are the locking requirements to access the last fence of this exec
> + * queue. This is the general and strictest version, to be used by default.
> + */
> +static void exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> +						 struct xe_vm *vm)
> +{
> +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> +		lockdep_assert_held(&vm->lock);
> +	} else {
> +		xe_vm_assert_held(vm);
> +		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);

I think this (lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem))
is the only change needed here, then just use existing functions as is.
Yes, we won't have have lockdep_assert_held_write in this layer for
resume but we'd have it in the resume worker so I think we are fine?
Does that sounds reasonable?

Note you will need this patch though [1] to stop kernel binds from
blowing up lockdep.

Matt

[1] https://patchwork.freedesktop.org/series/136898/

> +	}
> +}
> +
> +/**
> + * exec_queue_last_fence_lockdep_assert_for_test_dep() - Assert locking only to
> + * test the last fence dep
> + * @q: The exec queue
> + * @vm: The VM
> + *
> + * This version of exec_queue_last_fence_lockdep_assert() does not require
> + * locking of the hw engine group semaphore. It is exclusively meant to be used
> + * from the context of xe_exec_queue_last_fence_test_dep().
> + */
> +static void exec_queue_last_fence_lockdep_assert_for_test_dep(struct xe_exec_queue *q,
> +							      struct xe_vm *vm)
>  {
>  	if (q->flags & EXEC_QUEUE_FLAG_VM)
>  		lockdep_assert_held(&vm->lock);
> @@ -831,7 +860,22 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
>   */
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
>  {
> -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	exec_queue_last_fence_lockdep_assert(q, vm);
> +
> +	xe_exec_queue_last_fence_put_unlocked(q);
> +}
> +
> +/**
> + * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Only safe to be called in the context of resuming the hw engine group's
> + * long-running exec queue, when the group semaphore is held.
> + */
> +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)
> +{
> +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
>  
>  	xe_exec_queue_last_fence_put_unlocked(q);
>  }
> @@ -851,30 +895,82 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
>  }
>  
>  /**
> - * xe_exec_queue_last_fence_get() - Get last fence
> + * exec_queue_last_fence_get() - Get last fence
>   * @q: The exec queue
>   * @vm: The VM the engine does a bind or exec for
> + * @only_for_test_dep: True if context is testing last fence dependency
> + * @only_for_resume: True if context is resuming the hw engine group's queues
>   *
> - * Get last fence, takes a ref
> + * Get last fence, takes a ref, after checking locking depending on the
> + * context.
>   *
> - * Returns: last fence if not signaled, dma fence stub if signaled
> + * This function is parameterized to cover various contexts and consequently
> + * various locking requirements from which the caller gets the last fence,
> + * while also avoiding code duplication.
> + *
> + * It is intentionally made static to hide those parameters externally and
> + * limit possible incorrect uses from the wrong context.
>   */
> -struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> -					       struct xe_vm *vm)
> +static struct dma_fence *exec_queue_last_fence_get(struct xe_exec_queue *q,
> +						   struct xe_vm *vm,
> +						   bool only_for_test_dep,
> +						   bool only_for_resume)
>  {
>  	struct dma_fence *fence;
>  
> -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, !(only_for_test_dep && only_for_resume));
> +	if (only_for_resume)
> +		lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> +	else if (only_for_test_dep)
> +		exec_queue_last_fence_lockdep_assert_for_test_dep(q, vm);
> +	else
> +		exec_queue_last_fence_lockdep_assert(q, vm);
>  
>  	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> -		xe_exec_queue_last_fence_put(q, vm);
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags)) {
> +		if (only_for_resume)
> +			xe_exec_queue_last_fence_put_for_resume(q, vm);
> +		else
> +			xe_exec_queue_last_fence_put(q, vm);
> +	}
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
>  	dma_fence_get(fence);
>  	return fence;
>  }
>  
> +/**
> + * xe_exec_queue_last_fence_get() - Get last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Get last fence, takes a ref
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled
> + */
> +struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> +					       struct xe_vm *vm)
> +{
> +	return exec_queue_last_fence_get(q, vm, false, false);
> +}
> +
> +/**
> + * xe_exec_queue_last_fence_get_to_resume() - Get last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Get last fence, takes a ref. Only safe to be called in the context of
> + * resuming the hw engine group's long-running exec queue, when the group
> + * semaphore is held.
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled
> + */
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
> +							  struct xe_vm *vm)
> +{
> +	return exec_queue_last_fence_get(q, vm, false, true);
> +}
> +
>  /**
>   * xe_exec_queue_last_fence_set() - Set last fence
>   * @q: The exec queue
> @@ -887,7 +983,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
>  				  struct dma_fence *fence)
>  {
> -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	exec_queue_last_fence_lockdep_assert(q, vm);
>  
>  	xe_exec_queue_last_fence_put(q, vm);
>  	q->last_fence = dma_fence_get(fence);
> @@ -906,7 +1002,8 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  	struct dma_fence *fence;
>  	int err = 0;
>  
> -	fence = xe_exec_queue_last_fence_get(q, vm);
> +	fence = exec_queue_last_fence_get(q, vm, true, false);
> +
>  	if (fence) {
>  		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
>  			0 : -ETIME;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ded77b0f3b90..fc9884a6ce85 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
>  
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
>  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
> +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
>  struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
> +							  struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
>  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -- 
> 2.43.0
> 
