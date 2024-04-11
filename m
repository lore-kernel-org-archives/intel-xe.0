Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F7CC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 14:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFE110E8A1;
	Thu, 11 Apr 2024 14:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUNJGsKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63A210E8A1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712847283; x=1744383283;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M3rV0j6C0pmw/Cm9oWH71tTE4VCmBc8k8e/zLtPTIiw=;
 b=dUNJGsKGImshkdbriuwt6MGoPOght8zl9VG58X4mtH7+6+QzcPq54lNX
 usGIvCVkxdd314paPvDqZlbNbp6//v1AJ8XT2QLoQTbzWAziG6dAdt8Hy
 ACmqrRA1VwEs8g1rWxAVvcMpzn2GMWBx5lEz1VVO+cUDZKoG1RUMr7O3b
 zaSdn8rHIrT2DrqjhxlXFU1ldJn0iRNyNClr+mJp6KG1ER1fmoXiknBzt
 9ARJTVWlJKES1/wh1Pqrc/oQ8gqb06Hhx/XQK1p5aNZ7H25GnJTL+ztIC
 qew74RRlsCw5rIGDr6uKzHrLGWVUFYML1DShd4ldTLHnTP0TBWVIdcRdS w==;
X-CSE-ConnectionGUID: XqvJE73pQxmFMKCN+P2w2Q==
X-CSE-MsgGUID: jfYHcsk+RAWzttLfhlhvWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19413347"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19413347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:54:43 -0700
X-CSE-ConnectionGUID: yYHdm2fgS8q9G/YeJHOwfw==
X-CSE-MsgGUID: eb3uHY4NT/+aFwdMd1UXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="58344328"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 07:54:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:54:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 07:54:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 07:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZF11aXfQwM/cwnDaDdO77LhckpqeUUdmbXWE7b/ccBGyoU44aTwXcjMJObfy/7yxmalWjYDnm231og+3okoaVf4nZHV2AUpuF98wtWgT48NRx+q+Q51K8dslvtpnOjIle9e6GRjIlWZzdAgeAucEznfltWuvQN5xOjt/zdJkyy1xvduATU6rBYDGceo0ghNZWznNuMIrq8U2yPoKNDDgwetWQ88EzeBp/W8BjmkTL2dAqJzLnQ9/xBmPwD/QVspi24u9kazD5vvQMwntj9HC/b8QirLJm3CRhOUIriwqWKCSaLTGqMD5FEjFGYxfNhT30SqMUF6pwjoYAEdf/e6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTNiUXVOkg6hVB8vLXzmI7CxocAamkha+r48tThNgJs=;
 b=IvfBiQkQchuDGWvILPt8M02AjObmOIzihSS2v348sjeu5J4WMFF/wbRcr5EkujKpTubRryMH3l1r5qiOOI16KNta7FoP+l3duVAOfSziv90gJdyYBZoLFL/qcULY17yQIjBhY3Qtw4eK3bB+rvivPyAOG41MNINY+oUnyC4rZMfHvHkqzJtjD/1ntFnM5hXjb5myqe5pLVkEFWi4XJ8lEpy1hujXbgKQ6O7iBoH+4PQb/1l/bOB9MXs1zzKmByQo39PprVxKb0gawzZsh2YeEKN8QATaY5XahuX3pdUgCK5ASzmzPqcG9ScvB4ExJ8LsgEznAZjk3nsDxySraWN95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Thu, 11 Apr 2024 14:54:40 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 14:54:33 +0000
