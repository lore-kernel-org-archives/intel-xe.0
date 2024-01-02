Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB552C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 07:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89910E121;
	Tue,  2 Jan 2024 07:09:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5598810E121
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704179395; x=1735715395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vCiymWCaHJkLjflayBenOEF8v4MUjbFkSAACMmTj3BQ=;
 b=A8PwGeKeCfJqU/wQAEvClQFYT1CU0eCYrY+qOEVcFmDmnoOAipSDulmY
 a6jAUEaSv7wfPJouGcOZqLYe4d+phEp8yX6ADKksNr851Z7G2yFWx0k1B
 REdM5aK+VHcFHLkUNjD/uKFxcCguX81s/CLyMu7HcYDEIRSgU8xLvcWts
 7Metj9OFe/OyHZGY+BEhGxiu0v+aTmCx1X7olI7ciB1UGp4ttDjJh4G/P
 9qNwj/fG1WF4E/FQiSdhyJVWU2spP+AKZ8LPLHeQ/ec6yw82N5xmwIKtr
 xsycP3aa7VKNXxHwVh1CuT/hZuRNfTRJiMO6GjcpFHG8PQFX0vof3HQD5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3923078"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3923078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2024 23:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="845486690"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="845486690"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2024 23:09:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 23:09:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 23:09:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jan 2024 23:09:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Jan 2024 23:09:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYoqrdqhY9PvqQS83avPr65zaHSHq3p8mQ7Mu+Rdy+ZSXkuTFM7JrCviwvfcLGhVqJNs1CRY8HjRLwGkQsCKIBbqz5heeIA3XzQdqH+A9MhFOau6TByWe/Wz419nhCcFHB1NyMv1mtAy3x6vLk9y65lbE48+G5OSeCYnu83ltPrPD0NXeF2tAT62Ky2CfFbrGmoW5bPOMz85Q4vD0VEQuWT/c/rfr0G9PhxWoIG1LvWUmoi5qKxap9Fb9RPvdET1IkR3L/D22pYpHFBeXpDvFz8/4Y6KywddwbC9h+HewqVX8IjPi5pLSFwenmbc8W1bWNC23wBcPTk0V9tJPQ5vTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id+r8PqTkFQNF62/arRtR0xxYJA6ED2Xlahedwi8Yuw=;
 b=NDMYd4gMZ0/WFBNeiqO4VyyKzPX15ZMpuTmxM5N9H3bXbm+xXktIlt6YcHYKpBwqOa1u9zbMtSDws/9uyC5N0CDmoMpw4c49+rVGlPuwO09AsN7grCvrvzjSlGgWvshZ5uHvCCg00MmFV/dvIEBaa1wMx6q27zjL/6jRUGfwlYA5xB8OrCQVGb0iX32W8rYpdfh5JyRj+7v0zPh+pWq6qQLK8yEf+4Z+oROAewebnG2o9G4C7VwlK3lAJCSBrKg685kan92M4jzUMlUP3U/U3hLJ1mfMw9DM+Cz/ptlNLLFOjHhWVyj/5vKUl8VKebSClpsC9bygpJFOdRQmfBtyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 07:09:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 07:09:50 +0000
