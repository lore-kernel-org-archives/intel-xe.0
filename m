Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B055CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 06:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3976110E2DE;
	Fri,  5 Apr 2024 06:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbdp4hiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328AE10E2DE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712297582; x=1743833582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JwAiGp+vlaoAHxMsI0yDauyGnlamX/k7XccPFgQdZl8=;
 b=cbdp4hiLEs9O6TSOA3TSsBcCJiU5COluq48qXGMz8C6pnhwg3hjyJh8+
 BPIYM7fTltnj6+UScLAuDiYTbklUE2m9aqjH8z+1MPqaiQiRZCmxqMTTb
 F5DtAZ03VgfDwO+2GtzDEMDP3D3jS5he1m/i36o4ErnFwgT2AmyzkiuwZ
 EbUF1PnLhLoLXDcPchLbjZFEPlpzNdrbtD59GEbaYvtLF5tDqd/skWTfT
 fyJ3SspzmWMGXocsW4A9xBI813FUsH7/o2xD2pHLwQyyHsM9AWTK86RjP
 bcyaqERD3diFEu7BAOBX6bKFkFeaERdfaSIxFXqNlVUt8wgBabZAK7NCz A==;
X-CSE-ConnectionGUID: oCrHdF/ZQJ2sUZS1K/G3LQ==
X-CSE-MsgGUID: 5TFG9wtVSy2qewg5+xpmlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7801137"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="7801137"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:13:01 -0700
X-CSE-ConnectionGUID: 43wsmFi5QQil53+pVflvSg==
X-CSE-MsgGUID: u5oN6a5eTfCn6eY4avKvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="50303043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 23:13:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 23:13:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 23:13:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 23:13:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 23:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7pEH/gRFuQaXUD0daZZEa0Vpxicp+/gMMx5ztw24WedQjwp6uMvqGB+DJzriC3OI85JdNblxVjNAQU+xyRCFJcY2FvLMWNK4RnlirgMCgtQwt1oZDAglgWvci3WuwN3+XyOFsFsNlB1Dsljd81JPmM5ed4R8s1jyQ/BKYmVs8Fa/TG1rG+UXe2CegQPPm2lRexYy+GX9ml19n+ukgCpjjwSe2rU39U8HD5pkJb2jTBCy3IXo+bYEsgTuf8fkN5mqZB0YooVBnZ7dcAFJWkGahgdo5ZKct7OMnpqnzk8TaO8P7tPN5b1oIDqfRSYePoTG3ATuOPl8XY1Syj/4raE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c4nx46/gxy9fkBuot8hkBk+ZmUhzACS1XkM6+I1CNw=;
 b=TtidJoa56tQ81FBFzjON8Xq3iDg31fthQI5h09blRJdkVgL+NHrCJOEouTaFWx8I+DaIjjvO2NLiQckQugVOTh8myojErpzIqH+UNFeBhd/j2tP6QdYkzgLsbnoEIGrsm0gI7vO0Y/rY+lLdtTkKxTq1dgjQA++HIMMUX5Sihn5rsadGe7kKCOyWa8Fath+KWEHElmnDQT/xdQVJufmWYAxQCCRsdVFbKaEInlSxqJ4jippofpt3YRv9mbWu617i9jd0OuqjuX2uqtL74VNsfjJiL3ZhLaDiLw/tUfxLP4p/bpV6eYyv3HTVkcnpOXqAGa4bq1GLLzY0JLopO/EdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8043.namprd11.prod.outlook.com (2603:10b6:806:2ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 5 Apr
 2024 06:12:52 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 06:12:52 +0000
Content-Type: multipart/alternative;
 boundary="------------v1v9WcI9mSMgcaj0oXMcw7rc"
Message-ID: <1b73dc81-01f2-4aa6-a13b-f3f890b35d42@intel.com>
Date: Fri, 5 Apr 2024 11:42:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Introduce helper to populate userptr
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>, Niranjana
 Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>, Brian Welty
 <brian.welty@intel.com>
References: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
 <20240404061631.4150858-2-himal.prasad.ghimiray@intel.com>
 <Zg9O6zO/7R2edQ+I@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zg9O6zO/7R2edQ+I@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BM1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::22) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB8043:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8e0Ihdd4IGB/M/wsrkqC9tuLdfOH4dq7cKy8+YUPugTpWDvQ+V56d0RCxMWBhqilB18oAipyr8h2HAZst8JxAWiL748UTsHiWEzCFnAax4wGuXKfsdrI0EP6gRZV383/1UGuln6ZJdHwPzq8etwfmSop+I3pOqXBfqntztlvD7Xu9sFnNf0ggmBo5nCIT2R41xRiBBq9w6Y5e2ep2Ux7b0BV00Mwb7bfVk9+b1MrU15u2Lf6EPTx+VGn3H6fzuRGSZKc683FypA5B1kY1lINagv4hhVSXkTYqq4ytgE5e9MJbgaRgUKMfpAvU8QAx0sJTNCTd4g+CSfpMgxKgqbNdSy1zGyPmTkJL/77fnA0aR7KwwdQ4WrjmOzNQt7JO7OVsmCHICf86Es1pespnrBCS/eUy3RCGBET8wzX6oq9YfNZG1ZsnPLIHgP8KmMJB61e+n5ovgXJfeWNayQYoyPF8KxLTJpn60DLP+x7rJT0BFWxptxsuKX+mjGaq5gIpqvcqUsVNUHzoENfJgtcXh69aBvQU5TmJaqtjHo5J+FELuHfV20N98SiwKQre/4y9pGJkOKJSTmKjKLLq65PnGHZOx3LcSeqou88QT31RQ1xPwadegkZAp7JMi7f1aSWIfji1Jxz7B8Guw9Td4pWjvOAhQ3gDApN6sPQVrGVZ7yWDzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZEUnJjUTNpanluSC9FSHJ2VmlLQnQwV083ZGhlaU16aWRLdkZKaUR0c3B3?=
 =?utf-8?B?TjFub1plVDlTS2I5cXU3VDFOT29xTlh2Vy9vVDFGem1WMUU2SnI3THhWaS9K?=
 =?utf-8?B?aXQwZmEwK0VUbGVHOG4wNm1WNEhMYlpVZWNENUZBSS92Qmx4dVZmU3c4S2xy?=
 =?utf-8?B?WTFrcGlmRHh3VFRrT0c5eVBNYnk4ejdIUXJqR1owTEhJeEVJNG8wWmJTeFha?=
 =?utf-8?B?MDhuODdldmw0RUhudVJPaGFDUjJoY2I5S3JyZ21manBubXZxY3NOQmpvNFRj?=
 =?utf-8?B?WjlVSENrRmgyUGsrV3BxNXlxbFJTTitrTzJLMVBQN2NuUnQ4ZG5RZDlPQjBx?=
 =?utf-8?B?UWlFQVhwNTVFQWJOc2lDeGRENzcvbDVPRHNBekNTSSt1V25tVnhDaFJadjZz?=
 =?utf-8?B?cldrcmgxemlPd3FQZDVLenhPNnZieG83bU1QdEVlRGRDcHcwWW9zRk1KWUg1?=
 =?utf-8?B?WVc1Nm1qdHRVVUNXayt2Z1ZOcEFpSVR6VG52cHZYZHgrZDlZTmZ2NDBFNUlt?=
 =?utf-8?B?S0d3ZnBydURoc1dOaFBjOVJUaWsyd0VxUzE5WnFFTmRobTI1RXl2QStOaGpt?=
 =?utf-8?B?dWtQNWxyVXFGWERsaUIvekc4VUFDWmdzd0V1K2RGWDRaVm5GNzlKb0dHaXhp?=
 =?utf-8?B?KzBJWmo3UkJZNE1qOU9yV0RncWlZdy85NittYVR1Q2ZxaFhiTHZrcncrTGxk?=
 =?utf-8?B?YVA0MmJtMFRGYi9FUyswV1F2QktPK1JvSEUzbE5RcTI0ZWZ2dCtsMmdIMzhp?=
 =?utf-8?B?azlmSHhMSXd2ZG9zZzNIWDVDd3NraTJKUFA2VHJhTUk2d3Z0bUFndDhUU3Rj?=
 =?utf-8?B?UFFBR0NSZ0xIQUcxdFlkN3d6UmVDcnYweml6SVhpTWJNa3duU1pPUzQzaDhl?=
 =?utf-8?B?YzdIZ1VrOWRKVlJ4UXh3dXNjbUtUT0NIZjY1QUpSSTVZUzFzbW54eHlwQmtW?=
 =?utf-8?B?VHJrcEdITWhwMEZqYXJUMWpzTVJTNFcxVW1UY0taWDZTS3ZEZzVmTWtFSzVL?=
 =?utf-8?B?VU11OHg1VDkrbUdNdjd2T21ySDBCZ1ZhNFEzU1g4a0dQVkRNY1VXT2RXYmI0?=
 =?utf-8?B?YU53bWpJU2NiZGtlWUNRdmxDK1pMZllkOW5NRE01Q05BZGxvR25CMmozOEVy?=
 =?utf-8?B?dWptSVNRWXVmakc3OHBBRXFXVDZGT1FCQzlYL01CcUNjbkVrRFN0SXFyMytm?=
 =?utf-8?B?TGJPT0s3bms5UXdiYUNYTVBxa3VocWlYZllvQlRQMm5xS2JaYjhzZU83b1RQ?=
 =?utf-8?B?RzhFc1NsbGZhK2dNRTNBcGw1L0pQQlYycnNHdFBNQmNaQU15Sit2STJWVi9K?=
 =?utf-8?B?UnhsSG5oaDVDRzJ5b0VnVWZ3TThjRTBXaDRIWTlxVDBmM21iTm9YL085N09T?=
 =?utf-8?B?Sks2QXlRVFR3LzdnVXJtVnFsNVkzYmw4aUVXWTQwc0huSUV4ZEszSG1wQVlU?=
 =?utf-8?B?WTIzbk5FQjVNcFZCVXVNNjdOcmE1eXBVQTFRSDdTVm9nWXZVN083Q21NWE15?=
 =?utf-8?B?VXN6dHFGcUFzNGhiWWtFWm5sMCtQMGZCVFl2WkhhU2pIekVWbXFsa0hvS3JJ?=
 =?utf-8?B?RlhYMkdzdTdTVzR4QVJCU0xSZzZJZ1FOekdmQ1UwY1ExNGxQVVBoRG15MFhw?=
 =?utf-8?B?VFZWUUpZcHVDK2c1MjF3dGt5YjRPOHljcWJPWFhrV0dkZFVUK0w2dUtqUHJr?=
 =?utf-8?B?T3JPYzlHWUlMSmJsTCtPeUVPVlMyTkljUC9ISjJ3N2I4OU8xaC9meHFGV1cr?=
 =?utf-8?B?a0RsZVBqVW9tTUtPLzlkTnR0OGwvVDYvd2trbTJvVFV6YVlKckNpT1c3VVBa?=
 =?utf-8?B?YWhDOS9oL1Zpd1dGWDNoOGpFWmxsUk1yZVIzWjRETkF1TVMwQzA1NmI4QUoy?=
 =?utf-8?B?K0ZBbXFKOXBtZ3kvRjdyWGZGOHZnQStxYi82VDgwZmpPNHlKNGxhMkRsdzBv?=
 =?utf-8?B?OFljeVo4d29lMzZDajlIL0JSNU5TNjYwcG1FTGtEMjhlbkZrT0FyWTJ1SnZK?=
 =?utf-8?B?V2EwTVlvdTJXKzZicEN3TGNzUDdJQWdjMklveHVTNjBFb09Pc3FGR0Z6SlZB?=
 =?utf-8?B?OUFXZWZiZWJwNysvT2ZmQ1BLMW1rQkVHSGUwVnRkV3plOXh5TVIvUHZWS1ZO?=
 =?utf-8?B?SmZZTHJzNlFwZ201VTVhZTlOeElMY09pZFczMERtemFCSWdSaWdaRVpUY3Vl?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60de0604-16de-47d5-b179-08dc55376d27
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 06:12:52.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g9xQ7goNaiHbSBY5BjFAH2RoWugfbtQX73WkTuDoNfV+xDs0wZ/pfUCMX9TK2e9bMiyy/zK4nLUjl9FySl32oDbm0rk1VMTrNZ3EFn2Ycw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8043
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

