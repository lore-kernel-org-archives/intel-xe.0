Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC8CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 22:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9BB10EC2E;
	Mon, 28 Sep 2026 22:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAVjOnwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82D10EC1E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 22:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790632972; x=1822168972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjNmnmJzofxJWewoTX2A3Cqqk2KA7ZIVGsbuZVmd1uc=;
 b=KAVjOnwUbgrbhASRljXfIOpKZjV0kXVeJ/9dyRo542g0D5fCKqe8TAEz
 bmWKKcmT94s0DShUwiimyKi7EstTI3B1mml/62gp824DFodIsUNlqRNB3
 tgh3U/zBdlhUiVCQMunsVix7CHndfElKWjUUf4cjwgWswxdJLIu4RxFoB
 9W7rnqJwU54G3c8kfRy8lzy5M9BBibZnusgIg6b53DKXcTWIlMS7BWtAr
 HlmUhPeWxt/wjqui1eZ4M6sEX54TiDH5DeTkjPzwQw57FWpfFdcIfwCHK
 D7TdHBAaJpbjj3b0Er6pQhXf4GsgF5FgARrXjf7kQuK2BLFE4rmH6/Yhj A==;
X-CSE-ConnectionGUID: mmNX/atRTQy02evkM3/eeA==
X-CSE-MsgGUID: C3eGhB8KS36LnJCBfr55iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90210458"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90210458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 15:02:52 -0700
X-CSE-ConnectionGUID: rQdK45wyQdS7Zk/FSo4d1w==
X-CSE-MsgGUID: /9++Sps4RBCT9S9I9dnvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="303115880"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 15:02:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 15:02:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 15:02:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 15:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq/mQ5Ge3jS/iGW7rAtNCQkB2YsKg6etGxYwCG/GzujLReFodEOwiTKtIcsFWN5qwVt3oyAgY8xoZFLoxS3bdfFE/qTZ+J1GBPcBOMBWi7kMO8FJuKHKmZwnAAEPD8LuL2MM4Z5gR25YQAoXo2ntAmGoPdh2r1vP1hYZERE/A39lOHSc+4j/raozwORvpk54Ik1pTwcZx4Ay6Xj/hBkd+ZV4Y/nlzz0vHJnhxacZfNBSfXmgEC3lvoXW4qwg/4noRqvw4c2WN2DY7oqLXBDdwLq6OgyGutYXAf/X5BCa1gECneRW0h/FRfEEcvBxVYIyDEKztKRnbRPnFU0OSMM1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMdqZHLGr1ODavJwfKUh1uS2fQ+20Bb7ybmKhnRw6es=;
 b=bnusANjKZJrPwRLllsnRKON4BbBsNVfVx3H4l0z1USboWXMrUWkMu5AQi9mamxas4g90PF8/mcs5Rs6ZjXoMt9Zsjg1ICamfSm5K22k77V83WK/UBu9EPaait65fCSYIR7dP+4vFxY1i3G64WrAe5Bp1O5xv7Wsf/VOYUPnaSQhpa+1NtynfJmSqjZwcIddGc+KP+Ktu7UqQLkGFOlhbkjhE9zCQAbzT+IEAeP49x2FT3dfd5wsX8S/GZCHdkpcQMMP0iGz6qkJ4cS0KTD9WYDYv3G7EgoffClbVVZr7TpsbJh/+jM0HhTdkTMV2bbJNDq4h8MEyrRGesH4uon1lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA3PPFA85D72199.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:02:48 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 22:02:47 +0000
Message-ID: <802a28c0-1de3-4e6b-9a39-cd155a35bade@intel.com>
Date: Mon, 28 Sep 2026 15:02:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Implement print vfunc for page fault info
 logging
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.d.roper@intel.com>
References: <20260928183120.3788244-2-brian3.nguyen@intel.com>
 <arrT2/evj15NQc/X@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Nguyen, Brian" <brian3.nguyen@intel.com>
