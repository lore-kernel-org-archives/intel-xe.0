Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F1C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 10:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5E11120DA;
	Fri, 15 Mar 2024 10:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVfldnZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143A1120DA
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710497060; x=1742033060;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3wQQY2ePSJD8YmRlh+0Vb+KbP4o8raTrTBwYmKNsPNk=;
 b=ZVfldnZmqYaEYcfpzfOgRYie1e1/nIpCYmvWiPPeaJDHXIAGI2Ab2ohP
 E4esxJuaJl476SFMCaGQLDoOR7mE8ib1cBcb/6cz1DAQ3o4OknzXs2xrQ
 /3LU4CVmo1tPB+qQombIi0tHeQZyQSDvuXChW47OSiRAWoINdOWO8HqR+
 WACXknQRNtPW6Pses0K93AF7jgiHZL9j8ccbxQsxjk9ROBOro711OjVK7
 JT9I3uM5E7uqbnbxesQy0WvYE2QNKGF8KV/Drr59uJpPzE9q+WM9NVmi2
 hk7LcNRMAbQYtZw52mbG81GTRu92C9TeD8d1AOTd6hHBl81zMBTQzKIZg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22819400"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="22819400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 03:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="13071686"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 03:04:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 03:04:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 03:04:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 03:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmQm5gsQSyNmJ7wRtPgJOtcRCjFOXt/Qivu0VtvrJfkj+H0SpPdoBbuUnt3Lh3bnSKSYTVo2QukWV2Tjv/MOsv6ZmOsI78dIgWCK6doBTTOIBXdYT1OVZdfc3sk0GjPI4GEoZpMOhn79lP3SrUX9lBc+krJ44B230y6sDxzER8ASai4/WN1R5D3UZEUkkuCBIp+CnwnNNdO5/wS+c554qXY9996ZBw6yyX61T10NvpB/XF6OvuEv7O0oxgUmidV/AgEErJQSXSG1+eSfckN2ZIk9YODT6PKU/1OAgyWY5D+ATsClXL1atjo5gfdoVRyp6ayeLLTc6xKMmjPzZ2OeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTPknLVUzP4UYqBd9yGzSq185IgqAQp9QO0E707a3Hg=;
 b=gTRRYIxbO6i4QTpogzd9NEKMw/D+qp65FlmR4KVZ5b+xxHNuQB9KhVvUMx5m/Lnx6oiaG6JiGE5fdHP6JQkvsisAb+c4+Bqf4jhlz/Y8slljJDVs5f9i2r2CBDiYtt6p2DIcgYt91fOngerBIYthsx+Zi/8DrRTEAP4trsp/n0orO0nrzsd7TeNWeFe1XLzaJXqUzhTvQ7ZM6wuqABFFXwxER/2dbuZajgAAex736WYzePTvGkZYX6zziyO0INZO1ifwdXxC/7B6h+xsB9zmENu9+iOHKx3cPSIyHooJFQ+p7RbpdUbtnI67LZPf/LSIqYX/VrI/ZwZTKLvHxrc7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 10:03:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 10:03:38 +0000
