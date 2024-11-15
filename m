Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1CBD68BCF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 19:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4D310E02D;
	Fri, 15 Nov 2024 19:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJkplCTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B42810E02D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731700459; x=1763236459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EJgWy5NkhoQvLNvoeGNqwkLBQDMyoaFSNKV8p3kAlS0=;
 b=HJkplCTcUR91Z82EGaGuOGwhg8HDYj0pK5fsDC2pgoidF4+6SBOSJ+ZI
 DHrKhReOT4Gklx0m2sShZUmmPF0EIwN86BYtG+9hsIcy1k+pg0PknckI1
 Dae6bAbCKHgLJlqswWnf6QKWnO2cbms3Ji5Jl+NoIL3UikPPT1B1xrWrW
 mSaRJD0DrwmpS4qmBbeafACIn/EwK3OGD3lCoWOF3C6NgMeDJAbSOwVkL
 riC5N5rB6q0OMqfMYkakOtuGXe15F0dT/l1WXp0LEtkiRchSZmZ8/eJ0k
 Vr2IwsjODL939xVE1FNO/UFvHyswWHSTif+Fh1lBcVeQzOIu/BOZwzzeS g==;
X-CSE-ConnectionGUID: w+pNEaY3QwmWt8tljryiTw==
X-CSE-MsgGUID: MrIVq1d+SXmD9OWCmHdcCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="43114732"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="43114732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:54:19 -0800
X-CSE-ConnectionGUID: jW3xIzNBQZGjuppusgjO4A==
X-CSE-MsgGUID: KQ7C7lTuSWqG74ClRiAOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="89054462"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:54:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:54:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:54:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:54:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSbhbVIMFTWxPeT7DvQn9Tx5DO9YNs1ZL5gEV1secsAXygVza6jt6dMLuoGw7Ka2jLvDPSNdVnAKgtQZI3GyfLaGlaYSBKD3QHSRkZsOIKdDNuuewxqKC7leqKzzeA6Fw7PZqkiJ8hsD1UmM33lAbtKF2H9dqZEWe0QFI9hwmBRljN8pKgcvrXBxQKm74GxttRC/fSTjyfwsjxRrWfVsXLFKh1SyIq+XBIRkvWrQeYkk+OOTtQIogzpeYmFnC357UFpyKMUfsL4zL1Zsyu6vc70l3uHqHvLkkrODBqgbBqB68zmksKYPx/5m6dLFGCPqaoclLUm2Ackc1I0BelE6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooPYhxyNArj7Myv8VaK2XZHJcALTgUIGrjd0eWuPP1g=;
 b=Y7UbfXqI+ZzamKujPHODf2JI4qG0XP2NFcBO3ZyHEKeudwf/eE09EQfnyx8UPlfs+A9Y48YajpQtRQZ6z/79c3XoFsep0h564+dK8Wbzf3GAFY+m2C9l9rjM4r3lNFQciX1KyDe0Cw2OGAh4LcpYe7KdUQjGHkhnsc2qugHNGt1edGD/tEqwzEHUe+lgNDsHk5Mu4/FujQsSYbe+C4D2ByK2/I8QTS5fQ7R6jsPUkfLz6QcwmZjueKJ7v6kpYsPQrj1UYy1LO+W1q0qp1YeoksYJkBUITd4uHqc9KY4NYtg+UHfqlVw0iKh3DMONZ7X3KzT6a2qi5I0hb0FpHHDhCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 19:54:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:54:12 +0000
