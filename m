Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FBAC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592F110E4D8;
	Thu, 17 Sep 2026 22:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyU9LN9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A110E4D8
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789684052; x=1821220052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YvfKVrmGx5f0Bw9ZZfMWvOdlmghjnTdv7mhvv1yp1DM=;
 b=cyU9LN9bdcrJk51a2JW14KPnc38cHpamrBzfFLvLue5vUcrisE0IgrK5
 lmA+NB8YaDhVWU/xB/lUPAu0UFikpixY0EG9JoTvD1AXgzMRNnGXonfXq
 1wkmfum8HP4fbNscy2w6F2AmpYXdG8Lo5DAX3kh3e/5LLcroaIGPVKde2
 OcV88/X/smJycTckRliy9+jpCZx88iU4QrE8aDdGeD96JVMlN/Kf+XBN0
 /BagbTxJQOiYMVb9h3sGvC0qGnVJkDD4R5W4q2IB6/VzfrRKnr/GMK4Ew
 ZRaFh0EP824gBRNO2q+BPx751y7Z2NhJFm8xF/nOsxKFZ5CW0KEIYkZtF g==;
X-CSE-ConnectionGUID: 6qQU1rJtS8uiBZBmeDCH1Q==
X-CSE-MsgGUID: WO53M/FYSGqV4ksvfg0gLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101502370"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101502370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:27:28 -0700
X-CSE-ConnectionGUID: 7ptzEWvHTXu/oDiOcBovkA==
X-CSE-MsgGUID: vhlfsmzTRm64XcOjJ/uqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267820417"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:27:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 15:27:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 15:27:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 15:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AahSLO97j2H4A8tHcqrQ6tksoXuj09cKJrVTqNo8jQG9qZnz+u0B4/kzM7x6b6ulxP6dExHzuRV9TA9c6THFrS8gvU/Ojgx0UTcD+jfp9Fo5aW5hB6zWtUgePW0DMmB2mK+f7rOIc6SQLKHc19IJY2BQeEF19eriVHwNAzCeN9ndD+bn8nkhShZGo4JSno0F+iecguXFNJ5OvQRviyj4lVughSSIwaihj8RGE1kigTVxwaq0SkMFRdv6i80CMJGJ72I/FzDFzt40/JFplbMtU5TV63TEDXIs8cU6mGjnap2QVri+OzEipMOEEpVx9S5+74390JtUCqDHadnShC1skA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfxEngf6tl2MASagGuxWEMcPRWHxHEfSU/RTZqyE0AM=;
 b=kS7rqng21yU+MyLgFXuZSNhpEVEJOKXXkYcwGa41Dm++nHUWtqLyPgRXPoBd9IdSEu+8iDli4EH4Bd+GOS1PEZIf/98qjVGRtlAp1HbOGn+Np+7foICEltw3UfXlXpLDW2OMqHaRSEBrr41CkSwJmmpORHAX/f5VMNTx9qxIL/b9aPMPpC5EbD0XCeIkvsY8Q7dhBJ/0NKwMcF87RA/h805q2MedEl8N+nCABt3LI8y+zw7nR/LctqKOAkg2HxbqT9u1CKmPjR2IiufcfeIr72ThlmKkjsbsvftkv0Cs1uBcmXTdxeNPjysGUrzgEFkc+3NGF8MysQGByMw7e+nSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 22:25:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 22:25:20 +0000
Date: Thu, 17 Sep 2026 15:25:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe/guc: Report errors that cause a CT
 shutdown using SIGID
