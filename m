Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9FEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 05:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491910E078;
	Tue,  4 Jul 2023 05:16:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B207910E078
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 05:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688447794; x=1719983794;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GIxcNV0C32WnDIjpLmf4xuMsCZCoBtpzSc5HMQu8lA8=;
 b=SJ3S8NUARxL3ly7IsDIjFoZ/Uo+2k9DADlgzsUJCtgamo/B//dRSertD
 /5fyc1FB0L/0ofV+S9pgy7oeIJH0tefV+PgRwrjAqKohrtYLTehR+59Hj
 UeaIwUrDnfMlwsuDnn2sEijz/qMYfB2np3iam0x1yHCLuzO5LnQ+Btf7b
 OnMzspf0RVNTDdhxmx3rnI67K7DkNG0wiwTXn6NTAUveaDZmBE1eGClr/
 KymAai7EM/UCpKQn/G6767/oVU0h0CTwplhKD43a75/vGcrFCiH4GAisK
 eNuPYJMKbCTf6kgrf7Rys5zkvYidDcFI67NOs21R2iIK1KAEi3FAmjhjG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429073493"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="429073493"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 22:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863281562"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="863281562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 22:16:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 22:16:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 22:16:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 22:16:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 22:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlZLrA9s1cfUVqcle/QNx9f0YYaeR2B62Km4ACHbWG9n7yx8AmS+Pgdw3QHUsK/OJqzYAa3/3tTWnJ0aWV4Zoj+F4nc1RvLnsQ2qzvBSBMN4hxQU6ifgydUzm8j+1DVdynK5UCvHFkeH0qTtyxaoOzM9QSffm2wp/cip3CPScHWeBfFQ8WIFv+oZMuzrx6x6k42jB20C9YR50ZjXo2pq/TQXQVGM1Mrvnvj8UEU45mepGIY55lKFJ3bwPapDnSrM07Gv4uBk9hBnN6rMg/vkf2wCFjQK59cLSQxZ2DCoOscD93T3JVFJFRH4uLelYqXUmKXVR7Zf76UoR56CIGUh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfytTbTSLWy8VQ5gzCdzmlK3s5h0ZO2iilU8N1bgAUc=;
 b=b1uYh3wD85PW+oSLMoFZrZ9c8Ywv16gD0vXInDY5Tw/8C624HmU9GtqbLIyrltP0U5Rshi8wthu3XLolPXwF1jAC7DDpAeU38RblFbB5Z/emJNGJDdZMxKuT+5fLsqrzFRrU0dU2WFaDvzwAfsrvkBnIhGAxSjoF5sEmDGtivbAPbznY5jMGHqlLyHsltoWc/eB+n8KlTnSATOvH0EUyneTS5bmevRn14hFYDBqI99g9TnmYDs/HG2dw6qnnfRoTRN+AhPmH004L7txn5Mlf6OOgOQlriWjUn/GdwxO+TyRVxia5BAF1e4SV9nai0HlkUrPP8a/H9CHiT2HYSczwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 05:16:30 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 05:16:29 +0000
