Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB6CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B814E10E9CB;
	Mon, 18 May 2026 23:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgcmL2oN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5910E9CB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779145755; x=1810681755;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FIcETkzBZTMsDPQP6pbfn0buk9BSqPHxCOB25zI/Uik=;
 b=WgcmL2oNQ1WHpkh+OK9/PSZZUuIwBizYCuSUQkMRQ7d0YREG+S9ObyTn
 CIWSpMS8Xj8foJKlmDZABLW7jkpvFlI7Nlry9o2VymEPf6L78dKG5VchY
 EZAAS4qdK1Sl4wjjIdDeZXMjbNzKtAhuvnXHsornsknZLIk3e53+A7VO8
 ir2c+OrNeBOffZ6v18lRZv/ejKmvuRSyv/VcNVVvQN37m5Re2zei3RPKa
 UF8p1sczotrBvCaucyptwD9Kf9veLY0OTRdqSMOkILXhDTlExsvR3g2oB
 D03TzIueQUfpX0HgfOTEcnV8cpLZlHK7VVszw1yct0GOQ2af9Ifn+Tl02 g==;
X-CSE-ConnectionGUID: 72+s9e6BRNKWwDsBm7m47w==
X-CSE-MsgGUID: gIKUuMUlTzWuB5drzcI3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91406292"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="91406292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:09:14 -0700
X-CSE-ConnectionGUID: CK+gS1ofTPWmdJTnp0p3yA==
X-CSE-MsgGUID: T1D1QEXNSP+BhGktklLDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="277687371"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:09:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 16:09:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 16:09:13 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 16:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBLixHawWcUGBfnAzvOwj9ngohz/kGB4q5AXd3K0ePlhnJDihcSEEiP63f6dTbx2Ut0jCxNwbCI2gPdf3CiCZeE0gqMsncylzGLj2LrsOV91a6hGCMONkEhsSD2K81SSiio0/VvCIkKjoL77wD+gWkKppDd5HLi7yGmmi4zreuS3+EeWdKuSxo/mojsoNa4Rnik6/FIToxmYmjilmjTBhxwGEj91a6sWtCAke+eum5smgzq67wcAmPtjN0FOekiHzsE9N//LlR6EatoE1pkvY+8TvpxJ47fp/0P8uXD6q2+HFqjqJZBHwzeKgQCyE7EwbLiOIADW+qPm0XX+vVEGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBt+dTHqnTBfm6aPdiQBBGL3e8o3/A5FrGIXs/WTgTs=;
 b=UjXAvJZNp177mP8ADq+jIh7bY1sBknj7e33BuWQRiRjeafdghedivyKdbmdO4xoorJVr5Q9GUuwTk6sUDWaU9EkjrQ2x6jORScoT3h2elZyJpzVnLBWnx5CuCLBuBHFnCEmSC6Y2YKyIrHvv6QqIUh8MEmkv+xtaP2y3UdcZKJmZnER/QZJeDbWMtGyYwJwxF3hk3wI4QEXpi+kzxcPvOJMnWadLN+qyGCHqzkTZIasWdwP017/LnuHuTf8p1JvEXkXroX+4ru5e8qqFAq2SVrPebSCPOF/a9WKfQ+woS9b9m1F/rgxQMHgt1ao8u3qv7gLh7+08YsFUnfYuOdU3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SN4PR11MB9966.namprd11.prod.outlook.com (2603:10b6:806:4fe::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 23:09:10 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%4]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 23:09:10 +0000