--------------v1v9WcI9mSMgcaj0oXMcw7rc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-04-2024 06:37, Matthew Brost wrote:
> On Thu, Apr 04, 2024 at 11:46:30AM +0530, Himal Prasad Ghimiray wrote:
>> From: Oak Zeng<oak.zeng@intel.com>
>>
>> Introduce a helper function xe_userptr_populate_range to populate
>> a a userptr range. This functions calls hmm_range_fault to read
>> CPU page tables and populate all pfns/pages of this virtual address
>> range.
>>
>> If the populated page is system memory page, dma-mapping is performed
>> to get a dma-address which can be used later for GPU to access pages.
>>
>> If the populated page is device private page, we calculate the dpa (
>> device physical address) of the page. This will be handled in future
>> patches.
>>
>> The dma-address or dpa is then saved in userptr's sg table. This is
>> prepare work to replace the get_user_pages_fast code in userptr code
>> path.
>>
>> v1: Address review comments:
>>      separate a npage_in_range function (Matt)
>>      reparameterize function xe_userptr_populate_range function (Matt)
>>      move mmu_interval_read_begin() call into while loop (Thomas)
>>      s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>>      use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>>      move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
>> v2: Remove device private page support. Only support system
>>      pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
>> v3: Address review comments:
>>      Squash patch "drm/xe: Introduce a helper to free sg table" to current
>>      patch (Matt)
>>      start and end addresses are already page aligned (Matt)
>>      Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
>>      non system allocator call. (Matt)
>>      Drop kthread_use_mm and kthread_unuse_mm. (Matt)
>>      No need of kernel-doc for static functions.(Matt)
>>      Modify function names. (Matt)
>>      Free sgtable incase of dma_map_sgtable failure.(Matt)
>>      Modify loop for hmm_range_fault.(Matt)
>>
>> Signed-off-by: Oak Zeng<oak.zeng@intel.com>
>> Co-developed-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@intel.com>
>> Cc: Brian Welty<brian.welty@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig  |   1 +
>>   drivers/gpu/drm/xe/Makefile |   2 +
>>   drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hmm.h |  18 +++
>>   4 files changed, 274 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 1a556d087e63..449a1ecbc92a 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -41,6 +41,7 @@ config DRM_XE
>>   	select MMU_NOTIFIER
>>   	select WANT_DEV_COREDUMP
>>   	select AUXILIARY_BUS
>> +	select HMM_MIRROR
>>   	help
>>   	  Experimental driver for Intel Xe series GPUs
>>   
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 21316ee47026..07031b5ba977 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -146,6 +146,8 @@ xe-y += xe_bb.o \
>>   	xe_wa.o \
>>   	xe_wopcm.o
>>   
>> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>> +
>>   # graphics hardware monitoring (HWMON) support
>>   xe-$(CONFIG_HWMON) += xe_hwmon.o
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
>> new file mode 100644
>> index 000000000000..d7a11896ad72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hmm.c
>> @@ -0,0 +1,253 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/scatterlist.h>
>> +#include <linux/mmu_notifier.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/memremap.h>
>> +#include <linux/swap.h>
>> +#include <linux/hmm.h>
>> +#include <linux/mm.h>
>> +#include "xe_hmm.h"
>> +#include "xe_vm.h"
>> +#include "xe_bo.h"
>> +
>> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
>> +{
>> +	return (end - start) >> PAGE_SHIFT;
>> +}
>> +
>> +/*
>> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
>> + * have such information for memory eviction or write back to
>> + * hard disk
>> + *
>> + * @range: the range to mark
>> + * @write: if write to this range, we mark pages in this range
>> + * as dirty
>> + */
>> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>> +{
>> +	struct page *page;
>> +	u64 i, npages;
>> +
>> +	npages = xe_npages_in_range(range->start, range->end);
>> +	for (i = 0; i < npages; i++) {
>> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
>> +		if (write)
>> +			set_page_dirty_lock(page);
>> +
>> +		mark_page_accessed(page);
>> +	}
>> +}
>> +
>> +/*
>> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>> + * and will be used to program GPU page table later.
>> + *
>> + * @xe: the xe device who will access the dma-address in sg table
>> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>> + * has the pfn numbers of pages that back up this hmm address range.
>> + * @st: pointer to the sg table.
>> + * @write: whether we write to this range. This decides dma map direction
>> + * for system pages. If write we map it bi-diretional; otherwise
>> + * DMA_TO_DEVICE
>> + *
>> + * All the contiguous pfns will be collapsed into one entry in
>> + * the scatter gather table. This is for the purpose of efficiently
>> + * programming GPU page table.
>> + *
>> + * The dma_address in the sg table will later be used by GPU to
>> + * access memory. So if the memory is system memory, we need to
>> + * do a dma-mapping so it can be accessed by GPU/DMA.
>> + *
>> + * FIXME: This function currently only support pages in system
>> + * memory. If the memory is GPU local memory (of the GPU who
>> + * is going to access memory), we need gpu dpa (device physical
>> + * address), and there is no need of dma-mapping. This is TBD.
>> + *
>> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
>> + * memory. Add this when you support p2p
>> + *
>> + * This function allocates the storage of the sg table. It is
>> + * caller's responsibility to free it calling sg_free_table.
>> + *
>> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
>> + */
>> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>> +		       struct sg_table *st, bool write)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct page **pages;
>> +	u64 i, npages;
>> +	int ret;
>> +
>> +	npages = xe_npages_in_range(range->start, range->end);
>> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
>> +	if (!pages)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < npages; i++) {
>> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
>> +		xe_assert(xe, !is_device_private_page(pages[i]));
>> +	}
>> +
>> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
>> +						xe_sg_segment_size(dev), GFP_KERNEL);
>> +	if (ret)
>> +		goto free_pages;
>> +
>> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
>> +			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
>> +	if (ret) {
>> +		sg_free_table(st);
>> +		st = NULL;
>> +	}
>> +
>> +free_pages:
>> +	kvfree(pages);
>> +	return ret;
>> +}
>> +
>> +/*
>> + * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
>> + *
>> + * @uvma: the userptr vma which hold the scatter gather table
>> + *
>> + * With function xe_userptr_populate_range, we allocate storage of
>> + * the userptr sg table. This is a helper function to free this
>> + * sg table, and dma unmap the address in the table.
>> + */
>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
>> +{
>> +	struct xe_userptr *userptr = &uvma->userptr;
>> +	struct xe_vma *vma = &uvma->vma;
>> +	bool write = !xe_vma_read_only(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_device *xe = vm->xe;
>> +	struct device *dev = xe->drm.dev;
>> +
>> +	xe_assert(xe, userptr->sg);
>> +	dma_unmap_sgtable(dev, userptr->sg,
>> +			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
>> +
>> +	sg_free_table(userptr->sg);
>> +	userptr->sg = NULL;
>> +}
>> +
>> +/**
>> + * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
>> + * address range
>> + *
>> + * @uvma: userptr vma which has information of the range to populate.
>> + * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
>> + *
>> + * This function populate the physical pages of a virtual
>> + * address range. The populated physical pages is saved in
>> + * userptr's sg table. It is similar to get_user_pages but call
>> + * hmm_range_fault.
>> + *
>> + * This function also read mmu notifier sequence # (
>> + * mmu_interval_read_begin), for the purpose of later
>> + * comparison (through mmu_interval_read_retry).
>> + *
>> + * This must be called with mmap read or write lock held.
>> + *
>> + * This function allocates the storage of the userptr sg table.
>> + * It is caller's responsibility to free it calling sg_free_table.
>> + *
>> + * returns: 0 for succuss; negative error no on failure
>> + */
>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
>> +				  bool is_mm_mmap_locked)
>> +{
>> +	unsigned long timeout =
>> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
>> +	struct xe_userptr *userptr;
>> +	struct xe_vma *vma = &uvma->vma;
>> +	u64 start = xe_vma_userptr(vma);
>> +	u64 end = start + xe_vma_size(vma);
> Nit: xe_vma_end
Sure. Will address in next patch.
>
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct hmm_range hmm_range;
>> +	bool write = !xe_vma_read_only(vma);
>> +	unsigned long notifier_seq;
>> +	u64 npages;
>> +	int ret;
>> +
>> +	userptr = &uvma->userptr;
>> +
>> +	if (is_mm_mmap_locked)
>> +		mmap_assert_locked(userptr->notifier.mm);
>> +
>> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> +		return 0;
>> +
>> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> +	if (notifier_seq == userptr->notifier_seq)
>> +		return 0;
>> +
>> +	if (userptr->sg)
>> +		xe_hmm_userptr_free_sg(uvma);
>> +
>> +	npages = xe_npages_in_range(start, end);
>> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>> +	if (unlikely(!pfns))
>> +		return -ENOMEM;
>> +
>> +	if (write)
>> +		flags |= HMM_PFN_REQ_WRITE;
>> +
>> +	if (!mmget_not_zero(userptr->notifier.mm)) {
>> +		ret = -EFAULT;
>> +		goto free_pfns;
>> +	}
>> +
>> +	hmm_range.default_flags = flags;
>> +	hmm_range.hmm_pfns = pfns;
>> +	hmm_range.notifier = &userptr->notifier;
>> +	hmm_range.start = start;
>> +	hmm_range.end = end;
>> +	hmm_range.dev_private_owner = vm->xe;
>> +
>> +	while (true) {
>> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> Nit: This could be set above in this code:
>
> 	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> 	if (notifier_seq == userptr->notifier_seq)
> 		return 0;
>   
> i.e. drop local notifier_seq and set hmm_range.notifier_seq...
>
> Then reset before continue in the if (ret == -EBUSY) function.
I chose to retain |*mmu_interval_read_begin*| before |hmm_range_fault| 
because I anticipated a scenario where the notifier sequence might be 
invalid  between the initial call and just before |hmm_range_fault|. In 
such a case, |hmm_range_fault| would return EBUSY, requiring us to 
unlock the mmap_lock, use a |time_after| routine, lock again, and call 
|hmm_range_fault| once more.

However, by utilizing |mmu_interval_read_begin| before 
|hmm_range_fault|, we might avoid this issue. Any change in sequence 
between the initial call and this point wouldn't impact the process. 
Even if there's no change in sequence, we're only making an extra call 
to |mmu_interval_read_begin|.

Both approaches seem to work, but if you believe my concern about 
changes in the notifier sequence is unfounded, I will proceed with the 
suggested changes.

>
>> +
>> +		if (!is_mm_mmap_locked)
>> +			mmap_read_lock(userptr->notifier.mm);
>> +
>> +		ret = hmm_range_fault(&hmm_range);
>> +
>> +		if (!is_mm_mmap_locked)
>> +			mmap_read_unlock(userptr->notifier.mm);
>> +
>> +		if (ret == -EBUSY) {
>> +			if (time_after(jiffies, timeout))
>> +				break;
>> +
>> +			continue;
>> +		}
>> +		break;
>> +	}
>> +
>> +	mmput(userptr->notifier.mm);
>> +
>> +	if (ret)
>> +		goto free_pfns;
>> +
>> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
>> +	if (ret)
>> +		goto free_pfns;
>> +
>> +	xe_mark_range_accessed(&hmm_range, write);
>> +	userptr->sg = &userptr->sgt;
>> +	userptr->notifier_seq = hmm_range.notifier_seq;
>> +
>> +free_pfns:
>> +	kvfree(pfns);
>> +	return ret;
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
>> new file mode 100644
>> index 000000000000..40250e3f84d1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hmm.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT
>> + *
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_userptr_vma;
>> +
>> +#if IS_ENABLED(CONFIG_HMM_MIRROR)
>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
>> +#else
>> +static inline int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked)
>> +{
>> +	return -ENODEV;
>> +}
>> +#endif
> Mentioned that I don't think is needed in last rev as our driver require
> CONFIG_HMM_MIRROR to be built.

I noticed some KUnit failures in earlier patches, so I opted not to 
remove it. The KUnit configuration file doesn't include the HMM_MIRROR 
config. If we want to remove this we need to modify the KUnit configs to 
include this config, as it is essential for our driver.

Please confirm it is OK to add the config to kunit configuration file ?

>
> Matt
>
>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
>> -- 
>> 2.25.1
>>
--------------v1v9WcI9mSMgcaj0oXMcw7rc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 05-04-2024 06:37, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.fm=
.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Apr 04, 2024 at 11:46:=
30AM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Oak Zeng <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:oak.zeng@intel.com">&lt;oak.zeng@intel=
.com&gt;</a>

Introduce a helper function xe_userptr_populate_range to populate
a a userptr range. This functions calls hmm_range_fault to read
CPU page tables and populate all pfns/pages of this virtual address
range.

If the populated page is system memory page, dma-mapping is performed
to get a dma-address which can be used later for GPU to access pages.

If the populated page is device private page, we calculate the dpa (
device physical address) of the page. This will be handled in future
patches.

The dma-address or dpa is then saved in userptr's sg table. This is
prepare work to replace the get_user_pages_fast code in userptr code
path.

v1: Address review comments:
    separate a npage_in_range function (Matt)
    reparameterize function xe_userptr_populate_range function (Matt)
    move mmu_interval_read_begin() call into while loop (Thomas)
    s/mark_range_accessed/xe_mark_range_accessed (Thomas)
    use set_page_dirty_lock (vs set_page_dirty) (Thomas)
    move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
v2: Remove device private page support. Only support system
    pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
v3: Address review comments:
    Squash patch &quot;drm/xe: Introduce a helper to free sg table&quot; to=
 current
    patch (Matt)
    start and end addresses are already page aligned (Matt)
    Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
    non system allocator call. (Matt)
    Drop kthread_use_mm and kthread_unuse_mm. (Matt)
    No need of kernel-doc for static functions.(Matt)
    Modify function names. (Matt)
    Free sgtable incase of dma_map_sgtable failure.(Matt)
    Modify loop for hmm_range_fault.(Matt)

Signed-off-by: Oak Zeng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:o=
ak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>
Co-developed-by: Niranjana Vishwanathapura <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwa=
nathapura@intel.com&gt;</a>
Signed-off-by: Niranjana Vishwanathapura <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwana=
thapura@intel.com&gt;</a>
Cc: Matthew Brost <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew=
.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellstr=C3=B6m <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:thomas.hellstrom@intel.com">&lt;thomas.hellstrom@intel.com&gt;</a>
Cc: Brian Welty <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:brian.wel=
ty@intel.com">&lt;brian.welty@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@inte=
l.com&gt;</a>
---
 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  18 +++
 4 files changed, 274 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..449a1ecbc92a 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -41,6 +41,7 @@ config DRM_XE
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
+	select HMM_MIRROR
 	help
 	  Experimental driver for Intel Xe series GPUs
=20
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 21316ee47026..07031b5ba977 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -146,6 +146,8 @@ xe-y +=3D xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
=20
+xe-$(CONFIG_HMM_MIRROR) +=3D xe_hmm.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
=20
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
new file mode 100644
index 000000000000..d7a11896ad72
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2024 Intel Corporation
+ */
+
+#include &lt;linux/scatterlist.h&gt;
+#include &lt;linux/mmu_notifier.h&gt;
+#include &lt;linux/dma-mapping.h&gt;
+#include &lt;linux/memremap.h&gt;
+#include &lt;linux/swap.h&gt;
+#include &lt;linux/hmm.h&gt;
+#include &lt;linux/mm.h&gt;
+#include &quot;xe_hmm.h&quot;
+#include &quot;xe_vm.h&quot;
+#include &quot;xe_bo.h&quot;
+
+static u64 xe_npages_in_range(unsigned long start, unsigned long end)
+{
+	return (end - start) &gt;&gt; PAGE_SHIFT;
+}
+
+/*
+ * xe_mark_range_accessed() - mark a range is accessed, so core mm
+ * have such information for memory eviction or write back to
+ * hard disk
+ *
+ * @range: the range to mark
+ * @write: if write to this range, we mark pages in this range
+ * as dirty
+ */
+static void xe_mark_range_accessed(struct hmm_range *range, bool write)
+{
+	struct page *page;
+	u64 i, npages;
+
+	npages =3D xe_npages_in_range(range-&gt;start, range-&gt;end);
+	for (i =3D 0; i &lt; npages; i++) {
+		page =3D hmm_pfn_to_page(range-&gt;hmm_pfns[i]);
+		if (write)
+			set_page_dirty_lock(page);
+
+		mark_page_accessed(page);
+	}
+}
+
+/*
+ * xe_build_sg() - build a scatter gather table for all the physical pages=
/pfn
+ * in a hmm_range. dma-map pages if necessary. dma-address is save in sg t=
able
+ * and will be used to program GPU page table later.
+ *
+ * @xe: the xe device who will access the dma-address in sg table
+ * @range: the hmm range that we build the sg table from. range-&gt;hmm_pf=
ns[]
+ * has the pfn numbers of pages that back up this hmm address range.
+ * @st: pointer to the sg table.
+ * @write: whether we write to this range. This decides dma map direction
+ * for system pages. If write we map it bi-diretional; otherwise
+ * DMA_TO_DEVICE
+ *
+ * All the contiguous pfns will be collapsed into one entry in
+ * the scatter gather table. This is for the purpose of efficiently
+ * programming GPU page table.
+ *
+ * The dma_address in the sg table will later be used by GPU to
+ * access memory. So if the memory is system memory, we need to
+ * do a dma-mapping so it can be accessed by GPU/DMA.
+ *
+ * FIXME: This function currently only support pages in system
+ * memory. If the memory is GPU local memory (of the GPU who
+ * is going to access memory), we need gpu dpa (device physical
+ * address), and there is no need of dma-mapping. This is TBD.
+ *
+ * FIXME: dma-mapping for peer gpu device to access remote gpu's
+ * memory. Add this when you support p2p
+ *
+ * This function allocates the storage of the sg table. It is
+ * caller's responsibility to free it calling sg_free_table.
+ *
+ * Returns 0 if successful; -ENOMEM if fails to allocate memory
+ */
+static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+		       struct sg_table *st, bool write)
+{
+	struct device *dev =3D xe-&gt;drm.dev;
+	struct page **pages;
+	u64 i, npages;
+	int ret;
+
+	npages =3D xe_npages_in_range(range-&gt;start, range-&gt;end);
+	pages =3D kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i =3D 0; i &lt; npages; i++) {
+		pages[i] =3D hmm_pfn_to_page(range-&gt;hmm_pfns[i]);
+		xe_assert(xe, !is_device_private_page(pages[i]));
+	}
+
+	ret =3D sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages &l=
t;&lt; PAGE_SHIFT,
+						xe_sg_segment_size(dev), GFP_KERNEL);
+	if (ret)
+		goto free_pages;
+
+	ret =3D dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVIC=
E,
+			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
+	if (ret) {
+		sg_free_table(st);
+		st =3D NULL;
+	}
+
+free_pages:
+	kvfree(pages);
+	return ret;
+}
+
+/*
+ * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr =3D &amp;uvma-&gt;userptr;
+	struct xe_vma *vma =3D &amp;uvma-&gt;vma;
+	bool write =3D !xe_vma_read_only(vma);
+	struct xe_vm *vm =3D xe_vma_vm(vma);
+	struct xe_device *xe =3D vm-&gt;xe;
+	struct device *dev =3D xe-&gt;drm.dev;
+
+	xe_assert(xe, userptr-&gt;sg);
+	dma_unmap_sgtable(dev, userptr-&gt;sg,
+			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
+
+	sg_free_table(userptr-&gt;sg);
+	userptr-&gt;sg =3D NULL;
+}
+
+/**
+ * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
+ * address range
+ *
+ * @uvma: userptr vma which has information of the range to populate.
+ * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by calle=
r.
+ *
+ * This function populate the physical pages of a virtual
+ * address range. The populated physical pages is saved in
+ * userptr's sg table. It is similar to get_user_pages but call
+ * hmm_range_fault.
+ *
+ * This function also read mmu notifier sequence # (
+ * mmu_interval_read_begin), for the purpose of later
+ * comparison (through mmu_interval_read_retry).
+ *
+ * This must be called with mmap read or write lock held.
+ *
+ * This function allocates the storage of the userptr sg table.
+ * It is caller's responsibility to free it calling sg_free_table.
+ *
+ * returns: 0 for succuss; negative error no on failure
+ */
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
+				  bool is_mm_mmap_locked)
+{
+	unsigned long timeout =3D
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags =3D HMM_PFN_REQ_FAULT;
+	struct xe_userptr *userptr;
+	struct xe_vma *vma =3D &amp;uvma-&gt;vma;
+	u64 start =3D xe_vma_userptr(vma);
+	u64 end =3D start + xe_vma_size(vma);
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Nit: xe_vma_end</pre>
    </blockquote>
    Sure. Will address in next patch. <br>
    <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.fm=
.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+	struct xe_vm *vm =3D xe_vm=
a_vm(vma);
+	struct hmm_range hmm_range;
+	bool write =3D !xe_vma_read_only(vma);
+	unsigned long notifier_seq;
+	u64 npages;
+	int ret;
+
+	userptr =3D &amp;uvma-&gt;userptr;
+
+	if (is_mm_mmap_locked)
+		mmap_assert_locked(userptr-&gt;notifier.mm);
+
+	if (vma-&gt;gpuva.flags &amp; XE_VMA_DESTROYED)
+		return 0;
+
+	notifier_seq =3D mmu_interval_read_begin(&amp;userptr-&gt;notifier);
+	if (notifier_seq =3D=3D userptr-&gt;notifier_seq)
+		return 0;
+
+	if (userptr-&gt;sg)
+		xe_hmm_userptr_free_sg(uvma);
+
+	npages =3D xe_npages_in_range(start, end);
+	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |=3D HMM_PFN_REQ_WRITE;
+
+	if (!mmget_not_zero(userptr-&gt;notifier.mm)) {
+		ret =3D -EFAULT;
+		goto free_pfns;
+	}
+
+	hmm_range.default_flags =3D flags;
+	hmm_range.hmm_pfns =3D pfns;
+	hmm_range.notifier =3D &amp;userptr-&gt;notifier;
+	hmm_range.start =3D start;
+	hmm_range.end =3D end;
+	hmm_range.dev_private_owner =3D vm-&gt;xe;
+
+	while (true) {
+		hmm_range.notifier_seq =3D mmu_interval_read_begin(&amp;userptr-&gt;noti=
fier);
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Nit: This could be set above in this code:

	notifier_seq =3D mmu_interval_read_begin(&amp;userptr-&gt;notifier);
	if (notifier_seq =3D=3D userptr-&gt;notifier_seq)
		return 0;
=20
i.e. drop local notifier_seq and set hmm_range.notifier_seq...

Then reset before continue in the if (ret =3D=3D -EBUSY) function.</pre>
    </blockquote>
    I chose to retain <code style=3D"border: 0px solid rgb(227, 227, 227); =
box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0;=
 --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; =
--tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y:=
 ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient=
-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: =
; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-=
spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-wid=
th: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5);=
 --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparen=
t; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw=
-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rot=
ate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --=
tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; -=
-tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert:=
 ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: =
; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-co=
ntain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne=
 Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, mono=
space !important; font-size: 0.875em; font-variation-settings: normal; colo=
r: var(--tw-prose-code);"><b>mmu_interval_read_begin</b></code>
    before <code style=3D"border: 0px solid rgb(227, 227, 227); box-sizing:=
 border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-trans=
late-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y=
: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pin=
ch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-posit=
ion: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordi=
nal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; =
--tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --=
tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-=
offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-sha=
dow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --=
tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw=
-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop=
-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdro=
p-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-bac=
kdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-cont=
ain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style=
: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne Mono&quot;=
, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !impo=
rtant; font-size: 0.875em; font-variation-settings: normal; color: var(--tw=
-prose-code); font-weight: 600;">hmm_range_fault</code>
    because I anticipated a scenario where the notifier sequence might
    be invalid&nbsp; between the initial call and just before <code style=
=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-bord=
er-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-transl=
ate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; =
--tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll=
-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-v=
ia-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-ze=
ro: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction:=
 ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: =
#fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 tra=
nsparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; =
--tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-=
contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-satura=
te: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop=
-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-ba=
ckdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-=
backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-conta=
in-layout: ; --tw-contain-paint: ; --tw-contain-style: ; font-feature-setti=
ngs: normal; font-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale=
 Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !important; font-size: 0.87=
5em; font-variation-settings: normal; color: var(--tw-prose-code); font-wei=
ght: 600;">hmm_range_fault</code>.
    In such a case, <code style=3D"border: 0px solid rgb(227, 227, 227); bo=
x-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; -=
-tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --=
tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ;=
 --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-f=
rom-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; =
--tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-sp=
acing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width=
: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); -=
-tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent;=
 --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-b=
