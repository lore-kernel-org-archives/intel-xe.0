Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCCBC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 04:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88A610E599;
	Thu, 11 May 2023 04:44:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F0F10E599
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 04:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683780239; x=1715316239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y5DpqUWK2If758pZV/p8bzRBzIQ880B0lUqmd5xQ/Zo=;
 b=WsvWYnCm2M4e7ycUerTIHojUNHzPlfBijV92/5ESJxahWWN9ZGdC/mKd
 s9/rf7h/7dKXB04JgSjN8VxDxWD7X9f8DgjSMD5yTSyvVAvBmSo+7Bv92
 g/NBfoYYTBwwZ3ocaoSmjaXLXtRTDQEbd4jXyuVEBWXGN4jyAIQjqgf/g
 vkTPwp1mDwjEwK9zt0eM0UOBkeUHQdPAnpmxHLHvq+vPaJReNY89Zb3rV
 SVAZ2CUmId+eVg8KXoLj+fPwQkToYRH5At/n3uv7qEE3NnrDQvPjHWpv7
 WryogWfbWGqNuqQvbaKX8CCtdoib5PoSHX74fkjVbm9Eg2fuk2xKfZNJM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413715823"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="413715823"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 21:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693652800"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="693652800"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2023 21:37:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 21:37:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 21:37:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 21:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJPgzvFkEcwvOUo6dax2eEA2e+5yb8u2Ajf67Sr8M3AOjl21Uy7OTCf4OJi6DOZZUL/Ktx7+B0outek5ikxayZV3nRd3i/0HxQpuD7hjYzc5VvR+ZURsen+3zhiRmW9ZaONSR+81CfSnK/V+ekjwoY33rfuywcLwoMZbr8BOa5C7qI5d35Ud9Y94f1Sdanf3ZVZDY4pTcpeUcGzc0YZ0//AS73QOOA6Et1ZfRhD7apj8n+tqObqJan+5WntiqLZx+aAztr6/0xn2slLuwCGjkvLUvtXte0E92Bsp8vnFaDFnwRXLIHUuTEsoY+f7DnCwHCTk8+hFR4QNNQ50eUOyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqXTj4i6K61tRt1bciGZzRhv4MndsX8/7oGV+mLMC94=;
 b=RdWKk82UY6SSWmV/5++8HQdz8DNbqboWjfK9JBhJWPjyh2Pi0hVUUBf5KeRRbC1Kh9rq0aDW4oRkpBfR/pSpeQXh3WJSGa1mNFqDwJyc7OsaGe7qY9s5X2kfohNGzcKJC37APWJx3kHO58sG8T+tfn7OZDWcdcau/JkAtheQRv+TjfGPd+BwbhbLepT0RxogygV8IG+1cIrPYbRvLIJMsM4i5egExfx7bcx7U9iSpmjR6Iqskk0UfSgY/qa7zpQOwIgUvYhrswXEtZullnZ3QZtoTxlcNzcm2zPvQZ1x+b3sroj8r8xsarLfu0fXFzX5oP7looQ9fyi9Zm1BhW4CfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 04:36:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 04:36:58 +0000
