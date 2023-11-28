Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5631DC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E4D10E56F;
	Tue, 28 Nov 2023 15:26:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100A10E56F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701185207; x=1732721207;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1WzBZNjOUkwOnCf6tDjQ+jBRCyIj++J6ocf90BCZ4EE=;
 b=OqoVJ96sEcn3fM1OKuwTAw0h4UVIITTDObWmlUInCAL3Rc8lvJvwjN7w
 10kvxo4m5DsWVZs9ccJRkX9u4Ebrv5WsR/smFPnzud9XS53r4EPLsDIpl
 jlyhrIKbuAyLrZE5OllgxBCvLZR36mDmCQSHNFzcOF2EI47flvMTQIKmZ
 V+UFcdWZXvlQpy6UfawlK/3JfN/X2I+uvAMZ2ohzkofYuCuxmvSxZ8ZAS
 +G5sFS4tpCd8cfOlVhngwbILX707wdJtuVa0UopUqWgzXtqN45WUErSpl
 ohAAnCZOpZCShhDjBNZ/NQQ22LRAuWtLucT49QC64zX5XJWz+zq60MtH7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11639285"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11639285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859456837"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="859456837"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 07:21:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 07:21:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 07:21:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 07:21:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 07:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC5siNV1mfxI7EVgSyLgXLl99DLm/XL5MVZlqfI+0mq9NP1um0VO/yDM59LfRDPZ5v4YotNhQtAwChaTTrqCl3+shWh2OonaJzzh6qjFGPph1YPTr+XCTs3tScvTOLXqW6S65OoboiEeP2CVmk/UOtSlPI7/T6Sbdh1G+KodxFU7/x6r1+Xw3yQpJLsMIkIQr95mgwja2N8MssvM+mQVtJwpe+hsVI7fXHamE/KUQsK5ZAv+1mG6GuQ8Gsw7crqqji5sr+Ih51Flw82AwhVkX7kvINWsyN2XOV3eyUmOFWg5oufPYgVK0RHOwEzJuiQE1/Z9d3YYMKN1zLF9aHzFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQvfJciu8VYvsv6v5+xepA62iezZNTZK31mILHQ5D2s=;
 b=iw4ttwDSTTDqtleVSdSxVjpeO1+FMVy9VlIbBmTnRa5P86OZabIfE7UWdQBFl+1xUajYlQ7z5JARLhexO7UGpWTcGbQ+QoYjeCR9KHqRd8khixIu1STbPaE+Rx+LEZrnvWeoitTQndhMVfR8k+CEZQH69d9aLfx2oDnz8oFaRhQUHMGiDznwMXEb6uACduykKqkYBRAlXwIA5NbjPS9Src0legqP/VnS6Yn1q1TCYohf065J3bXCbWRw37RRpRf67XCv0XGE2wJG+EAIr80w8/JkvFUHU/Qn5rMnucE2Y3+bDkXeKpTu8YCbhm8X3kY5afhskTY6ghUTkXTJmdgOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.22; Tue, 28 Nov 2023 15:21:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 15:21:25 +0000
