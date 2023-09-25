Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713D9CE7A8C
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 15:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3483A10E27B;
	Mon, 25 Sep 2023 15:34:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1021610E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695656044; x=1727192044;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c70/3XcadDLF+wyTCkQwu7rfleyFGb9QYQZjntvBHb8=;
 b=EmmYehqQEaNOdVjI/MmKYEb+8uQjh4Z8Ex7Ccpj+R9x0ZmrDJY6jridd
 SJWyw75h/Lk6ox+7XalnHm08/02O7CwE5WPr96jXkr9A0RYIrCmhs+Oc6
 hMLnOiRiLqa/z8EveuB9KWANAZzkH3ByX3iGf1llYZkpFgT5A4lQbfq85
 c3iVDJgFOOPSMqjXE3tjPb9/PqpuN+G/H7koFnTS0SlhG0H9h5BOWoONU
 uCDQFyRcZHOaNBvsv4PHFuRQoSL3KI+U+/sy0PofXTMIlLlC6HCgEEwCK
 EZSgt4nwfKYszYRJrjQEl6NAM8MM29babPJ5boM7NvTFWCytm/d0C4zOG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361534361"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="361534361"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725023591"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="725023591"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 08:34:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 08:34:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 08:34:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 08:34:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 08:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNzCIO0aoon8MvaVjHXzgxGrCJ/X732RJQNbeSqIssN6zPoeKg0ul/xS3Yr7Cs4kuTdRzfmdST/N+0axh7Q8j/m6EuZ/COnf4h3qXGF6WmcBZcrR7PWa3/eF5A29GjXwhTWI8b71m90dpBifacOuv6pD69Dyw8sgd2Bep8IMga2TsJF0cpRlkuOz7BTjq+fks7p6JzTp3/T7x+ZKUNrYYXdAsBhuC16Zv3uwYOVB2WG4BzUGkSZZ0Ipg7YcizVBpD4QxN5T1hh3vf4lHDkzEZPCv/7sbf8SqzwxACbniOCV8qHl+mTEETTe/q+QRW29dhLBZizz/bYxeE6y4Wi1q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS7TqEr2+fq7DQTFPNwrbtZIRQ9f1oNPLRMaGDzz9AA=;
 b=Ll7BE7Kj9s/pXSXdDi6UQUidXXUMAVvD35Ohl/1FPdNEiHGEkpqHdulUvdVirqw1MqWmVbE/GpoN0x1uqnjzFOpioj6zjL8aVju59gMa8PnTWRibHCPkcjFF0J7CDs9x5n1kW1tUulgcPRtBDlon0eaKbDosxCTi2yi4HX3xupQqgILU2HI0Q6qBtUk2dp1DVyt07j8YUOGFRW9EZTg0CH/KUO9xHMS2Jmp7ofJ14QRENtdUI1Q+cKdrh5pCIRhdwapOPQcrsljdhJWP+Nmcs7o5yec9CHIwIdZm15ujP3QcOB9RZcTacaNbnDvVawBZ1TyZn1JHU1a4Cwxxcvcs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Mon, 25 Sep
 2023 15:33:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 15:33:57 +0000