Message-ID: <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
Date: Thu, 11 May 2023 10:06:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: c6041e1d-9389-45aa-92bd-08db51d95ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xUq0+1uuKV1y3Xr0wNauTpp6xkSVKAmgJat1u/HaNRGAk7y/qB3t3pAX5c2EsQvcYaqSmjdSD1DCm+E9LqJBq5Hc722hj5fmYIpKJok+3HFGbysn4SESN/GQk8yv4vr7+wnGYyk9nEEHrY80GgNKO7bPCAJHvwHqU6Ham4hNf7wZP02YPy///RVGES8PfAZoVYq9+DWY5SBVFq364yYhHrw+BdmrQOMnDLzfeLo8PdnO9qYt1gWtvxg8lvju3tJHBkv/XCeOMzjkhtp+rfsZ3cEfWpNEknzgeBhfR/Gzc5XKV4equRiE+M6xiVIK9hFkuApxtsrikmvZSx7A7fSrDYqfgibJq84ypFl3qmbOQBn//yYGF9qtVgR9zWq26OkVE7tI6DszsJMMLIJ3BdOjW99OhFOtCX16qHF9fFi1TfD9/SOI9TkHw9AUeoizot1IZtL3fxL6wCmgaKwU5tu8Q/ReyqcQXe1UaZ0K+nVHWgGd7No8WmXfqhTkFFKKlyvXXptn1fZ3kfIfMeLpmdT2g/MDO3tAhrRFRnubM9YqpCOxZn9EXY5gXeXH5fuBVrQb2zpAvMr1hthla9MX4rKTmGRpR6DEJR/fsoJrBBli6E8X6l9/7TA4gPfzUHxuLQ5zbUTrDU8Pn5RrpGzkcTFEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(6486002)(6506007)(26005)(107886003)(6512007)(53546011)(38100700002)(83380400001)(2616005)(36756003)(86362001)(31696002)(186003)(82960400001)(4326008)(2906002)(31686004)(5660300002)(8676002)(316002)(66476007)(8936002)(478600001)(41300700001)(66556008)(66946007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azc4bHc0bW9DWktmY1h2bXJOdnczZlVYWUZHVkZ5ZDZsdWUyV25VNUU2T0F3?=
 =?utf-8?B?RkVrYkRraXp0WDhNNEttOWppK0pnVVNpYmxLQzlxSy9YbENKbHBVemNSU2pw?=
 =?utf-8?B?clRxekdmdnBVU0NCeGY1S2piL002YjFOaXpwU2VPbnA5OU1rNDBBbUlWZW51?=
 =?utf-8?B?aTc3aTg5S05UUm1wRk90cHFzK0ZUVnlja2F1Qml5c01KbDFnbEk3cER4UU1v?=
 =?utf-8?B?U1JXVENRQnk1U0FtTExsS2pzRUpsU0xuaFd0N2lFb3pzeno5UnB2YjczVzJj?=
 =?utf-8?B?N2wyeWp5RmVpSGV2K2NRNzIydVhnVHNHWWtXMGoxWkp2MlAyTWJnbDdjcTFm?=
 =?utf-8?B?SWZDa2ZzTnZFUXFNaytOdm5kUFBkRWxIQU5lMFdKTGdobGZVd3RIbnZkalB4?=
 =?utf-8?B?SmFKakNPandjMitIWTgvNHJYVzBTbW1hQkV2L1p5K0t1UldJZzFmL3pvQ0tk?=
 =?utf-8?B?UTJ5STlod1p0Z0syMTR2SEN5c1BnRWZRWUkwOEpENFU4RldUdHM4QW1rZkwr?=
 =?utf-8?B?OTUxUTJoZFlPN1U5L2UyZW1COG14clRDenY3L2R3bHdUbyswZ21wdDV4WXM5?=
 =?utf-8?B?R09aZkc5c2ltcVh3NXZ4dEUyNzVhWTVpckhtcW12RWxkZW1aNmx6UUZkR2w4?=
 =?utf-8?B?eTJkS1o4MW5TN3pINFNiTDU3TFREZ2hMcVlsRTFFa1JrYW5KblYyZVZUV1Qr?=
 =?utf-8?B?b0ludzZYYXkxOUM1anZrblUrUTBNRFVpSFd2bVNrMTFvUTUyUytTQzJsYlh6?=
 =?utf-8?B?Y2krYVBBUHFoSHVnOFhZUU40M1U4ODk1UVdEL3ZPNGxRa0ZCeUtOeU01QnJw?=
 =?utf-8?B?bXc0WlNvaDdTTnRZRFVnRDZhN1FGQzdGTzNkSVpuN3AxU2Q0aUdsVThWczBq?=
 =?utf-8?B?TjNSeHZMWDhhRkt2YXNlaEgxc0FyUEFFZlg2Rm9BVXhNcHQyL1d1dFBkdnV6?=
 =?utf-8?B?UU5NR3oxTjdDbWlRZG83azVBYklteVM5QndWSDg1WkNOTEVQWjFFblgwOHRv?=
 =?utf-8?B?eFpIRHpyRHdML1BVODFSbVU2OHNtUytBKys0Yyt4c2VockpoTk9LcnQ2a0FU?=
 =?utf-8?B?VlpKSTZVdXFFWkhoK3pPM1ZPcFEvRHR2cnQyaDM2NnR4L2RtclZ6RzhIbTl0?=
 =?utf-8?B?b2ZjY0cxZjdDUys3NWZFUFhMTWlraHhydUxXR043UGRvN3YxZ01oMGZScW9t?=
 =?utf-8?B?ODYzNWNXa2luSi8wNiswZ1k5SVV3OGtNdkJ1QmNuWDBOVFU2V3NyVnFnZFNj?=
 =?utf-8?B?U2EzbDNoSndueW9CNzJBZzZZKzNnUG1Bc05sdGpUMXVyVjhnYVlKdVNTYUhw?=
 =?utf-8?B?aTIyNng1ZHVMUE51dEdMSlRHYm1la3JqUXFuR0pBZkJKRnFjRHRRdWZVWUR5?=
 =?utf-8?B?b0Y1VXRWWFhENnh1QUkyaUMweFN3cHhwNVdwU3Y3bDU4YWtKb2gwMEZ3R1VL?=
 =?utf-8?B?aHdUZ1AvVmoyQkRabVZVQU1WRUpSVzlBMENKYitvbER4QmNJUjQrcGFQdXky?=
 =?utf-8?B?TVhVQU9ZQnhKVS9wT3d0THY5U2lONDAyUkFiVU85djQzbTdlR253WTh2YkVm?=
 =?utf-8?B?a2hDZFFIVXJ6NHppVi94MEg4anFZbWgwRTRVV3VRdDZyb3FraW9mM0dGMEF5?=
 =?utf-8?B?OFlMYlBFa3UxUTlUdmk5dmVrWnU3UExFVnF6R25QSmdFRHQwbjlvSG95a1I4?=
 =?utf-8?B?T2pDVmtFRndEd2pDMkc1ci9jWld4Q0h3SGYrdFN2Q2dzSGl0Mk5EbEpDTHJ1?=
 =?utf-8?B?NUpUb1ovYTZJdVVrVnF0U1lnODA0TlBaRmFTV0h1M29TcVNzSUZ6bmRFZWZK?=
 =?utf-8?B?alN5cDVwQ0NPaVUxWHc0RFBaYU8rNGQvenhaUUxBY1BFWHhPMFd4WkdjeWY0?=
 =?utf-8?B?NkZ4ZXpPcHVkUFZ2cm01NDdqK3NXQ3MzWWdCcDN0QVI5ZzRUVS9mVWMzSkhx?=
 =?utf-8?B?S1RCUmcvcDc5ZWlITjNES2pGRDVOTVk0ajQ5RGlOMGN1MERxdElieWgrVFgx?=
 =?utf-8?B?MzhmVjltWGtnTHZndnZHNWJpWFc2TzJvRXV1NEcvcEI3YW1lWUw1K3NiOC9E?=
 =?utf-8?B?OWJPdDJpQkVoNmpLMnlQT1p4VTMvVFZWOXk2OUpYVkNyT2UrUkp2VEdPbS83?=
 =?utf-8?Q?W/FlBZ9hgMXUzW9bUMn35tg1r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6041e1d-9389-45aa-92bd-08db51d95ac1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 04:36:57.9330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kulufahBWs/KnjAv0prreMQmJ2TKohGcE9sc7clmTeYYx2b+ROg7zP/fOeoM0hp5Op9CQQ3o6ZGsPlIpM0CTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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

