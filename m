Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997C8C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4A10E03C;
	Wed,  7 Jun 2023 10:50:42 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199B510E03C
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686135041; x=1717671041;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r2pQNvf00UBSuTTRizO4xplwsC5zZzletof1mCfcOV8=;
 b=jwtZpVGhMz3D+ChtNDayXW2hlUq7pHoHG6rv7YUta/iNBWQqzApN7j2P
 KUj97fvoIfvTsBSQ4cBH0PPrlzFcJgo+afLwoU1Jl6EgvjE+9twJYs6hK
 t19yxv3QSf6Mr4L7JUtn0BBFJu7laeHNsuNPfu9PlZhAl9R8AZJ/EP9Jy
 ENHagdI+hJ+aBm6ZXc7zdDtxnq22M2SmU41kx3aXqodclPvv4SDgWtgeE
 A+f9BJnjxsFaT4TO983ojP12f6bAvjo6V1BIKvLMbaMYo9qh1bGiFB7e2
 /gJVf9NuctjuW8zQgF8OkGW/Oholnbd0qzTrlA9pksy/WWYS1LAQ3USWC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346565425"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="346565425"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853820383"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="853820383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 03:48:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 03:48:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 03:48:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 03:48:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 03:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCufKMX8iAkg3ANh4DSescblKIPGbMfaovnQNqUPdKXrk9NkUHbAMU0pDHhoKb2soogMz4GsNP/s6i3GJZytvFkj6H3GwV7+DNhB3XyeRSvEBYiZtsUe1msxnpXyed+22563PoXZ8Dblub1gyvQAW+W7SM0JF1XlXkJkiUMpBHuN8K+IoOKSPsTGxlHLDuDyCB3dg05NjLJr9+Ofh4aWM/P/TOHssAYK6zWAC5umxtkQpB7GMIZ8r2LcAOhsOrw++RVIQ5p9CaVj/xRp5NkKMahFyKwrse6uDimX1sCIBY57FP5ddf8xVY+8dx342DFw37qYYTAAep1UiVjDXxPyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N1P3urslG5fsCQVv8BNNqpYcYCY+IKizEiU+S1eda0=;
 b=XbQvG0lSgp6HInXcgidYQK509DiUYUGZMOjdqhtBuMMy3Uj1XRV5WcoPTzRYBJPcUTLGWmZ7Bu4/LkP6Vbj3Kq67fTyHZQpgAoanLD5mJXvu7oWt9aPdbyIXLnhlS3w3vXbt7db4JN8WCTY3gabQworD5Coc+7610yZdYiEn0asujQFSpd3Hyg0XxyYkRlHTSDu8nRYDy4N7Tqbb9pT8pXoZh3QVXJ2jUQ9h8nM26kG6HgsqTbvhg/UnplMFpYXEC42vFLaZufhDYxLirmn/ywRnCJveo3oWQWh3IVQRU4gmZs20FX3KZp13JUglHHzBJltFvn42J5BCBwpCYxNkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 7 Jun
 2023 10:48:44 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:48:44 +0000
