Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F586C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 16:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7610E64C;
	Thu, 16 Nov 2023 16:51:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241510E64C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700153505; x=1731689505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d1e6p/QBcCay0RJqycYbqCSuIUcxK0LdGA1OzY7GaP0=;
 b=gypobGYhQNtV/uBaMM8SgI8+vlqDUfGuYI1Hun8c7sXtSyPisUD57D2K
 j5nrq20D9w4KScimgSiS6K3qf213u849MK+sNNNPGqPDfG3qBMR7lGVrq
 TnpzfQPArc+cypUgK7OLVmh8HY9mKkOnhMgWByMBBEnhsBP5DqVP5nTTJ
 iu5uyV7vx+f7bFmEYC/MqtQ+kJ7S/hoTtmP6rOCcVovA7pDgjZui7wNMR
 KXYGBvWrk9BtFXiONJ6oSqa+HS2XStU2zOiUHliVY1NrtfLvGdpGskmRy
 3M4y1bwT3nhnqnU31KoGPKy5gf7Zt+OLgqyUEeftbdfsyy/Z3QQ1D7aL6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12676165"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="12676165"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 08:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="888956145"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="888956145"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 08:51:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 08:51:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 08:51:22 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 08:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKYr+JNJBXsG0z52IB6L+HaYUe3DSxk1RWyXRfcQRu2l+A7L/QYHjtbmuLN/CB0xH4lax4VN7sJOMEAL08qMxRG6vWvq2fKcWbGRKL4YwcwA8R1+Oo5XjBLMKUsQFXZs/JtK/0w4bP8bitU54ygczRl9gbwo5DS9H2M2yDc3OF5GrZaiujShJbtx0vNZaMpnX70Dfah2meoQ2CFoyMsQgRFbsb5s59N5ouFnn4C0tc2DZRYOqN9W79vT5JHbV2Rex+ZtrQCptCD7hOiUI2oHIB6w5BV3kc/AePh6n3CW/O6R97uNNOlBPO7yogTJu1avJ6gM3zBB5wCVqF8rh4fmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa6XxKDdUPgvfEQPwS8DChS6cS3KQZvnOZESSJq/+oE=;
 b=mYObTCkNcuGR2W32kCnVw/i7tIHm0su12P85ECms/J0cIqBy9RXV0bvd83SilhNdMedRlPw49gH/NHmHdZysYLW09GyNo99JClyeMG4vMy+emO5LfoXLGtUBpoMRWiEWJd11f2BHnK+v4dTUpkluh1sHLNmAonr1vW2djxFGkKsBvqj22kDpRpdRNorHUHO52K97pAdoJOpd2JedV3lDkHungr1i6WoAT5V3+HRJwbBaqyHZaD/jF83bG/1/0yh2Q1vZSE5wVzGQrGqfbHEs/59kUhvDCSLTWJUBg8Oi8wuZfMBrfb/3nH3lZ1ngO9yjAYZGhdZ8X4mDN6JvKM1GVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 16:50:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 16:50:53 +0000
