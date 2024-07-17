Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259A8C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 23:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06E710E17B;
	Wed, 17 Jul 2024 23:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWpWOphv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102B810E17B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721258412; x=1752794412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49egMw5RRmD8JI20zwwerEG0OXhH3pdMuBYOhxMJBoc=;
 b=JWpWOphv4SK9MLBxjtadolw1iGnrtupQUnlf+l1xKIwq1r0WvY7Gs32o
 33uc3oj2N2geK1kINKyLmRmJM9VZsFkR3UYNiKArOGag8hth+6MvDJUs+
 PTC8zSllen8I1s0Wd0eEtVAvbnCUAbpk/P+DtD96BhUVD27EYVTqH526D
 D+QchLoYs4r7JatcGKUuoDUkS2aJ8s39VeJX6R8VgBUVQCQS8Nck5ld92
 UhvucqR0QhAiiFTn5e45eBIJzWZeCGYrPwba+1seN1gbmOY+oreN7x8M1
 uwCleQvwkUmq4lDsiumcc820UHC+KgGdSEG5fVSqdoiLuFzdaDQitb/1p g==;
X-CSE-ConnectionGUID: 1JMq6vB0TL+JioKeF25iVg==
X-CSE-MsgGUID: X/pNlPCvTIKzeNeePbWnaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18416999"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18416999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 16:20:09 -0700
X-CSE-ConnectionGUID: AdCANFmsRdOcoWL0f6dKLw==
X-CSE-MsgGUID: DZRumToMTzCAiqYqK+aoTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55390153"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 16:20:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:20:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:20:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 16:20:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 16:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc7vL02+tEP/lCsWRRlmx+hLqaHJOXH7AkbAxrZqME9b/QifBXDbYzF/hbJOdPBaPCQuUvgWC9eV4MVeEcoqzBcbfJ+hb4qo3HqOeP8bd6eEDx7hu2suh+pX/jkTlIibhdScu8opv/t3/BHmdhp3NdrjDzxqvvGvGhrku+Dmu0dqu5VARLi5IkjdySffasj33cc1E5AQEkxwMks/57FdF5zeAlb9F4/tZruRyn3YQYS6EJCOZZn4+bPTyHKL5yfDnPWNfXbBJF/s3+guAEDcLZMZwsJuKEhwamOxzvxKBIQRFRfF5wIw8W2dhkijBHfGLpjjUqRhsrwGAcUUah9p5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX/jemKFpWrcCEIXTN1AkQn1yOR+dYd5H1SkNun45hQ=;
 b=LXHZ5tQpEc6SWUDtXDR+Vcel3HyPhI2XM4tdp5TUt5b3cbKX2ewdlF1DXp7tefJY7HpkjQNL7flfiTiNvVB21yj7qOoGTMNHYVsGu1b66p2IXdjQ6T32s2o59czKI2Sp25rYdjxOwCrEi8PzGYIl8F70Rvg6gujkgvuRysO1XpLX8PAPfS+G6YUe5H+BdVc31y5zrD6r12heE7/H33xVjVZX8oWmSn12yC6tU4EiNJr4tlby5nCo4YaIIru0AZwSkv0500FaaXL9YRF0dFYk3Hn9Mt69WWJHrcNlik2V68T6VfA6MRoIazDASjKPUiHY9EhfRDmM+IeF5qpsn6IV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 23:20:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 23:20:05 +0000