Message-ID: <e11af40e-a580-4d84-8dc1-30784ca379b0@intel.com>
Date: Fri, 15 Mar 2024 15:33:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] RFC drm/xe: add fault injection for lmem init check
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
 <20240315100530.3051944-4-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240315100530.3051944-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2ea88f-f31c-4f45-2548-08dc44d72f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /VvRPI8+2h4kO1+9kROVB22IZsLzkMKZ3xc1Cj9bJ6KGxSC8MqVEwa0acMFxdsGp9JMg1laxK6zCCJGsMb6LdfNwAsIIRT45vzrGzJzSMz+0rHyYKnWwtTQaqmYY9FZiv2nuc0O4IAfEyMYi1PNxlb1BljJs5gJi7xFY+ikfICVa9kzjaeLnRp9P/Pv4Q0M2skYui+RR8K4+kIrGgKgCYnFGeU0Vl4hCFR00XQW5ar/Nwxtciq6MOOxO8m7kuaY5sfrEsgRn3PSf/172kxIIaV0GM1JPpRUh0o3rYHSZXAVbkWGNvxTe4HqU3kNseQipQHu3URdjk4Md+wGgtvPEa8YSpfpWnbuvuAptKHuZ8xoEN6xDcWYGdtNYk2ENez6HZPEdSZ3b4ihIvBBpI04tUoKzK/PZ1uUCKiq+QwBAzUrVkWuz2T1PFCAQEUgEfA60tvIKiSx00jg7sOxp7FavP6L9OaBmA93GgPY8lvffjmkbL7HWUnnCIwE573mAJfvLqcO4s2T1GPPCMVjVi6KFhqdRXOU4VVS5ozNCU0/V1g/Tr2xkSUQod9fKfrl7Ky0JCIaB1li/xvnyH/AFYBsG88BAjeWDV5rg0MmUJRVJ3z/34V1CwQhunBoupnWOo+I/PeGCzWVAcyZxhlRp7UF1y7iktD6U5PrsOMPMOtN2zvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFFZUdvelYvdjN4eURJcHhSRG53NU5xMS9IYlFQVHh4d3M0QXl0b1hzb09D?=
 =?utf-8?B?WmFWNlFxbFJRTTVDblVIUEsxVlFob0FuMFljZ09HYkdBU3I5Yyt1R0N6K1dC?=
 =?utf-8?B?R1Z6VkFZdlVBVHpTOWRyQUNXbDZkc3lpVk5oMVlsUUJ4cXd4YkdmMzZwVVE4?=
 =?utf-8?B?eUhCc1RtTmZvNkJKdjUyV3NicUJNN09QVnNXanp5ejdzQXdGeThZMFViUkRk?=
 =?utf-8?B?b2UycWFFdWhqelorcmozeDNjb3RnZjF5cGIza20rZ0dNcXkzYW9JS0tZQjdP?=
 =?utf-8?B?T1pJaE1NVmdYSmMzRzhtZytQVW1yZmZKZEJzSW1GV05BaVpVNHg3Lyt6ekJK?=
 =?utf-8?B?dkM3K24vYldRR0FMUFZROFpHVU9HZEc4MWY1bHVMenlTdjZXKzFrNVJ2VDRo?=
 =?utf-8?B?VStyd3hlUDBZQlI0SHBwRUhNM3dxNEEvNVFzQ3FpcGd3V2FxMW1LRERySi9J?=
 =?utf-8?B?Q29tT0g3Y2VwQ20wZXp3cWdYRGVCQlBHMmZrVkdsSXJUejdDRkdUQlVFS2Ew?=
 =?utf-8?B?dG9HaERMSUlYL1FjaWVhVEpWYmlGOXozSnpzQUdQOXdneGNWZ09YbEdkUFZq?=
 =?utf-8?B?ZnNIWmoyNjB5TVlLNzFtQk9JUkRsbGZsVFBNbDJuVTNGbmozbUo2Z1BQZ2tq?=
 =?utf-8?B?UStnaFd2ZDVVY25uaVNxMnJBb3FEMytjZnU5aG9hWno5SjY2WW9kcVJtSkdl?=
 =?utf-8?B?QXRCS1g4SHdURWNVT2lqYjliZjJyMWFHZk5wdE9vb3FQcVJ5WUhVNnlkSFQx?=
 =?utf-8?B?TFNHUlZKQmk1VjBSdkhnMThaTmhGekIzd2xsYXlRUU0zTExlc2xhMEhPRUpp?=
 =?utf-8?B?T3ZOZ2g3endqVk5WV3U2bjVPWk1WcmpleHJOMTc0UUZLdnlROUxmWUN5d1cr?=
 =?utf-8?B?R1BaM1RXY1RSbWxxcmR4U1BPVkdHSnA0TWpMUWVKdTc0bzVabGlRV01LQS9i?=
 =?utf-8?B?QldIKzZUN1FEQWxWZEJZMFd5ZndOaS91SmEyM0QrSExuTkZCbzQwRGFDSjZk?=
 =?utf-8?B?N05BL0g4QVdrOW9qM3dIRlloU1FDTE53OE1yWElXU1ZpM1NNOFNXcE9pUVZJ?=
 =?utf-8?B?VC9HTk1mb0Y0NW9UdFgybkFHRTl1SnpXT0VTQWg1YnpFMm1WNFZhMkdlWXI3?=
 =?utf-8?B?OC9lUi8wd0dLUjB1T2ExZEVUZk8zR1JZaUpLcXBpTVVDazM4VUhyYlNUS0Nj?=
 =?utf-8?B?Y0htNVFVV1lxeEZVSDFTemRpaWxnMS92QXA4d21Vbk00Y2tKYW9QZmpJRW9J?=
 =?utf-8?B?RkF3d2lseFBpdVcyb254cGdFelpSTUZTSlZGTTlnS09mUnFMN0NTSER2Y0ZQ?=
 =?utf-8?B?WnFzOGJ6dXl4MnRsNTkrK0REK3llRjJrTlNxRHVHNkRyTldXSm1GRWFYU0Zx?=
 =?utf-8?B?UFVNUGY3SjV4QjVtWjdKcUJEMnlvWWVselllNzVJck14eHZmdEFlUXQ4VEdu?=
 =?utf-8?B?MWZIbXVTZm9HU1A1bkRtR2JDcDVaTUk1NlE2ZXBaK0VaWFVObFdMeGkwMXNz?=
 =?utf-8?B?U01wOVVXbkFiTDhQQkdNMjZCWEJ1Vm53NW1KYTl5NkRiaERWc3ZUdHVOT1hR?=
 =?utf-8?B?Y2N1cWlxUExGSDF1VXVhQ0orZDVSa1hsaHdUY1FkNm8zN2FhTUp4UTlqWDZy?=
 =?utf-8?B?QjdVMm9XL0R4ZE12SCtJL3pXYTZDalRXa3JEbllNWUh6TUhGVmFRR3l3Nmk0?=
 =?utf-8?B?eU5wdHlpLzBudnlsenVmeGdsNmJOVjBVam1wODRXUnl6cHhOOTRpSzlpem4r?=
 =?utf-8?B?Smh0WmdyL2Qyd1EvSU9qS2YzMDBMeURyRWxva2RzK2doMHRXcktvQ1lRR21I?=
 =?utf-8?B?UTVsKytCT1FOQ1pUanlxd1ZEN1FaNUViWGI4UkxIaTh0M3VXVkxnS3U5Nm82?=
 =?utf-8?B?SVovaXczWVQwUmoxaHB1aFdjUzdjcU5hSmJVK0VOOXBkWlFrcW5vSXluWi95?=
 =?utf-8?B?ZmJXVEU2Nkl4MlVKb3FqU3RvNDVVbDJwS0M3Q1NtRmJaQ2RyVCsyeGxFY0JL?=
 =?utf-8?B?UWxadkxtZHBpdld2am5NaytVZkhKaVBIVmlEbEk3MW1GYVlVNWlJSUlGcHJI?=
 =?utf-8?B?UjBrakZNYXV3OUZqWEQrM0FOSlBHSFhHdkhzK2JRYWNIdE85R2o5NE4xRSsr?=
 =?utf-8?B?cXVsN0VtM1RhTlhwMHU3aEJXNW1wUVhkdmNnQWtWTUhtL2c5cHhRc3BuN0Vo?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2ea88f-f31c-4f45-2548-08dc44d72f48
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 10:03:38.5010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73MqtBDs4C3UY61iyxVMdPFm0Ci2TN6x68nLWemYA+U1CFXZ1g7tL0eTSMDjgo8Bptup0BKxSrQv/DTLsq+zVam44pLQ1FHvwuNEVN4nc5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
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