lur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotat=
e: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw=
-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --t=
w-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ;=
 --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; =
--tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-cont=
ain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne M=
ono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monosp=
ace !important; font-size: 0.875em; font-variation-settings: normal; color:=
 var(--tw-prose-code); font-weight: 600;">hmm_range_fault</code>
    would return EBUSY, requiring us to unlock the mmap_lock, use a <code s=
tyle=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-=
border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tr=
anslate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x:=
 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-sc=
roll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradie=
nt-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashe=
d-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fract=
ion: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-col=
or: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0=
 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpare=
nt; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; -=
-tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-sa=
turate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-back=
drop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --t=
w-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; -=
-tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-c=
ontain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; font-feature-s=
ettings: normal; font-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;An=
dale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !important; font-size: =
0.875em; font-variation-settings: normal; color: var(--tw-prose-code); font=
-weight: 600;">time_after</code>
    routine, lock again, and call <code style=3D"border: 0px solid rgb(227,=
 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-s=
pacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw=
-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ;=
 --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; -=
-tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-t=
o-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; -=
-tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-rin=
g-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69=
,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 =
0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 trans=
parent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; =
--tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-=
shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-c=
ontrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-back=
drop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-back=
drop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-pain=
t: ; --tw-contain-style: ; font-feature-settings: normal; font-family: &quo=
t;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono=
&quot;, monospace !important; font-size: 0.875em; font-variation-settings: =
normal; color: var(--tw-prose-code); font-weight: 600;">hmm_range_fault</co=
de>
    once more.
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 1.25em 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-seri=
f, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarel=
l, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sym=
bol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;">However, by utilizing <code style=3D"border: 0px so=
lid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; -=
-tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rot=
ate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; -=
-tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: =
proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --t=
w-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric=
-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset=
: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-co=
lor: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-rin=
g-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colore=
d: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-g=
rayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: =
; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --t=
w-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate:=
 ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate:=
 ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-=
