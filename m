Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6756FCD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 20:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC1E10E8B3;
	Mon, 11 May 2026 20:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp12gnL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5110810E8B3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778532102; x=1810068102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wRmxxwCkO+Os5vgZJSFxvZvo9+sHdRddhyN/uKtnkdU=;
 b=Kp12gnL+AL25fpoZYp4q0W4m7ULUx++drkUJQ76OJ5QZPoknsFVboCR2
 NJDP089485rychVsqeksVYuMTF95Syo7OsUnrbjF5Hw/NM4JdQGss/+rF
 A3BvkZFoTFP6YleJXAEIezO46U2hPgPLCBJo32G6bXm9uPXq+AtcX2F+i
 94jPCCIh/a/CxMPswr3ymuGEEFv9W1oAqlrXlNtbWO8ikgojhiFjFzLsL
 rTOYvXpMSONIok0aQ1FY6E57tA3Rd7oV3GlB7tFiUfNeEe62Sd7jabLZe
 +85ki67mWwaM50UMsBMYGRFCJNnLcYse6gPRWUbfCWWBHDTHS71GPs3q7 g==;
X-CSE-ConnectionGUID: 18TrfFJKQ6K6xTwI6Pk/tg==
X-CSE-MsgGUID: GkpxSvLbRgGwgx9PDEE49Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90132207"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90132207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:41:41 -0700
X-CSE-ConnectionGUID: MqUHbEzCRQKkCES01DPwyQ==
X-CSE-MsgGUID: NFjaIQy0RimE2ObXDAxgUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236582341"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:41:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:41:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 13:41:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIaJz/Ph3EkanrxhZVeDEA2RAJHDugLux8C0ua1iklDmwSe1g85F9dxC0agYL3GiB7BYcGJSAkR4R45C79DFmmIawif1AY2p27ib3JK/9NZdpBaltgBXgkPqNRrJ7L72q8sVxjrJ6GCr7tkek+y5vJGip7pMYovBfFA04DASjLa6L278eSPq7r2DpQvaxZdqtTTNQb66dhU86q/tMpWSlAnOJXPafq/pgHH5wNfckTxYKiGQJbMC68NS7QRjfQdol3H6Odq0nvYif4WVsJEKzgU77nXxzCJxPTjtalJ88hbSFEJdH7e1P/ZAnlLzOlgrtp3gvKSXWtomWdIq+912ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pogumM7eO7QevP8uDrVsgt6COtEs0ID5krFRmiZl8NE=;
 b=SzAud/VRudbPN3qjwGY8gNS7L1KW4OB/Vd3y3CNr73GPqh+2BeiNnFpo/SmLR/ms1Weg0QLLzHu8EXFB5ynvTN04+vT1WSxjJG/uPn3KCA0KQCJ/XcsZ6JSrbroEWAM2LW6Op3HI1nB+thWhLE4B212e3FI4cG0ShsiDDat2QpE2XjKOdoK2LwSnGRVABqBzChqe4xmSuOCPVw8OG2yAOnvDsv8gYTxuc11z3HllRPRWtT5VK5klQB9hPT6VIVNXJafmRzuBCGWrDAiIm94lJosIntg5iLHmdInVMPJcfjNn0i8UAVBaOwToai3v19iFGrXtHnqX3fULsnXsGYIWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Mon, 11 May
 2026 20:41:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 20:41:37 +0000
