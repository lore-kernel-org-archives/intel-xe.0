Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B1ACD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 23:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A0E113683;
	Thu,  4 Apr 2024 23:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp3qXcFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5E113682;
 Thu,  4 Apr 2024 23:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712274320; x=1743810320;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/917F9tC/WIyIAEQTzeG0Rjg61Uvz5xhh4DLtFBZRE=;
 b=bp3qXcFxfSevbMRuWsJzGMVYGMdN1BeBrvLhCmTKvw0Rz87nUejynQfT
 DWD+r3RQxsGp39/3Nym3KQYE9TItWahvafUi4wGp3cD/Q/qE21P7FoZoD
 Y5Xx7eZft/jqWW7DQXuyYLMucW4GiH8KD9ZTyhCZDaKlgWO0lg04zBCQG
 bSV5/VNpeiNuuMEvwE606S+7pYjNSP7yW6mzZC+jAARoJpEZM9GjoV7wN
 NBzNJ0dWe4eE+RrEc5lbqepoTIvDBX9of4nux0Qo9OQvzJYyynnxQ0G/I
 gX7kiOGmpBiqfork1FXXgnJyyimw3HM3TqYWAxe6ONTxbnww/0NPs/ujS A==;
X-CSE-ConnectionGUID: f5DZOAkzTvahlYhZL0/P0w==
X-CSE-MsgGUID: l+DofkuGThiLeTkRQWgWFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7475433"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7475433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 16:45:14 -0700
X-CSE-ConnectionGUID: LlaV0RpSTiKBLtVg7Rt/9w==
X-CSE-MsgGUID: 8GqSe78jS3+P9WTVJTOmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19070336"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 16:45:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 16:45:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 16:45:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 16:45:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 16:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnaLKygFDExtLiXDOwbUusDzVAxGj5CkxPx7Pmw/L/R/ZXaoWaxCrhOTEJn3XD5uwAym6urHW8uu76uGgCSazDLEeeAPZwj9C1bv73JdtL5W3Xug4nhSeCd22Di3ADcFhHjw9QvBQk71XBY2WSh06qgseeMskVfifGkyX6/3owXEBQV9J2CU74Ey8VpwxQ0r9CsOxdJEMQFH6MFNBWECT/1Nu4bs2ITiomwHtSOP98PuMzIJDd6IY28R0uviprpWfY1pXafofWL9eggzCr8aF66rXSDU8pjyFff7UhYoQdX29UPngdy/ETwTVQxXfblxN9MtoeHMwzaHZKhHOo3A0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgBzpq4epl62PtQwddMs9AO6HeZlS2USD/OgDMN9SgQ=;
 b=YFS5QFIklyQyRr6xtKonheKK5WGRmYddjrxj5SUHLuwqnPczO44zV7ffgs5GCo6rtAAj/2HVTsi4Azu4/1Czi8JA7LFQ4stLR7wpAczBmxhYZ3XCGVUfmBYxpRr9BKS5LHpjcftT6iZGWGbpj/8lkG1tqhCL92dQdrBOfJsmSmhNFw5DuUewAYMnzDCZlOLLLdgD6bLZ9RBPkCJTl82mpX9fT6U8S2jdcIIOMEtO/s38fnrtN5x3mcjXjaLOr/xpC005ksR2q0kfmacrfbevgKksPgU+cfzSa9z4HlZamowJO8Yl8xIXwetynyAJ3u24SYd7ReZl0LlPPc3zjfG+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Thu, 4 Apr
 2024 23:45:10 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 23:45:10 +0000
