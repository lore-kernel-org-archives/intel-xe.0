Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED821C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 23:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6C810E40B;
	Mon,  8 Apr 2024 23:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkxrNJT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4347210EDAF
 for <Intel-Xe@lists.freedesktop.org>; Mon,  8 Apr 2024 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712620090; x=1744156090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A9nnxz+YQSzE+C4tO5ucHLlXp6R4OI6bypLXpyV9R2k=;
 b=GkxrNJT0PrrxT/P5q8ytjNgNFPsbq/f6gctyKunXIhwogK35ppg1Kr85
 T9dkBiY3q/sAxeUzbjb01Y0CUoneqW4HC7ebhlGqf8a5VEWlnMi3uFClY
 mhQ0FiLlEtx0pOLr9RcSUaFd2LdbwmIXH31PXCDFotnA4TOq7Js45sNI/
 v5hlXOsfiRbW7JZLCjUyh/PvUz9YQuGCjOmlQZBcJUGJclvNIFQrYk+nb
 8mARxJ64Z+DHC/0MC84+/n8qrzIX7FRlKRvwk2/aIkK9Axli2XO9zIwpU
 Kjt8iIeoGie/PnqF8B46ySmG+6X5pLTE1gH5vvAO7amhTv4hWOSAmNsHm g==;
X-CSE-ConnectionGUID: Kb7Vg8tCRlWUWE6akiSEFQ==
X-CSE-MsgGUID: zUW1nb80TB6SnFpX/4VwBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18489585"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="18489585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 16:48:08 -0700
X-CSE-ConnectionGUID: lO5uRRzJQMKTeTmV3KUg9w==
X-CSE-MsgGUID: +ukNxNRITHedhc02HEJZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19916425"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 16:48:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 16:48:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 16:48:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 16:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aENYNpNDTchr/ldQ9YwepXpx9k125/Jmvn/0uwyav2UbAlQ4fIvM/t1lqJogtmEpCjhOQVXFg9PD+Sh9Cd8ctGEF0tyN/bcB9dXJfx8oLZ2RHQYgCwMWZW5R3lBV7juJnldJ3kg2OE6N1fkAv/4+bwr2K6lQtf5Z5nXSJBL0T1C1ED38tmHmWUFi0y5yAuWz+JfSEKwCoyaz0tp6pjcicgUsM3+6ppDjd6NmygPn47CCJ9xFHfFV1LG3wt4Xz8Bf1do1aZXNyc+Vceiht/t+x7BSj/L6P1E1JSgmiEu/l4Z9qngNd5m7ca3af9oHfHsT8KENzkw7UlqsJiAH4VrIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG85FRUjqe0YgIKKId56AXo05cOLjNLP9+kOi7P22Zo=;
 b=EmFEwKVIq+bxVzRiJyDIbHfpU0CYdDx8X9rfYl8XpU/xPj5whvRpiSPKpGwELh3GMmLl2Z9A3l/1+ElFwY3JsajBsOJXLS70VXLAFsR1BxfOD6RltZlsGJgNQlpHbNJOjjfb//9lzmxlUHIh/WqHUQHDkdyz2H0+uhTMYE68EHj6/+gnqLeWXMlkuMgqFqUYQ7X/lYv1XEf9QEknH0EfWagqE+2xYHXlaXpz8RCQ8w9eMK/fj8AxXZ3mGY26WKy9thzpUpUGlPIoq4P0B5uNza5NxXDWemwK/Sp019RNsZmoV5gasfWPqNVpVA7nxqH4MNsLPMnHZ4phyQ4ZtE8bfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Mon, 8 Apr
 2024 23:48:06 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 23:48:06 +0000
