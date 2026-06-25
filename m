Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075D9CDB47C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 01:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9669110E139;
	Thu, 25 Jun 2026 01:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K02oVbhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5D10E139
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 01:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782351473; x=1813887473;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EPHG17C0h5qYtQWNw6NvdnJQLytIOnBQ4GK98diMQT0=;
 b=K02oVbhilX5E3pJC77kpXlG3OlXa6qOlAWbXm2BrRbI9XZOcpPn4DC+W
 e4l6EyktOXqfzZ3cbslgbwApR/O6Grdtc+wn8Ivv+IkSQkTpDhlAOaFcP
 iAk1QvX1dJRFmLG0fknSUOYWMf8lYSj49amgZHg8OvXkDD8iNyhWjowku
 4OmvCorybBK/3jP+d8zG03n9+sNblncM9VJhpgaHm2QBcQK55bEE8SNB4
 KRu2mwxJqZAiGd/dyVaG/jt4v8OPMsLYdGFwPax/67q/E29uBP2hSJO5p
 mTrjCTMBEP//VQjmOQUpiMdwR52zIwBEe1IQNz5ZLLBvMvR1zdCDgyPYA Q==;
X-CSE-ConnectionGUID: w2q4FivTTUCtSJ0qCyVHlQ==
X-CSE-MsgGUID: WQM2/temQS+mMlND3NbseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93777107"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93777107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 18:37:52 -0700
X-CSE-ConnectionGUID: +R11BeEiTwOlOQhts2fxUw==
X-CSE-MsgGUID: SeKCF5APTjumWyz7GuXXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="252163019"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 18:37:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 18:37:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 18:37:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 18:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO8NZmBuqidRIQAAy7GtTDsCVGxLHpeodNMKT45pu7Qym2PTRhTWzjEBNdnBneKIN53cQXnjaXk1sECBB1IqAaB4z5B/b7dYs5kevQiNFlU3W7TRJ8We+MYIRii/bcy86kwlja3NCPSGjxswosqMS+wLNXaf/F8gwmtk1GOn7/Vl6f8jLtWQRQm+XxqWTrGL8jEL41GfLGXiRF6CvDPD6z07mwUalrl/TGMCMf7SSjBcMVYIAmboqfc+rye5VtXTp8OkMd9eFOnyztyQqPh9y9S12RSQPaRwTssOo8Yi+YP8pRFUX8yxJFBVul2V3RlrKo1iouSR5MmePr8I9jVkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah9N8K/sfNOj2Yi4uNlxYCKraB6Q6EpWzDBlbg00A5w=;
 b=FMC/qbQZBGKRAPPGuahhd1iaEF4XtetS6a2OIupsyghrHaY0sg93cAzYt7pfxsJAegrrxVuI5Sd2hra7aQqGqxmYcdUOJ6hVej5cHavAGsGxTytEOw9TPAUMzA76Rs3oAYStr2ZIHkEp4JqZ8DwiV7Z0LwsIt/DKX6xuBx4m4XBqLsOFBTWvcB8i6lW0Zt5NMrDB//4596wC+hoVLGAm5/JG2aNSeG+YLsBdKJUPtWg7GOtfiyMUOvy3nUxGGdKQVX0w+Zb2bxgNXS095tDA+S3+tAVbnTsBzaJtWsRGZvr6WUsc/ebADX6Z9Ce9pQ6czzVkPLmamonAJ8hHobwMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by DS0PR11MB7801.namprd11.prod.outlook.com
 (2603:10b6:8:f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 01:37:48 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0159.013; Thu, 25 Jun 2026
 01:37:48 +0000
Message-ID: <af94d6a4-b3b5-48e9-be73-598f06075672@intel.com>
Date: Wed, 24 Jun 2026 18:37:45 -0700
User-Agent: Mozilla Thunderbird
From: "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: Re: [PATCH] drm/xe/forcewake: add delayed-release optimization
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>, Maarten Lankhorst
 <maarten@lankhorst.se>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <aiom7bfet3CddhLq@gsse-cloud1.jf.intel.com>
 <aiooTTc2eP+uFqL1@gsse-cloud1.jf.intel.com>
Content-Language: en-US
In-Reply-To: <aiooTTc2eP+uFqL1@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|DS0PR11MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a209688-c6b9-4cf4-44a5-08ded25a5cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: bxjbzHyNUUyF1bwtNUilSlTd2oezTMF0oQ1TSw56i14bWswdEHjv6k2HxyIIxLl461SKnVtzRVKFPyBAnpmr9BpfG3Hmh42MvFRI2qOnEBsAkuwB+zdHgMuP5oq8TX+nGU/e7Q4TvusVGnpx+9byY8nkLzZosU/v+7731K83UOtH8mh3LYkUMig7Lq231gzIjWLrLqgyxH/SJXRaFaL8fbGvRbg2VT8FiZiVkCVJovr0q5MJ7PuzvD+J4199dzE7Covyo5Cjtsqgzd0q+RWX5efsUEclLPZbq8fWH6m3n14up9ZRAZr6DIHl1F+LLxhoyFYopKKdqP6uAF83TJP2rtTBGZCqzLFCim9XVHrUTweHECW6b9VMI3inkOVOje3O3MCJaGmvpDJ65KY+DEMJ4Oj5cSO3i25XbeRei3FQutnxDxTftpYc1/ZdCGCcFK0k5C5keWLeVYummQ/z4pd6od158cI7wzKtu9+TOQj9q9FLezgiX9hHL3VKdZWxC2VuvL3ihm7NvHqNkSCNlsYmQ+yGaSaWq9E+RlwqosOVR9doBu0+AsH94reTSWCnpf5/xpWTjAdQMmjbbvgyEXCsVJ0nPs2G8krov0a28t8vq62a1la8U1fCmnYUCu7Ioffdw4eIoLmfpIBRoIj1eKOoYkO/m8xYw8/cSU6w0YZ7tXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpIMmU1WGI0Z2REUzBSSTU5b015dVNaaU9nMTYydDJrb0xtaEp6dTdIQzBi?=
 =?utf-8?B?dmV5cCtBeVJvZUdUNmRJdDJoUXFsVXlqSkIrOWV0L1NvQ3lwOVlmK0xlcVBo?=
 =?utf-8?B?ZzNWRGdiWmsxNW1obWdSMVNSc0duTXpyM0U0NTFENklLcFFrV3J6RmEzY1lt?=
 =?utf-8?B?bkdOQWZGR2NYSzBzWHhaQUgrbEo3SVpvM3gxUEJhTnk5VDNjdUxQSU5IV3FU?=
 =?utf-8?B?Y3o2SGNiZjNSSzRtQTh4NVF3bDZlcDI3VjVoTGJ5VWdibURWOW1nYjRIUC9v?=
 =?utf-8?B?NHhjU1J0WWJQUVRqaW1sYUJ5YjREUUZkUGxkaW9aS1czd2x1bkF3SWo2SEdG?=
 =?utf-8?B?WElYYkUvVXFoeHBlN3V1c25MOXdvYlZDUVNaWEhsVnhwOHQ4eHEwUUpNKzRt?=
 =?utf-8?B?Y3dsd01kTVlPWTduVWwzT055dENwamgzTE1GZzZwY3FPdGZFaFNMb3ZKMFNn?=
 =?utf-8?B?Z3hyT3VsL3JFUC9KeXE4c3d1VUoybVRuNWdSMkk5YThiUnlIdHZjMWEyMEsz?=
 =?utf-8?B?WUpJZ1hGM3E4YlhCdDRyMEdzUnVycmpIMCtkemJ1YWIzMWlJRmI5bmw0RGxS?=
 =?utf-8?B?THFBWWJLSGFPWU5PNjcxNjZiOXNSTnpiSEpva2ZLUCtJRWp5UDJySWxtdmhH?=
 =?utf-8?B?RnFVWUdFRW9tVW00MjYyT1NRSHREcmFmVjAxUDYyeW5TS2dqTVNKb2Vna2g1?=
 =?utf-8?B?Zlc4RHQwRDl6R2ttWVBUZEdkQm1QVlE0L2ZBV3h2emIrTTJqMENOeWo2aWxC?=
 =?utf-8?B?L0k2NTVLWHFGTDRKbjBUNXV5R2lCYmhDejlubXA2RjNOaGNtb2pWbnJaOWM2?=
 =?utf-8?B?T2h1TTY4V3VUN0kzcnZ0QUpiMHhaWlJZYlVzZHhmMDByall2RFlQYVd3Vlgy?=
 =?utf-8?B?WFp3dFhld2RlUlR1L2x1cEloVWduazFrbUVzS1A2N1FURms3cVQvUzgyZ1Bs?=
 =?utf-8?B?VDZSUWZDaW9vRTVET3hRUEFxa1ZjQVJHUzZ0T2xsQlladHVkU3R1YzZoWEps?=
 =?utf-8?B?N1l5NGhPeFE0ZWFjQjY0NkIzWTA4MWsvZDRCaUJMK3ZJRTNqdXRENDBueFFs?=
 =?utf-8?B?ZFF3Mk4vN3NtR0txc3FuQjZPL3pYZi8rNnJjenBqVWthZm96TU1oTVQ0Tkxu?=
 =?utf-8?B?cFJRREdVTFYydnJ2bWs1c0wyMy9YbTlGNWtzK3pWUEw3T2N2bVlJOWZET0tL?=
 =?utf-8?B?TEdEakNCTmZVM1RrTHUzOC8renV6OGJiczdSQ3oxaTRzN2M4Y1FPc0MreHFT?=
 =?utf-8?B?MnVxdlNsaG9kc1VVNHIvS29KcVJOeXlHclBLVk83K05IUVpIcXlTWURhd0xt?=
 =?utf-8?B?aG5lVHNvSU1TSGdYRmdIWGlDeExGSWFCK0c1YUtvVkVWckM1K0dONXNwWk45?=
 =?utf-8?B?Y0ZBTjN1c3ZOZ0ZaUER5Z0lmVGJ6UklwOTdhSnd1THBtck0xWWdVYWFtTVU3?=
 =?utf-8?B?NzVGb0R4aTNRSnpyV08rZ0s3cUdLR2hXQnZLRDdQMnp0S0FxVUUydEFXdFNW?=
 =?utf-8?B?MDZZcnpSY2JNaGx6T2hHSnJBM1FXclZGM3ZENTdYekUvenRjMEdYcWFMdUZV?=
 =?utf-8?B?b2xOOUUyVUFYOGIvMzFod01aZW1qMzExQTN0MmNhQXl2aVBQNGRJU1BTMmdo?=
 =?utf-8?B?K0kveEN6ZVNjbTFwTkY5em51RFd0NmNORk5tYzRPMzh5dzRiMzU1b2hsMGM0?=
 =?utf-8?B?Q0RZUVQwVU1wYWpTWTRsbW8xRXZzcTdMd21NV1dVWGJWaG5NbDV0Y2E1T05H?=
 =?utf-8?B?UkdDUnFHZkd3SC8zWVdOL0o4Q3MrN3ZsTWxuc2VFUHBQdnNNSFJ2UDdpcm9N?=
 =?utf-8?B?aTk1K2FMSHY3MThJSEk4TExnQVh0VTgxczE3N2tPOFhBZWI1NmtVUmdKV0ZQ?=
 =?utf-8?B?eFB1NWxjWEd6TWJYazY2Ym56b0xqdTFNWGRzZmZaa00rZDJyUzg1NzhrZUVt?=
 =?utf-8?B?NDl2cFhKbW1wbUZlWjJ6dlU3TkhMTUhlVlVIYTM4amNZVzNna3p5UmdlY09X?=
 =?utf-8?B?WDB2NzdaajNFSG96c0pFV21OMnJUSFQvRzR6cFlhVllocUJPc2lPK0VsWkdx?=
 =?utf-8?B?b2c3Q1dLbGZyZjFMNFlsdk0yM3JFWGdjRU1PUWhqTGE0Y3dySzBTQmtRNUFw?=
 =?utf-8?B?N1RUUG9XTW0vdjFxQVZNUHNWM0M1M3ZVUXk2NjBjWTlPa0t3ZE5wNUlqdFZw?=
 =?utf-8?B?eFRTY0lLMGg0ZnJSYmdxOGkzYjRBQmhRYnVBeU5HZHJEVjFBc3lwcWlLanFP?=
 =?utf-8?B?QnJIeWFSSmZTbk9kbEpIc1o3a2pTUEJjcHpVSHQzZzZGSzNOTlQzSjYvK1Ri?=
 =?utf-8?B?US9vTzJYR2tmT2lzNFJVNGhBN0R0SUNFTFU0RVNyQ25uMjVvbEM0Zz09?=
X-Exchange-RoutingPolicyChecked: KhcrYPKDxRzipyv7VBleMjcy40+mC8amcEfrgpvLRtLkH+EE21FY3JzLdJOpJS++YdThk29qNWldOJGUqbhKh9oTmo2cD6sNKAZaHKKsaYC3NL6KzuyF9OG5xKvzLRe30AFP2pcui2l/SECjtBOwaeBScQGZrYyBhATX1y8AEQd3BBd8yPFN31q0DrXwN0PcdoRL+9/9E4bKhYO5tRuD7BBFzfZKCaNZ1F+bKuReTyRo1fmpPIDQWpIYZ9vH5BBoRuUVWSO1cWrrLLyc/Kajb2dE/VVcy2gaKCVoJxcKmTF16wq8mIfR2SDyKdLy0L7cjZiJoJnGHyY0YDLkgVc9eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a209688-c6b9-4cf4-44a5-08ded25a5cd9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 01:37:48.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dTXgIixnFCm55o/9kHYNjGJ9wRVy4weYJcQ6zGLnwIBldR20Cp0qaWIqRf2C59gAtXJI8B7oufe2Nb86x+e0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7801
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 6/10/2026 8:15 PM, Matthew Brost wrote:
> On Wed, Jun 10, 2026 at 08:09:33PM -0700, Matthew Brost wrote:
>
> Ugh, I realized I replied to wrong version but I think most of comments
> are still relavent to v2, so let's continue the discussion here.
>
> Matt
>
>> On Mon, Jun 01, 2026 at 09:38:04PM +0000, Zongyao Bai wrote:
>>> Add delayed-release optimization:
>>>      - Add domain sleep 200us after xe_force_wake_put()
>>>      - Skip MMIO wake in xe_force_wake_get() if domain still awake.
>>> Reduces frequent wake/sleep cycles for back-to-back operations.
>>> Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
>>>
>> I think this concept makes sense, as MMIO read operations are relatively
>> expensive in terms of time cost (perhaps ~5 µs). However, the downside
>> is increased power usage.
>>
>> Should we make delayed release an optional call—for example,
>> xe_force_wake_put_delay—and only use it in specific critical paths? For
>> instance, we could limit its use to paths tied to Level Zero calls like
>> zeDeviceGetGlobalTimestamps.
>>
>> This gets a bit tricky if xe_force_wake_put_delay is called and is not
>> the last reference, followed by xe_force_wake_put being the final
>> reference. However, it should be straightforward to track that an
>> delayed put was requested and have the final xe_force_wake_put issue the
>> delay.

Hi Matt,

Thank you to review the patch!

1. Without this patch, the avg MMIO read cost about 17 µs, and with 
delayed-release, it is ~5 µs.

2. Maarten also had questions about #define XE_FORCE_WAKE_HOLD_DELAY_US 
200     I run a compare test with 25/50/75/100/125/...  And 100 is the 
first workable value.
     Will change the default value from 200 to 100 for better power usage.

3. Should we make delayed release an optional call -> need more time to 
think about it. I'll send out the v3 version for below review 
suggestions first.

zongyao


>>> Signed-off-by: Zongyao Bai<zongyao.bai@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.c       | 111 +++++++++++++++++------
>>>   drivers/gpu/drm/xe/xe_force_wake.h       |   4 +-
>>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  11 +++
>>>   drivers/gpu/drm/xe/xe_gt.c               |   4 +-
>>>   4 files changed, 99 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>>> index 197e2197bd0a..183a17fa6d68 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -6,15 +6,20 @@
>>>   #include "xe_force_wake.h"
>>>   
>>>   #include <drm/drm_util.h>
>>> +#include <linux/device.h>
>>> +#include <linux/hrtimer.h>
>>>   
>>>   #include "regs/xe_gt_regs.h"
>>>   #include "regs/xe_reg_defs.h"
>>> +#include "xe_device.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_printk.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pm.h"
>>>   #include "xe_sriov.h"
>>>   
>>>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>>> +#define XE_FORCE_WAKE_HOLD_DELAY_US	200
>> How did you choose this value? It seems like it should be something
>> configurable via Kconfig or configfs.

As wrote above, 100 is a better value.  I'll set 100 as default.
Yes, it is better to make "XE_FORCE_WAKE_HOLD_DELAY_US" configurable. 
Will add this parameter to configfs in next version.

Zongyao

>>>   
>>>   static const char *str_wake_sleep(bool wake)
>>>   {
>>> @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
>>>   	fw->initialized_domains |= BIT(id);
>>>   }
>>>   
>>> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
>>> +
>>>   static void init_domain(struct xe_force_wake *fw,
>>>   			enum xe_force_wake_domain_id id,
>>>   			struct xe_reg reg, struct xe_reg ack)
>>> @@ -38,11 +45,29 @@ static void init_domain(struct xe_force_wake *fw,
>>>   	domain->reg_ack = ack;
>>>   	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>>>   	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
>>> +	domain->fw_back = fw;
>>> +	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
>>> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>>   
>>>   	mark_domain_initialized(fw, id);
>>>   }
>>>   
>>> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>> +static void xe_force_wake_fini(void *arg)
>>> +{
>>> +	struct xe_force_wake *fw = arg;
>>> +	struct xe_gt *gt = fw->gt;
>>> +	struct xe_force_wake_domain *domain;
>>> +	unsigned int tmp;
>>> +
>>> +	for_each_fw_domain(domain, fw, tmp) {
>>> +		xe_gt_WARN(gt, domain->ref,
>>> +			   "Forcewake domain %d still referenced (%u) at teardown\n",
>>> +			   domain->id, domain->ref);
>> Is the warning above actually valid? It seems fairly normal for a fini
>> to race with a delayed fw put. I would drop this.

Got it. Will drop this WARN.

Zongyao


>>> +		hrtimer_cancel(&domain->timer);
>>> +	}
>>> +}
>>> +
>>> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>>   {
>>>   	struct xe_device *xe = gt_to_xe(gt);
>>>   
>>> @@ -58,6 +83,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>>   			    FORCEWAKE_GT,
>>>   			    FORCEWAKE_ACK_GT);
>>>   	}
>>> +
>>> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>>>   }
>>>   
>>>   void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>> @@ -142,10 +169,36 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>>>   	__domain_ctl(gt, domain, false);
>>>   }
>>>   
>>> -static int domain_sleep_wait(struct xe_gt *gt,
>>> -			     struct xe_force_wake_domain *domain)
>>> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
>>>   {
>>> -	return __domain_wait(gt, domain, false);
>>> +	struct xe_force_wake_domain *domain =
>>> +		container_of(timer, struct xe_force_wake_domain, timer);
>>> +	struct xe_force_wake *fw = domain->fw_back;
>>> +	struct xe_gt *gt = fw->gt;
>>> +	unsigned long flags;
>>> +
>>> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
>>> +
>>> +	spin_lock_irqsave(&fw->lock, flags);
>> I'd use guard(spinlock_irqsave) here rather manually unlock this.
>> hrtimer_forward_now should be safe under fw->lock unless I'm missing
>> something.

Thanks Matt. Yes, it's much better.  I don't know guard() before.
Will modify here in next version.

zongyao

>>> +
>>> +	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref) {
>>> +		spin_unlock_irqrestore(&fw->lock, flags);
>>> +		return HRTIMER_NORESTART;
>>> +	}
>>> +	if (domain->timer_rearm) {
>>> +		domain->timer_rearm = false;
>>> +		spin_unlock_irqrestore(&fw->lock, flags);
>>> +		hrtimer_forward_now(timer,
>>> +				    ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
>>> +						NSEC_PER_USEC));
>>> +		return HRTIMER_RESTART;
>>> +	}
>>> +	fw->timer_domains &= ~BIT(domain->id);
>>> +	domain_sleep(gt, domain);
>>> +	fw->awake_domains &= ~BIT(domain->id);
>>> +	spin_unlock_irqrestore(&fw->lock, flags);
>>> +
>>> +	return HRTIMER_NORESTART;
>>>   }
>>>   
>>>   /**
>>> @@ -187,8 +240,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>   	spin_lock_irqsave(&fw->lock, flags);
>>>   	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>>   		if (!domain->ref++) {
>>> -			awake_rqst |= BIT(domain->id);
>>> -			domain_wake(gt, domain);
>>> +			if (fw->awake_domains & BIT(domain->id)) {
>>> +				fw->timer_domains &= ~BIT(domain->id);
>>> +				hrtimer_try_to_cancel(&domain->timer);
>>> +			} else {
>>> +				awake_rqst |= BIT(domain->id);
>>> +				domain_wake(gt, domain);
>>> +			}
>>>   		}
>>>   		ref_incr |= BIT(domain->id);
>>>   	}
>>> @@ -213,27 +271,25 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>   }
>>>   
>>>   /**
>>> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>>> + * xe_force_wake_put - Decrement the refcount and arm the delayed-sleep timer
>>>    * @fw: Pointer to the force wake structure
>>>    * @fw_ref: return of xe_force_wake_get()
>>>    *
>>> - * This function reduces the reference counts for domains in fw_ref. If
>>> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>>> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
>>> - * Warns in case of timeout of ack from domain.
>>> + * This function reduces the reference counts for domains in fw_ref.  When a
>>> + * domain's refcount reaches 0 the sleep request is not issued immediately;
>>> + * instead a hrtimer is armed for XE_FORCE_WAKE_HOLD_DELAY_US so that a rapid
>>> + * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
>>> + * timer expiry, if the domain is still idle, the sleep request is written.
>>> + * Mirroring i915's fw_domains_put(), the deferred sleep is fire-and-forget:
>>> + * no sleep ACK is polled, since the next wake re-waits for the wake ACK.
>> Let's not mention the i915 in Xe code.

My bad, will update in next version.

Zongyao

>>
>>>    */
>>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>>   {
>>>   	struct xe_gt *gt = fw->gt;
>>>   	struct xe_force_wake_domain *domain;
>>> -	unsigned int tmp, sleep = 0;
>>> +	unsigned int tmp;
>>>   	unsigned long flags;
>>> -	int ack_fail = 0;
>>>   
>>> -	/*
>>> -	 * Avoid unnecessary lock and unlock when the function is called
>>> -	 * in error path of individual domains.
>>> -	 */
>> Why delete this comment?

I thought this comment is generated by AI.
Will add it back.

Zongyao

>>
>>>   	if (!fw_ref)
>>>   		return;
>>>   
>>> @@ -245,20 +301,19 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>>   		xe_gt_assert(gt, domain->ref);
>>>   
>>>   		if (!--domain->ref) {
>>> -			sleep |= BIT(domain->id);
>>> -			domain_sleep(gt, domain);
>>> +			fw->timer_domains |= BIT(domain->id);
>>> +			if (hrtimer_callback_running(&domain->timer)) {
>>> +				domain->timer_rearm = true;
>>> +			} else {
>>> +				domain->timer_rearm = false;
>>> +				hrtimer_start(&domain->timer,
>>> +					      ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
>>> +							  NSEC_PER_USEC),
>>> +				      HRTIMER_MODE_REL);
>>> +			}
>>>   		}
>>>   	}
>>> -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>>> -		if (domain_sleep_wait(gt, domain) == 0)
>>> -			fw->awake_domains &= ~BIT(domain->id);
>>> -		else
>>> -			ack_fail |= BIT(domain->id);
>>> -	}
>>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>> -
>>> -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>>> -		   str_plural(hweight_long(ack_fail)), ack_fail);
>> This deleted code for domain_sleep_wait / error probably needs to be in
>> xe_force_wake_domain_timer.
This follow the i915 driver behavior: don't wait for the sleep ACK in 
xe_force_wake_put().
Any timing issue from the sleep not completing is self-correcting: the 
next xe_force_wake_get()
will wait for the wake ACK, then re-synchronizes hardware state.
That is one of the main optimizations here, saving ~33µs per put(). So 
I'd like to keep this design if in low risk.

