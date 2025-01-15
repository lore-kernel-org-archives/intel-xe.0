Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642FCC02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3209110E502;
	Wed, 15 Jan 2025 14:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imXXvHlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27F10E507
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736952514; x=1768488514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZwrFx+qLqkjSkbgPmTxU90WXaSKcJKwEob+OmNmIWck=;
 b=imXXvHlV2Q/7tmcScs56zeSlJbHcHYRXVatDl3ZInWpqPL+sewVVTDhJ
 3mEkOpDfjMSZWjEFU7jEbJoJGvA4at22TyReA22x9r4Ftg4KGHZNyEmsC
 15oHi0M7lDIdh047hBxsWB7aswTTxoNiz7lC9R+S8BHeB6V+JqvAvK+On
 E2g6Ug7HByXqJ0z+Pujy6eET0lqiAIwRaDbi1DLtegXFW9bpTJ0p4DyQo
 TnXoxnvP7jXmk/LYtgdkLyDPVmWYmrFEZE6PYUgFbkd563DI6EBh9mQQQ
 azlY6xkG+jce5hcFq5dC21q2p+IaULOdbUdvJzy3GImkiB3le568XoHKf Q==;
X-CSE-ConnectionGUID: 2pkYauH9RLuMjFw7FIIiRQ==
X-CSE-MsgGUID: odf4emftR3SvGHpHMB1f3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36984986"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="36984986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:48:33 -0800
X-CSE-ConnectionGUID: xWy1YRBoQheE1MBYGqgRgA==
X-CSE-MsgGUID: nWpLx/xuSZyBQaCt4UxHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105748949"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 06:48:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 06:48:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 06:48:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 06:48:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwimK0ZiB3yMlQ2sMSsmdzUzKj2jTZzUz6eoMjWVlFZwknqA7HcRuVA7/JE55q26MS/pE2VL1LmNKrBLMXoroqQkHqpOB1Ps87R47m8RXWBvKf6d/ICMI+xbHH68QUzPEinUvil4TO4mAzAq2D1f/7aZuFl1Rj8rcTvZSDlLqjfiimkCO6DWAyWM4xZFZTxHX271wKbxyId0ZC+Rojg6wBfceEyf7Tuegxb10qx6ESmlfJJEe/qaqXPH7jFtCP95kY7aVz6q3C2ajyDrwagkoCFujLy4PNRLZoC/2IAbXLU1kylXTXfrhqDc5i2p0gN4gFEcBj9BjWPSR2ghhTVyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVMfRiGfo5CfmOXj7QpgudYg+0PfXITvjwpiK2zCmsw=;
 b=bgWDO6QYakQlSQVqMtND/U0nLcxv3dnHlItU5Ec5gY+lgrolmpYprpN62+zRkK+yTKZw/G3p8MWHVclYffuhcj/JpP/9LibpMGkib0gZpcme5K5/WfYgRSy/1fQA4ZH3r0XDEnMF7QCHrY+RxzjZNIfUhKzAEbv5Wyak/35ht18bCI2vF60E0yuIExdvm/R2LMhU3cADS1by6ZH4ivTmRubyZjgFUk7pSGEkLgf1fQMNwIuilHOJgwJUEeaLBwVJH52/f/mqEArQAWqWWfjRdYPGbsWf+iudTBzzxXlTAegjtbrR0UefGDdoRqqRgJ7EX9dhKEq1GZK8lKXF1zINpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:48:15 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:48:15 +0000