Message-ID: <faee7a62-4c95-4964-a275-c4cc43d8e502@intel.com>
Date: Thu, 16 Nov 2023 08:50:51 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
 <ZVXin+3VAGkegHGZ@DUT025-TGLU.fm.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ZVXin+3VAGkegHGZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9899ba9c-5c20-490e-7bf7-08dbe6c431f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJX518wfmahqFfGl1texmaJbmSvnNM+VDvpMlM6wyAOBxAdQLl0EkKe82P+GczO6Q9VqY03NJsHXacvfg+8WCpCue4kyTKkZ4sj0CES3SzMuwKyne/H42B9R2UC2E9dymOWKaWTPAU3ypr7Bxi5gd2UHq8DpJH4sNTj73ta3JXuR9XoE8MDAT2/+vEOhuT2RfVym0G3EWOQdJnWaE/GZOYOC2zWAVakrSZoQImlft6vO4T7OoM3tmNEOpplE7itkh4dAdzF4HMlSgFU4bEXqIhy3P/WO8ZIRiwpb4EDYxE0o5PEfiQG3vVfZ8OrYFnlp6jiCgDQ0TxghFRRjJnQkySWgOFRvYqu9NHRthlxmjZiG9WAD3DwcToTzC2oqIHEukQRBxVZ1bFhiKdLTWYVG1ZUJYwT8MUzLVSMA6ftRF84wTTL3/lMjYuRptwZA4BC1YxEdFyqq/aryPCH4K43Jre5Ug3IzekWqxeKnCl+s/T8b+2YYPM45NszvT4BazqD257m1F4ol9fniC8y7n1VKrUTSfpCGYTz9HfW+g8k9F1ib8Cmef05ttLqAVQGJB8K7fRcrqqSEytH3yB79dbyaSoxGwJHwdNLS71wzDj4sOXyB3JQUiP+TnWK/udbLlLFiIPBoK6g9Xi/TlUFFtz78JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(41300700001)(2906002)(15650500001)(86362001)(5660300002)(31696002)(6862004)(8676002)(4326008)(8936002)(36756003)(38100700002)(54906003)(66946007)(66556008)(66476007)(316002)(37006003)(6636002)(6486002)(478600001)(31686004)(83380400001)(107886003)(82960400001)(6506007)(53546011)(26005)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N251QnVUUjY5MWNGS1NaSFd1R280UENGeFRLUjgydHJyT1Jta2xmSFhDQjFy?=
 =?utf-8?B?dHJpaVNIRmhra2JOTjlkNE1NS0xnYno2dzBhUGdoVDJ5MlhCRWdmTkpWaVMy?=
 =?utf-8?B?MnIvYUY4emZZdVl2QklEZVFCcmpnK3BsNXRKYUhGbUVyQkxWYnpRaGMza041?=
 =?utf-8?B?dVJmakV5R1pZb2dOL0pMV0VJRUZ2VVNqcDhBeXRVSHA4YlBoSXlPbVZ6RWJE?=
 =?utf-8?B?YWZ2TUNtTlhKWXBDbVdSM08yeGxPNjlwOHF0V1Mvb3luTmdOVDNmMUlobDlJ?=
 =?utf-8?B?alg4bjJrUnBPNzA4Y1FNdkkvREFmUSsrMVkzNWZ2NmcxM01iUWpWTXlBbFY3?=
 =?utf-8?B?VFJLcXlqYWZ0YlBTcWRhTncwTEhWV29KYm5LRlBiVFpaMWdHaWJwNHpSaStW?=
 =?utf-8?B?dW9hdzBVcTVaUHFWQ3FrQkhZVC9ubllBZ3pxVCtsak5uWEQ3MVhybGlKNkpN?=
 =?utf-8?B?S1hLNG0wU1E4ditISzRmQ0pNMnUvcTZSTlFmdUJuaHU2V2hWMnltakMyM3pl?=
 =?utf-8?B?cmRjOUwrdXZjUjNrMjgyQWdXOEpxR0VrNFZOMW9aREJSRURZL0FrOUI3RFc1?=
 =?utf-8?B?WEFHN292SGNhdGwwMWozUzhzRmwwOGlKZU1VL3RMN0JsOFdaanR4cUtXTFpR?=
 =?utf-8?B?dEJJdThZeEhOMWRheng3ak5yUWc1QmFsaXNrYy9kRkMvSko1cmx3NHhSbjc1?=
 =?utf-8?B?MnlxVFoxZU0vVk0rZlNWR0d3UTZIOWhMRTBXQU5uU2hQRlZKU2JqWTNMRXZS?=
 =?utf-8?B?djVWK1pTR01ONG5EbUtFQjU1Rm5odVlyT09FTXNFaHdKdU9WaUQrSzdhZXJP?=
 =?utf-8?B?TE5rdkxsZUVNazd1b0dMWGlUQnppa1lKYkE4M2p2eXEzd09uM0luUEVtUmEw?=
 =?utf-8?B?RTRQM3lwU0FGZmNmeUpXS3VpQjdrVVZFUUZUOUY4alpFZmptQWQ4RzFHWDBS?=
 =?utf-8?B?bi81QmVkSzFJN2FndXp0ZVdhRnBmdHVDc3JabDg0SWM1N0s0ZWF2bzBheDQ4?=
 =?utf-8?B?ZzRlUFJ5UmJKc21JLzBKZmFFenRKYWEycitvODVYSVQxQnRObXlMSFlXaU9i?=
 =?utf-8?B?S1YyS3JkM2phdXU0dmlxa1E1QkhZRlR3anRTSVlrOGpvV3NIbWlFYWJaZFFF?=
 =?utf-8?B?MFBMOENzOHpSZ2hoT2pNZ2xrNVZvS0lOOUtZUG1pb1BsU08vY0FUR0pyMUNi?=
 =?utf-8?B?NW5ESHpQUFczYnBBbjN5QXljandvKytKcnJaT0xTUzQveFZhZzdrRE5RUWhU?=
 =?utf-8?B?VUVOcWVYTjlEOFRXSUV2dmk1cUV4QzVSU1Y1ckJaM0QwU1M5NlNDTnF4TzVD?=
 =?utf-8?B?d1BTbjY5dzgzbU9qVUUySDlKam50ZFZVeTBlODlwQVJsTUtvalFNRngxNi9U?=
 =?utf-8?B?VVNFTHJFaUNicFd3YzZTUjNobXpHWGVzUGJxSHZ2UE9uUE4rWUpqMXlDU0dp?=
 =?utf-8?B?YVZiNUl1TTdYTTNEQ0JyY2VPRTFjUzRTc0w3OFRnQkNhS3g3Ry9hNDc3Rmo5?=
 =?utf-8?B?aHZWb2dKN1JXdHl3ajZReEU1YTBIUFNqZU45dkRmY2lIL0o4NkFUeEZ6N05H?=
 =?utf-8?B?Ui9qdDdsQnJnSG1GMWRsV2xRcmJlR0o1YzBXdVh4ODY2TGNCbGpqOFJRMW9U?=
 =?utf-8?B?R0FCb1pOeWJITzU0NW9qeVBpNDF1djA1YWFwWUZ1L1RManMyOWJxUFRMcXFO?=
 =?utf-8?B?bnhtKzlHaS9aQmIyRHZkaXA2aDhBb3NsMFN2THJSUEwrdFNkbXJrN3R1Z2lZ?=
 =?utf-8?B?YnZOTkJXbUFGMmlzSGtrUTdIMmFzYTVpSXJ6SzZZVldFUUJxVGxMQVE5NFJu?=
 =?utf-8?B?aTcvNkpZcDk3RklQeE40aStQOFh1N1oveHVlY2JJNW43Q0FNenVVRzlmazYy?=
 =?utf-8?B?QkJYZFVhTjExUk1NNEF5bk5jTnhvbitGdnpKRlQrZHAxbTdjTndqS3Rramdo?=
 =?utf-8?B?TVhSWlhSVWZ1Tkg3RWV1UzRlaTc5UFlZU2FTOURaVEZNOHNYN2lsQmgzMFEz?=
 =?utf-8?B?aW1SbmNiMWtMbHVGWXo4eGJjZTlmd2pOOEpRdHlkekpMTlY5RGhIMlZuSmxx?=
 =?utf-8?B?U3JldTFXc3ZnMW9pTEx5RDJCQURMYmZSRWFtVms5Q0JNRWtiSjc2cWFwTVE0?=
 =?utf-8?B?bVRNRVdQSVkvMm5iQldjVFpGVlFMbVZUWjQ2bE8zSDJQN0pRaGZSczlHNlRV?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9899ba9c-5c20-490e-7bf7-08dbe6c431f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 16:50:53.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bGTAsQ/Ag8xCjLAeFju/zpRyzyTv2PZ4zhn8aySwp9ZlmgujlcIuCorMbmksohYcakgS8ILI8VifbJWjQ3k0cK+oj8pj/645V4AK27jLdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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



