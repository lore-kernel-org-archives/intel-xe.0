Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F6EEB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 04:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B210E030;
	Wed,  6 Sep 2023 04:22:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428D110E030
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 04:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693974134; x=1725510134;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LtqdGSH9bYw+O2ppTH2p2kEKksz1vcGP/4BpOae9Jzc=;
 b=O2LnpUeRyA2Gla6RRp9CzqC4MLEOSaBfWpMaa/Y40CfNAFfzHeu1cN6G
 4Rzdn/iYpSf+UOILCrGetGNOq38RnD3rT05BUDkORrbBBf9Bxip/zGp+1
 vaH9+6fXv5xZNNyI0jnXNwlrMqGatkCpu6Poi9n6X0wwy3+/NtptQ/2VM
 WGas27IfRHnRKu2zKiHvAtTDOaXGIIu9XQAzj9Qhx9ABoJsesk784EXZg
 JDzturvkgaBH2XJlDOaK0/nLqZ2ZbioI6jVaE1Hv/FwMcofUTBliJiWRr
 zFD3/FQy/0cLW1u3BtU6Tif4fTDumEDR7zPO1brnTL0qnOdKTg8fbV4nj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375870344"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="375870344"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 21:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="741363858"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="741363858"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 21:22:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 21:22:12 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 21:22:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 21:22:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 21:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LynKJFlWa+sWz4nZx6YJGP5rEx8AdUriTJZvYOEwVOGSRHUtvmULmI2pufQA/nqsFTqKBO4NwsXxN2V+8xf2X15+Z3qhPUJ+pKa+3Ciwuvlfk/28eum7MBGpYWC+NklhsO0vBLXvY9VnArYp4mVaiRIxGvoQOlFZa8ZZKvdgwvViZLpCO0KjxmK2oelgFmHJXwXdcFgu3LyihMS7yhVYeokhkUANGxnS5eO/NLmiuGzOD6XYDal5puW4Lg6Pqk3CQbw9CwUmzCwx7mrVRl0+FW2RrR98juMQ7kshHMvxTFmHy/jHCKOZv9htmWsjeBpzcMEP6Kf6aNor5ZROaXIdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQbg1krUSMX67PpaLplyX53xQWgvj8I30xS3HSZiqic=;
 b=nAA3aj9/Nl3roMeIAE+QUkdwlZQ2VtnZJ8RMvbkbJ8Anckjc4ea/UZkQclPFzZlG4WzXBA2NQWjLPggZ1AtyfaFmZKIQPd+GUgHIoDv8OVohV8jIHdkA5mrPCgl2NgcT8OscRyMAyuBahHLaye/VsxjduPnGFlqO7bFA6n7iaUgY+5sl42s55LS6YIcMbtV3mH5woONc4/ORRarFWpsYflVb2SIGnosOcjSQF+j2KzLcg3lm8RlXFaUvZuNnovSMsCvT9g/PgFWkSIptO4fRqa5NhhJLJPhLGxqvTk8jN6lmEekJIw1Fc3g7/cEY94jXnljmiHQJY+QMMQh46eyC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5616.namprd11.prod.outlook.com (2603:10b6:a03:3aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 04:22:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 04:22:02 +0000
Message-ID: <5d05faa2-ea15-430e-80ee-e851cb2d2e9d@intel.com>
Date: Wed, 6 Sep 2023 09:51:52 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-3-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8879df-ca43-4033-2e44-08dbae90d20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0TfQ+fkb+sVVB/h+UBSZGXYq7nPEZhmC02cqEiXJJHSpwrg74MlQmhXAPHbQXBKIKBuUrmz6XBR+Ed4uXhBxu7VsYeje6CHsWVcgbMsEHiJkwcc1PkK4+cLy/BBSxvU6kkfMs+NsoGJNQpRQn7X13CtiQ4lM0QsztXpY1IPBGQypOMZcLVx/V9YesyYliVZB0MKd66pqNLxdqY/N6cW1iMqGld+9x70PIubH7wrj55tumvIJkMA5Bq4CicXgbQ3w00BVBhhy0z60Xs6p0iehPl2rqHNj5gXKLMyjdZsnOYUlk2CDqHCZdAHe11Wwn2/TX5+EE1/GnoMyXALywNXrhX0K/j7qmvyWCOuJvLI8FFW6o1yH8y/3bWxPqTGBppEmD3Z1F7gwyVpAe/UmsauFJzRktHnndtQmDyZBfV+dZs1CrOLn+/fJjciHT/XXizY9yVifd+xAOMykrT63wuRlEyVkdfN/Or0vPueo6jxWJB7F5wLxK8YfdxTasjJ8Cj7uPF6H2oy9TkkvqFFV1RL/EZaSy0H2ZG7ZYmsVxRw6pvvSzElon9m2KqviBMoubfnxq1CqdtNvtsDvzXLl39yrcHJfllbHLFFeJJv0BRQqeyVZuREWYykXoq8TFXVd41OACZTrxCTi8WbDMDZoeTvjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(1800799009)(186009)(451199024)(2906002)(83380400001)(66946007)(6506007)(53546011)(316002)(6486002)(66556008)(66476007)(5660300002)(478600001)(6666004)(107886003)(26005)(6512007)(4326008)(2616005)(8936002)(8676002)(41300700001)(36756003)(38100700002)(82960400001)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tDMGRIMGptdEtXUDJ1ZS91K0doeGYrS050d1hXdnEybEtRMkhmcDlJOTNa?=
 =?utf-8?B?QW1oZFlvWkNLczYySUdYUWpCN2Fta2JmVjN6c0NNUW9QemRpZDBXb1JiUDg1?=
 =?utf-8?B?T1FPZVpsaGc2WVFFWHdVVlQ1QTBsYWJGQUUvWmdlSVVuSzBYU1RldnZNNDV4?=
 =?utf-8?B?Z1BaLzZUY21vSnk5Wmw1blJxamEzYWRBOWhoMkU3cUgyZ0UyWnRtejlUVWZX?=
 =?utf-8?B?d1FWVXJUK2dzNHBsQ2dTZzFsZmFtMGx3VktPT0x2Nm0wUDlCNEE2eS81UEpa?=
 =?utf-8?B?RUJpRXE0elRNMGlKRkNRM0RzRXROVGZzWC95bFNYWS94c1pyWVVkc2NRN25y?=
 =?utf-8?B?NksvenRsQ2QvNk9kUFhYVWhYbCtYTW9ENmlFWVUzRmFsN2ZaSm40YXl6UEZm?=
 =?utf-8?B?ZkZIdmJUTXMzZkIyYm9iZHdSUXpXVG5oRXBkaktxcFg4dmt2d0xXN3l2QWtE?=
 =?utf-8?B?L3dwWm9RbzJXbEZHK2RWUCtpeFVvdGpSSFNNM00rUXFMUlRia045L1JvNHlJ?=
 =?utf-8?B?MHhsQ29mY2FmaGpvNVl4R0hrMFlQdFR2TzhQVEp6TkJwMWlNMVAvSXA4Ukpw?=
 =?utf-8?B?KzJsU2I3RkhjMS8vQUZlWHFlOEMrY0k3MUtjUDBBY21BQkI2Z3RiYWNla245?=
 =?utf-8?B?eThQUmJOZlo5RVZ6V1JHSVYxTWUydktvemdZWGlpZnJVRGx4TGxuVGdGaW1X?=
 =?utf-8?B?MmVDUXh3K1NRNkZVQWJFdk5XWkt3MzNmT1J1Um16MFJxbTVjVWdjbFdjd3Zw?=
 =?utf-8?B?TFB0d29nNEVNdnRIbkJiUXNjMFIycDV5d2dXY1JvZFhvellEbmphY0V1Q2tI?=
 =?utf-8?B?NjBTcjF2aGpWQkNwSEUwZnl6SXBvTzhaNFc2VzUyK3J5YTlaOWxUQmtKb3Ay?=
 =?utf-8?B?QXBNOFBydGdRWS9QT1Y4VE1kMklvTmI2N1pXRHdmRDIzMlg2OE9EOGZGWE1U?=
 =?utf-8?B?SktNUHBjUnRsUVBvaGh4S0xBN2ZFWmFlalpuUFBWTjZXeStERE5JdzNWN2g0?=
 =?utf-8?B?Uk94WUt0VjBGVUwxMjFOMlNuVU45WUs1QmY4eTEzdUdUZnhvS0U0c2Jqb2Rk?=
 =?utf-8?B?TzVDUGZPYVYrNUFZN01FS0VCalpsN1JhcXZFOFF6dkd5VHRuT09uME9iV2g5?=
 =?utf-8?B?ZWlEOCtsYWl5aUVvMHdUd3krSWlRaUptTTRsdkl0MmlYZmNtWjNnY2oyZk9R?=
 =?utf-8?B?M0ZBY1FNaERhcnhueEJpajFlYml5UzA5QS9kM011ODFUWkJKZFZNRzhoSHRU?=
 =?utf-8?B?eWRJdlVKSjNLcCtqcXllNFlxZHFIUklUSGcrc0NhSTgwcWVHMlNkYzNHaHEy?=
 =?utf-8?B?eTJLQzVBdEpIdlk4S0RUNkZNcUNwWC9lY2trNUprdEExVnZoSHk5bHJBM2Z2?=
 =?utf-8?B?dmpmUXo5QllRdEx3V0lMTVZlb0xFNit2K0ZYRzgrcVBCQXFyUGY4Vk5GVHVv?=
 =?utf-8?B?d3Bta1hNdndXTFFYZDFpbHpianBzNFlJOUhlTnc4SmdOcFBkTENqWUJTS0NT?=
 =?utf-8?B?clNvVmt4ZkRvLzNhT0hPREtWdWJnamYzcmNYOVo1Yi9KeWtwa29yWThhaEdi?=
 =?utf-8?B?Njl2ZkF1OGY2MFdCRkthZFBZSEpRS3gra1d6OVhFRlZzUGVXajMvTWkvUFlj?=
 =?utf-8?B?YmlkTzFsRThtVmQ5WXRabGtJbTAwY3h4OXZxVkVMMVprcURGcVg5N3FNVGZX?=
 =?utf-8?B?ZmR4Q3UzTWVaUGRxNEg3NXI0QXdFenRPclozNTRxekk4WmlrUFJHQmdQb21r?=
 =?utf-8?B?VER4V2c0am9nVkp0V1Q3TmVaL3VXOCtNQVlPQ0Rqb1ZlOS91OG5uM3E5b1BM?=
 =?utf-8?B?ZGkyOGE4S0ZEckdVZCtoU3dRendpT3ZVcVIxSTN0K3dZQmJuVU1rSGVHeEth?=
 =?utf-8?B?UFluN1ZpWmczR2ZOeUNCVHdoNkNCbHFXWnptK2h6cXM0Z3B5U1lWc2tNaldk?=
 =?utf-8?B?ZkQ0Q1hTNE9ON3JSWWVNWFQ5U05NOWR1R0JPRXFIZGgyNy9QVkVVRVBweG9Y?=
 =?utf-8?B?dU56aVlOYU5iY01WWFIzWkpzNVMybDVXZ1M5MENieUEvakxHdzFOM2xMRExo?=
 =?utf-8?B?cytqaHdHMExGYXp2dklmemdUem0zTFArTy9rS0ZOUTgrSmpST1ZxZ2Z1ckE1?=
 =?utf-8?B?OXJrQjUzM0dwWmljRWlDdlI0UVFvK3l6QWJKaXlXMDF6bWhwOU40Z085QUtp?=
 =?utf-8?Q?82YrtuR/5iIBsYwioK6Z5DA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8879df-ca43-4033-2e44-08dbae90d20c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 04:22:02.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asO8O6NnBKIQOQlDDoyMu/Dwed/4os0gAio587aVqt3BLjC7AYFU9O8wJ9h2CsGaeVTMrl+0xt4VqA+9Msh7pbJhiT5A8lV2IMbbSsEGYwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5616
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe: Interface xe drm client with
 fdinfo interface
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


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> DRM core driver has introduced recently fdinfo interface to
> show memory stats of individual drm client. Lets interface
> xe drm client to fdinfo interface.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     |  4 ++++
>   drivers/gpu/drm/xe/xe_drm_client.c | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h |  4 +++-
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cf59c7b74eaf..1aae352a982c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -138,6 +138,9 @@ static const struct file_operations xe_driver_fops = {
>   	.read = drm_read,
>   	.compat_ioctl = drm_compat_ioctl,
>   	.llseek = noop_llseek,
> +#ifdef CONFIG_PROC_FS
> +	.show_fdinfo = drm_show_fdinfo,
> +#endif
>   };
>   
>   static void xe_driver_release(struct drm_device *dev)
> @@ -162,6 +165,7 @@ static struct drm_driver driver = {
>   
>   	.dumb_create = xe_bo_dumb_create,
>   	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
> +	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), xe_drm_client_fdinfo),
>   	.release = &xe_driver_release,
>   
>   	.ioctls = xe_ioctls,
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index ea7993338076..b5dc024b5dd0 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -50,3 +50,20 @@ void __xe_drm_client_free(struct kref *kref)
>   
>   	kfree(client);
>   }
> +
> +#ifdef CONFIG_PROC_FS
> +/**
> + * xe_drm_client_fdinfo() - Callback for fdinfo interface
> + * @p: The drm_printer ptr
> + * @file: The drm_file ptr
> + *
> + * This is callabck for drm fdinfo interface. Register this callback
> + * in drm driver ops for show_fdinfo.
> + *
> + * Return: void
> + */
> +void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	/* show_meminfo() will be developed here */
> +}
> +#endif

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index be097cdf5d12..dbe3a083c9df 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -39,5 +39,7 @@ struct xe_drm_client *xe_drm_client_alloc(void);
>   static inline struct xe_drm_client *
>   xe_drm_client_get(struct xe_drm_client *client);
>   static inline void xe_drm_client_put(struct xe_drm_client *client);
> -
> +#ifdef CONFIG_PROC_FS
> +void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> +#endif
>   #endif