contain-paint: ; --tw-contain-style: ; font-feature-settings: normal; font-=
family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot=
;Ubuntu Mono&quot;, monospace !important; font-size: 0.875em; font-variatio=
n-settings: normal; color: var(--tw-prose-code); font-weight: 600;">mmu_int=
erval_read_begin</code> before <code style=3D"border: 0px solid rgb(227, 22=
7, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spac=
ing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-sk=
ew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --=
tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw=
-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-p=
osition: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw=
-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-o=
ffset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89=
,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 t=
ransparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transpar=
ent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --t=
w-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-sha=
dow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-cont=
rast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdro=
p-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdro=
p-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: =
; --tw-contain-style: ; font-feature-settings: normal; font-family: &quot;S=
=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&qu=
ot;, monospace !important; font-size: 0.875em; font-variation-settings: nor=
mal; color: var(--tw-prose-code); font-weight: 600;">hmm_range_fault</code>=
, we might avoid this issue. Any change in sequence between the initial cal=
l and this point wouldn't impact the process. Even if there's no change in =
sequence, we're only making an extra call to <code style=3D"border: 0px sol=
id rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --=
tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rota=
te: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --=
tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: p=
roximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw=
-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-=
figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset:=
 ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-col=
or: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring=
-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored=
: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-gr=
ayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ;=
 --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw=