Message-ID: <bd1d357f-9414-73eb-f5f4-65c461219f7d@intel.com>
Date: Wed, 7 Jun 2023 16:18:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
 <20230607101103.2127088-2-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230607101103.2127088-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 21646e18-8b5b-4398-ced8-08db6744c3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdr2+er931K1EDZOBInXXasaxG+JNaQgO0Ap9inhWh47AtDGA8HBsbc0b76fMt/c+s/Vw04VmE3jN1QbSu1flOlPb6DvQnGuNYnmCy5Bfj3ig1Zly4rtRcuwkuC1R8vrFCoj2YsRv5S/OPzxnXhmpXy15pRDCKF5uGYNB70TdKLg7oFhjkf+sSJqFpjgbub5MHAOwJSdqZD0Brf+56/cpwmu+yAtri7b/rZ226yq5iYiSFaxIOjPy4Pmc+D8py1INgEWlA1W/ZpCaNOiYfQJ8xwltn96EpX8cnY5L3vU5LRaobln7SU9PFZuE4TH6j9QaIGa+K95TqPC5QmVLODCqK9IzMwitN0PMVpSZK5SJdFtCUoPP4N+5qc9hKFeNOHQdk6SAHQobEk5UWa4SwWlXGtlC1dAZREeizbCD077pMdcgVe0GXg59m8eWm/CMUSCyTXhQnhnqkDrYmJR5m296K+8094kp85GimEYA2qgL8myqNhxZfxRLZEB5zjILQP9LPdIT30I3kGCc7o6EypMXHNqmsFffEKFSBY0weQstQ4aynqqdhVGYMDyzpUk/IsRl3R0jzNUpc3ZorzchgnfmxYuoaefW6x79uNsGa0fWhw1ukWOO5CGaZsJqkFAbCeyTKUeZShKnlEYZX7aF+yJpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(5660300002)(6506007)(2616005)(6512007)(31686004)(186003)(2906002)(53546011)(478600001)(66899021)(26005)(83380400001)(66556008)(6486002)(31696002)(8676002)(41300700001)(38100700002)(82960400001)(8936002)(36756003)(86362001)(66946007)(6666004)(316002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRYaS9ucTRhTUVadXNZTXhuVzdiSzZIdzZlekRsRnFIMTkrYmJvaEl2VkpN?=
 =?utf-8?B?N1FiT3IrbHhrN2RXdDV4RmJiZDNGSDBiUVdoaVpXMzhXUG1DMTh5eTZleDZs?=
 =?utf-8?B?bGxBVnY1TEJ0S3NqUHhsUlpoUnZhWUlwMTJHL3hwNmNPZTZ5MitUUFJFS2sr?=
 =?utf-8?B?S0psbis3dm5VVmtnSitiejUrR09zRk53eUpkMWhhQjFoVFNLOEgyRkZkTmx1?=
 =?utf-8?B?ZkoxdlFBaEhGOWRwWnZwdDdDWWNHTkZ3SXRkWjBDdUhYak9rZ2p6U3ZTR1JG?=
 =?utf-8?B?enNPOUQydjdnT1hOcXVwNnZ3SFgvbVlpMEJlT0lYV2djV0hxbGQ0czNaQzRs?=
 =?utf-8?B?R2xkbHRDa2FEdTBmSnJLZ242VkErSVQwK1BVdjRETFNVZ01MRkNOdnRRZTlQ?=
 =?utf-8?B?NEFaRWtaNjh4bmVKNUpIM0J5bUdpN09ZOVllb3JlUXFPa2Q1eFFXSGV1bUdJ?=
 =?utf-8?B?WktUNFJGY3FkaW5VWE0wMm4ycmh5ekt1L1Z5UDFiVXhDOU9IcFRiWThDUEgz?=
 =?utf-8?B?NE9ESWhURzE4SVdUVnFvQnBYdEZVWnAxSGFJWndjTVcxSmtleXV0TGdQRm1G?=
 =?utf-8?B?KzdmMHlheUlHRGIrNUg0cEJkVVFrbGJzWlVReS90eEtmcm02ZmhPdloxNGtu?=
 =?utf-8?B?cE8rQW4yRTFPdG9yc0Y5cGpuaWVzZWZ3YlNlL1dOUHJwaVJsem0xWjBjbklL?=
 =?utf-8?B?bVBxZFZJL2U2T3VSaVUxWVdNOFhZUWM3VHFFcEhtMTFubXpZQ1UvZVNySXo1?=
 =?utf-8?B?STZwa2FCNkhsdHdVUmRYZ2NiN0pIZkZmV3FBUGx3aU5ZSVlBZ0dwd0JKQWkw?=
 =?utf-8?B?b1NUS0VDVEpuUjhTWW1nTTFKL3BIQTMrTEdNNTJvRkxGQ1Fac0pZcHNYMGdP?=
 =?utf-8?B?cTNLYU1QTXhjMGt1RE5zNE9ucXhEamg2Qk9FdDVSdzVaR3I0Z0tzbXZiNjZV?=
 =?utf-8?B?SUVNV3BqR1BJU3R1cVZ4WWFHN3FsSkVNQkYwUWZ2TXI5UDlJZHJTZ1VqcnZr?=
 =?utf-8?B?Y2d2czRlQ010RnhMNFViZmI0K1hYNmxpM2FTRFVxNm42bXk1TEZyT3VGZytQ?=
 =?utf-8?B?akVuL1hybVNRNDZrS3FOWElIaG5IZ1ZaTUVRdmxhaVNlc0VGSkZZc2JLOUpQ?=
 =?utf-8?B?cFBBQ3ltTlhsM2FpL2xSNnI5R2QyK1M4bElQMVU4K0ppQk4weUVOcmdWc1F2?=
 =?utf-8?B?cW9LeUh3N0dLMDc3QXJiUDA2MVhvUG42OHRzTERMTEFHTmVFM1h3RTRVNUNm?=
 =?utf-8?B?UkI3ejJVNXE0VURYVHBJc2xyMUNGYWtxMmcralhrUDdZYWkveEUvb2MxbG9u?=
 =?utf-8?B?czU1MWNkUXFoTU00Ylp0L05lN0RydXNqTGozMjcwSi9PM0JnL3N0K080ZU8y?=
 =?utf-8?B?ZlUyUHRTRytybGJUQXVycDZ5MGpLOUNZcW1TbzJYWTVSWjZ3TXN0aGZ4MTN6?=
 =?utf-8?B?YkZJNGIzVWdQSjc4T3p4OSt3M0IwQktmVHA5YnJnMUlFQXl6SEk0TGl4MTk1?=
 =?utf-8?B?MGdrNnB4SXRTV0NRMkdjL2toNWhBZk9qQjBUSmdFek4rWWhiaTRDV3g3MFE0?=
 =?utf-8?B?b2xOWnVpc2JjVWdLRmR1cUtwUy81QXM2aEkvWGFaNmtLTDhCWXlxRFdtL2sx?=
 =?utf-8?B?alp0WWU5MDN3MU96eFBoY0FCeTR2a05xRTlQbXQ4cmpnajJIZHJMeTgyOHcw?=
 =?utf-8?B?YUxCdFdadm1VN29ZSlNsbitlNXpYdlVqVElvNmN4VkNnWEpaK2xLZFlZRjN0?=
 =?utf-8?B?UjhsT2dVbFVacmdWQkVEdmkyamtCS3JuKzhWTEVTcXV0RzlySkJ6dE1BaURT?=
 =?utf-8?B?WUJDSm9wZXBzMUthSEljUFAxUHM1cys1RXd2NmM4dkZKRDByS3JSK05qam1i?=
 =?utf-8?B?R1FacHFtSnNsRTZsTituZnJxN3gwaVlOem5scTEvODNrZGlNcUUrblJlRVhH?=
 =?utf-8?B?RE9MaXNrUHQ2cGZCSVF0MjRNOGwzTU9KR3RxSmplWlFrZklrMFZHcEJHK2lI?=
 =?utf-8?B?dUtlMzBxK1FOeGQwaXlTMXNZeTJiVFREZXpqcEgvOEdwYUtaOElGWXNPQSs1?=
 =?utf-8?B?M2dkZVF2WnNWc1ZYSkhmM2hOK2JOOG1rR1JqTVlJV0RzL1oyTU01T29teTgw?=
 =?utf-8?B?YlIrTnN0STJpaTB3M211WDVid2EwQlB1elY4cGlWRXp0d3UvK08yTGUwcVN3?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21646e18-8b5b-4398-ced8-08db6744c3bf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:48:44.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Sbord/NUPkqceYB1QOXwypghbX3ZhojfF8yvcvNx0NxwbPtI/udaFX9xBUNfpefMmabefg6HBjaWELzfgbwvz/j9SYuEV3iYACj/g4pVis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 1/3] drm/xe: Add sysfs entry for tile
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



