Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43AC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 21:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F9410E042;
	Thu, 30 Nov 2023 21:19:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ACD10E042
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701379164; x=1732915164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i9LLEarQLG6Fbg7eVQUtSLDpk8iftDh0gC26teb7gpI=;
 b=FIF2KG195H0Ve5DJUuWHiALhTsaiSapFdPatswHbU7/vEVYMKLdkSl98
 8UB9TOlmPh7tXzQz8+COT0iM/LI340YB6of164Yvg7jwwVtqHXgZ1Q/SN
 ownZ7koLAjbgxgeIrC2Co/mSMZRZJhAa+fUzFfMtkg1BEos0VthfRiWbO
 QfYyj7REBMdPfrLrUX91Utq4VzAb3N7ptkk0rnsc/sy7xJ9o3L0zdWnJJ
 1ZMqfUNZsk2k1HXdCy0TqrFePNN9PMIr0igISNjEbNUWJNGnGtQS4ULmH
 QgV5OC1NXZ16060H2o5OV0reZjBFm+lUvD0+M7cPvgYkL0e5dMOj5+8ab A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12103329"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="12103329"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 13:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839936826"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="839936826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 13:19:23 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 13:19:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 13:19:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 13:19:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvDNZ/xkrP8AemFLgGT0Nhtxakm/hPTgrdv/vRfoEgUIuYKd9dFX7VY/F45smSNEw7VqXDoILuCrtfSRp+iJS9PPQ2PGE0yRpsO6WyM645GvKEw4dk5Y1lwfZKIQAsLGrrYw339ZFhCG8iB7uqVLs0TEsL2kpzmJ1MEifWcgBcyiiOADOMAC35yQsopUi1sOvYK4cmX5cGSXp6PHxTVclbZ8VHBhUfFEHYSK4jrq0ZiRfqOpc9l/+naDcl/1doDC0MMU3PJWTyVh5fwhzAw6501bXd5dGo25r8XJOqVZDmGfJrU6fNL6stfTJ65uUnwfpLDRuZokEQlLmOwAh/XyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3vq+YsfifYpPtrQkLDbLZv8b2fxgmlU2dZSqaHbVUM=;
 b=XDur/UCNeBQJGc40xhTvRIJdoyfdE9kI26Sz+UlLAHDacTADQjhJIR7ZEaH18w2Jw/Hr76h1uEfd9wl5dyHzFNE2/EwxoiUNPUKzyY391eZEV/q1EdmWQJ2HSCCafwLZdAyTn/Jtz81N/X4+S08OW8Zhk/xV95XjgcHYtqa8m2OxH+/WkUqrijsx58OjbeHhakokgvC62oN7p5bbSHF7Kr9/ZsuBxeeEtd7iWqNBldY5CW/yHya4Z6nOm2pQTZBdjTU1B676xKbbClNLwHDIy4v3O6ovq/CeeSAmcu8efYMbAX/SP2MYXAVzMEZFdaRIwUKMWdT6alzKmzI5Xd4nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 21:19:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 21:19:20 +0000
