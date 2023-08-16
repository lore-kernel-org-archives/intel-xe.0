Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B91C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 16:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED3210E38B;
	Wed, 16 Aug 2023 16:31:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A0F10E38B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692203477; x=1723739477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xPQ22bz7C1GeRjTmla4oKkYN9HXMc2Bovbal6y4ffw=;
 b=jGbN4vwpVCZTxQOqFfAj60/vx2tzYUAMYmSsbZUmjtjXR6CrkdD49Kxw
 LoeTfS+C0MG7D5c6Mtqhzaxt3G7zPf59akoVAzQftKvd75wXhzSgN561z
 GI/mTvj8xgxupH5a+cvdRn1XQV1VcIti/tR0FqR1s6EaDFWQz5GXYJ2ia
 RjAnzJkMmPwrj46C1VNM3ZqRzfHe8nNa7Z//hPfRYExuKm/M4mm2Ss2AH
 ifjrXWEvjJONSFsgSMtwNJmzq2M3a1Q6X2CQ0/nx879Y1eH+fa4TSTuTJ
 7uBvSx/TtCc6uG3LNQuSRcmHzSSIrgJmjvcC83ZhWUweqr6oGtaMuZgo8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372583446"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="372583446"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 09:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737344858"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="737344858"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2023 09:31:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:31:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:31:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 09:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STDZFW0KwphZiIOyWbRXAK3cFLPMmUvYHCc7MFVKxVSeB7RdqPvIF+ctH3hm8Gwww3CQHj3i0qjZ28MSV8+yesMoPlzblr6WPHinaVpi9IX+OM46Nc018dh/cnCdEZCq/pV20zjfTbtq1P70k+Q+46JgJh0blSIS4l3D3W3iZVZjx2IxSA73dQTfYj356m6OJjyZLTRlPGoWnvpj/GiuWRE6kMvDoUCe0YhUA0EMUoAs7RYRa4zpSHdDZEjier+o43LMJTWOMOiLH4q3sv2O5SIe4XI1OJGrCWVnfQxBJoQSmCek5Vwp+pi3sbPPUEfcq11ArGG5YxCjH8Pv8uaLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEQa1S2ApNl7ArMLiiU9JcTzVj/SPuzS2av86fBEZ7c=;
 b=mO1kmEXFm/RbwTWG7SY8R4HYdciK3MLL0ssSJDfGUztucc0e8EG/S+Dtohv0aeYWlHQCxZa0Q9AUsdO8YRHP4FJEBEVUPUV2Q7QfsfYtGDz17MrLovRF0lUFsogZQy84hzcfJxdWbGWYWLkLzRdi1W1m6NN6Zk5R4KFBHKMFg3VISF0fhDFDpOlqE9rqp5jP8wgOUjUp5ElFylS5EfNMCI7CB+Nd4FA4w24SedWjNYdfceMUYnXkfsKipVXXatkQ62pn6b89HfmfjdZD8rT/qEsc8tFs8oBv8QsOtRcAKre4JfJeFSlRdQ+//FLMxILveuhFOPnYOEWgLV5WlKnOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Wed, 16 Aug
 2023 16:31:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 16:31:09 +0000