Message-ID: <9cb81721-5c3d-4c7a-8056-96c24027713b@intel.com>
Date: Mon, 18 May 2026 16:08:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] drm/xe: Fine grained page fault locking
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-2-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20260226042834.2963245-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SN4PR11MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: 3840018c-bd42-4086-57d1-08deb5327844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: pXzLMe6Nb2qbUab8aCK+I5jRb1vbeRlcCXEQzbD6TbtSTlcyicAkzJS0cCdUtAsRYv9J8ZwrH9B7qTAFFNkXCBcJF7/QfrztKmYKW1HJKig222DsjWb/Sf+cSnFY/kobzvuZkmRc91yM1HPccm5q2SUEiDTkzFap5fQ3F7imt2zSK1nIk1xuTbMEYeclerGiFMO8Hh8W++JlzrpaHT1xuEVp9zJtPXXGvByzpa6oCWGjbM1Bb/l8qS2CcW5MaVGr5R7T46qrAnPXB1k74tHoV/+s4fQXfEOhj9X6oHL5wZb3WofE+szrQN5JhiB0fRUdibB/8h/ZmZY8R8F3oRjSYuoN/nJivp4fzCvwqSe3Qq/U2AABX4qZkONbqzRQPqu9RCv5P2MoytYPkWdk7KMkPbGGmtEjthyItjxMT+gHxCeMZUWRVaJJOFWwhk0C3RpBreI1PaQ+PPsDfxtI0zBhdO3m2UjcH1n2tvefmWAFBxJohejcuERhevPmvzxaXqTIljXZybFyWBHxZukg7pY4EBVnQFXyRHkrGYeeJyAt1ET9twe0B9HIqQm0LT5omLGtPVaCz74UUFI1nwlaQ4W6kV7heDLPQD+pR9NshVGN6JsgWhvhfEPFkolhgK/t4nMCEu8WMrnWjDzLyNWRMaJEZ3k7+85ZT2ctreysceJn0k4a3lIG2UI9J/aSmf2FyNZe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekdmT3NBQ3NQa1VkaER6WlNIT203c0lrMFNOS1B5WVYwcWlqOHliMUEvbGM2?=
 =?utf-8?B?U1BSWHZ6Y1d2TCsyNFlqUGZDdVA3UFdUZ1JnMU45UW9BSU1VTjZDWk1vbEpF?=
 =?utf-8?B?U3pWNlh1d1gvSUpubFBBTUVrUkM4TWRReVI0U005S25rcmhoVFUwd1FsMFF2?=
 =?utf-8?B?SlhjaFl1azVFd2tRT2lybGhXOEppR0FOajN6NmVMdi9zWGt3MTh1MGNJLzhU?=
 =?utf-8?B?dTRrWnRZUm1PN0JJc1Qza1BYdWVZdnlmOStWWUZZVFZ0ZWpmMkhncUVXUlA1?=
 =?utf-8?B?V2JxUVhwa3lzdWFrNUpDcGxVSis4UVFsa3B3YitPSkFSSkRXWmhSOFA3Y29x?=
 =?utf-8?B?TnRXVks4aDE4aldGd0dBNVQ5emN0cW8zMHlJQ2JmalNUSkhJNU82UjRFWWxG?=
 =?utf-8?B?Tk1GVnpsRjZ2T0RPK0RPS0swNnZsTnZWVU4xRnBrdDJ2T1ZuZGJoVWpjVktP?=
 =?utf-8?B?aFRMSXdJa2RncElXY08xeldoQWVLc1ArcktNTjBLSTU5ZkR1VkNOM2RoN09C?=
 =?utf-8?B?RG5sY3IyQTEzNmEyME4zaE4vQnpSRnU1SDZVd0ZITEZ5QUE0VytLRFBWU21V?=
 =?utf-8?B?Y1kreUR5Z1YrZ0F4aTh2SkNTaHk3TUdqY1lJdEh5Zm1kUFdQYnF0TUYzQlE3?=
 =?utf-8?B?NzBUYXVQUmhMd1VHZ2FyTVN3d2I3Z0lLOURudTlEUFJsWTdLNnFib1dqaEZ4?=
 =?utf-8?B?L2JYSEVlQXdEUlkxZGZNNWwvN1B4bnd0R3k1MzdRQlhkQlA5ZGh0QzVoUUl1?=
 =?utf-8?B?ZTRjZXoyV2VndExDVGs5bjBSZVVXVUdZNFhmeFNEcjBMMWdtRnJZaExUeXVo?=
 =?utf-8?B?MUNkVXU3STZvSXJYQ1RSWE9VdVRHaVpPSDBCSTVRSVRHTXBDTnRiaDdFMUs1?=
 =?utf-8?B?bi9ScnRvclNnM0krRytWWitSdW9JUERiNEYwSmdWZnlqdnVoM1J1bzdQMmsy?=
 =?utf-8?B?M3ZKd1ZibWs5NGlZRldjUit1cjBHVWhDL1lZYnJjL3hQcU16cXZ1MFllSVhv?=
 =?utf-8?B?QTVTdjZKNy9CR2VPRlBXelpFSithakFIYWdoZ0k3cU5rb2J1bGJBWnUreDdj?=
 =?utf-8?B?dk0yU0cybDNZZUVxVUFYcDZhU2c0TzA5cDFxeDcrcUJDZzFETndpTUVTOVh2?=
 =?utf-8?B?VUduUXhKTW9vTTlLdWpVUXdibEg2akV4WTg4NG9FSUFFVWJjTHhNbTA3b3ly?=
 =?utf-8?B?QUgvanFoc1JwT25xR0VFYzVvdDY0Qk5ibTY1OTFFNlBOV1Z3SVlBL1ZsaDJP?=
 =?utf-8?B?L2ZGaStLc25sV09jQjAremJiemFwZm1WVkhPdEdKK215MXczbzFKaE1wQW5J?=
 =?utf-8?B?NFJaOUFSaTBzckxHbGY5bUxsT1REU1QvNnBRd3d4UGo0T01xbE4vSUJiTUdI?=
 =?utf-8?B?VDNFN1VSOWtWRDVWVk9xSjRxRUhwdzFVSU1OcEJYZE9nTlA1MmhWRDZ1ZzNF?=
 =?utf-8?B?K2tkeWR0V1RzTVVua2kzMUlEVGJaU09BdVNCUWR4N2VKU0kxTnh2Z1ZUY1N0?=
 =?utf-8?B?eDFpWDdOaGhBSWtPajFrbkl5S2xCMUF4NFRkODVjVy9WQ0t0MFVOTndreUFx?=
 =?utf-8?B?d3JTQXFzTEZCU2tMRTkzSG5ndlhUYVVKQVJCMEwwQnliYWl2YTdlTWp6bTBP?=
 =?utf-8?B?ejQwOEhwZ1NSa1g3NWQxR2F0bzgrZWtpYzNza1o5ZHdCRldVV0VheWppL3R2?=
 =?utf-8?B?eGFkSnk3aDU0Q203SGtLQzBOb3JUQ2RDZTdFTDIwZHJHci82d0Y5ciszbi9k?=
 =?utf-8?B?TmF4YWZhdHlxN3BSN1pnM0VFeEhvYWROSlgyK2RuWG5FK0kwcHRqbVNKY3hM?=
 =?utf-8?B?cjh4ZHdwRUo0MkFsVWpTakoxMUJxMFhUMUd2VlVDWUY3WkxSeis2ZUpHNFFG?=
 =?utf-8?B?TzJqMmgvMCt4NFUySW5uK00ralNDMWFRNnZUT2t3cDJFOUk5d3IxdWtCSmtB?=
 =?utf-8?B?cVQ2clR5dHEyT3RLNXg5WkdrRG9Kd2xHdUpJMy9GUzNJeHJNYUVmSGVRcjZO?=
 =?utf-8?B?MDZkeFd6czJYRThZemlCaWJMUTVlWjhDZDk3Q1M1cXEzNitkZ0NrWUdXVkdi?=
 =?utf-8?B?bW5GSThpTHcvOEczbmc1eWdjTjBaMkhrMFVMNkY5UTQyU0dmRDMwbVloUVZi?=
 =?utf-8?B?NWo1SU1DWGdvR1lGcS9EQXptRW9XN1krQmttYW9pQnRmRERhTnZoUi9JTTd0?=
 =?utf-8?B?VVVXLzhFWk82SlFqL0grNG9icnN2d0QyVjZjbmM0UkxaTGJJRnNhVEJDbDdx?=
 =?utf-8?B?Rm5HdlNjYVV3YjBoZjFUWTdFVEEwUmFuWTJkM0NnUUYzaG9QU2JnbnhNMVZ5?=
 =?utf-8?B?Zkpla0w1cnpiNEltQTd4UzJRU0Y5T3crU0c0SVloM0hDWE5WeFBOc2JLaU9j?=
 =?utf-8?Q?QaUW7xeEh3Sj9U3Q=3D?=