Message-ID: <1c335fa6-534e-400f-8ee1-f9e0697bd3ab@intel.com>
Date: Thu, 30 Nov 2023 13:19:18 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231116221637.2589469-1-daniele.ceraolospurio@intel.com>
 <7e7306b7-dc7a-4003-9d83-f0d518597f43@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <7e7306b7-dc7a-4003-9d83-f0d518597f43@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c694364-26a5-4a9a-e7d5-08dbf1ea0431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmsvK3SS+bsPvjGCidw7easJaYEq9PY5cjXQ87Lfd02Tqks86x8DNTvLrNYE1H0nxq6S+IRY1aCnQeFIh/vOsXIIHWC6ND2nplTH0eVbzTETCYSxW4RqzIStFTKavYjHmtGqnQAithajkBfKm5szLuQJKtl268fbsihKi7rJH1zom1IxnzqWtlUh61qtV2UNEuasBgQN/e8ca9JsbbPl+9AAuK+MjP/4CfhRT1JQ2bqETfJNUrHFy+7iGZoebOwXdWiBxSlw3S/VOE+r9kekzMcdrUh22WeHx9+qHkKgWB+Ph0tvDX7FtKsrB8kTSG5pVBKdXTGLZ3YSDDKt2HqjPasduCk/Hmdx+92nmSm8kFPmEB8cjPygFhMCGP93PW2ica0ehTpewmwA+VPRPorajygLrQJSlX3uprqC/xfoLhWjzzTNwBLAs5cnbfcixTNC2s/iutmmLMGu54KXi25rT5qTefQu8x/fd75Ni7+DaSWFN2NxPaGKtBh5vlVSvMSFicNnVqeVJdvH59C1RVmLOWIxfE1ZxqcHy92Ji00QCVCoWTewg1fUa132TdeuS0/Ob7jCkYIq2fW6bcuiBstx3ZG3EeKPkBWv1r68HyWHD9bJJ3r1Fv/owk+hHV/mrBHwOFJgKO/aFaJZalvQ290oLL5jDn1LlAqaoF550jVLVYSjP4OdcDtz+M4gScwVsIWI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82960400001)(83380400001)(2906002)(6486002)(41300700001)(478600001)(15650500001)(8676002)(36756003)(6512007)(53546011)(6506007)(31696002)(8936002)(4326008)(38100700002)(5660300002)(316002)(66556008)(66946007)(54906003)(66476007)(26005)(86362001)(31686004)(2616005)(107886003)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FvZENGWlhOVWxHYnBIaUpzVDdvcnNSVDA4ZjJrZkcxL0hvcUsvWmNka3hm?=
 =?utf-8?B?ZkVYbDNuYkJBdFZOczJuUzZJZXYxTFJsNjNkdW9SVnBSQTZYQVBIOWVtclBp?=
 =?utf-8?B?R3dNaXJMcHk5ajEyUDhHdkp2YVlLTVVNeGVoS0N1MkVWVjZzdmtldjRBdFM2?=
 =?utf-8?B?SnJ5bm1OVnRkWFQ3NE56a3NyM1BKMERsekVvb1ZYRUtOUGxjNU00MHFyWWxS?=
 =?utf-8?B?aWdzQWN3eEtuN2laNU0rZW1wVEpDTWdIQzVubEFQUlVxY2VnejJNYW5TVW8r?=
 =?utf-8?B?RWM0LzZURjZRNitzZzE1OXJXTHN0MGkxQTFvaVFtQy9tZ0x3c0xsTFV0TkNS?=
 =?utf-8?B?bmpodFRQMXRMUjlFc0NoK21MZmNkeVc3aHlYc292cVJNSksyNHpydHcwWHZF?=
 =?utf-8?B?WkJ6TktDMjFlWFdvSGc4eFhpYzZFdEJRdnR6djdOUVg0d0tKY09QRmxzNjhY?=
 =?utf-8?B?MWU0RTYwS28zdG1uZGQ3SnZCUHNwUkhPd1Rzdi9qcFY4NFRPZW9VbUpQV2RU?=
 =?utf-8?B?YjR4aSs2MWcwbnVaOUgyd1ljR2RiUFFqV0F0czZ5Mko4MjRib2lRK2FJS0Yw?=
 =?utf-8?B?Nkk2cWI0eUpVVHROcFdUQzJLSk5JMXNjM0pnL0QzVWtQSTMyZk9JSnE0eFNr?=
 =?utf-8?B?bE10Zk5PNUhscUpURHRqWWRhS0FLb3pRMFRtSk8vdWRPQjJ5c3dCUnNZYWlD?=
 =?utf-8?B?U1JhSGNzUTV4VDVxVFl2MFA2SXg1MzBacWtQbXZnbWxIZ0ovTlByb1I5aytu?=
 =?utf-8?B?dExoZjBxVUdjTjlLTzlpZDBJODZKNTBvZXdrUitRUlBsVkZXNTBJK2N5QjQy?=
 =?utf-8?B?WGhTMy9JUVV5NDlWeHhPRUlnYUVKcEFmV2hsTHdRejEyOVFBU2UzVklxSG5W?=
 =?utf-8?B?T2RvRTZFOVk2Zm4vY1cxZFQyeEpKVEUzNnZJNE0rQ2oyY204Z0xZV2NzYUpJ?=
 =?utf-8?B?SU1hemRXaHVsVW84Q2h1Ty9rTUFVM0Nucm5ib1BBeDZsQ095RC83eVR5U1k5?=
 =?utf-8?B?Zm1DZklSbmYxSVpOSCs1ckt6bVVsZ0NQS2J3ejVXanRPalRKZkppZlVhdFgz?=
 =?utf-8?B?NTJMQjJmaVpWaWtxeitEY3c4Nk9zSjFDTGRxU3FNOG5SWkRQZWFmcytmK0cv?=
 =?utf-8?B?eW9LYUlEam9NZ1Z1bE1XS1JSYUQ1OEw2dmV5bjF1SzJaKzNwdmdMMU5uOEZo?=
 =?utf-8?B?a3hUTkFuNncxd09HUlNLRWVaREFpd3Y1eTRXOEl0SmhFSWpIdkE4Ujh4R1gx?=
 =?utf-8?B?K3ExTE9LRWpwdW1MRTBMRGlPRGNLdTU5RzNkMFB2aENDamFLZk5WTk4yODNs?=
 =?utf-8?B?d0NpOVZnMVBXdlEyN0lXN0V0MGV3Vk1qS1hwTnMzQW5wR2tBV00zc0t0dlFP?=
 =?utf-8?B?RUF6Vmsxdk8zM0hKa0NQbXVDa1NtYnEzL3gzVEZxNUxTODF5VVAvU29sa29s?=
 =?utf-8?B?S3poRVlyQVRJY25USEtEZ3dFV2tHTWFPK2M5YTRwajRYS2xnZDNnU3dTcTR1?=
 =?utf-8?B?SEsvQ0E2UDgvc0JiRGVLWFJsYlNIc1NZRmYwdVpOYlRsZzVHbXdrdlY1OHBW?=
 =?utf-8?B?ckd1SzdaaTVPVEY1MGpvdkhPbUV1dmZuYU5WQktGRm02Ry9GR3B0Q0JqL2V3?=
 =?utf-8?B?T21LajY5SzI2N2lJL0w3YnZBckd3c2dvQ0o4amFiUlJnTFFtMkd1VzRhRW5J?=
 =?utf-8?B?MmJjMHRFeVl2bFY4dFc2STEvWWdUYUJQWDU5eWI5SVVSZklwUmNVNENWbmJZ?=
 =?utf-8?B?dFBzWlJSSlRQWURidlQrZXRjZEkzbkpPaXN4ZWsrdlliMEJNWUVtWGJucFR6?=
 =?utf-8?B?L2ozejRJelpNcmZaTnE2NFVrczZnNkEyVTRGYTlSY2VTNXYxTkgvODdPMVJJ?=
 =?utf-8?B?THU4UDNSOVdVcnB5VWZmdUhKbVFjRjEvYnBGWlRIeGNtVEg2M3Q2U2UrWFZ3?=
 =?utf-8?B?QWJmd0ZlM2thblFIU2dwOG9Rd05PU2VwekYwb3VweXhsMTIyd1VqanlZZU55?=
 =?utf-8?B?M3VkT05udGsxMEFuYXhNZW9YMWRXckpBVGZ3REFpNGIvTEVJYWlsOXRGOVdv?=
 =?utf-8?B?VVVCeDJBVjlwWmFMWjU1eWErZE5tK1FlSGJWYk1uZkhMQ3JvcFNvaGI4ZG1x?=
 =?utf-8?B?TVBDMzRqd2lXK1RVMkp0M1JiQWVDS3RFaFhKK0wwcm5zdTMra0ZHRjQvakwr?=
 =?utf-8?Q?IZpWvO/m4Yqt622Tw0jqHaI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c694364-26a5-4a9a-e7d5-08dbf1ea0431
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 21:19:20.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUe/ZsyJPtdES/v9SDMrMSp1fTj5S51KbC+h/YdZ5XKoxh+QHeXij4JtXEoYRoYuDsq8ooggbmwnl4UnwmbgXjHoXb1kFQgvpHM9fONbRxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc: Use FAST_REQUEST for
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



