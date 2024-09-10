Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C304AEDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8BD10E8BF;
	Tue, 10 Sep 2024 18:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icDdhhvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C9110E8BF
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991383; x=1757527383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PTTin2unQhQ661y7IKsQfU0HXDrE0j49WvDaNZNuHc=;
 b=icDdhhvGrjegtCFUwajWp03JxCuqfAoMQ++I2WOX1DUNmNe23T6QEmFB
 HJNTHwtvLJHkBOmOiJVv0WOMz6UBgzdT8WTJ9Eh3NOKwZ18FZGhbKymWq
 Z0JTSzGZihLfRZM+KS19YUw3WbAIQSntWt5qEl4MPQo0kY41Y5Jn5zukS
 UhpQ0FefxsWb0Smj5A7iYa1Bdt3ilCs1iaVd9YvwK4NZHDLcJFcImJbIB
 5H/+zYLmI0dkAG6Zn3udLcXDmod0nrxw7xpZ5UAXHBe8+/BkteGeUP/AG
 Nb4wRfenRlEK9ozOSHCG2RGHnmcJLiCcQNtBHy3+RIA0rN98BUOTh1hAn g==;
X-CSE-ConnectionGUID: zMzmKdVfS7yGoET88IOcng==
X-CSE-MsgGUID: 1ULvFQVuSh6Pfz1QyCHNEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24301901"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24301901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:03:02 -0700
X-CSE-ConnectionGUID: ScL9YI+ZSiiANAGEi4fxOQ==
X-CSE-MsgGUID: Hd/K0z+GRMm3pKhwPtmrBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67403076"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:03:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:03:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:03:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:03:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYNdo7egT955Dhk9D2ZIueJ78ZG4NwIzc/JZjX16MksLHQVJP/VBbo5XzKEyzyuEwWWLVNUOwvAhndfjB2rkOrBafVv0nfE9vsgGh8YBNL/jpJGkkwxj+fpdpXIL2SAp1R7OD1CVPE2CuyRgt8HMWvH5mfDXBJb8LkOB8KJtU0SH8mkLq0l+zz4jw0M0Oj0IhH4XGkp0M0tmH7Q4r2wA2dwqVO/2WZkaaFx+wORx0tICCcJ6Fmp/IgTXhlmL1fHGVISGKo9poSNMG1CPyijWMQzDhwguBbEtf62ZawNckVZWQ2Goql6D2NOghWbJIgODT2ozRPrS0kjJAMhieq5Exg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq0In6SFVbOFuFXoB9YzOTdVZz0aTv2icaGeUi0DJXw=;
 b=DGULGwV18HYe425rXSyw0ykIhKjFligOHl6kKNPI1HbA+chmaOFYKzga7aHqKE8Nz5PAUAnLiF9ntLSQTzWsyk837Wao3U14Me6ZXSD/iYLwK1c83DtrR5QUbY1E4PU/VfX4Y2teASCVwJMiVY7z3DBlr4pf+IAfhKJGLJaRj+X0X1vUj72tCPSWswfIL7KKGtenV02x3XG2wfIk4zQdnwWkBZqtiJCo5Auggalxa6zbuV9Mt/FGX0/g/5DHMgAZpvT82RJJvLbIXGptG1bmXek87AzvFdTee3AQzcqVwWMdvsb5opTLThCfdr3vIIB/yZZNKtltShsgu9KMlbvmNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 18:02:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:02:54 +0000
Date: Tue, 10 Sep 2024 14:02:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 04/43] drm/xe: Move GSI offset adjustment fields into
 'struct xe_mmio'
