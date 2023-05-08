Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14FC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 09:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC22410E1D3;
	Mon,  8 May 2023 09:55:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BDB10E1D3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683539711; x=1715075711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ERk2/h7/YQU40QlkTIBKdpVvSmkfs6LeKAdm5SpydwY=;
 b=Ps1O3fvuBEbHlQRjNzF05eI1fz3URk2yKBPZqvxk6yKryknBWaxWkOk5
 MLbH9Cvf2GGbIQPoBX+edCyjXBAH9+4r6PTTtob1TSZV0XRxR5j6BFYcZ
 WT9hmqs9EEj6WawcPkyMtzK+jvEmdqEWW8DTD/6mUvXIP8XJGJNmtp/wy
 Mp/Gk4Ip9p8lpy5Hxykyd2yYoJ4wVpEs2HmjTGWQr6FpkdZbt8PQD6RRy
 8j4E3t3GD0fgDR96tHjgPdtgCeG1lo7e9aQVxFbZNFEDTYeaSksmeQGwD
 x7NmS9HzbY/QZg8PgfiWil/aLNWyHr7fgKh+I4qrcG7PdU+G3hf7s5tVN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="347070235"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="347070235"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810198572"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="810198572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 02:55:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:55:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:55:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 02:55:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 02:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJvHWbrR6nVInuSdWgVwPIZWPn+BgleDLvXm4Kv0zxPNOZOjyAGUe9t+Ksjh9l1KIYmgopRdAQ9J0WmgL6EuaVlRaM21QWDRb6xAWBH1zj2eNB3qumdNHk30aHswUbC7DW3fco4yyzWiI09fDYF17fuV0I8znpKYDRRKdsoAHrrOufPSbafjyHzqJMfsp/nI/eQlwGm/RdJ9Bf/7Yex2XuiJnwoiepzW1TiQ64rz3n+bFG0M2RQcgT3jXAdECkEOeMolQA+h6nLml8+OTud7w6O5JTcn+aIKDsuNAdrJ7NB5HNxQ3+g5qSg8ofwAwyFTuYiLZ1VGDwTvPRUfDzlm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tKlSnK9Mf9fuxE6nGZmMhNlvHj0eoDoqiFv3C3P9EA=;
 b=Z2HdAqjMnKDwTxxHrjDVWoPVgbfxCVOgud9qK6jKWN0v8b53e94Wp2OiJwNEPwTYeaFUP0UuoPLmFwID+YBwyX7k8l1Sop+FWG5axF49Jf6gckyorCzrqXw2U2T1ETNuHeGIoofKQNYiLHMEIX729De9+oM8kaQcmpqgPY7SpMzbnXuC2/qsA3xJverLP/Y/i3YMdjrLjWsQr7PxXi39qkh5W+Rh+rcZ3UDRCVDhV/dR+ndxaTOIcAg0PT7g+GesbQaZfDsV3wklFHW2vrgnFxNmWLh7bv4Ig65gmEFZ6YpFSOBkrOe7bTi++/nNuAUHS0aw7mVSRBHncurjjSK7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:55:07 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 09:55:07 +0000
