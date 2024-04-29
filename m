Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A60FC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 13:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AFA10F611;
	Mon, 29 Apr 2024 13:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBedj2VT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB91110F611
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714397288; x=1745933288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dnmhSBsvlcedE549/VhpTQ1sV1U9RlEC4gsRKDtM6F4=;
 b=OBedj2VTNWHts8qeClxTdfSlu9epfMPHepKsoMStY9IT2eyFAVH1Ktv6
 XkSwpIBjwmalUe4EpZgI0y6nwGNIj0nIASJMs6XnRY4bCiQdTuzhMKHX0
 1RufpLhzNmDvibcfkhN7OQ8BXSgA4yb0UaYrdifkNaw7zXiGDgQgmFXXs
 9T7f5XEtiT37So2hUjkECtlhPkVrSU07/pVyvdJt58eMCelx9SkyYRNR8
 HmXcxK1hCQTvdkT5l4a/elciAT8evpYDo+ulZAnyiAC3bVy2WtZzi7ONF
 S/m6uSFapO5XdXfeEXbwrVA6MtMh6/yQnEnDmtNCiFU+1NKIMJdTOAgLb w==;
X-CSE-ConnectionGUID: b2r+YOxrRJKPM9B3mECYjA==
X-CSE-MsgGUID: FGVAxqqiTXWymmucBr38DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10591560"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10591560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:28:07 -0700
X-CSE-ConnectionGUID: EUqjxJ7sSFqTHl21rW6CkA==
X-CSE-MsgGUID: OeN7k+okTvGzSs7nz1/vtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30759703"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:28:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:28:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:28:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrwTDhJ2O9QBApPUKXHhgYI9owVUJsJ3TrjixJXjBoQRKvX+kxzLr4J9b8bRhU6p3gJc7ZFyPR430wu5cxhD7NAAsdwDqZOGotYVSwHzcCeMYUckQ3rU+daJrfPMJNAJGxvNirKpjXHpALKmQELt+bpJHm/FcmUEbK2kD+Cp6gBPKL3YxLdXCRv2Ghwr/OoSYQnzflqp1LJD5KCnw4TJ7mdOFn2MmUB50QCMgYB7EwvnXGhhqFYKcVp3Habbwj7TKmwx2kesbfacHNtJrPCTAeDs4niZzm87JW/kw0RiKaBX2/Vrji2WHmBis+4jQk7XmSjA1TWkps2vbW2/+c02AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwmCD6HffWcerOJFCNg2SdDlQUdkBE74mLri7a5uKmA=;
 b=CIWj6fBMQ8T8oft8NKYPUolzxe9dHosqti0i6ozAAPxtmpqv8BPZZb5Anln3o6J+Oc1M1KdnU36Wa26ICSCW/vAQUNH53uoW3Zor1L9AxC+19oj7A7HzhBQ0hW5K/COE4Y5y5qdhtdRhnC2mRopja3bhWBKxPb4K1URZVxa3eoLTcbgUmPXeSG5d6Twj+AqcRzsOOp/bCV6XkxNWkDw7jwI9mdBVc6NIiU54LE2tY4PuUulO6NFHVE8Sk089N28xfxz2F5C+i7AANK2ISLCPpuXf90M3vhzc0JTl84h1toUo/pJzOWiToz7vZoPbr8FiNNjm9+090Ov9G2FC8lOzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:28:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:28:04 +0000