Message-ID: <cecec48b-9f8d-15b8-1bf5-09ecba414ba9@intel.com>
Date: Tue, 4 Jul 2023 10:46:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
 <20230627115642.2087251-4-anshuman.gupta@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230627115642.2087251-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b16787-eaea-49bf-0402-08db7c4dd2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIc/gh5TGx6K6u+dOXVjatGnLOqKpjEYb1aELGWVlGTHyDlxCMC9hCjNeeu5L6WBzchmj7KgLtcpV85CkfcvaJ+sf9OKEkHQGy/RbZz8ccPEeB8WbjySmzu2n6g6/y190mWnNAQzfcT5u30mFxMIVDnrKWmNzqlfXJrkh85gtD5L5xULoHK167vjZb2AyszvzSEyTBBsEE7tjiDhZZmH8clwpaE+xRLWmQ5MZ0PIjJqS9CTY7o/qYnrCH886dw+zva3uWno3b9U7DsDLDJUmkpj8QxqXiVwCy6OAXt2adUeJY8itd2aB0dFKVIK5chyudh7jYZuMeTHFRLVRPEbTI4FsSjqEfUxtSiWlhJpOAtpQZ11actKJWgkmTXVYPwzngpNe7Ald/IhQ/Vqq6pbR/sVvD6SMNYSgCXRHQOG+6R/t6Q44IrlrNuwxEDWSeYpCgSfSwJKjyTP/yr1m7Gn/y5+FCXUCx+WvG73LI7xeSPqJPs+yADBY8jmbcaEy1aN0L+PyYJ/aQi1f5XBHNpj4d0Y8F7BAiImFs5oTkWOHy7nW9aYLnxzs6a72Dz4jjwpZC4bP+s/1BBBBmODAg+edm6HhHfxnw5Xp5GeXPGZBIG6KSayhYVLaqGyGaqnghASzY0/EW78u5FMbJup1SDDYEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(31686004)(6486002)(86362001)(83380400001)(2906002)(6506007)(53546011)(186003)(26005)(6666004)(478600001)(6512007)(38100700002)(31696002)(107886003)(66476007)(66946007)(36756003)(41300700001)(8676002)(66556008)(8936002)(316002)(4326008)(5660300002)(82960400001)(2616005)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxiSlh2WkppTUdsS1BIcjRtL0xFMUVBSjlpWUdkTGxMRDh4MWgzK3lKbEpF?=
 =?utf-8?B?SnFDOFNLcWZiTUN1TWNZNFNMR3o2MzNhZldmQXl4RTFMSDQwS0dRZlUvSHJ5?=
 =?utf-8?B?SnVHSENTODNPWXphS0RnU1NPYUtJVHBxQjNJaXRObDk2ZzhjZFM3M3Ara1Ex?=
 =?utf-8?B?MDdLYm9uWEsyQVc2d3M0K2o3ZzhnajIvTERKK1V6Zm9rK2JtM0hqL3cvUFla?=
 =?utf-8?B?OXdqOGF0VjZHZWh5MWM2RmlISU05VmlKNWlRbzRGWTV0d2h5K1cxa1BFV042?=
 =?utf-8?B?ZEtTT295L21uN01GK3MrRU5DZ29yNEI4bGJLZDVFb0ZaNmZ5Qms4dG53WmJY?=
 =?utf-8?B?R1Q5QzZoSytaaGhtRUl4ZFZ1YXk4MnliaDN1M3lJNk1YNEVyQjRIemZPUXZk?=
 =?utf-8?B?VzQzOUxncHN5azVGZC9Kdjl0cjBrc0dmb2dMYVU0NnNpL05tbGYzeVVPalBk?=
 =?utf-8?B?VDRuN1YxZzZ0cU1zdy8rakxib0ZqNTN5RmVxMWVTdUpvWnhXWDJqUndFRTBQ?=
 =?utf-8?B?dUg4emZZSXFaYjQ4WHdBa3AzSFllY01Sc2JIdkY2ZTNEVDFUUEVnVGY1d1NY?=
 =?utf-8?B?UnFoYUt3Rnlxd0tNcmV4RUNwekZyNXZrQ2RpY3lIRldjMWdBUU94ZHI4cktQ?=
 =?utf-8?B?ZzZrTjFuaFQxV09Ibi8zMlNWTC9JVWZrakZjYlVrMjRLSzU4K1NjekpMK2NY?=
 =?utf-8?B?VVdWcGpVOFhkUDRoM0RxVUVnaVdPbldkWk83bys3ZmMzeGFtOWEyNDJ3bDBu?=
 =?utf-8?B?bVJFWkxsT3ZKYWkweFF0WnR1cFdjN0ovbTB2a0tyYzR5dU93SGNtZlZ5amZl?=
 =?utf-8?B?dHJhWUl1T1ZxY1lCWXFodVBjVHdmWnJNTVNjTDUyaitTMC9yWThlc0hOYkRN?=
 =?utf-8?B?U1k5R2ZBRVBoSVpiRXdqaW9hSG1JM21zT05FRURmbEJ0dVdlNGVTdUt0bjcz?=
 =?utf-8?B?WEQ1Lzg4V2VkZjhnUy9QWjZCWi9JQmpURUVxUXV4MFBMM2lJTXc1Vmc5SHIy?=
 =?utf-8?B?eTdhNS9hV0plUS9RT1BwQzJlWVhYcjlJT01ZZEx1UTJlWSthTWJMRXQ4Y1RR?=
 =?utf-8?B?MHd3RzU0U1VlUGhEU2NHbFFmVVJsV0pTMUtVVU1GOFB0MkZoR2xiRUh6ek1q?=
 =?utf-8?B?OWd4c01vTlk1Wkl5ek9kejdrVEtwUWRvNTFYOEhCd2VQc21xcHFibHlQbXZn?=
 =?utf-8?B?dC9rWGpZb08xcVg4aFlJeWRnUzZyWXFWMkppVjdaMlh1VWpYeGdIN2NLcWdR?=
 =?utf-8?B?VlVpNXFEQVVha003VGxWYnJFNjI1M0hpWU02VWFLNStJaFlVTnVKY3pTMlpS?=
 =?utf-8?B?RWcyRWRJM2FMWlByQ3o2cUpXQXlvb1VaRDlwYk12cW4rUWFCcHBQSzhUbGNR?=
 =?utf-8?B?blFIY2tNSXg4bHVXL25Nb053bXZUYm1TNGhVWUhhUzBQelFHSFV1N01YcHpr?=
 =?utf-8?B?L2RtT2FzOHFUU1k1aDluWTdwemlIU3JtQkw2VFdQSUxPcTVIM0E1VEhhTHVa?=
 =?utf-8?B?T0J2ekhjazZKNExKc2VSQUl5NXU0WVAwcm40UnFrcnFDUWJ0eGVKK3dGLzI0?=
 =?utf-8?B?VDBxVWlrcWwxNk4zbWltN1hVTGtpRDEray9oWXUzSjdKbWlqbFd4Wjc1RlJw?=
 =?utf-8?B?bGRiVmltNkRjNytjb0Q5UHhMWjV2a1JxWWxEbWJldDRzYmtEU2RXbHhBOHp5?=
 =?utf-8?B?SEFHYnhianBHVmVtMDJ1T1Fvb3QyeGowSHRueGJzanlGV2dUMjhXQUR2Z1J0?=
 =?utf-8?B?MGFoc2hlSkVKb2VMTmc2cW9pbC9Ucm1LN1VPTzRScGduZlBGVU5OUnhTS29H?=
 =?utf-8?B?ektyUGVGZ3FWeTF0cXBSekQxZDNKdVdTZVVCT1dWVUp5MnI4RmVUeDlEZ2k0?=
 =?utf-8?B?OHBOaUljd2FUZUhEb05HdzhIcm84RmU0YTJWQzdOU2tpSVBXZzV3YWJIb1JR?=
 =?utf-8?B?dkJPSG5qYTFiSXpWL0U2R0tpc0RJUHZNcHVIbWo3RmY0OFlRbFZPci80UjZT?=
 =?utf-8?B?U2hUZU55Q0E3bC9TVTZIMExQbGtSOWd3bHZ4MWV6cEhwRkgxMHkzZlVHT3l1?=
 =?utf-8?B?VjlpeE5FV0o0SVJ1L1ExZENQNGNEbE1XK0QrYUZiNFdHN3J2Q09VaWdOczd3?=
 =?utf-8?Q?A+LPHGzCxPlgu2DrMkZGSJIa0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b16787-eaea-49bf-0402-08db7c4dd2b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 05:16:29.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDrVxBAe1ihF2Dnx3/nDtUIKISSHHAUU1BCY91USO8Gn4rB8pBmX2ERIAASgrLzTDj1mV+kGCnBTFCMlud8sXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/5] drm/xe/pm: Add vram_d3cold_threshold
 Sysfs
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Anshuman

