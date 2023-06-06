Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7500C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4E910E116;
	Tue,  6 Jun 2023 12:29:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE610E116
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686054592; x=1717590592;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SrLi91m3h3ImadurZW4Dte1A1691G8q6dSY+duCPXhE=;
 b=HW8S1PwCUTkv+UJHqzmzaz5tt2kWXWpImOAAZksovaK8IWazcWZxvS8j
 Z9a+5HagrB+68E8elUFh7AMoqoVJQTqDnZVGd4iv6vy9M0Av5NsS2XzJX
 IIOOovDV9urg4PJh1HBSmRr5QoY9eJwyShyJbYQ8M1tQspqsNjlK/0YGX
 3dO8TZsXhHq7uMTu1pr3bph6nyH7KvLnJg0hkluoakDKwO4dW+lHwEQOZ
 n9evRzlSUH4z/h2QFVR1O91PTOMXcLuAA6CIB4Zr1XEUaYqUpGZmOnIJD
 K18yY1kl7c8uGAgIzgEGf3doUjCjJsfNSy/imH9lRq87ek2S8RrsGwTAx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356662761"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="356662761"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774107541"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="774107541"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 05:29:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:29:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:29:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVE7vDrOHmT6MEq8kyulELSJ1hFbzNclkGm61sIArYgaIrtKUMT1IAc43CwhL80vVy9R14AZCk75edtihDo70UxeCH3HGwMezjytmWF75aDgkHXQrI2nn2Szpe8itUj6bpBzI/alk0Nv37EjrT8jzpmeaaJUO0FKCGhZh7638HiqXA3f2cCIePzqQFP0/Y/rq4pljblQTKHSFTg9jqN4PETRtD5ubhU4+dMGKluEe1iBSrKMVBO0Z1O1lRqS7TVnTddvk2eGFJ5gX1y+d4h8VNlcL+RzDaO2Y8YdshMTangfGHboHFbRIXfHih/qjjD5teo31FioiRzF+hRyYEUZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eghbr2j2Ux4iCpmonjzGdqDKiV/UdJstf3H0ihn364A=;
 b=UZNrLFsOog8MvPLbEPD1qTNuMhx2H6ETDhFrou+/f7aDr3ZRV/PHAd/7mh9nrR+KYUx+fPHGgFvHJtdlGCweYlipqlNfv0+tSrbyRau/uYJAqXVjcRpEe7n12+vi7Cm2NfpE4pCklS38tMn5n2DMi8KH+iWx5STroyW5eIeDVQwDMtfYcdRf2zD5ffks437AhHPxARYUcGFz6Zg8iuL2DDFHeeiZzJpbxYo/G7DtDKQJumVe8UedryNldG8Hlh0oKvPM1qYo0WYMiccd8neTci3734gkdUSIV1lwAXNB7YnJa3mYGGB/BYBzSSc1fUkhM2p5ttTOiZGxa9nWoqk+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Tue, 6 Jun
 2023 12:29:48 +0000