Date: Mon, 11 May 2026 13:41:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/oa: Add val arg to xe_oa_is_valid_config_reg
Message-ID: <agI+/b71gVUNYd2G@soc-5CG1426VCC.clients.intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
 <20260430161459.2892545-4-ashutosh.dixit@intel.com>
 <agIgkARQniVfvmSd@soc-5CG1426VCC.clients.intel.com>
 <87se7xydof.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87se7xydof.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:303:8d::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 90100d11-1f44-491f-1d39-08deaf9db291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: J6JUcLMdQLZ7O5ESnsHL4+Ut1UL9JgAoo6PeRDiKz8Mz+/P9+EG8V5FrMjJI2Y8iMdiF/VrBTj+MgF+4VC9KNv775xHBx+XdqI16NnttfoH3IxDLrHgH1kNe00DrNI+tRoJnh4ySEW/6eUmTWghXD1ONMDsCKRYd1Xv3Q5mF+kbxAJoEMVRUJmhdy0KzhzNVcyLHmBmg86FMawJozvAR0/qb1oI11MW7HqU61nj5gH7qud+tAMBEyu8PSXH5uqRenBXAXXZ4Ynhp8zdNz/+UcTXm1OVIVmR4y8Fl2nFrzf+u+RBQHmEh0jFvSt7PUt4bBpain63MqeNYySbUEitc4zUXHjjpsjyD76tfh/xFwGZvHPADKSJwZ/arQNDDOzl2Pmeek8d7i7T2VaKiSUFTes2DLxn5Vpl0Aig/qiopv1C+6pXnWxLDtXEXYDTQs7OcWf5ZRuAZopApv4iJn+u2vBybcgHzWb/fpj7c/T2+QqPWwV9YYNv+7TqsxDVzb1x+F/yaFSNJQfppAkm2t/bq50IpsAJ5ZiwU7HwWmTL2EgY9+AxcCgxgKEvS85pAh7TEBHMWTWEo7QSTZAyutLDSHb+0Agl6J94NTQKZHh4AqNeLghxac+8dUErmrwb40kRjil5P1F9wXHgjX56fflqYhrLscxZnIQSYECqFzwFHWy9HLPEslavkKeiJ3BES0nB3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(11063799003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2daVWJveU9mRzZGY21oYk1YMTI0ZEszYm1XcWdGbkNhdzRHZ2JCNW91UlVC?=
 =?utf-8?B?dHV6b01WM0J1bUQwN3ZpYnAzTURVZDZlamJLVzF6U3k3VFhSOUZoMm1WRnNn?=
 =?utf-8?B?WnBuL3gyVmJJZi9rN0tiTHE0REQrekl0clk3M3h6OHpZcnVkVVlnKzUrcWNX?=
 =?utf-8?B?amFndUFMNGpqMmppejJxQVVnM0djSXBpRTN3ZjgwemRIRmdXMzI3SEpnanZI?=
 =?utf-8?B?RmdGb3Z3YjA1dFJDWVR1aEZ1VDRsQVplY2RIMTFsQlM3UzQxVGdXZ2ZBL0RW?=
 =?utf-8?B?Z2lLcWZsR3BxcUxLTWZ2aTl0anhiK3RYbWJ4RzVCOFRkNnp1SHgxd3lsWE9u?=
 =?utf-8?B?NFVrcnRKM0Nud0VGY3BTelRyUGp4NHVQUE9oUldVLzh5dXJRUk03Z3ljc3RO?=
 =?utf-8?B?UEd3d1RHNXpQY1l2YVJXNzAyd3VVeUdSbzFOSTU5dFhZTi9BMUxJWVplOTI1?=
 =?utf-8?B?RVdNZWV0QkhRVFpIYzNxOVFnc25zaGIvWEFxUllDSG80WERMRjJseHhLcUpn?=
 =?utf-8?B?QllVM0s5ODdjenRxUDV0NGFNMmR5WXpQSVhsdzlpNFNjc0l1T0U3eWxYbFNU?=
 =?utf-8?B?VjFyanFKWmJXNVlnS0Q4dDVxRVN4UnhHazdVcU4rWWo1b3M1T2gvOHBVQmxF?=
 =?utf-8?B?OUNHUWZtMVQxUFdHUzFObnh0UlgrVTBrNUwwdDU2UUNvYTUyUWs2aEFnSFdT?=
 =?utf-8?B?aC9OU3YvY1N1dU9TQnFlQjhLUEV6YmVjRG1XRHZyZGhSa280L3dRZGNsR1Jn?=
 =?utf-8?B?UkRPQUlMdm9GODNnWVNnY3ZSbndmazdPdXVCQnVGOUQrb3d5M2FodDZHZDZV?=
 =?utf-8?B?Yjk5c1Z2VnFrbTJYaVhjNlhabjgyLzNhVlFCbmxOaTkxVm5MSVJkZ0grOXQx?=
 =?utf-8?B?UUp1M01pb05nNWJhYlNmR1Bld1VlQnEwcE9malBHcnBveTR1bkUwdEh5cnVv?=
 =?utf-8?B?WFEyTTBqenlXOGpJUnVJQnhnOHQ5ckN4VS9lZmxhZzNYNDBGdDdhVjd4RVdT?=
 =?utf-8?B?RFRhYWtBTDN0Z0o4d0MwYXZzVUQrUXYrdy95V2EwM0FTMjgveVYrc0hUaDk2?=
 =?utf-8?B?NXJydlQ3V2FWcVFNcXZ1TXNnMHRUdTBQYUM1cmgrSjJoekplSmljWDR1cXov?=
 =?utf-8?B?V1M5U1lkK3RURy82b1BVdDdzZWlCYVRqYU85c0dYeDVWd3g0aURnSGhieEVP?=
 =?utf-8?B?NWJFOXpQb2VjZVVoV1JBUDcycUVmUEIwYzA1MVNXenRPdzFrSENHSjNPYm41?=
 =?utf-8?B?aHlOWjlGY3kzSlhNTk12NGJMQksxYm03eTVSdENobUg1TStsYnZMdGJKalFx?=
 =?utf-8?B?SW42UDI4bXMzVWhnSG1nVVJuYWEra1ZYQXk0WFZPbVdTNTREdzgyaG5IU3JP?=
 =?utf-8?B?SklaT2tRZVQrejh0VXczaTJUb1ZIVVZnR1IzajhtbEZ4amFTbzBocmpjbkVE?=
 =?utf-8?B?VGdNOXhPWWdTNWhuMVdFUFZDNHFFUStOblZYYnMwcGkwRXplcEZuSW0wS1hq?=
 =?utf-8?B?b2hMODdkcmZkK3FFVzdvK1ozallreTdXckZRb2R5dEpzb0l4eUxlT3hMQXlx?=
 =?utf-8?B?dXVxU3o4bkFmM3IvdkpSZ2JoQjVwRjJ5UmVjakRwN2J2L3NManBXT282ODkx?=
 =?utf-8?B?WGxjTzB4MndCUk9DOVloWlp4NCswOXlqS3B0YXVaNkVjRUNGWExzMTJHemRp?=
 =?utf-8?B?ekkwTXdQMkw5RGJEelRzc0IxRzRhTkZ4WFVGTUh3UW00QitvdmZwMnVtR3pk?=
 =?utf-8?B?VFkzeWR4OXRHdFArVnBDS25meVFKYmpVcGVTWWpNWlZxN0g2dFRBajRqWnQ4?=
 =?utf-8?B?TllCT1czWldqYW5JS0JWSFNtMjgwZ21TY2N4djhtR28rN3h1aFZrMDFScVgv?=
 =?utf-8?B?dDgwbEh2NEVxaTlkd1RRdGtsUGMzTDBkY0tueWMwdnBCY0NtK055RkdNYnd6?=
 =?utf-8?B?VlBmOXlvdEkySjJCTk00S0l1UTgyTHJZMFFaL0RHWUoyYWlyU0YwdkRCZmZC?=
 =?utf-8?B?eHA3Q1FsUHZtQm96TnFCd3BZSFRzL0V1QXNpRXkrWUxGSEp6V1ZCRm1HOHU4?=
 =?utf-8?B?SGppVmlZN0szZy9QWTliVDRYOWtWTFd4UUViK3VFSFRnTm82N05ZREdYcUhs?=
 =?utf-8?B?enRhQ1p0bTNXSTdLZmZReXFyOWIyb3JWL2Z2Nkl5Qk1oVStQMU1nb1RmMWxJ?=
 =?utf-8?B?Y3pKSXQyaHpNcnZZOGJLcDZCdkU0M20xUlZCb3J5S2ZtTUVvajVkeUYzNDR0?=
 =?utf-8?B?bkgxeTd2TWVsd3dwYldONHdhTTNwZkRlM2pDdGdGNHZiNDJXa2xJUHV4SFd2?=
 =?utf-8?B?MmZWQ0Q2TWVmYXo1dVY4WTVyVTNmclJOU1pCU0pVQUV3dFJMUFVualMydkFF?=
 =?utf-8?Q?UgrMbQo6nnp4xWx/1BrSPJbWWgMwSltmW013j?=
X-Exchange-RoutingPolicyChecked: QbD9FbXXmIhLphKDSbNMJqTqdABS5u6dk72/a214cHwIjrzBY3W5wsEPvimsfC6RfKPbjrH7hZ9gQYgtf8TyN761ykU49G7DiwZYkOyyu5RXW8PSutjaSFmWjBxywBcRO/SDS6wi+0FaACu88mV5P7QlqUQ09smAMJIVXIsnqFoxdZgQxzal+ww4iCQfMHjJqV05e2mq8BDH3PTa9/PQUX2T19pTYVg9Z8z++kTuoIZL8f/RXgl2lwB9HXXp5kGYUimQ/6vDsVEzvO76iLWYYHnT91X9wuQhxhRXj/dP60XpkDfi+lbZhTE4C+eYh26PWEskpgTfHrrGjrRC3HZsfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90100d11-1f44-491f-1d39-08deaf9db291
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 20:41:37.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD/ZU47h8sAHpwLrufiByrtFuCi+GRTO+VOiOx5B6EhKVg0Il5uw/tTT4eiLF4PmAQDdSpdTe+Nr/COWIV1irQZ3994Kqmm3oAfPDWjfvMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
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

On Mon, May 11, 2026 at 12:00:16PM -0700, Dixit, Ashutosh wrote:
>On Mon, 11 May 2026 11:31:44 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Thu, Apr 30, 2026 at 09:14:58AM -0700, Ashutosh Dixit wrote:
>> > Add val arg to xe_oa_is_valid_config_reg so that register values can also
>> > be verified, in addition to register address. Value verification is needed
>> > to implement MERTOA Wa_14026779378.
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_oa.c | 18 +++++++++---------
>> > 1 file changed, 9 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > index 13458050907ad..7e1e8a86d19c0 100644
>> > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > @@ -2249,7 +2249,7 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
>> >		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
>> > }
>> >
>> > -static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>> > +static bool xe_oa_is_valid_config_reg(struct xe_oa *oa, u32 addr, u32 val)
>> > {
>> >	return xe_oa_is_valid_flex_addr(oa, addr) ||
>> >		xe_oa_is_valid_b_counter_addr(oa, addr) ||
>>
>> But val is not being used here. Maybe we can drop it and revive it when we
>> actually know what to compare the val against?
>
>Hi Umesh, It is used in the next patch, as mentioned in the commit
>message. This patch is just to separate out the refactor from the actual wa
>(which is implemented in the next patch). Thanks.

My bad. I missed that.

Umesh
>
>> > @@ -2257,7 +2257,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>> > }
>> >
>> > static struct xe_oa_reg *
>> > -xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>> > +xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr, u32 val),
>> >		 u32 __user *regs, u32 n_regs)
>> > {
>> >	struct xe_oa_reg *oa_regs;
>> > @@ -2275,16 +2275,16 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>> >		if (err)
>> >			goto addr_err;
>> >
>> > -		if (!is_valid(oa, addr)) {
>> > -			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
>> > -			err = -EINVAL;
>> > -			goto addr_err;
>> > -		}
>> > -
>> >		err = get_user(value, regs + 1);
>> >		if (err)
>> >			goto addr_err;
>> >
>> > +		if (!is_valid(oa, addr, value)) {
>> > +			drm_dbg(&oa->xe->drm, "Invalid oa_reg addr/value: %#x %#x\n", addr, value);
>> > +			err = -EINVAL;
>> > +			goto addr_err;
>> > +		}
>> > +
>> >		oa_regs[i].addr = XE_REG(addr);
>> >		oa_regs[i].value = value;
>> >
>> > @@ -2383,7 +2383,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>> >	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>> >
>> >	oa_config->regs_len = arg->n_regs;
>> > -	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
>> > +	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg,
>> >				u64_to_user_ptr(arg->regs_ptr),
>> >				arg->n_regs);
>> >	if (IS_ERR(regs)) {
>> > --
>> > 2.54.0
>> >