Date: Fri, 15 Nov 2024 11:54:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
Message-ID: <ZzenBqroyv4N4r47@lstrano-desk.jf.intel.com>
References: <20241115125614.857611-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115125614.857611-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e29b3-7cdc-4a65-e1d1-08dd05af46fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uRuRkEAYo4/Fq/v8ashwV00azsMMZDQ/kSkiqDxs3R2upuQ/caxv2R8/B20p?=
 =?us-ascii?Q?dUtbwiloNPVbBeIr/JB8LvdRJ6oq/gbdX617Wyws73CRWnqRJAfoEB54UM2l?=
 =?us-ascii?Q?21EtCVobj9VEQNQKeP5bzKUX8Rix4yod742kk5zl7MnGbJQ2/od74kqsoKLN?=
 =?us-ascii?Q?UPFAu0/QyYtypPrczE6/AHykii9l1gc19qhUDe3G0TZuCAJQP7O75g8af3fD?=
 =?us-ascii?Q?AqHBnDZoY28kYHgoL6ZxKzTWk+l5RHtNTXngzkQKW0mG6LfAa8zEurGfmaXM?=
 =?us-ascii?Q?gnk6o3GdSKopRFdbVvBazWSwmeyW27YJzS9SKE60JzR/k2Zz+diBjVAzg9YG?=
 =?us-ascii?Q?ZEVSfApR4WUouL58VMsxiqQEdXXlVPZaZm6a6/b2ftDydY+xZPZeed0N0UYu?=
 =?us-ascii?Q?iSssqz/p/dzpkzSfaiAhthENdKRVxiKGd0gfyADW9YjEiw5Mu795DSSzJIRr?=
 =?us-ascii?Q?XwFw1uTX6qxLpIL3rL4Eu/fKs5vVn3d2fcq0eqgTXQ46kzH+Gls/MBLfGNHV?=
 =?us-ascii?Q?HF8HVS+QT3/m74uTnAJ/JFkx5GYR081IcZx+D8PtV2NUgpmFJT4s4E1KN4yN?=
 =?us-ascii?Q?oSo/vw+xTXSd9/p2O64TDOuW6v+rdnJ2XtblnTgYMpEqROY6aoWBtdfbQesF?=
 =?us-ascii?Q?0wEwgswa8TF/vs0QRrVTCsNaixIZ2KWxjRfnMycZbCg7lpJYwDqSDF31qz1a?=
 =?us-ascii?Q?Ht8KnnkdF1LrPK5E2rIVe+2WsiaPSUabCT2RE8bPwHYlTP0bS4wU1AATdhDs?=
 =?us-ascii?Q?KP7xAtuwG3PTAP7puq9hDjM99ztPY6SEzXlRX2HWnCWuwQJHA+Y6gDEfho6C?=
 =?us-ascii?Q?JnQYaqLTmaSUFwR/9/TlgTBzKhrHkFZR2LRfa86/HwDYtNiwrabnc3+mmHbT?=
 =?us-ascii?Q?nJm0GXSbpTgDyELutmWepq6Z8Ifl7im1M6JjOyCS8RyuX/FYwRVQboQUcisR?=
 =?us-ascii?Q?d54IEJ3TddvJXM28IcNGAA9PO4/G6UuleI2owsn6A4zxnYn6emvkO9YNF/gg?=
 =?us-ascii?Q?ruQNqPLfhcziMcvpyvZmUlaXqprQbPw6KQRiplWrOPlY3uuCyIKHvsTrV+tq?=
 =?us-ascii?Q?9fMeqm82v1oPJ94RTkEGLsyMm3+KQKTjUkPsqeEfdgBWDtet/osCTngEtoON?=
 =?us-ascii?Q?3uFlA+JkKJz8pJ37Q3WpXJOboZ/Bbz9Q4nWCmzyDXem07IK7OA6mRh1rt8cb?=
 =?us-ascii?Q?g58VRFTDcMCQo6yIUDQEmu0LfclVE7MnuZNh2W0gVVXcCtTq85nsq6is5YIe?=
 =?us-ascii?Q?V8x8lXBPQkqxQSJAm0Bk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CxFE816eBih3KaH5VdcMUdBHUTWuxd9q3TJNdMigf5DSAHLpX60DcqEhzlPr?=
 =?us-ascii?Q?+RyUoUlp42BjYmeh/rwb6NDo/hPz/rjBMRKjdkHeAaWR1TYkjf2DmovIWSPJ?=
 =?us-ascii?Q?N/c8fzOFNt0oru/37Ws0PIsJWyiRWt/yio5NPAga3PRLIWqvLf8kwsZRyA+b?=
 =?us-ascii?Q?Y+C3EE5Av40dq5W2evw2TZHSK3AMfrUBGOxneXZWmQIRolpcbGdx5ltz1al4?=
 =?us-ascii?Q?VMYRLCg5xtDzq8hcLQ6pLC6glZMHLCkQbn7a5rQUYFiDDqPXeKLFrhV/q5BU?=
 =?us-ascii?Q?iXoWQ3C8WDkIrlFsMiwszrM9pW6OjOIpxPaOG1SvOJYsoN+Zblt7ubO+Wkph?=
 =?us-ascii?Q?ETHDo1c1klRLakwONpZjp9vMsxNhO7FJZ9ltS+nGxc97zwIFEGPXqc1SedwD?=
 =?us-ascii?Q?fZee9wTslETviH0pBusmhZwcyvOrV1MMcOgJ4n0hX8E0hUjIir5qgZxaAaFA?=
 =?us-ascii?Q?LMH+0hQkfz0+cIhDw8Bfv23AJZx3j55pACCOmPn3CccuIKV2kpFM1lixZVU5?=
 =?us-ascii?Q?WgWdAeFRVOeP2Q3JhiwugjcIE3ojrxve8+rd2jhdtdAUkkUVkI+nt9C2nh+7?=
 =?us-ascii?Q?KWP62+jLmoRGKN29/MtbvmpDYS81o1TZplITewVtWEYaDjHkFpCClnL3W3RN?=
 =?us-ascii?Q?8rpeb9DrMeNxwOfYhkyzhzRT7rei+BSrqVdXg3Gb9fGGvo0csJtYKyElTweE?=
 =?us-ascii?Q?ZO1j+31rACdrSca5+FAwC1qIwXvXsrzWz974u+WT19HNlNadfCcAJ8iOV9Tq?=
 =?us-ascii?Q?PWL3EhDN5OjAHYJzJW2B9X9p6DWtTuzfZ9BCJ86Vxx0h9hX4DkuNtTjtua5z?=
 =?us-ascii?Q?GSo2eDByiI1dP/M0PPV3sDXWfHqGOgIVvj6cxyH+w8kUimwg+QinktxwyWG6?=
 =?us-ascii?Q?1hpPk2+l7r7dzTFCXNm4i+rYx3VgtQr0Pdd9W1/3xd8jPU9X0vaFW9JUcVwA?=
 =?us-ascii?Q?gtRKeigE9hmi5DlfxJeKHkXv4ZpeZepMlVZ2+RBESBU5PPqkftTOtUgWb9oN?=
 =?us-ascii?Q?rSOYxwojaztAUSfqI8rZ1/loz1lHq1xRWl5cMEtRy2N4bb5f41gXLsKixDTP?=
 =?us-ascii?Q?RsJoffZrb71emdpw7a4T/Yxbr+T6iFDHINI+P24twwSxS+lL1A6Wm6NkXrhi?=
 =?us-ascii?Q?vCKM9xdmVI6aTy+iMN/cWGbVZqb/QGSgSIQU+UXzmTiEGufGVGoZWG/J6KEc?=
 =?us-ascii?Q?Wz1BrkMn31ueCXpR/FMpiU6CgtM631801dmL9v+H8MuA5m9u6T74uMSHerSM?=
 =?us-ascii?Q?M0Wlw/EumG9t7nA3iE9hah7RFH9AvEMEDqi1SPaK3xPAedX9gTRy0DxEb4cY?=
 =?us-ascii?Q?xlD4DpmDopgzGS40ikiIfi2lfpqpgMKXUtjvjueX7BgyIL1e4LVwOBh4HamO?=
 =?us-ascii?Q?F9Xq/pTAISu7jo2uxctPOstCEFrxiIe/PBdYsIpMxSyKna3vlIKVBhW3nOQ5?=
 =?us-ascii?Q?SlRkwo21+l+mcBmSguOjVhlpVOpp+W5NhIG/dIzZL32GED+4FCgTUN0mAx9+?=
 =?us-ascii?Q?k0W1Ubdl5ZQLMEr6vxRgc0ekpXyh216ArSDbLSEro636pRwiC7HXITxHSTAl?=
 =?us-ascii?Q?DlLWgLrjvL275zZSUHgOVP3FpHE0MRnfLOORhro9QsxD7Nw2yamxZlSVVZa3?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e29b3-7cdc-4a65-e1d1-08dd05af46fb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:54:12.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IV0X2hYT++v/EiQEwM2yE1/bmZEDJ5O0oDNVCdlmetlU+uqbgTKqSClyACUWRLRUDNiLmm9zD0Eus/apbjasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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

On Fri, Nov 15, 2024 at 06:26:14PM +0530, Raag Jadav wrote:
> Log throttle register MMIO reads which will be useful for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 03b225364101..0ce21ffc08dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
>  
>  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	bool media = xe_gt_is_media_type(gt);
>  	u32 reg;
>  
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	if (xe_gt_is_media_type(gt))
> +	xe_pm_runtime_get(xe);
> +	if (media)
>  		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> +	xe_pm_runtime_put(xe);
>  
> +	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);

How often does this happen? i.e. Is this common enough that it will spam
dmesg when running IGTs. I find messages which spam dmesg very annoying.
See this patch [1] I posted to remove one of these.

Matt

[1] https://patchwork.freedesktop.org/series/141426/

>  	return reg;
>  }
>  
> -- 
> 2.34.1
> 