Message-ID: <ZuCJy_MIJKlxB-X6@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-49-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-49-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b07b89-09e0-46a0-ef01-08dcd1c2cb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zstaDEPdzSHFjITtxeiQ+JE7dPZ+VgebQZ1Wt5m1xLXtL8+VB/8RaZwRiafD?=
 =?us-ascii?Q?BH+8a7BW7oMuxgEWjj1iPpplF2OtHgSefPCkpixgaEyyGTVF0aeqUlaW1OyA?=
 =?us-ascii?Q?BfCqNbntED6DFyePfAfrSFmkxqxlcpaHU2TaHo/ptysiFn+VzvNzMrmnWSXz?=
 =?us-ascii?Q?5aAnCulQoNKunkxzgXOwJR93i2Y/lVJnfYSd/3/foWS59e8dHVN9UGEVclRH?=
 =?us-ascii?Q?nfGg3YHYC8SFz+iaS5qlInsJXPcW5P5fjfh/u/TJLtrb8zI8CJs/pAo4CsG+?=
 =?us-ascii?Q?nOiBbLq2Vwj6V49p6mNkHZjH5Kcq3pjVmZggqkoIEhQHkjhQ5o5b+QDu7oQ4?=
 =?us-ascii?Q?0LSaD1VYO3sKBSSA7/gOw5SNJ2Q1Ii2UHRw0iiIvthRh4miB4uUE3QI3m6kP?=
 =?us-ascii?Q?ofwo5r8h69SgL3krOeYXnjp/ieXDacjMVz/bh+KuW52tDXuFIsA2kn1ZgrXM?=
 =?us-ascii?Q?44bTfghPeqZ1QUwW3CDOWenYeDrT/jGpRE+Bfcs0IIcDAVvujXl8nVBrx1qk?=
 =?us-ascii?Q?p/usTvbxUrE6EYEyg0S6qXWCvYxcmvqXlbz/XysA71PPdXPHAWJ3OAnDIFyy?=
 =?us-ascii?Q?NYSmM9ZCyB/3ybGC0+rRf3bCXtWGHBh1tVSzMYcFmUpRweN4UCtRaiirIp+6?=
 =?us-ascii?Q?64Axc/2IoPjPOmyYm8QW4BOEtpgB5zP4/5OBqNR3x+B0YpWSz/cFkAmMs6jN?=
 =?us-ascii?Q?Ly1FMB+zoKCXU6uiguamhL7q9Yaf7wwXpuVj72xsvNjYspKMSMAVa/F+2fn7?=
 =?us-ascii?Q?ryB+JTbLBscuQJAMpkAfGkRoRqPeGEFlv2LDsfZ7F37QBSIn92852KiSuN7x?=
 =?us-ascii?Q?TJzJXPo/h5mkliJNbadrVb9ubsKHIo8XMiVrEe5CPJKADpYL3aE3dZVGeENb?=
 =?us-ascii?Q?/JA9wYsJHvpx69TH7TGTDg2KGFHV1gvUMYvDl1XGz/ZEwfU/o7x8GrWKB1Qe?=
 =?us-ascii?Q?2uxQJClg9Q2YqFIbgkOFGic1bpd1AQA2DIgzrrYE++DOoblD8bUR797QbvUM?=
 =?us-ascii?Q?Z3jZl1TeaPzW8jRoclwk7b9rxmi12bC8qHWOIXOyRHpzjcBzRlR0LdDM215N?=
 =?us-ascii?Q?3xYbcr1q7UHj9wj3m+XMUz/7TqwlY2TjkB20MfyyQgXZOfqo9J/qvqJrGFE1?=
 =?us-ascii?Q?MCDE6PpBpcMdqi8Up1KGCimUUtkKtQZQNnOdADNrEG/th1XEAcZDVV+QPGMs?=
 =?us-ascii?Q?SEO9mtz98nlSjpjgx/2FLZWN8V9nQjx1s7ZIYGYcnBFmNHIC6aqeLvNhFEDK?=
 =?us-ascii?Q?XU+I43q6WXK5i12wxiLYbZJ6DMfWPOZ+tTavIRNj/XPsgUJyHtuFjSVwWTEQ?=
 =?us-ascii?Q?D9YJ/AGgpU+8PlgmOFsNQ/cGBGMiZ5M0wXVcFYo3e/FUbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2BfDZhBMpprfYIK49ri9fA1QUhUXA1rPOnlRb8HWjg5s+GiI5LzHbqMi6yh?=
 =?us-ascii?Q?vNBlE7tPQWB4jUf6ntYtB0aKYtpR/i0/6UJ4lMXybZ5NCrLV+QbxQiT3aHt2?=
 =?us-ascii?Q?AuLHahCtjn67pXA3plNbq06brAl+3kRMdASIvTlutzhM6N90crcL/pGK2Ew4?=
 =?us-ascii?Q?Pp0Rs5fGQ+p9JafCLKi9mGqd/y/E2z3WdA+oal3lyWk7dEnT1iYlFVTu+bLM?=
 =?us-ascii?Q?cS5U/gZG74olYHGUcucwQJD66s9/nKFOEnPYobSIeQSnHMXeS6r9WQ0R4iOB?=
 =?us-ascii?Q?z2ke8DUHn5lLqX/1GRUCFaifDhhA2A+EOiq0M4V0cFRHmPP2H7LJc0BB/7A4?=
 =?us-ascii?Q?ji9IUi6JMZRkZU/sRscT8qhM/lKFg41qHtIxuuyon6likHXn/OLohI1JfA2w?=
 =?us-ascii?Q?zvQ14y/InpRvVotExAsQli7kUFFVUS8LOBvceBIJZWM2/mL0mk4xyXrK6MO8?=
 =?us-ascii?Q?/JEwhlM19E00oH4h8N+FxHVbZELbfJyVF2Ba3A4v8s5oulvCq0qN1vsPWaeo?=
 =?us-ascii?Q?18wQvO/XH7+LhcRvxm1E9DjZgbwPXEo+hi8QmznL+R/PfshHN3suG9sqUMuw?=
 =?us-ascii?Q?5+7U/q+d43ikRG7+UCXWwVsVEmYJXvrZS0aM3XR43C3qDoougMs8nn7umzr8?=
 =?us-ascii?Q?fShaV3m6Y+PK5uqhQT2DSBv+KsEKijj5yrxWM4FfRyGtY0wzvybmJzBygRWq?=
 =?us-ascii?Q?t4CsUh3+eKfVaVkKhsAp0PLFeY9gIaKyeO4uo2NzeCSm2jONO+uZj2Bthu0p?=
 =?us-ascii?Q?6WtoD/UMj2yFVFrqJT76n/+XX1OQmVsGJ6GINuGdbEZPSZEnzhBinf2b01OI?=
 =?us-ascii?Q?2N0fAh/Dl4i/s9AxmBJBLG/U2wz/NrS7gDlpqIrAcYGUXdb3GwFeI558VGMC?=
 =?us-ascii?Q?Qgk05lFMlCOcbKJFPihXble55TxEafmDgvgXNe5zYv2twJlLG3VPvBqhkwFN?=
 =?us-ascii?Q?kqcxDW+hiEsTN9YB5cJa4U4ufNFgzpQ10PuxdDk9r/QoSnyH6vyxj/ZscaDC?=
 =?us-ascii?Q?EPMT2cv7PaIC4VGSy2COFELu0LYOKfPmTv+oObZ/LSkSWF55fug7ooPSPW6e?=
 =?us-ascii?Q?jMjqsvG4K7oDGxRPRR2D0beCs82NNVN18Nzq5JybWzj2jf797uWlUFfTu6UR?=
 =?us-ascii?Q?GrZk+KdFAlxjkiLvHcZB7CAXRShL2ya4Ax07e0L2tl0tPCRXRmGunSf1XiaH?=
 =?us-ascii?Q?/pmZANJtQ5UdwTD/LqqBG8n3lJuRp+nrWCUCQOGpX8XPwEKb2t34tvXNuzpZ?=
 =?us-ascii?Q?Gt+ORcKh240I+lo0Ab13SUgCjoN+PiT1PksNaTP2CU9RVJLWbm7UIAbSLEIz?=
 =?us-ascii?Q?J/tp8678piWVs/4/6NlYO67BDQRbP1XLccbmwrEUHIOfmfHfSGr6kw0Emq8P?=
 =?us-ascii?Q?j/W0yrSFYVpzchlifRCjMxeiR6+ggChAJYf+sFoCedbn9vv62HAChZv5Dl2G?=
 =?us-ascii?Q?zOe4RDVGsC9EdKNBQWCPIaqu6+mh8zcQcn4oAW8c+oTEQ3u+pomnvu0edTME?=
 =?us-ascii?Q?ooPCzm8Zez9fGjogqBHfLS8qMOjduXNUqnRKB48TgD9RLmqoLhRLcEww9mBw?=
 =?us-ascii?Q?eqHS9nENwubUTfty/5ptuwg9fhjkLy6ibq58vlFP4qq8UANffhugTu97fWee?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b07b89-09e0-46a0-ef01-08dcd1c2cb1b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:02:54.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezcGwAVLiyVRUlPmO5R7ayvOZsnUcTJBq0mDfNA1cYsxP378DOVO9FrKsiWLdsWK8RrC0fIocRK/bMmSJBviFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
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