On 07-06-2023 15:41, Tejas Upadhyay wrote:
> We have recently introduced tile for each gpu,
> so lets add sysfs entry per tile for userspace
> to provide required information specific to tile.
> 
> V2:
>   - Add logs in failure path
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_tile.c             |  3 ++
>  drivers/gpu/drm/xe/xe_tile.h             |  2 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 65 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 +++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++++
>  7 files changed, 120 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..41a6c0d0dee7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> +	xe_tile_sysfs.o \
>  	xe_trace.o \
>  	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 17b6b1cc5adb..db61da4d6212 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -150,6 +150,9 @@ struct xe_tile {
>  
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 6414aa810355..ac70486d09c3 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -10,6 +10,7 @@
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  
>  /**
> @@ -142,6 +143,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		err = PTR_ERR(tile->mem.kernel_bb_pool);
>  
> +	xe_tile_sysfs_init(tile);
> +
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 33bf41292195..782c47f8bd45 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_TILE_H_
>  #define _XE_TILE_H_
>  
> +#include "xe_device_types.h"
> +
>  struct xe_tile;
>  
>  int xe_tile_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> new file mode 100644
> index 000000000000..09a4a8342aec
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -0,0 +1,65 @@
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
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = xe->drm.dev;
> +	struct kobj_tile *kg;
> +	int err;
> +
> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> +	if (!kg) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return -ENOMEM;
> +	}
> +
> +	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
> +	kg->tile = tile;
> +
> +	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
> +	if (err) {
> +		kobject_put(&kg->base);
> +		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
> +		return err;
> +	}
> +
> +	tile->sysfs = &kg->base;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		return err;
> +	}
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
if we have kobject as part of struct xe_tile itself can't we retrieve
the tile reference using that kobject, do we really need to have
something like this ?

Thanks,
Aravind.
> +struct kobj_tile {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @tile: A pointer to the tile itself */
> +	struct xe_tile *tile;
> +};
> +
> +#endif	/* _XE_TILE_SYSFS_TYPES_H_ */
