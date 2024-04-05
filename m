Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63769CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BAB113A2A;
	Fri,  5 Apr 2024 08:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBi2AfNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1626A113A2D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712304351; x=1743840351;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=RdvmCHiv8gSUqfzm25eSFOazfKfosdtmD3QNybbtBdg=;
 b=RBi2AfNaL9vw3WpkOWcHbwmJfS1RVzmBfhlYtMter+ncfOrGPb0IMQXr
 sznsW/Vs4d9mec9d8sJw36Nb+EUbj52ULxIZ8Y1JayRKHfH9HDSbnszNC
 z/whxhbK23SvcfRxLJcHo/ao17B3HO/QaerO8RDh1mCgQzmpx4yGqjfoA
 tvBne5/kw5GvaaPHbAXtwHQkEDpEartKEEP36W+hVOZK8iXEj0sbeVQTl
 xcVRBZ9nZhlWNqy5penjfy2fwH2rcet0PJiZ/roE9WOY3M/FwrE3w03Jx
 P+142rnV3xLd0iSHz//9QgmntdiKl27XBvmQyvqdGyZdb+C+C3UCBCbAn g==;
X-CSE-ConnectionGUID: XH5FRw5pRfWMWPSNPOcV3g==
X-CSE-MsgGUID: 95+alm3PRsCB3WvYgl1dOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25065686"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="25065686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:05:30 -0700
X-CSE-ConnectionGUID: VoHTJQfCT9+YXPI84fCi9Q==
X-CSE-MsgGUID: Q4J1T4a8RSOZKgHl/Ahgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="23809798"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 01:05:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:05:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 01:05:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 01:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzJ8Zr3uN2kCh89BiBl61RNErnxJDOCJj8Cx1FWY8xW/YXQrMrs66xjRQk0qI1TholvAzR4KzUPKEM68hsGbKNzPViNyHcqsEXwjPBg72Trltho11N2Pg4Dym/Xo+wSA3JycZSAifxadrgBJj3qNPbmgsFjfkxNDbO5jK5+68g/bR3JwoNh5OcQ5Tu7IA3g2IFOaULBWpXHsuR+yM+sB4TOu80v+Tu+9b0pT1L6S96KPIH9E/nMzOlZ3t+cTzp1PhlM5QLevbuCDcS9REfTiWvf14z575FNmm+t7xncGBgVsGZt7RWzcT8eSMZ2oLlxuv6xu87Hr/F/lb6FSjZZwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2fOWHUN6VeZ+4+bO4KFDnpLkalGoWo2ubCoPrUQal0=;
 b=jCc0wO1e9pvksQhOewtHR+j0zV+YUdg74h7v3iDFZ51+3E3u5jzTS2bp8mSEcR5ay7DLGKsaTbBgDSAokoWzRsJ5iCKAQFCe01PGWzX7EfZiPB449prcIMI4rrYayX0i3qY12jS4O00Vv0BxqbVuT7Gv5NkEGAB6M6ItPLn9LnlPD++UNuMZw+1fT6dL2sxlDj1IB8o8854rIKSaCmi/3PMNBI+AuJmN/KCwJzX95v9IJzsGN0Jz4MmwyynfUpQZ1PYoW/r1H3CmQc5s5HebBAYgeqk1eQ3Kfcmf7U+0TxpPvfBk2JeZpVFK08TJnEQYyDctB1D9YeLKkrZWvJq1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 08:05:26 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 08:05:26 +0000
Content-Type: multipart/alternative;
 boundary="------------hLCJLUtY4ssM0iUvcKFtGG19"
Message-ID: <c992c676-f80c-468e-8f8f-854e63bdb5a8@intel.com>
Date: Fri, 5 Apr 2024 13:35:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Introduce helper to populate userptr
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>,
 "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>, Brian Welty
 <brian.welty@intel.com>
References: <20240404061631.4150858-1-himal.prasad.ghimiray@intel.com>
 <20240404061631.4150858-2-himal.prasad.ghimiray@intel.com>
 <Zg9O6zO/7R2edQ+I@DUT025-TGLU.fm.intel.com>
 <1b73dc81-01f2-4aa6-a13b-f3f890b35d42@intel.com>