Message-ID: <cc8160c0-9054-49ea-ad07-944dcccfe561@intel.com>
Date: Mon, 25 Sep 2023 21:03:47 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20230925144359.192835-1-tejas.upadhyay@intel.com>
 <20230925144359.192835-2-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230925144359.192835-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: c37018ad-d1d8-4549-6f84-08dbbddcd552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyZBuY7/nB3Nhf3sua3izGfHu76sZN7SO7a5jvg6xxnxwGCm2cHpkKMym4vjwXnTtaZYSrQh+Hu7+7BkthXJlA0nhak7q0eC1IznecFrtcZQXbw5YBgmM3rfFhTBuc0TQ1cS/qRU9WrXXEX5H0VHSK4ziMRz0Jvvbuup1mL0likZlPDjOuK33U0ZL1bADGvTd5INDnMgwVRqE5ZCfGQgMFfBLG7hEPMZgqMMpTfDV4g8O58OMr9XoimIXq4emcjZEBtBYMyERebg4YXYyeTdvvB1P9CeI8r2BaTbkhJr/zubo9l4XFBw9LN/ebT1lge3qF4jHXFy6XNFXmP33iJ2XaZ1iSJNLIQ6mndSeDNdR/L/5AQP+0HMcusCkxqSjF7Q6qMSMxm5LovXX93+OeIum8lhhPRNEMr0MZNWmbphyQmyeziV/ZR1h61bdIIOz+Ukh+SCvoZIwhfJK6wBqjUgR2sHfpx5o/mVWHmRSvxcpyeLgnqvbce6nV7CD2jQUb1XcI0AXC+wIa6kpRkPTdBIiiUUe2Rnphpc7ZFnYsznxIeFsuO1CLfA6/Z18c+VRj4tfu82NcdOSM/igXDFbI95ZRoi0UwutbfDexXHMd/fK0PmYXa4AAuxeGzfL03peqS5FJbnL1Zz0uT77g9G/0s6/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(6666004)(53546011)(6506007)(6486002)(83380400001)(41300700001)(478600001)(66556008)(5660300002)(8676002)(8936002)(26005)(316002)(66476007)(6916009)(2616005)(66946007)(6512007)(82960400001)(36756003)(86362001)(38100700002)(2906002)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmdkcVJyc01VNUVaQWZmcDVVOWJJL3FEWHdOMWN0U01uUnpQNUJGZEpCMHl0?=
 =?utf-8?B?QkpBamJ6bi9OQ2N6eXRvSUhDcllDNFhwK0tORHBDT040ZFF5Qm5FSlkxRXpz?=
 =?utf-8?B?NWpLMmI1WUxZVC9RV011cGhScW00TGRIZHRTOGlWQTB5eDUwUWhDNGRwY1RL?=
 =?utf-8?B?c1dRUk9lN0p1ZFRULzkwK1Fqa3M3TTBLZHFYZ21ObDd6Z3hzWUVMem9qQXJj?=
 =?utf-8?B?TGsxMEJUZjc3R3J2WG1JK1lZT1FISGgwZFlPY0YwSVZSOWFIaW00UFRNQ2tX?=
 =?utf-8?B?Z2xrWFJaYnF5T1NHRmVJaERLY2FqTFl1Z1lrY3QzS3J0VnZxblZBZElGUUVK?=
 =?utf-8?B?azBOZHJuN0JtOVc0ZFZ0ZzZmRURjZVl0Z0c1ZUhhbmVEc2FpYXh2REthdjBX?=
 =?utf-8?B?N0xzdEVicWlZdER3RUlnSXdvenIwL0JoT0lPMnIrL3VXYVRlVk4yOU9QSlVa?=
 =?utf-8?B?bnY5Q0c4bTJWYld1WmdZNlI4YlJzNlcyU29HQ2RZTEFMemZwL1V5NWx4UENh?=
 =?utf-8?B?MWNQQnBKRExrUUZkbG1CQ0FCRTIyOU53c1JSbXdMcjlVYW44djEwN1lSL092?=
 =?utf-8?B?b3drYjlzYU5ZTmxYV0FOejhKVmtnTm5ZYlFGeXFtVjR3ZnMwU1c2OEwrU3Av?=
 =?utf-8?B?N3psSE9iZ2xUU0ZtemxKWk5yTHNTTkdINHJSMzl6cFlQTHJqOGdNbzZRa2xw?=
 =?utf-8?B?SElNTkdCb0ZoaFdmWUNTMDdPd0JKK3J1RWw3TW9Lamp0UlNNVDBJWmJWT3lW?=
 =?utf-8?B?NXV1QURPaG55MkwwUnorR0RqbUlwdW9TNllCMXRpTFA5b0gwaE9qdEw2REZR?=
 =?utf-8?B?dEd6U0pXWml0NnZiOHJwdjA0ZjMxcWZEMXlHeXJLa2s5bnB6K0s3RHprR3pJ?=
 =?utf-8?B?aEVBV0hGM0sxWlVpQ3lPVUVhQ2hzWTlnb2wvdW04OW5CZjd5dk00R3FzcUdm?=
 =?utf-8?B?TzVLZE9EbGNRclZwdHpWcForTWRmaTByYW1IZlE2OE9oM0VqamhVYzdOQXIy?=
 =?utf-8?B?dStaWTR1WXlyWU9EM3hqYWJRbnJiQUhuM2lGUEFnWnB6anQzTURNQ1NiVjJk?=
 =?utf-8?B?K0tpc1ZUbUtOZ2NPRUdnQ0dKVkROZFpuRStjdks4NVAzamh0SG5VbHlqZSsy?=
 =?utf-8?B?VmQ1OXN5VGpHaDJVY0l5dE83THEwQjdqbmxKaWIxT1FPT0k4bkV3Q1NJRVZl?=
 =?utf-8?B?MXd3RjFhOFpsM3licFFUSm84UFVkMUwwMWpJZzhpRWY5aGtIUitIekFES1cw?=
 =?utf-8?B?djI4ZTRjYmQvd1I4ZHNjaHJoUlE1MnNmVVBid0ZDMFpMQU1HdHc2MXo1aFRF?=
 =?utf-8?B?UWJGMDN3aDZlWlJSUkVEbks1RUZuek1ndUk3dk5hb2hHUTVOK3JRR3ZmTVcz?=
 =?utf-8?B?WmVTSEFVc0NQOXdqL0diQXVRbHlSYXdNTk4zZHZsanlQY3luaGVIenRSNUc2?=
 =?utf-8?B?SlhDRmdKcEdrSml6WUVOZkhuaXBVRlNybTFsNDI3ZG9ZeUcxNlhoZFFQN0ZG?=
 =?utf-8?B?N2V2VEhPTmVsVlpUTU9uK1pRTWdzREwycWd4bHNpZExZL1pjWXdHM3QwL0cw?=
 =?utf-8?B?Y3dLMWV3UFh3Q242KytYZm5IKzNCWllPN3NFWmpGcS80S0tsd1BqTFBvVzQx?=
 =?utf-8?B?K2FPNzMvYUVXOHYvNXJQSGcxa0lpRmIvdWFNTFlNVVA2NnA2VmFFMlBWVnlH?=
 =?utf-8?B?RVdJeE5SYi95QjBiNjlIQVA0TVE1TEFXNGxxMjdna2c3Q1BsTE9EYlAwRlR3?=
 =?utf-8?B?L0Y1T0tiQ0R2U3Jxa2EyaGZhRldaOUQ1VkdlZmFEUHRqdlpwRUl0YXZyZ00z?=
 =?utf-8?B?eGRwVng1SzRuL3MrUXJWYzdWMDZlTUVzU2hPVFdMajdtMUFtZWloNitmdVRs?=
 =?utf-8?B?aG5rMVkxTkdJcUFIZkRXOHhORUVOd1Fsc2pRMzU4ejZoUmd0SXNlVFFaZk5Z?=
 =?utf-8?B?L0g5dUFSZzRYT3Y4d1RZNGNkS1J0eXY2REJXazBGOUlkVGtkT3J5dExJSnBL?=
 =?utf-8?B?eXRpYWMweURKS0RubzBORFNoYWVKZEVKMmEvR1lDQ1NNYjFHWDVaVUQ4b0tJ?=
 =?utf-8?B?ek9DVVYzcG9FRzhLb0RRVmI3K0lCaHlnTWMrR0l5OS80RkFCMURJWUwzMklN?=
 =?utf-8?B?cWlTV3JqS1d0dEZrU1ZTQnppWElibFBSejVZK0x3SXZDZGdMeHRUUVlWQURr?=
 =?utf-8?Q?OoitNp1UNZe+2P1fDOOn+Ig=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c37018ad-d1d8-4549-6f84-08dbbddcd552
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 15:33:57.5847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkx2lZkAEIKKkDEU7Zu8JaN2WkYuWtNmsd3Qr6Rei+ukhXikZEZrUdwKpi9ZyutAM6vhgmTc4idYEZn+pQy9mmDLFZ9P2b5jXFeiFV32b60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 1/2] drm/xe: Indroduce low level driver
 error counting APIs
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