Zongyao

>>
>>>   }
>>>   
>>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>>> index e2721f205d6c..19679b923dca 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -11,8 +11,8 @@
>>>   
>>>   struct xe_gt;
>>>   
>>> -void xe_force_wake_init_gt(struct xe_gt *gt,
>>> -			   struct xe_force_wake *fw);
>>> +int xe_force_wake_init_gt(struct xe_gt *gt,
>>> +			  struct xe_force_wake *fw);
>>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>>   				struct xe_force_wake *fw);
>>>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> index 14b7b86e801b..ee5675069fe0 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> +++ b/drivers/gpu/drm/xe/c
>>> @@ -6,6 +6,7 @@
>>>   #ifndef _XE_FORCE_WAKE_TYPES_H_
>>>   #define _XE_FORCE_WAKE_TYPES_H_
>>>   
>>> +#include <linux/hrtimer.h>
>>>   #include <linux/mutex.h>
>>>   #include <linux/types.h>
>>>   
>>> @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
>>>   	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>>>   };
>>>   
>>> +struct xe_force_wake;
>>> +
>>>   /**
>>>    * struct xe_force_wake_domain - Xe force wake power domain
>>>    *
>>> @@ -82,6 +85,12 @@ struct xe_force_wake_domain {
>>>   	u32 mask;
>>>   	/** @ref: domain reference */
>>>   	u32 ref;
>>> +	/** @timer_rearm: put() ran while callback was in-flight; callback must restart timer */
>> Protected fw_back->lock.