Message-ID: <4518c95c-f447-412f-b374-8f414d4bd5e0@intel.com>
Date: Thu, 11 Apr 2024 16:54:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
 <7addaf63-6945-434f-8f9f-8341e0fafa26@intel.com>
 <17cbfe83-fa8c-4494-ac96-9ff5630c40ee@intel.com>
 <26b269d21a11e2b2b5372993416bf689ef2c9eeb.camel@intel.com>
 <b357a7f5-0124-485a-ac80-529426d450bd@linux.intel.com>
 <bad0ac3232dbc2aebfa1a5a6933167635705c63c.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <bad0ac3232dbc2aebfa1a5a6933167635705c63c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: f11541f4-e14d-472e-17bc-08dc5a374cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WhGET67fQC6yzTyd5WKwovaldV1Kb+qvzOV+2WS6ycEfvfVDRblV0xQgNJxND4poqtlZGItnyo258nAh2dIwH0dWwYJqX7g9cMSwoDbM4srgFEOPfmATDJ9izrxErlZ3F/llyl2FdS7SJB6eTG3TACmTx/4nxDnUiGoAR0LaEc0ulNE79tET96XAxg5nxgxH25NtDGT20ToL2fbw5GRFW48t/Fq+t9AYlkBoc+6kOwj4ClsnPrrNNMVpAkEQXQTAl8gocMTjNXCab2I/E3OVIHh/MswM4eSXXKfXulAj7m1wGtqQzemb+GWcXQc92eS70C+W9UtdAONBtk0qPDiKYRvkAQOClsH4Z7O9JS2U4Xoyh8f0uHibn1TEhxvgeK9oC5iI8tpbHEUVSu0OM+GRixC8zpRrTMVDZWyAXhsQnbdt5u/I18qd+bgmeT27iL5C0x8RjK6pKurTwsD6oDcDnwkvc7VsDxA74oXb2HxLwh5vRCwEdSTy4HWLDp5Aa3dqXgfBuHtpLIoX1CC1nbjwUxKkk9c2b2d40sS7GexLDccP5dL5uujydnih3LXq98bE6CAdm5iF52duZZF7VFu5WR7X3erOqd9fUpkw/cWd9+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXd0RmhrZkkzZm9GdVFnTUl0TlZ4dGUvcE9vNlhjeGM5S0tJeWFsQUh0UWh5?=
 =?utf-8?B?dUdzc1dKOTJoVHJRODhWeDNTTW9uVzE5em93TXBNZ3VINWs1eUJDZUN1YUhF?=
 =?utf-8?B?bW9SdXk2WXpScWllN1VjaFowT1RtUlBGVUFydVUzeW1haFI0bENpa0RLZzMy?=
 =?utf-8?B?dWNCSGt4c2JJQ1BvYTRndHk0OWhoUGxuWHc2cEt2dkwyR3JsNHRTUTJrbGVp?=
 =?utf-8?B?T3RMdWVPdXF6T1RZMUtONnJOK0RLaU12Z1RlRlVwcGVtNWsyYTVYYlBLcnhC?=
 =?utf-8?B?ZVNPK05aSk91Z203NU8raXZNcWxOdEd6cThDMXJrdTF0Y1pMcUZJV2hRY1JU?=
 =?utf-8?B?Nm4wZlh2SEhkUmRTVkxIS2dBaFZ0VjYzY2Nod2N6ZjR3SjRlUEN5WEc3ZzNr?=
 =?utf-8?B?akU5anNTWUtrenJITXpoS01qUUZQZnA5S2hzakNaNGFKdnlNUmZNdFo1d2JM?=
 =?utf-8?B?QXhWZnZoQmZJOS9QajI0SnB0bXUrc1VKdGVrMW9DQk9WM3dncHdJQVZ5TVIz?=
 =?utf-8?B?dTY4SlpmUnllRk5JR1ZpeTJMK3J3YTBaK1BDTUlmMEhhRE90VkVNODJMRUZa?=
 =?utf-8?B?bGt4R0ZOdjdwZWE1dmRkd3d6NGM0SXV6azczWWNkOFFLSEhDU2ExVktaYmIx?=
 =?utf-8?B?NTlCZmRFYWJYTjc2U2RqZzdiK0lmR3lzeVVYWEhLUVhpTjFURWVGZHk0S29h?=
 =?utf-8?B?emRWdzcvSElBRTlDOXZEZ2RaY0liSDNVNDN4N3VhalVzbUR1dG8zU1N5UVNo?=
 =?utf-8?B?b1M5dHVoVU9NM3JzWmVBRi85Z2RaYVgvQ0trSzUrMW9NSnV5RFk3UCsyMWhP?=
 =?utf-8?B?OFZVc2NZbHI3TnRJYXhpVjVFcUZOWHdvMEd2WG1tek93Yk1YYWQvMTJrU3c4?=
 =?utf-8?B?bTB3RFFMUjQ5WCtnWTlFOHRMb3ZyUStwQkZpRklHZitkQXd1L3RYcEhMcHJi?=
 =?utf-8?B?Wmo4Tmx2QndFM1RkVUdVYnRCU2k3eXl6SXZ1SXhCUVdJSkg1TUo2NGloeTB0?=
 =?utf-8?B?cWhmZHo0bTIrOFRxNjZpbmJWMEZaKy9pR09ad3FOQXFkYzRNdTNXckI0OGN5?=
 =?utf-8?B?UC9PMWIrOHVpRWs4SFZkQXd1S3gySDA3MjJXbmZUSnl6R0EyWW96Mm1LSkxC?=
 =?utf-8?B?S3ZGeTZCNUd5TVNxYTdCOHFsT2JTZGRYeGIrTDFUNWJwU1QzVFU1c1UxZThz?=
 =?utf-8?B?K3EydUZvSDhEZUphKzM0NHI3ajQwN0d4U1Z5bXh2VFhHT3BYd1FLcVd0YUgw?=
 =?utf-8?B?b0VYVWJpVUtPanFnaS9pNklkYW1XTVQ1ank5MUNLVTNDZHFkZW4vWFhUS0Z2?=
 =?utf-8?B?eTY4Q0sxVlhMczArUStGYmtocUQ5ZTQyN3RWNnJqQlNHYlI3NlJRQzZXTlRH?=
 =?utf-8?B?N0V4M29PNzE4aUdSS0U5NkdpSXFYbVJkTWdQNXBDT2l1Qy93R3JrVy9SVDFh?=
 =?utf-8?B?VXFTNHlYazRsS3hMYUVZb1B2NGxmVlVsWDU1cVJYdTJNQ0ppYTRKOHgvVEhi?=
 =?utf-8?B?RUUzQ1FiSnpmN0pkdW1PRkJ2Q2RCRHBZUUYyQVdtOXNLTzVMZC95bDRQVmEy?=
 =?utf-8?B?ekdXZjRadHRObi9OS2VJTmlJeDl4YlI4VnpPQ21YZGlFOVVsTmEzdDI1Y2NO?=
 =?utf-8?B?SU9pTFRFMjdZVjRYWkJrQVFTYkNxcWhRaFRtWGdvU0svZ05WRlAxYjdLcnZF?=
 =?utf-8?B?VGlqOGZnejQzc041WXpYN0IvNXpZQjZKbGgvWk95c1RvSk5oNTg4UXlhYkk1?=
 =?utf-8?B?RHgzWnVmd0lRZk10V1NFck41Ym9sMk42c09DYzVUb1hmeTZNRFRJVUNpUVh0?=
 =?utf-8?B?L2FBOXJ1bUpvamRXeFg5R2t1S0l3ZjR0bXRKZXRicHBJc2xhU1RuaHloWEs2?=
 =?utf-8?B?ai9YVXU3a1RWV2luUHlKU1JJN0t0Z20wNnNJeFgySW5yNzQyQmhSOEpqVWJh?=
 =?utf-8?B?YjhEU0JuMzhhNUQ3M0JSQkc1cERaSjZTaEExVERnOFEwSkp2SUNDL0JMRURp?=
 =?utf-8?B?WlFVNk5najBmKzhjUmpMeFRYRVptVVRubDJIaGkxMzd0dzR5ZjJzTHZBV3RK?=
 =?utf-8?B?U0lUb3QvN2tmVjg2cmJvQjhpbXh1QjhXUVJtbjQ5STh0aTJrb292dDZqNSs1?=
 =?utf-8?Q?eeLGdJYqc96+LFLu+mJpD/oGu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11541f4-e14d-472e-17bc-08dc5a374cae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 14:54:33.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTPzSCDnZm192R3ysujBJl1cSLdea8Js4246KhfKQQzgcD8O2W8nNGrHC1s861u3gSDUcHHdeFfHc4kDDA2G1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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

