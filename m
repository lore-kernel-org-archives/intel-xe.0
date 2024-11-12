Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7E3D597A2
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83E10E236;
	Tue, 12 Nov 2024 20:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EibNxtGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EC10E236
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731443844; x=1762979844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k6zA16s48hSqoYLiO4kzv5vNOmo0G0EvcUw1/qS33aY=;
 b=EibNxtGyYrseiWEtsWaVjNB75vFKS4SnqKic/DYd6ano5y3mVdg5xdoJ
 9nM7y/HXV+z6Dylrn/SH9z7CeoHyBTf2nOHS9qV1LB2DuWxyZmpBCn4zD
 g7u7PCmEqpiTt/P2bu54rktQkeDz0o2YwY1ackasTUbvAcG4mXkvZSulj
 zeYqsmT9u3eebzrnZtvNqRH6IynxAtXdb3KzAhIQx2LBZbUPMtYh1Gvqk
 IGYTEdDYxvHysAysuH/4E5KQwRIjkmH+cww5Erk8RUToWqD3sfRcnAXOO
 a4vPLOPEf2gDzZTU/OeFVx5CHOSyC5eA+7uhKl79ZWObPqnXHVkdkM9+B Q==;
X-CSE-ConnectionGUID: bj0JhGfQS/S8bL2/9qjmqg==
X-CSE-MsgGUID: LEP5slWzT667oE60MxY+PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41932371"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="41932371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:37:19 -0800
X-CSE-ConnectionGUID: UgfcZsbUSouSP28fzYpMWw==
X-CSE-MsgGUID: aItXCIXtT2iAt4POm5fsEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118472651"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:37:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:37:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:37:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:37:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXU/5ZoyDRIks588Kk0DAa2vCAnepOi6L51GCjDpqJSWAazQ0tR+BHgpuDPJYQohZMn9NabL1+a45Qx8TfFeLnljbS/ZT7BUu61NCaSkO/Wc3gJIeGG/EXI8NRgGXZQkylUHCBI5xekSsMI7KLFWYpdM+erksO4Jm4ttWmnJFEhzEhuiJqPH58chQ7T4AISTm6QkI8QT/EhdkuCzk0bC/Q+7HIFHjpX9zUlzcnDIRF0HhZqUwBdUpTfFJfXxoVR57YkI3kMXaYnBPAa3vK5Tr3iMKUqhGIG97nnnv2fVuGR3oyFdJ8ZZFb9K/mpH/eNvTJl8xENGmD5MvL0RGTziQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1zzi1R+NkYxDzH8yDPmyKbWcnA4249QIWqu2hXZ9Vo=;
 b=QTBSXfoXPVg525OxSVY8gp848G8KXmlk9SCpsHt1jDUfJZkMfoKC+heJTkAAEiFKXhWxi9RHVt2YysowfjFhRvxgzHzgc8u1HlW1FP07sfQZ2HEojsQ4LMjV18ur+Xea9xs1UjDeRe03z/w8ZlTWnTwlpAav5Z+XGVjHoQ5z1F7nhcf5NdM3X8qdAlEfKf0TUEnuV3nPTH/+EhOcRhpY+qwh3duwWUKboMXfDZiJy2SnSKuTdTp4p0YRNL1vQqo+aTRlwQEohvl0gydWB75LqnQWX002wPKRG1dn0CCD+G/wNVSkyDDwmtU0i5je6BinuCvaHhWpDn2KJBdlgtJhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 20:37:14 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 12 Nov 2024
 20:37:13 +0000
