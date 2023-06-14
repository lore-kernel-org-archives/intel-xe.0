Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9FBEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 10:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096210E24E;
	Wed, 14 Jun 2023 10:46:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABB610E24E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686739604; x=1718275604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0SWFveTEVaY99Q9ZnRTvBvYZpnQgtS8iyJj8Rucq72k=;
 b=b2fKIZei7WYM5FCE4vATYin9Y0HgX40jbnsTPAZ4EQTA1L5vmtT9YyJQ
 Bz2nPz3tfocCM+YU53zz5qoefwmbzhQTQEVdINJQBKEMPQKdEtZHW85Q+
 S+Cee9sfMJ0WEXzu1ce2WhvHZpr01ejr3JSWPxLVWIVsMPIZUgBidXL9o
 4q3p/sJzyO5r+kP1R4fx68KkbDL8UmMJzMCgHiEvp71+FuzIa5diE1dPw
 CDFPZdgisXaN9UsV+iBxGxF1J+4gpgyen1xcrGYdn94/lQCo173X00pXM
 lhW6AM3c43QOXnm6Phol6iClOMdYG97ZupnOYyQWg5HWeUb6JiBf6LhVD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357459921"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="357459921"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 03:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="662356460"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="662356460"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 14 Jun 2023 03:46:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 03:46:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 03:46:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 03:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiPy3Z6WQ3x5K6WgRCQYbblKYNAGdTIxAonHJdLhfVBf4Xba3va5SZVrEKjerHxciB5ogFspFxpaNEN0r+0pRDdV/Nnu9+esPaQCVM0EEr5YXh1kvGUZiLSg5cm97aqTnKhX/cZ0XNcTjYAaiDruXz9WTKVloP9rkSA7bpHy8JuvgZ6hvV1ilEvDeJr4vHfA66ke0K26R/uajjVYzmaYpoeTT76ptHriGx26MBFMbUJ8v/ChYEFghWVHaJwEFur2md52CgpCC55/WqucOFQq565dJgviT7yRB0l550RNtt5IT6BgyZeIqTagQSuvkh+Zk+3hdo2iY0LPk+6y5Qk9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVwUYFStrE6Gzs5jg9IJCQbUA5+n5L1p7VyeL/grl0Q=;
 b=MvAsG85Aw62MAT9ws085XYMln6bdClCh7m3RAjWLLyWnovuBPsrdbjadeqqQCrvFTmZPka4IfCXMHN1lqJ1AIVVzkK7h/8Bfe6TvZ0SWuCiYhkQkLCuID4wxWdoB5h8Cb/YqjajLAUic2TlXsNDe6YAKNamxRuEHaVs4DCFTNFL/nh6eos6mF/sKvLpKYscFnDvxWoNoe2xTOjDiy6IGxErZByJV7T6KsUhJimHlv9ftlkJAi/eihxhtGcZSVEng4uzGn5ggX9u7E3S63zJ878sRysjUiONxs9nC6swio7VZUYxvyXnpT4N0V9xkYqgus9co9QT++c3dmeKqsvM3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Wed, 14 Jun
 2023 10:46:39 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 10:46:38 +0000