Message-ID: <c06df40a-fa18-48fa-ba42-cf295bc1c099@intel.com>
Date: Tue, 28 Nov 2023 20:51:16 +0530
User-Agent: Mozilla Thunderbird
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-5-riana.tauro@intel.com>
 <9fa96965-3393-45d4-8b8d-6fb9596a5fdf@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <9fa96965-3393-45d4-8b8d-6fb9596a5fdf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: c72e54c1-362f-4c46-f0a5-08dbf025af5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSsYk5woCca36ajkftUdrFiXtRK8pML53gBDLpbpP4kQtj/R+KHA/Tl8TAPTucN12FYZhOuEHIKFwWM6ewHFSCzWYdNXs+3Wg/HBwUYd3Lvlpz9PoB5Zfac4J7Q0oY6mk0hIoY61IYNN4soiW3IA8Pnq6j8Fk7q6V1K7uaVHX7UpEntSKDoGf8iziXhs1F28nAcG/4i98e3fHzsl9xgRJDgzf743USpHmRZOXRHpZ39QZQuqeFpGBKqNVY3yus+Qa9cHEoT42Nl1Bab72oTg0sMV1ejgLyhz2k+HU0OItRjQRWlvZN5g0TlYi18I0wmRdVZEJVGyOCcVb70Mv7jxiCJbfSpw0KtcKbGcsnjXeXSs+TO1Qnvvi/jQwDmdLgpntQYs6cAADAkc7g0oTm9xjHHblixT4FJaUfQPnbBGFOp8mEUcM1YlU3RA74+abrQ8grWZiUfWwxEDUBapybJqpLmCyqrg9j2tm8efnD/RJ4wt8HnLvUJOeq4CunjCB+sUyYdqzogcrL8TFK/R/Lmus9ec7KDfTKqu68hJl1MBREaho0t+/1FRfFImFAoG+q6ZaROW9eRaclAtUgud7DOEGuBqcspcz1/Sg2D2PuerTUG8gS9CC2ctuJFEGvCSVWRqgkTSGwZvItYpehCr87vV4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(38100700002)(26005)(2616005)(30864003)(2906002)(44832011)(31696002)(86362001)(36756003)(82960400001)(41300700001)(83380400001)(6486002)(110136005)(6506007)(53546011)(478600001)(6666004)(6512007)(8676002)(8936002)(31686004)(4326008)(54906003)(316002)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzlRVFByK1Q3UEdQb3IwcWlGUGwyY1BobjliWE9WbEYxb05HYytPMk0wOFVy?=
 =?utf-8?B?UWJFYWx2ZWUzc1JnZW83anIxazlXd1ZPV2Q3THZjZkc1UVBjWlRYTHRod0d6?=
 =?utf-8?B?a09UbGt4dlp6NFB6elhFYmdrYzlQeHY2bDF5QnpOM0NsT1FacTd0VENQc1ht?=
 =?utf-8?B?TFF6ZnhhMFZrYnA1NkZSUkhURUo2UWhpYnAxTGRzNEpPcWlIOTYzKzI3SVhS?=
 =?utf-8?B?c1AxaHJWcGdhdHBLMW1VQk4zZS8vRjc2TFp2dklwa3Zmb1ZDRXQ5RW5mek1M?=
 =?utf-8?B?YURYVmlpS3FtaWlVZ281MDBnS3hxVUF2MjRXUlM1c0t4VUxmUEZmN2tzN2ZB?=
 =?utf-8?B?bVhCUVVHNlRQbGJYMFhvdGJRcGIwR3dVRmwwMUZKRnVlaUZxcGg2TCtUaGZT?=
 =?utf-8?B?TzIzRXh4THY3ei9sVkpUbWFhZlNCMDJ5NE1UY0VWcEhpWEVLQy9uWUdaSEZF?=
 =?utf-8?B?a0FCVDZjcGRHZjZOaG85aEtadXBZaHgwMVVjNlMxTDNLcUsvN3JvdG8xNkwr?=
 =?utf-8?B?T0xnNENuQm1MZ3RjV3Y3cGgvK04xVUYxQkNxcjdMS2kvZUVUTy9HUXJldysv?=
 =?utf-8?B?R3h2WlJBYUltMlMvNnNTZXBNczhQTHNhb2NpYm5EdDcrTjZPdk9xTXlqK25m?=
 =?utf-8?B?c0dLYjgxbnJKZVlXclUxVDF4bjRLUFg5c3FlVXlaL01KaE5mMmpRbHlVQVYr?=
 =?utf-8?B?NmZCenJwQ1EwWXlLVG9qWkg1SkFkN3FaKzFzSmxjK2F5TW8yeERZaG84bDc3?=
 =?utf-8?B?SWIyWERoSVF1VTl1NGZxZS9IU0lmNEpXU2JzazNNR0phS2pvN1lkc1J4N3hL?=
 =?utf-8?B?ZnJxWGx3SzEwbSs3dDVjbEFrSWRRdGxieDRTVEVqNG9aazhHb0lHVTV6WkNX?=
 =?utf-8?B?RS9qRGs0NnV1MDlEMGMvMjBGWFFMcy9UZkxBU20yU1JvbnMyRkE5bG5KbTNo?=
 =?utf-8?B?cmt0NEJZcVk0eTR0aExDckwvckVpMkpWUVFMeGlhTlVUbE9qRU9wU0FPRVVN?=
 =?utf-8?B?YmcyY3R4S0EyVkJDcGZNWGYyOFo0M3ZCZGVtaEJiN3Y4RlVoZGw2NE5zVDVl?=
 =?utf-8?B?Szd0eWVEbHY3T2ZYcG96TERTVStGbzhvUG5PZ0czSEhBZEF1RVpsekFTSVhu?=
 =?utf-8?B?VGJhMjBrcWRuZnB6TlVXbC9TRmlwUGtYWll0RDhBL1lvU2gwUG1GSzlKSUs2?=
 =?utf-8?B?bGhYMTltMzBSM2JVdE83M28zTmRYMmdiMTZ5bGNEOHRrV1AxT2cvbEhvdHVY?=
 =?utf-8?B?N1ZiVDZ3Qkc5eEQ0QzBCd09rbEtCbmEwVDBIM3N6Yzcvb3V1S0pkL2FFNzBQ?=
 =?utf-8?B?aU5pc2kyMTZMR0E3UXlQaytpYlpmN1RycUNvWmVpWGxMOTh6ZW9HKzQrSkly?=
 =?utf-8?B?UUFCVzhxUWYrNHpqalRNOXRCVkJGK1dQclYrTEpSQzF4cXN5Y2ZDL2xZc1R1?=
 =?utf-8?B?Q3EzUTl3SWk3MGJINHd1djZRUmgxMlRoNER2WTJJa2lsTDh0aUozdEtSNGFO?=
 =?utf-8?B?bEZUR29XeStMbU1kQ2hmSTAwaDlRaHVxRjZPZ1c5ZGsvcjFkZ2JnNHBCd3ov?=
 =?utf-8?B?SStLZXJlSHVxOFNTdkhNS0pkUlg5VEFZaHdLc1hieDBuVTYzcXF5czBWNmdQ?=
 =?utf-8?B?Q0xsSFVXd3RZVXk5T1JMVzBmMHhsZm1zakUzaURwNUptYXROZnV3OFl0WnlW?=
 =?utf-8?B?aStHVUJtRGFzWFJjbGF3TU41YmZXMG9aUTlwU3d6SHlIMFIxY0d5NXdTcm15?=
 =?utf-8?B?U3RlL3p6TTZpQ3NmZzlvcHdyWVpXbHhic2FXYzdISmZNRnR1YUJwK2NyMHdB?=
 =?utf-8?B?YU9tdFB5S3hIQUlIRVZsdkNDUzhJMjhzWXNrd3IwVjA1RWRSY3RvSlZ5SjBS?=
 =?utf-8?B?TlNydW13ZDc2NUhuenJ2d2w3MkxwNFNnSGhFUGlnM0x2U1Jsb1ZFVTI1Mmxo?=
 =?utf-8?B?Z2dVL2FTOE9nc0lTUS9qS0RVZlM5aUlNbEg1UmY4VjZ4Q2xYSFF2WEVkMDBk?=
 =?utf-8?B?N1FleUJFMEowM0x0SVMrZU5Vd1NXNEk0aDdETUpXU1B6dXg3MnVtZy81S2Zq?=
 =?utf-8?B?ODdJQ2RCVU96RUNxb2FlTFJZNFdEc0xqM1RzLzIwTXpsbzExV3lnSERranQ3?=
 =?utf-8?Q?npAKIskZ87CRlrNk3APDDW2WR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c72e54c1-362f-4c46-f0a5-08dbf025af5e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 15:21:25.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMtwTmx9wKkcOBeCOIGv/xw+M6zyAUO2P8UaWi4eGmVlGMabN13X6kDWbERazGVaoym5VL4TyU0qdoxq09RNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/8] RFC drm/xe/guc: Add PMU counter for
 total active ticks
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