Message-ID: <1b3fa46f-8aca-46ee-bee9-2465881f98e3@intel.com>
Date: Wed, 16 Aug 2023 22:00:59 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
 <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
 <439234fc-4dcc-4f60-b71e-32e1be96d1b5@intel.com>
 <ZNzx/8KeURxfO8ue@nvishwa1-DESK>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZNzx/8KeURxfO8ue@nvishwa1-DESK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 105807d5-e74c-4cc9-2403-08db9e763285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vySvcXDKRDAwjNVciY+w2/KTC/NFp/6Z6TgpblmcZIYofN0bjjRNtjvPOBj91QBTOhjtTsfk6kV378k9vhq0MbENPw+/y1FIR04or3IycBhxGXACEhr8hYTJW7VtahCddgUKoMCdHlfcdaYhPsCXHFlTpfa6Th6p0mlDrqWK6iw2H79KM1uJWyWb4zVk9ltrc0zS7TPjrxNOy0X5f9ciW9vnXWm8xZ7MwZAMKSUkP7vQPNGX7V6UWX8qxe1Py50KmwnfJy1KxkHjCj14K5Ic1dbRQ0/SykZ+h9Q1nCG9I4Ygsku30Dg/z24UQXmm2ozfcaiE3zA4I//XnuOyQtWvnOaB8E+XZjGqxKbmfkSjM0914YapGu4RmrWpiNkQpq+1cdlL68VQne/dY59y6tvgzEZKOU+tBXktp8Hjk+W3WFOnQBCLYxFphmZP1GQq4CEptMU7DbU1DMAUijz9C0Ntb5yh3kkRLzer0DBMHTtt+8LAXDIsMPqCbQkQ5/uA+PN/GkEc9ly/70D9lwq3B2svM4ht8i0TqDL4O81DJXMHd4MzktAiXF2xe23hwQ0cNRRjw1dbCHm8kTx9XW4Wpsbv7l37ccyKElpoFYQ7I4A68yrz5yeNRjn8EeV4jzIj5ViHlrJ7D42p7HyN0sHWkYo4GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6636002)(66946007)(66476007)(66556008)(37006003)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(6862004)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0czRW91S0JTeVgrRlIvRFdnMXBQYi95dDNQN255VzR3T2piUE50b0lhWHFM?=
 =?utf-8?B?TjBMRWpjYlNqR0Z5bnVaTGhEM3BBU1hqcy83RUpNYkt0cyt4Kyt5ZHp0NnlH?=
 =?utf-8?B?dlpNL0FoUWFjdDRJYnRCTFJTd1ZDNEZ0NTI5Z3pQWE0wYzlrOUprZ09rSFo2?=
 =?utf-8?B?ZFVuaXB3SFVlOVlLSS9wSldqcXBkakhCWk82b0FIY1hEdHl0RzNzQ1huTHJw?=
 =?utf-8?B?SjdIYzBEaVowaVV5ZmUvRHlFN2ZMaDYvRmdYK3dNMmNQTzBKaTU3ejdnU3dV?=
 =?utf-8?B?OHlIbzFTczB6dGhxbVkvY3g0VDhmS2NmTWJKR1Z0eE9HQmxKY3NQTzE5dVlr?=
 =?utf-8?B?VXcwMGdhUVJ6eDJFTVYwYWVya29iOFFVRUlsSFJhaVlmVmxRd09tY3cvR0sw?=
 =?utf-8?B?UG1GNjRRSFhzclBsMHg3RHVlMEI0YnJSa3VaYnV5cDE0RHVRUkNEMXlkcGJC?=
 =?utf-8?B?Ykd5dHVmUDBxRnJPaDhMZm9JSjNiYjQvUURaSHE1SlZqQjQ3YWhoblFnNVRO?=
 =?utf-8?B?WlJ6aDZ5NkJCZHFuNGxTOWdpWW8zdjY0WEFjOU9PV2pKeVZnQW9NblhZMjEy?=
 =?utf-8?B?d0FhT3ozVnZXR3drK29RWi80Tk13Wlpwb0cvZzhBVzlaMkt1SGtKZG5TdzRO?=
 =?utf-8?B?NEhWbE1KVFNZbEhWOWw0bHQybTVBdW5EQnNxaGFhSGRnSTh2N0VkWkkrZS94?=
 =?utf-8?B?WXAwdXFKbHg4OG5Kem1HRW5rMXgrSUc5cjdkeFJBR01ld3NsSk9icWdoT21i?=
 =?utf-8?B?bldodmhzbHpkVWRnbUlpOEI4SUZVdEpqdk1ia0JnTisrWDdUSEFCWlAwMzFx?=
 =?utf-8?B?dnpzakpEdTJTTWJHL3NNSTBxdktENTF3U25PanRmUXB1dTJrS3dOVWgvRExa?=
 =?utf-8?B?VForUkJxTnAxUm9yRUNWQ2pRM1ZkTVJNSWlHcGo3b2R3L0xGVFZjMEgyMGhU?=
 =?utf-8?B?SmdRYVB3TjBKRlNlUHFxNFdkVzVwNU9YSnVzQ2t0OE5iZG5Yc1pSZGZtbElq?=
 =?utf-8?B?VHN1N09RU0poZUhwNFUrV2xKNmw2VGRZek0zSkpKZ3BiVlA1VDJUdFcya3Zv?=
 =?utf-8?B?Ris2ZXZJQkJoSklIWEoxYjFTUlZSdFRrMUFVelIySm5kMGFqS21wdDUxbWxt?=
 =?utf-8?B?cndXSzM2ZzhzRnJ4blVoTzJqMFp2ZnVTcDB0cXVDRkk0TEZJTVFiVFRWWVVr?=
 =?utf-8?B?MTgyR1hqTjNJYjJnaXlTYTJnOFh0dXp1TDRJZ0grYWpIaUcrUHNnNlRFaXlo?=
 =?utf-8?B?eUpKb21venQ4WUZKYlNodk15cVFBNmFNVGd6eEhOaGNNbituODNmRVEwSWdG?=
 =?utf-8?B?TmJpTjVmY0tjQWpVa2V5MGxnTUw5eWRxMXNSOENyV2I1VTE4eWV3T0xkNDBv?=
 =?utf-8?B?WVpIYU9hNGxxeVI3UG1NWjVYSmFmVzhDcnFjYkZXSGxDMUtjNTM4R3BPUmIw?=
 =?utf-8?B?Z3oyWlByZHhadVJySW45VnA5QkJEbzQ1eGRPbUhHaVE1bjAzM0l3Zi9Pczhv?=
 =?utf-8?B?aWpxSWkyaGViODBKTVNrUDBKeE9xY214bXozN20vc3RWU2VOdmY1ZGczUlBB?=
 =?utf-8?B?N1h2ODNDKzJzVWtoeTg5Mi92VWVjRHhNbTEzdjFVd0dCL2VmQnAzd0dOSHRK?=
 =?utf-8?B?aDZhVmJkOHJ5dElzb3p5bmxDa2ZHVVBnVUgrNURPeE1mZVZtcWd1TkQyUWRn?=
 =?utf-8?B?eFRFT21UbXBMWjNBaTM1MDQxdDhCMXBnNmU3Z01GMTFaajFyeXROMlJ1eVVL?=
 =?utf-8?B?TjBQcW9qZ0xaaVAyYUlPdnkwN3JBcGJURkhzZ3VOSk5POFFkNFprQStZRFFu?=
 =?utf-8?B?RHVLTlV5OWovQmJYTDJaRGZtWW9RSyt2bENESHp2aFpkeVVkUVNMQlZDWDd4?=
 =?utf-8?B?d1V5UU1MSG1UTkRTaDNtMEtuTVFOL3VFU1VJOVlGaG1sUVpjS0ZTK25waVRj?=
 =?utf-8?B?MW9IbUJ3cHRIV29JVWxtUmdxOStYQisvV3NJOFdqcmRzcXhiWUI0MzRTK2pP?=
 =?utf-8?B?K1BmZ2pFaElmUWZicy90MXFucngrdkFnTGxzMk4xSDVwMUk4R1I2Z1JzWXM2?=
 =?utf-8?B?bWdyR3Z2YjBNS01mSVpsTWxRSVN2eTV2MVFsMC8rSURlbHRzcHZwMERyZ3NF?=
 =?utf-8?B?QUNIR2ZYWE9OQzlWVjJ1dFp5TzNrOVlaZ0RvZk1HY3NUR2dBa0lmZEtUQ0t5?=
 =?utf-8?Q?XBdz+3Awlkr7Kf1s0nh4PY8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105807d5-e74c-4cc9-2403-08db9e763285
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 16:31:09.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coCSg587c9CzyCx8tj8m0ilx/uXqG9pOpsgdymY+N09X24S+i5DO8KXCChe+t+K+deTbFLbZis0hhdq2h6kKQ3NMtLncCrv9XXP8wDuh4Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Niranjana,

