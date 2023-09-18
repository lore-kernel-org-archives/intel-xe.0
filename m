Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680B4C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 13:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318B710E282;
	Mon, 18 Sep 2023 13:05:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C0D10E280
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695042326; x=1726578326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XfK8G9K5j5SGXHWPcM4tnQnl7JpUo4h2HXW1OMWosq4=;
 b=fPmMFHjsW95XF9fcEhXvXKSSXxr3X6DvNsadNqQPMIdst+oRe86J8i1O
 2mD0r1/0er+U0MAtyt9RQ+cBeZyYSZpy2Y3hWa3BzmEjLmbLg8bQXlB7r
 +ZDXmF7S77prrMVUD96LLZHer85XE+Vb8z1S3G9fdK0lgChGP98x0K2zC
 p/4PH8YQnUvWc7S0zH/EJPFMiC9JdDdplc8Znd9mO2fvUE+SIAaPDjt91
 SIzzUHA6QLJoBL2Q0m8iWpmiRE2RKPWBUjXjtLf30l+8AZvYRi3TkJ67o
 2vn62l9pq4zADaryd4ReZkTUnWhtHC3zEtsVJtvC3TAtrLZRdAXhg6OO/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359065569"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359065569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861060167"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="861060167"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 06:04:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 06:04:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 06:04:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 06:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhhWYU8Y5pJNgniu3LbDxZdcSws0Xrb33RbX9j9NKMUQriAovDNeF7ezh9eNct9mhsifb0zHFF58NB6KSxpwDc834rlHmOQ8XvsgQB8SxMtHotQc1XxBmhRv0iXBonz6B0e4vyp3qvTnQLKw7AL0L3XUJvBZwqihliPfwwDhUgPV+qzJwYvY7SvtYMOnBDRVZJBs1mFf7t8a6iCBTy6LRo7lijSBsU84bJYOhym0mR48j9q5cePB7ODn1uUWiMxzkrs/pZOLL9IdEuDSU6Ym7WDNymetvks7v8QIJ2l6xiOqe4ptUsbioWLPfHuJGDGunqAyuaA55xU2Z1rbuy0jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s73qSKspqDDIeiKTjoVUMxC8lAOUefU2jqxOvFuT5SY=;
 b=ZfAztbkJdxZ1GO+4mtIVr8+DMk5CXRyqPLXinM4WOgdDjPPHtqd74wB0qfd9tkq475sotV71v9XXct5jbj3ITd253hhsx6b/5IeOf1jkcdRn5KQbJdjrMu+ACC16RGCgwo8HTbejpRmLEau3R4by+4FmwtHVEgzuysbr4iR4L1cXTDBKBjoxSUaVGulIDxYagH28PRgzcQtVHoeMlYKTOMuoYnJAllEjqewyUzjetBKacVWIzWwsXaAPv6JmkMbbzNShSH7vYLq2N32A5BC8i4eu20VE73rDnt8Nfv6exdZ88fyynaX6Gk1TRlbzGLYD83LmleDd2Jz+lEqmvCFDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 13:04:53 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:04:53 +0000
