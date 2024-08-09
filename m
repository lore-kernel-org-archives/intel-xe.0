Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF5C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A6010E848;
	Fri,  9 Aug 2024 03:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BboM/Wv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7CC10E848
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723174830; x=1754710830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4O/AgQMsEWUgWGplNyczRpnt9GbOlbXklEe1sFSlDpk=;
 b=BboM/Wv9QQm0+8T/xfY9pp6kGDUYEsJehziMcxybW9QMGu1THxxIwirC
 7iUwSfkDdksNRAe3gJEuTeYVi88cUE3wwOSHtOgtAjno4WrJ/6HWLf0wZ
 f63CM4lp2u90NPujmJd7U3BWRjWaLKwAWigV1EPOuCzwJI6FOhWgDI8d2
 0OehIxP1LD/ZM2vgYNzcNgEmHLoooUxaO/fiUXf67dfdMkyLmlKRMUFMZ
 L6Zv72i4erpOnGXVN1MSQIThoKTzNTRlVIMM19fbrZwTsQT24ot3/AdM3
 Me+FetNXSaJqQ934XoUb8KqYvvCDGYZFYHTzf2WIJrfSOk3JFnDLkBnR5 Q==;
X-CSE-ConnectionGUID: puPhX8VwQaKYLteAyEWlAw==
X-CSE-MsgGUID: q2Q31bLlQU2LhJ7CrDPgLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43849391"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="43849391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:40:29 -0700
X-CSE-ConnectionGUID: TNWOVNaVRK+rM1+OUfj3DQ==
X-CSE-MsgGUID: 57umDpq1SXu5Vz8TTn7rVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="61831677"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:40:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:40:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:40:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:40:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzuCu2AJwtAaq3X9Cq83d9e5wYbleI1FnZkLBraXaIBxJIQVIedStho/ZSU06LlSZ2J4ArnOeWyaTkItgesjp9vCEeZcjukoz3LfjOnTyCBdX6yMKBNBxXj13+CS9vFR5684ZJaA9vF51fJKBjP4EFaxZBFWw4eZpCCvTpiIDhJymImjBXFxsIB2Ud6bVCTxr/hvV0S8qHT+1mRZN1RH9iGTYohRU95IosZxoC21rQrlSwISRm1ytauyvBxnD5CQAD0yeHn7Nz/PY5immyhqqDu5lCn0gv2wNL4vIYw3NkMKa4zre6WMLBg7JEx63zcppUuxOsEOwJcVFRPrm3spAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2IfnPf/2R5iVlQJtFsHrvAOFSNFk44bRUPLYeTn0Gk=;
 b=jF4u9x7Qqr7rXzh1DYUGlCZ4TQeDvXfVPZS9rGjNJYuQsnNLv6P4SpOwaV4SxU+ozZlKM/9iOg/PQze2EtuAJEoak6R6KQfxCAImCiHktIMN3eTvCP6XLX0X0qXyupLHwitdEu77lElVYL9qwHX0qhcwroFWoiyHzXEi2fhmlkxstsDfEFFTQiFhq4vLZhRbh2mE243Qt7+Y9MKqrrYSnbhYdYmVTiWEkyjLDrD6hX1G9vrxb4ijkODdtmgO/ORlKAEmkaWcZGmGx4hi+ZSIIakyQQeNbj5bI/2u5NwewJ+8cfQsmsO0q8dfE+1QMslQ3sYR9xPqMcbm2WavXXjrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 03:40:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:40:25 +0000
Date: Fri, 9 Aug 2024 03:39:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 07/11] drm/xe/hw_engine_group: Add helper to wait for
 dma fence jobs