X-Exchange-RoutingPolicyChecked: fuN4Uh16ak3hBHNLEWJAfNJSB4AiIb/RgnNbLYbn/TAsnG6JnxWLHoqbOjrufHHJsUo0l8OyS/LPo29m3nBr+3J3KqvOm4EiZBLhTq1m5e2Cd90/NfMSxm83+fLQtJyCsmQ9c5CGV0g7X9QHyQYnUyQC9EDDrZQUEZ2Ih4/KjxW+xFfNzTZY86c9LGLMqiZVXfHKzIPiaSTaCHadMiCzapJEzNApjnrnSKC8yv2QWAu5jD6Oa+YKtSwmrBjwonRR6iCghWSrl/vpjs+f450q0q/zaAvsxjT7tP6zVfyuaqpC6YxIJVqqvZYgNQXS/OSMHRnVjX1z6OkeOYl/iJVGWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3840018c-bd42-4086-57d1-08deb5327844
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 23:09:10.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luzjZWYSk+0dDxBf75N65h+lj7GnmDzaRcs10+Wlq0BY0tYyrPX3YAKxaVaT12YnUIQSId0XVf/nJ6JT2oUmnN7a6IlFFC/rgdjnlXvGd4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9966
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



On 2/25/26 8:28 PM, Matthew Brost wrote:
> Enable page faults to be serviced while holding vm->lock in read mode.
> 
> Introduce additional locks to:
>   - Ensure only one page fault thread services a given range or VMA
>   - Serialize SVM garbage collection
>   - Protect SVM range insertion and removal
> 
> While these locks may contend during page faults, expensive operations
> like migration can now run in parallel within a single VM.
> 
> In addition to new locking, ranges must be reference-counted after
> lookup, as another thread could immediately remove them from the GPU SVM
> tree, potentially dropping the last reference.
> 
> Lastly, decouple the VM’s ASID from the page fault queue selection to
> allow parallel page fault handling within the same VM.
> 
> Lays the groundwork for prefetch IOCTLs to use threaded migration too.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c         |   2 +-
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>   drivers/gpu/drm/xe/xe_pagefault.c    | 100 +++++++++++++++------------
>   drivers/gpu/drm/xe/xe_svm.c          |  92 +++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_svm.h          |  44 ++++++++++++
>   drivers/gpu/drm/xe/xe_userptr.c      |  20 +++++-
>   drivers/gpu/drm/xe/xe_vm.c           |  40 +++++++++--
>   drivers/gpu/drm/xe/xe_vm_types.h     |  24 ++++++-
>   8 files changed, 243 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 35dd07297dd0..c71dba009d32 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1624,7 +1624,7 @@ void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>   			    const struct drm_gpusvm_ctx *ctx)
>   {
>   	if (ctx->in_notifier)
> -		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +		lockdep_assert_held(&gpusvm->notifier_lock);
>   	else
>   		drm_gpusvm_notifier_lock(gpusvm);
> 
unrelated to the overall logic of this patch, but I have a question 
regarding;
In scenarios where the `drm_gpusvm_unmap_pages()` function is called, 
are there any cases where `ctx->in_notifier` is false?
If `ctx->in_notifier` is always true, would it be possible to remove the 
`in_notifier` field from `struct drm_gpusvm_ctx`?

Is there a reason why the code doesn't explicitly require the use of the 
`drm_gpusvm_notifier_lock()` and `drm_gpusvm_notifier_unlock()` pair in 
the places where `drm_gpusvm_unmap_pages()` is called?

Apart from the questions above, the changes in this patch look good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f3ef836541e..1eb0fe118940 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -304,6 +304,8 @@ struct xe_device {
>   		struct xarray asid_to_vm;
>   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>   		u32 next_asid;
> +		/** @usm.current_pf_queue: current page fault queue */
> +		u32 current_pf_queue;
>   		/** @usm.lock: protects UM state */
>   		struct rw_semaphore lock;
>   		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index ea4857acf28d..421262c2a63a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -71,9 +71,9 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   	struct xe_validation_ctx ctx;
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> -	int err, needs_vram;
> +	int err = 0, needs_vram;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>   
>   	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>   	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
> @@ -85,50 +85,52 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   
>   	trace_xe_vma_pagefault(vma);
>   
> +	guard(mutex)(&vma->fault_lock);
> +
>   	/* Check if VMA is valid, opportunistic check only */
>   	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
>   					vma->tile_invalidated) && !atomic)
>   		return 0;
>   
> -retry_userptr:
> -	if (xe_vma_is_userptr(vma) &&
> -	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> -		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +	do {
> +		if (xe_vma_is_userptr(vma) &&
> +		    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> +			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>   
> -		err = xe_vma_userptr_pin_pages(uvma);
> -		if (err)
> -			return err;
> -	}
> +			err = xe_vma_userptr_pin_pages(uvma);
> +			if (err)
> +				return err;
> +		}
>   
> -	/* Lock VM and BOs dma-resv */
> -	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> -	drm_exec_until_all_locked(&exec) {
> -		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
> -					 needs_vram == 1);
> -		drm_exec_retry_on_contention(&exec);
> -		xe_validation_retry_on_oom(&ctx, &err);
> -		if (err)
> -			goto unlock_dma_resv;
> -
> -		/* Bind VMA only to the GT that has faulted */
> -		trace_xe_vma_pf_bind(vma);
> -		xe_vm_set_validation_exec(vm, &exec);
> -		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> -		xe_vm_set_validation_exec(vm, NULL);
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> +		/* Lock VM and BOs dma-resv */
> +		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
> +				       (struct xe_val_flags) {});
> +		drm_exec_until_all_locked(&exec) {
> +			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
> +						 needs_vram == 1);
> +			drm_exec_retry_on_contention(&exec);
>   			xe_validation_retry_on_oom(&ctx, &err);
> -			goto unlock_dma_resv;
> +			if (err)
> +				break;
> +
> +			/* Bind VMA only to the GT that has faulted */
> +			trace_xe_vma_pf_bind(vma);
> +			xe_vm_set_validation_exec(vm, &exec);
> +			fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> +			xe_vm_set_validation_exec(vm, NULL);
> +			if (IS_ERR(fence)) {
> +				err = PTR_ERR(fence);
> +				xe_validation_retry_on_oom(&ctx, &err);
> +				break;
> +			}
>   		}
> -	}
> +		xe_validation_ctx_fini(&ctx);
> +	} while (err == -EAGAIN);
>   
> -	dma_fence_wait(fence, false);
> -	dma_fence_put(fence);
> -
> -unlock_dma_resv:
> -	xe_validation_ctx_fini(&ctx);
> -	if (err == -EAGAIN)
> -		goto retry_userptr;
> +	if (!err) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}
>   
>   	return err;
>   }
> @@ -171,10 +173,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> -	/*
> -	 * TODO: Change to read lock? Using write lock for simplicity.
> -	 */
> -	down_write(&vm->lock);
> +	down_read(&vm->lock);
>   
>   	if (xe_vm_is_closed(vm)) {
>   		err = -ENOENT;
> @@ -198,7 +197,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   unlock_vm:
>   	if (!err)
>   		vm->usm.last_fault_vma = vma;
> -	up_write(&vm->lock);
> +	up_read(&vm->lock);
>   	xe_vm_put(vm);
>   
>   	return err;
> @@ -418,6 +417,19 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
>   		xe_pagefault_entry_size();
>   }
>   
> +/*
> + * This function can race with multiple page fault producers, but worst case we
> + * stick a page fault on the same queue for consumption.
> + */
> +static int xe_pagefault_queue_index(struct xe_device *xe)
> +{
> +	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
> +
> +	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
> +
> +	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
> +}
> +
>   /**
>    * xe_pagefault_handler() - Page fault handler
>    * @xe: xe device instance
> @@ -430,8 +442,8 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
>    */
>   int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   {
> -	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
> -		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +	int queue_index = xe_pagefault_queue_index(xe);
> +	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
>   	unsigned long flags;
>   	bool full;
>   
> @@ -445,7 +457,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   	} else {
>   		drm_warn(&xe->drm,
>   			 "PageFault Queue (%d) full, shouldn't be possible\n",
> -			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +			 queue_index);
>   	}
>   	spin_unlock_irqrestore(&pf_queue->lock, flags);
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 002b6c22ad3f..3e59695e0c01 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -114,6 +114,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>   		return NULL;
>   
>   	INIT_LIST_HEAD(&range->garbage_collector_link);
> +	mutex_init(&range->lock);
>   	xe_vm_get(gpusvm_to_vm(gpusvm));
>   
>   	return &range->base;
> @@ -121,6 +122,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>   
>   static void xe_svm_range_free(struct drm_gpusvm_range *range)
>   {
> +	mutex_destroy(&to_xe_range(range)->lock);
>   	xe_vm_put(range_to_vm(range));
>   	kfree(range);
>   }
> @@ -135,11 +137,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>   
>   	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
>   
> -	spin_lock(&vm->svm.garbage_collector.lock);
> +	spin_lock(&vm->svm.garbage_collector.list_lock);
>   	if (list_empty(&range->garbage_collector_link))
>   		list_add_tail(&range->garbage_collector_link,
>   			      &vm->svm.garbage_collector.range_list);
> -	spin_unlock(&vm->svm.garbage_collector.lock);
> +	spin_unlock(&vm->svm.garbage_collector.list_lock);
>   
>   	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
>   }
> @@ -297,16 +299,24 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>   {
>   	struct dma_fence *fence;
>   
> -	range_debug(range, "GARBAGE COLLECTOR");
> +	scoped_guard(mutex, &range->lock) {
> +		drm_gpusvm_range_get(&range->base);
> +		range->removed = true;
>   
> -	xe_vm_lock(vm, false);
> -	fence = xe_vm_range_unbind(vm, range);
> -	xe_vm_unlock(vm);
> -	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> -	dma_fence_put(fence);
> +		range_debug(range, "GARBAGE COLLECTOR");
> +
> +		xe_vm_lock(vm, false);
> +		fence = xe_vm_range_unbind(vm, range);
> +		xe_vm_unlock(vm);
> +		if (IS_ERR(fence))
> +			return PTR_ERR(fence);
> +		dma_fence_put(fence);
>   
> -	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> +		scoped_guard(mutex, &vm->svm.range_lock)
> +			drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> +	}
> +
> +	drm_gpusvm_range_put(&range->base);
>   
>   	return 0;
>   }
> @@ -378,13 +388,15 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>   	u64 range_end;
>   	int err, ret = 0;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>   
>   	if (xe_vm_is_closed_or_banned(vm))
>   		return -ENOENT;
>   
> +	guard(mutex)(&vm->svm.garbage_collector.lock);
> +
>   	for (;;) {
> -		spin_lock(&vm->svm.garbage_collector.lock);
> +		spin_lock(&vm->svm.garbage_collector.list_lock);
>   		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
>   						 typeof(*range),
>   						 garbage_collector_link);
> @@ -395,7 +407,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>   		range_end = xe_svm_range_end(range);
>   
>   		list_del(&range->garbage_collector_link);
> -		spin_unlock(&vm->svm.garbage_collector.lock);
> +		spin_unlock(&vm->svm.garbage_collector.list_lock);
>   
>   		err = __xe_svm_garbage_collector(vm, range);
>   		if (err) {
> @@ -414,7 +426,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>   				return err;
>   		}
>   	}
> -	spin_unlock(&vm->svm.garbage_collector.lock);
> +	spin_unlock(&vm->svm.garbage_collector.list_lock);
>   
>   	return ret;
>   }
> @@ -424,9 +436,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>   	struct xe_vm *vm = container_of(w, struct xe_vm,
>   					svm.garbage_collector.work);
>   
> -	down_write(&vm->lock);
> +	guard(rwsem_read)(&vm->lock);
>   	xe_svm_garbage_collector(vm);
> -	up_write(&vm->lock);
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> @@ -855,8 +866,11 @@ int xe_svm_init(struct xe_vm *vm)
>   {
>   	int err;
>   
> +	mutex_init(&vm->svm.range_lock);
> +	mutex_init(&vm->svm.garbage_collector.lock);
> +
>   	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
> -		spin_lock_init(&vm->svm.garbage_collector.lock);
> +		spin_lock_init(&vm->svm.garbage_collector.list_lock);
>   		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
>   		INIT_WORK(&vm->svm.garbage_collector.work,
>   			  xe_svm_garbage_collector_work_func);
> @@ -878,7 +892,7 @@ int xe_svm_init(struct xe_vm *vm)
>   				      xe_modparam.svm_notifier_size * SZ_1M,
>   				      &gpusvm_ops, fault_chunk_sizes,
>   				      ARRAY_SIZE(fault_chunk_sizes));
> -		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->svm.range_lock);
>   
>   		if (err) {
>   			xe_svm_put_pagemaps(vm);
> @@ -918,7 +932,10 @@ void xe_svm_fini(struct xe_vm *vm)
>   {
>   	xe_assert(vm->xe, xe_vm_is_closed(vm));
>   
> -	drm_gpusvm_fini(&vm->svm.gpusvm);
> +	scoped_guard(mutex, &vm->svm.range_lock)
> +		drm_gpusvm_fini(&vm->svm.gpusvm);
> +	mutex_destroy(&vm->svm.range_lock);
> +	mutex_destroy(&vm->svm.garbage_collector.lock);
>   }
>   
>   static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
> @@ -1198,20 +1215,26 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	};
>   	struct xe_validation_ctx vctx;
>   	struct drm_exec exec;
> -	struct xe_svm_range *range;
> +	struct xe_svm_range *range = NULL;
>   	struct dma_fence *fence;
>   	struct drm_pagemap *dpagemap;
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>   	ktime_t start = xe_gt_stats_ktime_get(), bind_start, get_pages_start;
> -	int err;
> +	int err = 0;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>   
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>   
>   retry:
> +	/* Release old range */
> +	if (range) {
> +		mutex_unlock(&range->lock);
> +		drm_gpusvm_range_put(&range->base);
> +	}
> +
>   	/* Always process UNMAPs first so view SVM ranges is current */
>   	err = xe_svm_garbage_collector(vm);
>   	if (err)
> @@ -1227,6 +1250,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   	xe_svm_range_fault_count_stats_incr(gt, range);
>   
> +	mutex_lock(&range->lock);
> +
> +	if (xe_svm_range_is_removed(range))
> +		goto retry;
> +
>   	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
>   		err = -EACCES;
>   		goto out;
> @@ -1268,7 +1296,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   				drm_err(&vm->xe->drm,
>   					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
>   					vm->usm.asid, ERR_PTR(err));
> -				return err;
> +				goto err_out;
>   			}
>   		}
>   	}
> @@ -1330,6 +1358,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   out:
>   	xe_svm_range_fault_us_stats_incr(gt, range, start);
> +	mutex_unlock(&range->lock);
> +	drm_gpusvm_range_put(&range->base);
>   	return 0;
>   
>   err_out:
> @@ -1339,6 +1369,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		goto retry;
>   	}
>   
> +	mutex_unlock(&range->lock);
> +	drm_gpusvm_range_put(&range->base);
> +
>   	return err;
>   }
>   
> @@ -1421,9 +1454,9 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>   				drm_gpusvm_range_get(range);
>   				__xe_svm_garbage_collector(vm, to_xe_range(range));
>   				if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
> -					spin_lock(&vm->svm.garbage_collector.lock);
> +					spin_lock(&vm->svm.garbage_collector.list_lock);
>   					list_del(&to_xe_range(range)->garbage_collector_link);
> -					spin_unlock(&vm->svm.garbage_collector.lock);
> +					spin_unlock(&vm->svm.garbage_collector.list_lock);
>   				}
>   				drm_gpusvm_range_put(range);
>   			}
> @@ -1453,7 +1486,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>    * @ctx: GPU SVM context
>    *
>    * This function finds or inserts a newly allocated a SVM range based on the
> - * address.
> + * address. Take a reference to SVM range on success.
>    *
>    * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
>    */
> @@ -1462,11 +1495,15 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>   {
>   	struct drm_gpusvm_range *r;
>   
> +	guard(mutex)(&vm->svm.range_lock);
> +
>   	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
>   					    xe_vma_start(vma), xe_vma_end(vma), ctx);
>   	if (IS_ERR(r))
>   		return ERR_CAST(r);
>   
> +	drm_gpusvm_range_get(r);
> +
>   	return to_xe_range(r);
>   }
>   
> @@ -1486,6 +1523,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>   {
>   	int err = 0;
>   
> +	lockdep_assert_held(&range->lock);
> +
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
>   	if (err == -EOPNOTSUPP) {
>   		range_debug(range, "PAGE FAULT - EVICT PAGES");
> @@ -1602,6 +1641,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>   	int err, retries = 1;
>   	bool write_locked = false;
>   
> +	lockdep_assert_held(&range->lock);
>   	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>   	range_debug(range, "ALLOCATE VRAM");
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b7b8eeacf196..fd26bfeb4a07 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -36,6 +36,13 @@ struct xe_svm_range {
>   	 * list. Protected by VM's garbage collect lock.
>   	 */
>   	struct list_head garbage_collector_link;
> +	/**
> +	 * @lock: Protects fault handler, garbage collector, and prefetch
> +	 * critical sections, ensuring only one thread operates on a range at a
> +	 * time. Locking order: inside vm->lock and garbage collector, outside
> +	 * dma-resv locks, vm->svm.range_lock.
> +	 */
> +	struct mutex lock;
>   	/**
>   	 * @tile_present: Tile mask of binding is present for this range.
>   	 * Protected by GPU SVM notifier lock.
> @@ -46,8 +53,22 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> +	/**
> +	 * @removed: Range has been removed from GPU SVM tree, protected by
> +	 * @lock.
> +	 */
> +	bool removed;
>   };
>   
> +/**
> + * xe_svm_range_put() - SVM range put
> + * @range: SVM range
> + */
> +static inline void xe_svm_range_put(struct xe_svm_range *range)
> +{
> +	drm_gpusvm_range_put(&range->base);
> +}
> +
>   /**
>    * struct xe_pagemap - Manages xe device_private memory for SVM.
>    * @pagemap: The struct dev_pagemap providing the struct pages.
> @@ -135,6 +156,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>   	return range->base.pages.flags.has_dma_mapping;
>   }
>   
> +/**
> + * xe_svm_range_is_removed() - SVM range is removed from GPU SVM tree
> + * @range: SVM range
> + *
> + * Return: True if SVM range is removed from GPU SVM tree, False otherwise
> + */
> +static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
> +{
> +	lockdep_assert_held(&range->lock);
> +
> +	return range->removed;
> +}
> +
>   /**
>    * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
>    * @r: Pointer to the drm_gpusvm_range structure
> @@ -214,10 +248,15 @@ struct xe_svm_range {
>   			const struct drm_pagemap_addr *dma_addr;
>   		} pages;
>   	} base;
> +	struct mutex lock;
>   	u32 tile_present;
>   	u32 tile_invalidated;
>   };
>   
> +static inline void xe_svm_range_put(struct xe_svm_range *range)
> +{
> +}
> +
>   static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>   {
>   	return false;
> @@ -387,6 +426,11 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
>   	return ERR_PTR(-ENOENT);
>   }
>   
> +static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
> +{
> +	return false;
> +}
> +
>   #define xe_svm_range_has_dma_mapping(...) false
>   #endif /* CONFIG_DRM_XE_GPUSVM */
>   
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index e120323c43bc..bf6043de1b8e 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -48,6 +48,22 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>   		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>   }
>   
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +static bool __xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_vma *vma = &uvma->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
> +	return lockdep_is_held_type(&vm->lock, 0) ||
> +		(lockdep_is_held_type(&vm->lock, 1) &&
> +		 lockdep_is_held_type(&vma->fault_lock, 0));
> +}
> +#define xe_vma_userptr_lockdep(uvma)	\
> +	lockdep_assert(__xe_vma_userptr_lockdep(uvma))
> +#else
> +#define xe_vma_userptr_lockdep(uvma)
> +#endif
> +
>   int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>   {
>   	struct xe_vma *vma = &uvma->vma;
> @@ -59,7 +75,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>   		.allow_mixed = true,
>   	};
>   
> -	lockdep_assert_held(&vm->lock);
> +	xe_vma_userptr_lockdep(uvma);
>   	xe_assert(xe, xe_vma_is_userptr(vma));
>   
>   	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> @@ -167,7 +183,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>   	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>   
>   	/* Protect against concurrent userptr pinning */
> -	lockdep_assert_held(&vm->lock);
> +	xe_vma_userptr_lockdep(uvma);
>   	/* Protect against concurrent notifiers */
>   	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 548b0769b3ef..3332a86f464f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -597,6 +597,17 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>   }
>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>   
> +static void xe_vma_svm_prefetch_ranges_fini(struct xe_vma_op *op)
> +{
> +	struct xe_svm_range *svm_range;
> +	unsigned long i;
> +
> +	xa_for_each(&op->prefetch_range.range, i, svm_range)
> +		xe_svm_range_put(svm_range);
> +
> +	xa_destroy(&op->prefetch_range.range);
> +}
> +
>   static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
>   {
>   	struct xe_vma *vma;
> @@ -604,7 +615,7 @@ static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
>   	vma = gpuva_to_vma(op->base.prefetch.va);
>   
>   	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
> -		xa_destroy(&op->prefetch_range.range);
> +		xe_vma_svm_prefetch_ranges_fini(op);
>   }
>   
>   static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
> @@ -838,6 +849,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>   	u8 id;
>   	int err;
>   
> +	lockdep_assert_held(&range->lock);
>   	lockdep_assert_held(&vm->lock);
>   	xe_vm_assert_held(vm);
>   	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> @@ -920,6 +932,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>   	u8 id;
>   	int err;
>   
> +	lockdep_assert_held(&range->lock);
>   	lockdep_assert_held(&vm->lock);
>   	xe_vm_assert_held(vm);
>   	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> @@ -1023,6 +1036,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   			vma->gpuva.gem.obj = &bo->ttm.base;
>   	}
>   
> +	mutex_init(&vma->fault_lock);
> +
>   	INIT_LIST_HEAD(&vma->combined_links.rebind);
>   
>   	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
> @@ -1095,6 +1110,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>   		xe_bo_put(xe_vma_bo(vma));
>   	}
>   
> +	mutex_destroy(&vma->fault_lock);
>   	xe_vma_free(vma);
>   }
>   
> @@ -1115,11 +1131,18 @@ static void vma_destroy_cb(struct dma_fence *fence,
>   	queue_work(system_dfl_wq, &vma->destroy_work);
>   }
>   
> +static void xe_vm_assert_write_mode_or_garbage_collector(struct xe_vm *vm)
> +{
> +	lockdep_assert(lockdep_is_held_type(&vm->lock, 0) ||
> +		       (lockdep_is_held_type(&vm->lock, 1) &&
> +			lockdep_is_held_type(&vm->svm.garbage_collector.lock, 0)));
> +}
> +
>   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   {
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	xe_vm_assert_write_mode_or_garbage_collector(vm);
>   	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>   
>   	if (xe_vma_is_userptr(vma)) {
> @@ -2462,7 +2485,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   	struct xe_vma *vma;
>   	int err = 0;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	xe_vm_assert_write_mode_or_garbage_collector(vm);
>   
>   	if (bo) {
>   		err = 0;
> @@ -2559,7 +2582,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>   {
>   	int err = 0;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	xe_vm_assert_write_mode_or_garbage_collector(vm);
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> @@ -2650,7 +2673,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   	u8 id, tile_mask = 0;
>   	int err = 0;
>   
> -	lockdep_assert_held_write(&vm->lock);
> +	xe_vm_assert_write_mode_or_garbage_collector(vm);
>   
>   	for_each_tile(tile, vm->xe, id)
>   		tile_mask |= 0x1 << id;
> @@ -2826,7 +2849,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>   			     bool post_commit, bool prev_post_commit,
>   			     bool next_post_commit)
>   {
> -	lockdep_assert_held_write(&vm->lock);
> +	xe_vm_assert_write_mode_or_garbage_collector(vm);
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> @@ -2956,6 +2979,11 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>   
>   	/* TODO: Threading the migration */
>   	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		guard(mutex)(&svm_range->lock);
> +
> +		if (xe_svm_range_is_removed(svm_range))
> +			return -ENODATA;
> +
>   		if (!dpagemap)
>   			xe_svm_range_migrate_to_smem(vm, svm_range);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1f6f7e30e751..9c91934ec47f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -119,6 +119,12 @@ struct xe_vma {
>   		struct work_struct destroy_work;
>   	};
>   
> +	/**
> +	 * @fault_lock: Synchronizes fault processing. Locking order: inside
> +	 * vm->lock, outside dma-resv.
> +	 */
> +	struct mutex fault_lock;
> +
>   	/**
>   	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
>   	 * protected by BO's resv and for userptrs, vm->svm.gpusvm.notifier_lock in
> @@ -183,13 +189,27 @@ struct xe_vm {
>   	struct {
>   		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
>   		struct drm_gpusvm gpusvm;
> +		/**
> +		 * @svm.range_lock: Protects insertion and removal of ranges
> +		 * from GPU SVM tree.
> +		 */
> +		struct mutex range_lock;
>   		/**
>   		 * @svm.garbage_collector: Garbage collector which is used unmap
>   		 * SVM range's GPU bindings and destroy the ranges.
>   		 */
>   		struct {
> -			/** @svm.garbage_collector.lock: Protect's range list */
> -			spinlock_t lock;
> +			/**
> +			 * @svm.garbage_collector.lock: Ensures only one thread
> +			 * runs the garbage collector at a time. Locking order:
> +			 * inside vm->lock, outside range->lock and dma-resv.
> +			 */
> +			struct mutex lock;
> +			/**
> +			 * @svm.garbage_collector.list_lock: Protect's range
> +			 * list
> +			 */
> +			spinlock_t list_lock;
>   			/**
>   			 * @svm.garbage_collector.range_list: List of SVM ranges
>   			 * in the garbage collector.