Date: Wed, 15 Jan 2025 09:48:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix sort order of .o lists in Makefile
Message-ID: <Z4fKrIvakPtqRDTG@intel.com>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250115140812.20799-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: c0057be5-cfa5-4362-4cb3-08dd3573a45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a27KqZzVMI7U//QcXI4e5C+4e2PXleXy8fJNEAcv6T/xhXBkDrbdF2B7CF/W?=
 =?us-ascii?Q?smaBYjgIi0B5yu0yIpKELltJ65wFWKFa0tvRTM+fwOXbhkrLP+0qNBHMxZwi?=
 =?us-ascii?Q?vZ9NLdhUKmMpRBMw5aEn6aj9BZgwH1KdoZcNViiT+9XnepWr+DJXubzWkaZh?=
 =?us-ascii?Q?ZcnfWYL0rwyAkEVT05smSbCAiNGgvGt4K45mYw/Lr9zqMrSwXIhIBTpnt++v?=
 =?us-ascii?Q?9tIjbEUsdN10fR8LymIhK6ml+jpmUfQQ+lZp+lOeDzjqT1Jt7hyIExFc4KX3?=
 =?us-ascii?Q?dJKvJ80HiD6bqy+4c1eRAZIHys7bBX067lPyhRQIPxtB7wVj1sNQn3u8WtFb?=
 =?us-ascii?Q?KmjsqwbCeoKVVPW0e0JbYkwmo9Z6IhA2ebKAyKjfCbmkyxp0ikxDtXAYD+6I?=
 =?us-ascii?Q?zyIsAfA1PA4wJfDfxOxPtAglMMye9Tqkbi4LeFhHx8LjaiXj2lbT2xSR6QLE?=
 =?us-ascii?Q?8auvWIVhVa2yqO5dn7sGD8iRl1zI3DCdd/eqL2Bh23lgEDJLL8iMII1ln0nk?=
 =?us-ascii?Q?Yapr4QyUkHa/wc4BpFb+3SpNTaTxjfVCg1xFXfdw4ocheKRQHMGHJgvmun0c?=
 =?us-ascii?Q?XfEw4dzjPh/W71KMjX5x1QkhkPlAck9WfVNgVA14Dsuyf9N3pggsDO37UDBr?=
 =?us-ascii?Q?8Klqn/gx7rnzQoGyOXgSV03rC4VMHxxMzDzG0AsDVme2xrTTqN0Ixodv2YcX?=
 =?us-ascii?Q?wouV3DWgHE/0yAbwB3w2haFQksW3khueNRfZoY/Z1dLW2QlHLWO9QXR9v+Lz?=
 =?us-ascii?Q?oo/Yh1L2IGjk1diXxagHlAWHIp0pdNF3wzoC+l+V623364xQj9w9k3OujxM7?=
 =?us-ascii?Q?x+6a0rJ/FftlbLVMRbfpXvNi3IHcsm138ZSgMttmX9EBfE4AGX8KN62FXCrD?=
 =?us-ascii?Q?b3Lz2cQqYFJJX5LiyD5cjBTRXwtG6tJo9QApDTzpCy+GN7z6jIhKuldxMkhu?=
 =?us-ascii?Q?bu3LrPrTCspP7rioGX37pAzSmLj5FMPkwGnE9PYRYmWbskAsMc9T4IBfnw9B?=
 =?us-ascii?Q?M/tCW94bnVgb6ydZAPvC6e9itheBzESa4OSUJ7v18Aa7K1mccxXBXHyvWQk8?=
 =?us-ascii?Q?3TatjCEfn0ml3iX4hhokhqCPLytJe+6YiMyWxqTVT2acvJvfmk9ucJOzlNGU?=
 =?us-ascii?Q?htaP0zaggUw/uDwe1nSxaUvEbUYRXyq1YXeBczKY5r1jDyvz5FC4Zu4kT/Qz?=
 =?us-ascii?Q?bzn4Vz2+qLlxZD0R0hBVa2iIBor5vcbOWfziNRnMxq6MQJRrvJnHlYzJYzIc?=
 =?us-ascii?Q?MgbTk+CBF5iaRtvjo5pTuEf06tvx92VvjZZFRZVNrhWUmjqJtwhXafZpD3/V?=
 =?us-ascii?Q?oCnw7nsWqYrTNigR7tGi/BnrANyu9H6tYKdxzsPr8eUZ2A2iCC1tIYh2rvIi?=
 =?us-ascii?Q?uWP15FBEx41YetYCYYrzDZ3krfC6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VotuSNMwCP5Ms8VLwRCXDyLGwQPkouLL7ByDeicT6w4mWgGz4IItT+ITjSh5?=
 =?us-ascii?Q?s3NDcf9ZdXCGy0XA8yJLG4Ya6AlLGATeHTB2wP/nACTzF0wg8buWvooKUywa?=
 =?us-ascii?Q?cES4MPncYAM2LumR855wvCpXKoP2+Zp09arjgjY31DyMzXXQCD6rqBfxp1O0?=
 =?us-ascii?Q?ntl2KcR3MXlaDchU0hv+OqcU5EE6q6nTPKfrsEwgYSw8eyjRTlOxWG6n/Dti?=
 =?us-ascii?Q?gVmaD5F+K1VXuqgJSdPjuQb4uKeXc2QNL9cSR3UVUD4gTGdaRLAJCr6eCeLp?=
 =?us-ascii?Q?FA0g8X1+Wxvr/Z9gdVqVSgA4mNlKh6T+WZMxjG8VzyqXy7Shin1wN7Kq83EG?=
 =?us-ascii?Q?0Sf6ruxUnj9Ruet/8Xoa66oNCrZ1CPFkko0Zp8QClpWBRZZGBFr6s42v635c?=
 =?us-ascii?Q?XAJlDyRFYtwHOc3HY17u9GBgKjOPYRBv8pm9O72Z6tQ42emlgyVi/9CUlQkf?=
 =?us-ascii?Q?jmtXVTrVzj6ZVjYbcyMBOCZeJ2MOoS13JIRdJLkoDjXPBqlrJQ9oqePhGGH/?=
 =?us-ascii?Q?f3PUyFfS6BwJ8oWBiWdM1TLFyLyiHHxaWvsIJ6t3mPw8KwHn4MnKzWHaAhOQ?=
 =?us-ascii?Q?L+dXu968+jB4z88UBj/qQwSRUNVTnEy5sjXXsc1fR7sw1jhfZDBlSHbewp5u?=
 =?us-ascii?Q?bJpymQEJHi9w0M5SUGCLaAKq9hzpqbZXpd3oadWd64jw2gKbsHZQn32ZKS/f?=
 =?us-ascii?Q?LCtABNZzn58Gv2H0HfYWcwlv1xB9kqgLBxXS8CJOGXKMDwLohxc0r2V04reC?=
 =?us-ascii?Q?sY9zsNiKKrJl3s1COaYnkgqMQ+C89GIwu2vbDHQVjD2mdeViiCbZIvbjMXNn?=
 =?us-ascii?Q?GVeyV5wKTKq9qj//pPjUHAoSMrouT8F3iMRh3yKXcCLEEhirM11gecmvXcFu?=
 =?us-ascii?Q?Kh3n88i5/JvNHf9d7xdEFZeu6goeyljclysZ/r/FMW1HGfoqzcx5074RMiew?=
 =?us-ascii?Q?SwkfJkdXQpRuWI0xbBvMhL60DUJIl7ax3Yb0O+41vXDjENpsSr0/mpRP8w9V?=
 =?us-ascii?Q?I6BPXp2AvysBXvO8ODWP7dEghLB+FqT+BndNm4g/w28/rJaEwjfipHc/XHAS?=
 =?us-ascii?Q?Bm/+C6ETNhooA1sToqS4VE7jxnJHxMIic1M2JRqJMbAYHivG5LV8djzcagSl?=
 =?us-ascii?Q?4t8g2DftouJueCli28eFYFZ9jkFR8IwwfHklwhMQyOIIz4ywiVgshXfLNseh?=
 =?us-ascii?Q?VnT90nysgFEr55it2gWVau7yCnkHK0ZWLNOD3ghEyxqco5MAaBM4X06S/Yam?=
 =?us-ascii?Q?z0gmHiBnsLdcwmjKHhMGJ5LS5IPSXyHs2cn1+q4Ml2ivegaK7LgcGXRgbBj+?=
 =?us-ascii?Q?WUW6ko3y9hBmkLH+nUq+HORjS+/pQRcCnOEHZvFce9/AvklcWSrfMITZs0Oh?=
 =?us-ascii?Q?tsDyubMAGDUN4X7PAXgOXG6gFyE7rtN+A1ZqFLNARGQL6dQvrwX8eZTYYxlD?=
 =?us-ascii?Q?5ANhtVsJ/yI+657vwB/NnEjcQEvO6bmJnJx4IsyPKZ/kK6KseYxTLaBIjYTi?=
 =?us-ascii?Q?PV61MnWu7PYX1tb4NtCa4mCl77KZS3xyfPlFOQblK1iQel6fG4PZFWTva7PU?=
 =?us-ascii?Q?tyfYpQy9yDCJrA2aQIx9SG62gz3r1RLwwA3uhE8NA/oDuO2rOXlPUpGS4xra?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0057be5-cfa5-4362-4cb3-08dd3573a45e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:48:15.4511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv2fW/W3mz6PnexnWL6X31sTmVDki5HSb+vtbJ6soTnKbcyAPS9gAdXs+/RXrtEy7/tB7KibmdGxNLa/HwJQuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