In-Reply-To: <arrT2/evj15NQc/X@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To SA1PR11MB8839.namprd11.prod.outlook.com
 (2603:10b6:806:467::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8839:EE_|IA3PPFA85D72199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb8c26d-97b2-4235-e4e0-08df1dac3b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Blop9VtvXO5dIH0GzALC0zhzOfXC8IXL6g5x6pXYdc+MQzTrxPs+XXlZadx0gq6D2d1J2UZovCfLgjeRx4C907Y4MccxulN+5P8hvwsWOtT/b1qoT/JYgBWh/xoe3m+PChM7Fvc98xM2jHZOtHEIwCAflhfJYMkJ5XzGvhvhsT0QUnwGCMWHj9X22dB9B9bqiLokPTPgRMjw9/E70OkhLnH+DxPetIC4r+BE12TbWZRFVxxjmtFEY+H5NzcEnOoh7A3h6SVsS2/ssQKxsmtAPEA60nu7TXxVqjL5HMBMDGfqu4cVUkmM9oFKq1Ixi7lf2llVoqE0L3mBwxAiBRXpB4UZa/VPwBtNc4DbWbQi950v7qH2MVuntuZHemFCZ9NAG4tnsUjzGExv66kPs+yYESEObedIbuvBFgrZxEchRVLweUyZqSWnZPEe8XSUgRJc7LEWi4g0UbTbnFGrLJFahD0I9ETcjQ51s50PvyVQYHVmQ2Br7IHpPKCdbnmvMVLJjiIfp5H4gDYefMARlTv+xnxOn6rpTScjg1ayIypEksME0OXJeXKQjYyfQ4saIf/tm8lLubs/48sglmbup6dk/mYNBrJvf0v6xp5BLQsqA+Qdm4mW/uNVZovcnNH05YSyyLFV6N/3JulOZTYi4z4oG/TqwC3EkNFQnXE8jMwObm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktLWFB3clpZbWMwUFdpSWFMMGxpNzloM2FwV3lLaHZYQ2Uwc1hPa2xtRzhj?=
 =?utf-8?B?SkxqRlUwdGZ1VTFEdGMrTmpGdkRVTEYva3Q1eHJuTHY1WTh0WkhuUVdzQm0x?=
 =?utf-8?B?MzVHRjIyaThxWHZCaUhPRGlZV0VVNVppazBVaWFoY3VHVVpZajVWWWZQWEc4?=
 =?utf-8?B?c2I3aGpKeWN2TXpsbllOOStnMTFDQnpsNm4xdUxIcmhFNTBXaWJjTVFqMDFh?=
 =?utf-8?B?ekxMSlRSbnFkbSs2R3FPejVzcEUweHAxOUpvTUp5UmVQbm04dHFKY3lMZzJn?=
 =?utf-8?B?K3pscHZnWjdqMkxYWEVTZUlGS0xkNU0xbDlWbHlQZWNqTG9XVFBlb0taclRL?=
 =?utf-8?B?d1I0aVhvclJrTU8yNndQeDlGeWVPK0QwdldGSDljcklPZllsdjczODlqVlRG?=
 =?utf-8?B?MzVHcDlsZlJRa29MbWJ4WGQ4eG1zTnRqcHkvTkRCeHBua1hjeGw1NXRnNW45?=
 =?utf-8?B?Y0VIajdSd083UFpkd2x0dVg5RElCL1BUbit3OC9rQTQyelIyWk5FNVM5QXlw?=
 =?utf-8?B?STFQZjh6OFNQellJTnkvWnJtcU5VRFZCOURSWWZKMW1FRExvaG83ZS9Wd2JD?=
 =?utf-8?B?SHVZeWJXUFVhN1VLRHZ2RU5PaVM4Q1dKdGpvN1E3dmIzWVdFcFFvSGVmZUw2?=
 =?utf-8?B?SW5tckoxeUlOSEV3Rm55d3A4WHgzTFZXSGhVNjFZMnp4ZXdUZUEzc2JlU0Zm?=
 =?utf-8?B?OVJ1V2diTmdRRzlNUjdOWUJTc2hteERBYVhWdE1jS2NiTENxMUdiK0cwYzZZ?=
 =?utf-8?B?c0NUNmJNRHJPT3prd3NXbDVuYjNLd1FCd2NRSDEveFdRVngxRnUyektIOHVE?=
 =?utf-8?B?OHprREpmZzRBQTJDVXpIUmdzRkNIWlhraGR2QkRvazV4Y3pIMnArN3Jnc2xK?=
 =?utf-8?B?T1JqWUtic20yQWRjRW51dmhBbGpXdlJNVkxXQ05uRndlNlluS2xzNUEyYjE0?=
 =?utf-8?B?VjZ3QUpNL1FVL1dUdmg4T0ZPWWRaOTJ4ZGRCekNWSldEeTI2YWdKUzRTdHZC?=
 =?utf-8?B?emF4WGdRSWlWMENlZ2tVdjhiSUZOdjdrQnZWNXZxdlVZSUdtbUpqaGhZeU5n?=
 =?utf-8?B?MEVlTWFxZlB2N0xlQTAwdHdUVVRuLzVxaGFlMzlIVE5BM1dyMEd6OFdvSFli?=
 =?utf-8?B?SG00WmpLTWNWSVo5UUIxQUdQS0dhenlYRXdKZjZwalZoeDVwSDJHSEI2MC9a?=
 =?utf-8?B?VDd0WDNIL0IvUjFYOGFsVFRoeGlJdEc4NGQ5Tk4xbjd3b0JyMzIzdVVJVERQ?=
 =?utf-8?B?bnFnZmxYOC9XaUlOQ29sQXY0WHpycTJvNDkveUVyQ1dnUUZjeDNNT0R2aTY3?=
 =?utf-8?B?QmdiMk1ZMVZiK255R1NQQnA5aUYyd1EwcndCcEQ0M3k4NkxRaURDWVp0MHJ3?=
 =?utf-8?B?S2dyT214c04zYmx1OFBmb1JjOUhvcEd0dUlBSks3dE8ybThUOWszSFhYcTI5?=
 =?utf-8?B?bjZMUjRqbGo5a0hWR08xbFBhbkFsSHJnREIybnRHUXNCRHVqaWlBWTltTHNR?=
 =?utf-8?B?RE5CWVZvVkxTOEczelhaeFJDV3hDeUY4M0crOVgzV25Xa1FNeWFWZnBES2FM?=
 =?utf-8?B?U052UmNMVEJSdWQ1ZzdtclVxNStRMXVXR2xPSXRSL01Zb3lDbC9sbjNyOS9X?=
 =?utf-8?B?ZldVK0trWDdKcjVjU0taU3E0bHFNQ1ZCbGZwNUd1VFJLZXg0RmVTbXB5TjNY?=
 =?utf-8?B?TFBkVnI3RmFidzVjd2JMREJUMmxRM1BMbHUzLy91NjVKQkNkMXplenJtd0Zv?=
 =?utf-8?B?UGhpRkxkTHBONWg1U2lsQ1lPQklFTEUybE4xcVU5cHEwL0ZHMkkwODVXYUlW?=
 =?utf-8?B?TlU1VTJzMXNUN3F1YlZBS0R3SXZtQUxadXd6S1plcXRFa1NmWWZ1R3ltTjlm?=
 =?utf-8?B?M1liUms2azVYenU5RVVXOVpPUzI1ZU15alhrQVBPejFDSG83cjVTUzM5Rmx0?=
 =?utf-8?B?N055dC9nb09SaHNCY3lZVFJnNWJTazF3MldvNk9uV2x6ekM2OGg3c1Zaa3JU?=
 =?utf-8?B?WnAxREhCM2crM2xzbE5RcXVXaDROM1BQbFM2dE9ZcnRwU2ZnRUs4TEp5QjY1?=
 =?utf-8?B?ZXVnQ0QvTGM0WnZ5Vys3NFNMdWtKdmxQUXNuSWloVlZMaWtXMkpZQ0o1eFph?=
 =?utf-8?B?VmFFQkw1cWgyVGFKTm14ajYrVXRGbFRvVUk5RDR0ZEFUcmkrd1BtaDVtQ00v?=
 =?utf-8?B?TVUwTU82RHRrZFVEdWE4MkdhaDZYQWNmdnVyVzlMbEdPVXlsUnUxZEJEZVhk?=
 =?utf-8?B?MFFXd0ZWVlhWRzVmS2RIWjY3NFkyNkxWcU43empmOHZ6UzdGQUpidUVnMDVH?=
 =?utf-8?B?akJscmFpR0ZnUXRERVNDQ0cxRHhhSjFKajVDdG81cVVJcFM4TkVmZz09?=
X-Exchange-RoutingPolicyChecked: TllrsWjlMDuW1+SiABYtjKnEKpPU8H9u4WYOe6d+EchOrLAc4jc73Hkbnp1srB8+hX+psGTKbNIuoIw1ML0O8FHNe0CRxNUPU4gT1RpFQHc8GOU8/5xUY1JlSDP372YKraL3ev60R/BlXS5cSd/RBZZlB6l0ABZZaSiZmsyBVuJ/oJb2camsi44Abfozl3Eo72ba0OaUnWxqE6EAjnZ1Bu0KyIU/LTpULr5p4WHikYRzEXtUYssdWVwvHNmHM+HRSDrAHcx2wSl9WcpLPGQb2uxH755AOdavGlAuGwY/pBZ5o0hCfK9gVUEeN7hJk7W7+jsxhqQ0ggphDA6WwtAOgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb8c26d-97b2-4235-e4e0-08df1dac3b4a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:02:47.8902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXwa0JhU7CVQQI/y0qqOldE/ZuCU9Cj03sSRaH5geTwcSxL4oAIph9Gt9zI1xyTqZ6j7syEoZsxqloqRUpQfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFA85D72199
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

On 9/28/2026 1:53 PM, Matthew Brost wrote:

> On Mon, Sep 28, 2026 at 06:31:21PM +0000, Brian Nguyen wrote:
>> Add a print vfunc to xe_pagefault_ops so different producer backends can
>> log specific relevant debug info while keeping the consumer layer free
>> of potential backend-specific formatting logic.
>>
>> Consumer-specific error prints are handled by passing as input into
>> the vfunc.
>>
>> v2:
>>  - Decode producer specific fields for print message. (Matthew)
>>  - Combine consumer and producer prints to one print call. (Sashiko)
>>
>> Suggested-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pagefault.c       | 33 +++----------------------
>>  drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++++
>>  3 files changed, 45 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index df237fd40551..e65e4962a26c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -4,9 +4,11 @@
>>   */
>>  
>>  #include "abi/guc_actions_abi.h"
>> +#include "xe_gt_printk.h"
>>  #include "xe_guc.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_guc_pagefault.h"
>> +#include "xe_hw_engine.h"
>>  #include "xe_pagefault.h"
>>  #include "xe_pagefault_types.h"
>>  
>> @@ -68,10 +70,40 @@ static void guc_ack_fault_end(void *private)
>>  	xe_guc_ct_unlock(&guc->ct);
>>  }
>>  
>> +static void xe_guc_pagefault_print(struct xe_pagefault *pf,
>> +				   const char *err_str)
>> +{
>> +	const u32 *msg = pf->producer.msg;
>> +	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
>> +
>> +	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
>> +		   "\tFaulted Address: 0x%08lx%08lx\n"
>> +		   "\tFaultType: %lu\n"
>> +		   "\tAccessType: %lu\n"
>> +		   "\tFaultLevel: %lu\n"
>> +		   "\tEngineClass: %u %s\n"
>> +		   "\tEngineInstance: %lu\n"
>> +		   "\tSRCID: 0x%02lx\n"
>> +		   "\tError: %s\n",
>> +		   FIELD_GET(PFD_ASID, msg[1]),
>> +		   FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3]),
>> +		   FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>> +		   PFD_VIRTUAL_ADDR_LO_SHIFT,
>> +		   FIELD_GET(PFD_FAULT_TYPE, msg[2]),
>> +		   FIELD_GET(PFD_ACCESS_TYPE, msg[2]),
>> +		   FIELD_GET(PFD_FAULT_LEVEL, msg[0]),
>> +		   engine_class,
>> +		   xe_hw_engine_class_to_str(engine_class),
>> +		   FIELD_GET(PFD_ENG_INSTANCE, msg[0]),
>> +		   FIELD_GET(PFD_SRC_ID, msg[0]),
>> +		   err_str);
>> +}
>> +
>>  static const struct xe_pagefault_ops guc_pagefault_ops = {
>>  	.ack_fault_begin = guc_ack_fault_begin,
>>  	.ack_fault = guc_ack_fault,
>>  	.ack_fault_end = guc_ack_fault_end,
>> +	.print = xe_guc_pagefault_print,
>>  };
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index f219e9e3b73e..dbf9397938df 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -13,7 +13,6 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_gt_stats.h"
>> -#include "xe_hw_engine.h"
>>  #include "xe_log.h"
>>  #include "xe_migrate.h"
>>  #include "xe_pagefault.h"
>> @@ -610,36 +609,10 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
>>  
>>  static void xe_pagefault_print(struct xe_pagefault *pf)
>>  {
>> -	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
>> -				    pf->consumer.engine_class_instance);
>> -	u64 addr = xe_pagefault_addr(pf);
>> +	enum xe_pagefault_error err = xe_pagefault_get_error(pf);
>>  
>> -	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
>> -		   "\tFaulted Address: 0x%08x%08x\n"
>> -		   "\tFaultType: %lu\n"
>> -		   "\tAccessType: %lu\n"
>> -		   "\tFaultLevel: %lu\n"
>> -		   "\tEngineClass: %d %s\n"
>> -		   "\tEngineInstance: %lu\n"
>> -		   "\tSRCID: 0x%02lx\n"
>> -		   "\tError: %s\n",
>> -		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
>> -			     pf->consumer.id),
>> -		   upper_32_bits(addr),
>> -		   lower_32_bits(addr),
>> -		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
>> -			     pf->consumer.fault_type_level),
>> -		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
>> -			     pf->consumer.access_type),
>> -		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
>> -			     pf->consumer.fault_type_level),
>> -		   engine_class,
>> -		   xe_hw_engine_class_to_str(engine_class),
>> -		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
>> -			     pf->consumer.engine_class_instance),
>> -		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
>> -			     pf->consumer.id),
>> -		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
>> +	xe_gt_assert(pf->gt, pf->producer.ops->print);
> AI reviews will likely tell you this useless as we'd NULL ptr deref
> immediate after this - I got some of those on my code for similar type
> of asserts.
>
> I'd say this is correct, so how about...
>
> if (WARN_ON_ONCE(!pf->producer.ops->print))
> 	return;
>
> pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));
>
> With this changed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Ahh, got it. Will keep that in mind and change WARN_ON_ONCE in
next patch push. Thanks for the review!

Brian


>> +	pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));
>>  }
>>  
>>  static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index 8ae6b9848bdc..ee467117afe9 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -139,6 +139,16 @@ struct xe_pagefault_ops {
>>  	 * Page fault producer ends acknowledgment from the consumer.
>>  	 */
>>  	void (*ack_fault_end)(void *private);
>> +	/**
>> +	 * @print: Print pagefault info
>> +	 * @pf: Page fault
>> +	 * @err_str: Consumer servicing error string
>> +	 *
>> +	 * Print pagefault identification fields decoded from producer,
>> +	 * along with consumer-specific @err_str prints.
>> +	 * Must be implemented by all producers.
>> +	 */
>> +	void (*print)(struct xe_pagefault *pf, const char *err_str);
>>  };
>>  
>>  /**
>> -- 
>> 2.43.0
>>