Message-ID: <3f5a262a-25eb-4415-aefb-b9f9fcd1d702@intel.com>
Date: Thu, 4 Apr 2024 16:45:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
From: John Harrison <john.c.harrison@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
Content-Language: en-GB
In-Reply-To: <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB5184:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XmwDorN0pIPgtqMOcjq4+PUtrEMaus1gjKEjMOe4n4RJurVIy4wqkVseug8D6ELVXATRtjYf61KhOMGg16CeP9yCDFj/6zBoFETkT648xHILHN1gMyntvljXiVYk1H/xTKd66VcKu73fPbeCG8uwW9SS9fCfK5AKTuKvvJyek/dTRHsk5MBybH+subqj2Euvzr8D2wkA4pbXOGRuCIaehNDRhbv73dW8cI1trqtxI7H5o4ImWC0XaIbm/IXTpktWrVSEGqHSdCJkQ6dNK7NZ7oCKmbMqd1KNUEULJW3lLL2ntfXwEG41LNglQX+xMFKhp20XO1uWeuvXZwY83ULsuQSfyie49PXF9FsBXjwcf+5mjGrnXGoAxuiPtP/JOGzlCqzCmq+blpK5tPRHTGFYktq+ZMLTRnKfstumUHdtYZnCuP4aueggzRsUJJngGwMYrDfEqjQhGlOgOL8XZFZkmCPxH4m4Vg5tVIDu6F6ELqQUC5mDBfIKCHOHW47GdWyPfpbiRM8HyChXSwFrlt+IPieNnAkwse9nOS+cqPcOOXYr9ANkGrJMn7tQWL9NpPKsJ4oJwFnGKbGRbte6QCUU2NftCW0XaYy1XOEZqFKxyoX1d9NFZCt0mGNAb9zmUnwBmP1mStqeuGlr24+190u6a/JygMCdhz3xjoMlRY+4QQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1UrZWpZR3FDMWxhQTJyc2dkaEhvbGJyWXdXc3A0T3ZjMmh1bm02R1Z6bi9K?=
 =?utf-8?B?T3ZrcXJjL3hhdHk2NGVqSU5UYUt0RmpNSnZQdllQYk14OENwVjJaNExydG0v?=
 =?utf-8?B?bWtDYlgxQVFaWDlSK0U0L3hCN2NIclFTRGdnOCtEa2dHZDFzY3NUUWhWS2hO?=
 =?utf-8?B?N1BadGlJTjRTbUE5MzM0T1hKdGt4WjBxNjEyd3cyT1FqcWo5NjdoVXY4cWpW?=
 =?utf-8?B?K2JRYnQ5VzUxNnpOZXhvQ05sTzQyRkV1SWNIZzlYVVVCOGdJUGt1bGVGOEk3?=
 =?utf-8?B?QVBqYkFReGJRT3NaM2RzV2luN1lpRWtFRStEVytXbjZGQnZ0Q09UU3dCZUE4?=
 =?utf-8?B?MmRJZGczdWVqUnAyLyt4S3RqZElwaTRld1ZXTVJWa2psRzV4ZFN0Q0dGM3VC?=
 =?utf-8?B?STE4NXNKQk5UVFhRR3ZIcDBuTlo5OWVEVW9pNld1bSs1MzYvaVI1cXZvNVZB?=
 =?utf-8?B?MHhzQ3R6MVpTSUtua2N5UFdKSjNHU25VUFIwUzROQ0RLY2NCL1R2OUxGdVNl?=
 =?utf-8?B?TllDYnU1WXpVOUJXam82djAyUWhuQUNVUjlMQ1hCRE53VWloSExrTnVaRER2?=
 =?utf-8?B?WnBiRkNQYXhpdU5oemlXdXVKUXlyRU9hT3ZpVzl6Rjl0SCtKV2xpR0VsOW9l?=
 =?utf-8?B?dXdDSFIvT01RQmdoa2J6L1BhRG9GWjFGZDF1T3YvZzdwdXhyUmxPdUYyMWtx?=
 =?utf-8?B?K29DS0pLajUyVVgvVmx5WUgvVmZtcVl0cmE0TmNDSTl2K3VYZEs0YkdrdHpk?=
 =?utf-8?B?Y3IxZTN6eVU3ZkJXSEdOVldtTXlhYWFoUDRBZEJmaFFqN1BRTzBxWDk3NjJZ?=
 =?utf-8?B?Ni9CbHdqY1g1dWZRN3htY1NCVzN5MUZmL2Q4amZwa3FTMW9YNmdmRjdCckFq?=
 =?utf-8?B?eVV6NDFKSlVyaEk2cU1mTG5vaDNUbjU0a0k4MFJxeEczNUJKL0JKcktENmgw?=
 =?utf-8?B?czU5SDI4M1duWlhONHpMamlFb0k3dGhhN3NON3h6NFE2SWVqWDZyckhVTUJi?=
 =?utf-8?B?dlZRLytFcDFIL0U0NGVtZEpQUFZCMGd0SDl6ZkJGc2E3akJUbUhjZS9TWjV5?=
 =?utf-8?B?UUtlT1RkQ2NGcFF1bGVDV3F2OHEzd0YwTTM2Q0NLUWZ6bmRGVUtES2grNEY3?=
 =?utf-8?B?Z0R2Nkk0ZVBZZjFaY0VMSzVnK0txMHdqNWlVVFpIbEJ3eTYxTFl2R3dUbTVr?=
 =?utf-8?B?dVlLb2E5dU40M3d5U09MMjhTdGtQdkcyQm95azIxZnp0SFpUeCsyT1BSUHRj?=
 =?utf-8?B?K3NyZ2t5QWxPeXFmdVdEbDZiSVlzVTNPWHdxbGswQldncTJuSGQ3SjgwanJO?=
 =?utf-8?B?cGVzckxuZzZwNkV5K215cXllQit2VWZEanNpMHczMnZ1Q2xOMTQvWXBobUpP?=
 =?utf-8?B?cHZwUjlYVmlWMzV5TkI2OUx4QUk3NkVRS3pKRWNwMWl2M0RYSlVQdGFZSFdH?=
 =?utf-8?B?bG9oUkNTVUM3KzRBWkt5Z2twRHR4TnpHK1J3L0JHM2RKN2d5N0lObTIxZlN1?=
 =?utf-8?B?YW1wREFBVWlYemN3cmZFeW9helFGbWZ0RjltSGVESjdOQndhRi9VZXMvc3Jx?=
 =?utf-8?B?VUtadURCa2pZTVlqYWlubVdpM2t6dHd5TUFodlNMaFVNeUFyVm1vU2VEQ1FL?=
 =?utf-8?B?OC9IdENMbk9pUkdGbDdFeVk5c2tkZDRBRUllODVWaEhyWDdRZzhCZkp5TzM3?=
 =?utf-8?B?SlhyUGhiYjByeUhCQ3VLZG11aWc4cHArQUMrOXNoaHRxWlBJYnNtdmpNRUJK?=
 =?utf-8?B?b09RdzhoV1RVOFRvMEo3T2sxZXVyMTBvMEozVWlRaXo2dUdNNC9NVW5SaURm?=
 =?utf-8?B?eHREQ290VFQ1WkdkKzdEUTUva0RqUGZ0djBSazg1MXdaL1VkUnhvMlE4eWV0?=
 =?utf-8?B?ZVlHOGE2dy83R1c2Y3NlMmVHdGtYdjVZWExDbGtYdVNkeU42cTNhQ0NKbHZW?=
 =?utf-8?B?SDlBTU1GZ1BFQWpWdG1DclVoQ1RNUXhKM2F1a3hEMmkvaDhKSWdNeFZ3VUJJ?=
 =?utf-8?B?UTE2V0NqZjdJZHZpRXVIdUl3M2l2WVNGVFJWeElJcmFHeGpuQ0dINFBqdDlJ?=
 =?utf-8?B?MldzaDVwOXVrYlNmTHVDcXlyWm5uM0tKOXI2V2pjbUZoOVp2bFJCOEpOSkR4?=
 =?utf-8?B?YUQrNXo2SU56REtSYUJmTjB4cStUT3QzOGNpZEV0emhiYkh1MFFHazFhcjZS?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b61d8-ba83-4b4c-337f-08dc550143c3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 23:45:10.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw4poAysihWNEG3LyR3JKrWhN5NucP8dpD2T4qMe/RdVvE37rZXpNzPQZly6NfwhT7upBDwQyKQfHOGPOsMFR9ygziKWHPhHPMbJXlXzzqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On 4/4/2024 16:22, John Harrison wrote:
> On 4/2/2024 22:35, Upadhyay, Tejas wrote:
>>> -----Original Message-----
>>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>>> Sent: Wednesday, April 3, 2024 2:26 AM
>>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
>>> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost, 
>>> Matthew
>>> <matthew.brost@intel.com>
>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests 
>>> reset
>>> domain aware
>>>
>>> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>>>> On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>>>>> RCS/CCS are dependent engines as they are sharing reset domain.
>>>>> Whenever there is reset from CCS, all the exec queues running on RCS
>>>>> are victimised mainly on Lunarlake.
>>>>>
>>>>> Lets skip parallel execution on CCS with RCS.
>>>> I haven't really looked at this specific test in detail, but based on
>>>> your explanation here, you're also going to run into problems with
>>>> multiple CCS engines since they all share the same reset. You won't
>>>> see that on platforms like LNL that only have a single CCS, but
>>>> platforms
>>> but it is seen on LNL because of having both RCS and CCS.
>>>
>>>> like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset on
>>>> one kills anything running on the others.
>>>>
>>>>
>>>> Matt
>>>>
>>>>> It helps in fixing following errors:
>>>>> 1. Test assertion failure function test_legacy_mode, file, Failed
>>>>> assertion: data[i].data == 0xc0ffee
>>>>>
>>>>> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c,
>>>>> Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0
>>>>>
>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>> ---
>>>>>   tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>>>>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/intel/xe_exec_threads.c
>>>>> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
>>>>> --- a/tests/intel/xe_exec_threads.c
>>>>> +++ b/tests/intel/xe_exec_threads.c
>>>>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>>>>       return NULL;
>>>>>   }
>>>>>
>>>>> +static bool is_engine_contexts_victimized(int fd, unsigned int
>>>>> +flags) {
>>>>> +    if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>>>>> +        return false;
>>> as above, I don't think we should add any platform check here. It's 
>>> impossible
>>> to keep it up to date and it's also testing the wrong thing.
>>> AFAIU you don't want parallel submission on engines that share the same
>>> reset domain. So, this is actually what should be tested.
>> Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which 
>> helps to run things parallelly on engines in same reset domain and 
>> apparently BMG/LNL does not have that kind of support so applicable 
>> for LNL/BMG with parallel submission on RCS/CCS only.
>>
>> @Harrison, John C please reply if you have any other input here.
> I don't get what you mean by 'have some kind of WA/noWA'. All 
> platforms with compute engines have shared reset domains. That is all 
> there is to it. I.e. everything from TGL onwards. That includes RCS 
> and all CCS engines. So RCS + CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. 
> Any platform with multiple engines that talk to EUs will reset all of 
> those engines in parallel.
>
> There are w/a's which make the situation even worse. E.g. on DG2/MTL 
> you are not allowed to context switch one of those engines while 
> another is busy. Which means that if one hangs, they all hang - you 
> cannot just wait for other workloads to complete and/or pre-empt them 
> off the engine prior to doing the shared reset. But there is nothing 
> that makes it better.
>
> I assume we are talking about GuC triggered engine resets here? As 
> opposed to driver triggered full GT resets?
>
> The GuC will attempt to idle all other connected engines first by 
> pre-empting out any executing contexts. If those contexts are 
> pre-emptible then they will survive - GuC will automatically restart 
> them once the reset is complete. If they are not (or at least not 
> pre-emptible within the pre-emption timeout limit) then they will be 
> killed as collateral damage.
>
> What are the workloads being submitted by this test? Are the 
> pre-emptible spinners? If so, then they should survive (assuming you 
> don't have the DG2/MTL RCS/CCS w/a in effect). If they are 
> non-preemptible spinners then they are toast.
>
> John.
>
>
>>
>> Thanks,
>> Tejas
>>> Lucas De Marchi
>>>
>>>>> +
>>>>> +    if (flags & HANG)
>>>>> +        return true;
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * SUBTEST: threads-%s
>>>>>    * Description: Run threads %arg[1] test with multi threads @@
>>>>> -955,9 +966,13 @@ static void threads(int fd, int flags)
>>>>>       bool go = false;
>>>>>       int n_threads = 0;
>>>>>       int gt;
>>>>> +    bool has_rcs = false;
>>>>>
>>>>> -    xe_for_each_engine(fd, hwe)
>>>>> +    xe_for_each_engine(fd, hwe) {
>>>>> +        if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
>>>>> +            has_rcs = true;
>>>>>           ++n_engines;
>>>>> +    }
>>>>>
>>>>>       if (flags & BALANCER) {
>>>>>           xe_for_each_gt(fd, gt)
>>>>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
PS: There is nothing in the function name that suggests this is a reset 
specific test. If this is common code for multiple tests including some 
that do not expect to hit resets, then removing all testing of compute 
engines is a bad idea.

John.


>>>>>       }
>>>>>
>>>>>       xe_for_each_engine(fd, hwe) {
>>>>> +        /* RCS/CCS sharing reset domain hence dependent engines.
>>>>> +         * When CCS is doing reset, all the contexts of RCS are
>>>>> +         * victimized, so skip the compute engine avoiding
>>>>> +         * parallel execution with RCS
>>>>> +         */
>>>>> +        if (has_rcs && hwe->engine_class ==
>>> DRM_XE_ENGINE_CLASS_COMPUTE &&
>>>>> + is_engine_contexts_victimized(fd, flags))
>>>>> +            continue;
>>>>> +
>>>>>           threads_data[i].mutex = &mutex;
>>>>>           threads_data[i].cond = &cond;
>>>>>   #define ADDRESS_SHIFT    39
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>> -- 
>>>> Matt Roper
>>>> Graphics Software Engineer
>>>> Linux GPU Platform Enablement
>>>> Intel Corporation
>

