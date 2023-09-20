Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52775CE79CE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 13:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5AA10E4A3;
	Wed, 20 Sep 2023 13:21:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A4E10E4A3
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695216103; x=1726752103;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=gJGYfG9T8QkdNMJy6u0D3PX9WxMhp3ZXSIqu/gigM4o=;
 b=elJ8qhc6Irmh0Ws3WvRozMCyrJDW6myzvhAEw0VDtV9S+zzJgwomRoog
 iDGBzz60lW0wEBlldEHVdPB5R8z+kgBOIhXEdA5PH/6v8irh3Fxydhq6Q
 v8rGp9n5XRIhC1WzvUYO1i2RaH76aqmz5MbJHtHn1t6bzEDFvbGzaMh37
 Ikv91oRa1R18xbrNvxyjlYYNhH9FKdaMOTIjo4eALmUjfAdkKfdgpDo4B
 LmM0Hdoc2U1dlnEzkpKnpKI1lZCUFeoLYlgVLX55MqmwPeqw7ITVV8ZIl
 tZ6DQi6fTnRe0xTD8TJJTruL9L2EUqzFEvcUJieWfHvUGGjWCqDslSUES g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411163279"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411163279"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 06:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746654854"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746654854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 06:21:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 06:21:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 06:21:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 06:21:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 06:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyxlg7f9OB7yoAhVewy82/W55LGWmW9UoyWDFuYG4MyrYyNqxAeX3qvRGyDh/Hlc/E3SQrUz8ghWBCyrkngh/KRHrXIuoAzqeghmQy80oNrBbn8aQt8lIoIwS5nOG5jG04JPBzh8D7xOIvmcYWCGu/3tRhst4th6j1t+q9PKKOuPMtOwyENoNuvwal8P+TFUTPTma5xYhzZZOJ6mS0mNkfGz8DeZzPZzcDNCmbNyKW+2nSt1t8beG1DNdFZqsyE4ftfw2W8XalvHwb/kRgmGkcPNr6Gl428vWKHy6x8fCCeLwOS7t7/N+2V0I4lyX3o7ckROTu8833kiYbktjIPGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CXkzkbE/HjOhh8mwinEAHaY3xDQPYV7xIqKnE1OCGM=;
 b=RHfNmbaEyNbrMN6dqbAVDJmMwMvcMBHrOBJ8hcPTzz9WcwKmvMwqVY1aC7QlkXGDPIQ0HuZ9CTJZb7eZ4Ilpamn5CyTn5DVtvrXMUkgt8zi1MbWn1HZxGnq13wFSrfEPYK1Y7hK4CDQ5lzHhpOOAWZeE04cF1CR5Yk8oi4BtLdgLVyF61AZH/7bkTzSRXm5Dgy3TXZgK8B6o+3/UAxMWALIdU8xZj0/DosfkqfywfgMVNrhWjP5iaOGEi8w7q4ZPYUA0FykgRh31ajeqdmaFQfav2aqk7PPcKjpnVHWCQgjbxr5cugzu2F8/yPDMLt3lZDetxLgk0pXUdkIlatGFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Wed, 20 Sep 2023 13:21:38 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 13:21:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a033461b-d970-4875-9409-af0c75b1dcd2@linux.intel.com>
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
 <169513003875.2105.6876281126480171944@gjsousa-mobl2>
 <a033461b-d970-4875-9409-af0c75b1dcd2@linux.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 10:21:32 -0300