On 6/27/2023 5:26 PM, Anshuman Gupta wrote:
> Add per pci device vram_d3cold_threshold Sysfs to
> control the d3cold allowed knob.
> Adding a d3cold structure embedded in xe_device to encapsulate
> d3cold related stuff.
> 
> v2:
> - Check total vram before initializing default threshold. [Riana]
> - Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]
> v3:
> - Fixed cosmetics review comment. [Riana]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 85 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
>   drivers/gpu/drm/xe/xe_device_types.h | 21 +++++--
>   drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
>   drivers/gpu/drm/xe/xe_pm.c           | 37 ++++++++++--
>   drivers/gpu/drm/xe/xe_pm.h           |  3 +
>   7 files changed, 157 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4b82cb2773ad..f84b7b4d4324 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>   	xe_debugfs.o \
>   	xe_devcoredump.o \
>   	xe_device.o \
> +	xe_device_sysfs.o \
>   	xe_dma_buf.o \
>   	xe_engine.o \
>   	xe_exec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> new file mode 100644
> index 000000000000..15ace0041798
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: Xe device sysfs
> + * vram_d3cold_threshold - Report/change vram used threshold below which
> + * vram save/restore permissible (in MB),Xe save/restore during runtime
                        ^is                 ^period
Needs to be reworded. Can be same as the struct comment on the 
vram_threshold
> + * D3cold entry/exit. vram_d3cold_threshold sysfs attribute will available
                                                                    ^be