Message-ID: <c518b135-1895-4186-8437-e33c0dd6c79f@intel.com>
Date: Tue, 2 Jan 2024 12:39:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
Content-Language: en-US
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
 <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <9c0e0cda-5768-4c0a-973e-74ecfdf2ce8b@intel.com>
 <CY5PR11MB62110375C2241F8AE3AFFE99959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <3f701189-fb71-493b-ba7f-7699df458fa1@intel.com>
 <835dc339-16bd-4a5d-beb5-c3ab51262f8d@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <835dc339-16bd-4a5d-beb5-c3ab51262f8d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 6967aecf-842d-4006-a25b-08dc0b61cf47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpUneZo5nyNCPbqlhSkZSjseq7Pq7rW30HQApOlmBAQ/HbRNRIRUx7W2t6PrCfEWl4ZJeCDl50SPJtQWYPDppQN/VABmuBVuQgWU+n5Rg6k6dITTeLdFKeFRDN2OKYDxUxvMaDdQcYmBZkwx6VsQKVXV0PNIvqQr2gprdGW57SWT7t9NXnVoc500+j5of3X6d/R2oFaFO3TQA1dkqzqsnx+FhKv2FoL7faHk+b3lx9kU7YJqyJenNxUBFJvjYlTj/NG1quhX+ERc2pi7OrDt6uMKkfJtKMQOTI5+Cl0YWEzGnrJ8F0nf4IOkZ7D1D6adno9OnDJLHITH+We8ETSZAoTgnRHMRNXsASE4uyQl70raYpqM7KsIX9LbBgjMY6jJ2roTBfnRGabpY8Q4hJSFHMf/XgY7bJblhHKbnHSKkc2c5ei1GweZ2lVHmJTlgSZZb5pC9hIk2XzR0ExnbY+FPHDpVff1vTq3Ws0KaaeqwLo99/RkQZDOBjUpADIRDIXckOIkNJ6lqb9z7u9AVVSTtpUF5MrVxwoGKdhaaqUHHstnGwjbTmDJ/xTXJEHDvFjsIMieirB1XTE5KhNuLlhvnWvFW3hNT5ZBUcV/oJFHH0Q4rgDq65D1IoPyjDakencP4Kx3hDCwxkFMp+Bd29vwow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82960400001)(38100700002)(36756003)(31686004)(31696002)(86362001)(6506007)(6512007)(53546011)(6666004)(83380400001)(478600001)(4326008)(66946007)(44832011)(66556008)(6486002)(66476007)(107886003)(26005)(110136005)(8936002)(8676002)(2616005)(316002)(41300700001)(2906002)(30864003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpoS1gxMk91NzV3UUJxRlA0Mk0vMWltbWJsS0dnMWNTQUd4N0ROcjZTOG5m?=
 =?utf-8?B?UE9MTnd0cWFBWjN0TUJidk9JaTdtbkZOUW9vK2Q4NEI2N1pRMGVNSzU3c0ly?=
 =?utf-8?B?MGM3bmRkZVVNcmhxdWk5ZzJIL3lSbEh5NERpTVNZKzlWeDFnb3J1TUc1K1Ba?=
 =?utf-8?B?ME5lMHdPelFqN09Tb0dRVllzTWFVK1NBaGloUVlOR2M4bWpZQzRLOGJzN1Zy?=
 =?utf-8?B?aVNBYjZmOUJGV2EwMUZmOW5sN3ZSTmxycmpNOGFUdGtsU2dnWUxqNmE2VUpw?=
 =?utf-8?B?Y3hyTkgxTVc3NU5TelRBNzM1T291cjBUdkpLWk0vdW94WmFLbnFjOE9WUzJJ?=
 =?utf-8?B?WnVjZUxTRFdtSTZmMTErVVFTZ2RUeGJiUlllTGp6Vk9iYTViL2tXVzNuWndP?=
 =?utf-8?B?QzFoRTUvT0V5clM0UUloS2piK1c3TFIzUXBrQlU0NHBmU0txRktGQzFvdEZR?=
 =?utf-8?B?alNjMDF2MEVNcUpVYndSMlp3K3hpbkNCK1pPbHpMRS84bFV6bnNtWm5LNDFs?=
 =?utf-8?B?NTVySnE0TjlsMmhVOW5SeXQrZmV0QU1HdjdleWtobzZnTzI1UEp1b053WnBV?=
 =?utf-8?B?eE5aMUxSYUdVWTNrUncyUE5TSmEyZ3FzNVE3a1R4VFh1S2pFaTJYSzZ4dDZ5?=
 =?utf-8?B?RXNsM0djTjRndFBQejZXMHVFOUdCNVV2TmY1cTRyb0dyS082anJoSlBRRHF5?=
 =?utf-8?B?dGhGUHRlSVdENUUrTzZSRkVzdFBISVhhbWxtRnFJdmFsby9nVzRBajBpaFpj?=
 =?utf-8?B?SE5tNVZ4MWFlbEx4TzVkWW1FMXd5U3hjTllJdktYWUVFWWMzZE5nOXRwUUJi?=
 =?utf-8?B?c05wN011UWpRcmY1R3J1UDdRcWtIcjdISzhWTzBsTjZQTkRSbFdKbUVEUXRT?=
 =?utf-8?B?aUJlVmNzUEFCblFhZ0VaUlNXRnBCcDNPNHdOYVQ0bFhnVzBsK01XTnU3QVl2?=
 =?utf-8?B?c3Y2b2dXZk1VUUtYRUxtMkhWcThjWnh0ZFRGQ1NRamtVbVAvcWtRSWNPU21F?=
 =?utf-8?B?NkVDcW1hdWVTZHZnMGFYZWdaaGU5TmpJV3h2aXkwRDFVSnE1NmhrdmsvSUtT?=
 =?utf-8?B?YmZCaE9MaHhvOGNEd3NZZUkrNWkyWEo2WnJkOVM0Y2g5VThNdXBGSTFETTFQ?=
 =?utf-8?B?ZWxld2JFSXBrcDVublJFZVFLbUpvaTJpK2lsTzF0dTBiMkIzNENNSmZHaVIv?=
 =?utf-8?B?RGNZeEwrbUF1Y1ZJYW5RUXJER3FLekN3Q0lxNzZDc2k4UVB4TjNkWTZxTzNB?=
 =?utf-8?B?VEY5THhYVVNkWnRsY2tIMUxZMFJ0MlNoVk9wZ1VDbG5SdWpqNzk2YlZ6RXVO?=
 =?utf-8?B?dkJhdHJ5czVXT1B3ZVlGT2p0bmNGenhVZTkyTU5rOW1Ma0NFdUxBT2FHdkp2?=
 =?utf-8?B?WlZuM01wTU5VWDhDSmZLeksvN205YUcvN1NLSmx3bi9uS29uYmkrczRPdlpk?=
 =?utf-8?B?cEJwNjFYWXlhR2IvOWdPZG9VR0FBemNJS3RwTlpZN0owcUFKMEllcy93WkFh?=
 =?utf-8?B?WHhkdDJXUlFvcnJMem5lV0RTMExQTUZBYmQremNMOURQWGNpdHVzWUFjcGxk?=
 =?utf-8?B?T3drUXBoMmlMOUd2VjdKWkdrT2xUUW5oYmRKYzl1NHkxemJCcjNBZUc1N1RO?=
 =?utf-8?B?cjlnbC9XMWIvTjV4MEM3a0RLNzE5emFjTDl1YUVDcEo4VmpXS0luZkp1RnJ1?=
 =?utf-8?B?dnFkbksyYzhUM2ZGeGxBQXpHYzFWNEl0ZnoybzlGdGZldUFWTzVMN1ovNity?=
 =?utf-8?B?bzFWdTRTK2ZITGljcmR5cDZJbWVEZUlzbURVUlFJa2EzSDhSZWU3Q3F2VE05?=
 =?utf-8?B?cU5DYmdYWnBkTlkvU21JS25jeWFYSXM2SmNsbUdMYjRPcGEvV0o2dDQzYy9O?=
 =?utf-8?B?czVyaGFrcmNENTBxUmJKSEJNQ2VpWnRoRTRoN21CVC83QlhxQ3A3aFlDQWNa?=
 =?utf-8?B?SlAwaXlIaGM3SC81OTF3QzhwVWlqdDlTbUhqb0dNN2tYNkNUUk1SOE85eGdM?=
 =?utf-8?B?NTJZWjhIZG00Y2JiUmg2SzFLQytGbVpvWDF3ckM3WmtJdHZKOEp6K3VpamJw?=
 =?utf-8?B?REpXVzljZ1V3NXdxQlhURHY4ZXBwc0tBNkJuR2pJTHNVSkVJR3ZuS1JZazFr?=
 =?utf-8?Q?nSmvaaM+XsXi/Rf9myowJ719W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6967aecf-842d-4006-a25b-08dc0b61cf47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 07:09:50.1215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuvGlXgAVpT9ICooTi02z1mYx0rk65bJYsrtVq4Fg8+lOTt0XViwDZcknY9DZGoTwJd0YI7biMPauATQmagUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Suja

On 12/28/2023 3:34 PM, Sundaresan, Sujaritha wrote:
> 
> On 12/27/2023 5:48 PM, Sundaresan, Sujaritha wrote:
>>
>> On 12/27/2023 4:26 PM, Gupta, Anshuman wrote:
>>>
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Wednesday, December 27, 2023 3:01 PM
>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>
>>>>
>>>> On 12/26/2023 7:58 PM, Gupta, Anshuman wrote:
>>>>>> -----Original Message-----
>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>> Sent: Tuesday, December 26, 2023 10:02 AM
>>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>>> xe@lists.freedesktop.org
>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>>>
>>>>>>
>>>>>> On 12/22/2023 7:34 PM, Gupta, Anshuman wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>>>> Sent: Friday, December 22, 2023 4:37 PM
>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>>>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>>>>>
>>>>>>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>>>>>>
>>>>>>>> /device/tile#/memory/freq0
>>>>>>>>             |-max_freq
>>>>>>>>             |-min_freq
>>>>>>>>
>>>>>>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>>>>>>
>>>>>>>> v3: Add documentation for new sysfs (Riana)
>>>>>>>>        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>>>>>>
>>>>>>>> v4: Create sysfs under tile#/freq0 after removal of
>>>>>>>>        physical_memsize attrbute
>>>>>>>>
>>>>>>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>>>>>>        Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>>>>>>
>>>>>>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>>>>>>        Fix review comments (Rodrigo)
>>>>>>>>
>>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
>>>>>>>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
>>>>>>>> ++++++++++++++++++++++++++++++
>>>>>>>>     2 files changed, 93 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>>> index 5935cfe30204..f153ce96f69a 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>>> @@ -42,6 +42,13 @@
>>>>>>>>     #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed
>>>>>>>> point format */
>>>>>>>>     #define        POWER_SETUP_I1_DATA_MASK
>>>>>>>>     REG_GENMASK(15, 0)
>>>>>>>>
>>>>>>>> +#define   PCODE_FREQUENCY_CONFIG        0x6e
>>>>>>>> +/* Frequency Config Sub Commands (param1) */
>>>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>>>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>>>>>>>> +/* Domain IDs (param2) */
>>>>>>>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>>>>>>>> +
>>>>>>>>     struct pcode_err_decode {
>>>>>>>>         int errno;
>>>>>>>>         const char *str;
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> index 0f8d3e7fce46..cdc9dbbc97b0 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> @@ -7,9 +7,21 @@
>>>>>>>>     #include <linux/sysfs.h>
>>>>>>>>     #include <drm/drm_managed.h>
>>>>>>>>
>>>>>>>> +#include "xe_gt_types.h"
>>>>>>>> +#include "xe_pcode.h"
>>>>>>>> +#include "xe_pcode_api.h"
>>>>>>>>     #include "xe_tile.h"
>>>>>>>>     #include "xe_tile_sysfs.h"
>>>>>>>>
>>>>>>>> +/**
>>>>>>>> + * DOC: Xe Tile sysfs
>>>>>>>> + *
>>>>>>>> + * Provides sysfs entries for frequency in tile
>>>>>>>> + *
>>>>>>>> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
>>>>>>>> configuration and read-only.
>>>>>>> Let's increase verbosity of doc something explaining it is a fixed
>>>>>>> fuse point not a
>>>>>> configuration.
>>>>>> Sure
>>>>>>>> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
>>>>>>>> configuration and read-only.
>>>>>>>> + */
>>>>>>>> +
>>>>>>>>     static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>>>>>>>         kfree(kobj);
>>>>>>>> @@ -20,6 +32,65 @@ static const struct kobj_type
>>>>>>>> xe_tile_sysfs_kobj_type = {
>>>>>>>>         .sysfs_ops = &kobj_sysfs_ops,
>>>>>>>>     };
>>>>>>>>
>>>>>>>> +static ssize_t max_freq_show(struct device *kdev, struct
>>>>>>>> +device_attribute
>>>>>>>> *attr,
>>>>>>>> +                 char *buf)
>>>>>>>> +{
>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>>>>>> +    u32 val, mbox;
>>>>>>>> +    int err;
>>>>>>>> +
>>>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>>>> +
>>>>>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>>>> +    if (err)
>>>>>>>> +        return err;
>>>>>>>> +
>>>>>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>>>>>> +    val *= 50;
>>>>>>>> +
>>>>>>>> +    return sysfs_emit(buf, "%u\n", val); } static
>>>>>>>> +DEVICE_ATTR_RO(max_freq);
>>>>>>>> +
>>>>>>>> +static ssize_t min_freq_show(struct device *kdev, struct
>>>>>>>> +device_attribute
>>>>>>>> *attr,
>>>>>>>> +                 char *buf)
>>>>>>>> +{
>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>> If you are missing to create a kobject for freq0 , then this should
>>>>>>> be
>>>>>>> kobj->parent->parent.
>>>>>> I don't think a kobject is needed for freq0, since it we are only
>>>>>> using attribute_group for it.
>>>>>>
>>>>>> Similar to throttle_reasons.
>>>>> Sure,  thanks for explanation.
>>>>>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>>>>>> +    u32 val, mbox;
>>>>>>>> +    int err;
>>>>>>>> +
>>>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>>>> +
>>>>>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>>>> +    if (err)
>>>>>>>> +        return err;
>>>>>>>> +
>>>>>>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>>>>>> +    val *= 50;
>>>>>>>> +
>>>>>>>> +    return sysfs_emit(buf, "%u\n", val); } static
>>>>>>>> +DEVICE_ATTR_RO(min_freq);
>>>>>>>> +
>>>>>>>> +static struct attribute *freq_attrs[] = {
>>>>>>>> +    &dev_attr_max_freq.attr,
>>>>>>>> +    &dev_attr_min_freq.attr,
>>>>>>>> +    NULL
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static const struct attribute_group freq_group_attrs = {
>>>>>>>> +    .name = "freq0",
>>>>>>>> +    .attrs = freq_attrs,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>     static void tile_sysfs_fini(struct drm_device *drm, void 
>>>>>>>> *arg)  {
>>>>>>>>         struct xe_tile *tile = arg;
>>>>>>>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>         struct xe_device *xe = tile_to_xe(tile);
>>>>>>>>         struct device *dev = xe->drm.dev;
>>>>>>>>         struct kobj_tile *kt;
>>>>>>>> +    struct kobject *kobj;
>>>>>>>>         int err;
>>>>>>>>
>>>>>>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 
>>>>>>>> @@ void
>>>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>
>>>>>>>>         tile->sysfs = &kt->base;
>>>>>>>>
>>>>>>>> +    if (xe->info.platform == XE_PVC) {
>>>>>>>> +        kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>> How freq0 is getting added, I am unable to see the freq0 kobject as
>>>>>>> per the path
>>>>>> "device/tile#/memory/freq0/"
>>>>>> freq0 is being added as an attribute group. It is similar to the
>>>>>> throttle_reasons implementation.
>>>>>>>> +        if (!kobj)
>>>>>>>> +            drm_warn(&xe->drm, "failed to add memory
>>>>>>>> directory, err: %d\n", -ENOMEM);
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (kobj && xe->info.platform == XE_PVC) {
>>>>>>>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>>>>>>>> +        if (err) {
>>>>>>>> +            drm_warn(&xe->drm, "failed to register vram freq
>>>>>>>> sysfs, err: %d\n", err);
>>>>>>>> +            return;
>>>>>>>> +        }
>>>>>>>> +    }
>>>>>>> Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?
>>>>>>> Have you made sure kmemleak won't complain here on memory leak ?
>>>>> Check the kobject_release() , this will only get call , when all 
>>>>> ref count of that
>>>> kobj is being put.
>>>>> Here you are creating a object and it will never be released.
>>>>> Also  we need to call  the sysfs_remove_group() as well in fini 
>>>>> function ?
>>>>>
>>>>> Thanks,
>>>>> Anshuman.
>>>> This is a bit of unique case. In this file we have two issues that 
>>>> keeps us from
>>>> cleaning up like others.
>>> Current patch looks broken to me, this will leak the kobject on 
>>> module unload.
>>> Please check kmemleak after module unload.
>>>> One, we need to cleanup the base tile directory here. And second, we 
>>>> are
>>>> creating the kobject only for PVC. If we add the "memory" kobject 
>>>> cleanup to
>>>> fini, we will be defining tile using kobj. This is causing an error 
>>>> on unload,
>>>> despite adding platform conditions on fini.
>>> You may try by changing the type of void *arg to "memory" kob to fini 
>>> function ?
>>>> After testing multiple iterations of the fini function, this was the 
>>>> cleanest way
>>>> with no errors that worked across platforms.
>>>>
>>>> If needed, the only way to accommodate the kobject_put(kobj) and the
>>>> sysfs_remove_group is to move the vram sysfs creation to a separate 
>>>> file,
>>>> similar to throttle_reasons and gt_freq.
>>> I think it is needed for a functional working patch, if it can not be 
>>> handled by using
>>> "void *arg" in fini function.
I think you can try something similar to the below file
xe_hw_engine_class_sysfs.c

Has different functions for different hierarchy of kobjects.

Thanks
Riana
>>>
>>> Thanks,
>>> Anshuman Gupta.
>>
>> Since this is bit contentious even though the patch is functional, I 
>> will move these sysfs out of xe_tile_sysfs.c to it own new file.
>>
>> This should clear up everything.
>>
>> Thanks,
>>
>> Suja
> 
> Hi Anshuman,
> 
> I've moved everything to a new file called xe_vram_freq.c/h . All 
> kmemleaks and unload/reload checks are clean.
> 
> Let me know if the naming works.
> 
> The documentation added is as below, let me know if any tweaks are needed;
> 
> /**
> * DOC: Xe VRAM freq
> *
> * Provides sysfs entries for vram frequency in tile
> *
> * device/tile#/memory/freq0/max_freq - This is maximum frequency. This 
> value is read-only as it
> *         is the fixed fuse point P0. It is not the system
> *         configuration frequency.
> * device/tile#/memory/freq0/min_freq - This is minimum frequency. This 
> value is read-only as it
> *         is the fixed fuse point PN. It is not the system
> *          configuration frequency.
> */
> 
> Thanks,
> 
> Suja
> 
>>
>>>
>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>>>>>> Thanks,
>>>>>>> Anshuman Gupta.
>>>>>> I have already checked for mem leaks during the cleanup. The
>>>>>> kobject_put is not needed.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Suja
>>>>>>
>>>>>>>> +
>>>>>>>>         err = drmm_add_action_or_reset(&xe->drm, 
>>>>>>>> tile_sysfs_fini, tile);
>>>>>>>>         if (err)
>>>>>>>>             drm_warn(&xe->drm, "%s: drmm_add_action_or_reset 
>>>>>>>> failed,
>>>>>>>> err: %d\n",
>>>>>>>> -- 
>>>>>>>> 2.25.1
