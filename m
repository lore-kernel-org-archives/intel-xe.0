Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38962C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 18:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81C510E30C;
	Thu, 27 Jun 2024 18:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzjbObAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5810E30C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719511344; x=1751047344;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Zm4tJhpLzmD1T5kVWR8WX3bI+I1ei7xJvJ4alB85po=;
 b=gzjbObAZWf+ca3wPIm9v/EL+w2Bb9W/pfzXyyJU2ZzADhUrXON1Bf08v
 st37WtkhlbO3L+JFiYICMbA/F9d8dilpA80Kt7Al3Qtd+7EMlSq4v//0K
 NLnOLs357SXmvwaQn0kYQJFqRb5/4qIit3j/edr6N20dpD9SxB0s2r5Ou
 dwyfB8y+T8eadB5qWrEhDwLGIZFgjvdxu8jtb8uQTCWKX5NRIGULjmW2m
 xijbDxYBBHrkmJxCLXREgS81sdYLAxexZx2uaDHv0pMq1WroA6sTzkfDQ
 olMy7dpNiz2BhewKYe7BlUYXEgDS7s2P1CuOEp0tFUdzsPcxQbMXAEcTZ g==;
X-CSE-ConnectionGUID: h6ipS921RVOy+RKWd0ihjA==
X-CSE-MsgGUID: UmyFhph9QmKM20vRQyjA3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16790470"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16790470"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:02:24 -0700
X-CSE-ConnectionGUID: l1Dro6RSRN6y5EgIdWs0Zg==
X-CSE-MsgGUID: 2rU2GXmvR4+4CgpgCLAfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44560495"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 11:02:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 11:02:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 11:02:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 11:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5dM2sYo12i49u1g/R0ZKIksqB4+s7PQEZHtN1wZWN1W9senHbLRR62t/LwIwuhAgNg7P7DtM8BRzlSGA3CZAye2YT4wkovTBjwWhTTGcfeU722ZqR6JzWWUR9JYDLGkd/+bQ64w3gDW2lHwk6rlHSj9RFBzUSqE8MQbSzu9c8M6Q89rJ4O3YJscA0iSBMBzjjVoN4wCwV7Srp5B1DME31UGCaN+UeZzMJrIw296d9n51QJrEbNrCatLspDvTj4MVDprEnZtdnd6RvajiYGQ5WsXch/2VFTU29RIJHs17+4aRkikVnX6KPtbMDwE6j5ZGElRKHi0xOsxEG1RKDJAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZK4rdsmzMzqkJZOuZ4Y4PBM/mYYyVK3j8c0kx7vW+Y=;
 b=id6qmd/PGmQyaBAj9L5zUUXfaS04gok7l/XOG4ncHQtKxILBZ7nw/WRMjEjch1YVcxOT1QH6SIQ/3uqilgp5GiWK09VRQI1VQITSM0TCgpF/8ePEC4Hw8J2OG/+7Kcqet2GAFRLUsyuBEmDvh8gQzKEUWt+5pY0I9fB9x60kfjEna9jt6BmQk/OQ3n9/LZy4PR9jtd/aXdFzMx9HEqawB4cVgl7v/9tbeea84CfJu4i++oz+okbrWC7NILS8LiQoAtWsRYl3XYb0EIiJ+Edq57MN5ZMdFSAkFiET5tXaClounxycbwa8aRjCB8nD1addfDdAIjumW82uDbYhuWmpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Thu, 27 Jun
 2024 18:02:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 18:02:20 +0000
