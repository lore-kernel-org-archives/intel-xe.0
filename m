Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC0BCD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 20:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EC71134B8;
	Thu,  4 Apr 2024 20:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoFTujdk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCD31134B8
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 20:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712261503; x=1743797503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qAHNX4+lCBGe+nFGDqT4PIX92Km5FG1YogHmkoVMyf8=;
 b=GoFTujdk6OMk7mxAzEerdjj2Wo2TqsEmd5XhEc3TcDUsfxk/y87CVswu
 wTqL9FiZHYzE2pGEr86hZKc8Al3TYB3vJeIP4tXujiHzHta2Nf+0VOQHA
 1Akk6SgmsUr3pb1YEtrrRqs9dWa21EDyoVn65sXkyPnuS028daP8NHcNX
 ywZ4D8zk+88U44fh+OJsgqmW2xU1Tj+5qOOcHOBTLWAaL8makM/vFyVd4
 aSwPsrk3ityloGXHxymlyC+Gyht8d8tu8CQpcUnxnBO0bkBRUdgTpVeUj
 2au3Vt/+tQMvqOa7p19ydLcOz7XDJAS760rJkUtpL1/0aA/X4HtDQ6oyu g==;
X-CSE-ConnectionGUID: p05eSmFpTruvp8aujHsszA==
X-CSE-MsgGUID: LqdLVCU6QaC7CnCrza1uxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25078560"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25078560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:11:43 -0700
X-CSE-ConnectionGUID: Jw2X7Dw0RP6Og7L0XgZG1g==
X-CSE-MsgGUID: 8RU04AbiQGyJtVlR+dU8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19010873"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 13:11:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 13:11:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 13:11:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 13:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljxRALjdxa4FGmm2OQ8ouffl9C3DJ+8JnMS/Tzh4LznXnclx2TezF5G2CQd78UmvcvLi1otWv+m2U5xUfaGBC7UQcjVk06+VLE5o7Nd3lmulr1AGBIHbl/vgYJALbXJ4lP8UZn1EBwfVtRR29bGOcRh9U5VJW3vUh+Wbk6QRA3pFyTZhmegcrU5/LAY9qPoMyBV/ff3yiCicIO9LRBKL4MH6DtS2gZQluKrHdYeOwNSoC3nM/1bNqWm5gYCZJrbhHmfzE21lPVm0Vr59tbNHZh1jK18IBdgX4l3ax15j8h4DbgNNvC30YLBJdGaIsevtIVRQMnVaX3wkFhKDL909FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz0WoKhXr45z8c7Pq09rvaqfr6c00Ot7SI81sVVS1qs=;
 b=ZMG7OUCGXzVA47SF1DYaAOYs0FYqwWw9h0IfLUUsMrSQLOFUDUvESo9y8qAFhQ2YP42YTl7x9lIzeD6eK5TqP7ttqQ6IwH+zT1uvx2sNGQuaWy6mTFbL7U7jpDb6/Im0IaAorrmJjcwvffQUYlxdN8STh8Fi3dqrp+nSmdiGToH9Re2eiJgs22jozTX2GV1UPZ7OlkqWAW2SIotGzzrdQwB7Qi+X+zDznncSzv1WUzRloHsRo5e8nV+l7em0rQUyIm8SiDjKWlM1fUn7Z0sA1IqUuYyhHg9q5hB79cBTfOJ8mnNUVT9ElZGrQ+OzsPm3IcaIaTYSHQeBlINOYwktbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7559.namprd11.prod.outlook.com (2603:10b6:8:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 20:11:40 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 20:11:40 +0000
Message-ID: <eb436c04-861e-41ea-8fa0-28c4fd367902@intel.com>
Date: Thu, 4 Apr 2024 13:11:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-3-John.C.Harrison@Intel.com>
 <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
 <090d6d4b-1918-4355-9f42-7e696f89987a@intel.com>
 <3zgavkspngk4exetckvv63delpiwtibyxndlfig63zm53ccojh@s7mm7jcp3q6x>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3zgavkspngk4exetckvv63delpiwtibyxndlfig63zm53ccojh@s7mm7jcp3q6x>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7559:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ImQmS7fWSiGCoXuYMdBsEEcHbO8kjypddbpdfKMNq7sDlMQMpzZTQRxuC0Hgu2rGqmF87eY8JBwmTghCvJfZbO4Ca/9Vq4cRugwLjWTNWSaEv69kYzB3AFoIKMP6LvJqH5DatWZzRYhnQeZZk0N6GkTSSV7mu32McZbfsxi+G/FmVUIklIPKC1gjykieaAS6U4D444PUy7rOGaTRGlYIHmRnMVkb9ptEXCCwdoRCD3Mj73ojcmPEj2D5Pn52xrroMztT+zsq2MazotTB7P2abV0mRJNTvUZePqkgExnz/3UDk/7Y4p8N9knUx08ldj4t7daQpvcaogKcqni/8hMjkVuwb5NbujEZfCYpBs5FbHIOWHZGgRTGVUdr42Is2RCczkGZkv7JM19MZYKF6I2CfW/rsTcZA7zfbKinTWrORRS2FV8nradBB4U64/+aMkWaHwDuEIT1V9WBCdJq1mvJBckM68MmqJKh4mENlX21IiJuvToZ0tcpaI2DQnNR2Pe1I+EJDRhTXif80nA11+AL7K8n0GFcFPDckOYE9Q1XJezTOH99T+/XDENXRd0uXjwXUkLWrU2wYeeX6JbH+tDdB4sIpH/Ich3xC1ziXHeZTBjKMDO04slxYQtTIjEyyK4faw+N5v2WrkvLZYc8Qaf11pXeLopuo5RNomlb2d2bFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alFxRXoyRTU0dnB3K3BDRDNNUk0yZy8yL1dKeDZFTGRCYnF6NHN2RXZsd3p1?=
 =?utf-8?B?NU9MU1ZubnBIZ0RIbTNkd2RCY2N0VUt0VGI2VDFDdm9OUU0wODFTWWJ2ekw0?=
 =?utf-8?B?azlwZm9BOVlhV0VhNlZ1WEN0bWlEQ3JxYnp4MWI0SXhHZjB5bzZSR0ZIakFl?=
 =?utf-8?B?OTJKUFVFODV5UHVySHpTQlRpNk8vM3hZenB1Y01GU29TTCt4eWN3YTIzMUxS?=
 =?utf-8?B?WWkwQkRhMFlFZ3AwbnhrK29GSGRnbm9ITXpVTDY2dTBkNDhuSHlJVHg5Wkhl?=
 =?utf-8?B?c1dZTXI0SWM1RHo3bk5Mc2Q4SEd5VU1KTGVtbUhZS1NLN0lFd0luSG5lMVc4?=
 =?utf-8?B?Z0dGOThJbmo2SktDQW8xSEhXZ1V6ZE1MNjZBRzViZjFYL0xLMlIzM0xSWXdN?=
 =?utf-8?B?U3poQXFlY3FIMWQ0VGxEYUhTYlpMYzRMQ0RGT21DcFdRd280Y2NJRm9NMm5N?=
 =?utf-8?B?RjJCWFBKbnRWdlJiTTBVcDJtRnpKakt6SEkxSWNKVTNTOWNYVUlVeFlLZTVT?=
 =?utf-8?B?NU1vbFhSb0VNby9OeGRTVTF3RnNwdElmSlo1NVZZRGJGV05ZRE9NMC9Wbitp?=
 =?utf-8?B?cTYxbXR3VEFqcXZHRUhIUW5GM3VZMmprYks0amFaeE11Y0tkdjFFa1k4V2pi?=
 =?utf-8?B?RkVCUjRkMWR0T0hKZ0s2NEhDZE82QmtyNGdBWkFsWVNWRG9qWDAzUGRVZzRR?=
 =?utf-8?B?RGNLWFQxN2pMNFVmckpQb0lsakdoNVppK0hBdktYd3Z5U0U3eXpqQ2c3Rkc4?=
 =?utf-8?B?bytXVmExNkFRZTBPRXpncXZibW4zRlBGcnJYRWJiKzU0TnAreTZjUzFxVktY?=
 =?utf-8?B?MjhXc2QzcDR0ellSZzZMSE4vN0NBeE9Md2IyNzlaSXYxSW1MQTlBUzhPOUpj?=
 =?utf-8?B?VE84d04xNjczWWlhTWxXdlNidHo3aUFrTmpGSHdYV3BsMDFPYWM4VmhiT1Y5?=
 =?utf-8?B?bzljNG81TVlNYWV3L3pZS1o2cCs1dTdPUXkwbTB4T2NJL055Y3ZWMnhUKytz?=
 =?utf-8?B?OXZDVE5lNW5ZTUtWVnVKeWgxQVVQZEhyTlEyZEFLWGVLMFhZOVFwNkpmaEpx?=
 =?utf-8?B?UHhWeGF3MXQ3Z1ZKZm03a1drTjJoNVRmRFZjMEdjdmxrY2xqc2hKSkFmTHNH?=
 =?utf-8?B?M1l3NUtWOW1JMmVCcmNmTE9jMXpWOWxMdEV6ZGswajg1bnBvT1VnV3ZqMUFY?=
 =?utf-8?B?SExBTEhRUG5FV1N1dDBiYmw0QlE2TXpJbHRUTG1DVnJMYWc1Tk9rYXZDVHln?=
 =?utf-8?B?Q25ZcmN4cnY3ODhKQlZEV3dBRnE3KzFETzRtUC9UcUczVXYwWlpwNkl0d0JS?=
 =?utf-8?B?aGpsOHBDa0JLWjlCTXEvME9ZWEYyU0NRWGZGcXBoOE8ySUE2cTRxZndSaU9J?=
 =?utf-8?B?dS8rSWo3bmM5NUVKMjVzWG1uZlVLSjZabExYNG1wV3dDRDY3bGhJLzNNN0sv?=
 =?utf-8?B?SmhvbkczZGVkN0Z0aHdqeS9SVkg1cjBkZ0R6eUxzKzV2UWNPcnhZOS9kbUhj?=
 =?utf-8?B?YW9JZkFBRHVhbDg4b0tGZERodDBLSDRia0RXbWlFTlBBTTJLSGUyWHkrK3Ra?=
 =?utf-8?B?TTVyTTEweHhVZlkyRTdYdCt2RzFMMllBd3ZybThUYmRFV2w3SUV4R0ttWlQ2?=
 =?utf-8?B?Ykswa0tWVUhlNVE2Ny92S2xqSlgrSEJlcVAwcTdjUnJvNGFiekRiSm8wYnFP?=
 =?utf-8?B?a01tdWlYZ1FJNTNDTndEUHNXVlpZeTNnaGhiWmVBMG9FUE80VFRzTTFmelNz?=
 =?utf-8?B?SGtSRzZKbDVkcUpKbE5HaVRERkhlMjF2bFVla3pDMVFzM2lkbThmQlNZU2Ft?=
 =?utf-8?B?K0lsUk1sWFdwY0pHYlozdUQxSm44RHJiTVVzUU5tL3luWmdRMHNYOXhRMkFj?=
 =?utf-8?B?NXNlbFRmajNMN044b1lrbnQzbXN1VUQzUVZaNjlLZkI1d1dPdVRidjhndVcx?=
 =?utf-8?B?MzNoaUV1bCtEVlU4L2NlYjBZNDJ2anJlcVM3eXZZNVlrbUNQcG5UbUxWQ0hk?=
 =?utf-8?B?NE1xNFBvYWJIcC8vVENGZzA1U1VGWTBsYjRhRldzTURhVjd6MnBYY0l5VzI5?=
 =?utf-8?B?YVdjbmtwMmlGaUhiWHpET0xxV0dyQ1dmdGxzbDVjTWljUlhSQXNwcWYzMHpr?=
 =?utf-8?B?VGNNdXIvOTUwNzhSajZZbmxDRnVSMytvQUNWR0hObVBIV2kzUWU0U29HNGVM?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e90c92-992d-4686-d7a0-08dc54e37044
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 20:11:39.9683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjG55aRJUWCMtiE/Xmya58a1ziA4+3/wYUybkHmPos+Wav4JITJuToxz+dUjZ0aFN/e5z7SicJl0jDsEya0gFL63Z6sJChUc07XrhEE82bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7559
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

On 4/4/2024 13:03, Lucas De Marchi wrote:
> On Thu, Apr 04, 2024 at 12:52:45PM -0700, John Harrison wrote:
>> On 4/4/2024 12:19, Lucas De Marchi wrote:
>>> On Tue, Feb 27, 2024 at 05:09:56PM -0800, John.C.Harrison@Intel.com 
>>> wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> GuC loading can take longer than it is supposed to for various
>>>> reasons. So add in the code to cope with that and to report it when it
>>>> happens. There are also many different reasons why GuC loading can
>>>> fail, so add in the code for checking for those and for reporting
>>>> issues in a meaningful manner rather than just hitting a timeout and
>>>> saying 'fail: status = %x'.
>>>>
>>>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>> applicable to Xe!
>>>>
>>>> v2: Actually report the requested and granted frequencies rather than
>>>> showing granted twice (review feedback from Badal).
>>>> v3: Locally code all the timeout and end condition handling because a
>>>> helper function is not allowed (review feedback from Lucas/Rodrigo).
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
>>>> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>> drivers/gpu/drm/xe/xe_guc.c             | 226 +++++++++++++++++++-----
>>>> drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
>>>> drivers/gpu/drm/xe/xe_mmio.h            |   2 +
>>>> 5 files changed, 274 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> index ec83551bf9c0..d0b5fed6876f 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> @@ -7,8 +7,12 @@
>>>> #define _ABI_GUC_ERRORS_ABI_H
>>>>
>>>> enum xe_guc_response_status {
>>>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>> };
>>>>
>>>> enum xe_guc_load_status {
>>>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>>     XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>>     XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>>     XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>>     XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>>     XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>> };
>>>>
>>>> +enum xe_bootrom_load_status {
>>>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>> +};
>>>> +
>>>> #endif
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 4e7f809d2b00..2e54c9e6a4fe 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -40,6 +40,8 @@
>>>> #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>> #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>
>>>> +#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>> +
>>>> #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>> #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>> #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 0d2a2dd13f11..771971110600 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -17,6 +17,7 @@
>>>> #include "xe_device.h"
>>>> #include "xe_force_wake.h"
>>>> #include "xe_gt.h"
>>>> +#include "xe_gt_throttle.h"
>>>> #include "xe_guc_ads.h"
>>>> #include "xe_guc_ct.h"
>>>> #include "xe_guc_hwconfig.h"
>>>> @@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>>     return 0;
>>>> }
>>>>
>>>> -static int guc_wait_ucode(struct xe_guc *guc)
>>>> +/*
>>>> + * Check a previously read GuC status register (GUC_STATUS) 
>>>> looking for
>>>> + * known terminal states (either completion or failure) of either the
>>>> + * microkernel status field or the boot ROM status field. Returns 
>>>> +1 for
>>>> + * successful completion, -1 for failure and 0 for any 
>>>> intermediate state.
>>>> + */
>>>> +static int guc_load_done(u32 status)
>>>> {
>>>> -    struct xe_device *xe = guc_to_xe(guc);
>>>> -    u32 status;
>>>> -    int ret;
>>>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>> +
>>>> +    switch (uk_val) {
>>>> +    case XE_GUC_LOAD_STATUS_READY:
>>>> +        return 1;
>>>> +
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    switch (br_val) {
>>>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>>>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>>> +{
>>>> +    u32 freq;
>>>> +    int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>>> +
>>>> +    return ret ? ret : freq;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Wait for the GuC to start up.
>>>> + *
>>>> + * Measurements indicate this should take no more than 20ms 
>>>> (assuming the GT
>>>> + * clock is at maximum frequency). However, thermal throttling and 
>>>> other issues
>>>> + * can prevent the clock hitting max and thus making the load take 
>>>> significantly
>>>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>> the load times
>>>> + * can be in the seconds range. As, there is a limit on how long 
>>>> an individual
>>>
>>>                     ^ that comma seems misplaced
>>>
>>>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>>>> loop count
>>>> + * is increased for debug builds so that problems can be detected 
>>>> and analysed.
>>>> + * For release builds, the timeout is kept short so that user's 
>>>> don't wait
>>>> + * forever to find out there is a problem. In either case, if the 
>>>> load took longer
>>>> + * than is reasonable even with some 'sensible' throttling, then 
>>>> flag a warning
>>>> + * because something is not right.
>>>> + *
>>>> + * Note that the only reason an end user should hit the timeout is 
>>>> in case of
>>>> + * extreme thermal throttling. And a system that is that hot 
>>>> during boot is
>>>> + * probably dead anyway!
>>>> + */
>>>> +#if defined(CONFIG_DRM_XE_DEBUG)
>>>> +#define GUC_LOAD_RETRY_LIMIT    20
>>>> +#else
>>>> +#define GUC_LOAD_RETRY_LIMIT    3
>>>> +#endif
>>>
>>> just sent a comment on this reasoning in the previous version.
>>> Continuing from here.
>>>
>>>> +#define GUC_LOAD_TIME_WARN      200
>>>
>>> let's also add the unit, _MSEC
>>>
>>> Also, comment above says 20, but here we warn on 200. Is that 10x
>>> difference a typo or intended?
>> It's a safety margin to allow for situations such as a system that 
>> just rebooted due to thermal shutdown and is still running hot and 
>> therefore slow. I'll update the comment above to explain.
>>
>>>
>>>>
>>>> +static int guc_wait_ucode(struct xe_guc *guc)
>>>> +{
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>> +    ktime_t before, after, delta;
>>>> +    int load_done;
>>>> +    u32 status = 0;
>>>> +    int ret, count;
>>>> +    u64 delta_ms;
>>>> +    u32 before_freq;
>>>> +
>>>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>> +    before = ktime_get();
>>>>     /*
>>>> -     * Wait for the GuC to start up.
>>>> -     * NB: Docs recommend not using the interrupt for completion.
>>>> -     * Measurements indicate this should take no more than 20ms
>>>> -     * (assuming the GT clock is at maximum frequency). So, a
>>>> -     * timeout here indicates that the GuC has failed and is 
>>>> unusable.
>>>> -     * (Higher levels of the driver may decide to reset the GuC and
>>>> -     * attempt the ucode load again if this happens.)
>>>> -     *
>>>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>>>> condition
>>>> -     * where the asynchronous frequency management code could reduce
>>>> -     * the GT clock while a GuC reload is in progress (during a full
>>>> -     * GT reset). A fix is in progress but there are complex locking
>>>> -     * issues to be resolved. In the meantime bump the timeout to
>>>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>>>> -     * in the working case, a larger timeout makes no difference.
>>>> +     * Note, can't use any kind of timing information from the 
>>>> call to xe_mmio_wait.
>>>> +     * It could return a thousand intermediate stages at random 
>>>> times. Instead, must
>>>> +     * manually track the total time taken and locally implement 
>>>> the timeout.
>>>
>>> that's something we may improve in future with a variant with a better
>>> variant of this function to be used on loops.
>>
>> Or maybe a variant which allows a custom comparison function to be 
>> passed in and keeps all the time tracking internal...
>
> yep, that would be ok I think. Do you want to give this a shot?
>
> Lucas De Marchi

Um. That's exactly what it was using to start with and exactly what got 
shot down as not being allowed at all ever under any circumstances.

John.

>
>>
>>>
>>>>      */
>>>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>>> -                 FIELD_PREP(GS_UKERNEL_MASK, 
>>>> XE_GUC_LOAD_STATUS_READY),
>>>> -                 200000, &status, false);
>>>> +    do {
>>>> +        u32 last_status = status & (GS_UKERNEL_MASK | 
>>>> GS_BOOTROM_MASK);
>>>>
>>>> -    if (ret) {
>>>> -        struct drm_device *drm = &xe->drm;
>>>> -
>>>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>>> -        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>> BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>>>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>> -
>>>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>> -            drm_info(drm, "GuC firmware signature verification 
>>>> failed\n");
>>>> +        /*
>>>> +         * Wait for any change (intermediate or terminal) in the 
>>>> status register.
>>>> +         * Note, the return value is a don't care. The only 
>>>> failure code is timeout
>>>> +         * but the timeouts need to be accumulated over all the 
>>>> intermediate partial
>>>> +         * timeouts rather than allowing a huge timeout each time. 
>>>> So basically, need
>>>> +         * to treat a timeout no different to a value change.
>>>> +         */
>>>> +        xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | 
>>>> GS_BOOTROM_MASK,
>>>> +                   last_status, 1000 * 1000, &status, false);
>>>
>>> if I understood correctly the meaning of this function, it would better
>>> be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?
>>>
>>> i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
>>> and the previous register value and you wait for a change
>>> in that field of the register. Is that the correct meaning of the
>>> function?
>> The test is 'read != given'. That sounds like a not to me. A _mask or 
>> _field suffix (to me) would imply just that the regular wait 
>> semantics are applied with a mask or to a specific field (which is 
>> already the case, isn't it?). I.e. wait until '(read & mask) == 
>> given' or even '(read & mask) == (given << shift)' for a field 
>> version. This is the negative version of that test. It must wait 
>> until the value has changed, i.e. is not equal to the given target.
>>
>>>
>>> ugh... this bool value to show atomic or otherwise shouldn't be there
>>> (but it's pre-existent issue).
>> Feel free to fix the baseline xe_mmio_wait32 function. I'm just 
>> copying that and trying to stay as close as possible but just 
>> inverting the comparison logic.
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>