Date: Tue, 12 Nov 2024 15:37:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>, <matthew.brost@intel.com>, 
 <zhanjun.dong@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Message-ID: <ZzO8dIiqWMVmMaWy@intel.com>
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112185515.64060-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 90258f66-789d-492a-23c6-08dd0359ca30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rwRdAEoIcsTrb4NIPOHSOHorao60ytrplLwaju+KbsCjDBq1Dz31cZe4pPJl?=
 =?us-ascii?Q?Ks7dP2qbbk6gTJFkNULFfg3hzCNd0T0e4FcjFImb9rxQj8SHPqsQT6xCVMk5?=
 =?us-ascii?Q?5v0YFqyrlZCtgtbGs6Do6tULefBUmfZjcgXQaPLi55uw8eYisHdMC0sLsXMN?=
 =?us-ascii?Q?4/UuOmCYtpPZTMopxalZvR9XaBhIHlgJDubogGFlzOXLNCn2EE1Z+q7kk801?=
 =?us-ascii?Q?LUrA2G+6ejVs/B/XD9Z1emJuu1M9rx0119w09AaUHNKUbsio5G8bUs+MAogI?=
 =?us-ascii?Q?VfjWAJXHqLS7zm4ADjVZrOVqG7wfTQdvkDP/nFwCjU6PK+Dqw5l8zO4g2gNa?=
 =?us-ascii?Q?KXb1Ypjv51/mRGP6ucqvd9BAH4/nxSVV6qZzPQj0G+IbS+YQ4WG5BAF2Pm4f?=
 =?us-ascii?Q?XI16NhZqCMaeBgw8M2IruVeUMuPNmc9M2k5QqjrM9HMTNMoOikD+V8+GsLMK?=
 =?us-ascii?Q?evQxgjCW0MwKH5evMMBWyiWWV2L3RTWBveqp6wyGUHWVKq+Fz1M547c1J4ne?=
 =?us-ascii?Q?e0ul4xPSvEWUFflVQYS37vGmWaPj6RlF3v2UY8CFT/+5v7p1PJGmqbqcSfzE?=
 =?us-ascii?Q?bnvpvTdf2cJhvT2vvKL5cbGQyGgiY0GPQXQfCbxcEAi1pC5UybVyN6ce9KV9?=
 =?us-ascii?Q?1nHu64ejuLGAjRExCdhPv5OGugjt0y+DR6TcxujXqfiq6ShmS1pvCkaVbsRm?=
 =?us-ascii?Q?EyamxkBX87ZoIeyIOVagWjVboFR4nE4CqPs+Uk4omhU2za7a2HddyixbIEDV?=
 =?us-ascii?Q?GUo6Kx5cvPACuv/cAybIo7YkL4+w03b16HFt8r9fVD1zdWsDj174u1WnZGWz?=
 =?us-ascii?Q?dBet2+5Py1zY6cnJ2hP8QJYyCd9Gne6KVWvyprpcxxJ+h8IdmniOxmLUhfA9?=
 =?us-ascii?Q?kICTHfyEwqqH4pnCZjN9SI7mFv1XSQSAAFyqZVdeB7sWSyUAvO5KkRYbpV2h?=
 =?us-ascii?Q?8rhh4dba2cXLjQOjrG+ehUyR0Tz/92zXGf2CZCGVIvt47RCgmNylUocf/mAz?=
 =?us-ascii?Q?+x1PSQ8tUR1J7+3M81D3w9/VwYYc7olIuuaB3VZnemKiT4th96tqLO3jZ7Pt?=
 =?us-ascii?Q?BTWoQeTod+dCKLtzhGD+Iy0olbXNInOjZvQnVOUEnwiEisqpqjl+MKUXudpc?=
 =?us-ascii?Q?iyg5o2INDKhhQ1d891yufdS7z9rjN8J7Yi2G/gzsUbko7RnEPORnAfrIEcnH?=
 =?us-ascii?Q?pjb6GDqCbrkiNMccp2/W2Aand2vS1BLc4NGNK4ObAy1PBXKS1n2Yr2Y4/+Yw?=
 =?us-ascii?Q?VGs4k+LemYw8o6sThZwoa31lhEC+t1/8029+VPbAg0lN3T7y8WybsrSR5/pu?=
 =?us-ascii?Q?C35JeOXwFNnMadFbUDyTP7Ml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0HdRGCXF46AXocjG5mz2snm2SsEGJktdjYrN0XYIor9uAIHiv3+DjycMUtjX?=
 =?us-ascii?Q?bWkySA9g4daHfV9l5CMQoL3Y9MM4Euroc9GgT53YttCt+F4KVFiMz0K9yj/1?=
 =?us-ascii?Q?qkmtwDDpr19f7BW4MDr72Z6S30cxrpBLoA8djKc3adQQ1dojflUr8tYPd5Vc?=
 =?us-ascii?Q?JfSncK56KqjJ7bH7eQ39iGb3OJnS9/eLXFeIXZ2ZXaKtJdqpWXC7lV+yqMs9?=
 =?us-ascii?Q?X62w5Hm1AZilXDkRkyojk2OzUN6iFE7xxEOWvvz4hBV1e4jNp/7m3wmwxqK0?=
 =?us-ascii?Q?r5jt8W81c6YPHEnwcPU3UJMEMfQy2oiemseEvKlYEa72Y6Jlfz/gcF4ThJOK?=
 =?us-ascii?Q?5zY9SPhOhGCuinr6LgtnywbKZIWYaMMp8Q2MmFh8rNxSQ8siIEGHL6Zr4vIQ?=
 =?us-ascii?Q?/KpkiEy1+MAH9bUG1gKgnAafHWIkvFwfUIzam2nX0b0hjzDZIQ/cPSzuaV/M?=
 =?us-ascii?Q?xV/2uETZPqp2iA10aVPkvVDhEYh0WQI4enFr2RHOA02aH6Nu/YSmtIzltq9Z?=
 =?us-ascii?Q?SOylomyQNzXGv7RjCWPshrvwElY1OPRufW650m0rNKSi4wuoYbFx6uAYYmcg?=
 =?us-ascii?Q?xJxUNhEq3YhEgt/oY3pi7T+ltP3lcDfMaUdcvyAPDpScOc+A3BGPzk0bpLXv?=
 =?us-ascii?Q?CL806/leFY9HsWy7lHqY5ymibYQv53pBD+eO1on0wIBSHY1We5btK/1ZJwNO?=
 =?us-ascii?Q?oM0j4kB/YyezVKB/YVkGv89+G4s6sOE+WlSjqrWasE9WVHuHi0NtTycrZG4v?=
 =?us-ascii?Q?iUhrAUiNLZmuUb9HEdUSH5AeAfoEYJTqD3IGkeDylm0zUXfHx9LeyUvo+rbF?=
 =?us-ascii?Q?WVp6Png8REVyb1grqTumZD44A5OAD3WENQJr190WSixGYoSYT/5LTUOMmKDD?=
 =?us-ascii?Q?hDdF3AafqMj+cd9ycUQ+e0SUYpGMzRdqV3ThxOTWseYCQ714KQw/tj4fFDE6?=
 =?us-ascii?Q?aJqK2HgC+GA05QSwUcYO5AI5mZbWnIplTTISDCJcKYtJcepNNB29DMGB8iet?=
 =?us-ascii?Q?A8LAgwVtxsFsUEMXJumiPVrNFSv2BWS1HRM1yBK0riL6COnirLX9+hNy/f6J?=
 =?us-ascii?Q?uBJLuA/RU94PiCgOdMISmecjbdJ9pduIjONaWSMXyjJgjH2vmS/y0K1w6ghd?=
 =?us-ascii?Q?G60c6tMB+8EeyO+nKScq1uSJ9Ux0zxrYsCNkGJtysG/cGvTgdp3cbAlqvBdt?=
 =?us-ascii?Q?cQbSSvh0/YZsFBUs+T2L5a+DdoWcqvyGq+CjGf6NA13hy7i9eYAziLKzxkai?=
 =?us-ascii?Q?b1pjIWPZAEkpbUYm/SOZAptBTEBxes3p3c4h9z5G4nocUCTqwPr1eQbnDLoW?=
 =?us-ascii?Q?obL7VTucFnFomjbqkTL/HmbCY1GhAPAAq7vAyEzc9/ilrwYmA++vIYuE8yzd?=
 =?us-ascii?Q?w7rHNMcQKBbSTMFNFQCojm01hOYu9AVUfxXRXomzmITv7w2JJAjEkr1W2udb?=
 =?us-ascii?Q?KzlHKSU3wS9S1p6xph6zxf/cE+o/XInJp91hChfZKPckSTw0NlIbdRFcFi84?=
 =?us-ascii?Q?H7Kdb9QCGx3NlNNAwjs8laPlHQ9O6gk68Dk+NHoAoXfNOaxsnKg3XsnUq/sD?=
 =?us-ascii?Q?UXWbvhoov00idvNPPH83SZd/YGeJBE3T9kGZHh/PTeTMmvW/K9MLvA9t/Fjy?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90258f66-789d-492a-23c6-08dd0359ca30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:37:13.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGRkaE83tJkivCCezyv6ChkkDD9eWtJEmGonUSdsmJA8/WBjcNBw/+9MBSnAlNhL/SdH7PRvCwmMQEqMrN8d5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
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

