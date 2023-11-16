Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07CC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C20A10E2CB;
	Thu, 16 Nov 2023 21:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1201B10E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170813; x=1731706813;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0eWh9fbxClTaNtkew653v4GaBrhchmAQGy7TB+bxYrY=;
 b=TYIZIrpQBb2bCUACV5bMdCkHxXTWmm2mtRKQZcF5DxgnDkiCe6mPrz8o
 Sa8wDiP+RRZuSfk6iyfjLkholrlj03tq3KTSlAUGK9TDxGpa/LXV63yeo
 xzSrWlCqzR49SRc5QLpF8QSh+AGlgdZb3kXk7g5lzxdFGWu/yrO/ldp2W
 BQSlCGAezB0nmrAoGfdsDBLWgIyweOa1U3MDYVaFBeZKDVmLCeB+qdKVH
 8bnbPVP4wXMCSGb2TgGK44kTnu5UFh4BBPhn7VEswaWAE+hrOSptEMF/f
 0i4kETQYLCygVn5j80pPVfmd5QINb58rdwVUwzs3KZERAl7TUOVBS/O+K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477407521"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477407521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715352336"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="715352336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 13:40:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 13:40:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 13:40:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 13:40:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPUw/ucurfeSvwCrMuJRFX7ixLqM+4bpmZyt0Q358kC+6oV0hGU3OQ+YFPhbrZrNzYcb4h7TOjxLLExRQ4S0uScWFmYpsLIFb4i00fQWwkGmQsSA0+7uk4fjdziu9g3EOwpTpy+SeL8a/JIXXeebp7pm5YQxaahHb8eUBwc9ivWJVkdFhbQ4xezULNdZMXH/slkvooCkWYsw61lvptdg73+WsDuFar4b6PCORrn07apjpbJ0T0b7re3rOTYzNPZtCb3gzDZojJIwOT1GW58+Cbx5irRTZvqUko/6AcXGD9YQCbrusTBCegZSdLUG9KXaa8BRHR7PQbPHYZOQIHLS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4NjUc4cAjdNxSHY/F679p36+MihuIqjJuadicOJk14=;
 b=lGpRtenjbORbTPL1YJcLXjT6PDpcS/ckAqmTNPYRHVVrwzUq46QtqLpgKKSr/DmLArLpNYMeYIBaTGOWeVrqQL27k+Rl1JnDHDb9heyEhBR47qLbnAgMHxPgckbfIRfipHcFgyHNOwWOMNL12HZdR/ON0e7EMfoGtJZXjRx86IejczOoJtGQj9ilZFB2LC4m4CJBXRWzo0ftLAupROZ3izyIwSTcrLVtvJ75+jaMGxHJy6yih8NEihIPktGQMiVk467y8GIrR9ibfKyBK2JUtkzi4kbIIRE7xGdq6+CXJz2KI2D7w9CAj4UeJRwtMwFs4EIwOht1v2NwTcg17OX8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 21:40:09 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 21:40:09 +0000