Message-ID: <ZrWPVVnGTmEJRrFu@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-8-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea0637d-debe-45bd-01fc-08dcb82500fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FiyvO8fYXbsnuzhJK+tsGuYjoDuJzehk4cC7lgTZH9HoImRzbuQ6eGYyXmt7?=
 =?us-ascii?Q?6NPD1O8hKQdkGD84hCYgLD+nIU+Dc7Byih48ixpAkJyUpg1XpMq2NdSf8GMz?=
 =?us-ascii?Q?WM3Uvhd0LODNLw5SnbQOC3Tmk0XWIZe5lH8jg7J8ORN+7wzT37hluActSukB?=
 =?us-ascii?Q?3O4uqqdFVVisVBdI5uKslN6UT3C1xKdDzdplhFjSLAl3JFjvBSf+WBwv9Ac2?=
 =?us-ascii?Q?1FDFZSVsQ8fpd/FWYgmh37oNhHTKa4JT+qWbcXfWHcNEvytfv+mAIDdSIXa3?=
 =?us-ascii?Q?2Q4Z9s4qcO17/Tt7bYVoiuCmT3AxmJ8MR/kt5tcOtU5iIIx32F/EI3QLp0WC?=
 =?us-ascii?Q?HVWFtxpIZki9lDFLXuu0w3IfBXO2c783vzgHbnSYFzkZ5sXfcMbDnfIKi4cE?=
 =?us-ascii?Q?oT9vnFnl3Xj3W84lYbSagI1Otphg1l75Lb1Xy8gCishYqewNu/QQWJzRIXDp?=
 =?us-ascii?Q?F2CSWPN6ac9NO0RpAH9UgwFBn10NYiuLmSY3lDjK2RYaFuvbq0mHIBY1ux3x?=
 =?us-ascii?Q?8u3m2ypQ72/FGeBKYTbfShRDaUnrlhsS0tgP3GpCupoE9uVKTqIeqU3z5Rip?=
 =?us-ascii?Q?dIZaMJmiPDhBRE/l9DWLsa16GkXD9gOtcgCKttMdRnRrpwi9bdCcgIN1PuWh?=
 =?us-ascii?Q?VzG2jZc4l6hI67YPQkvOQIRGsPtTGnNxxftx4emDhpZcjBjKxzpHD0w9Lyme?=
 =?us-ascii?Q?lvzxKuBaIEB2OSzL92fhbQYNmADcCwFaSrwvOHq3iBZy2jEBE5bnQHi02kyG?=
 =?us-ascii?Q?N9zhYDztutwMw1aC4iY9AwIk3IEkcfTYqpeEOBHCURGsdheykIiI0RO/cSK/?=
 =?us-ascii?Q?B0HhrTNM+DqFfn+07iDANv4ThoWHUW9GMzNOwj8TRVYMCVJidbXjPRwheFZ1?=
 =?us-ascii?Q?N7OB4IxA7qWhM9MAgkv75ziha8OvcyZ2TjxQMRdrtH3VjyDROeP3Tt8np+m3?=
 =?us-ascii?Q?aZcwEO2SkEGGCp1mJTL8F0XHda3tq/pYIl4l36ZtkDWSdBGX27qNgmWwBqsO?=
 =?us-ascii?Q?xvg7OJ1msnZpCj8Up4Bz8AFgcJA7rHBD3A4YJm5Y5+0HOXU5a2PT8XcyHxxS?=
 =?us-ascii?Q?/IWb99lEnPoi6BSpT0iqbcdtrsgpY7tzOPJf23+gZmAZKXtrgQhOwpZfRn/y?=
 =?us-ascii?Q?ODAemDadLoQG6qcUthpTt/00r9ezK4IP9pY1Qu8YsSgpwTnaN1q4LVIo8g8/?=
 =?us-ascii?Q?wOyruMOT8MvFgGMBFFy8gFna7KNU1d07zbCIz6nC4ZzTL+eLCWoayaev/UH2?=
 =?us-ascii?Q?RbrYc76d5TUvsBiOh0bcaIH5KPCvEBVPY/UFzu2U0m3LHIgH6uH6rm4cHNvi?=
 =?us-ascii?Q?yAvQJqf8QVEF9rPwcGFzzWpl15mQ+ZL28oqyKYJOEEd+vA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xzwlUladV/z+slU8wvJ4YHJ9l++BHP3r81sKRlhdDr8wgCzQSeuFM3zJgvR?=
 =?us-ascii?Q?69CWv4Rtoqb9BGvbGYwM+zJRFLieltDyt101W7L2LqSVcnD7SVDSrNvx0u+A?=
 =?us-ascii?Q?JJYe+A0bWy/hddR/QCyNC4iAirlGUGN2Ks+h57v3/7AcfBt4j/JlxlGDdIqJ?=
 =?us-ascii?Q?9dAVGErGfYB/QCI3ieP7pzh2Is8ueTSPSUISUHwv4O9NBlUGNZzOb0SgZATa?=
 =?us-ascii?Q?H0bVZ3lYnJod4ws0YDmjWUlIbSZMkVI3e85psA1+LWVypgz8yckN/ysGuOZi?=
 =?us-ascii?Q?DNrJxN5s3H29KoOliquqd2WFiEewtbyuJ4wU0Z9w8wkY3c7sfupe6snZ5A6e?=
 =?us-ascii?Q?y0Kj4H+/baNvOMaxQOCh8Y9AsxX5eogs1vBT6qgYp/fUdj4k3YCBmGQ7X0Rq?=
 =?us-ascii?Q?mvc0bv3rrIY5EU4MIw6VZhrKSthW3H3oY1+K1Hsn8CjwH8cjVuiTBaOA8C4M?=
 =?us-ascii?Q?j+44iQOPfXOsf+8VGCsl7DctE3TvpkLVSxqU0s64ag6BkJXGc6KNlyEb2YmF?=
 =?us-ascii?Q?JTUBdeZ+L3YSeYJYuu8TkJOaU3h8hGXoYop7xP8u75H4I2pdklMH0IGlk+O/?=
 =?us-ascii?Q?boOeDS3y4ApirzaGCUazTk6HnxR9vLJiI2ugPnQ5T3Hoebm16Sg/7m+lUh8z?=
 =?us-ascii?Q?LZI1KkH/SmqxXaz1KyvcOEH/nrET1TSHGIdf9ltlfoG1F0BkfBpUWzRRE+0Q?=
 =?us-ascii?Q?PKkaG0v990a5JWMHpF3IX7xB+/YIZxSlLNF5tF9KFfVaEPd3IW7urQR+ZWdn?=
 =?us-ascii?Q?9aQBWA6evTkB2tl4ZARkujZ8kR+WBlWcY1A40jRwvM9EZNBMd9DJU/LKmKcN?=
 =?us-ascii?Q?C2xiuJ6Spw/Ju/XAUS5qXxgvTlk5QHpxTFGCKPRzxfDoNF4nU9iKOwfXfX4O?=
 =?us-ascii?Q?XE2pFIc8hsXV5H8XDQbFCT3z9lov/VMXC5gYccldWjia2tfl803JqcAQUqiF?=
 =?us-ascii?Q?ooQYSKG4QWz2/HNoBKY8pAyNEPrWyUW3a8glyYjL9nWECicnKH7SkGEoTKU9?=
 =?us-ascii?Q?x9WPGOJBiW/RP930f9WrM6ZaLrwIcXBTVHdYrBawM2dX6xgJ4RgbITRTNe9g?=
 =?us-ascii?Q?dUPiuqCwR+VgzZwbKLD3M+r4KQ/kpKrNZj50jqtYctFOHxsDvuyr2tpYzOcX?=
 =?us-ascii?Q?ggf/2CRFj2CSp3T0tr5USu1pYYLrfce51+nFXYD9YiGYQoM/Cptp/UtoDp51?=
 =?us-ascii?Q?tzJV+/EvNALdU2Br3mMo1muecNrW+a0gyPVxDkGvFLhbagNOrYg/q+9HxCEz?=
 =?us-ascii?Q?6DBy6QnneWalF7bRjNLFmK3ucs5dWnUXqe70MgeNjEwzbSzaxsWJWP2Ou6bm?=
 =?us-ascii?Q?mNpLAwUV7nI60xm8ttc5Rd3CSLhGnRIQ1L3gDJIK8Fl0ovcsQxqVfP7r687U?=
 =?us-ascii?Q?z+OHxK3Lj0D0ylpfZw5J0Na7Jw1w96zamySreNW/x2oowWVg3Kohfr5n9rNS?=
 =?us-ascii?Q?af1gxnE62V3ART38zT/FsynJ/USiS1MSNvZ3LW9wEFWI0WXakBsV3YACU8Bq?=
 =?us-ascii?Q?I9gqgyxuJLPxQ7i1/Ip86iFNLxujA03jS5lt2hyeCd4NOC3tvwwiemFLxPaN?=
 =?us-ascii?Q?aQTpbNztCXfoZC3b5C1nTzOx0xRibxpaJus7WnLp4qIDZPaA5jGE++Z4gMK1?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea0637d-debe-45bd-01fc-08dcb82500fd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:40:25.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8wzgiU4JJOcHS+T04EACuxdoVg9f5h3676MCXr7oF8H0UdrgoxTbsj0Nj5NT78ZNKoIQFrUcY9D4+L3WdEdQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Thu, Aug 08, 2024 at 08:40:25PM +0200, Francois Dugast wrote:
> This is a required feature for faulting long running jobs not to be
> submitted while dma fence jobs are running on the hw engine group.
> 
> v2: Switch to lockdep_assert_held_write in worker, get a proper reference
>     for the last fence (Matt Brost)
> 
> v3: Directly call dma_fence_put with the fence ref (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 8659332012dd..8d3ddfc4ee82 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -202,3 +202,36 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  	up_write(&group->mode_sem);
>  	return err;
>  }
> +
> +/**
> + * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
> + * @group: The hw engine group
> + *
> + * This function is not meant to be called directly from a user IOCTL as dma_fence_wait()
> + * is not interruptible.
> + *
> + * Return: 0 on success,
> + *	   -ETIME if waiting for one job failed
> + */
> +static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
> +{
> +	long timeout;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (xe_vm_in_lr_mode(q->vm))
> +			continue;
> +
> +		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
> +		timeout = dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +
> +		if (timeout < 0)
> +			return -ETIME;
> +	}
> +
> +	return 0;
> +}
> -- 
> 2.43.0
> 