Message-ID: <6f545bbb-2aeb-bc58-13d9-dfc91ab1bc05@intel.com>
Date: Mon, 8 May 2023 15:24:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-3-riana.tauro@intel.com>
 <CY5PR11MB62114419BC5C8ED03B7FAAF1956D9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZFPV8jPCfSio2+Zu@rdvivi-mobl4>
 <064f5bb0-643d-eac3-4e14-0ebbc740ca81@intel.com>
 <ZFUBMvrt4U1blHk4@rdvivi-mobl4>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZFUBMvrt4U1blHk4@rdvivi-mobl4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::33) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2e483b-cd65-4310-f902-08db4faa4df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvAdwlJD+IUVY9eSu2jxFOhzgZXf78yrvQoz5z5YCI5qWp0YMxDSlGR8xPKNmlyAQoYycvbLsLuYbyLPM73+ZQNj1Yl/hnhX8L08BeTTLZ8plWUz1Y7+hUmFUF3hlqcaT+LAG76WeWaeydtpmdaFx8fDayxoc1t0j9MToqYI/ofwRRTe5hlQpG1oovB5K+xq7pYjM0kxxnGCwYR8epq9p71B9GFiRwa4423PGOrI/2RqXppzTJbx5GnA++LYV/eixjlc8HBGrbmjnRElHyEf2Pr0WCns7TwElqbr1yvF7T8s+6P8kZaritMMVawO+Z+xdu5bcDPaEvGl2VlSGIwfJ3AtXZZZzQlUUB8775t3IXxLtn26KUuVXKGXQgd2RGSn9HqWypE8RseH3JI/G4sy1k3FcvoNZ3TIy4v43k0FzNhRe44gA0oetQBzOXTWj8q9UDdYkhR9BRjxCDc8/Vs0kvMhTwvBSQiSHy/9exfkgsEQknfQBqdGBfR+AFnhUUhOIDRRVWnHf0ftv3T3rK27nbACl2qNs+RYC7AgCmFFr83/o4y2POOQ1FtEoMb6VGVovkDQYTAG0MrIhHB+yeY3xqpR0PEn2bOxASlTWUrtCpjQV+0+6ZyBq4EOhuSpAcxyQkY8lncbV/NCl5f+Q/FNNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199021)(86362001)(66476007)(36756003)(31696002)(6666004)(54906003)(316002)(66946007)(66556008)(6916009)(4326008)(478600001)(6486002)(8936002)(5660300002)(8676002)(2906002)(44832011)(41300700001)(82960400001)(38100700002)(186003)(2616005)(107886003)(53546011)(6512007)(26005)(6506007)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5oTHovS3N4SGlCQTM5Vmlqa0hnQy9LRnY0dnhkNndUSi9Jbkc2SFk1Wlpt?=
 =?utf-8?B?cjNrVlV4NmE0WFZrUzh5eUdYQkdTQ1JZNmRCTUJHaEVYcnpFL3dSMHJLZ2xP?=
 =?utf-8?B?UXl5bmFTcjVQcGpTMjlDcUtRa1hObi9senc3WitJSk8rMEZ5MVpkNFZTSFNa?=
 =?utf-8?B?MS8wZUZDYkIyWmZNNDJiUDZQU2ZHY05WdUczdGFmanN3UnBJMmw5cjJMeWdT?=
 =?utf-8?B?a0kwY0tGUUIxbVpCaEFXR3ZlWjNDRWE2UW5HL3R2V0dVR3hTbXRVM3VncFJW?=
 =?utf-8?B?dDdxTzNPN3B4c2gyNG00a3VWNTNXbVN1QS82UjRES1R6dlhXbnlEa052VFU3?=
 =?utf-8?B?OHpyTHhKZXBldE1WczV5WU10OHZCaHl5RnIzKy9lblpCV2RsRThoRThqaVVY?=
 =?utf-8?B?RUNjM25rRVdzZVNtUHdmRmwvMHFkTXoxR2xPZEUzVzMrNlA2Skt4UEtUbmhT?=
 =?utf-8?B?aTVVdy91amtiVWlkV3ZjeW1XU3pBZWs2YWJLcEk3TEtha3I4QkZnenI5SWNV?=
 =?utf-8?B?bDhCV0tYQW9PV0NDN29wMFFFMG1jdk1xaStweGdNVTVvbU4zcllsM2I4M3pH?=
 =?utf-8?B?MzFIRk54Vzl2S2RLTFBOSnRRS1l4MVgya0FsZUZ1Z1RvL1VtWnVSOXpxVE1W?=
 =?utf-8?B?OHh0cEJPNXVUZS8xL1hiY2tJSDVTUDBNdjhUSDBwTHJSai84MlpuWVl3akxO?=
 =?utf-8?B?ZUlSbGhJbk01R0pMbUpIeHYvVDNNUHorQmxqejNSMFZNa2xPektkZzdXQitw?=
 =?utf-8?B?RzRzWWdlTFdHQVNBZFRxeW9pNU9DODkwaDR0a0dzRVI3Vmc1RFJDRml4U0ti?=
 =?utf-8?B?aDZQUlYxdFhpMVFaTXlsSWdEbGNxZUZiVExiSGVaMlA2M3FCaTZUcThTcE53?=
 =?utf-8?B?em5lSzJhSTZVajlLaGsvR2JPRVJJTVFKQXZyck53OFNJOGF4Ti9JaEtMMXMx?=
 =?utf-8?B?RGlvU3BiY3hmVUpnQ3hzZTBrRFRXRVVjV21JTjZXZmhQVHNXY2dpaVpqVEZl?=
 =?utf-8?B?cUpSS2RTZndNMC9wWGljbzNJODJkMkhwUWd1ek5WU29sRUlaSmNOWjNHSE1Y?=
 =?utf-8?B?OStQMGp6cmVzeHIxVk5hU1YzMDZnUEptYm1jenBzTk96U1lRT1FwVWhRcTdx?=
 =?utf-8?B?c3RUTEJCakQ4c0ZIUnlRMmI2SXZSSkVwUENJdjY1a2ZyZHVaYjIwTnduR1hy?=
 =?utf-8?B?YUtMTmlONEJRZ3dKZTJhY3AxNjIvVlNEOXN2cS9yVGZRS2piWTE4YmV2Wmsy?=
 =?utf-8?B?NXk4QkoxS0JCWnB2Nk8xSFhuRjlGREFYNVo5V08ycnlRbmtYR0Y4U05rRHFH?=
 =?utf-8?B?NmkvZ1RVT1FKc25pMmNJU014ZDJLZ3JRQXJIVW9qMVh1M2N5QnY2dmY2V0FJ?=
 =?utf-8?B?T2lEekUyNWxHRmJwT2pBaHFVZFN1K0x2U3RRL091UDEwMTJnbmpKc2NDYUM0?=
 =?utf-8?B?NjRwYTgwRGx0dDFMNys1aWVOazVLYThRK01aSmorS2RlUURMVm5wMUZUVzNN?=
 =?utf-8?B?bGVTcGRQUFcwMVp4KzVST0RRZEx6WTI1V21ZTTZpUnZBV2NJRXhoTFM1a0xr?=
 =?utf-8?B?bUNsWWpzWTFIQmZwYi9jejZzOEtLSXVGRjhKVXZLOFVrZlp3MlhPdU9UdThO?=
 =?utf-8?B?ZlpRVWpyemxHS1NPUVpjM3dDTXQ4WmRxTmRhbWpyWUlyZSt5WE9mTWhEK3RK?=
 =?utf-8?B?OWJoSlVhT2h3bXJCcXFrYzRWdlFZWW5WdkxxVUVRTFRVSGI2NjFUejRRVm84?=
 =?utf-8?B?SlFVM21CakRjenk4TVFlbE1KQm9JTERjc3JPUW1FTjg2bU9rQ2xVQWhWYjRE?=
 =?utf-8?B?U1h6VWlGRk5HWi8xYTEvTlZ4SE1FejMwck5PZ1BMWlQzR2ZiOTVocnlRTmk1?=
 =?utf-8?B?TkpPaVVBY3V4RFoxa3lMd3NrbnhjS2lidjBPUk9yWFVVcVB6UXVicjNUeFY5?=
 =?utf-8?B?YUJzZFQyU2lQWXlVZ0dDSGdyRVZac1BLS0tJTDlBc20vSTZuc3oxRGlKemFs?=
 =?utf-8?B?eUo0K3dhVXQwbUZ3QWgzUmk4aDJyUXVya0R4anlDWlZ4azZja0JsRWJMQUlP?=
 =?utf-8?B?dVdSTkMyZExLMTJEUEw0c09QQXFGNTM1NGJuRUlKelNNL1JVeVhGU1kvaG5h?=
 =?utf-8?Q?WiGf1rrLchcnwqXhyj/Y8f23v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e483b-cd65-4310-f902-08db4faa4df8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:55:07.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORXH6k0Pr+zRU5ZpQAzNCZ0+UvZkysR1NBxuFEvt56dOwmhQTGjQjRh0jVOvu6h1t0/JI+pRbrg6cC0jCa1vdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/5/2023 6:44 PM, Rodrigo Vivi wrote:
> On Fri, May 05, 2023 at 01:14:29PM +0530, Riana Tauro wrote:
>>
>>
>> On 5/4/2023 9:27 PM, Rodrigo Vivi wrote:
>>> On Thu, May 04, 2023 at 06:55:48AM -0400, Gupta, Anshuman wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Tauro, Riana <riana.tauro@intel.com>
>>>>> Sent: Wednesday, May 3, 2023 12:13 PM
>>>>> To: intel-xe@lists.freedesktop.org
>>>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
>>>>> Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
>>>>> <badal.nilawar@intel.com>
>>>>> Subject: [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
>>>>>
>>>>> add rc6_residency in ms instead of rc6 residency counter.
>>>>> Handle wrap around for the counter
>>>>> The counter can still wrap as it relies on the frequency of counter being read
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++----
>>>>> ---
>>>>>    1 file changed, 37 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
>>>>> index 231bdb45a6b7..a7e97ddd7253 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_idle.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_idle.c
>>>>> @@ -11,6 +11,8 @@
>>>>>    #include "xe_idle.h"
>>>>>    #include "xe_mmio.h"
>>>>>
>>>>> +#define XE_RC6_MULTIPLIER      1280
>>>>> +
>>>>>    /*
>>>>>     * Render-C States:
>>>>>     * ================
>>>>> @@ -27,8 +29,7 @@
>>>>>     *
>>>>>     * device/gt#/gpu_idle/rc* *read-only* files:
>>>>>     * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>>>>> - * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
>>>>> - *		    Prone to overflows.
>>>>> + * - rc6_residency_ms: Provide the rc6_residency in ms
>>>>>     */
>>>>>
>>>>>    static struct xe_gt *idle_to_gt(struct xe_idle *idle) @@ -51,6 +52,35 @@
>>>>> static struct kobj_type xe_idle_kobj_type = {
>>>>>    	.sysfs_ops = &kobj_sysfs_ops,
>>>>>    };
>>>>>
>>>>> +static u64 rc6_residency_us(struct xe_idle *idle) {
>>>>> +	struct xe_gt *gt = idle_to_gt(idle);
>>>>> +	u64 cur_residency, delta, overflow_residency, prev_residency;
>>>>> +
>>>>> +	overflow_residency = BIT_ULL(32);
>>>>> +	cur_residency = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
>>>> We shall use function pointer here to get the residency, so underlying function can read from
>>>> appropriate counter and  abstract it from sysfs show function, same comment for converting to
>>>> ms as well.
>>>
>>> Yes, please!
>>>
>>> Leave this new component as clean and free from the 'RC' stuff as possible.
>>> Leave all RC stuff inside xe_guc_pc and then this new infra is specific for
>>> the report and control so you can make this as generic as possible and likely
>>> extend to other stuff.
>>> And contain the platform stuff to the lower level.
>> Hi Rodrigo
>>
>> So do we have two entries for residency? rc6_residency under device/gt#/rc
>> and also displayed as idle_residency under device/gt#/gpuidle?
> 
> No, that was not what I meant. I'm sorry for not being clear.
> 
> We should have only one interface. Let's not duplicate stuff and minimize the interfaces.
> 
> What I tried to say was to leave all the RC6 stuff inside xe_guc_pc... All RC6 related
> documentation or MMIO operations. Then, on that component you export functions that
> will be needed by this new idle component.
> 
> This new idle component is only responsible for the idle interface... informative
> and or control... sysfs comes here then.
> 
> Later the same shall happen with the freq stuff.  Freq should be exposed through
> devfreq or hwmon... and for that we will have to create a new component. However
> all the related low-level freq management will remain in the xe_guc_pc.

Sorry for the misunderstanding Thanks for the clarification.
Will move the low level functions to guc_pc.

Thanks
Riana
> 
>>
>>>
>>>> Br,
>>>> Anshuman Gupta.
>>>>> +
>>>>> +	/*
>>>>> +	 * Counter wrap handling
>>>>> +	 * Store previous hw counter values for counter wrap-around
>>>>> handling
>>>>> +	 * Relying on sufficient frequency of queries otherwise counters can
>>>>> still wrap.
>>>>> +	 */
>>>>> +	prev_residency = idle->prev_rc6_residency;
>>>>> +	idle->prev_rc6_residency = cur_residency;
>>>>> +
>>>>> +	/* RC6 delta */
>>>>> +	if (cur_residency >= prev_residency)
>>>>> +		delta = cur_residency - prev_residency;
>>>>> +	else
>>>>> +		delta = cur_residency + (overflow_residency -
>>>>> prev_residency);
>>>>> +
>>>>> +	/* Add delta to RC6 extended raw driver copy. */
>>>>> +	cur_residency = idle->cur_rc6_residency + delta;
>>>>> +	idle->cur_rc6_residency = cur_residency;
>>>>> +
>>>>> +	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
>>>>> }
>>>>> +
>>>>>    static ssize_t
>>>>>    rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>>>>> { @@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =
>>>>> __ATTR(rc_status, 0444, rc_status_show, NULL);
>>>>>
>>>>>    static ssize_t
>>>>> -rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char
>>>>> *buf)
>>>>> +rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute
>>>>> +*attr, char *buf)
>>>>>    {
>>>>>    	struct xe_idle *idle = kobj_to_idle(kobj);
>>>>>    	struct xe_gt *gt = idle_to_gt(idle);
>>>>> -	u32 reg;
>>>>>    	ssize_t ret;
>>>>>
>>>>>    	xe_device_mem_access_get(gt_to_xe(gt));
>>>>> @@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct
>>>>> kobj_attribute *attr, char *buf)
>>>>>    	if (ret)
>>>>>    		goto out;
>>>>>
>>>>> -	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
>>>>> -	ret = sysfs_emit(buf, "%u\n", reg);
>>>>> +	ret = sysfs_emit(buf, "%llu\n",
>>>>> +DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
>>>>>
>>>>>    	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>>>>> XE_FORCEWAKE_ALL));
>>>>>    out:
>>>>> @@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct
>>>>> kobj_attribute *attr, char *buf)
>>>>>    	return ret;
>>>>>    }
>>>>>
>>>>> -static const struct kobj_attribute rc6_residency = -__ATTR(rc6_residency,
>>>>> 0444, rc6_residency_show, NULL);
>>>>> +static const struct kobj_attribute rc6_residency_ms =
>>>>> +__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
>>>>>
>>>>>    static const struct attribute *idle_attrs[] = {
>>>>>    	&rc_status.attr,
>>>>> -	&rc6_residency.attr,
>>>>> +	&rc6_residency_ms.attr,
>>>>>    	NULL,
>>>>>    };
>>>>>
>>>>> --
>>>>> 2.40.0
>>>>