> + * under device kobject directory.
> + */
> +
> +static ssize_t
> +vram_d3cold_threshold_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 vram_d3cold_threshold;
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> +
> +	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(vram_d3cold_threshold);
> +
> +static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +void xe_device_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create sysfs file\n");
> +		return;
> +	}
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> +	if (ret)
> +		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> new file mode 100644
> index 000000000000..f9e83d8bd2c7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVICE_SYSFS_H_
> +#define _XE_DEVICE_SYSFS_H_
> +
> +struct xe_device;
> +
> +int xe_device_sysfs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7a12d8c657c4..c047571c8ab0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -329,11 +329,24 @@ struct xe_device {
>   		bool hold_rpm;
>   	} mem_access;
>   
> -	/** d3cold_capable: Indicates if root port is d3cold capable */
> -	bool d3cold_capable;
> +	struct {
> +		/** capable: Indicates if root port is d3cold capable */
> +		bool capable;
> +
> +		/** @allowed: Indicates if d3cold is a valid device state */
> +		bool allowed;
>   
> -	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> -	bool d3cold_allowed;
> +		/**
> +		 * @vram_threshold is the permissible threshold(in megabytes)
> +		 * for vram save/restore. d3cold will be disallowed,
> +		 * when vram_usages is above threshold value to avoid the
> +		 * vram save/restore latency.
> +		 * Default threshold value is 300mb.
> +		 */
> +		u32 vram_threshold;
> +		/** Lock to protect vram_threshold */
> +		struct mutex lock;
> +	} d3cold;
>   
>   	/* private: */
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1b526d1e4d75..848de5dcdaa5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -758,7 +758,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   
>   	pci_save_state(pdev);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		pci_disable_device(pdev);
>   		pci_ignore_hotplug(pdev);
>   		pci_set_power_state(pdev, PCI_D3cold);
> @@ -781,7 +781,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>   
>   	pci_restore_state(pdev);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		err = pci_enable_device(pdev);
>   		if (err)
>   			return err;
> @@ -797,8 +797,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
> -	if (!xe->d3cold_capable) {
> -		xe->d3cold_allowed = false;
> +	if (!xe->d3cold.capable) {
> +		xe->d3cold.allowed = false;
>   	} else {
>   		/*
>   		 * TODO: d3cold should be allowed (true) if
> @@ -811,7 +811,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>   		 * 3. at resume, detect if we really lost power and avoid memory
>   		 *    restoration if we were only up to d3cold
>   		 */
> -		xe->d3cold_allowed = false;
> +		xe->d3cold.allowed = false;
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c250a36b99ad..7028c9b6e94c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_bo_evict.h"
>   #include "xe_device.h"
> +#include "xe_device_sysfs.h"
>   #include "xe_display.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> @@ -148,8 +149,11 @@ void xe_pm_init(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> +	mutex_init(&xe->d3cold.lock);
>   	xe_pm_runtime_init(xe);
> -	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe_device_sysfs_init(xe);
> +	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>   }
>   
>   void xe_pm_runtime_fini(struct xe_device *xe)
> @@ -166,7 +170,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		if (xe_device_mem_access_ongoing(xe))
>   			return -EBUSY;
>   
> @@ -192,7 +196,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		for_each_gt(gt, xe, id) {
>   			err = xe_pcode_init(gt);
>   			if (err)
> @@ -213,7 +217,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
>   			return err;
> @@ -248,3 +252,28 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
>   	WARN_ON(pm_runtime_suspended(xe->drm.dev));
>   	return pm_runtime_get_if_active(xe->drm.dev, true);
>   }
> +
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 vram_total_mb = 0;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man)
> +			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
> +	}
> +
> +	drm_dbg(&xe->drm, "Total vram %u mb\n", vram_total_mb);
> +
> +	if (threshold > vram_total_mb)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->d3cold.lock);
> +	xe->d3cold.vram_threshold = threshold;
> +	mutex_unlock(&xe->d3cold.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index e0c4f92e27c5..b50ec8bdce6f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/pm_runtime.h>
>   
> +#define DEFAULT_VRAM_THRESHOLD 300
A comment on the units [MB].
With the above comments
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> +
>   struct xe_device;
>   
>   int xe_pm_suspend(struct xe_device *xe);
> @@ -21,5 +23,6 @@ int xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_put(struct xe_device *xe);
>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   
>   #endif