On 16-08-2023 21:27, Niranjana Vishwanathapura wrote:
> On Wed, Aug 16, 2023 at 09:18:12PM +0530, Ghimiray, Himal Prasad wrote:
>>   Hi Niranjana,
>>
>>   On 16-08-2023 17:22, Niranjana Vishwanathapura wrote:
>>
>> Allow preemption timeout to be specified as a config option.
>>
>> v2: Change unit to microseconds (Tejas)
>> v3: Remove get_default_preempt_timeout()
>>
>> Signed-off-by: Niranjana Vishwanathapura 
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
>>  drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>>  3 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.profile 
>> b/drivers/gpu/drm/xe/Kconfig.profile
>> index 9ad487647ca1..a3655ee6978e 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.profile
>> +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>>         help
>>           Configures the default min timeslice duration between multiple
>>           contexts by guc scheduling.
>> +config DRM_XE_PREEMPT_TIMEOUT
>> +       int "Preempt timeout (us, jiffy granularity)"
>> +       default 640000 # microseconds
>> +       help
>> +         How long to wait (in microseconds) for a preemption event 
>> to occur
>> +         when submitting a new context. If the current context does 
>> not hit
>> +         an arbitration point and yield to HW before the timer 
>> expires, the
>> +         HW will be reset to allow the more important context to 
>> execute.
>> +
>> +         Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX 
>> limits.
>>
>>   Is there plan to make this config dependent on
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX ?
>>
>
> No, it can be independently set. The _MIN and _MAX can also be 
> independently set.