On Tue, Nov 12, 2024 at 06:55:15PM +0000, Jonathan Cavitt wrote:
> The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
> term used by i915 that has been incorrectly applied to some of the
> attributes.  Said attributes that use the "desc" qualifier, namely
> "context_desc" and "indirect_context_desc", would more accurately be
> referred to as addresses, so replace the incorrect "desc" qualifier with
> "addr" in these cases.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Zhanjun Dong <zhanjun.dong@intel.com>
> CC: Alan Previn <alan.previn.teres.alexis@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_lrc.c         | 8 ++++----
>  drivers/gpu/drm/xe/xe_lrc.h         | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index cc72446a5de1..b95c21a18c31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1632,7 +1632,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>  		if (ge) {
>  			guc_id = ge->guc.id;
>  			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> +				lrca = ge->lrc[0]->context_addr;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..09f0e66952e7 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> +	snapshot->context_addr = xe_lrc_ggtt_addr(lrc);
> +	snapshot->indirect_context_addr = xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
>  	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> @@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  	if (!snapshot)
>  		return;
>  
> -	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Context Address: 0x%08x\n", snapshot->context_addr);

Cc: Jose

This change may break current user space tools. So we need to avoid.
Everything else should be okay.

>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> -		   snapshot->indirect_context_desc);
> +		   snapshot->indirect_context_addr);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..f6bf81009294 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
>  	void *lrc_snapshot;
>  	unsigned long lrc_size, lrc_offset;
>  
> -	u32 context_desc;
> -	u32 indirect_context_desc;
> +	u32 context_addr;
> +	u32 indirect_context_addr;
>  	u32 head;
>  	struct {
>  		u32 internal;
> -- 
> 2.43.0
> 