Hi Jose,

On 4/11/2024 4:40 PM, Souza, Jose wrote:
> On Thu, 2024-04-11 at 16:32 +0200, Nirmoy Das wrote:
>> Hi Jose,
>>
>> On 4/11/2024 4:07 PM, Souza, Jose wrote:
>>> On Thu, 2024-04-11 at 17:00 +0300, Lionel Landwerlin wrote:
>>>> On 11/04/2024 16:42, Nirmoy Das wrote:
>>>>> Hi Lionel,
>>>>>
>>>>> On 4/11/2024 3:14 PM, Lionel Landwerlin wrote:
>>>>>> On 10/04/2024 20:03, Nirmoy Das wrote:
>>>>>>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>>>>>>
>>>>>>> Given that simultaneous usage of device atomics and CPU atomics on
>>>>>>> the same SMEM buffer is not guaranteed to function without migration,
>>>>>>> and UMD expects no migration for SMEM-only buffer objects, so this
>>>>>>> provide
>>>>>>> a way to set device atomics when UMD is certain to use the buffer only
>>>>>>> for device atomics.
>>>>>>>
>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>>>>>>     drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>>>>>>     include/uapi/drm/xe_drm.h        |  9 +++++----
>>>>>>>     3 files changed, 32 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>> index 8f3474c5f480..530b4bbc186c 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>>>>>>     #define VMA_CREATE_FLAG_READ_ONLY    BIT(0)
>>>>>>>     #define VMA_CREATE_FLAG_IS_NULL        BIT(1)
>>>>>>>     #define VMA_CREATE_FLAG_DUMPABLE    BIT(2)
>>>>>>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS    BIT(3)
>>>>>>>       static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>>>>                         struct xe_bo *bo,
>>>>>>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>>>>>>> *vm,
>>>>>>>         bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>>>>>>         bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>>>>>         bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>>>>>>> +    bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>>>>>           xe_assert(vm->xe, start < end);
>>>>>>>         xe_assert(vm->xe, end < vm->size);
>>>>>>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>>>>>>> *vm,
>>>>>>>             xe_bo_assert_held(bo);
>>>>>>>               if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>>>>>>> -            !IS_DGFX(vm->xe))
>>>>>>> +            !IS_DGFX(vm->xe) || enable_atomics)
>>>>>>>                 vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>>>>               vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>>>>>>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>>>> struct xe_bo *bo,
>>>>>>>                operation, (ULL)addr, (ULL)range,
>>>>>>>                (ULL)bo_offset_or_userptr);
>>>>>>>     +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>>>>>> +        (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>>>>>>> +        drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is
>>>>>>> not supported for this platform");
>>>>>>> +        return ERR_PTR(-EINVAL);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>>>>>> +        !xe_bo_has_single_placement(bo))
>>>>>>> +        drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS
>>>>>>> can be only set if the BO has single placement");
>>>>>>> +        return ERR_PTR(-EINVAL);
>>>>>>> +    }
>>>>>>> +
>>>>>>>         switch (operation) {
>>>>>>>         case DRM_XE_VM_BIND_OP_MAP:
>>>>>>>         case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>>>>>>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>>>> struct xe_bo *bo,
>>>>>>>             if (__op->op == DRM_GPUVA_OP_MAP) {
>>>>>>>                 op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>>>>>>                 op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>>>>>>> +            op->map.enable_device_atomics = flags &
>>>>>>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>>>>>>                 op->map.pat_index = pat_index;
>>>>>>>             } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>>>>>>                 op->prefetch.region = prefetch_region;
>>>>>>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>>                     VMA_CREATE_FLAG_IS_NULL : 0;
>>>>>>>                 flags |= op->map.dumpable ?
>>>>>>>                     VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>>>> +            flags |= op->map.enable_device_atomics ?
>>>>>>> +                VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>>>>                   vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>>>>>>                           flags);
>>>>>>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>>                     flags |= op->base.remap.unmap->va->flags &
>>>>>>>                         XE_VMA_DUMPABLE ?
>>>>>>>                         VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>>>> +                flags |= op->base.remap.unmap->va->flags ?
>>>>>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>>>>                       vma = new_vma(vm, op->base.remap.prev,
>>>>>>>                               old->pat_index, flags);
>>>>>>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>>                     flags |= op->base.remap.unmap->va->flags &
>>>>>>>                         XE_VMA_DUMPABLE ?
>>>>>>>                         VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>>>> +                flags |= op->base.remap.unmap->va->flags ?
>>>>>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>>>> +
>>>>>>>                       vma = new_vma(vm, op->base.remap.next,
>>>>>>>                               old->pat_index, flags);
>>>>>>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct
>>>>>>> xe_vm *vm,
>>>>>>>         (DRM_XE_VM_BIND_FLAG_READONLY | \
>>>>>>>          DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>>>>>>          DRM_XE_VM_BIND_FLAG_NULL | \
>>>>>>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>>>>>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>>>>>> +     DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>>>>>>     #define XE_64K_PAGE_MASK 0xffffull
>>>>>>>     #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>>>>>>     diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>> index badf3945083d..7b9c68909c78 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>>>>>>         bool dumpable;
>>>>>>>         /** @pat_index: The pat index to use for this operation. */
>>>>>>>         u16 pat_index;
>>>>>>> +    /** @enable_device_atomics: Whether the VMA will allow device
>>>>>>> atomics */
>>>>>>> +    bool enable_device_atomics;
>>>>>>>     };
>>>>>>>       /** struct xe_vma_op_remap - VMA remap operation */
>>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>>> index 1446c3bae515..bffe8b1c040c 100644
>>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>>>>>>         /** @op: Bind operation to perform */
>>>>>>>         __u32 op;
>>>>>>>     -#define DRM_XE_VM_BIND_FLAG_READONLY    (1 << 0)
>>>>>>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>>>>>>> -#define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>>>>>>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>>>>>>> +#define DRM_XE_VM_BIND_FLAG_READONLY        (1 << 0)
>>>>>>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE        (1 << 1)
>>>>>>> +#define DRM_XE_VM_BIND_FLAG_NULL        (1 << 2)
>>>>>>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE        (1 << 3)
>>>>>> We should probably document that it's an error to add this flag if
>>>>>> the BO has a single memory region.
>>>>> It is an error if this flag is set on non single memory region as
>>>>> atomics on SMEM+LMEM  buffer will be handled with migration.
>>>>>
>>>>> Let me know if I got that wrong.
>>>>>
>>>>>> Are we supposed to the ability to set that flag or is there going to
>>>>>> be a query?
>>>>>>
>>>>>> A query might make sense since it's going to be rejected for some
>>>>>> platform.
>>>>> Can we use the rejection as a query ? I am using it in a IGT test
>>>>> https://patchwork.freedesktop.org/patch/588759/?series=132289&rev=1
>>>>>
>>>>>
>>> That was not acceptable for DRM_XE_VM_BIND_FLAG_DUMPABLE. At the end we were able to land DRM_XE_VM_BIND_FLAG_DUMPABLE in Linux 6.8 so we did not
>>> needed the query. But for this one will be needed.
>> If the rejection can't work as query, I can add one.  Would
>> adding(DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM) a new flag into
>> 'struct drm_xe_query_config'  work ?
> As another bit after DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM?
Yes.
>   That lgtm but even better would be add a new category like
> DRM_XE_QUERY_CONFIG_SUPPORTED_FEATURES and then DRM_XE_QUERY_CONFIG_SUPPORTED_FEATURES_ATOMIC_ON_SMEM (1 << 0).
> So we have a u64 just to check for features supported by different KMD versions.
>
> But ask the opinion of other engineers in Xe chat.

Done. Let's see what others prefer.


Thanks,

Nirmoy

>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>>>> Regards,
>>>>>
>>>>> Nirmoy
>>>> Okay, sounds doable.
>>>>
>>>> Will try to put up an MR for Mesa soon.
>>>>
>>>>
>>>> -Lionel
>>>>
>>>>
>>>>>> -Lionel
>>>>>>
>>>>>>
>>>>>>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS    (1 << 4)
>>>>>>>         /** @flags: Bind flags */
>>>>>>>         __u32 flags;