On 15-03-2024 15:35, Riana Tauro wrote:
> add a boot time fault injection for lmem init check.
> This can be triggered by adding a modparam fail_lmem_init
>
> xe.fail_lmem_init=<interval>,<probability>,<space>,<times>
>
> Adding this causes the lmem init check to fail causing
> the probe to defer.

IIUC, this is  fault injection is introduced for validating probe deffer 
incase of lmem init failure.

Can you come up with an igt to validate to same ?

Rest all looks good to me.

>
> v2: add fault injection (Lucas)
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_module.c |  5 +++++
>   drivers/gpu/drm/xe/xe_module.h |  3 +++
>   3 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 50473329cce7..393610e95bd1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,10 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
>   };
>   #endif
>   
> +#ifdef CONFIG_FAULT_INJECTION
> +DECLARE_FAULT_ATTR(lmem_init_fail);
> +#endif
> +
>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
> @@ -431,6 +435,23 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>   	if (IS_SRIOV_VF(xe))
>   		return 0;
>   
> +#ifdef CONFIG_FAULT_INJECTION
> +	/*
> +	 * use fault injection to cause a lmem init failure to validate
> +	 * deferred probe. Set the verbose to 0 to  avoid dump stack
> +	 */
> +	if (xe_modparam.fail_lmem_init) {
> +		setup_fault_attr(&lmem_init_fail, xe_modparam.fail_lmem_init);
> +		lmem_init_fail.verbose = 0;
> +		if (should_fail(&lmem_init_fail, 1)) {
> +			/* add delay to reduce the number of deferred probe attempts */
> +			msleep(500);
> +			drm_dbg(&xe->drm, "Fault Injection lmem init failure\n");
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +#endif
> +
>   	if (verify_lmem_ready(gt))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 110b69864656..c4efbab430a7 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -48,6 +48,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>   MODULE_PARM_DESC(force_probe,
>   		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>   
> +#ifdef CONFIG_FAULT_INJECTION
> +module_param_named_unsafe(fail_lmem_init, xe_modparam.fail_lmem_init, charp, 0400);
> +MODULE_PARM_DESC(fail_lmem_init, "Fault injection. fail_lmem_init=<interval>,<probability>,<space>,<times>");
> +#endif
> +
>   struct init_funcs {
>   	int (*init)(void);
>   	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 88ef0e8b2bfd..ccbeacbc3efb 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,9 @@ struct xe_modparam {
>   	char *huc_firmware_path;
>   	char *gsc_firmware_path;
>   	char *force_probe;
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +	char *fail_lmem_init;
> +#endif /* CONFIG_FAULT_INJECTION */
>   };
>   
>   extern struct xe_modparam xe_modparam;