On 11/28/2023 3:36 PM, Aravind Iddamsetty wrote:
> 
> On 11/27/23 19:41, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks. These counters are maintained in a
>> shared memory buffer and internally updated on a continuous basis.
>>
>> GuC also provides a periodically total active ticks that GT has been
>> active for. This counter is exposed to the user such that busyness can
>> be calculated as a percentage using
>>
>> busyness % = (engine active ticks/total active ticks) * 100.
> is the total active ticks from epoch, but PMU is relative from instance of event open
> so i'm just thinking if total active ticks will be less than  engine active ticks in which case the
> % will be greater than 100.
Hi Aravind

total active ticks will not be lesser than engine active ticks. Whenever 
engine is active, the total active ticks will increase along with it.

* engine busyness ticks (ticks_engine) : clock ticks for which engine 
was active
* total active ticks (ticks_gt)	: total clock ticks

> 
> rather why don't we just expose engine busyness in ns like we did in i915.

 From GuC >= 70.11.1 exposes an interface where engine busyness is 
measured in clock ticks and is a 64 bit counter along with total active 
ticks.

The versions before was a 32 bit counter and KMD had to take care of
overflow and there were issues with timebase conversions from ticks to 
wall time

Thanks
Riana

> 
> @Tvrtko, any thoughts please?
> 
> Thanks,
> Aravind.
>>
>> This patch provides a pmu counter for total active ticks.
>>
>> This is listed by perf tool as
>>
>> sudo ./perf list
>> 	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>>
>> and can be read using
>>
>> sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
>>          time 	    counts  unit 	events
>>      1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
>>      2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
>>      3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
>>   drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 75 +++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
>>   drivers/gpu/drm/xe/xe_pmu.c                 |  7 ++
>>   include/uapi/drm/xe_drm.h                   |  1 +
>>   6 files changed, 83 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index f06c74a7c6d0..2379462685f2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -765,6 +765,17 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>>   	return NULL;
>>   }
>>   
>> +/**
>> + * xe_gt_total_active_ticks - Return total active ticks
>> + * @gt: GT structure
>> + *
>> + * Returns total active ticks that the GT was active for.
>> + */
>> +u64 xe_gt_total_active_ticks(struct xe_gt *gt)
>> +{
>> +	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
>> +}
>> +
>>   /**
>>    * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
>>    * @gt: GT structure
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index e23a6ceff863..023cb7c0c32d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -41,6 +41,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   
>>   u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
>> +u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>>   
>>   /**
>>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> index 611bafd14d1a..dcf468ee30ea 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -19,7 +19,16 @@
>>    * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
>>    * a caveat that is not real time, best effort only).
>>    *
>> + * In addition to the engine busyness ticks, there is also a total time count which
>> + * is a free running GT timestamp counter.
>> + *
>> + * Note that counters should be used as ratios of each other for calculating a
>> + * percentage.
>> + *
>>    * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>> + * total active ticks (ticks_gt)	: total clock ticks
>> + *
>> + * engine busyness % = (ticks_engine / ticks_gt) * 100
>>    */
>>   
>>   static bool guc_engine_busyness_supported(struct xe_guc *guc)
>> @@ -41,48 +50,69 @@ static bool guc_engine_busyness_supported(struct xe_guc *guc)
>>   
>>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>>   					  struct xe_hw_engine *hwe,
>> -					  struct iosys_map *engine_map)
>> +					  struct iosys_map *engine_map,
>> +					  struct iosys_map *global_map)
>>   {
>>   	struct iosys_map *map;
>>   	size_t offset;
>>   	u32 instance;
>>   	u8 guc_class;
>>   
>> -	guc_class = xe_engine_class_to_guc_class(hwe->class);
>> -	instance = hwe->logical_instance;
>> +	if (hwe) {
>> +		guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +		instance = hwe->logical_instance;
>> +	}
>>   
>>   	map = &guc->busy.bo->vmap;
>>   
>> -	offset = offsetof(struct guc_engine_observation_data,
>> -			  engine_data[guc_class][instance]);
>> +	if (hwe) {
>> +		offset = offsetof(struct guc_engine_observation_data,
>> +				  engine_data[guc_class][instance]);
>>   
>> -	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
>> +		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
>> +	}
>> +
>> +	*global_map = IOSYS_MAP_INIT_OFFSET(map, 0);
>>   }
>>   
>>   static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>>   					  struct xe_hw_engine *hwe,
>> -					  u64 *_ticks_engine)
>> +					  u64 *_ticks_engine,
>> +					  u64 *_ticks_gt)
>>   {
>> -	struct iosys_map engine_map;
>> -	u64 ticks_engine = 0;
>> +	struct iosys_map engine_map, global_map;
>> +	u64 ticks_engine = 0, ticks_gt = 0;
>>   	int i = 0;
>>   
>> -	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
>> +	guc_engine_busyness_usage_map(guc, hwe, &engine_map, &global_map);
>>   
>>   #define read_engine_usage(map_, field_) \
>>   	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>>   
>> +#define read_global_field(map_, field_) \
>> +	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
>> +
>>   	do {
>> -		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
>> +		if (hwe)
>> +			ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
>> +
>> +		ticks_gt = read_global_field(&global_map, gt_timestamp);
>>   
>> -		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
>> +		if (hwe && read_engine_usage(&engine_map, total_execution_ticks) != ticks_engine)
>> +			continue;
>> +
>> +		if (read_global_field(&global_map, gt_timestamp) == ticks_gt)
>>   			break;
>>   	} while (++i < 6);
>>   
>>   #undef read_engine_usage
>> +#undef read_global_field
>>   
>>   	if (_ticks_engine)
>>   		*_ticks_engine = ticks_engine;
>> +
>> +	if (_ticks_gt)
>> +		*_ticks_gt = ticks_gt;
>>   }
>>   
>>   static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>> @@ -112,6 +142,25 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>>   	xe_bo_unpin_map_no_vm(guc->busy.bo);
>>   }
>>   
>> +/*
>> + * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
>> + * @guc: The GuC object
>> + *
>> + * Returns total active ticks that the GT has been running for.
>> + */
>> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)
>> +{
>> +	u64 ticks_gt;
>> +
>> +	/* Engine busyness supported only on GuC >= 70.11.1 */
>> +	if (!guc_engine_busyness_supported(guc))
>> +		return 0;
>> +
>> +	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
>> +
>> +	return ticks_gt;
>> +}
>> +
>>   /*
>>    * xe_guc_engine_busyness_ticks - Gets current accumulated
>>    *				  engine busyness ticks
>> @@ -128,7 +177,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>   	if (!guc_engine_busyness_supported(guc))
>>   		return 0;
>>   
>> -	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>> +	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>>   
>>   	return ticks_engine;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> index d70f06209896..57325910ebc4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>>   struct xe_guc;
>>   
>>   int xe_guc_engine_busyness_init(struct xe_guc *guc);
>> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>>   u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 6dd5c97129f2..0beb660689da 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_clock.h"
>>   #include "xe_mmio.h"
>>   
>> @@ -124,6 +125,8 @@ config_status(struct xe_device *xe, u64 config)
>>   		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>>   			return -ENOENT;
>>   		break;
>> +	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -186,6 +189,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>>   		val = engine_group_busyness_read(gt, config);
>>   		break;
>> +	case DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
>> +		val = xe_gt_total_active_ticks(gt);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -357,6 +363,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		__event(1, "copy-group-busy", "ns"),
>>   		__event(2, "media-group-busy", "ns"),
>>   		__event(3, "any-engine-group-busy", "ns"),
>> +		__event(4, "total-active-ticks", NULL),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 88f3aca02b08..6f38f836b705 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1016,6 +1016,7 @@ struct drm_xe_wait_user_fence {
>>   #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>>   #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
>>   #define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
>> +#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	___DRM_XE_PMU_OTHER(gt, 4)
>>   
>>   #if defined(__cplusplus)
>>   }