Date: Thu, 27 Jun 2024 18:01:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Process message queue upon submission start
Message-ID: <Zn2pAfj/bmxxcT1K@DUT025-TGLU.fm.intel.com>
References: <20240627072055.15553-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240627072055.15553-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 366c6949-b944-45e2-b5f7-08dc96d349dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fSCHG6Nl8pPMHOaj//CYozR/Azw46XgcOLipgh0D6d8upxpW/Lh7NvYJBPuf?=
 =?us-ascii?Q?FH7L4RAIpRNAPoGVGF5wtZ4breN7WzR89TErYGv6y1/U4XSVPzgSSBsW/gx9?=
 =?us-ascii?Q?24QPtspZDJH6CgB7tUQNDR0P95htVEh5zNgRZ0ZY1hlml8+0xvJgxYsTPnZs?=
 =?us-ascii?Q?b2Qh8uQV6rcjv3ncC8s+42HYlmcw+q0jkKZCAGCabjkryJzFZSrgKfQYM+m/?=
 =?us-ascii?Q?KjDaFJZKHwJDmlA5nTqisv8TZtjDW3jtT5C//dKdgQ7FivSIoWp8BnLP2i0d?=
 =?us-ascii?Q?P4I3hmdFv8zCuN28f/9Qq4PnyXa95jCUy+/mnQzh6xb75U68RRjml5q2xJ5j?=
 =?us-ascii?Q?LcRgWgbjqkBd/fNyxv4RF7eafTp1kIxR9ES+JcG2miBe9MC2YCSOKSQ5a5t1?=
 =?us-ascii?Q?3uEE+XN0cY66KxsIHLXk+qo7s9i7eSsfJnv4rYS9GwYVnO/GcqTnkK7bIYtv?=
 =?us-ascii?Q?E8+G5QxacrZhePLtZCNuIRjTMzeWfxUGuCRB5yhTjdV+HoXIQ4pvOqy/XHf8?=
 =?us-ascii?Q?nJiuqRj2svsFWUrVCGFGDWnAOb9462EdR7xInvU2+yCIGgEVWsM0+k56k4mq?=
 =?us-ascii?Q?Va1CwIOY2T5Ye+tzXLqJ8VCIpt+jdXZvBGEydZEi5FR5A9pZ1v6snf8m3Xg6?=
 =?us-ascii?Q?oyQbE7o8sepo5aSpTcyuCSL/MvgqB/AXfXjbLRG687pTT0DW8hH0sGcXrOt5?=
 =?us-ascii?Q?2ZggMacDS+KWCcsUrLhZcZCIVwnhwRkZP1Qty8HvqYyKShMK19Z+znfj72W5?=
 =?us-ascii?Q?8UgXqQXgvJGEVuau0KcfC4hzllETXopJFGLDCmYxq7nGvSjDOdyn2ywqzYN3?=
 =?us-ascii?Q?36KQxEVYMQ6odC7nhigB5D3FjLKnIeM0ZWlQEubYFylKk4tuHBwJ/QSoBYma?=
 =?us-ascii?Q?7ri4HghFWYj9ILV0Fi0ooK7hY9NmcJO54TdovwwbDr/FUb13Se18SP5mMCh/?=
 =?us-ascii?Q?DiBGScc4D7ROa4je/8kmCV1o9xuLw+n4nv2Eq1sGmyToV40fH0QuDu4eNEc3?=
 =?us-ascii?Q?Y1Jc7MBjgjaNLhsyM+zpgjOwLO11E8Wrr55OCNMesp4EzAsgUfr0VqTH37Oj?=
 =?us-ascii?Q?Gx+4VcSgD74J0xg2tY0+jMRtudB+X1NZ5llfSWsJWR5cyEtJ4z3z+aAYPMma?=
 =?us-ascii?Q?UWrHtFvcNd8FST6Qom2S7LCAh2EF0nEtkU22B5S5Rsf2Hbicic4YUrqsn4Ja?=
 =?us-ascii?Q?uBng/mLiSoGUAG/KELnnhZ6Ri8tuHHkYuAl61yDFmEJ1wPkIwY1YupzA3Nah?=
 =?us-ascii?Q?2inhxJwFHZS1TG4GkF9YugKP4WfB6m0ojss4xUnQwlGAd90hd3UauPzvcubS?=
 =?us-ascii?Q?lfAmnCjA6sXZ4bWWsIaAuE1g4ByUOSVYpKmRsjZG0FV71g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uDpR6h/7wg8zEw31g5HQfJD6e8UsJyQ5hFFeLU22UKO2lzq5uMf+xeSgz16?=
 =?us-ascii?Q?/mYM8FU65UukOyVuzxYp4GRwSoVfSAXx1tZAH/7tCtm764e9wLpyxqIV8lAw?=
 =?us-ascii?Q?1XM0vm5cZhlQ/q42yqR9U34BXt9ht/wGZ4BUOwaWtWaJtc1B8fICDo56vIM/?=
 =?us-ascii?Q?56wrH3iV4mfG19M8TcQmI5Em82aYuC0vhBzwb/gQVRLCcceQOxHWU9WlfTrK?=
 =?us-ascii?Q?qlUR0dsqOL3QyZoLlrUHHE+MbGlEDh1GUWmKjLGVO1QQXz6mb+Ch+hro/WrD?=
 =?us-ascii?Q?AcDRA9MFzIUhRGDQvvJyWpyM8IXr+21McC8DenPk15PMuRFoUoskaZdV0d8W?=
 =?us-ascii?Q?o12IQNsszGTkJ5ux2mX7R23JXdri3oiZqIz0vTZPRDe3+uCF8jK+B4PznHH8?=
 =?us-ascii?Q?jr3loNwOyhrNey2LfEEax0TBrkiQV7sDqGKBjWgDsD1rbSIO7JG0nACl5RHR?=
 =?us-ascii?Q?tggofDk94dscfWbxnDxrMZQsbySpFksY5+17Iw265P89xFNYF3KpZOnsgf+R?=
 =?us-ascii?Q?AH0NVhZ3t8uL7UBAPnZibC/KiR/f+H6P4N1b8nGVjEJ7FbZS0JpaDQEriXJP?=
 =?us-ascii?Q?UIWIZsEXqjP114g16zVcUFutcq4wx3Fk3N6wzlYQw6ycKPLfVApY/ZOCHlmh?=
 =?us-ascii?Q?nulnUhC2yPaMzHvrPrORwBKps3EFs0XyLc1tc+WiQxrDNmPP3TW3n3hCsWFJ?=
 =?us-ascii?Q?5eDzRumEqNo8SrKqjK5YngQG0QQ65F4F1LJeoqJsi1Ds8Opt3dYnT4b7uF2I?=
 =?us-ascii?Q?+0tGGZSgoRRjGRle4g4BNTmCfrK3NqqH/O9TQnAlJgfe8gr8n8ZDxKvxVLyl?=
 =?us-ascii?Q?/egVkdfH7la2Cgq3u7rgylOd/0ARMi6o91PKOsZJVTwxKQfoJunx6DICh/e+?=
 =?us-ascii?Q?0u8NvAoGfauNOg1kWI0AlPUfqSO+gPD50l110rWbSPZcc0ItaDBqioq8IiEu?=
 =?us-ascii?Q?4c+6Wlf5+mODzALO/QPtRWomOrODX5mM+jxlNlruEu1/TL63ogYOlJrm/IZ2?=
 =?us-ascii?Q?chp5BqgR/tX53toyJqy8uiz+hAPeO1+16DUkZOOCrKTv+Am/YIJ8jXcHZ0eC?=
 =?us-ascii?Q?n7s5iR+oP06C4GCMuO1/Q8NZbbICCKteuWHZexQhI/GRD5bk8vpffpyaWb1D?=
 =?us-ascii?Q?+Bcoll/HTbXxv+ZKZiISUsfaXxlr0pWEkLTQkv8cN4XCNJM/QrPNf6/ySc19?=
 =?us-ascii?Q?7natAYxeTI+KDPcIQ1hvSBgrBhN1zG8K2kfpZ2vKJ7XzlO6vdhZrv9ujGfev?=
 =?us-ascii?Q?HWVl28MYfQ6kbQhmdc4UyfyJ24HfvFLYdttTLq6ns23VVl2obrs6ll6cWC+0?=
 =?us-ascii?Q?km5xTYs8NiZ3HGRzYzmbqZJ0X8N/m5+VodCxRO3QHX7gMJMsOcvCKOg7pOgs?=
 =?us-ascii?Q?0k+jP8jKX12G4NWopUVU8sLh93kEZYNT8UVLT5Vde+hZTbloDcjof5gPmdR/?=
 =?us-ascii?Q?ASUZoGMspVDUSOzUzyYB7LuZmTh4GwKSVoIulnnM3uGl3yD6+Cu5nztBL8jx?=
 =?us-ascii?Q?kcC1QagSVi15pbTohuZRNoHnHfK3vIO2iHCMhnl/7bpX1AMx2dWdAcRCotJ4?=
 =?us-ascii?Q?OccGJrI7EVUFwQpOOBrmGx8Rx5ENKKirEWaUp9BaeL1rvIhzgebHzevoy3yV?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 366c6949-b944-45e2-b5f7-08dc96d349dc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:02:20.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/eq98zzETY15mkX0sbykiJhF33idY9tK/l0cB+Qjl4bNBv8ToWS3fYK3TKOlL/rolqIdMnnhDWZq+3RLvYVMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Thu, Jun 27, 2024 at 12:20:55AM -0700, Niranjana Vishwanathapura wrote:
> Stopping submission also stops the drm scheduler message
> queue. Hence, when starting the submission, also process
> message queue if there is any message ready.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index e4ad1d6ce1d5..a77a018fd8fe 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -82,6 +82,7 @@ void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
>  {
>  	drm_sched_wqueue_start(&sched->base);
>  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
> +	xe_sched_process_msg_queue_if_ready(sched);

I missed this in the internal review, I don't think this is required.

The above line 'queue_work(sched->base.submit_wq,
&sched->work_process_msg);' does the same thing as
xe_sched_process_msg_queue_if_ready unless I am missing something.

Can you double check if you pull this patch out internally everything
still works?

Matt

>  }
>  
>  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
> -- 
> 2.43.0
> 