Date: Mon, 29 Apr 2024 09:28:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
Message-ID: <Zi-gYDEFzI_bXCzP@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240429121436.33013-10-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 008e3f34-9a4d-4cd7-c236-08dc68503277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eRCsj+oQuLwFxsBIsuVs2D2+uxBnNstXXNwTRxv59iWN4b0H8pKa4Hm2bba3?=
 =?us-ascii?Q?yi+QyqG2Q364sbYe69TLz62CJE9sktM001NZO1mIBTEiogIFgpe5THwmLg8/?=
 =?us-ascii?Q?/6JBcxqqDtA8Hy/wMzYipZe4SAYd7lfygleB3oa+WpQkkkfglMdpp7fs1Kjj?=
 =?us-ascii?Q?DOU2FcEw2KoZHqWpDGDzU6PHeKKV1QXfPyVSvkWZ75HrquS0DkSK9fbU2ddJ?=
 =?us-ascii?Q?a6cT25WCwvbhRiy1IHegxwGHwjGOOtaiaapku6Mij18rdH8QcqDAb8k2hP/F?=
 =?us-ascii?Q?K8lMru+8fpCOl+V2Y6a+ZzTNtpfzNtBNSVBf0icIvP8SbDRN28B8GawCEPWD?=
 =?us-ascii?Q?RgqzXRC9haaSHWFJ0OPtScKo59hgbMMnhDtlBcrYqLTdQfqfW2y9nTeEjeJ7?=
 =?us-ascii?Q?RTYU6Il6+J6jaPV5QgItuvYyzWkwbeIzptGG9BohR8h9FHFt+7QRbfVtFBra?=
 =?us-ascii?Q?2dHyMWyDkv7UPx/k8uzWtkE0gWTFZm5ga0NWfPYkNSOXpgYlqNA01lLF7pPD?=
 =?us-ascii?Q?4ir2lkXGOsLz/0BubHYr9edmu5riht+2FolXP8CRK5TJfar5F3AcIuUtyl6c?=
 =?us-ascii?Q?3ENuYb98DARD9YGHK+sSJE8AvFQ1V8nV5YFSpV7EYnGa8qTIop7GBLW1qpkz?=
 =?us-ascii?Q?lElbTvsu3u0b8khMRhDKWD2cz5aXlGSAY8fJ9Aj0pQEm6tORZW5Gg5BVNVvB?=
 =?us-ascii?Q?rOU5t5Nrw8Ev40SL1mNK18a5PgdfYcuBQGGcpEGrS7WgvBNPnY3aCrq5abdb?=
 =?us-ascii?Q?sqlbLBGTlWXpL0hTvlMuHrt95pM3KZPF7hVLs7Wq9MPUyh6Jyx/zcXQwXRxe?=
 =?us-ascii?Q?vLWhvS0GQacJYhiPMWdbHIv99giBKauXzO/p8IguG9q8DVyBlaKpSf5a5dmn?=
 =?us-ascii?Q?yhg+IN/wrTtzm6oha0PSxKGRTJLbUExlS4eJW5HGNhHgbJZ3xv4uuV+yMnd7?=
 =?us-ascii?Q?udD+evWWwcjg8921Es6XtmEDpBQWl5KcgQzXDk1d+9D1OU7vzev0EWbhKp/u?=
 =?us-ascii?Q?dNRUO9cZ9pi5FGdi8kOi30pIfUcriHNJ58FipkvIqbSY2epyBbQgRHbJZVJ9?=
 =?us-ascii?Q?F56uZ+2FoD8kPOBDyQTlzU9Ds5zqETwazbLmn+XU7d3GHyJEIXTASvEam8C2?=
 =?us-ascii?Q?DYntjcDo1K60yaKPPF9y/4ePv6ifube5KkwiF18RIjR+c0rGmdckDONEvNrR?=
 =?us-ascii?Q?UW2E3Q2Biq6stcZTnVYDq2qGD4njwZ5z9hQN1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UT7VQZ78emOMeR3DrCFIwwIUVbJd1z8oYzb71rD/8IsT9XZnsx2ElYpVM4o2?=
 =?us-ascii?Q?3lQyvoC+MhpZYyvZJY8sCmpqA0SCCm526jzneDViQfI5Rpi1JcbtgX4L71Lp?=
 =?us-ascii?Q?9i9Agpwaem9lLhRuKOW0lBxQyp/DfMXAknaODikKJYdTmQlRvR6VM1J5VYal?=
 =?us-ascii?Q?eWxRn/lCXDs336BC6027k5zyj7hNEPVteMUTt6HZgoEUEmV93ZKM440S/a1+?=
 =?us-ascii?Q?dVLqN0byZpjJN/4P32iofGULaX41viLkWXtJR0oVc4muBudOLpbPX1au9GPs?=
 =?us-ascii?Q?uyUGiBGp8Y7Oc4TUJefFLaj1oZtsKRFE/CGNVQtndEQXMQ81Z9WGmKCnQl/f?=
 =?us-ascii?Q?oFGmOJgpFNSf5vi2AdI8mo9GSxYsmj3ZcwP46AbcadMQtwxS8b2eheYjuC5j?=
 =?us-ascii?Q?gRoCXUAMujR1BxntN8XmrmWCMD2T899gRc9/N0Iugnmt3kfwe+w/U1rmqCQ9?=
 =?us-ascii?Q?VzThRHH11zmD2/eDyt2eMl2WAExIv3AnisltzD15n9Ghgn3cj9kpUFaVzN01?=
 =?us-ascii?Q?qO3wrbD7OgjB8nOGEPvzHGBBR43dMyxfA5evxBco+wYZSHpy03PEKZVOEEuB?=
 =?us-ascii?Q?6osrSDccQRaoRyyzRCGOfYl7Q3K+7TcI+GKbe24hXlkOj4iLStwh+vVVUVBW?=
 =?us-ascii?Q?P/1gntE7lfFQNdapUCkFZPvLVrG9pstqMfvLjGDv4gAqPi0fisqxoD1xVYd5?=
 =?us-ascii?Q?6w7VP1O7m5cy0Gpr8LsqNBD1zyoOUvU7037rg3id5eck+vMf+7k1T/nF3VjL?=
 =?us-ascii?Q?6QF3CrcqDrVQt3dvGdskbW/wcJ9xyKv9V+2j2SYB0GDWMXgd3oMM8JBHN0vQ?=
 =?us-ascii?Q?sZDxIN8ovaZdlzE5+MFSBPDd7c5FCgAhwCW1tFaErDTe/+KZbch/KrHz5qJF?=
 =?us-ascii?Q?d9eYJzGCmT35yN+Wc8Y1DzmeBlNAjvtvDiLbzMsZRn/ncS4EtSAapPemmXCg?=
 =?us-ascii?Q?YY1d0ZLXDcpH7juTr+JneBp1hsztpMpUigvevLnmEcWsc2FLXiqZHo15nDQA?=
 =?us-ascii?Q?bglKmObwD7ZVUUTR+Zrpt1L3Bh2hPQJDMpgfuMfYE7hJMx8ORJr7K3gjemVW?=
 =?us-ascii?Q?teQ1GsNmmniFWuMwMgHvoHvaDDY39gwFwMm8pONoAdBl6n3frwva5dQKg4yb?=
 =?us-ascii?Q?vvYi5cYdw49Je3ZJvq7R9FeOY4Asq1LgV5iN78mkvDYaqdK8v/eKgEGiy3KD?=
 =?us-ascii?Q?NHX4MvJ1vaVY0ZIF3AyZEpnNK/O9RrSvFFK167F5L/Klw/3TwTpyjV4y/n2O?=
 =?us-ascii?Q?uadmdIImw9ILSyp7VynweF+J8pgQg6nyY8CL+3EwivsHR/ei0/89WLm3I7tZ?=
 =?us-ascii?Q?1WZnrTgqqztUtIxu4oAkT/w0IwIN93zQDF4JziKMP6VtvzDtv+VTLSZQNuvh?=
 =?us-ascii?Q?FcSD1iLJccTTPkGjEI8x8FXYhrFCiGk59Fd4zVS/7R0nVLEH99895YPy3mG8?=
 =?us-ascii?Q?WSRa/nPturGgclIKex2vbLm9d3u0rFCHt3KzqQDJJiZwvmAo2OYkyXozjrim?=
 =?us-ascii?Q?d1KziUnh6oh/EdDQXJGmxFcgjNc3UlZlX23aIVn1EajRrUYMfCBN43W5vQss?=
 =?us-ascii?Q?blvuS6j7/5f8JzgS2CydTvG6LoY+H1jm/W/wBG/T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 008e3f34-9a4d-4cd7-c236-08dc68503277
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 13:28:03.5680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmFbpck7QwUkoA3MMrEuPbv4czT9Yul6LHlnm5AZih1/FNwWbYo3oK1/3av5RDqvwbZ0qr1Ua8AQAhSYR+9CGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
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