Content-Language: en-US
In-Reply-To: <1b73dc81-01f2-4aa6-a13b-f3f890b35d42@intel.com>
X-ClientProxiedBy: PN2PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB7042:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfH/dxC5Q5N82xxOZe9E2c6UqZyp54hlSk6od1AFpyeyp1wJlVHF89tBCRIECTG19T2DJoW3MBf0LI2iP02+RZ8W74wFnURpTNrDWAMgmV5eNssQoPC+97G5amJx2G+yJOlJo/YhFEYfhMCijQk9Lc9PelNMMDTJlhS+UjYiKJpDa8AQ6tqm1zgXOguf5J/ReAlw0swYBRhIvXSlHZAbNy+Fs9R7Xyu2x/TWiAWB/jRk9i0MwzPBRc8LQB3WIRGwvliXbhuEh/7ujdZZ/RHF/P71sdtJf40ZP6HnVzxABemJS7LmR9JPJ1F1CDehRmN5OnoZD9NA9pvOD4xUEPpRBj7qSAYw2mqtnjZR+0orH8u1WvjcgR9JOiCRN45liADQyhVhP7XcYWWTZIphrVIwAxc8fRNCXfMOwAA5EXqR+/kjDDTJLqYLDdH8iwvw73xiIUfSl6ekEwrWW9lw6D8VaN3ntV+N4q6RBWxAr7ByRSu04nSDGGAe18TID3Wixip40/Qi71EE7+r2zHFqV58KTobub2kg/BJT8PAFtWJhQKbXn+2aRJzOf/Bi7n2SvHSQSuxgPwn5iz3pvlpwNBZA2ycsgw6R+v7uOrwPvwwzeB5zN5Dh0LlTq+veC0+6P275MY/0orjvizZu2iWPg0REcriRhsw55VV43g/LuU6Pe8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXgya0lMaUtaSWpoOHVxV3R2WUVpbUNCMnRERVZSSFo1M3FWYWtOanZTU2VX?=
 =?utf-8?B?eUl3cVp0Q3hrQWswTkU3MktZRmt3MkJaQlFtMkN1SFFOUTJxSnNCQUlVakxa?=
 =?utf-8?B?cFJ1OUl6UTFrRDIyR1NRaEhHVk9IVWRDYkJKLys0Q0RMNHNldGVLSWI5OWwz?=
 =?utf-8?B?b3NLVDR0ai81b1E4WXRuaFBGUUhWVG9Rc0NLZ0JQWU83MGJHc3ZUcTV3aWF6?=
 =?utf-8?B?Lzl6SjM0Ui90Um9iSjZWd1JQeHFRamVaUFhTMEJPSE1tZFpKUllGN2ZzdTkx?=
 =?utf-8?B?ME1Ca0M2MkNiTmFMMjBXMDBoSkgxVmRkNkZ4NGdHU0F5c0xaSk1CaUxBczBX?=
 =?utf-8?B?bkRDaUs1SDRENFlDZHpGdWdiai9YWDFjSTRiNnpaSFRRSkJJL0NnTnI0Z05h?=
 =?utf-8?B?OVQvNjkySTZ6MzlZS01ZYzcrVDl1YTRHbkhXSXU1MUgyS205SmFwcXFYcnF1?=
 =?utf-8?B?ZnBZSXBFWVBvSVRERVloV09HOEh0d1ZWVjlrUEJDVTF0Vmdkd2tWMVY5MEcr?=
 =?utf-8?B?T3hqaVA0dE5OdFVNV2xlYnloVmY0SG16N1g5MlNPRWtWRXViQnFGVEZ3VXF2?=
 =?utf-8?B?SmZpTGdjTFloWk1hNXhKOXl5MWppeGtpRDhFUXFiLzJFU0xicTdydkF0cUxV?=
 =?utf-8?B?VTQ2M2RDaU83UjlEV2d4YVZPVVJsWVpQUnI2dm03aC9xWGw4eDFOUmw5SkNx?=
 =?utf-8?B?TWUrTENURnZVZ1cwK3lXR1c5RlJEU1ZJa0ZjeE9qSk92Q1VrdXJEWlM0Z1I1?=
 =?utf-8?B?R2U5WVhNYjNuVmhJZGYxa0d4eXFjdE9WZVdnZHIzbTFONG85Q3g1S2pPdUE1?=
 =?utf-8?B?V2owcVRteUNDbzRYcVNIampjMEx1bGxoWkNrM3NoR0dxUC9ldWN5OXByT1hw?=
 =?utf-8?B?ZHpYVTNHYlJLakJ3UFIyeVRCTnBVQnBxMGpHV05tcGxSTXVuNnhXWGlVWHda?=
 =?utf-8?B?ekNhNEE3YXJjcmdxOGZ3WmVKT3IyUHIrMmhlUTNQNXRQbzB4RXdsaTlhZGoz?=
 =?utf-8?B?R0RHVThocUxsR0Z0SFhiWHo4ZEZoWmJWaTNEcFJqRWpIc1RsZEZieFY1NTFB?=
 =?utf-8?B?REl1ZSszUDY1ZGhDUWxCSzJqNU9LQ25yNWZjd3Z5emNTdFhEb0xBNWg1SHVV?=
 =?utf-8?B?UlJ0a2lXc1lXZ0ZBZG1KK0VUcXkyV3BkWlBIdzZqWEhid3Q1ZGtkaDFqU2Ew?=
 =?utf-8?B?TzhqaTYrUHdQMHJOc2Rybmtjb2VTaHdQdFZBUER0aEpkdmpxMDlWYjhLbnJZ?=
 =?utf-8?B?MW56SjJqcEtzcjBFOHoxY1VqWFFXQXNMbkhkc0FIS1VXNXNCWnpNMFNkSUVG?=
 =?utf-8?B?Q24xaFpYbk56YnIzV2FxM2YwdVYyOEpCVlJ2RnhoMmVlMW02czJVdkN3cnJK?=
 =?utf-8?B?cmVsNmNsV2RXYjE1QmxpSmpwV29DajNweXJycTNIN1lUZktINjhCU0ltT2FT?=
 =?utf-8?B?eVlMTHlOWGZDWFBQUGVZL3czeXA1RW45MjhKKzJOVnJqSmo2a0ZJRFhDVDVu?=
 =?utf-8?B?eHJNVnJ2cm5NQm1xQ2dBNTE5ZkhCYmFvUHExSHZqK1lQZlNndXlNY0pJMXN4?=
 =?utf-8?B?MHVSa1hKZWN2V0x0eVcwL3pUeXdwNFlUTHZaVmNXcjk4NHVOUHpWVHp6dU8v?=
 =?utf-8?B?M25Yb2FSV2hqQWdhekZQcnJXb3lBaldOT08xTEdiR2oxcmFCZ1pVbE83ZHpT?=
 =?utf-8?B?SEFHMHZmV1hPSnQvNzIvNGl2MWtrZU9zdU5CNVJiYjZkZkpYTzdUNzVvdks2?=
 =?utf-8?B?emVJMEwxd2oybHZibElVOXlCR2w4R0JzSUVuaGFOcWNjZUhKbjlPa3hkR2t4?=
 =?utf-8?B?Ynd2N1VhY2d1Vzk0WFpGTStNYzNmb1lmVEErOFJ0K0NVeDVsb2RueEFSZmVX?=
 =?utf-8?B?ZXdNSGtVTUZBSzdtR1MraGQzSlZyVk1DeklTcmM0Y2QxSHdUUUFQdE9HZWZv?=
 =?utf-8?B?NmdacGF6b1lmRmxFNSt2QlpWR054RWZFWmlqTXBLanBzditXT2grRzNCUEpP?=
 =?utf-8?B?LzVBZ2NXOUQxZC9UaEZaeEovWndSKzE4TEJPeEVDZFVDZGNkeUFjMHowMkFv?=
 =?utf-8?B?RDJoV3R3L0RGeWo5dVhLR0JZSmttYWZjSFZ6Z2J6bTFaSDlmU094L2VRRHBP?=
 =?utf-8?B?TkFMNVppaFVTbjYvU3lBUSsxWVJJSkJMVXVXUWYrdDBzQlFRWFRoUkpENHM4?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d45a387-94e9-4a80-77fb-08dc554726e1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 08:05:26.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqzg2r779Olf2SDPSzyp6wio14tC4e2u/hVM9SVCHydCJYBhIdj3I+66Y82pkH/RyLXD6BxjFqXizdf1hzYe7lEThkBQTgogDHl+zcgZOwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