Date: Wed, 17 Jul 2024 23:19:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <ZphRcXT8IkwUWBOW@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-4-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bc8867-964f-44d7-2e1c-08dca6b6fe07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W3tP9atUh/E7FwdTim1Cx42B9ulT1DunVDHwun3KYa6z+QyOWincBZZvAEgv?=
 =?us-ascii?Q?BnOXkKHQmZcQlzHSNoPLrsd1jYzlZ19u3IgtkOyjcEx5AgOkvS3rggyRDjel?=
 =?us-ascii?Q?h+77L1vqy+qrfzNJyxsqgI+BSpTU5eTko9271slPwGHWoTtNyKz+17yplkpj?=
 =?us-ascii?Q?mCmhSc4rcRbg7Uh6fOnsMZCrpsLG+DQNReMJvF7PPqazQzAXCO6WWeLbAxUV?=
 =?us-ascii?Q?ygqQHcLwtC2GEilXD8RxSG7YyNtHHZp/1v7gcsua9X7vnpHChlr+t8T+1jzu?=
 =?us-ascii?Q?sXwM7gjt83ONQFQyzLH17mI3oY4M2iIuVr/flYM34ZHKK2TLZza96QEFLA6b?=
 =?us-ascii?Q?77kTc+a1+0inoH6cOmaU69V8iuxaGw03t05fQnLG9sOBndnUnDExWtSNvqox?=
 =?us-ascii?Q?GGh6PtGF4trKlWRBrgvvJv/DtDB4x/+LWuxKx45v0+ssFXifJHXQ4W9Y2Dj+?=
 =?us-ascii?Q?HCZrGavlENA11pWmok6BRWqQLCc0gaSO4zyqWGhaFbBAuomhv5a4sMcnAXrO?=
 =?us-ascii?Q?Pe0bF6uJKzNvvAIczyQIAm4+HqBs/0R6iRvniYn8Ab8GRyOpTts9lVQMGHbw?=
 =?us-ascii?Q?1pInq9KwvmTt/7Lt06/1QA9/w41nnuac92SiTCgI7mxEGfss6dhC9B7KVbrY?=
 =?us-ascii?Q?LH+4dAO/lXjlZnaJIRBGF1ecLq8PvHsZ+x9CcG4/ZpYwUBcOZJlP2Vf6dISh?=
 =?us-ascii?Q?KqC/OZA8eShO0FUdYgVwuuxsi2xqLOpcl4H+QCAX03tpHXRo4QlRMv3p7jPs?=
 =?us-ascii?Q?ioxDhNhw5lWi0Ckyp+ET18UG+IOjuH44EGrb9F5ek09unEogFWrTtwcVdDnS?=
 =?us-ascii?Q?CAp7hGNTwRl0h0l2MvdfZ4nu6tAqTeH6bbEqBWFKr+zCxUuQtHyvO5G1CELR?=
 =?us-ascii?Q?B3p0dbB6ci89ml1tJyuT1neaEGovRVIL2nt2n+wjtZhBrPsykkObtjvMAx+f?=
 =?us-ascii?Q?NRlkSSarWlPFfVsxwVyFujOlI3h69OrZr11LkfExG/f/M/S+Bf8B2DajypQ2?=
 =?us-ascii?Q?5WTeYTO9/jyAfug1r8y+p9OHrLHvRa5zVjOJ5+a3btDOxqodDc54ZubQO9tw?=
 =?us-ascii?Q?LscfRaiNFz6Ptlatj3i7MO7UJGMkluMy+s3n2Ew3swjHIom1V0qTz/4WI0Y1?=
 =?us-ascii?Q?PGSIoZjzWktWYx3mkmWAjCx4dsF9ELUSMMmbqkfK6WOUduVfDiF2TZ6T6QKE?=
 =?us-ascii?Q?KAn/QcpRdo7XG8Q0XD4uS08V7lXfcSGBTLAGRSA5LTNKao3FmU0WEUWW2DDT?=
 =?us-ascii?Q?0o5EAXq+YSSbW1FZDsQ8+K8A6D9DdRBEJjCIvJpdo0L/8MVwCqStitT1cGlV?=
 =?us-ascii?Q?R3VKkMAkpSCNX4lMXErHXZReBcAEXmloTRPrSYgXmm0spw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2HJh1PbN2BkJSO6Utf0SyQDMnsdIz1ykwaQ9kuf5Lz5g/USWlVKURWDP7Ga?=
 =?us-ascii?Q?mSwNl8FeYItCioSiJauK4w6jPmRGrhsQ+JjUlGAeJMB+DqLaukangDqn2A9w?=
 =?us-ascii?Q?jh7NJ6ldLZhKOuOCcUExsSQ5sXKozoo9UG3SK7LMdQKpgSkctpT+X+GF3ZSR?=
 =?us-ascii?Q?4YJFk5esV33hqJA1KbCQvnsZUYg6V1P+0X6qqhUhRkDVUagD0F6WLjF6Qni+?=
 =?us-ascii?Q?RQ9XwnXplrluy5ZY/ihMVZoOAQKx0pF8Cz+laWgAgEovSVkAaDIy0EcSktb1?=
 =?us-ascii?Q?5Ogz6OIiFrJgWNQlgI+XUl16nCqfXAxcxHYKB8Ke1BqJPm4wbOFZ77hv/suC?=
 =?us-ascii?Q?ayIfGnfEBD6adPeK1QLycC9+xt0/cCkkmFvqkdev9GqUM/w55ZTsNQLQYZh+?=
 =?us-ascii?Q?8C/0Nqcd4TdKcKenaj0gr9ydj5EK3aV8A0Loy8hrzP+3kkmLv88ZpHmOGlGV?=
 =?us-ascii?Q?xA4h+OGJG6zzBTp7AQia17O+VqkVZ4xxdnA9lFPVadyduL3m/0pPmnd1Qsgt?=
 =?us-ascii?Q?CqIbju9AlV01O4sS+MIOwmgSrFFZnztmLj0zXW+boW7xT8fsx03w3MLdWZI1?=
 =?us-ascii?Q?5yQ7V9TehqfTroCDdC2GVCir6K22rd8Mhwy5nssmIdYG9NiYMJth3PT9IcLp?=
 =?us-ascii?Q?CpH9OqQIekjJAmbgSZvpGb/593CBMBRwORqgr7C/g1mKEKjbSRFqhWKa3vN+?=
 =?us-ascii?Q?Twu+Wjx+nEZdEDDwlIqlHFSpcddAddVJ30PTsS+DoyYLKmLOELAOMTeO4Eqz?=
 =?us-ascii?Q?iUNtrDaM6lkH5dQubkbW25D0uXr54QNHi5TKC0BqqLsV2IObuVi2JX0+2cfJ?=
 =?us-ascii?Q?zjg+/uKP/ke6Vk76qCUW+lAymKNXPLv1DrijfH37rFpZc1utMTfLPe80fDnC?=
 =?us-ascii?Q?R1acmuLYUmbbqpucZIQ8dpDrk43bLpLsnZZoxZD4JD6YXcV2TJe4JduFTf4S?=
 =?us-ascii?Q?rmBDMymK9tPsVYz3esLzQfUKPj8bdqOCKiBZldOL9lzvJV+gdL54SGDYMeGH?=
 =?us-ascii?Q?0deNHLYDu53ajGgFECrVeaOyJBHhN0QrDq1HILETkn62c+rRMkiiXF6IaT0g?=
 =?us-ascii?Q?jRkC0E4aT53xwHCTgwNV2Vo6ZI3Edj8JlA+D5na0yqWKzkd7j+JX/4u+0sOa?=
 =?us-ascii?Q?jkDE9FywH4Hh2y7xqbAzOwrRrPaHZeDtGNMDN9KC1RuvyYCoyU7cxaIeg/MT?=
 =?us-ascii?Q?E1GA7JL8aaNXDhMipP4ro1zeXypl8UpzkURoMuxX5/3lclVpplxgn1OR0VNl?=
 =?us-ascii?Q?5XOrcN9V8CuHDBnsf5d9tjB/QuChphzpmwjSNBM6duVVHWK0sSvVZFzl70Wp?=
 =?us-ascii?Q?zn7cBmTpBX4zvYh+Ux5XDRMqKhoEsEuwzInDbg/4MPf4r6uRRFMc+w/fw4CZ?=
 =?us-ascii?Q?RJqXftMqbrx1SFms8+wVCjobOqC8ZJH3zkOC64e/ufgub1l6SE0A8LJ6rHdy?=
 =?us-ascii?Q?fz94kpObXMjNmQ2mGMzczCYpgBbrmlb8T7Ku0ebQejKLrzkQNgg0A+vGJDur?=
 =?us-ascii?Q?dZqCTnxvz42tVrTjC89HAEwFB+ohPjioBxHcfb2Q18cQNGL7zEHWCDPvObua?=
 =?us-ascii?Q?FUT6Ejy5o8E1tZPT7E/lRVi22Xs+5fZWXT1aj2+M3UOfqfDmZwr/411Ln+ct?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bc8867-964f-44d7-2e1c-08dca6b6fe07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 23:20:05.7117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9qLiNgEeqbe2zHy3MX7jgSP1jMw8hcH+3+o/rXwioqwSYKD7b8m9XMe1WY0yUe/pxfGF160IMSCkBUnA1vSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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

Ugh, missed one thing.

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
> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +

You need to ensure exec queue in fault mode as in the suspend state if
the group is in dma_fence mode:

if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
	q->suspend();
	q->suspend_wait();
	queue_work(resume);
}

Matt

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