On 25-09-2023 20:13, Tejas Upadhyay wrote:
> Low level driver error that might have power or performance
> impact on the system, we are adding a new error counter to GT
> and tile and increment on each occurrance. Lets introduce APIs
> to define and increment each error type counter.
fix typo in commit message.
> V3:
>    - correct #define max value
> V2:
>    - Move some code to its related patch - Michal
>    - Renaming if API and enum - Michal
>    - GUC errors are moved per GT - Michal
>    - Some nits - Michal
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.h       |  2 ++
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>   drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h           |  3 +++
>   drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
>   6 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4232de40ae0..b44c91d1cec9 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -159,5 +159,7 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>   }
>   
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..a28e140f9e64 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -57,6 +57,12 @@ struct xe_ggtt;
>   		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>   		 struct xe_tile * : (tile__)->xe)
>   
> +#define XE_TILE_DRV_ERR_MAX	2
> +enum xe_tile_drv_err_type {
> +	XE_TILE_DRV_ERR_GGTT,
> +	XE_TILE_DRV_ERR_INTR
> +};
> +
>   /**
>    * struct xe_mem_region - memory region structure
>    * This is used to describe a memory region in xe
> @@ -173,6 +179,9 @@ struct xe_tile {
>   
>   	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>   	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1..a1a0eb59ecc5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -47,6 +47,24 @@
>   #include "xe_wa.h"
>   #include "xe_wopcm.h"
>   
> +/**
> + * xe_gt_report_driver_error - Count driver err for gt
> + * @gt: GT to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Returns void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err)

Actually the api is not reporting the error. xe_gt_update_error_counter 
will be more logical.

Will leave it up to you to decide.

> +{
> +	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +}
> +
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   {
>   	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..9442d615042f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>   		hwe->instance == gt->usm.reserved_bcs_instance;
>   }
>   
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..4645ea9b7893 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,13 @@ enum xe_gt_type {
>   	XE_GT_TYPE_MEDIA,
>   };
>   
> +#define XE_GT_DRV_ERR_MAX	3
> +enum xe_gt_drv_err_type {
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	XE_GT_DRV_ERR_ENGINE,
> +	XE_GT_DRV_ERR_OTHERS
> +};
> +
>   #define XE_MAX_DSS_FUSE_REGS	3
>   #define XE_MAX_EU_FUSE_REGS	1
>   
> @@ -347,6 +354,9 @@ struct xe_gt {
>   		/** @oob: bitmap with active OOB workaroudns */
>   		unsigned long *oob;
>   	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..4090798aff4c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,6 +71,24 @@
>    *  - MOCS and PAT programming
>    */
>   
> +/**
> + * xe_tile_report_driver_error - Count driver err for tile
> + * @tile: Tile to count error for
> + * @err: enum error type
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Returns void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err)
> +{
> +	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +}
> +
>   /**
>    * xe_tile_alloc - Perform per-tile memory allocation
>    * @tile: Tile to perform allocations for