If they can be independently set we can have scenario where there is no 
DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits

and above statement "Value should be within the 
DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits"  becomes somewhat wrong.

>
>>   If not, value should be within
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX.
>>
>
> Yes, the patch includes a BUILD_BUG_ON() to ensure that.

Yes that is correct. I had only pointed this from description in Kconfig 
perspective.

BR

Himal Ghimiray

>
>> +         This is adjustable via 
>> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>
>>   If IIRC ioctl calls names are changed from XE_ENGINE_* to
>>   XE_EXEC_QUUEUE_*. Please confirm.
>>
>>   And this statement seems misleading, ioctl call will set the 
>> properties
>>   for specific exec_queue and config is meant to be for all exec_queues
>>   unless changed by ioctl.
>>
>>   IMO better description will be "preemption property for exec_queue 
>> can be
>>   adjusted by XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT" or we 
>> can skip
>>   this
>>
>>   info altogether in kconfig because ioctl description might be already
>>   covering it.
>>
>
> Yah, the for to change the name from Xe_ENGINE* to XE_EXEC_QUEUE.
> Yah, makes sense to remove that line altogether. Will post a fixup patch.
>
> Niranajna
>
>>   BR
>>
>>   Himal Ghimiray
>>
>>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>>         int "Default max  preempt timeout (us)"
>>         default 10000000 # microseconds
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index c44540684462..4c812d04e182 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt 
>> *gt, struct xe_hw_engine *hwe,
>>                 hwe->eclass->sched_props.timeslice_us = 1 * 1000;
>>                 hwe->eclass->sched_props.timeslice_min = 
>> XE_HW_ENGINE_TIMESLICE_MIN;
>>                 hwe->eclass->sched_props.timeslice_max = 
>> XE_HW_ENGINE_TIMESLICE_MAX;
>> - hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
>> + hwe->eclass->sched_props.preempt_timeout_us = 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT;
>> hwe->eclass->sched_props.preempt_timeout_min = 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> hwe->eclass->sched_props.preempt_timeout_max = 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>>                 /* Record default props */
>> @@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>         read_copy_fuses(gt);
>>         read_compute_fuses(gt);
>>
>> +       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>> +       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > 
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>> +
>>         for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>>                 hw_engine_init_early(gt, &gt->hw_engines[i], i);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h 
>> b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 3d37d6d44261..71968ee2f600 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -30,6 +30,11 @@ struct drm_printer;
>>  #else
>>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>>  #endif
>> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
>> +#else
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
>> +#endif
>>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>  #else