Message-ID: <aqxoyFTsdgPw66WZ@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-12-umesh.nerlige.ramappa@intel.com>
 <7e5691ad-d3ed-48e8-90b0-81ddf737a6f9@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <7e5691ad-d3ed-48e8-90b0-81ddf737a6f9@intel.com>
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: d85f8190-c1b6-4b5c-e1e6-08df150a8eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|6133799003|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LRFeAnSvXENFw0Z+hosxvhcCAY+yHumE6HnEq9GmJo7Y9E9UKfVHqw2aVVxbOBDNyyxlkNPABQGuFZyFGnbC8CjOpQd0bPqQFMpatZaoGVpWCYGV41hoh2BwXMZBK8RB9+9tb1DHdiUwqRQyetSliUpu/5w+EU3YwGKVdvSahGnPAnATDPAOVnjgXPHlhoL4DdpgDNMM5GhXKz9jP5J6QBkUrnVn9BFlt0FvdyTwTFSCjZaF7HLGjpYOVDvTADdRwv1tY/LvPHTnVsA7WENW5G8mVGbEJoukT1haVzdKs+rSUZY/RaCZPLDjwNL+2BUa84OKfBmFs751LBIFw5aMib+TkVtgxNc6IRMqX9GT8XpP+0rDsds4AbWD3hHUPjN+pjrOlH8gQhphBgneVBxaIpiZnx2I25nigxzfo1UucnoU7gFdWoJ9uAEsKo5hJ9B1Z+hrHPQUEd/t+zxMecp5+hdvwFKqDSE7zhhZymODEySfuwbII53p3pLvbneBpeG8TqTa+NbagPJSSQqnCvPgbv784ZSZCPa/ZPOu5wf13/mv8w+8Ly47cPkXxS6OER4wjZc/7v3xLQtz8/Lu4F7B/qjDb+TcDDtD4EUoREnZs5oT+XyG/+URoEDFD7YySL3thGw+inWLpsZQTBzSYncImp6ykqgQgBtg0xj8e/8p4+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(6133799003)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzE4MFp2bGpVanJoN0NsVmNRYW1KYkp5dS9HL0F1dllxcWlBNTJDUnFZOWhO?=
 =?utf-8?B?amdISUkwU0pHM25hT09pQ0x6TGZSMWRCT3JLWkUxTGYvMEVPZGQ3c0JRWWVW?=
 =?utf-8?B?c25TbzgxUjd2RDlDNTFTd281T05GemNqZ2JGWGJabjZteFBldVVQK2ZkUlRW?=
 =?utf-8?B?LzRxUzVpVjdlTUU2TFdsUHdkT3kreUVNd3BLcndheG9uOVU1cm5TN2g2Q2sw?=
 =?utf-8?B?SmV6Yk80SXE5Rm1mUGUwQ2JvU1I0Y011bFptZTRiVkJnMzN3WUlENFlxZ3h4?=
 =?utf-8?B?TlppQStBak5teExESmZFMHVjZE5ra2Q5L0FXc3VERjJSZDNrU2NoUVY2VVV4?=
 =?utf-8?B?bnU4d2hpMGpNVXhSTWt4eHIzZmFIM3ZVUnhnV2gwNkF3UjRUSUZ3VEUrN2RM?=
 =?utf-8?B?a1hndFFlQVZvS0psYVZwUzRtQVZTVmxXNGJZVW80dVVERzRVSng4ZUcxLzRH?=
 =?utf-8?B?bStrQmhNQWo2UXhvTk5uMmhRaFM0WE5LelBBWHlGSlErQXVQYXhReU9oOGFE?=
 =?utf-8?B?azdIZGI4T0tEYVZYRXFtVkhTa2hsZTljc3lLNTVNaWhoN2E4NU9WaXM1dHg5?=
 =?utf-8?B?QzRCMnd3R1VnYTFWTWszZjVRNUY2YVpYZU05TVZrWmcvaU1MczJiRXhsdU1K?=
 =?utf-8?B?Z3JnOHUxSCtSUDQxclhpK3lieVBjb2l4eE5sejhUZG5UWWoyWVY2ZEZELzNh?=
 =?utf-8?B?YVdEMFMwa05yZU0xeVJqK0ZJNThnR2djNjFQMGkzS25NWmxvcDdqeStTM2hj?=
 =?utf-8?B?UFhESmFSN1d1QjBrdWQvaFJiOXQ0T3M4a29kMXVUNG04QVplUTczQzdwQUMr?=
 =?utf-8?B?ek14MnI4ZEtBVnpERURIOEJ6L0FjTDU5ODlmV0lwYkxoZkx0REdDZDRYZ0hZ?=
 =?utf-8?B?Q3JkWjhpNkF4OVRlRm84bmZMSnY3MHF5UFNLeHkvZk52SWFQalV0OEdwR2Fx?=
 =?utf-8?B?blo0dnJ4MGpKcTR5aXBrd1FvalJ1cU56cHBlaVp2UXlTU09XWFJScitIcSt2?=
 =?utf-8?B?MGNNR0M4ZlpBQ2NFVy8yVWFTcXg4Yi9OWnEzQmY5cVBhMWViTU9qN05HL3l5?=
 =?utf-8?B?MFZKaW9DQ0Z0dy81Y3BwUjBMV2hXdzRNRUtNNlVBS3ZzTlFFd3pNY1NSL3Ax?=
 =?utf-8?B?VUd2VWhIcjZkbE4wMHRJRXJRc05hL0l5TnFPQUU1V2tjYm5ZMSs5UklnNVh6?=
 =?utf-8?B?Q21hYUVzeU11TWtwcXNIcFNHOGJsNFJPd055VEViV3VuMUhxaTBFTEkxN0Zr?=
 =?utf-8?B?OHdCNWJ4VHNwd3ROMERZVFg3U2M5Mms4MGM0OUxlRUVOVXl0bmtPSGhDeHJJ?=
 =?utf-8?B?dTQwTHI2dnYxNjVIRURkdUY4NEV3Q0JOS2FQbHh2VHBQMlRGQS9ZV1JTeFhU?=
 =?utf-8?B?bGNaRnJCbWRNd0t5MVJ0ZnE3Z2wwTlJMSy9YdVZlbVhJMDBobUxhV2RkRUFQ?=
 =?utf-8?B?cDFybmtzU3h3NnZKSkpRQlJZQkZCclR6VW9ZakhFSkcwSUxWdURkQXRnMGhj?=
 =?utf-8?B?RDdxTUxCZlIzeW8yd3BmWE9Ddng0VXpOTndZdCtHTE5QTWk0azVFYzhvRVpw?=
 =?utf-8?B?WVY5bWFYTElFRTBYWVVzSXhwQXAzZlo2anVpa1VKVk5Ta1E0RVNnaUMxTVM1?=
 =?utf-8?B?SUdnWnkwSGdwNDRwd1FaT3VkYzhjMXcrT2RyU1B6YUJHOElBZkdQeUdWQ1hi?=
 =?utf-8?B?cGJ4UXNHSGYrSW1jb21GcFI2VzNZNHZWVmVuZTBEWUJ1bkk1anU2dXlxcVJP?=
 =?utf-8?B?d2J4VFhHNDcvTktzcEMrY0htb3UxMy85WFVGbFc1MlFmbUg2cjA0Z3FVQVVo?=
 =?utf-8?B?RjVncklKS2lEOFBuSnpReXZWNmpWc09UUjgrWHQ1eW41WlRxMmQyZjBnN2t5?=
 =?utf-8?B?Zll2SWVZWHFRTnVxMXRnVzlqNTN6ZUdOS09FUnJ4OGZRNm80ZzR0QkVCZGV2?=
 =?utf-8?B?bjJVaHd4am91NEtDVHdqSlJYazhNMHVQQWllR1RGUGFYL3NIVkpLSm04enlQ?=
 =?utf-8?B?Z2MzZVJxSEQ4OFBJK0tuSVJXbzR4RUxmc2NRMVMzRTRoS0VIOGNwRFpYUi9P?=
 =?utf-8?B?UkNWemV0Z2tIMXBiUmJxd0ZpUDE0TTIycVJHQ0pzRlJwTGlSVkV4eFI5eVB2?=
 =?utf-8?B?WjNTczZmQ1FYbjQweCt0MEpTMkdXd3dmZ25jZE93V00rdUNkMm1ncS9GVjdQ?=
 =?utf-8?B?NlJlWm5YcVR5UnBrdVhORFBQa29uQlF6ZHFEUlVHQlFwS2NIZjB5d1FmbDBW?=
 =?utf-8?B?b01EMWpRalVxc2ZKU1RaU3dLUk4wVkFwdU9HOEVNeE5wN2g2MFZJb2lUeStk?=
 =?utf-8?B?YUVEbUVqTERWZUNNc2s3RUFsR0pYcDREc1RIUkdoMzdKVXd3UkRjTkZDOFBJ?=
 =?utf-8?Q?BvsNI6Zy7k4TRm9Q=3D?=