-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: =
; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: =
; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-c=
ontain-paint: ; --tw-contain-style: ; font-feature-settings: normal; font-f=
amily: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;=
Ubuntu Mono&quot;, monospace !important; font-size: 0.875em; font-variation=
-settings: normal; color: var(--tw-prose-code); font-weight: 600;">mmu_inte=
rval_read_begin</code>.</p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 1.25em 0px 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-=
serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cant=
arell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial=
, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI=
 Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Both approaches seem to work, but if you believ=
e my concern about changes in the notifier sequence is unfounded, I will pr=
oceed with the suggested changes.</p>
    <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.fm=
.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+		if (!is_mm_mmap_locked)
+			mmap_read_lock(userptr-&gt;notifier.mm);
+
+		ret =3D hmm_range_fault(&amp;hmm_range);
+
+		if (!is_mm_mmap_locked)
+			mmap_read_unlock(userptr-&gt;notifier.mm);
+
+		if (ret =3D=3D -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			continue;
+		}
+		break;
+	}
+
+	mmput(userptr-&gt;notifier.mm);
+
+	if (ret)
+		goto free_pfns;
+
+	ret =3D xe_build_sg(vm-&gt;xe, &amp;hmm_range, &amp;userptr-&gt;sgt, writ=
e);
+	if (ret)
+		goto free_pfns;
+
+	xe_mark_range_accessed(&amp;hmm_range, write);
+	userptr-&gt;sg =3D &amp;userptr-&gt;sgt;
+	userptr-&gt;notifier_seq =3D hmm_range.notifier_seq;
+
+free_pfns:
+	kvfree(pfns);
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
new file mode 100644
index 000000000000..40250e3f84d1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright =C2=A9 2024 Intel Corporation
+ */
+
+#include &lt;linux/types.h&gt;
+
+struct xe_userptr_vma;
+
+#if IS_ENABLED(CONFIG_HMM_MIRROR)
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_=
mmap_locked);
+#else
+static inline int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvm=
a, bool is_mm_mmap_locked)
+{
+	return -ENODEV;
+}
+#endif
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Mentioned that I don't think is needed in last rev as our driver require
CONFIG_HMM_MIRROR to be built.</pre>
    </blockquote>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">I =
noticed some KUnit failures in earlier patches, so I opted not to remove it=
. The KUnit configuration file doesn't include the HMM_MIRROR config. If we=
 want to remove this we need to modify the KUnit configs to include this co=
nfig, as it is essential for our driver. </span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">Pl=
ease confirm it is OK to add the config to kunit configuration file ?</span=
></p>
    <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.fm=
.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Matt

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+void xe_hmm_userptr_free_sg=
(struct xe_userptr_vma *uvma);
--=20
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------v1v9WcI9mSMgcaj0oXMcw7rc--