On Wed, Jan 15, 2025 at 11:08:04AM -0300, Gustavo Sousa wrote:
> The Makefile for xe asks us to keep the lists of object files sorted:
> 
>   # Please keep these build lists sorted!
> 
> Reshuffle the lists into the correct sort order. That was done by
> filtering each unsorted list through 'LC_ALL=C sort'.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..34214400b8d1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -34,8 +34,8 @@ xe-y += xe_bb.o \
>  	xe_dma_buf.o \
>  	xe_drm_client.o \
>  	xe_exec.o \
> -	xe_execlist.o \
>  	xe_exec_queue.o \
> +	xe_execlist.o \
>  	xe_force_wake.o \
>  	xe_ggtt.o \
>  	xe_gpu_scheduler.o \
> @@ -66,11 +66,11 @@ xe-y += xe_bb.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
>  	xe_heci_gsc.o \
> +	xe_huc.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
>  	xe_hw_engine_group.o \
>  	xe_hw_fence.o \
> -	xe_huc.o \
>  	xe_irq.o \
>  	xe_lrc.o \
>  	xe_migrate.o \
> @@ -90,8 +90,8 @@ xe-y += xe_bb.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> -	xe_rtp.o \
>  	xe_ring_ops.o \
> +	xe_rtp.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> @@ -102,8 +102,8 @@ xe-y += xe_bb.o \
>  	xe_trace_bo.o \
>  	xe_trace_guc.o \
>  	xe_trace_lrc.o \
> -	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
> +	xe_ttm_sys_mgr.o \
>  	xe_ttm_vram_mgr.o \
>  	xe_tuning.o \
>  	xe_uc.o \
> @@ -112,8 +112,8 @@ xe-y += xe_bb.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> -	xe_wait_user_fence.o \
>  	xe_wa.o \
> +	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> @@ -221,6 +221,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_display_wa.o \
>  	i915-display/intel_dkl_phy.o \
>  	i915-display/intel_dmc.o \
> +	i915-display/intel_dmc_wl.o \
>  	i915-display/intel_dp.o \
>  	i915-display/intel_dp_aux.o \
>  	i915-display/intel_dp_aux_backlight.o \
> @@ -268,7 +269,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_vdsc.o \
>  	i915-display/intel_vga.o \
>  	i915-display/intel_vrr.o \
> -	i915-display/intel_dmc_wl.o \
>  	i915-display/intel_wm.o \
>  	i915-display/skl_scaler.o \
>  	i915-display/skl_universal_plane.o \
> -- 
> 2.48.0
> 