Message-ID: <97abdb50-d564-b01f-6e6b-f3a32f58118d@intel.com>
Date: Wed, 14 Jun 2023 16:16:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 5905e825-2cc3-47d8-7f3f-08db6cc4a198
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZxYDsTzmNZ5Z+I2sd+/v9o03kiQQHWuPbtl7lTMs7albSSZV5XnKy1IN5lZkTs6IYGAfxJ7TpIXTh32NXrin8Wb65ai0jjD4XUwk6k5thri0HVXrxKk1aHigJYpooyPAzvZwBwdFBN2sz1sAiFlzFmZ5ILTHWAY+1xSpalBKK0bZzED5owcyNqyECUBjyJ3gt9tICNWPq4G9REZn2NEs2GT2p1j2j3/3Cdxl45Qhs8eUcdvGoqQ00TmY2zM715nyrCytVyItBZ2yraHqq7merH86agj5rM4PiQU6U/uVzkzuC/k/khWsBNgW0EYZhYGvK/XcCezeLHmSEVAW9pQRFSZ787bi3PfI2Z5Wb6QaAgJf+JLkkPyL1I/E0u/EC5MEqahSWGKsr/0mouPEPfVFcEiBeFCaro9uQ/6LgJce9MMpB9vQisvRF1tvpnF3I8kopm79K3+L2B1nRPckPaLu+KAlg30XJuDejPYkw9qY0dp0Rbge0tEkyRPcrkH4TESWNK4w2zdgQ40SiILpSVktSbWYpWhBaI4MBXkX1RKKapr/pv3cHVkVPXlGy6wt2g364GA9xtIGlY88RJt4fsUL9YOkfJkBKuxNGOhwRamToMVVAKpQmcGyoKBq8dY8e8oi+FTBKu4AAGs6wZ/Sj7Nqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(66946007)(8676002)(31686004)(8936002)(36756003)(5660300002)(66476007)(66556008)(4326008)(6666004)(478600001)(6486002)(316002)(41300700001)(38100700002)(82960400001)(53546011)(83380400001)(107886003)(6512007)(186003)(6506007)(31696002)(26005)(86362001)(44832011)(2616005)(30864003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlCdXNnS2RSWGZySGhuN09aM2tGb3NyQ2hQMytRVVZlTHJqQ2cwR2UrRENz?=
 =?utf-8?B?WE1xNzlQSTQwWjNpUysremo5Mk9valN4RlRXTm9jaSt0N1dmcXlsaXdkTFRa?=
 =?utf-8?B?MFhuMnpoeVZNaE90aWJnSmxjdmZMQldyam9HSlpwUjc5MlhRN1pkVVRCMVJC?=
 =?utf-8?B?Y2FMQ04zT2NuSVlETGpsUDdiKzgrWjc2RGJBbGh5ekE5QjBqZVZxaUk5bjRz?=
 =?utf-8?B?cE13MlFoQ0hJYnlGOW5XSlVLblFxMGFtV1ZjYmtqdjhRclE4MmVXdkJlcE16?=
 =?utf-8?B?TCtkMnpkVURBYWdBb1RBYlE5dzgrSHdYSHRoRnlnZVF0VEFpYXJKY2tuMGg2?=
 =?utf-8?B?Y0Z2T3BIYWpXMVJLaUxOTm9IZExYMkcwa2kwRnFNdnp2R291d2xabVovamdW?=
 =?utf-8?B?UGFLbDBpaXo4cUhjU2xsWjFIWFhZSUJZUTlRZTlkeExaL0gxUHkxNTFOVlJh?=
 =?utf-8?B?REoxUXVha0tWZSsyV1JyRVRUMzd0UHVVZFl5dTF1UzNsVmkyMUU4VG1Zc29i?=
 =?utf-8?B?TEE2RldlVTFvN1JyYXNFSUVZcXpzSVZlUGlXT3dXN0NyR2hpaDlnMVg2aWhv?=
 =?utf-8?B?SGc4NENlUGpYZU45aCtua1hJYUVNa0FGc2FZWnBXaWxGQ0tiNTFJWjljb0dP?=
 =?utf-8?B?MkpieFZGYXN2Sm5pTW00L2R4NEJKWDVzUDNpQjRzdzBRTHpzM0Y1bzJlZTd4?=
 =?utf-8?B?bnBzWFhKSW1tOStNNHlLZFVVZjg0NXFkUC84bzg2OVloU0o0RHRqSGxwRUIx?=
 =?utf-8?B?WUl0VFhQRjlVZ0ZxRTJrS1Z1M3hRMmpadjU0VTlscCtTK3FuWWpDdDZvRVlS?=
 =?utf-8?B?dzFUSHF6R0J4YnpNVnJ2UFJmQVg2cWJuY1NoM3diNHZCaERQd2RndVNKblM1?=
 =?utf-8?B?RzRVVXZYcDlzcTVQVjVtbnRrRlkySldHUFlRQndoNG1nVER1Zm5ueXJOcTZr?=
 =?utf-8?B?YU9uZWtrT0JMU2ExcmRrTWo2d2ZnUitHR1dZaUtVcllsQkVMUmJuaDdTK2k1?=
 =?utf-8?B?UVlWc3p3bExiT1dhL3NKZUJrU1FYMGloTS95YnQ1UGc2S0tJY2hpOTV6WU5z?=
 =?utf-8?B?bThmVzF3aUlzV1o2NVo3ZUdFM2JmZEhPS3lIWnppTmJ6UW5rMmViVG93ajI2?=
 =?utf-8?B?UFRWV2pXekJyOEtjSlpnZzZoaVZ5T1VKeFl3cmdqZG9kS3pSTkw4a3phZmRa?=
 =?utf-8?B?QitXV1JvNjlHY09hU05QREtLZ3NJNUdKYmlqOElBNFhuQnJjTlY2SXpvRmF4?=
 =?utf-8?B?NEt3Nm9hWGl1YllBd0drRFJLM3NILzJ4RjBhV2w5MjdVRXZ4dE5vaS93ci8z?=
 =?utf-8?B?clJmV05TV3pXandNb2wyRGJ0VUJ2R2NzQ0tINWNOMGZOdG9jK1Q0d2pUV1FF?=
 =?utf-8?B?ODFicTBzRDdhRElYRERuYng5a3FuZkFNcWh0L2RaWVJWWWxpdVNZUytvdHdH?=
 =?utf-8?B?Vm9zZmUzSlV1SWZaUVc1bFpSYUhxZzhua2NnUExjWVc4REZkTG1xbUpKOVpl?=
 =?utf-8?B?dkJBZnpJZGU2V253dTNEdjRYZEF4bW1XeVhFYWh4WHJGWFdVZU9oMTNGWG9t?=
 =?utf-8?B?SlpsY2hBRUcvN2ZyMXlOWkRJUW1YaGhTOFZ5blhZbmVlVkdKaXZ1Z2JJNFpn?=
 =?utf-8?B?TmF3aU0yQUViTWVQczRYZWhEdDF2bmZJMFJCV2ZKcGhyaUFmQ2sxVVJKdVBk?=
 =?utf-8?B?dE5oSzF0TEVRRjVLMW9SK093ZC9DaXhZTHRyV1pKNndHKy9MQkM0aEFDUXNH?=
 =?utf-8?B?RnRBK3pEdEYwY1FJbzJQSmJnTEVDOUYxRUd6K0RTUEhlTk9KUnlaQlZFSytV?=
 =?utf-8?B?ZldKYmNCeUpxZFFDeVEwampETUtuY0pOWFpTaVRTWVZiNDhLaUxSNzZCWVRq?=
 =?utf-8?B?L002YUtpWE4vMGU4TjIxb0VNd1V3dDNheTJwY1VUVjl5eStDaXFxcVRGUkFr?=
 =?utf-8?B?MGRYS2o3bWZVOVVCalNDa01oM1FkRWNJRXlmK0ZtUmZETjFuZ2hWaTJoUENU?=
 =?utf-8?B?Ykt6TjRjeHdWSCs5eVkzZDgzZ2ZJak9lMEJtYVY3cm45RWdHUzZBRm5RV2JQ?=
 =?utf-8?B?cXNxTDhiRzRiWG84ZllvMHQwSTBvVTRESUdUNDlhN0pIa0tHdWRDcHVSUk92?=
 =?utf-8?Q?+8Qyt+WuZjiOeQWHwI73jRhbI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5905e825-2cc3-47d8-7f3f-08db6cc4a198
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 10:46:38.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX7fenfhb6OLprPVaJPTR31N1lqlDpYE4M/LRmD6iPPY9fc3PSGq1z7tidsakwkuEkWzN5XxYh6rvgaY1bCkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 5/6] drm/xe/hwmon: Expose hwmon energy
 attribute
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> Expose hwmon energy attribute to show device level and gt
> level energy usage
Below entries have the name xe_tile. All gt names have to be replaced 
with tile
> 
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  12 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 206 +++++++++++++++++-
>   4 files changed, 222 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index aa064e0c5751..64c09aa0689d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -52,3 +52,15 @@ Description:	RO. Current Voltage in millivolt.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Energy input of device or gt in microjoules.
> +
> +		For xe device level hwmon devices (name "xe") this
> +		reflects energy input for the entire device. For gt level
> +		hwmon devices (name "xe_gtN") this reflects energy input
> +		for the gt.
Same here
> +
> +		Only supported for particular Intel xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index fe00c42ff29d..a80f6fecb4c9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -385,8 +385,10 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>   #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 4ad473e69e27..093be7401a95 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -25,6 +25,9 @@
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>   #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
>   #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
> +#define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
> +
> +#define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a86d2d8218d5..63721a27081c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -27,6 +27,8 @@ enum hwm_reg_name {
>   	pkg_power_sku,
>   	pkg_power_sku_unit,
>   	gt_perf_status,
> +	energy_status_all,
> +	energy_status_tile >   };
>   
>   enum hwm_reg_operation {
> @@ -40,10 +42,17 @@ enum hwm_reg_operation {
>    * - power  - microwatts
>    * - curr   - milliamperes
>    * - voltage  - millivolts
> + * - energy - microjoules
>    */
>   #define SF_POWER	1000000
>   #define SF_CURR		1000
>   #define SF_VOLTAGE	1000
> +#define SF_ENERGY	1000000
> +
> +struct hwm_energy_info {
> +	u32 reg_val_prev;
> +	long accum_energy;		/* Accumulated energy for energy1_input */
> +};
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
> @@ -52,12 +61,16 @@ struct hwm_drvdata {
>   	char name[12];
>   	bool reset_in_progress;
>   	wait_queue_head_t waitq;
> +	struct hwm_energy_info ei;	/*  Energy info for energy1_input */
> +	int gt_n;
tile ?
>   };
>   
>   struct xe_hwmon {
>   	struct hwm_drvdata ddat;
> +	struct hwm_drvdata ddat_tile[XE_MAX_TILES_PER_DEVICE];
>   	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
>   	int scl_shift_power;
> +	int scl_shift_energy;
>   };
>   
>   struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
> @@ -92,6 +105,18 @@ struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
>   			return GT_PERF_STATUS;
>   		else
>   			return XE_REG(0);
> +	case energy_status_all:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_ENERGY_STATUS;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		else
> +			return XE_REG(0);
> +	case energy_status_tile:
> +		if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_ENERGY_STATUS;
> +		else
> +			return XE_REG(0);
>   	default:
>   		break;
>   	}
> @@ -259,10 +284,69 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
>   	return 0;
>   }
>   
> +/*
> + * hwm_energy - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static void
> +hwm_energy(struct hwm_drvdata *ddat, long *energy)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_energy_info *ei = &ddat->ei;
> +	u32 reg_val;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	if (ddat->gt_n >= 0)
> +		process_hwmon_reg(ddat, energy_status_tile, reg_read,
> +				  &reg_val, 0, 0);
> +	else
> +		process_hwmon_reg(ddat, energy_status_all, reg_read,
> +				  &reg_val, 0, 0);
> +
> +	if (reg_val >= ei->reg_val_prev)
> +		ei->accum_energy += reg_val - ei->reg_val_prev;
> +	else
> +		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
> +
> +	ei->reg_val_prev = reg_val;
> +
> +	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
> +				  hwmon->scl_shift_energy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_channel_info *hwm_gt_info[] = {
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	NULL
>   };
>   
> @@ -487,6 +571,36 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	return ret;
>   }
>   
> +static umode_t
> +hwm_energy_is_visible(struct hwm_drvdata *ddat, u32 attr)
> +{
> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		if (ddat->gt_n >= 0)
> +			return process_hwmon_reg(ddat, energy_status_tile, reg_read,
> +						 &reg_val, 0, 0) ? 0 : 0444;
> +		else
> +			return process_hwmon_reg(ddat, energy_status_all, reg_read,
> +						 &reg_val, 0, 0) ? 0 : 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		hwm_energy(ddat, val);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -502,6 +616,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_curr_is_visible(ddat, attr);
>   	case hwmon_in:
>   		return hwm_in_is_visible(ddat, attr);
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
>   	default:
>   		ret = 0;
>   	}
> @@ -522,6 +638,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_curr_read(ddat, attr, val);
>   	case hwmon_in:
>   		return hwm_in_read(ddat, attr, val);
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -554,11 +672,53 @@ static const struct hwmon_chip_info hwm_chip_info = {
>   	.info = hwm_info,
>   };
>   
> +static umode_t
> +hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
hwm_tile_is_visible
> +		  u32 attr, int channel)
> +{
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +
> +	switch (type) {
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	    int channel, long *val)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_gt_ops = {
> +	.is_visible = hwm_gt_is_visible,
> +	.read = hwm_gt_read,
> +} > +
> +static const struct hwmon_chip_info hwm_gt_chip_info = {
> +	.ops = &hwm_gt_ops,
> +	.info = hwm_gt_info,
> +};
> +
>   static void
>   hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>   {
>   	struct xe_hwmon *hwmon = ddat->hwmon;
> +	struct xe_device *xe = gt_to_xe(ddat->gt);
> +	struct xe_gt *gt;
> +	long energy;
>   	u32 val_sku_unit = 0;
> +	u8 id;
>   	int ret;
>   
>   	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
> @@ -566,8 +726,22 @@ hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>   	 * The contents of register pkg_power_sku_unit do not change,
>   	 * so read it once and store the shift values.
>   	 */
> -	if (!ret)
> +	if (!ret) {
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	}
> +
> +	/*
> +	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> +	 * first value of the energy register read
> +	 */
> +	if (hwm_is_visible(ddat, hwmon_energy, hwmon_energy_input, 0))
> +		hwm_energy(ddat, &energy);
> +
> +	for_each_gt(gt, xe, id)
> +		if (hwm_gt_is_visible(&hwmon->ddat_tile[id], hwmon_energy,
> +				      hwmon_energy_input, 0))
> +			hwm_energy(&hwmon->ddat_tile[id], &energy);
>   }
>   
>   void xe_hwmon_register(struct xe_device *xe)
> @@ -576,6 +750,9 @@ void xe_hwmon_register(struct xe_device *xe)
>   	struct xe_hwmon *hwmon;
>   	struct device *hwmon_dev;
>   	struct hwm_drvdata *ddat;
> +	struct hwm_drvdata *ddat_tile;
> +	struct xe_gt *gt;
> +	u8 id;
>   
>   	/* hwmon is available only for dGfx */
>   	if (!IS_DGFX(xe))
> @@ -591,12 +768,22 @@ void xe_hwmon_register(struct xe_device *xe)
>   
>   	/* primary GT to access device level properties */
>   	ddat->gt = xe->tiles[0].primary_gt;
> +//	ddat->gt = &xe->gt[0];
Remove comment
> +	ddat->gt_n = -1;
>   
>   	ddat->hwmon = hwmon;
>   	snprintf(ddat->name, sizeof(ddat->name), "xe");
>   
>   	init_waitqueue_head(&ddat->waitq);
>   
> +	for_each_gt(gt, xe, id) {
should be replaced by for_each_tile
> +		ddat_tile = hwmon->ddat_tile + id;
> +		ddat_tile->hwmon = hwmon;
> +		ddat_tile->gt = gt;
> +		snprintf(ddat_tile->name, sizeof(ddat_tile->name), "xe_tile%u", id);
> +		ddat_tile->gt_n = id;
> +	}
> +
>   	hwm_get_preregistration_info(ddat);
>   
>   	drm_dbg(&xe->drm, "Register HWMON interface\n");
> @@ -613,6 +800,23 @@ void xe_hwmon_register(struct xe_device *xe)
>   	}
>   
>   	ddat->hwmon_dev = hwmon_dev;
> +
> +	for_each_gt(gt, xe, id) {
Thanks
Riana
> +		ddat_tile = hwmon->ddat_tile + id;
> +		/*
> +		 * Create per-gt directories only if a per-gt attribute is
> +		 * visible. Currently this is only energy
> +		 */
> +		if (!hwm_gt_is_visible(ddat_tile, hwmon_energy, hwmon_energy_input, 0))
> +			continue;
> +
> +		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_tile->name,
> +								 ddat_tile,
> +								 &hwm_gt_chip_info,
> +								 NULL);
> +		if (!IS_ERR(hwmon_dev))
> +			ddat_tile->hwmon_dev = hwmon_dev;
> +	}
>   }
>   
>   void xe_hwmon_unregister(struct xe_device *xe)