Message-ID: <d2847414-d134-4328-90c5-39b8288ae306@intel.com>
Date: Thu, 16 Nov 2023 13:40:07 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
 <0a532eac-615e-4149-a634-aeebb25501ab@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0a532eac-615e-4149-a634-aeebb25501ab@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe544f9-7366-4db3-47ed-08dbe6ec9b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Om5KELB63FNpovJHYcr9aGaBDrVvMJF8MSAPd65TNZjUgzq8hs/Bgv+z9T34/pACFa3GH1K003wL2cxe1GuG8iAKREXP6fEXjCxP6jtQCke2GVC/0+Tl8EYP9ftgjRQxrFr5VXnjA9rQcC2Msnjz2oahAxZTtdSzsMJn3Bz+IKCg/tVudjjpxI+0GRh0n5wfcECDJHqZpIHdQqqeySYbf8uord7fh/QNPZnFoVH04PImXt5VBRQby8fJyf+yG/sVj6zL3AmuFBMIGp2tGYyKlyT6YIlMt6/sbTAYMqQD4iTYLDainbCs0fKVc4DoE7mwm/I6tMOPnrHSVapKxksVmrY7i/t8UG2vTAb7BqmYZ8yCjl/xktAS1q3mebYWsp3OZOalDIVFaMqCbQ01dk9Kc6jGZ9TIV2zLC4NVKDheIRJ8jrZHEut4vuIaBUPHVDBp8nlmprnhVGsgTOUtyTVjZ/4noVP2VOpXR0uAXL0kfkPD7gIp46GGw96zDddoxLpz2cP1DJwXZ5RIHOTFVltJilDHAp0ppYZirEpCBhY9lObNUfmR05vfF+1+4YnGEtEjbIWP4viuVwSDlbHbcG0baJR6C5FOnGFG4Y9RF1bhWBaJIkngP/3ja8oJVEzOv0jMvaEwE693QPgAgMnDPqYQiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(66476007)(41300700001)(316002)(66556008)(54906003)(86362001)(5660300002)(31696002)(2906002)(15650500001)(4326008)(8936002)(8676002)(82960400001)(83380400001)(38100700002)(31686004)(6486002)(478600001)(2616005)(36756003)(107886003)(6506007)(26005)(53546011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZsOUwxNUlEd1BRZ3JtYmJuMTJSMUFtcnhDTlI1d2V5MVRmeUFEMS9GTUJQ?=
 =?utf-8?B?NGZXc09MTnpzVXpNWlFTL0RhRjNjTHlKeEFUL3Roa1U5T2NQVEF3WTBiZ3pZ?=
 =?utf-8?B?akpCclhBbmZVZCtaTC9RVEF2MTJuVHlsdzNTTkJOUm9OejZsbGZTSHdBZDcz?=
 =?utf-8?B?WWN5bWxEdE0vT0p6ZnYwNGc4VS9VSmQvbjZMc1gvajlwVktKZUM1bjZYMWlR?=
 =?utf-8?B?M3hidER6MUtNZEQ0OHRzbEk4dng4M1JRbGxZZ3puSUE5dktscVUvOWNRSDdX?=
 =?utf-8?B?dzZlQXdWZGVrZkJsL25sRGhTamtGclRaa1dPUG9yQVQ1VmVTNFNxMlFNeUhp?=
 =?utf-8?B?dXptMTNIQ2FmUUhYYVkxOE9OZTdNZlE5cXBvNTZwU1M1U0J6cUhyK0tOZHZU?=
 =?utf-8?B?VUJya21nbVBMUUZMMXAzNFNzS2xocTFzZzhpb0FlTmxZTGxQeWM2MktjSlVK?=
 =?utf-8?B?Y0p1ekxXOXpCTS9pOWlsWXNJNjdDZ1gxc1lyNjdzRUVCbHBTUXl6Qlh4aHIy?=
 =?utf-8?B?d2E1NkVnMWhiektiS0QvQURDMTJwQmF5Wlduc2xGQUE0b1lQL0RZeWRRSHdV?=
 =?utf-8?B?cXRtTWo3blRtdDdQYWpPUzFockkvTnkyYmI2eGJxRElmcFVFMmdlWG8xUDFE?=
 =?utf-8?B?aVZwR1h4bWR3L0U5K1Q0bVZOSmd2d2Q2T3Q3aXl2SlZIQU1lQVRNTDF3U0Zq?=
 =?utf-8?B?ZTdoL3lKK3NvVlp4TDd3b3VyWmxzTnJ4R1VZcVloWXE0ek1ybys2akNXN1Vy?=
 =?utf-8?B?SHg0aG9haXZPSDhMZDhSaklwYms3b3BjNHhFWWJKOW9XMkFVbzN0N2doVzVh?=
 =?utf-8?B?R0dxbzlQcEFmOElOMWM4VzZBclhJSVhnSkFodjZyQlhwL3d3SnQ2QWZlUFVM?=
 =?utf-8?B?ZTdRc1E4TUE5WkhydkpCN0ZhWW9BZXQvVXBrSVVmTTI1OFVGSFA4cXk3Zktj?=
 =?utf-8?B?TmhFckxucnh1VEthWEZpbWx2d0FIUEpUSTl2SFNsbmxZQ0FuZ28rekloanBr?=
 =?utf-8?B?a2NFMExIMVFiYzhaNElvbG1sZnJwb094TEZBeGFQSGpIdjdTQUMrUFFrd0dj?=
 =?utf-8?B?Q2kzQW1NV0djajRJc1hueFVuejJkdTdjRFZ4YnRVa3MvSnk4KzRZcGtIMXBC?=
 =?utf-8?B?dDdvYzdVdlBsQVlHUk1PSU16alYvbTQybUN0dHVlZnJKZGRQSFVHSjR6ekxp?=
 =?utf-8?B?NW1vUHdSOThDbWNWT2pOV212TWcwS3Fzb1hUamNNT0hTODZZS3IrbjJNeWhG?=
 =?utf-8?B?T2pLSTh4L3daLzl0R3Y1VTI2MURuRFRjNnBTN2w0YjdNb3F1NFJqRXhSekNZ?=
 =?utf-8?B?YnhZY0V1cGtIV0FOMTRDUGRJSkdHajlBaWZmd2V6SWNZRTNJMStWK2hwdlBI?=
 =?utf-8?B?L3RubXpJZTFIM2JhWHN1K1FDSjlqMGNzZ01NNENhTU1WcmFSd1NsOHYxLzJv?=
 =?utf-8?B?bjFUK3QyT2tEeklDakhST1Z3KzZzU2wrNGNvTjZKQkVUbVFZV21XS1N5VWV3?=
 =?utf-8?B?R04rQkRPSzYyTE1BYVBtdzJrSEY0Q2lvN2pUYmZhUDQ2SnlsK1MxUS9TTnZN?=
 =?utf-8?B?WDExNW5oRCs0YVhZb0RKRmlzcElnRXYrK1hVeVhJSm1OVEVwQ0RGY1dPdi96?=
 =?utf-8?B?YmNzQ1hjaFVLa25XdkNTKzVpWE1kNDh0QS8wOE5uZW5ONXhXUGhscGxLbjJo?=
 =?utf-8?B?WEMrVXhnR3hKSzgwVFlRWWJDb0JzbVhQTURLYVNFM0NLR0dpQjRJZ1ZWbWpx?=
 =?utf-8?B?aG9IdDBJTVhUZkNvbzZJSW90WG1EeGpic2lIbWpWZlp5Ynluenk1SDF3OHZI?=
 =?utf-8?B?R2FWRVF5cEg5QVBDK3NFZ2gwMnhxU1JIbkpyRVpETFRCbTU5djcydEFkYmRU?=
 =?utf-8?B?b2lCTU9yYXFWYndNM0dzamtPUi9hWFAySWxjM2xpMnkzUDlSVjIvdzFmNWpj?=
 =?utf-8?B?VXlzZjErSStWMThoNlRIS25WdzJES25sZnRCY1E2dkVKUGp2M0FCUlIvU2hh?=
 =?utf-8?B?U2hCTjlPNlVTMEo0T21yU0VaOUpONVR2RE4vcTNpajRjVUR3NlpLMEppYlhu?=
 =?utf-8?B?T2RidmUzZU5scUYzYnppd0VTT09yeTM0Zk9OUWdhb2RRTXVKSnduVlhCbTNG?=
 =?utf-8?B?enVSSDQ2d0FMWjhjZDUyMXJsYXhzVFMyQUZISDBac1NBQWpEWWhYaEFqSm14?=
 =?utf-8?Q?KuFpYheoJ5sAD6sPa0YS9bQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe544f9-7366-4db3-47ed-08dbe6ec9b20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 21:40:09.3543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3WYnYezeoKvBkKkrzstMM3exVZGtuShXM1jXvAwFlJuDQbwW41Dc8BpkX1WJmLRsRv5oGpZ6BCMMSy9GvPD4ceUr1TFMKPGiFDuG3StWZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/16/2023 9:12 AM, Michal Wajdeczko wrote:
>
> On 16.11.2023 00:40, Daniele Ceraolo Spurio wrote:
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
> you should also update doc above (bits 30:28)

ok

>
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
> why ? it's not required by the HXG protocol

This was because the EVENT/FAST_REQUEST submission always have fence 0, 
so I wanted to make sure we didn't use that for normal REQUEST as well

>
>> +			g2h_fence->seqno = ct->fence_seqno++;
>> +			if (unlikely(!g2h_fence->seqno))
>> +				g2h_fence->seqno = ct->fence_seqno++;
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
> but why we don't use fences for FAST_REQUEST ?

This is not a change in this patch, fence is currently unset for 
non-blocking H2Gs.

>
> even if we don't expect any failures, from the protocol POV this is
> another separate flow, and we shouldn't reuse same 0 (unset) fence for
> multiple requests sent one by one.
>
> it also will make any debugging much harder (if we get such failure
> response) to figure out and match that error with actual request
> (without deep analysis of GuC log, that might be lost)

I can assign a fence to FAST_REQUEST, but I'll still need a way to 
distinguish between normal requests and fast ones here. I can't just 
assume that a request was a fast one if it isn't in ct->fence_lookup, 
because as the comment below says the fence might've been dropped from 
the xarray due to timeout. I'll try reserving a bit in the seqno to mark 
it as belonging to a fast request, since the H2G protocol doesn't care 
if the seqnos are not continuous.

>
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
> we should at least use xe_gt_err() to get the GT id in the log

ok

Daniele

>
>> +
>> +		return -EPROTO;
>> +	}
>> +
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