X-Exchange-RoutingPolicyChecked: Yu4owDuvcdBxwvLm7Q4F38tX3i044Dqtd6tBpcOJKeXzxgSU4HrTPPSjXQ7jRieqJf3xwVuj02fOIRAznzI5iPivKkJagGCa5zl2zAWp1CN1Je0Xo7qi//1uNiiaGCJVBPWDXxKtKh917dxOKsOlt70+l4OGjwQoA7GeEsCQudJg/U2OHCurchz4O8BLz18AOnSKui2uXgGlsxlj/sUheb9/5ero5LBult62uj2wHOXTd3I5I6jlUoDZ/QRPLHO7ut4zA8+GzyvztFgyXGsLykxNAA+q+Co1HEfVplWs076pTdkKV09+jgHAuPgeI8K3NPhy9b9ElEWaYhIHFho/tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d85f8190-c1b6-4b5c-e1e6-08df150a8eae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 22:25:20.1105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51LreYzQu7me0SqTjEEx8dJg0vxHjIHZmkwsmvgwmySOKuQ57RxGm+0WDIcZ0UDtCWacehN2bHRbZnjxGihOCqzllV0AWZEze/2nJSuDg0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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

On Tue, Sep 15, 2026 at 12:24:34PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Convert any errors that can cause the CT to be declared as dead to
>> use the xe_log_err() helper. Errors that are escalated to the callers
>> are left for the caller to report with SIGID if needed.
>> While at it, update some of the error messages to make what went wrong
>> clearer.
>>
>> v2:
>> - use different error codes and better messages (Michal)
>> v3:
>> - Drop GuC from log messages (Michal)
>> - Clean up log messages
>
>move under ---
>
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> Assisted-by: Claude:claude-opus-5
>
>missing your s-o-b
>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
>>  1 file changed, 51 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c5a417fef913..623b8c1c6944 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -30,6 +30,7 @@
>>  #include "xe_guc_relay.h"
>>  #include "xe_guc_submit.h"
>>  #include "xe_guc_tlb_inval.h"
>> +#include "xe_log.h"
>>  #include "xe_map.h"
>>  #include "xe_page_reclaim.h"
>>  #include "xe_pm.h"
>> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>>  	return 0;
>>
>>  err_out:
>> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> +	xe_log_err(gt, GUC, err, "CT: Failed to enable\n");
>>  	CT_DEAD(ct, NULL, SETUP);
>>
>>  	return err;
>> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>
>> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
>> -				  h2g->info.head, h2g->info.size);
>> +			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
>> +				   "CT: invalid head offset %u >= %u)\n",
>> +				   h2g->info.head, h2g->info.size);
>>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>>  			return false;
>>  		}
>> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>  	bad |= !ct->g2h_outstanding;
>>
>>  	if (bad) {
>> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> -			  ct->ctbs.g2h.info.space, g2h_len,
>> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> -			  ct->ctbs.g2h.info.space + g2h_len,
>> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> -			  ct->g2h_outstanding);
>> +		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
>> +			   "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> +			   ct->ctbs.g2h.info.space, g2h_len,
>> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> +			   ct->ctbs.g2h.info.space + g2h_len,
>> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> +			   ct->g2h_outstanding);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>>  		return;
>>  	}
>> @@ -963,23 +966,26 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		desc_status = desc_read(xe, h2g, status);
>>  		if (desc_status) {
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT: write: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>>
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>> -				  tail, h2g->info.size);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT: write: tail out of range: %u vs %u\n",
>> +				   tail, h2g->info.size);
>>  			goto corrupted;
>>  		}
>>
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>> -				  desc_head, h2g->info.size);
>> +			xe_log_err(gt, GUC, err,
>> +				   "CT: write: invalid head offset %u >= %u)\n",
>> +				   desc_head, h2g->info.size);
>>  			goto corrupted;
>
>hmm, all 3 above are under DEBUG config, should we really convert them to xe_log?