On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
> Hotunplugging the device seems to result in stuff like:
> 
> kobject_add_internal failed for tile0 with -EEXIST, don't try to
> register things with the same name in the same directory.
> 
> We only remove the sysfs as part of drmm, however that is tied to the
> lifetime of the driver instance and not the device underneath. Attempt
> to fix by using devm for all of the remaining sysfs stuff related to the
> device.

hmmm... so basically we should use the drmm only for the global module
stuff and the devm for things that are per device?

> 
> Closes: https://gitlab.freedesktop.org/dt srm/xe/kernel/-/issues/1667
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_freq.c               |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_idle.c               |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 12 ++++++------
>  drivers/gpu/drm/xe/xe_tile_sysfs.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_vram_freq.c             |  4 ++--
>  8 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 396aeb5b9924..890da8870b0d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -150,7 +150,7 @@ static const struct attribute *gt_ccs_mode_attrs[] = {
>  	NULL,
>  };
>  
> -static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
> +static void xe_gt_ccs_mode_sysfs_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  
> @@ -182,5 +182,5 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gt_ccs_mode_sysfs_fini, gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 855de40e40ea..e0305942644c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -209,7 +209,7 @@ static const struct attribute *freq_attrs[] = {
>  	NULL
>  };
>  
> -static void freq_fini(struct drm_device *drm, void *arg)
> +static void freq_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  	if (!gt->freq)
>  		return -ENOMEM;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
> +	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 8fc0f3f6ecc5..9e907033f32b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -144,7 +144,7 @@ static const struct attribute *gt_idle_attrs[] = {
>  	NULL,
>  };
>  
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_sysfs_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -181,7 +181,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>  		return err;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
>  }
>  
>  void xe_gt_idle_enable_c6(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 1e5971072bc8..a05c3699e8b9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -22,7 +22,7 @@ static const struct kobj_type xe_gt_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> -static void gt_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_sysfs_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  
> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
> +	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> index fbe21a8599ca..c9e04151286d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -229,7 +229,7 @@ static const struct attribute_group throttle_group_attrs = {
>  	.attrs = throttle_attrs,
>  };
>  
> -static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_throttle_sysfs_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  
> @@ -245,5 +245,5 @@ int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_throttle_sysfs_fini, gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 844ec68cbbb8..258078a6b461 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -492,7 +492,7 @@ static const struct attribute * const files[] = {
>  	NULL
>  };
>  
> -static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
> +static void kobj_xe_hw_engine_class_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -517,7 +517,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>  	}
>  	keclass->xe = xe;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
> +	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
>  				       &keclass->base);
>  	if (err)
>  		return NULL;
> @@ -525,7 +525,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>  	return keclass;
>  }
>  
> -static void hw_engine_class_defaults_fini(struct drm_device *drm, void *arg)
> +static void hw_engine_class_defaults_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -552,7 +552,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
>  	if (err)
>  		goto err_object;
>  
> -	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_defaults_fini, kobj);
>  
>  err_object:
>  	kobject_put(kobj);
> @@ -611,7 +611,7 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>  	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
>  };
>  
> -static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
> +static void hw_engine_class_sysfs_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -698,7 +698,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  			goto err_object;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_sysfs_fini, kobj);
>  
>  err_object:
>  	kobject_put(kobj);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 64661403afcd..b804234a6551 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,7 +22,7 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> -static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> +static void tile_sysfs_fini(void *arg)
>  {
>  	struct xe_tile *tile = arg;
>  
> @@ -55,5 +55,5 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  	if (err)
>  		return err;
>  
> -	return drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> +	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 3e21ddc6e60c..99ff95e408e0 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -87,7 +87,7 @@ static const struct attribute_group freq_group_attrs = {
>  	.attrs = freq_attrs,
>  };
>  
> -static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
> +static void vram_freq_sysfs_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  
> @@ -122,5 +122,5 @@ int xe_vram_freq_sysfs_init(struct xe_tile *tile)
>  		return err;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, vram_freq_sysfs_fini, kobj);
>  }
> -- 
> 2.44.0
> 