Message-ID: <169521609276.7665.8316775804745308048@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd7abe3-ac7b-417b-8a67-08dbb9dc8530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJSzDnYJN5P46/Kn+02gSBOPoHb53i857bD/cN2NdvyhI3EZ/1aS5YgnEWDUf/PcFQxPvYchaYj2GAHtx22kcNJEf6p541/RbXfG8FtXo15UB/iXyDslYV2zu2vanKM9GnZ1EiBx2SvwdPM/BXk+lKYoLfpXllVh46U2jeomQQf96igtgb6djSQQ2mWJMYAEFNtCin57EkYA5ILx4jllQzXe/HZ7NMakcd4fEVuTp0b5MuPu1WgOk3mlLcj4mKzKMNDzXGR6B0tE/1dwh57SkEZa9GFQAm5WerG4P7vjnZGEntbXe+yhBPiGmIn/uQyYTxwAov+j9nnuhKRgfHnXoAX+/3PEkH8UQyvZwVZKzH7REpbUNTUoY9KpUaDhVIwgDi0mutD/Ogt/9SM9fagxRfewmLPlSeQnMCsoyLpVtq/HzW9fUWjyFQEpyNK/I4smlMWqyMT5Kp5ftAtBN5SrU3OEOlgPND8S8BHVfT5CYd9TBkksA+sbQ9MESRfNM643t0Veao+MTaoLJOFiFzAinM4mxYva2P9sgee5AK3J7hY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199024)(186009)(1800799009)(6506007)(6666004)(6486002)(38100700002)(82960400001)(86362001)(2906002)(26005)(9686003)(966005)(6512007)(83380400001)(478600001)(8936002)(5660300002)(8676002)(4326008)(41300700001)(33716001)(44832011)(66476007)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtxMWpQZldMS1R3bG4zcitsMmVBelZOQTlXUUVsQ0F6YXh1citXM1RyRmRK?=
 =?utf-8?B?Qyt4R1NNOFlCQUVBT2ZtRlptS0k1MzJlTllwTmxFTWNMaElKNW5wVWVPRlhT?=
 =?utf-8?B?K0V1VUZNSENzZmoyZElkL1dicmMyWk5PMkFDMU9ZckNDOEFQcUdaTWFoTDY0?=
 =?utf-8?B?UmVzYWZvL2Foc3NqZWtVYjZyU0lVVFhpWEx3bTFUSDlaQ0RFMktHMUlCbGNn?=
 =?utf-8?B?Q0tLM2Rxd3ZtdVEwTGRhUG8wbjZCQXh0RjNjZDgyNFVBcGNRdUE4TGIwY3Iy?=
 =?utf-8?B?Q0RKeFkxOWpBQ2UrTXI5OCtQRzdVbHVScTQxSEg0Z3BxTGRMbzZKcEtXMjhO?=
 =?utf-8?B?STV4SHc2M1VLVnJZU0dVK1VQYWxpS1VQcjV4dzJjbUdnM1Q5amdiTnpldjJT?=
 =?utf-8?B?V09WOHN5L3FuNzRhaC83azNXZ0lGWk54bnV5M3QxUVR5OGxYeUtQa3l6TXVx?=
 =?utf-8?B?U0drNVdkKytDMERmVFQ5QkpjcURuYmJXNmpuRUFRZVdIYTRrOXlxTWZoaDFI?=
 =?utf-8?B?Umc3blVpVEN3eDg5T0ROampoVUxEZ1RpUER5WXBzQ3Z4RXFxT292MEgyY254?=
 =?utf-8?B?Y1FsbXU2ZytJcWo2b1M0cmhabTFORXpxK0ZhRHphQ0xFeW55d2wzc3oyVjRy?=
 =?utf-8?B?bTBMdmJHSnFBVk1LU3J6MkdnMm0wQ3F6WUJIMG1lbm9pREU3cGs3VWhoN1VZ?=
 =?utf-8?B?R1laWUpRbFdCSUYrdFdoQmp3L1BoakJMK3c3QWJ0L2JLUE9qUU5UVEUrcVYw?=
 =?utf-8?B?UDY0ai92QzdOY3JUV2x0K0JZaXErVnFEN0cyZTlOUFlQRE9VaElENy82V1N2?=
 =?utf-8?B?QVZVbDFhQ2JscUxtUjZDSUU0SGZodlNIUmRFbjU2UklkOUhrZkZYYW9QZVlQ?=
 =?utf-8?B?ak9vTFNpS2tOeXRibFMwUXk1UWJkQ0RBZDIyQ2Y1UjJyd3VWMDI1SlduYkg1?=
 =?utf-8?B?WUxJNUc5YVFnUDBSaEVJMWRYMHlOeDVycEJaSnNUc2I5WjNwUkc0RHI3TlBQ?=
 =?utf-8?B?RXVzQ1dERUsyQWQ0SlN0L2FYYlZLMVU1NVZ0NEZpbEplbDI1eFpTVW5HM0tm?=
 =?utf-8?B?Z1VicVZrY2VWU1BGSHBsOW0wWkxHRW53bTlVdXR0NFMyOWZJMWsyR1MyT1RK?=
 =?utf-8?B?RS81ZXFSTVArTDJhcGpDRm91M2pPdkJVM3F1WWV2WkpPY3ZtdzJoRDFRMk9U?=
 =?utf-8?B?V2ZiNyt0bG44VzFGM0VIQ3dxVG55Ukt6VC95MHEybXZvN0p5cituVFZqRHRT?=
 =?utf-8?B?bmdod3BNUkRjeERFc2RmUnFiK2pwZXdQbDhrTVJZbS9rS3ZqN04yQkp0RnJy?=
 =?utf-8?B?UXRpamJ1UDZkY0lvczg5WmtVcTZhdXBzSWdzbjRiWDdQRkFBQWpCUXZFOUc4?=
 =?utf-8?B?UDZlbWQwU0IvRzVROWhkUjFQbkpoZ0p4VUc1WUVEZi9HTXZzMWVHYUg5ci8w?=
 =?utf-8?B?Z1VmY0VJZVdiOXlndG0rMlJSWGxabTVGUHF0eFVtb3VTcDZ6alZDYVp6dHhm?=
 =?utf-8?B?Qy9vTm5sWmxkbUN4dkVpbk8xQnhqeEtFbk5ZVXBYZzk1blBRR0ltdmpjOWpP?=
 =?utf-8?B?Rys3MldCOWtQVHBlU3VjR2hYWFR0b096dEU1WkZ5Q1hZanZER0R3bGlaOS80?=
 =?utf-8?B?SFROaWVXUUNmVkphL2VOVjhPWlVSaFJVMGxXUW04K3Fmd3JFQ1kvWkRsNTIx?=
 =?utf-8?B?aVoraE1tMm85YlgrQkE3S0svNGNrRkt3T3dtNnE4c1lBeG9MQ3A5SkQyUlJG?=
 =?utf-8?B?RnJac3l5NXFaQXc5eWtUdTl5VWF5UlBUbUZTNzlJWW1yVGtlV2JpaVJMd1BD?=
 =?utf-8?B?OEo3Kzh3Z25aK0hieSt6KzJOdzRnVDN1MzduQzNWTmhmUWV3dkRJYXg3SWto?=
 =?utf-8?B?ZjVNWDBMN04zME40OTlaWlBzdHAvY25aWjJ5Z1ZOSytUV3BFMEhtQUxHZkdR?=
 =?utf-8?B?V3llQ3g2UzRjMXJveFVaZzRhRjhYNFZNdVhYcS9aQXlTYWs2a2l5UWVRK0Zj?=
 =?utf-8?B?S0pvK0ZCTjhmUXNtZ0F1bGkwM096bEVJMkdXaHNqckZzWnhWempwclNuTEtB?=
 =?utf-8?B?dE11VTl2QWxRZnBzVkFVRSt0U2pLb2RiSTNJSFUvTm11RE82bTB5Y0R4eWl6?=
 =?utf-8?B?MUdKQWQveVQwcjhFTnVKbFQ4MTdFQTAzN09ZN3F6YjVNYWswZkRpOXB3eUQw?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd7abe3-ac7b-417b-8a67-08dbb9dc8530
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:21:38.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw/WgiNpp1E5tLRxk/z9rtLWgGCmb+0x1ivRkSF53x/RsAaoB5QFEhyZCzQefrMwsgctbOiaJ3y+xjcyEB4Pww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix kernel doc warning for PMU events
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