Message-ID: <677279e2-cc68-bdb7-fae1-533aebeef8a7@intel.com>
Date: Mon, 18 Sep 2023 18:34:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com> <ZO+u6e06mWzZqX2d@intel.com>
 <CY5PR11MB6211EA7222270115D2E3DCFF95E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZPEDvQ3jSK6tqHMC@intel.com>
 <CY5PR11MB621128EC912B3A35AFCFBD6D95E4A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <864f4511a51e647cc0281c35f6e2381ee339d226.camel@intel.com>
 <CY5PR11MB6211CC4173FDB90BD3DE715D95E9A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <MW4PR11MB705656A55561E2F82A5F4A11B3E8A@MW4PR11MB7056.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <MW4PR11MB705656A55561E2F82A5F4A11B3E8A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f047832-b916-4dec-263d-08dbb847d951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8g0FnuF5KnKyTkczoRZDm3K3NRwSK7pw58vPJJInUhKKf1P9FZqON/h3OQf23zvyiFkOyUoKBMdGj8dHc1uCUgLfzsqfeWFEp6Ng8pWRo3PrhLxkoHaKrgTMxMJu0fWQvBnkH76N4MhjWvFPSDfi8neZ0tSDaUcum+zFXhyB83jlv71rtHV2avF3B5Z7ZV1E7vgt2OFlx1PD8zxsf8dKiBaITxrTdRtePZFta8aS0drlZlL9Y/W1WRB7hoTMpeWP0WYPOgWLBQihukH4n3ViCME8mjjCEdrguWiN3IkfI7PLOzN5ms2L8k8QjupsVvi++cGyIlWvlydzFj9ddFT0CR4h/9WEFYuow+QxeL3xVlYU/S/b1/4oVEdA5Swbv6tXF6jPmBIDeTLEFpZlncu5w6lwmEzRk+CeZGKIBa/cbIjrP+xnRXRovs1N+pNJXf9Q1oL+Q6iG3EZqccsChFxN9ijDgwlAI/9p4g0zoEtaDt5/+ULkiVjqFTdeNRt2hPkkChtx6rFV0Cj1MfkPyFvar3FV6jP8rvEf4NJfEV5lpuTpsAttwcwLTadwT685IrxYPPyzZlObnLRGafbJy9wy01G0dwLveCc8vI6X2DIXdDgU8AMIad06djqnUaiTdAkbunvO5MVb+JpArQUh2od1og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(26005)(82960400001)(2616005)(8936002)(8676002)(4326008)(107886003)(15650500001)(83380400001)(2906002)(30864003)(36756003)(31696002)(5660300002)(86362001)(53546011)(6506007)(6486002)(478600001)(31686004)(6666004)(6636002)(316002)(54906003)(6512007)(110136005)(66946007)(66476007)(41300700001)(66556008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDRaM0dKUnBFS091bCtYWit6QjhwUTZ1ZnhNUDBMWlBOcEtVYUYwemVrVk5H?=
 =?utf-8?B?d29mOUpiVXh0ZVF6Ym5KTkFzMHd2YkVzTE9ldnIyd2xBZzdGekJHRE9EdEZ6?=
 =?utf-8?B?ZUlHZ1Vjclc2cTFkblZJN0NyVEpmbDYyOHg5Q3pkSUdKT1hSWmRTZGVZQVZt?=
 =?utf-8?B?ek4zdEhLVVVLOWtVRGExRktQcmgrRHJmakE3S21pSzlMT2tCcENRSnRhS1hm?=
 =?utf-8?B?NGlVMkQ0MTBHR3I1YnR3M3RwY0FrNFhiYm9nL2tmUzFjaTdGRVhsbHRnMFFP?=
 =?utf-8?B?V1V5QnJSU3lEcFJWQnFQLzBjKy90eFNnclVjamJ1UnpFRUxUZkNmUVpiNWo0?=
 =?utf-8?B?ZmdDSE0yVXROU1RRUWx0MjdIc0Z3VUNaVUd6VHd5V1ozVTF5UndLV2g1SFRB?=
 =?utf-8?B?cmRjR1FPbE5BNUY2S3JhMnc4NkFxYlpXNzFPMzRWeGRzK3lTNHZIUk0ycy9x?=
 =?utf-8?B?dk11N1pDRHVWZUpZMTQwdzFTMnhzeWhOTXRJbWUyQ2VRcGd1UisyRGNOL3BR?=
 =?utf-8?B?NnJVbnc1YjhkK3ozMWpON3pQQWwwVEJRREtwYjBkU0JWSlkwa3JIUWtBcis0?=
 =?utf-8?B?bW83MERZQ1NLSTB4YVhRM2kyUUxRajRKM1MvNDgvSCtqWmVNUXhXRUxrWUxR?=
 =?utf-8?B?MmhMT291TURLQ1NLZmxPSGFlb1NVcUVUY1JoWjlaQlJqNHdZcnFaUGVLSkx4?=
 =?utf-8?B?ZXlYdUFyZ0NwL0U0M0FQTEJKc1hjVWVSSkoybzh2MzVMZ2FTd0lDc2thSWNM?=
 =?utf-8?B?MldrS3FqalRVaS9zZXhObWZqSXovaUdRVTZ6aWcxaS9JN0k1NlgxM2dRRUk1?=
 =?utf-8?B?dzFUaXR6REMzN25oZHM4T2dXN1F3TUdneVl0NWJCSGpXaytOVTVWZDZoN2tT?=
 =?utf-8?B?elFxSkkya0d0enl3d1lGbGIxWTh2ekpxNHl2RUxhaU9lWHVXTVlVQzhBWU5L?=
 =?utf-8?B?ZmpiVlUzelZCSXoyL3hzdThxcGQwSTVzcThTdloxOVhvWW1CWjBQRTRvT3NV?=
 =?utf-8?B?cFAyTGRCdnhaK2lkMFpGTCtGVktja1F0bldlU1RISmJFTG1TVmZ3anZJOXZU?=
 =?utf-8?B?b1VWVjRKYTdpUWIwQUFrak96enM1R0VHZWhnZmhOMmlBRis3Tkt0bWlOazRi?=
 =?utf-8?B?aWIyb3pEYUk1NTUzbXBBZ2IxUHhXZHFRdWNMdDJKTkM2QW1XY3VTVklNeEJC?=
 =?utf-8?B?VHhiaGVtaVRvaTBtS3Y1TFJiMjA2dm5tMW5seEkxZmYvMkw2UGUwL2hGZlNK?=
 =?utf-8?B?cHVzWVIyeHU5aVdHTkZGd1AyQlF2TEE0MEttYUFrRjhkdHVyQWhySVRGZDhs?=
 =?utf-8?B?L0ZUUXFUb1V4RzFDKzhXQjlTRHo2SC9Zdjk1WFFWdnpnODh5L2lGWm5FcGF1?=
 =?utf-8?B?YUt2Rjcybmsva0Fnd2pMRWVXUTd3cFh5VTRmdkpDcWtRMlNSekx5ZmwxRVJE?=
 =?utf-8?B?L2ZMQ1RmMFhjWGZmaG5HenREV2FjR2V3ZW5WaTc4L0RBQW5yRjg3Qlc5elF3?=
 =?utf-8?B?NDB3RG1nVE1HeHdoZG0xbmFIMm41S3B4d3UreGltaEU2aVdOSWU2R0ttYm8r?=
 =?utf-8?B?ZHlDekFmK044NVh5T1hKcW1PU0VIcVVPbFFrMld5aHg1TTFJUVdYNzRrbnll?=
 =?utf-8?B?SklhM3NhV1BNb1lLNFViWndwVkV6YlpVSXZRUWpYQXk2WGlsWng2QVJyMDFw?=
 =?utf-8?B?aGlGWnVpNnMxSjdUcVJKcjNlTkIyaHJYSGMvbzFHak0zV2FVRWhad1BFeUFi?=
 =?utf-8?B?TkE4dExGSzJzMFNDOGtkVjVHYVFvM2VYYVJHRndQTjhOR1NwMDh3bEs2bk5F?=
 =?utf-8?B?NjRLWTlUM0ZNbndnUFY4WXVSNnVHYloxNmVwMHhYY1VpZ3IvdE1YTkMwRGRK?=
 =?utf-8?B?b3JYWnA4bk5Wa0FIektReWpoUnljMUVHNU5ZUG9xQWNPQjJtcUZjTGVoQ2Ex?=
 =?utf-8?B?OXhmQ3pFcFJVWmxsL3ZvR0JCamZVMXJGYlJpYWR5R0x2MVJPY1R6Kzc0YWpL?=
 =?utf-8?B?a2ZSTjJ0SldaSC93MXRuNGNkZ0ZnTmNGeURxK0c1b01nT0Rjakg3QXVPRHRT?=
 =?utf-8?B?V0pQbmx3SGVlVW5RUncrS0gxS0tLdGJoS1NqTWhHTEdsVlhkb09mSXM1Q1c4?=
 =?utf-8?B?dURqcC92bndkUEFwVnJTZHJMNEFOdFpuVFNBL00xQTVRZWYyTHFBRFRrOUYz?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f047832-b916-4dec-263d-08dbb847d951
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:04:53.3748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvpRDvf6cU+kBK2FKe24V9GPHfmYe82FLgA/d0BwgGBzq0UxlQY3JphOHvinkcVgWir06mheTQFXG3a1pu6R9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 05-09-2023 11:02, Ghimiray, Himal Prasad wrote:
> Hi Badal,
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gupta,
>> Anshuman
>> Sent: 04 September 2023 12:03
>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
>> <matthew.auld@intel.com>
>> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
>> rpm suspend
>>
>>
>>
>>> -----Original Message-----
>>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Sent: Saturday, September 2, 2023 2:46 AM
>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>
>>> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-
>>> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
>>> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings
>>> on rpm suspend
>>>
>>> On Fri, 2023-09-01 at 03:04 +0000, Gupta, Anshuman wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>> Sent: Friday, September 1, 2023 2:49 AM
>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>
>>>>> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-
>>>>> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
>>>>> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap
>>>>> mappings on rpm suspend
>>>>>
>>>>> On Thu, Aug 31, 2023 at 01:23:40AM -0400, Gupta, Anshuman wrote:
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>>> Sent: Thursday, August 31, 2023 2:35 AM
>>>>>>> To: Nilawar, Badal <badal.nilawar@intel.com>
>>>>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>>>> xe@lists.freedesktop.org; Auld, Matthew
>>> <matthew.auld@intel.com>
>>>>>>> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap
>>>>>>> mappings on rpm suspend
>>>>>>>
>>>>>>> On Mon, Aug 28, 2023 at 10:00:31PM +0530, Nilawar, Badal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 28-08-2023 17:46, Gupta, Anshuman wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>>>>>>>>> Sent: Thursday, August 24, 2023 11:16 PM
>>>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld,
>>>>> Matthew
>>>>>>>>>> <matthew.auld@intel.com>; Vivi, Rodrigo
>>>>>>>>>> <rodrigo.vivi@intel.com>
>>>>>>>>>> Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings
>>>>>>>>>> on
>>>>> rpm
>>>>>>>>>> suspend
>>>>>>>>>>
>>>>>>>>>> Release all mmap mappings for all vram objects which are
>>>>>>>>>> associated with userfault such that, while pcie function
>>>>>>>>>> in D3hot, any access to memory mappings will raise a
>>>>>>>>>> userfault.
>>>>>>>>>>
>>>>>>>>>> Upon userfault, in order to access memory mappings, if
>>>>>>>>>> graphics function is in
>>>>>>>>>> D3 then runtime resume of dgpu will be triggered to
>>>>>>>>>> transition to
>>>>> D0.
>>>>>>>>> IMO we need a configurable threshold to control the
>>>>>>>>> behavior of mmap mappings Invalidation, if vram usages is
>>>>>>>>> crosses to certain threshold, disable the runtime PM for
>>>>>>>>> entire life time of mapping.
>>>>>>>> Agreed. Other option could be disable rpm on server descrete
>>>>>>>> graphics for entire life time of mapping. But mainitaning
>>>>>>>> threshold is more promising and gives control to user.
>>>>>>>
>>>>>>> what use cases we have here for this?
>>>>>>> I believe that for discrete we could entirely block rpm if we
>>>>>>> have display or if we have shared dma_buf. any other case we
>>>>>>> should handle?
>>>>>> If Discrete is used for display then anyhow display is going to
>>>>>> block runtime
>>>>> PM completely(be it PSR or Non-PSR).
>>>>>> The use case is with display turned off or with hybrid gpu use
>>>>>> case.
>>>>>> Currently on Xe we are missing to have mem access ref count on
>>>>>> mmap
>>>>> mapping and therefore mmap for vram bo is broken.
>>>>>> dma-buf will be also the use case in hybrid gpu use case.
>>>>>
>>>>> right. unfortunately we don't have the unmap callback.
>>>>> We could maybe get the reference on a new xe_gem_object_mmap and
>>>>> just release at xe_ttm_bo_destroy or maybe at
>>>>> xe_ttm_bo_delete_mem_notify?
>>>>>
>>>>> for the dma_buf we could probably hook the get/put to the
>>>>> attach/detach?
>>>> Hi Rodrigo,
>>>> attach/detach is already protected by mem access get/put but in my
>>>> opinion  that will going to burn more power on dgpu in hybrid case
>>>> as explained below, idle display on (display pipeline from igpu and
>>>> framebuffer is imported  from dgpu) is going to burn more power for
>>>> dgpu when it is completely idle (even igpu is idle, if it uses psr
>>>> panel to refresh then platform can go to s0ix).
>>>> Is above behavior expected ?  if not then we will need this patch.
>>>
>>> well, I'm trying to step back here and think about the use case.
>>> PSR is only a thing in eDP... so, it needs to be a laptop with both
>>> integrated and discrete where likely OEM plugged the eDP on iGFX to
>>> get better power savings.
>>>
>>> but then, the user wants to play some high-end gaming and use prime to
>>> fwd the discrete output to the eDP.
>>>
>>> But then user leaves the screen on idle most of the time instead of
>>> doing the game and burn power? :/
>>>
>>> likely this informed user could also revert the screen redirection
>>> when not really using the discrete for gaming? otherwise this user is
>>> burning power one way or another right?!
>>>
>>> Also, on this PSR case here, we would go idle allow the D3cold on
>>> discrete every idle second and do the trick to get the page-fault and
>>> enable everything to bring the 'primed' display back on time?
>> AFAIU most of cases like on DG2 wake-up from d3(d3hot/d3cold) will be
>> caused by migration(with explicit mem ref count),  or by respective
>> submission on render.
>> This use is about both d3hot/d3cold, not only specific to d3cold.
>> Thanks,
>> Anshuman Gupta.
>>>
>>> I can see so many issues coming out of this scenario, that I tend to
>>> prefer to simply avoid the RPM if user explicitly redirected the screen.
>>>
>>> We should keep it simple.
>>>
>>>> Thanks,
>>>> Anshuman Gupta.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Anshuman Gupta.
>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Badal
>>>>>>>>> Thanks,
>>>>>>>>> Anshuman Gupta
>>>>>>>>>>
>>>>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/gpu/drm/xe/xe_bo.c           | 53
>>>>>>> ++++++++++++++++++++++++++--
>>>>>>>>>>    drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>>>>>>>>>>    drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>>>>>>>>>>    drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>>>>>>>>>>    drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>>>>>>>>>>    5 files changed, 85 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_bo.c index
>>>>>>>>>> 1ab682d61e3c..4192bfcd8013
>>>>>>>>>> 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>>>> @@ -776,6 +776,18 @@ static int xe_bo_move(struct
>>>>>>>>>> ttm_buffer_object *ttm_bo, bool evict,
>>>>>>>>>>                  dma_fence_put(fence);
>>>>>>>>>>          }
>>>>>>>>>>
>>>>>>>>>> +       /*
>>>>>>>>>> +       * TTM has already nuked the mmap for us (see
>>>>>>>>>> ttm_bo_unmap_virtual),
>>>>>>>>>> +       * so if we moved from VRAM make sure to unlink
>>>>>>>>>> this from
>>>>> the
>>>>>>>>>> userfault
>>>>>>>>>> +       * tracking.
>>>>>>>>>> +       */
>>>>>>>>>> +       if (mem_type_is_vram(old_mem_type)) {
>>>>>>>>>> +               spin_lock(&xe-
>>>>>>>>>>> mem_access.vram_userfault_lock);
>>>>>>>>>> +               if (!list_empty(&bo-
>>>>>>>>>>> vram_userfault_link))
>>>>>>>>>> +                       list_del_init(&bo-
>>>>>>>>>>> vram_userfault_link);
>>>>>>>>>> +               spin_unlock(&xe-
>>>>>> mem_access.vram_userfault_lock);
>>>>>>>>>> +       }
>>>>>>>>>> +
>>>>>>>>>>          xe_device_mem_access_put(xe);
>>>>>>>>>>          trace_printk("new_mem->mem_type=%d\n", new_mem-
>>>>>>>>>>> mem_type);
>>>>>>>>>>
>>>>>>>>>> @@ -1100,6 +1112,8 @@ static vm_fault_t
>>>>>>>>>> xe_gem_fault(struct vm_fault
>>>>>>>>>> *vmf)  {
>>>>>>>>>>          struct ttm_buffer_object *tbo = vmf->vma-
>>>>>> vm_private_data;
>>>>>>>>>>          struct drm_device *ddev = tbo->base.dev;
>>>>>>>>>> +       struct xe_bo *bo = ttm_to_xe_bo(tbo);
>>>>>>>>>> +       struct xe_device *xe = to_xe_device(ddev);
>>>>>>>>>>          vm_fault_t ret;
>>>>>>>>>>          int idx, r = 0;
>>>>>>>>>>
>>>>>>>>>> @@ -1107,9 +1121,10 @@ static vm_fault_t
>>>>>>>>>> xe_gem_fault(struct vm_fault
>>>>>>>>>> *vmf)
>>>>>>>>>>          if (ret)
>>>>>>>>>>                  return ret;
>>>>>>>>>>
>>>>>>>>>> -       if (drm_dev_enter(ddev, &idx)) {
>>>>>>>>>> -               struct xe_bo *bo = ttm_to_xe_bo(tbo);
>>>>>>>>>> +       if (tbo->resource->bus.is_iomem)
>>>>>>>>>> +               xe_device_mem_access_get(xe);
>>>>>>>>>>
>>>>>>>>>> +       if (drm_dev_enter(ddev, &idx)) {
>>>>>>>>>>                  trace_xe_bo_cpu_fault(bo);
>>>>>>>>>>
>>>>>>>>>>                  if (should_migrate_to_system(bo)) { @@ -
>>>>>>>>>> 1127,10
>>>>> +1142,25
>>>>>>> @@
>>>>>>>>>> static vm_fault_t xe_gem_fault(struct vm_fault
>>>>>>>>>> *vmf)
>>>>>>>>>>          } else {
>>>>>>>>>>                  ret = ttm_bo_vm_dummy_page(vmf,
>>>>>>>>>> vmf->vma-
>>>>>>>>>>> vm_page_prot);
>>>>>>>>>>          }
>>>>>>>>>> +
>>>>>>>>>>          if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>>>>>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>>>>>> -               return ret;
>>>>>>>>>> +               goto out_rpm;
>>>>>>>>>> +       /*
>>>>>>>>>> +        * ttm_bo_vm_reserve() already has dma_resv_lock.
>>>>>>>>>> +        * vram_userfault_count is protected by dma_resv
>>>>>>>>>> lock and
>>>>>>>>>> +rpm
>>>>>>>>>> wakeref.
>>>>>>>>>> +        */
>>>>>>>>>> +       if (ret == VM_FAULT_NOPAGE &&
>>>>>>>>>> xe_device_mem_access_ongoing(xe) && !bo-
>>>>>> vram_userfault_count)
>>>>>>> {
>>>>>>>>>> +               bo->vram_userfault_count = 1;
>>>>>>>>>> +               spin_lock(&xe-
>>>>>>>>>>> mem_access.vram_userfault_lock);
>>>>>>>>>> +               list_add(&bo->vram_userfault_link, &xe-
>>>>>>>>>>> mem_access.vram_userfault_list);
>>>>>>>>>> +               spin_unlock(&xe-
>>>>>> mem_access.vram_userfault_lock);
>>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +XE_WARN_ON(!tbo->resource->bus.is_iomem);
>>>>>>>>>> +       }
>>>>>>>>>>          dma_resv_unlock(tbo->base.resv);
>>>>>>>>>> +out_rpm:
>>>>>>>>>> +       if(tbo->resource->bus.is_iomem &&
>>>>>>>>>> xe_device_mem_access_ongoing(xe))
>>>>>>>>>> +               xe_device_mem_access_put(xe);
>>>>>>>>>>          return ret;
>>>>>>>>>>    }
>>>>>>>>>>
>>>>>>>>>> @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct
>>>>>>>>>> drm_file *file_priv,
>>>>>>>>>>          return err;
>>>>>>>>>>    }
>>>>>>>>>>
>>>>>>>>>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo
>>>>> *bo) {
>>>>>>>>>> +       struct ttm_buffer_object *tbo = &bo->ttm;
>>>>>>>>>> +       struct ttm_device *bdev = tbo->bdev;
>>>>>>>>>> +
>>>>>>>>>> +       drm_vma_node_unmap(&tbo->base.vma_node, bdev-
>>>>>>>>>>> dev_mapping);
>>>>>>>>>> +
>>>>>>>>>> +       /*
>>>>>>>>>> +        * We have exclusive access here via runtime
>>>>>>>>>> suspend. All
>>>>>>>>>> +other
>>>>>>>>>> callers
>>>>>>>>>> +        * must first grab the rpm wakeref.
>>>>>>>>>> +        */
>>>>>>>>>> +       XE_WARN_ON(!bo->vram_userfault_count);
>>>>>>>>>> +       list_del(&bo->vram_userfault_link);
>>>>>>>>>> +       bo->vram_userfault_count = 0; }
>>>>>>>>>> +
>>>>>>>>>> +
>>>>>>>>>>    #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>>>>>>>>>    #include "tests/xe_bo.c"
>>>>>>>>>>    #endif
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_bo.h index
>>>>>>>>>> 0823dda0f31b..6b86f326c700
>>>>>>>>>> 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>>>>>>>>> @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct
>>>>>>>>>> drm_device *dev, void *data,
>>>>>>>>>>                          struct drm_file *file);
>>>>>>>>>>    int xe_gem_mmap_offset_ioctl(struct drm_device *dev,
>>>>>>>>>> void
>>>>> *data,
>>>>>>>>>>                               struct drm_file *file);
>>>>>>>>>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo
>>>>> *bo);
>>>>>>>>>> +
>>>>>>>>>>    int xe_bo_dumb_create(struct drm_file *file_priv,
>>>>>>>>>>                        struct drm_device *dev,
>>>>>>>>>>                        struct drm_mode_create_dumb
>>>>>>>>>> *args); diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_bo_types.h
>>>>>>>>>> index f6ee920303af..cdca91a378c4 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>>>>>>>>> @@ -68,6 +68,12 @@ struct xe_bo {
>>>>>>>>>>          struct llist_node freed;
>>>>>>>>>>          /** @created: Whether the bo has passed initial
>>>>>>>>>> creation */
>>>>>>>>>>          bool created;
>>>>>>>>>> +       /**
>>>>>>>>>> +        * Whether the object is currently in fake
>>>>>>>>>> +offset
>>>>>>>>>> mmap
>>>>>>>>>> +backed by
>>>>>>>>>> vram.
>>>>>>>>>> +        */
>>>>>>>>>> +       unsigned int vram_userfault_count;
>>>>>>>>>> +       struct list_head vram_userfault_link;
>>>>>>>>>> +
>>>>>>>>>>    };
>>>>>>>>>>
>>>>>>>>>>    #endif
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>>>>> index 750e1f0d3339..c345fb483af1 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>>>>> @@ -328,6 +328,26 @@ struct xe_device {
>>>>>>>>>>          struct {
>>>>>>>>>>                  /** @ref: ref count of memory accesses
>>>>>>>>>> */
>>>>>>>>>>                  atomic_t ref;
>>>>>>>>>> +               /*
>>>>>>>>>> +                *  Protects access to vram usefault
>>>>>>>>>> list.
>>>>>>>>>> +                *  It is required, if we are outside of
>>>>>>>>>> the runtime
>>>>>>>>>> +suspend
>>>>>>>>>> path,
>>>>>>>>>> +                *  access to @vram_userfault_list
>>>>>>>>>> requires always
>>>>> first
>>>>>>>>>> grabbing the
>>>>>>>>>> +                *  runtime pm, to ensure we can't race
>>>>>>>>>> against
>>>>> runtime
>>>>>>>>>> suspend.
>>>>>>>>>> +                *  Once we have that we also need to
>>>>>>>>>> grab
>>>>>>>>>> @vram_userfault_lock,
>>>>>>>>>> +                *  at which point we have exclusive
>>>>>>>>>> access.
>>>>>>>>>> +                *  The runtime suspend path is special
>>>>>>>>>> since it
>>>>> doesn't
>>>>>>>>>> +really
>>>>>>>>>> hold any locks,
>>>>>>>>>> +                *  but instead has exclusive access by
>>>>>>>>>> virtue of all
>>>>> other
>>>>>>>>>> accesses requiring
>>>>>>>>>> +                *  holding the runtime pm wakeref.
>>>>>>>>>> +                */
>>>>>>>>>> +               spinlock_t vram_userfault_lock;
>>>>>>>>>> +
>>>>>>>>>> +               /*
>>>>>>>>>> +                *  Keep list of userfaulted gem obj,
>>>>>>>>>> which require to
>>>>>>>>>> +release
>>>>>>>>>> their
>>>>>>>>>> +                *  mmap mappings at runtime suspend
>>>>>>>>>> path.
>>>>>>>>>> +                */
>>>>>>>>>> +               struct list_head vram_userfault_list;
>>>>>>>>>> +
>>>>>>>>>> +               bool vram_userfault_ongoing;
>>>>>>>>>>          } mem_access;
>>>>>>>>>>
>>>>>>>>>>          /** @d3cold: Encapsulate d3cold related stuff */
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_pm.c index
>>>>>>>>>> 0f06d8304e17..51cde1db930e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>>>>>>> @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device
>>>>>>>>>> *xe)
>>>>>>>>>>          }
>>>>>>>>>>
>>>>>>>>>>          xe_pm_runtime_init(xe);
>>>>>>>>>> +       INIT_LIST_HEAD(&xe-
>>>>>>>>>>> mem_access.vram_userfault_list);
>>>>>>>>>> +       spin_lock_init(&xe-
>>>>>>>>>>> mem_access.vram_userfault_lock);
>>>>>>>>>>    }
>>>>>>>>>>
>>>>>>>>>>    void xe_pm_runtime_fini(struct xe_device *xe) @@
>>>>>>>>>> -205,6
>>>>>>>>>> +207,7 @@ struct task_struct
>>>>>>>>>> *xe_pm_read_callback_task(struct xe_device
>>>>>>>>>> *xe)
>>>>>>>>>>
>>>>>>>>>>    int xe_pm_runtime_suspend(struct xe_device *xe)  {
>>>>>>>>>> +       struct xe_bo *bo, *on;
>>>>>>>>>>          struct xe_gt *gt;
>>>>>>>>>>          u8 id;
>>>>>>>>>>          int err = 0;
>>>>>>>>>> @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct
>>>>>>>>>> xe_device
>>>>>>> *xe)
>>>>>>>>>>           */
>>>>>>>>>>
>>>>>          lock_map_acquire(&xe_device_mem_access_lockdep_map);
>>>>>>>>>>
>>>>>>>>>> +       list_for_each_entry_safe(bo, on,
>>>>>>>>>> +                                &xe-
>>>>>> mem_access.vram_userfault_list,
>>>>>>>>>> vram_userfault_link)
>>>>>>>>>> +
>>>>>>>>>> +xe_bo_runtime_pm_release_mmap_offset(bo);
> Why don’t we always evict the mmap buffer object ?
When does these BOs will be restored? Especially the non-pinned one.

Regards,
Badal
> BR
> Himal
>>>>>>>>>> +
>>>>>>>>>>          if (xe->d3cold.allowed) {
>>>>>>>>>>                  err = xe_bo_evict_all(xe);
>>>>>>>>>>                  if (err)
>>>>>>>>>> --
>>>>>>>>>> 2.25.1
>>>>>>>>>
> 