Message-ID: <adc375f9-9a72-4ab4-ad59-445d6ffa449a@intel.com>
Date: Mon, 8 Apr 2024 16:48:02 -0700
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
 <eb436c04-861e-41ea-8fa0-28c4fd367902@intel.com>
 <szwu5jcjlxv44lptdk7ua5heb3vn5ubimhqukkd2rne23hejgv@q5k2tdar55d6>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <szwu5jcjlxv44lptdk7ua5heb3vn5ubimhqukkd2rne23hejgv@q5k2tdar55d6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7673:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0kSaHq7XMu9drLTiU0by/wPbMnZL29dWpbf8PucZcFVcKUQrJ7SUotA8JKKKavjWarcmf8h5+UthYawfmsaseuqSg/eeWSxUSPWsm6oNbCXYycKLEaf4fLK8xCIwPzTDrAIumgmfZB/bi/1pzXY89TajLMxhm0M4cHtQXXv/8+Zjoj1PF/JqdLDWngRN/9pRk/4EWNDe4/O9xRVec4eqngspslwcGt3BksoZTmaSk2RLvx/A7ev3YZ9ktoC8za2F1xL21uBCbZTBZo/B4/aH/5u68azc1GfO3rL/1v4I/FWBfPmdO1NfCZFWhGGPUY/iswVcojUodGJjO+oE4QWqG/Qzq7mT3n1TSN8iE/J4LAKbDKuEnC6mhFw5WTw9OQmsxpnsoFbT1bX3dCGKpMGxFvg79DpHbVUTs8BEjLNo0fU7YBvPriVv0a1Vu0TBUyKzesmFgu8P7iWo7jaj7RNEE8/XYOWabvOYe6Fgz9ttJH4wBVU7YhOUKtPQqOEfdLUBDviRsNrEF10NOAQTVojpddIHy64TcXKYQWsXywNgeMnUis/+mdyj6n3vGNOQfWC/344w0oEmezHQ61CruJ4qS35Vc2PhcoytkI8VDBOYXhvYbRUdKFocLe5F4qGFk7v5D0VaSmhemOGe8e+zaQ8dwv4nzTCr/q9CDOqJJHbb1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RoMndoT0tieHA5Z2FjNHNnM2JocEtqRklHODVzaDZ2b3lZQjZrdFc3aXVq?=
 =?utf-8?B?N3dpL0E1YUVxNk5JekpjdDZTS1lVeUtSZWRRTHU3bW1HMkNxQzVTUWN2aWFr?=
 =?utf-8?B?NHNMSExvQ2c0Z2RvdzhlLzBwWkFtaURYRGZzMmwyTUdBMUpDNTJYMkNKa0dE?=
 =?utf-8?B?ZlF3Qnk2L2xBeFliK2xydFBLTTZtYk5HRCtLK1V2Z3p4Q3h2My9nekl0NEVK?=
 =?utf-8?B?TXdDL3F3azA5TE1zb2p5YmtKUktQb2ZEU2RleFk2WEVleEs1UnJaTk11SUFL?=
 =?utf-8?B?OHg0Ukdmb1BPb0xWRFVDdHYyNjVKNk4zL214bnNOYUhoVm1XWW00T0NMOW9K?=
 =?utf-8?B?aWJBbG11dGFQR0xrK25ULys0aGVsaFBmV2UxT0FlMDNpVHlwNXpxZUdoMmV4?=
 =?utf-8?B?NWVTZm0rajNzWWhORXlaTDI2MndheHRsWVNicmFXajdTeHVrQVU5Z2FSeklq?=
 =?utf-8?B?aWUxRS8wUUlOY3Q1UGtWZHZBUzdvcDlFS0JFREVqaWlHLzU3emtpa0diZnhP?=
 =?utf-8?B?bVBwdElMOW5iRHV1Q0RrMEJvQVEvU3pHM2JLSndiU2J4QWRidjRvUVBBanpz?=
 =?utf-8?B?T1pEcEFTa0JqUVBaRWxWYjdJSGYxRlM4Uzk1ZkYvNkhiRXlGSG1kZzJGVGEr?=
 =?utf-8?B?aXRKUGNPaXU3U3RFanRHejZmcGJZWmJUT01TZFQ0aHNKWjBvQnQwWXJhQklq?=
 =?utf-8?B?ZTU3L3p6VDQ3WG9MTlBINVM0RGFON21LUUFRUVE4MG9WQUI2RmZPaTNtOHU1?=
 =?utf-8?B?MHA1Rll4MnNva0YwWlpEekRwaFlGU0diSzZtdnVIdnJlMiswdXNUWXU1L295?=
 =?utf-8?B?bzN4UHcyeVhTdzNrUkFmbEs4TTNUNDQ3dUhyOCt5dm5rSFFGZ2FuS0hxbE5v?=
 =?utf-8?B?TzExeU9icXlkcEs1UG96Vlk4U2IyTkdudktnT1MxMFVCWVk2OW04dTlOWkxM?=
 =?utf-8?B?MGhNcmFlaVdhcHkwWHlIVnhUOGJ1VFlQcG51TlZGWkQ5S3ZobXV3NjBaQU9l?=
 =?utf-8?B?bzVuL1c1L1JMYTZ2Rk5wL1doSHg5a3VpZXZXMHFNTTZMeE5GY3dRdWRSUW8y?=
 =?utf-8?B?eTAxalJOd1FuTXhncWkxWTh1WmVqbGdXZU92TVYrQlBEUW5RaUprWFVrU24x?=
 =?utf-8?B?amMxcTlET0FyblE1WXhZbGNJdnJiQ2dvMVgyWmZQOVN2Z1pQS0psMWVlT2hH?=
 =?utf-8?B?cUNEUzlDVUNnMTdTcTgrYVBNRy9HSkNlZHBXaXFyVk1ZbW5FdVE2R1VWZ0p2?=
 =?utf-8?B?bzV4NHhyQUs2eGY5dXV3ekRtdGhVOVoxRmY2SndkTG41ZytzUFF5d3dYOGNz?=
 =?utf-8?B?eE5WNlEvS2tSbHRpSFdsL1ZFNjE0cHRIOURBYWlKOXFHWGwrd0dUTjd1YW1i?=
 =?utf-8?B?cjlZbkNROVFpUHl5eVZBQy9LRVB5QWZYQm9WZE1pTThzbVBTbTNWNS83UjFT?=
 =?utf-8?B?eUFpaEdrdUNRWU5Yams4NTZKRExaYml3T05Vd09UbE1YbEVTeGNCWFJIK1pG?=
 =?utf-8?B?aDZ3Q25ueldHaERneFM1eUhIY3hESitFUWI3ZzVIWSs4SXJTNHlXTU8zZTRF?=
 =?utf-8?B?WHBGQlBJakZzNUNCb2VGb0ZNTWRjcXNwTFZTK24rU0h5ZmdVNysya1hYZ2VB?=
 =?utf-8?B?TkVNck1UYmpOL3hsSStCWWdPc29vcDFyZ2FwcmVsKzhkM3B2OHBITjNET2VH?=
 =?utf-8?B?QU5lTjB5NjlDRkdYUnRteDFMUWZHcUt0eHNXQVRxc21sWWYyM0RZYjNYOFFP?=
 =?utf-8?B?UHdlK2wwVDZ4VWJray80YXJvS0pva0NtcW1pMUxmaHFBVHlNd3hiSGE4WUh0?=
 =?utf-8?B?bFhhdklhQnJsa0NPLzZoMEo5ZFA4bGI2QnQyVmVUT1hmWWptNnVhMm54c2Z6?=
 =?utf-8?B?VHVkZVVxaXZJMkRvbzNMUktzaUgvSEZmcWxhWHRiVWJkR2w4RDBKd3pOSWhu?=
 =?utf-8?B?OE1pTDBMSHUzRXlYTHN4YTFPSEc4U1BLU3RSdkFFbmdkMjhxdEhsbFQydVp1?=
 =?utf-8?B?UGRpem45SlZiSWRMRW84dmd6OU5sSFRla1MyM3NHUzJBazdPRlFUQ1I3RHQw?=
 =?utf-8?B?WFNHaVNkc012RXJtaDNLN05weEtUNXpnU1RwTXNuTzZCa0Vsb3lwdjRGUkJW?=
 =?utf-8?B?ZlpoVkszUTdVS0RaRlRZTnREazJBeTJoS0JRSFFFN01LMEl0RjhPMytkbWRG?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2037fbc-d162-4458-8dc2-08dc58265659
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 23:48:06.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgMot04Tv319WyP3EV/RUBGxZUrfwgW1zy+chrLTcsuLv1BCdOZFjPu95fH3PYZTp73VtOTiEPqM/gxx+bxpmYtCXcUkG+0Qul3tvvYm5dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