Hi Himal,

On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
> Send uevent in case of engine reset or gt reset failure.
> This intimation can be used by userspace monitoring tool to do the
> device level reset/reboot when GT reset fails. udevadm can be used to
> monitor the uevents.
> 
> v2:
> -Add NULL check for xe_gt_hw_engine return(Aravind)
> -Arrange variables in Christmas tree order(Tejas)
> -Check GUC_GSC_OTHER_CLASS(Tejas)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h          |  8 ++++++++
>   4 files changed, 68 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3afca3dd9657..2c3ffa1db74e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>   #include <linux/minmax.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>   
>   #include "regs/xe_gt_regs.h"
>   #include "xe_bb.h"
> @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> +	reset_event[1] = "RESET_ENABLED=1";
> +	reset_event[2] = "RESET_UNIT=gt";
> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> +	reset_event[4] = NULL;
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
> +
> +	kfree(reset_event[3]);
> +}
> +
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -639,6 +654,9 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
>   
> +	/* Notify userspace about gt reset failure */
> +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..a3637eeaaa37 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -56,4 +56,23 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   	}
>   }
>   
> +static inline u16 xe_guc_class_to_engine_class(u8 guc_class)
> +{
> +	switch (guc_class) {
> +	case GUC_RENDER_CLASS:
> +		return XE_ENGINE_CLASS_RENDER;
> +	case GUC_VIDEO_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case GUC_VIDEOENHANCE_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case GUC_BLITTER_CLASS:
> +		return XE_ENGINE_CLASS_COPY;
> +	case GUC_COMPUTE_CLASS:
> +		return XE_ENGINE_CLASS_COMPUTE;
> +	case GUC_GSC_OTHER_CLASS:
> +	default:
> +		XE_WARN_ON(guc_class);
> +		return -1;
> +	}
> +}
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..d068af0ca7df 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -12,6 +12,7 @@
>   #include <linux/dma-fence-array.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>   
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_device.h"
> @@ -1589,10 +1590,26 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   	return 0;
>   }
>   
> +static void xe_uevent_engine_reset_failure(struct xe_device *xe, const char *name)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> +	reset_event[1] = "RESET_ENABLED=1";
> +	reset_event[2] = "RESET_UNIT=engine";
> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s", name);
> +	reset_event[4] = NULL;
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
> +
> +	kfree(reset_event[3]);
> +}
> +
>   int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_hw_engine *hwe;
>   	u8 guc_class, instance;
> +	u16 engine_class;
>   	u32 reason;
>   
>   	if (unlikely(len != 3)) {
> @@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
>   		guc_class, instance, reason);
>   
> +	/* Notify userspace about engine reset failure */
> +	engine_class = xe_guc_class_to_engine_class(guc_class);
> +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance, false);The The instance here is considered as physical instance of hwe but while 
submitting contexts kmd passes logical instance to guc. With that I 
assume guc might be passing logical instance or for this notification it 
is passing physical instance?

Regards,
Badal
> +	if (hwe)
> +		xe_uevent_engine_reset_failure(xe, hwe->name);
> +
>   	xe_gt_reset_async(guc_to_gt(guc));
>   
>   	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..79ef5947c172 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -36,6 +36,14 @@ extern "C" {
>    * subject to backwards-compatibility constraints.
>    */
>   
> +/*
> + * Uevents generated by xe on it's device node.
> + *
> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
> + *	or gt fails. The value supplied with the event is always 1.
> + */
> +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> +
>   /**
>    * struct xe_user_extension - Base class for defining a chain of extensions
>    *