If it does not impact messages that get printed out in debug vs.  
non-debug configs, then I guess it's okay to convert it.

>
>>  		}
>>  	}
>> @@ -1224,7 +1230,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	return ret;
>>
>>  broken:
>> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>> +	xe_log_err(gt, GUC, -EDEADLK, "CT: No forward progress on H2G, reset required\n");
>>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>
>>  	return -EDEADLK;
>> @@ -1562,11 +1568,12 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>  	struct xe_gt *gt = ct_to_gt(ct);
>>
>>  	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>> -		xe_gt_err(gt, "GuC Crash dump notification\n");
>> +		xe_log_err(gt, GUC, -EHOSTDOWN, "CT: Crash dump notification\n");
>
>drop "CT:", it is a FW crash, and CT is just a comm channel where we get that notif
>
>>  	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>> -		xe_gt_err(gt, "GuC Exception notification\n");
>> +		xe_log_err(gt, GUC, -EHOSTDOWN, "CT: Exception notification\n");
>
>ditto
>
>>  	else
>> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>> +		xe_log_err(gt, GUC, -EHOSTDOWN,
>> +			   "CT: Unknown crash notification: 0x%04X\n", action);
>
>hmm, this looks like our programming error
>we call guc_crash_process_msg() only for 2 crash messages
>why should we care about something else?

yeah, this looks like unreachable code.