On 11/30/2023 12:59 PM, Michal Wajdeczko wrote:
>
> On 16.11.2023 23:16, Daniele Ceraolo Spurio wrote:
>> We're currently sending non-blocking H2G messages using the EVENT type,
>> which suppresses all CTB protocol replies from the GuC, including the
>> failure cases. This might cause errors to slip through and manifest as
>> unexpected behavior (e.g. a context state might not be what the driver
>> thinks it is because the state change command was silently rejected by
>> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
>> type instead, which suppresses the reply only on success; this way we
>> still get the advantage of not having to wait for an ack from the GuC
>> (i.e. the H2G is still non-blocking) while still detecting errors.
>> Since we can't escalate to the caller when a non-blocking message
>> fails, we need to escalate to GT reset instead.
>>
>> Note that FAST_REQUEST failures are NOT expected and are usually a sign
>> that the H2G was either malformed or requested an illegal operation.
>>
>> v2: assign fence values to FAST_REQUEST messages, fix abi doc, use xe_gt
>> printers (Michal).
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_messages_abi.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c            | 58 ++++++++++++++++++++---
>>   2 files changed, 54 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> index 3d199016cf88..6544205cf40d 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> @@ -24,6 +24,7 @@
>>    *  |   | 30:28 | **TYPE** - message type                                      |
>>    *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
>>    *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
>> + *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                                |
> -----------------------------------------------------------------------------------------^
> is this aligned correctly ?
>
>>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
>>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
>>    *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
>> @@ -46,6 +47,7 @@
>>   #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>>   #define   GUC_HXG_TYPE_REQUEST			0u
>>   #define   GUC_HXG_TYPE_EVENT			1u
>> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>>   #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>>   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>>   #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a84e111bb36a..04e443c6fd8b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_pagefault.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_submit.h"
>> @@ -448,7 +449,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>   	} else {
>>   		cmd[1] =
>> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
>> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>>   			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>>   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>   	}
>> @@ -475,11 +476,31 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
>> + * driver, the GuC will just copy it to the reply message. Since we need to
>> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
>> + * we use one bit of the seqno as an indicator for that and a rolling counter
>> + * for the remaining 15 bits.
>> + */
>> +#define CT_SEQNO_MASK GENMASK(14, 0)
>> +#define CT_SEQNO_IS_UNTRACKED BIT(15)
>> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>> +{
>> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>> +
>> +	if (!is_g2h_fence)
>> +		seqno |= CT_SEQNO_IS_UNTRACKED;
>> +
>> +	return seqno;
>> +}
>> +
>>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   				u32 len, u32 g2h_len, u32 num_g2h,
>>   				struct g2h_fence *g2h_fence)
>>   {
>>   	struct xe_device *xe = ct_to_xe(ct);
>> +	u16 seqno;
>>   	int ret;
>>   
>>   	xe_assert(xe, !g2h_len || !g2h_fence);
>> @@ -505,7 +526,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   		if (g2h_fence_needs_alloc(g2h_fence)) {
>>   			void *ptr;
>>   
>> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
>> +			g2h_fence->seqno = next_ct_seqno(ct, true);
>>   			ptr = xa_store(&ct->fence_lookup,
>>   				       g2h_fence->seqno,
>>   				       g2h_fence, GFP_ATOMIC);
>> @@ -514,6 +535,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   				goto out;
>>   			}
>>   		}
>> +
>> +		seqno = g2h_fence->seqno;
>> +	} else {
>> +		seqno = next_ct_seqno(ct, false);
> maybe instead of calling next_ct_seqno() twice we can set it earlier as:
>
> 	seqno = next_ct_seqno(ct, !!g2h_fence);
>
> 	if (g2h_fence_needs_alloc(g2h_fence)) {
> 		g2h_fence->seqno = seqno;
> 		...
>
>>   	}
>>   
>>   	if (g2h_len)
>> @@ -523,8 +548,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   	if (unlikely(ret))
>>   		goto out_unlock;
>>   
>> -	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
>> -			!!g2h_fence);
>> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
>>   	if (unlikely(ret)) {
>>   		if (ret == -EAGAIN)
>>   			goto retry;
>> @@ -786,7 +810,8 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   
>>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   {
>> -	struct xe_device *xe = ct_to_xe(ct);
>> +	struct xe_gt *gt =  ct_to_gt(ct);
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
>>   	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
>>   	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>> @@ -794,10 +819,31 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   
>>   	lockdep_assert_held(&ct->lock);
>>   
>> +	/*
>> +	 * Fences for FAST_REQUEST messages are not tracked in ct->fence_lookup.
>> +	 * Those messages should never fail, so if we do get an error back it
>> +	 * means we're likely doing an illegal operation and the GuC is
>> +	 * rejecting it. We have no way to inform the code that submitted the
>> +	 * H2G that the message was rejected, so we need to escalate the
>> +	 * failure to trigger a reset.
> if we trigger a reset then we might lost GuC log where additional
> information about why the call was rejected could be included
>
> maybe WARN or taint will be sufficient ?

Since we don't know which message it was that failed, we don't know if 
we need to release memory in the G2H buffer and in case how much, so the 
only safe option is to do a reset and start fresh. The GuC log should be 
included as part of the error capture, like we do with i915.

>
>> +	 */
>> +	if (fence & CT_SEQNO_IS_UNTRACKED) {
>> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>> +			xe_gt_err(gt, "FAST_REQ H2G 0x%x failed! e=0x%x, h=%u\n",
> maybe add "fence" as one could interpret that hex as action code, while
> code below us using %u to print a fence
>
> 	"FAST_REQ H2G (fence %u) failed! ...
>
>> +				  fence,
>> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
>> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
>> +		else
>> +			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G 0x%x!\n",
>> +				  fence, type);
> wrong params order ?

D'oh!

>
>> +
>> +		return -EPROTO;
>> +	}
>> +
>>   	g2h_fence = xa_erase(&ct->fence_lookup, fence);
>>   	if (unlikely(!g2h_fence)) {
>>   		/* Don't tear down channel, as send could've timed out */
>> -		drm_warn(&xe->drm, "G2H fence (%u) not found!\n", fence);
>> +		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
> nit: it's a shame that we even don't try to dump unexpected messages
> (those could be legitimate but late SUCCESS, but equally could be spam
> that we will be just tracking as unknown fence
>
>>   		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> btw, I'm not sure if this is correct as we reserved different len, no?

No, when we use a g2h_fence we always reserve GUC_CTB_HXG_MSG_MAX_LEN. I 
had the same doubt when coding this and confirmed it is correct.

Daniele

>
>>   		return 0;
>>   	}

