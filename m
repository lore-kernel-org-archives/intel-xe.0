Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B23C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593D310E296;
	Wed, 15 Nov 2023 21:59:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E2D10E27B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700085562; x=1731621562;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i1UnKlAQ1mPJa/UUSY6woKEl041gFYdwO3niGnYFHLc=;
 b=T8spHjTGPNygtrG6AYoOXOh3fwqsI/j2GKK7F4l+jH9NVday4y7cy4Lv
 nqK9Yln9cOTtlh6Zeo70CZaHAN0lF3vy7liWznlK8DA+RFT8ifkmys/vo
 MeaiWnCUr5XAXfdQ/9F1kvZJWWV/ID9nTy0OKLQ98J0nZODtTqVsUsE1n
 ncw8KzYxNVwkcGPFKyu9tD3mThtnp/EJ6gpgFvOKzsXbBJzqfBarQ5X9Z
 hcGwGC+/0SK/cLw7skxyBKrawyA3Uda+Jcn5MSU7GqFuBH3sOeuXHq2XS
 eJSeb9PB05y58SQyjXnApqiJP7RdjZtKr+CUgssUDTmLDrgjSr0Znzj4U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381355367"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="381355367"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="799978397"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="799978397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:55:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:55:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:55:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:55:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADJaJ3HvGUjO6PebJsaQsdsvtXWdxzGWQjNNiNLriQ++t32mugi1knoA+5Axq4qi1Y+x+LTf2AxtxGPxcQtqY8npq+1nlYvGHMulXeUwmfOEPmocJ6PoEGk9fhuktBqDFhmPmuAlgEOtHIKZrlOB6QoeVVPwoe6etrVrXd92a67YwFfXJaH4aYmJZDvX+GWzuv9eT5i7hIGO/UDHDV8kBlZxNncotWgLJ6T4PZi/6/Z1TCnDsacCBagUdtq92qqJKxf5/i3vsJbDMd+/4fIzbfu9CLLNTqVpAaUe0QJRcq95/XGy4pA+QIWXTDPPh8inJzLB5jZT2fY3kse3Ggonyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnkWbN9AHQggmFYeRZMIcDuqVyKzwBnPgrpm1Hw1s8o=;
 b=oR19H9LPL95C1f8VOJ9v9C3IyAhzUWldoEvZ3ffH0QEXckV5Jirf5GvRd3JgRsys4sLU8bUS/WrjD2mQgixn0FII+2hbbZQW1gzjxEgdpPJnb91UGa2cYRUuZh+JCC3cM3mvQQzxKleO6JhElxpyYLqSHscYdCORN8C/Ry7JkDBGCfPNHLFjEw4oQDVl3LQO2S3gqDTIEX1qtsezQgNgWAqwh2fW7YEVN4SjGTm8Gobc9FCthxroRfZ0WeuAz87NuJY2RzkY0PNUiGrcreVEumuOzYUJEAqzEHLfa5pznVLxeY0gv+f47LQwaOFH+SSawP4qg2uAnbODbzLB4Bhttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20; Wed, 15 Nov 2023 21:55:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:55:15 +0000