On 4/4/2024 14:07, Lucas De Marchi wrote:
> On Thu, Apr 04, 2024 at 01:11:34PM -0700, John Harrison wrote:
>> On 4/4/2024 13:03, Lucas De Marchi wrote:
>>> On Thu, Apr 04, 2024 at 12:52:45PM -0700, John Harrison wrote:
>>>> On 4/4/2024 12:19, Lucas De Marchi wrote:
>>>>> On Tue, Feb 27, 2024 at 05:09:56PM -0800, 
>>>>> John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> GuC loading can take longer than it is supposed to for various
>>>>>> reasons. So add in the code to cope with that and to report it 
>>>>>> when it
>>>>>> happens. There are also many different reasons why GuC loading can
>>>>>> fail, so add in the code for checking for those and for reporting
>>>>>> issues in a meaningful manner rather than just hitting a timeout and
>>>>>> saying 'fail: status = %x'.
>>>>>>
>>>>>> Also, remove the 'FIXME' comment about an i915 bug that has never 
>>>>>> been
>>>>>> applicable to Xe!
>>>>>>
>>>>>> v2: Actually report the requested and granted frequencies rather 
>>>>>> than
>>>>>> showing granted twice (review feedback from Badal).
>>>>>> v3: Locally code all the timeout and end condition handling 
>>>>>> because a
>>>>>> helper function is not allowed (review feedback from Lucas/Rodrigo).
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
>>>>>> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>>>> drivers/gpu/drm/xe/xe_guc.c             | 226 
>>>>>> +++++++++++++++++++-----
>>>>>> drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
>>>>>> drivers/gpu/drm/xe/xe_mmio.h            |   2 +
>>>>>> 5 files changed, 274 insertions(+), 43 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>>>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>> index ec83551bf9c0..d0b5fed6876f 100644
>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>> @@ -7,8 +7,12 @@
>>>>>> #define _ABI_GUC_ERRORS_ABI_H
>>>>>>
>>>>>> enum xe_guc_response_status {
>>>>>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>>>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>>>> +    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>>>> +    XE_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
>>>>>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
>>>>>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
>>>>>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED = 0x204,
>>>>>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>>>> };
>>>>>>
>>>>>> enum xe_guc_load_status {
>>>>>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH = 0x02,
>>>>>>     XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH = 0x03,
>>>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE = 0x04,
>>>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START = 0x05,
>>>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE = 0x06,
>>>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR = 0x07,
>>>>>>     XE_GUC_LOAD_STATUS_GDT_DONE = 0x10,
>>>>>>     XE_GUC_LOAD_STATUS_IDT_DONE = 0x20,
>>>>>>     XE_GUC_LOAD_STATUS_LAPIC_DONE = 0x30,
>>>>>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>>>>     XE_GUC_LOAD_STATUS_READY = 0xF0,
>>>>>> };
>>>>>>
>>>>>> +enum xe_bootrom_load_status {
>>>>>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND = 0x13,
>>>>>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND = 0x1A,
>>>>>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE = 0x2B,
>>>>>> +    XE_BOOTROM_STATUS_RSA_FAILED = 0x50,
>>>>>> +    XE_BOOTROM_STATUS_PAVPC_FAILED = 0x73,
>>>>>> +    XE_BOOTROM_STATUS_WOPCM_FAILED = 0x74,
>>>>>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED = 0x75,
>>>>>> +    XE_BOOTROM_STATUS_JUMP_PASSED = 0x76,
>>>>>> +    XE_BOOTROM_STATUS_JUMP_FAILED = 0x77,
>>>>>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED = 0x79,
>>>>>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT = 0x7A,
>>>>>> +    XE_BOOTROM_STATUS_EXCEPTION = 0x7E,
>>>>>> +};
>>>>>> +
>>>>>> #endif
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> index 4e7f809d2b00..2e54c9e6a4fe 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>> @@ -40,6 +40,8 @@
>>>>>> #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 
>>>>>> 0x76)
>>>>>> #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>>>
>>>>>> +#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>>>> +
>>>>>> #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>>>> #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>>>> #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index 0d2a2dd13f11..771971110600 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -17,6 +17,7 @@
>>>>>> #include "xe_device.h"
>>>>>> #include "xe_force_wake.h"
>>>>>> #include "xe_gt.h"
>>>>>> +#include "xe_gt_throttle.h"
>>>>>> #include "xe_guc_ads.h"
>>>>>> #include "xe_guc_ct.h"
>>>>>> #include "xe_guc_hwconfig.h"
>>>>>> @@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>>>>     return 0;
>>>>>> }
>>>>>>
>>>>>> -static int guc_wait_ucode(struct xe_guc *guc)
>>>>>> +/*
>>>>>> + * Check a previously read GuC status register (GUC_STATUS) 
>>>>>> looking for
>>>>>> + * known terminal states (either completion or failure) of 
>>>>>> either the
>>>>>> + * microkernel status field or the boot ROM status field. 
>>>>>> Returns +1 for
>>>>>> + * successful completion, -1 for failure and 0 for any 
>>>>>> intermediate state.
>>>>>> + */
>>>>>> +static int guc_load_done(u32 status)
>>>>>> {
>>>>>> -    struct xe_device *xe = guc_to_xe(guc);
>>>>>> -    u32 status;
>>>>>> -    int ret;
>>>>>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>>>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>>>> +
>>>>>> +    switch (uk_val) {
>>>>>> +    case XE_GUC_LOAD_STATUS_READY:
>>>>>> +        return 1;
>>>>>> +
>>>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>>>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>>>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>>>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>>>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>>>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>>>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>>>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>>>> +        return -1;
>>>>>> +    }
>>>>>> +
>>>>>> +    switch (br_val) {
>>>>>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>>>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>>>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>>>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>>>>>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>>>> +        return -1;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>>>>> +{
>>>>>> +    u32 freq;
>>>>>> +    int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>>>>> +
>>>>>> +    return ret ? ret : freq;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Wait for the GuC to start up.
>>>>>> + *
>>>>>> + * Measurements indicate this should take no more than 20ms 
>>>>>> (assuming the GT
>>>>>> + * clock is at maximum frequency). However, thermal throttling 
>>>>>> and other issues
>>>>>> + * can prevent the clock hitting max and thus making the load 
>>>>>> take significantly
>>>>>> + * longer. Indeed, if the GT is clamped to minimum frequency 
>>>>>> then the load times
>>>>>> + * can be in the seconds range. As, there is a limit on how long 
>>>>>> an individual
>>>>>
>>>>>                     ^ that comma seems misplaced
>>>>>
>>>>>> + * usleep_range() can wait for, the wait is wrapped in a loop. 
>>>>>> The loop count
>>>>>> + * is increased for debug builds so that problems can be 
>>>>>> detected and analysed.
>>>>>> + * For release builds, the timeout is kept short so that user's 
>>>>>> don't wait
>>>>>> + * forever to find out there is a problem. In either case, if 
>>>>>> the load took longer
>>>>>> + * than is reasonable even with some 'sensible' throttling, then 
>>>>>> flag a warning
>>>>>> + * because something is not right.
>>>>>> + *
>>>>>> + * Note that the only reason an end user should hit the timeout 
>>>>>> is in case of
>>>>>> + * extreme thermal throttling. And a system that is that hot 
>>>>>> during boot is
>>>>>> + * probably dead anyway!
>>>>>> + */
>>>>>> +#if defined(CONFIG_DRM_XE_DEBUG)
>>>>>> +#define GUC_LOAD_RETRY_LIMIT    20
>>>>>> +#else
>>>>>> +#define GUC_LOAD_RETRY_LIMIT    3
>>>>>> +#endif
>>>>>
>>>>> just sent a comment on this reasoning in the previous version.
>>>>> Continuing from here.
>>>>>
>>>>>> +#define GUC_LOAD_TIME_WARN 200
>>>>>
>>>>> let's also add the unit, _MSEC
>>>>>
>>>>> Also, comment above says 20, but here we warn on 200. Is that 10x
>>>>> difference a typo or intended?
>>>> It's a safety margin to allow for situations such as a system that 
>>>> just rebooted due to thermal shutdown and is still running hot and 
>>>> therefore slow. I'll update the comment above to explain.
>>>>
>>>>>
>>>>>>
>>>>>> +static int guc_wait_ucode(struct xe_guc *guc)
>>>>>> +{
>>>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>>>> +    ktime_t before, after, delta;
>>>>>> +    int load_done;
>>>>>> +    u32 status = 0;
>>>>>> +    int ret, count;
>>>>>> +    u64 delta_ms;
>>>>>> +    u32 before_freq;
>>>>>> +
>>>>>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>>>> +    before = ktime_get();
>>>>>>     /*
>>>>>> -     * Wait for the GuC to start up.
>>>>>> -     * NB: Docs recommend not using the interrupt for completion.
>>>>>> -     * Measurements indicate this should take no more than 20ms
>>>>>> -     * (assuming the GT clock is at maximum frequency). So, a
>>>>>> -     * timeout here indicates that the GuC has failed and is 
>>>>>> unusable.
>>>>>> -     * (Higher levels of the driver may decide to reset the GuC and
>>>>>> -     * attempt the ucode load again if this happens.)
>>>>>> -     *
>>>>>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>>>>>> condition
>>>>>> -     * where the asynchronous frequency management code could 
>>>>>> reduce
>>>>>> -     * the GT clock while a GuC reload is in progress (during a 
>>>>>> full
>>>>>> -     * GT reset). A fix is in progress but there are complex 
>>>>>> locking
>>>>>> -     * issues to be resolved. In the meantime bump the timeout to
>>>>>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>>>>>> -     * in the working case, a larger timeout makes no difference.
>>>>>> +     * Note, can't use any kind of timing information from the 
>>>>>> call to xe_mmio_wait.
>>>>>> +     * It could return a thousand intermediate stages at random 
>>>>>> times. Instead, must
>>>>>> +     * manually track the total time taken and locally implement 
>>>>>> the timeout.
>>>>>
>>>>> that's something we may improve in future with a variant with a 
>>>>> better
>>>>> variant of this function to be used on loops.
>>>>
>>>> Or maybe a variant which allows a custom comparison function to be 
>>>> passed in and keeps all the time tracking internal...
>>>
>>> yep, that would be ok I think. Do you want to give this a shot?
>>>
>>> Lucas De Marchi
>>
>> Um. That's exactly what it was using to start with and exactly what 
>> got shot down as not being allowed at all ever under any circumstances.
>
>
> no, that was not the version 1. Pasting here from version 1:
>
>     diff --git a/drivers/gpu/drm/xe/xe_macros.h 
> b/drivers/gpu/drm/xe/xe_macros.h
>     index daf56c846d03..eac8f2c9fba5 100644
>     --- a/drivers/gpu/drm/xe/xe_macros.h
>     +++ b/drivers/gpu/drm/xe/xe_macros.h
>     @@ -15,4 +15,36 @@
>                     "Ioctl argument check failed at %s:%d: %s", \
>                     __FILE__, __LINE__, #cond), 1))
>
>     +/*
>     + * xe_wait_for - magic wait macro
>     + *
>     + * Macro to help avoid open coding check/wait/timeout patterns. 
> Note that it's
>     + * important that we check the condition again after having timed 
> out, since the
>     + * timeout could be due to preemption or similar and we've never 
> had a chance to
>     + * check the condition before the timeout.
>     + */
>     +#define xe_wait_for(COND, US) ({ \
>
> What I'm telling is to have a xe_mmio_wait() variant that is in the
> proper namespace, wait on a mmio, etc. They can even share part of the 
> implementation
> inside xe_mmio.c. Currently the only wait condition is == value. Having
> a different wait condition as return from a functor is not the same thing
> as starting a kitchen-sink-header.h. That's what the push back was on.
Not seeing the difference. As soon as you pass in a callback function, 
it is a kitchen sink helper. The callback can go off and do whatever it 
likes. The only difference is that it enforces a register read before 
calling the callback. You could just pass in a timestamp register and do 
whatever totally unrelated test in the callback. So why bother enforcing 
a register read at all? The only purpose/requirement of the helper is to 
manage the timing. I don't see how restricting a wait helper to only 
wait on register reads is making the driver cleaner or simpler. It just 
makes it more difficult to code up what the task actually requires which 
makes increases the maintenance burden down the line.

Feel free to rewrite this how you think it should be done later, but I 
just do not see any difference so I'm going to keep this as is.

John.

>
> Lucas De Marchi
>
>>
>> John.
>>
>>>
>>>>
>>>>>
>>>>>>      */
>>>>>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, 
>>>>>> GS_UKERNEL_MASK,
>>>>>> -                 FIELD_PREP(GS_UKERNEL_MASK, 
>>>>>> XE_GUC_LOAD_STATUS_READY),
>>>>>> -                 200000, &status, false);
>>>>>> +    do {
>>>>>> +        u32 last_status = status & (GS_UKERNEL_MASK | 
>>>>>> GS_BOOTROM_MASK);
>>>>>>
>>>>>> -    if (ret) {
>>>>>> -        struct drm_device *drm = &xe->drm;
>>>>>> -
>>>>>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", 
>>>>>> status);
>>>>>> -        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>>>> BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>>>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>>>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>>>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>>>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>>>>>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>>>> -
>>>>>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>>>> -            drm_info(drm, "GuC firmware signature verification 
>>>>>> failed\n");
>>>>>> +        /*
>>>>>> +         * Wait for any change (intermediate or terminal) in the 
>>>>>> status register.
>>>>>> +         * Note, the return value is a don't care. The only 
>>>>>> failure code is timeout
>>>>>> +         * but the timeouts need to be accumulated over all the 
>>>>>> intermediate partial
>>>>>> +         * timeouts rather than allowing a huge timeout each 
>>>>>> time. So basically, need
>>>>>> +         * to treat a timeout no different to a value change.
>>>>>> +         */
>>>>>> +        xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | 
>>>>>> GS_BOOTROM_MASK,
>>>>>> +                   last_status, 1000 * 1000, &status, false);
>>>>>
>>>>> if I understood correctly the meaning of this function, it would 
>>>>> better
>>>>> be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?
>>>>>
>>>>> i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
>>>>> and the previous register value and you wait for a change
>>>>> in that field of the register. Is that the correct meaning of the
>>>>> function?
>>>> The test is 'read != given'. That sounds like a not to me. A _mask 
>>>> or _field suffix (to me) would imply just that the regular wait 
>>>> semantics are applied with a mask or to a specific field (which is 
>>>> already the case, isn't it?). I.e. wait until '(read & mask) == 
>>>> given' or even '(read & mask) == (given << shift)' for a field 
>>>> version. This is the negative version of that test. It must wait 
>>>> until the value has changed, i.e. is not equal to the given target.
>>>>
>>>>>
>>>>> ugh... this bool value to show atomic or otherwise shouldn't be there
>>>>> (but it's pre-existent issue).
>>>> Feel free to fix the baseline xe_mmio_wait32 function. I'm just 
>>>> copying that and trying to stay as close as possible but just 
>>>> inverting the comparison logic.
>>>>
>>>> John.
>>>>
>>>>>
>>>>> Lucas De Marchi
>>>>
>>

