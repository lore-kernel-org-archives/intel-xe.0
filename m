Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B45DD0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C69110E411;
	Tue, 25 Nov 2025 18:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivfgPdn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8B310E411
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094444; x=1795630444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fqoCWCVmKccjg2n21lLotMyKTCNjVXOEoFI9TbqYmb8=;
 b=ivfgPdn6RK9ZnIwMjaPkFtHF3bj0JTutejXSFkEDXRVwM2oErvFu04MU
 nudngTQT0KEvH33IVytqe3ySe5zLV8/q4d5f0fNWjFLdlSc0N7HfpjxkB
 Pp61fPpo6tm5FApLZdzChw89EactudK8+SXxqFf45U90gp928tSCRq4sx
 +1LQNLmN7WMGNt3dUZp09NeL4WlSUZ2xPZwh8SVz87+R9UuI5v5EudroO
 wl8Ip96gtJsr370RWUs+WI4wT9o9EwKbf0hbA3zbD6G96IVFCLTXh73PV
 nb8cpt2K1/meW57kmWTzb5BV9vex13wtiJEErbY5uwT0VcnqEJBUdTbT6 A==;
X-CSE-ConnectionGUID: eNkP0a/sSv6bdBP3R4YZVA==
X-CSE-MsgGUID: ZLdh3RJlTJ6ETykU7hH27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53691621"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="53691621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:14:03 -0800
X-CSE-ConnectionGUID: AG68QpLwRGqM5knhpQH8Bw==
X-CSE-MsgGUID: CMJePJwKTlizVsr7SblvcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193516972"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:14:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:14:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:14:00 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4AmRA0rl03KHURfaVa0csceP9nj40Yh1BLnFauUq3uXtWphAIap4exN+7RaWTlO+iMJFjcwoJAWhzYBePIRaKUeDrYFuKOmekpBJYeb2MyxsZScnk4ENBjtZLWIwBv6yZ35VVHHiQ2in4XwEoR5jYrE33+Sh3P4ABYonLoNnWg9nqnIniSevwqcgFezrLcQUv5A6CCXCeIkzrYtS9gYL03+bFYL6/0PK65y0YNp2IcIQHFXn0x+sj0XDL0Q/AJPpIktS3HipNd3xqkUVwQmOfxPpsC+s3wcMTHJoYv2loRjbNvd4PCvnTbp2fT/q2D2ec3WHIb+fH0xq+urcDct+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMOHXGaLemaqPit/5BYN9zUbOV3rLBD2V3RJvkfG8hY=;
 b=vFL5PNsuMcvlAvtO6Vi7eWSgHLgwrdJl1WTdRIRA8Q1JZ5WI/JPxy9W7BDsq2xnv8UwVftUrPVkhhvOHhURAGy+ku5KwTmnDAk+p1I5tpFkVRYBa6RViW+le5HOswdKucqRZds2EYpizKRayVoaTuSAmRLbceToRQBSCDht1w0CdsoUsAhqPJfM3CfkL3/VtMrgMArHgnBTY+KnSDkWZjImPA5m/GRv8+l727aDdtbtMF8X50dCbQ7o2k0mSKvtP7lHnNk0XnsFAC2zlO85DckcfMqzIcIu2IG4QF9RxZY/h6ZUSW3LQweXjMlYE9/t+wHyVkZqY7S8VGrHB4vieJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 18:13:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:13:47 +0000
Date: Tue, 25 Nov 2025 13:13:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v10 2/4] drm/xe: Don't update wedged mode in case of an
 error