Date: Wed, 15 Nov 2023 13:55:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115215513.GO1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-12-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-12-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 6963723d-4c9f-4d9f-1e37-08dbe6258d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6S48JKzVp8O4lFua7BXKdSqy1wlMAsEXxAqsUsY1z3LH7qahmfJhTtruk7/fteKEtLqFPrqmh7UiyuLM7RigC9bAehPB5K9KD6wPWYNOXab9/xMrm33WB1NzJxMoYUBWVWnkwqst9XJeuuHWJRkwYYHP2z7wpS84D07BkfggdqFzIARKSZrX39/6kYnX8qmtSAlTMuSV8DYFEgFe2/MhiQvnv0dQXxM3fCLc4EbaQXA91TTSTiqFILFOw2A10oqJw5xeUu2OwlMkaAQe54Y8fm5TTeVXrwxfthEa4AGheEtkXScYi4OMhob0tVGWPurGLoVHdwMOA2OWZfszLnP+IteA9v/xhbE3WGRFaX46zRggJkmfAiMQIsuhDy0k+PbEjIKMlh3OMu8mayMzG1mvyCoHIHRHEaPsrRYFtG3tnf0cNjIEEsyG2XmjmyltWU2qRbBnKSvZunbkc2+DJK0N4ojCQ2/0mHx9uZeIfoQQ1ZIKlESBXMuzREvlBAKU+bYpsmr6Qzr1EFzd1Gq3jnS+cZmNl+FI3G1b3vN5Xc21TgQGTFqX3AK2GW71j52bXvIh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(4326008)(8676002)(8936002)(6862004)(6506007)(66476007)(6486002)(54906003)(478600001)(316002)(66946007)(86362001)(66556008)(83380400001)(6636002)(82960400001)(6512007)(1076003)(33656002)(26005)(2906002)(5660300002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZisvZHVKaFpGTW02S1VnUzkyRVluUDFneW1QeEZyT3NsM3k5dHduMHFydy9h?=
 =?utf-8?B?eUM1c2IrcE5mU3dxR3VZenlqZDdXU0h1UW42Wi9HaGJzU1A0SFF6S2hvYTNE?=
 =?utf-8?B?R1pxZDFVZ3pVTGY3c0tUS092MUJzUDFMelVmenZWdTJkYmMvNzZ3NU1BTjkz?=
 =?utf-8?B?ZUVaS2VaNWJHbnBxVWNFS0t5SDdKV05VOHd3S2N3ZWNpcVV4dmhoVVpVd3gv?=
 =?utf-8?B?dnRoMnJ3aEcrc0VrS2h5Yk1tY1RmVzNMQ0pDbEpwS21ONnV2YTZ0MjVTd0s1?=
 =?utf-8?B?dmJZUkZoZ002QjJuVjN1a2djOThqRjVjV3pmOC81Y2ZyYkEwQTNZTEtYbFY5?=
 =?utf-8?B?ZVpNRG9qNkNEVitIV2J3NVNIK3ZYR3NScktuZkx4VVk2cndrZzFHcjAwenR4?=
 =?utf-8?B?R21MSzBZMjNlQmxIUjduZXp2dVIyOW0xNEhNK0ZjbnpJNGZlZmtMellTQkFt?=
 =?utf-8?B?a09CUjltZmRLcExod3B5SU96eFVidnNaRWhOeGhweWN4MzFNRDBWQnk3NHlX?=
 =?utf-8?B?Z3NQcDU1SlovWVkwNmtQVTc1cHdnQlgzUUZER3hVVWdVckxrSWVoK05mQ2l3?=
 =?utf-8?B?VTRiaVl6eVJJQ2sweTBQakxDdTE3VGMrbXNOWm0rMXBibzJ4bW9sUzY4V21F?=
 =?utf-8?B?d0V1RkxwK3JaajA0a292TUxMK2JXTDdYcjJiQ2JJYWoxTDNtWjRKU3ZVbDM1?=
 =?utf-8?B?Zi9kdkVIZEJUNTI0NkdIdXZLcXg1V0JhRzM5ZkFLNWZLaGt6R2hUOXo3RnRs?=
 =?utf-8?B?bUFMT2VFWmhyNzBoQkVrRm9OV1VKR0gySG5tL2pZOWJZUlNHWHlnZnZ1V1lY?=
 =?utf-8?B?YVNoTnVRSHg5dXduOFVTazk0OUlQYTJPWHQ3YnFvazFwOXVuVkZiMWRWdVFQ?=
 =?utf-8?B?TWdXQnpBdWVxWEtjOSsvSFBFQkxuVFB5M2FxN0RZaEZKNDRCZmYrbmhCNlIr?=
 =?utf-8?B?Wm9qUHJuNkhtTW81ZnRsQTNpcnZtRk5aT2ludjFYYjdLQVBPM21xZDBTWGxk?=
 =?utf-8?B?Q0gxaHFoWU9mQnJpcnVONENYNVNVYytQR1c1N2Z3Q0YwamN5ckRlazgxYUN5?=
 =?utf-8?B?dmRoTEJFRzZyWnNSeHZxMVc0SnJIcVNMa1MwQjJzN1BuK0c0NDVrMDF1bU1Z?=
 =?utf-8?B?WHdFREdIWE41MmpDWG9ybTlXYi9zcU5Ld3dCeUtSdHpRa1NoTm9zUnZrK0Zi?=
 =?utf-8?B?Q0t1QnkvbUE2R0xuSnM5TFdPL0x0WmJraTlXTStKdFNRNmJLUTQyZ0NiYkJT?=
 =?utf-8?B?RCtibW4wZTk2dXVrUzkwQ3BuUVVSVlA4QkEzYUFLbFh1VWRQL3RURi8zSFc2?=
 =?utf-8?B?THJQdEEvZFk5ZnA2UGFqTGNVcFlMTGRwb05XQUlYQnlwUDBrbUh2eldidnYz?=
 =?utf-8?B?L0lBY09CNXpZbjY0REQvaWI1VkpOV1AvMjhSN1BGUStHTCtKa0tSYzJrSUlm?=
 =?utf-8?B?eEd6Y2RpR09xaHhTRHg1MmZUaTlFb2pBdzl2Q2FFLzAxTDdBdFAxcWpjQjQ1?=
 =?utf-8?B?WVhmcjRwbU9sbGNVUEN5cU53MlJBTUtVbkVoMkRCNERsZUZZcVJQMzJhc29u?=
 =?utf-8?B?NUwzTU9RaDk4TzZUdzVwQ3FtazBkM2pacU44ZUJsZkNxajVXS2RBQmIwb0th?=
 =?utf-8?B?dG1VUVVpNGlCTnV5c1R1T2tnNEFLdmtrS2JXTlFNc3puSFRBOHlIRkorZElD?=
 =?utf-8?B?MWZ1MzhscVZuTjduOXdvbFROVWxPcU53L2dEUkhQWkhEbk9zenQwdGJtdmlJ?=
 =?utf-8?B?SlJUMUkwcW5vc0dTYm15K1dBMXhYckt0RmdlVXdRaFdQd2kxL2JqOXhMYVFw?=
 =?utf-8?B?dFdJalU4UnhGRnByamtLYVhzMHRwL05TdTFLUEFubGVOVHBGeE1XbDQ1UzNh?=
 =?utf-8?B?T3FKTzV2OFdoWHpCTmRoenJSWVJQVnFNMEdXb2s1Q2JYL0RUQ1QxRkRqTWlt?=
 =?utf-8?B?K3pVdHNOTU1VdU80OHY0Qk16RnB1Q251YXNEUzV3QjQxMXp0Tmo5UEFUdGlU?=
 =?utf-8?B?SFhIQ2Z5a04rVFFVZlRNMUJaSUoyd1p5VUU1T295VmRmUnhiaUNNWTVycUMw?=
 =?utf-8?B?ZVBkTnpIN2ZJcW8yZ1h3QXMvRlFlYzJXV0NSR0NwRkdMODJkMmYwaWVBOXFB?=
 =?utf-8?B?bXNNbzFjc3daQ0h2V3pUeHk5RVdQZDdtRGNvSFppVWZnVC9rU1BIMWJGYVhT?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6963723d-4c9f-4d9f-1e37-08dbe6258d06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:55:15.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9XjaPeaHcvkaN/WvhGIPLOWn9eFyzKXIg6476RHNkan/XiiOgn+BJeBjhfnpmbBfED4I3UPc2i/NxjIhJ4BCQPHsQJbdjl6FoT96z1N5fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 11/20] drm/xe: Move system memory
 management init to earlier point in probe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:22PM +0100, Michał Winiarski wrote:
> GuC will need to be loaded earlier during probe. And in order to load
> GuC, we will need the ability to create system memory allocations.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6fe669fdf1c0a..a89b5a32c093d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -402,6 +402,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_mmio_probe_tiles(xe);
>  
> +	xe_ttm_sys_mgr_init(xe);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> @@ -430,8 +432,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_irq_shutdown;
>  
> -	xe_ttm_sys_mgr_init(xe);
> -
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_init_noalloc(tile);
>  		if (err)
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