>
>maybe this should be coded outsize xe_guc_ct.c as:
>
>	int xe_guc_handle_crash_dump_msg(guc, action[], len)
>	{
>		if (len != XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED_MSG_LEN)
>			return -EPROTO;
>
>		xe_log_err(gt, GUC, -EHOSTDOWN, "Crash dump notification\n");
>		return -EHOSTDOWN;
>			// or just EPIPE as this should call DEAD_CT
>			// and kick_reset
>	}
>
>	int xe_guc_handle_exception_msg(guc, action[], len)
>	{
>		if (len != XE_GUC_ACTION_NOTIFY_EXCEPTION_MSG_LEN)
>			return -EPROTO;
>
>		xe_log_err(gt, GUC, -EHOSTDOWN, "Exception notification\n");
>		return -EHOSTDOWN;
>			// or just EPIPE as this should call DEAD_CT
>			// and kick_reset
>	}

Note that the process_g2h always returns 0, so whatever we are returning 
here is not going to be used. Not sure where to move it though. Looking 
at all the other files, this looks like the closest place for it. I will 
split this into 2 as suggested above.

Thanks,
Umesh

>
>>
>>  	CT_DEAD(ct, NULL, CRASH);
>>
>> @@ -1596,13 +1603,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	 */
>>  	if (fence & CT_SEQNO_UNTRACKED) {
>>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> -				  fence,
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>> +			xe_log_err(gt, GUC, -EPROTO,
>> +				   "CT: FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> +				   fence,
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>
>hmm, while FAILURE is unexpected under normal operation,
>it is still a valid message according to CTB ABI, likely
>caused by host driver mis-programming, so I'm not sure
>the -EPROTO is the right error code here, maybe -EINVAL?
>
>>  		else
>> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> -				  type, fence);
>> +			xe_log_err(gt, GUC, -EPROTO,
>> +				   "CT: unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> +				    type, fence);
>
>OTOH, this looks fine, as there should no other responses
>
>>
>>  		fast_req_report(ct, fence);
>>
>> @@ -1678,8 +1687,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>
>>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>> -			  origin);
>> +		xe_log_err(gt, GUC, -EBADMSG,
>> +			   "CT: Invalid G2H origin=%u, reset required\n",
>
>nit: can we drop this "reset required" phrase?
>
>in other cases (like broken CTB.desc -EPIPE) we don't print that
>and we should have some follow up messages saying that we've triggered
>a RESET due to something bad in CTB, of from the RESET flow itself:
>
>./xe_gt.c:940:  xe_log_info(gt, GT, "reset started\n");
>./xe_gt.c:979:  xe_log_info(gt, GT, "reset done\n");
>.
>
>> +			   origin);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>
>>  		return -EPROTO;
>> @@ -1697,8 +1707,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = parse_g2h_response(ct, msg, len);
>>  		break;
>>  	default:
>> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>> -			  type);
>> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
>> +			   "CT: Unexpected G2H message type %u, reset required\n",
>> +			   type);
>>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>
>>  		ret = -EOPNOTSUPP;
>> @@ -1796,8 +1807,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	}
>>
>>  	if (ret) {
>> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>> +		xe_log_err(gt, GUC, ret, "CT: G2H action %#04x failed len %u msg %*ph\n",
>> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>>  	}
>>
>> @@ -1847,7 +1858,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (desc_status) {
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, err, "CT: read: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>>  	}
>> @@ -1879,16 +1890,16 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>> -				  g2h->info.head, g2h->info.size);
>> +			xe_log_err(gt, GUC, err, "CT: read: head out of range: %u vs %u\n",
>> +				   g2h->info.head, g2h->info.size);
>>  			goto corrupted;
>>  		}
>>
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>  			err = -EPIPE;
>> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>> -				  desc_tail, g2h->info.size);
>> +			xe_log_err(gt, GUC, err, "CT: read: invalid tail offset %u >= %u)\n",
>> +				   desc_tail, g2h->info.size);
>>  			goto corrupted;
>
>hmm, again this is under CONFIG_DRM_XE_DEBUG, shall we still use xe_log?
>>  		}
>>  	}
>> @@ -1908,8 +1919,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>  	if (len > avail) {
>>  		err = -EPIPE;
>> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> -			  avail, len);
>> +		xe_log_err(gt, GUC, err,
>> +			   "CT: G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> +			   avail, len);
>>  		goto corrupted;
>>  	}
>>
>> @@ -1991,8 +2003,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	}
>>
>>  	if (ret) {
>> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>> -			  action, ERR_PTR(ret));
>> +		xe_log_err(gt, GUC, ret, "CT: G2H action 0x%04x failed\n", action);
>>  		CT_DEAD(ct, NULL, FAST_G2H);
>>  	}
>>  }
>> @@ -2111,7 +2122,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		mutex_unlock(&ct->lock);
>>
>>  		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT: dequeue failed, forcing GT reset\n");
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>>  		}
>