On 11/16/2023 1:36 AM, Matthew Brost wrote:
> On Wed, Nov 15, 2023 at 03:40:43PM -0800, Daniele Ceraolo Spurio wrote:
>> We're currently sending non-blocking H2G messages using the EVENT type,
>> which suppresses all CTB protocol replies from the GuC, including the
>> failure cases. This might cause errors to slip through and manifest as
>> unexpected behavior (e.g. a context state might not be what the driver
>> thinks it is because the state change command was silently rejected by
>> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
>> type instead, which suppresses the reply only on success; this way we
>> still get the advantage of not having to wait for an ack from the GuC
>> (i.e. the H2G is still non-blocking) while still detecting errors.
>> Since we don't track the non-blocking messages, we don't exactly know
>> which one of them failed and therefore can't attempt to recover and need
>> to escalate to GT reset instead.
>>
>> Note that FAST_REQUEST failures are NOT expected and are usually a sign
>> that the H2G was either malformed or requested an illegal operation.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>
>> In the testing I did locally I didn't see any failure responses, but I
>> didn't run the full CI suite. If failure responses do come out from the
>> CI runs, I'll try to fix them before merging this patch.
>>
>>   drivers/gpu/drm/xe/abi/guc_messages_abi.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c            | 28 +++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h      |  2 +-
>>   3 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> index 3d199016cf88..e517e2a740d2 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> @@ -46,6 +46,7 @@
>>   #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>>   #define   GUC_HXG_TYPE_REQUEST			0u
>>   #define   GUC_HXG_TYPE_EVENT			1u
>> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>>   #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>>   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>>   #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a84e111bb36a..81d727b72709 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -448,7 +448,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>   	} else {
>>   		cmd[1] =
>> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
>> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>>   			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>>   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>   	}
>> @@ -505,7 +505,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   		if (g2h_fence_needs_alloc(g2h_fence)) {
>>   			void *ptr;
>>   
>> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
>> +			/* we reserve fence 0 to indicate unset */
>> +			g2h_fence->seqno = ct->fence_seqno++;
>> +			if (unlikely(!g2h_fence->seqno))
>> +				g2h_fence->seqno = ct->fence_seqno++;
> Good cleanup but looks unrelated this patch.

The code below matches fence is 0 to FAST_REQUEST messages, so we need 
to make sure in this patch to not assign fence 0 to a normal REQUEST.

>
>> +
>>   			ptr = xa_store(&ct->fence_lookup,
>>   				       g2h_fence->seqno,
>>   				       g2h_fence, GFP_ATOMIC);
>> @@ -792,6 +796,26 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>>   	struct g2h_fence *g2h_fence;
>>   
>> +	/*
>> +	 * FAST_REQUEST messages don't have a fence and therefore are
>> +	 * not tracked in ct->fence_lookup. Note that those messages should
>> +	 * never fail, so if we do get an error back it means we're likely
>> +	 * doing an illegal operation and the GuC is rejecting it. Since we
>> +	 * don't know which action failed and therefore can't attempt to
>> +	 * recover, we need to escalate the failure to trigger a reset.
>> +	 */
>> +	if (!fence) {
>> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>> +			drm_err(&xe->drm, "FAST_REQUEST H2G failed! e=0x%x, h=%u\n",
>> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
>> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
>> +		else
>> +			drm_err(&xe->drm, "unexpected response %u for FAST_REQUEST H2G!\n",
>> +				type);
>> +
>> +		return -EPROTO;
>> +	}
>> +
> Was this intentional to before the lockdep assert? I'd put this new code after the lockdep assert.

It was intentional, since I'm not accessing any of the stuff that the 
lock protects. I can move it to after though if you think it is cleaner 
to have the assert at the top.

Daniele

>
> Matt
>
>>   	lockdep_assert_held(&ct->lock);
>>   
>>   	g2h_fence = xa_erase(&ct->fence_lookup, fence);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> index d814d4ee3fc6..62f98dcaeaf1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -99,7 +99,7 @@ struct xe_guc_ct {
>>   	/** @enabled: CT enabled */
>>   	bool enabled;
>>   	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>> -	u32 fence_seqno;
>> +	u16 fence_seqno;
>>   	/** @fence_lookup: G2H fence lookup */
>>   	struct xarray fence_lookup;
>>   	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
>> -- 
>> 2.41.0
>>