On Fri, Sep 06, 2024 at 05:07:53PM -0700, Matt Roper wrote:
> By moving the GSI adjustment fields into 'struct xe_mmio' we can replace
> the GT's MMIO substructure with another instance of xe_mmio.  At the
> moment this means MMIO operations wind up pulling information from two
> different places (the tile's xe_mmio for the iomap and the GT's xe_mmio
> for the adjustment), but we'll address that in future patches.
> 
> The type headers change a bit with this change, meaning that various
> files should be including xe_device_types.h instead of (or in addition
> to) xe_gt_types.h.
> 
> v2:
>  - Fix pre-existing kerneldoc typo while moving the fields (Lucas)
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h       |  2 +-
>  drivers/gpu/drm/xe/xe_device.h       |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
>  drivers/gpu/drm/xe/xe_gt_freq.c      |  2 +-
>  drivers/gpu/drm/xe/xe_gt_printk.h    |  2 +-
>  drivers/gpu/drm/xe/xe_gt_types.h     | 11 ++---------
>  6 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index e22bbf57fca7..04d6b95c6d87 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -10,7 +10,7 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "xe_device_types.h"
> +#include "xe_gt_types.h"
>  #include "xe_step.h"
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ec726dcd5f99..ca8d8ef6342b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_util.h>
>  
>  #include "xe_device_types.h"
> +#include "xe_gt_types.h"
>  
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ecf95801743d..85ef36c5d040 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -14,7 +14,6 @@
>  
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
> -#include "xe_gt_types.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa.h"
> @@ -127,6 +126,12 @@ struct xe_mmio {
>  	 * non-register regions such as the GGTT PTEs.
>  	 */
>  	size_t regs_size;
> +
> +	/** adj_limit: adjust MMIO address if address is below this value */

           ^
missing '@' in here.

hard to spot even after seeing CI failure:

drivers/gpu/drm/xe/xe_device_types.h:147: warning: Function parameter or struct member 'adj_limit' not described in 'xe_mmio

> +	u32 adj_limit;
> +
> +	/** @adj_offset: offset to add to MMIO address when adjusting */
> +	u32 adj_offset;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 68a5778b4319..552435951f11 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -11,9 +11,9 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> -#include "xe_device_types.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle.h"
> +#include "xe_gt_types.h"
>  #include "xe_guc_pc.h"
>  #include "xe_pm.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index d6228baaff1e..5dc71394372d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -8,7 +8,7 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "xe_device_types.h"
> +#include "xe_gt_types.h"
>  
>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
>  	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index dd6bbef0bbcd..a287b98ee70b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_TYPES_H_
>  #define _XE_GT_TYPES_H_
>  
> +#include "xe_device_types.h"
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_types.h"
>  #include "xe_gt_sriov_pf_types.h"
> @@ -147,15 +148,7 @@ struct xe_gt {
>  	 * register space, but have their own copy of GSI registers at a
>  	 * specific offset.
>  	 */
> -	struct {
> -		/**
> -		 * @mmio.adj_limit: adjust MMIO address if address is below this
> -		 * value
> -		 */
> -		u32 adj_limit;
> -		/** @mmio.adj_offset: offect to add to MMIO address when adjusting */
> -		u32 adj_offset;
> -	} mmio;
> +	struct xe_mmio mmio;
>  
>  	/**
>  	 * @pm: power management info for GT.  The driver uses the GT's
> -- 
> 2.45.2
> 