--------------hLCJLUtY4ssM0iUvcKFtGG19
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-04-2024 11:42, Ghimiray, Himal Prasad wrote:
>
>
> On 05-04-2024 06:37, Matthew Brost wrote:
>> On Thu, Apr 04, 2024 at 11:46:30AM +0530, Himal Prasad Ghimiray wrote:
>>> From: Oak Zeng<oak.zeng@intel.com>
>>>
>>> Introduce a helper function xe_userptr_populate_range to populate
>>> a a userptr range. This functions calls hmm_range_fault to read
>>> CPU page tables and populate all pfns/pages of this virtual address
>>> range.
>>>
>>> If the populated page is system memory page, dma-mapping is performed
>>> to get a dma-address which can be used later for GPU to access pages.
>>>
>>> If the populated page is device private page, we calculate the dpa (
>>> device physical address) of the page. This will be handled in future
>>> patches.
>>>
>>> The dma-address or dpa is then saved in userptr's sg table. This is
>>> prepare work to replace the get_user_pages_fast code in userptr code
>>> path.
>>>
>>> v1: Address review comments:
>>>      separate a npage_in_range function (Matt)
>>>      reparameterize function xe_userptr_populate_range function (Matt)
>>>      move mmu_interval_read_begin() call into while loop (Thomas)
>>>      s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>>>      use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>>>      move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
>>> v2: Remove device private page support. Only support system
>>>      pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
>>> v3: Address review comments:
>>>      Squash patch "drm/xe: Introduce a helper to free sg table" to current
>>>      patch (Matt)
>>>      start and end addresses are already page aligned (Matt)
>>>      Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
>>>      non system allocator call. (Matt)
>>>      Drop kthread_use_mm and kthread_unuse_mm. (Matt)
>>>      No need of kernel-doc for static functions.(Matt)
>>>      Modify function names. (Matt)
>>>      Free sgtable incase of dma_map_sgtable failure.(Matt)
>>>      Modify loop for hmm_range_fault.(Matt)
>>>
>>> Signed-off-by: Oak Zeng<oak.zeng@intel.com>
>>> Co-developed-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc: Thomas Hellström<thomas.hellstrom@intel.com>
>>> Cc: Brian Welty<brian.welty@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Kconfig  |   1 +
>>>   drivers/gpu/drm/xe/Makefile |   2 +
>>>   drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_hmm.h |  18 +++
>>>   4 files changed, 274 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>> index 1a556d087e63..449a1ecbc92a 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig
>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>> @@ -41,6 +41,7 @@ config DRM_XE
>>>   	select MMU_NOTIFIER
>>>   	select WANT_DEV_COREDUMP
>>>   	select AUXILIARY_BUS
>>> +	select HMM_MIRROR
>>>   	help
>>>   	  Experimental driver for Intel Xe series GPUs
>>>   
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 21316ee47026..07031b5ba977 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -146,6 +146,8 @@ xe-y += xe_bb.o \
>>>   	xe_wa.o \
>>>   	xe_wopcm.o
>>>   
>>> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>>> +
>>>   # graphics hardware monitoring (HWMON) support
>>>   xe-$(CONFIG_HWMON) += xe_hwmon.o
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
>>> new file mode 100644
>>> index 000000000000..d7a11896ad72
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_hmm.c
>>> @@ -0,0 +1,253 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/scatterlist.h>
>>> +#include <linux/mmu_notifier.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/memremap.h>
>>> +#include <linux/swap.h>
>>> +#include <linux/hmm.h>
>>> +#include <linux/mm.h>
>>> +#include "xe_hmm.h"
>>> +#include "xe_vm.h"
>>> +#include "xe_bo.h"
>>> +
>>> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
>>> +{
>>> +	return (end - start) >> PAGE_SHIFT;
>>> +}
>>> +
>>> +/*
>>> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
>>> + * have such information for memory eviction or write back to
>>> + * hard disk
>>> + *
>>> + * @range: the range to mark
>>> + * @write: if write to this range, we mark pages in this range
>>> + * as dirty
>>> + */
>>> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>>> +{
>>> +	struct page *page;
>>> +	u64 i, npages;
>>> +
>>> +	npages = xe_npages_in_range(range->start, range->end);
>>> +	for (i = 0; i < npages; i++) {
>>> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
>>> +		if (write)
>>> +			set_page_dirty_lock(page);
>>> +
>>> +		mark_page_accessed(page);
>>> +	}
>>> +}
>>> +
>>> +/*
>>> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>>> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>>> + * and will be used to program GPU page table later.
>>> + *
>>> + * @xe: the xe device who will access the dma-address in sg table
>>> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>>> + * has the pfn numbers of pages that back up this hmm address range.
>>> + * @st: pointer to the sg table.
>>> + * @write: whether we write to this range. This decides dma map direction
>>> + * for system pages. If write we map it bi-diretional; otherwise
>>> + * DMA_TO_DEVICE
>>> + *
>>> + * All the contiguous pfns will be collapsed into one entry in
>>> + * the scatter gather table. This is for the purpose of efficiently
>>> + * programming GPU page table.
>>> + *
>>> + * The dma_address in the sg table will later be used by GPU to
>>> + * access memory. So if the memory is system memory, we need to
>>> + * do a dma-mapping so it can be accessed by GPU/DMA.
>>> + *
>>> + * FIXME: This function currently only support pages in system
>>> + * memory. If the memory is GPU local memory (of the GPU who
>>> + * is going to access memory), we need gpu dpa (device physical
>>> + * address), and there is no need of dma-mapping. This is TBD.
>>> + *
>>> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
>>> + * memory. Add this when you support p2p
>>> + *
>>> + * This function allocates the storage of the sg table. It is
>>> + * caller's responsibility to free it calling sg_free_table.
>>> + *
>>> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
>>> + */
>>> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>>> +		       struct sg_table *st, bool write)
>>> +{
>>> +	struct device *dev = xe->drm.dev;
>>> +	struct page **pages;
>>> +	u64 i, npages;
>>> +	int ret;
>>> +
>>> +	npages = xe_npages_in_range(range->start, range->end);
>>> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
>>> +	if (!pages)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i < npages; i++) {
>>> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
>>> +		xe_assert(xe, !is_device_private_page(pages[i]));
>>> +	}
>>> +
>>> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
>>> +						xe_sg_segment_size(dev), GFP_KERNEL);
>>> +	if (ret)
>>> +		goto free_pages;
>>> +
>>> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
>>> +			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
>>> +	if (ret) {
>>> +		sg_free_table(st);
>>> +		st = NULL;
>>> +	}
>>> +
>>> +free_pages:
>>> +	kvfree(pages);
>>> +	return ret;
>>> +}
>>> +
>>> +/*
>>> + * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
>>> + *
>>> + * @uvma: the userptr vma which hold the scatter gather table
>>> + *
>>> + * With function xe_userptr_populate_range, we allocate storage of
>>> + * the userptr sg table. This is a helper function to free this
>>> + * sg table, and dma unmap the address in the table.
>>> + */
>>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
>>> +{
>>> +	struct xe_userptr *userptr = &uvma->userptr;
>>> +	struct xe_vma *vma = &uvma->vma;
>>> +	bool write = !xe_vma_read_only(vma);
>>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>> +	struct xe_device *xe = vm->xe;
>>> +	struct device *dev = xe->drm.dev;
>>> +
>>> +	xe_assert(xe, userptr->sg);
>>> +	dma_unmap_sgtable(dev, userptr->sg,
>>> +			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
>>> +
>>> +	sg_free_table(userptr->sg);
>>> +	userptr->sg = NULL;
>>> +}
>>> +
>>> +/**
>>> + * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
>>> + * address range
>>> + *
>>> + * @uvma: userptr vma which has information of the range to populate.
>>> + * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
>>> + *
>>> + * This function populate the physical pages of a virtual
>>> + * address range. The populated physical pages is saved in
>>> + * userptr's sg table. It is similar to get_user_pages but call
>>> + * hmm_range_fault.
>>> + *
>>> + * This function also read mmu notifier sequence # (
>>> + * mmu_interval_read_begin), for the purpose of later
>>> + * comparison (through mmu_interval_read_retry).
>>> + *
>>> + * This must be called with mmap read or write lock held.
>>> + *
>>> + * This function allocates the storage of the userptr sg table.
>>> + * It is caller's responsibility to free it calling sg_free_table.
>>> + *
>>> + * returns: 0 for succuss; negative error no on failure
>>> + */
>>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
>>> +				  bool is_mm_mmap_locked)
>>> +{
>>> +	unsigned long timeout =
>>> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>>> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
>>> +	struct xe_userptr *userptr;
>>> +	struct xe_vma *vma = &uvma->vma;
>>> +	u64 start = xe_vma_userptr(vma);
>>> +	u64 end = start + xe_vma_size(vma);
>> Nit: xe_vma_end
> Sure. Will address in next patch.
>>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>> +	struct hmm_range hmm_range;
>>> +	bool write = !xe_vma_read_only(vma);
>>> +	unsigned long notifier_seq;
>>> +	u64 npages;
>>> +	int ret;
>>> +
>>> +	userptr = &uvma->userptr;
>>> +
>>> +	if (is_mm_mmap_locked)
>>> +		mmap_assert_locked(userptr->notifier.mm);
>>> +
>>> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>>> +		return 0;
>>> +
>>> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>>> +	if (notifier_seq == userptr->notifier_seq)
>>> +		return 0;
>>> +
>>> +	if (userptr->sg)
>>> +		xe_hmm_userptr_free_sg(uvma);
>>> +
>>> +	npages = xe_npages_in_range(start, end);
>>> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>>> +	if (unlikely(!pfns))
>>> +		return -ENOMEM;
>>> +
>>> +	if (write)
>>> +		flags |= HMM_PFN_REQ_WRITE;
>>> +
>>> +	if (!mmget_not_zero(userptr->notifier.mm)) {
>>> +		ret = -EFAULT;
>>> +		goto free_pfns;
>>> +	}
>>> +
>>> +	hmm_range.default_flags = flags;
>>> +	hmm_range.hmm_pfns = pfns;
>>> +	hmm_range.notifier = &userptr->notifier;
>>> +	hmm_range.start = start;
>>> +	hmm_range.end = end;
>>> +	hmm_range.dev_private_owner = vm->xe;
>>> +
>>> +	while (true) {
>>> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> Nit: This could be set above in this code:
>>
>> 	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> 	if (notifier_seq == userptr->notifier_seq)
>> 		return 0;
>>   
>> i.e. drop local notifier_seq and set hmm_range.notifier_seq...
>>
>> Then reset before continue in the if (ret == -EBUSY) function.
> I chose to retain |*mmu_interval_read_begin*| before |hmm_range_fault| 
> because I anticipated a scenario where the notifier sequence might be 
> invalid  between the initial call and just before |hmm_range_fault|. 
> In such a case, |hmm_range_fault| would return EBUSY, requiring us to 
> unlock the mmap_lock, use a |time_after| routine, lock again, and call 
> |hmm_range_fault| once more.
>
> However, by utilizing |mmu_interval_read_begin| before 
> |hmm_range_fault|, we might avoid this issue. Any change in sequence 
> between the initial call and this point wouldn't impact the process. 
> Even if there's no change in sequence, we're only making an extra call 
> to |mmu_interval_read_begin|.
>
> Both approaches seem to work, but if you believe my concern about 
> changes in the notifier sequence is unfounded, I will proceed with the 
> suggested changes.
>
>>> +
>>> +		if (!is_mm_mmap_locked)
>>> +			mmap_read_lock(userptr->notifier.mm);
>>> +
>>> +		ret = hmm_range_fault(&hmm_range);
>>> +
>>> +		if (!is_mm_mmap_locked)
>>> +			mmap_read_unlock(userptr->notifier.mm);
>>> +
>>> +		if (ret == -EBUSY) {
>>> +			if (time_after(jiffies, timeout))
>>> +				break;
>>> +
>>> +			continue;
>>> +		}
>>> +		break;
>>> +	}
>>> +
>>> +	mmput(userptr->notifier.mm);
>>> +
>>> +	if (ret)
>>> +		goto free_pfns;
>>> +
>>> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
>>> +	if (ret)
>>> +		goto free_pfns;
>>> +
>>> +	xe_mark_range_accessed(&hmm_range, write);
>>> +	userptr->sg = &userptr->sgt;
>>> +	userptr->notifier_seq = hmm_range.notifier_seq;
>>> +
>>> +free_pfns:
>>> +	kvfree(pfns);
>>> +	return ret;
>>> +}
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
>>> new file mode 100644
>>> index 000000000000..40250e3f84d1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_hmm.h
>>> @@ -0,0 +1,18 @@
>>> +/* SPDX-License-Identifier: MIT
>>> + *
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct xe_userptr_vma;
>>> +
>>> +#if IS_ENABLED(CONFIG_HMM_MIRROR)
>>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
>>> +#else
>>> +static inline int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +#endif
>> Mentioned that I don't think is needed in last rev as our driver require
>> CONFIG_HMM_MIRROR to be built.
>
> I noticed some KUnit failures in earlier patches, so I opted not to 
> remove it. The KUnit configuration file doesn't include the HMM_MIRROR 
> config. If we want to remove this we need to modify the KUnit configs 
> to include this config, as it is essential for our driver.
>
> Please confirm it is OK to add the config to kunit configuration file ?
>
My bad in earlier patch HMM_MIRROR was under config DRM_XE_SVM , this 
patch is selecting it under DRM_XE itself which is used by kunit conf 
file. This should be safe to remove. Will remove it in next version.

>> Matt
>>
>>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
>>> -- 
>>> 2.25.1
>>>
--------------hLCJLUtY4ssM0iUvcKFtGG19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 05-04-2024 11:42, Ghimiray, Himal
      Prasad wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:1b73dc81-01f2-4aa6-a13b-f3f890b35=
d42@intel.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 05-04-2024 06:37, Matthew Brost
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.=
fm.intel.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Apr 04, 2024 at 11:4=
6:30AM +0530, Himal Prasad Ghimiray wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Oak Zeng <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:oak.zeng@intel.com" moz-do-not-send=
=3D"true">&lt;oak.zeng@intel.com&gt;</a>

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
ak.zeng@intel.com" moz-do-not-send=3D"true">&lt;oak.zeng@intel.com&gt;</a>
Co-developed-by: Niranjana Vishwanathapura <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:niranjana.vishwanathapura@intel.com" moz-do-not-send=3D"t=
rue">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Signed-off-by: Niranjana Vishwanathapura <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:niranjana.vishwanathapura@intel.com" moz-do-not-send=3D"tru=
e">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Cc: Matthew Brost <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew=
.brost@intel.com" moz-do-not-send=3D"true">&lt;matthew.brost@intel.com&gt;<=
/a>
Cc: Thomas Hellstr=C3=B6m <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:thomas.hellstrom@intel.com" moz-do-not-send=3D"true">&lt;thomas.hellstrom@=
intel.com&gt;</a>
Cc: Brian Welty <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:brian.wel=
ty@intel.com" moz-do-not-send=3D"true">&lt;brian.welty@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send=3D"true">&lt;h=
imal.prasad.ghimiray@intel.com&gt;</a>
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
        <pre class=3D"moz-quote-pre" wrap=3D"">Nit: xe_vma_end</pre>
      </blockquote>
      Sure. Will address in next patch. <br>
      <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.=
fm.intel.com">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">+	struct xe_vm *vm =3D xe_=
vma_vm(vma);
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
        <pre class=3D"moz-quote-pre" wrap=3D"">Nit: This could be set above=
 in this code:

	notifier_seq =3D mmu_interval_read_begin(&amp;userptr-&gt;notifier);
	if (notifier_seq =3D=3D userptr-&gt;notifier_seq)
		return 0;
=20
i.e. drop local notifier_seq and set hmm_range.notifier_seq...

Then reset before continue in the if (ret =3D=3D -EBUSY) function.</pre>
      </blockquote>
      I chose to retain <code style=3D"border: 0px solid rgb(227, 227, 227)=
; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: =
0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0=
; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-=
y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradie=
nt-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position=
: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeri=
c-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-w=
idth: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5=
); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transpar=
ent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --=
tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-r=
otate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; =
--tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;=
 --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-inver=
t: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia=
: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-=
contain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6h=
ne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, mo=
nospace !important; font-size: 0.875em; font-variation-settings: normal; co=
lor: var(--tw-prose-code);"><b>mmu_interval_read_begin</b></code>
      before <code style=3D"border: 0px solid rgb(227, 227, 227); box-sizin=
g: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-tra=
nslate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew=
-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-p=
inch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-pos=
ition: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-or=
dinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: =
; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; =
--tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-rin=
g-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-s=
hadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; =
--tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --=
tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdr=
op-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backd=
rop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-b=
ackdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-co=
ntain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-sty=
le: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne Mono&quo=
t;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !im=
portant; font-size: 0.875em; font-variation-settings: normal; color: var(--=
tw-prose-code); font-weight: 600;">hmm_range_fault</code>
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
      In such a case, <code style=3D"border: 0px solid rgb(227, 227, 227); =
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
r: var(--tw-prose-code); font-weight: 600;">hmm_range_fault</code>
      would return EBUSY, requiring us to unlock the mmap_lock, use a <code=
 style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --t=
w-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-=
translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-=
x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-=
scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-grad=
ient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slas=
hed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fra=
ction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-c=
olor: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0=
 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpa=
rent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ;=
 --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-=
saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-ba=
ckdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; -=
-tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ;=
 --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw=
-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; font-feature=
-settings: normal; font-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;=
Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !important; font-size=
: 0.875em; font-variation-settings: normal; color: var(--tw-prose-code); fo=
nt-weight: 600;">time_after</code>
      routine, lock again, and call <code style=3D"border: 0px solid rgb(22=
7, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border=
-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --=
tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x:=
 ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity;=
 --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient=
-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ;=
 --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-r=
ing-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(=
69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: =
0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 tra=
nsparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: =
; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-dro=
p-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop=
-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-ba=
ckdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-ba=
ckdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-pa=
int: ; --tw-contain-style: ; font-feature-settings: normal; font-family: &q=
uot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mo=
no&quot;, monospace !important; font-size: 0.875em; font-variation-settings=
: normal; color: var(--tw-prose-code); font-weight: 600;">hmm_range_fault</=
code>
      once more.
      <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-=
box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: =
0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --t=
w-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom:=
 ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; -=
-tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; -=
-tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-num=
eric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-=
offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-s=
hadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0=
 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brigh=
tness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert:=
 ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ;=
 --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-graysc=
ale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-op=
acity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size=
: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; marg=
in: 1.25em 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-se=
rif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantar=
ell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, =
&quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI S=
ymbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;">However, by utilizing <code style=3D"border: 0px =
solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0;=
 --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-r=
otate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1;=
 --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness=
: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; -=
-tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numer=
ic-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-ins=
et: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-=
color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-r=
ing-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colo=
red: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw=
-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia=
: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; -=
-tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotat=
e: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturat=
e: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --t=
w-contain-paint: ; --tw-contain-style: ; font-feature-settings: normal; fon=
t-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &qu=
ot;Ubuntu Mono&quot;, monospace !important; font-size: 0.875em; font-variat=
ion-settings: normal; color: var(--tw-prose-code); font-weight: 600;">mmu_i=
nterval_read_begin</code> before <code style=3D"border: 0px solid rgb(227, =
227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-sp=
acing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-=
skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; =
--tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --=
tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to=
-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --=
tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring=
-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,=
89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0=
 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transp=
arent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; -=
-tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-s=
hadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-co=
ntrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backd=
rop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backd=
rop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint=
: ; --tw-contain-style: ; font-feature-settings: normal; font-family: &quot=
;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&=
quot;, monospace !important; font-size: 0.875em; font-variation-settings: n=
ormal; color: var(--tw-prose-code); font-weight: 600;">hmm_range_fault</cod=
e>, we might avoid this issue. Any change in sequence between the initial c=
all and this point wouldn't impact the process. Even if there's no change i=
n sequence, we're only making an extra call to <code style=3D"border: 0px s=
olid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; =
--tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-ro=
tate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; =
--tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness:=
 proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --=
tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeri=
c-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inse=
t: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-c=
olor: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ri=
ng-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-color=
ed: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-=
grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia:=
 ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --=
tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate=
: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate=
: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw=
-contain-paint: ; --tw-contain-style: ; font-feature-settings: normal; font=
-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quo=
t;Ubuntu Mono&quot;, monospace !important; font-size: 0.875em; font-variati=
on-settings: normal; color: var(--tw-prose-code); font-weight: 600;">mmu_in=
terval_read_begin</code>.</p>
      <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-=
box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: =
0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --t=
w-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom:=
 ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; -=
-tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; -=
-tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-num=
eric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-=
offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-s=
hadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0=
 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brigh=
tness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert:=
 ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ;=
 --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-graysc=
ale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-op=
acity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size=
: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; marg=
in: 1.25em 0px 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-san=
s-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Ca=
ntarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Ari=
al, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe =
UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 25=
5); text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial;">Both approaches seem to work, but if you beli=
eve my concern about changes in the notifier sequence is unfounded, I will =
proceed with the suggested changes.</p>
      <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.=
fm.intel.com">
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
        <pre class=3D"moz-quote-pre" wrap=3D"">Mentioned that I don't think=
 is needed in last rev as our driver require
CONFIG_HMM_MIRROR to be built.</pre>
      </blockquote>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
I noticed some KUnit failures in earlier patches, so I opted not to remove =
it. The KUnit configuration file doesn't include the HMM_MIRROR config. If =
we want to remove this we need to modify the KUnit configs to include this =
config, as it is essential for our driver. </span></p>
      <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui=
-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu=
, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,=
 Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Se=
goe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255=
, 255); text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;">=
Please confirm it is OK to add the config to kunit configuration file ?</sp=
an></p>
    </blockquote>
    <p>My bad in earlier patch HMM_MIRROR was under config DRM_XE_SVM ,
      this patch is selecting it under DRM_XE itself which is used by
      kunit conf file. This should be safe to remove. Will remove it in
      next version.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:1b73dc81-01f2-4aa6-a13b-f3f890b35=
d42@intel.com">
      <blockquote type=3D"cite" cite=3D"mid:Zg9O6zO%2F7R2edQ+I@DUT025-TGLU.=
fm.intel.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">Matt

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">+void xe_hmm_userptr_free_=
sg(struct xe_userptr_vma *uvma);
--=20
2.25.1

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------hLCJLUtY4ssM0iUvcKFtGG19--