Quoting Aravind Iddamsetty (2023-09-20 05:26:56-03:00)
>
>On 19/09/23 18:57, Gustavo Sousa wrote:
>> Quoting Aravind Iddamsetty (2023-09-19 03:36:11-03:00)
>>> Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make i=
t
>>> kernel doc format.
>>>
>>> Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")
>>>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> ---
>>> include/uapi/drm/xe_drm.h | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 63863eda8355..6ab85c7fed36 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
>>> };
>>>
>>> /**
>>> - * XE PMU event config IDs
>>> + * DOC: XE PMU event config IDs
>> That was my first thought when writing [1], but then I realized that the
>> XE_PMU_*() macros would not show up in the generated documentation.
>> Not sure if there is a special kernel-doc syntax to make them appear
>> there. Maybe we should just list them in this kernel-doc?
>
>IIUC as per Documentation/doc-guide/kernel-doc.rst it allows
>for source code comments and code itself can't be part of the comment
>so I don't think we need to list the defines in the comment.

But then the generated HTML will not contain the ids we refer by "these ID'=
s".
If we are not going to list them, maybe change the wording to help the user
locate them in the header file? Otherwise, I'm not sure it would make much =
sense
to keep this as a kernel-doc.

By the way, I built the docs locally and there is an issue with the code bl=
ock:

    (...)/Documentation/gpu/driver-uapi:24: ./include/uapi/drm/xe_drm.h:106=
3: ERROR: Error in "code-block" directive:
    maximum 1 argument(s) allowed, 13 supplied.

It just needs a line break after the code-block directive.


Gustavo Sousa

>
>
>Thanks,
>Aravind.
>>
>> [1] https://patchwork.freedesktop.org/series/123887/
>>
>>>  *
>>>  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_=
attr'
>>>  * as part of perf_event_open syscall to read a particular event.
>>> --=20
>>> 2.25.1
>>>