got it.

zongyao

>>
>>> +	bool timer_rearm;
>> In general, I’d reorganize the layout so that structs are at the top of
>> xe_force_wake_domain, followed by u32 fields, and finally the bool
>> fields.
>>
>>> +	/** @timer: hrtimer for delayed sleep request */
>>> +	struct hrtimer timer;
>>> +	/** @fw_back: back pointer to parent xe_force_wake */
>>> +	struct xe_force_wake *fw_back;
>>>   };
>>>   
>>>   /**
>>> @@ -101,6 +110,8 @@ struct xe_force_wake {
>>>   	spinlock_t lock;
>>>   	/** @awake_domains: mask of all domains awake */
>>>   	unsigned int awake_domains;
>>> +	/** @timer_domains: mask of domains with an outstanding delayed-sleep timer */

Will add  "Protected by @lock." as above.

zongyao

>>> +	unsigned int timer_domains;
>>>   	/** @initialized_domains: mask of all initialized domains */
>>>   	unsigned int initialized_domains;
>>>   	/** @domains: force wake domains */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 783eb6d631b5..43a79698cd04 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -511,7 +511,9 @@ int xe_gt_init_early(struct xe_gt *gt)
>>>   
>>>   	xe_wa_process_gt_oob(gt);
>>>   
>>> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>>> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
>>> +	if (err)
>>> +		return err;
>> I'd add newline here.
>>
>> Matt

Got it.

Zongyao

>>>   	spin_lock_init(&gt->global_invl_lock);
>>>   
>>>   	err = xe_gt_tlb_inval_init_early(gt);
>>> -- 
>>> 2.43.0
>>>