Message-ID: <aSXx1lYwgvSWjvqc@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
 <20251125135422.11244-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251125135422.11244-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 11684659-43eb-4834-e94c-08de2c4e606c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UOeYPg/wcVBHI+yFNO9H39irfF7c9KXE1PD7nC2QpL7NjW+YuGSpNRJ8RQ+C?=
 =?us-ascii?Q?cFSC+uLCZmAVw5CC90kBqhCnT3znEMtAkWQZkujCOTMx8uzYl0Lkv+ewpX88?=
 =?us-ascii?Q?+CJ/jo2wQWWqgjvSwNmBcjajrR8IWzQUPBjWyr6mc/ZWir5ZA8kSx8xh/iEu?=
 =?us-ascii?Q?wcciacAX9Xa0+UoELQlnH4mfvuxyqOFZY6SlG7UiOrBcZTfqPAzBuooLJjAk?=
 =?us-ascii?Q?qXvz0WLpzZ7PRaAwfmPIJFPEuNhe//4/xQ7BMB0Zh9Obzfana2Tw5E/98Lo+?=
 =?us-ascii?Q?ydutNRs6RUxE01xiogtbnbJaTo9RVxWnsDCv8lS6cuOc3f4jqb+3VAyP3WIf?=
 =?us-ascii?Q?B6Cg6g+Y47sywK5tSdG8UKAk4rNieBeGtv0N+43DllkfIsnFwWB3u0YWF4FH?=
 =?us-ascii?Q?7VuOiPeEWbcEe6c7zFeU0q6o6FUuJ9h5qjwyUjDmqCD/8BD48mZ+29iZeDYu?=
 =?us-ascii?Q?FGFBdukgT8Rut6yAdhJgaVIDnAZdJ5fJl0aUQea4ci79PyxfUo90IxgjHKpb?=
 =?us-ascii?Q?uFHagzEZTm/nXhzDOt3g94gZ1LYFLaXoUEtrW/2XT1s+YM2UOJAEbbx5m/+s?=
 =?us-ascii?Q?+PcGiYKra7RhWdOvEbq8BVBrBlgBoqZavvSQhqzIFdOk/a2FAjumFUhFedOB?=
 =?us-ascii?Q?JqUfPj54Ia1KzR+4ZyPEzIc1Ecv/yBi+7KvQRm01bHD/E3mjUsk82rtu59P8?=
 =?us-ascii?Q?Sp0rvUQ27SzrzcGMns/f8sFvDb4/ReuIqwpCh/J9pZrnC6S+pYfdhx3E5nuv?=
 =?us-ascii?Q?SL0QojqRr3f5FB0Q2KEUwR4FKUbuS42ssO9qjoANEk8QfH0ZFpkY34mDWmFq?=
 =?us-ascii?Q?5ewRGms3q7q20VFLZgfHasAbLDYU2RZ5PfXsv8UJaojM8EqXeLniuC9ttpSF?=
 =?us-ascii?Q?kLC1ubKZHJLBNOvHcXjTGSswJHJYDCQGVLyLaaL5ECm6igi5cdjv62dVEyFL?=
 =?us-ascii?Q?LQkZEzDC/EYsA7BXCfjqwgWHZCyrPrU7gKk+tPIF2HD20BDiHKxoQqbCiVZl?=
 =?us-ascii?Q?RxYKMxRbcSAEUzjfQbBhgYd/LugAo8QhvR5KSGo2+PTBVvGQeHBSp6oqJ7X5?=
 =?us-ascii?Q?wlUZW1SHVft4S4iuSWRZi0arp1OjRmapNdZC4LPuYmI2WozjHGjSGiBlbbj8?=
 =?us-ascii?Q?Bjhg0blHRLDbhuJaTvkny+mrh0wDmQuxI3EwV6dgB6Ky9FZdbkipL/DenuC1?=
 =?us-ascii?Q?hUClPCKneW5K/k8ZQbPUxm6nS7uhrePUjorZsTzw1Q2PhUMYB4+eRXwDW++9?=
 =?us-ascii?Q?FA/22FJmSGnyjIk2OU31ZMVESZTDsyO2uXyuq3dEnd/fZo6N9C0AgLBJ1nrK?=
 =?us-ascii?Q?7kr3KkmHBaww5Bx3m5BhQUuDUQ/m5ivXTx+LFLc6zL/4crQ7n/v2A5AAUy7L?=
 =?us-ascii?Q?t6SJDtuZ3TalfEyAE1w6DzFmqaNZwu3shgcP1nQOUY6fmqnb0P3fSE9kCFLL?=
 =?us-ascii?Q?VdYCIiEkOJa492S9gXEe+hOy0ansiGNg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDO6sG03BvKq77F4XWRayqmKwVYhPSHxmYwsETuLULb5X5ihFelLxV9YlVqN?=
 =?us-ascii?Q?J0N8TeNWHHMEsutuo3i0oTIzmmKrJXqv8zytyWrWRMm+KEhvpWjLpIubiush?=
 =?us-ascii?Q?x5/a0EJtr8cFKoA67/PnSKUTCuGp2Bv0u2yHN7GMHqndLB7ORmeb3BxTZLyP?=
 =?us-ascii?Q?xCTkr0rNCtJK3TAb/KRYMvIDe+KPCyhWUOpB2rbdHNNdRqgo8YmP0sa2E+mY?=
 =?us-ascii?Q?b9JZnrvqI2UI8uwo69jOaN9APrv0bNHjKpTaO3yU5gMFj7o4bY7QUesbwXSh?=
 =?us-ascii?Q?/Bmyactz8fxGyHuyVv7m80XtxvXqdz+1atTSyPcqldTQ6wsOZLHKIuL7Goy3?=
 =?us-ascii?Q?qOTG1vDXNo5HojQax4+jpNynwfUvEA2nzDTUBI+Av1/1OCvC4LtWYaik/cvM?=
 =?us-ascii?Q?UbEz8wYQJEH1VoX+Wpc7SBZcb0BQjFLYoAkJbE62ZJm1UVlXsBqNYI1pN0lV?=
 =?us-ascii?Q?ftNr6oeNom6vOCta/SQJP56qUtsKa4R0Un2jpEVHLF62bbJTkDEuRAUAWbO/?=
 =?us-ascii?Q?WJOff2wQQIb3XpcNiZSfogm3txguc95Ee1xIdxvtWCVZ5R5Y0IhzMdIidcRx?=
 =?us-ascii?Q?0XpcO5VuM+TE6AQn3LPe7HJ5kTvCDkInQ6jmq91UlgjJkHflV+WIQxDvcSDm?=
 =?us-ascii?Q?2iQIqCDinv4kIonzSRxYjC9e+zCdh2T+kmVtgWK7+yCHzjLot9zoKrk/QNRo?=
 =?us-ascii?Q?lloa2vG9kGH8QhXiwX3Q5JrQ2rMcFHBMvHIwkOU45hz5clvHBrMU9oeOTEWZ?=
 =?us-ascii?Q?kovuChoBgZ3WeKNNvolhNufwUvEVFRlKFKVKPNSrQZdiDGuAvNEokbufv6X0?=
 =?us-ascii?Q?Jy5dTVG9pJpd5waGGQ64BPW5cqf5N/VzgtWBzrIzcxWo7KJzx10+XB22Q7Tk?=
 =?us-ascii?Q?WBxJRpDP4CBjSlPSdsf2XcsGkutLtW6/9qQA81GHeyy77VHgb233NFs83dzX?=
 =?us-ascii?Q?gyh6WY9PLi3wDBp5aIgUsHIwaeFCwv0ZE2mLzxvqump9ErJCFXIlotpZzIoj?=
 =?us-ascii?Q?6hkur4y4iRD85A+iwyVcQivLyBDuWcesu8h2i3Yw6OKWek2OqHlDJ0gM7daP?=
 =?us-ascii?Q?cavb5RIa7DVPHFNpKGvB2PQDpPre1rUWRRa86rVrWZJjZe3vMx7za82VBkEO?=
 =?us-ascii?Q?O3ZfxJNd6z2k7E8OCDUXN0GA8j0z50fVQHgguhQnj+iRs/HBBoiH6mYejJex?=
 =?us-ascii?Q?RhNNbZ2ItDPYsEqbXS+rJCtR3iFrMYtAAr8mAMZBPyEJCplQ5FxaZiDEpbjP?=
 =?us-ascii?Q?AdsmXDJ5Gn3yWc0soBCCLv9xkiqCukDBFWLu7wNRaTyjsnA1/0g52ApnDNhX?=
 =?us-ascii?Q?EPRKfJQcYnRKHj5vazRD/RhXneVlX82nxbM+FHuyuoSRiQPSV4ybXwfEdiiq?=
 =?us-ascii?Q?1TCJOnIOWJgVdPtlncM9EoBu6edalNOnw/ZG928a0iRHuFkqitYtd23+F3ng?=
 =?us-ascii?Q?6hXmmeQQ0ikCsh9SdQsCOGclekJiTMffE4jI1zxin2xdeArJa8ntnIxGoEld?=
 =?us-ascii?Q?V7ImD1c6Aw0JOX8/Zvs79d9FL8XS3ydNBPx44/3LHOQDGsBNPxUxF8Br4UHs?=
 =?us-ascii?Q?iXc5sqvWaNeLwJnPNUzf5+ngBSdyIkmODaHAxwVIZQ3njyeq4pVLtII9B8fZ?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11684659-43eb-4834-e94c-08de2c4e606c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:13:47.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF8ANmV3k0ntrPeQSthx3RirQZsWLJUAuwRYla+ppKiagKuns29JwBdkkblbEdsUPamb+nE7xzujZdC+qpZqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Tue, Nov 25, 2025 at 02:54:20PM +0100, Lukasz Laguna wrote:
> Change driver's internal wedged.mode state only in case of a success and
> update GuC's reset policy only when it's necessary.

I'm afraid the description here is not enough or the patch itself is making
the wedge_mode and reset even more confusing...

After reading this I have no idea more when the reset is attempt or not,
how to actually select it, when we expect that to not reset but reset
is still atemptted...

Something seems off here. Please clarify.

> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 68 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
>  4 files changed, 66 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e7cdfb1cda8c..71d53099187c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -252,14 +252,62 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       mode != XE_WEDGED_MODE_UPON_ANY_HANG);
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset = false;
> +
> +	return 0;
> +}
> +
> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG ||
> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> +		return true;
> +
> +	return false;
> +}
> +
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
> -	struct xe_gt *gt;
>  	u32 wedged_mode;
>  	ssize_t ret;
> -	u8 id;
>  
>  	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>  	if (ret)
> @@ -269,20 +317,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (xe->wedged.mode == wedged_mode)
> -		return size;
> +	if (needs_policy_update(xe, wedged_mode)) {
> +		ret = set_reset_policy(xe, wedged_mode);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	xe->wedged.mode = wedged_mode;
>  
> -	guard(xe_pm_runtime)(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> -		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> -			return -EIO;
> -		}
> -	}
> -
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 81bf4a70b888..4aa99bcfbcc7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -603,6 +603,8 @@ struct xe_device {
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> +		bool inconsistent_reset;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 466f192b6054..e5ca25b865a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -983,16 +983,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @enable: true to enable engine resets, false otherwise

please use a meaningful name here... enable is way too generic for this case.

>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>  {
>  	struct guc_policies *policies;
>  	struct xe_guc *guc = ads_to_guc(ads);
> -	struct xe_device *xe = ads_to_xe(ads);
>  	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>  
>  	if (!xe_guc_buf_is_valid(buf))
> @@ -1004,10 +1004,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> -	else
> +	if (enable)
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..9879aadd22d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>  
>  #endif
> -- 
> 2.40.0
> 