Received: from SA2PR11MB4843.namprd11.prod.outlook.com
 ([fe80::e14e:7a40:74bd:2227]) by SA2PR11MB4843.namprd11.prod.outlook.com
 ([fe80::e14e:7a40:74bd:2227%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:29:48 +0000
Message-ID: <24b8fde2-7e34-5103-af5f-9600be348a66@intel.com>
Date: Tue, 6 Jun 2023 17:59:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-2-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606111255.2072426-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To SA2PR11MB4843.namprd11.prod.outlook.com
 (2603:10b6:806:fb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4843:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 906df39d-f27a-4959-9f86-08db6689b794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1FbSSiW7j+QF4DtKRD5d1ZLB8jAFeZcklyfoIMmXN4EDTQBsnSwvMbWp4CKbYiipvqq2BDbUf+539eBrAW6FRNdW10JEdkqVmy/6VRIOVd9+wSRxevQx74Fjh+v5XNK7F5uMwNpL+qOtJ7gdHjuXHV2cdal96PTcVhd7zSaalkYILJjI0iQx/z43mSPYmhjF5e1mgTlmzqf8CHqwSm9ntYjeZrfabp5mbq9rm+dN5+blhHgb1e7dkkz+ODprqpngK6wTU0IG38j+NEtISvZxrSOur2mw+BTGDB3j6EvH93BXf6FCIUuO9qsbiJbaofc7HYgUyQZDya3vGyenX76snsoacqeQ9uZGvAN19PRWpF1lvDcf3DF5b3uetBIVHwCIKVLcftNdV0o989tYj0Cx6W9R8dPfbN6rBKXzssLwDQlR5GRCowfMov91IE97gv+Vw6VSBpKBeYzbo5GCeVTRjYAu7ZUpaSepspalrvTEeXZ0qDClOI24qEp94zGCloYDc4xj+97X2JdjzWrjQs5prZe/LhNJJ3JHqnhj+E3jBD0+e94QqMP6R/avas/jAn0pjX8EDSyncc25n/lna/YwLEUCgl61nZt4uIt3/DPv/TaLkS6VUP014NyrK7avM9g+0gfOK32+vjtpRgQX2CEIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4843.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(66899021)(478600001)(5660300002)(8676002)(8936002)(44832011)(36756003)(2906002)(86362001)(31696002)(66476007)(66556008)(66946007)(316002)(82960400001)(38100700002)(41300700001)(26005)(53546011)(6512007)(6506007)(186003)(2616005)(31686004)(6486002)(83380400001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWhFUThwa3IzRk1VVnB0M0lSaXZiOGVKZTBTbzJtQ0NrZWF5cmRqeFBrMWdo?=
 =?utf-8?B?eGlCZWxPN0ZDRE5VVnc4NGRkRlViNmpoUmJtdVh5czdqb3JpcXVneWo3UGla?=
 =?utf-8?B?RTNIVTBxYUNUVExCd0dqV01FUE9XTHFKakgxZHcvNWozbFVwSFF3Z3ZTSzBa?=
 =?utf-8?B?VDM2UmljdUF3Qy9lWnM5Nk5QczBCY0lqZVpUNzJKWnJ4elZuYlR2N3E0OWs0?=
 =?utf-8?B?YjhmcEFmS09RNE1uYVFzdGxnV0drV01yM2g3ZUxkVjhFMzEyb25LT3ptNmhF?=
 =?utf-8?B?MjZHck5FeVRHY2NpZm42L1dBQU94QlIxY1RuelRDZzlRU1NrRkpKTTM2ZmVG?=
 =?utf-8?B?SEJnUWhHWnZMQy9SbHZzREVBQ09oRllyWnlHSGt4UVpCZThGQ0xwRXVCNlBs?=
 =?utf-8?B?cFduQnVoa2p2aFVycjQ4S215NUxITE9ENVJrUC9ORGZTWnBzbERCS0Jkdy9q?=
 =?utf-8?B?ODRjN0FmZlIvYkRKY3dEQjNlc2cvNU40QkQ5SWJBV2VXcXd2UTNTL0pSeWlL?=
 =?utf-8?B?cXFoTlV4S2NXZzloQThHemxBc1kzbTFHQXhKWmhaTSs3TWsrakRZL1lTc3pD?=
 =?utf-8?B?VEtOSnJmWXZiTmdRMzk2Q1YydVZQUmh0UVlmMFo0NGZNRzRia25sdlhKU2ZT?=
 =?utf-8?B?NkE4ZTRCSWdiRkhaK01LYXVDYVFCVktxOUpWeVpYNUlnbjZ0OTI3MjAwS09Q?=
 =?utf-8?B?aU1kUXhyRDE0ZExFUDc2d1A2UndNYXRDdnpGUytNemNaSXU5RCtLSVJsS1Fm?=
 =?utf-8?B?Tm1IVGY1b1ptZHNnTFhjZVlKR2F4RTk1UEdkZDlGSE5uYlVaczdIQVkrZ1o4?=
 =?utf-8?B?NllYK0FxVEg0QXVleGN3TkdJYU5MbWhHdEF2YUx5Y0dGMVcwTXhXYllGRmJx?=
 =?utf-8?B?cmZRSnJnZmJ2QzQ5S0pHbXY0bEx0WXJBY01USDRBd3FxcW9tUTVYZHZ5c3lT?=
 =?utf-8?B?UEg5akJrclNWTUFubWhDemNTeVV6Q0t6N29LeHRtU2NqTFovVnF6aUN5cFdU?=
 =?utf-8?B?eE1RY2lURkYvR2NYWlY3SE1sMVlBVHpCRzgzOHZUNHZzbDd5WCtCdXZkTHh4?=
 =?utf-8?B?Zjl6SGJuM0Z4ZWNiMG44cU5rRDVQaFlWOGt6aWs4V0FKY3UxOVBwaTU5MVc2?=
 =?utf-8?B?UklqRUdvYjgwV2VDazlvUm1tNTlKeEdjU2tOaXBNWHF4YUloanU1THVvdmJ1?=
 =?utf-8?B?NVlpYzdyVkIvZ3RiV3Zldkw0NVVHUzNCaGN3VVAzODUyVHQrZG43NTlwWG50?=
 =?utf-8?B?bElYS1pnbmUwOElOc1ZhRDFodEFEeXF3S0V4Mm1xNWlhU1B4OHFvL05JeGtr?=
 =?utf-8?B?M0xqQnNQQWhsVjIySTErZm9QM3IxR2wxRmxTNTRnbVkwb2NJeWlaR0pHWE11?=
 =?utf-8?B?dHVsYVg0Qks4R0RSS3kxOVZKak5uenYvTG5Qczg2b1pjSWRWN1VOcFdvQTIw?=
 =?utf-8?B?ZU0wRUR0dTVJd0tXVXJJa3Azcno3QUVQQWxGcXlQckN3eDYyb1dxWGhsbnMv?=
 =?utf-8?B?KzN3bFVIY2JBb2ExdWR6eDZWVGFkU2xlZVFvUU1RSUJuTzZWU24wdXlLaFkr?=
 =?utf-8?B?d1Z1blZCN2FlUXV5cWRxT1N2WmZQUFlYZ2pDS2VJRzczcUdpaVl4dHY2MnRE?=
 =?utf-8?B?KzBKYnRVeXFkSkRPNElMZFJiWThyUUwyRUlmdjMxK0tRMHc1ZmJmSHpTM200?=
 =?utf-8?B?T0JvWWoySmlvbVBRZW5KVVYvM2VrUFhablZKS1ZwNzU4U2ZjV1B1MnpIZU5x?=
 =?utf-8?B?bnd4NTZSNGR6cERtaFRUODhxcmlxZkkvcnQ0M3Avbk01ZjJOTXE2UEVDcDFG?=
 =?utf-8?B?YjFNV3hnME5tN1krbVBYYXdvZnVNd3ZHWXJCbG9XZEVhUzY5MTRtRi9rVUFp?=
 =?utf-8?B?SWdKM2hsSTFpd1FBVklwNHI4TWRiRm1Md3BQRFJmQXRzWnlkQkMyZkd0MzAy?=
 =?utf-8?B?dUszTldSRFkrd3RaTG10K2IrSHN0VFg0UTdmMC9ZbVFjZG1RYTJRcDZMMXV5?=
 =?utf-8?B?Y01XclcwalNJSEFvYVpnYW5UL0ViRFRuai95NWZ4elkyY1o0aU9qOUtYRW9w?=
 =?utf-8?B?a0hIMVVFa2xHbGRvUEZpMU5EamRYbGR6Skk1M0pJMmhTWFlYN2szT1djb3Q0?=
 =?utf-8?Q?+2HP5rW7KdUcuHZtDFfWrFbMl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906df39d-f27a-4959-9f86-08db6689b794
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4843.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 12:29:48.3916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qW8aNk9ba5pIU3467Q/cuhVrxUiPu1zh6wTF1vkiLEekcnpX0vlIvrBw62J02JzPQJ1FQJKaXjWFP2laqsddbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
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



On 6/6/2023 4:42 PM, Tejas Upadhyay wrote:
> We have recently introduced tile for each gpu,
> so lets add sysfs entry per tile for userspace
> to provide required information specific to tile.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile              |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>   drivers/gpu/drm/xe/xe_tile.c             |  3 ++
>   drivers/gpu/drm/xe/xe_tile.h             |  2 +
>   drivers/gpu/drm/xe/xe_tile_sysfs.c       | 58 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++++
>   drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 +++++++++++
>   7 files changed, 113 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..41a6c0d0dee7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_step.o \
>   	xe_sync.o \
>   	xe_tile.o \
> +	xe_tile_sysfs.o \
>   	xe_trace.o \
>   	xe_ttm_sys_mgr.o \
>   	xe_ttm_stolen_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 17b6b1cc5adb..db61da4d6212 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -150,6 +150,9 @@ struct xe_tile {
>   
>   	/** @migrate: Migration helper for vram blits and clearing */
>   	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 6414aa810355..ac70486d09c3 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -10,6 +10,7 @@
>   #include "xe_migrate.h"
>   #include "xe_sa.h"
>   #include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
>   #include "xe_ttm_vram_mgr.h"
>   
>   /**
> @@ -142,6 +143,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   	if (IS_ERR(tile->mem.kernel_bb_pool))
>   		err = PTR_ERR(tile->mem.kernel_bb_pool);
>   
> +	xe_tile_sysfs_init(tile);
Hi Tejas

xe_tile_sysfs_init returns error on failure. Error needs to be handled here?

Thanks
Riana
> +
>   err_mem_access:
>   	xe_device_mem_access_put(tile_to_xe(tile));
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 33bf41292195..782c47f8bd45 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_TILE_H_
>   #define _XE_TILE_H_
>   
> +#include "xe_device_types.h"
> +
>   struct xe_tile;
>   
>   int xe_tile_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> new file mode 100644
> index 000000000000..821bd49de277
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_tile_sysfs.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_tile.h"
> +
> +static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type xe_tile_sysfs_kobj_type = {
> +	.release = xe_tile_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +
> +	kobject_put(tile->sysfs);
> +}
> +
> +int xe_tile_sysfs_init(struct xe_tile *tile)
> +{
> +	struct device *dev = tile_to_xe(tile)->drm.dev;
> +	struct kobj_tile *kg;
> +	int err;
> +
> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> +	if (!kg)
> +		return -ENOMEM;
> +
> +	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
> +	kg->tile = tile;
> +
> +	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
> +	if (err) {
> +		kobject_put(&kg->base);
> +		return err;
> +	}
> +
> +	tile->sysfs = &kg->base;
> +
> +	err = drmm_add_action_or_reset(&tile_to_xe(tile)->drm, tile_sysfs_fini, tile);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> new file mode 100644
> index 000000000000..54a2ba8ba533
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_H_
> +#define _XE_TILE_SYSFS_H_
> +
> +#include "xe_tile_sysfs_types.h"
> +
> +int xe_tile_sysfs_init(struct xe_tile *tile);
> +
> +static inline struct xe_tile *
> +kobj_to_tile(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_tile, base)->tile;
> +}
> +
> +#endif /* _XE_TILE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs_types.h b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> new file mode 100644
> index 000000000000..75906ba11a9e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SYSFS_TYPES_H_
> +#define _XE_TILE_SYSFS_TYPES_H_
> +
> +#include <linux/kobject.h>
> +
> +struct xe_tile;
> +
> +/**
> + * struct kobj_tile - A tile's kobject struct that connects the kobject
> + * and the TILE
> + *
> + * When dealing with multiple TILEs, this struct helps to understand which
> + * TILE needs to be addressed on a given sysfs call.
> + */
> +struct kobj_tile {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @tile: A pointer to the tile itself */
> +	struct xe_tile *tile;
> +};
> +
> +#endif	/* _XE_TILE_SYSFS_TYPES_H_ */
