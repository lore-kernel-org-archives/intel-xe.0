Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA43C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2610E141;
	Fri,  7 Jun 2024 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TroPDXNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980E510E141
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717764295; x=1749300295;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l5T7kpkbcyGi+G0qSK1TOBD5IrYbbKXx6DrOV7MHpeI=;
 b=TroPDXNTKm+88hV5quF4KgNMSDFaJxFfkrVvJ22YS4EmUmCzRcA1Mk8d
 H6O5fTeWa3XhkrR7NeEBOx9QWD4cWG7gujwL34MnRD8ihtdHGzBfhX+T9
 I1pXf2Ky074X9pgUzDCXm3m/tiEwznK19e44+kuR/3Tw4rgFKaJYX1jli
 A4Tc+/TLjqggL7GIL1rTclFCp2Pzg1lKExJnMg2wNOeckPHLvyeMRECPT
 RFLZ2E2TulDjQJrmPIA5Lvj/Himer6eJE61C2u+0i0soa3r/ysSmHA9ch
 trD+pQnsxLmYGHp2CSIPkBllOpEymWUo9oMH8fOcplD3eELSMvf2TD2wi w==;
X-CSE-ConnectionGUID: PGCnlzy0RnKRoM8rc/hP6g==
X-CSE-MsgGUID: 0HiU4dZeT56A+DvAhiTOfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14663774"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14663774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:44:54 -0700
X-CSE-ConnectionGUID: q1D0nakEQvGfYTsCX0cwAg==
X-CSE-MsgGUID: PMYQJCPJQZmpvVbn9BX/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="75795353"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 05:44:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:44:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:44:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9tg/ItU/mjpkpl1jhAovXDyMm3LvoNFKpBfCLGRWbbMpGI8KXGTJYS2erXXusHdUgKDbhCzpT4XhfJCVLjq7vHBEDysJ7URPjogkT5Y4XNNdLaNRuxjuBiDJn59gUymqPdCKTQbSr8FzxfUQNRt9JDdaAGctFZ8lgYktEiZpswivguDQKp8aa4aTPOS3MFs32RLN5gK8OJxU2xKKKr4BMNI8qQMAVqGUgAY3XhLa7+s/wfuqYLsUBaCYSKvxhrDC3srPWNz9b8M4LusdaBAvKBb5FKWt2m2rQg5nz/wiL97rsjWqlKOVh6mUlytXRW7yMsqDBysrhxtRqZiy+8O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SzPEqm86H11G/bPgzzHxhHU5ePj8Sx2HX/mM/G8fwk=;
 b=Jh3MaCpEB+Sm6KBXzLNp5BHvqtrAW9jAe/e2V3gmjT/WtFPmep0jzJ9/FZJ/WGv0roLFloKwflHRT4M8Lrxv5WkID5/WZ2lWRF4IBkxFXTuAOarDcPen694ctqNvOdcQ8CGVNU0Bz7z3Rwgda5j/FIklxoL7KyGLIpDnO5axUJQu+Ct9UoD5EZwH/eIWE5b7Xve09QIOu8Y5kuD+IbhlKsJtw9F5lFEjINQS6CMalXJcNIqdGxWnnYUO+8UDk4zglPqxVXd5WWgVRDlJXI+3sUj/yrZMlxg93K6zi05hJxEahUKp7zNin2/t/RTXnSJZ2Q4oMKvJj9pqrQ/b666/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 12:44:26 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 12:44:26 +0000
Message-ID: <2fcaa48e-8cca-41a2-9494-ea59abf4fba4@intel.com>
Date: Fri, 7 Jun 2024 18:14:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Cleanu?=
 =?UTF-8?Q?p_force_wake_registers_bit_definitions?=
To: <intel-xe@lists.freedesktop.org>
References: <20240606085720.1327152-1-himal.prasad.ghimiray@intel.com>
 <171768830690.23043.18234551658985499446@a6498e030952>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <171768830690.23043.18234551658985499446@a6498e030952>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4708de-b8a6-4dc0-3d08-08dc86ef9065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVloT09QbVV3a1JUM3lMa2FyOElZQTlEcTBWanY0dWxndFZSbHhpc2RBamNU?=
 =?utf-8?B?dU53bHIwbWtkMmNScUQvRFBTYlgrOEF6c0xYdlVVSnpHZzhGM0N5czkxRTVh?=
 =?utf-8?B?eVUwaXZmdmlUMnJSRVVKSE5pVGhVN1c1Sk1PUU56UDRkUm01Wmx2Tjl1RWU0?=
 =?utf-8?B?QktFVVpNNUNkbCtXN2hockUwelZrQSs2YW1odGp3R3p3QVJQYWVISVJScktr?=
 =?utf-8?B?WGd1WHVuZGhUd3JMaU9YK0pZTWFUc0pFRWQ0MUxsT0R5dFpXWnNUVC95N3lX?=
 =?utf-8?B?Q0ZCRC9EMGNkaUp3ellGQTRuWTBVdnBkellCN2lsL2s4N2dvRGIrRVJqR0do?=
 =?utf-8?B?TWtIbTZiY0Y1QnJkYS9jZ0pRV2p4S3VBUHhsS3h6UHRLa0w0TEdobURLSjcv?=
 =?utf-8?B?Q1VPZ2w4RXgxQ3ZyaldNbk15QlVLU1hjYWJwd21YY2JUYS9tLzlRaS9VMUNN?=
 =?utf-8?B?TVRnSFB0bzBtOWxDVzNqT2tuUmU4ZldkV2lLbHhjNEc2ZVUzMkc1QlduMW9R?=
 =?utf-8?B?YVd4cUFzU3ZsUVA2YXhRb3c2UU0zWmZ3UGNpSnIwYkxOd2tTL2tPZ1Z6OWpv?=
 =?utf-8?B?OHlzV1V2RVN6eXdWRGZScDVRK1FQa2pIRG16WnpMMzhFblBCV1BSYlEvTHo4?=
 =?utf-8?B?Rnd0UVd0cmU5TGV6cGlxVGlmZnVBNEFpV0JXaTZBeno0ejdrdmQ0UVlWOHUw?=
 =?utf-8?B?U0xFeUFPSnkvYStWRVNrNkFPaTlHU1cxRDFlQmNrdENPemtIZnBva21PbzRk?=
 =?utf-8?B?eDFHSTZETVlVWjdFSUF2QjF4UjJjOEtwSjRWT29ISTNKallMMitGWXNMcW9W?=
 =?utf-8?B?eVl2d1dKaGtaWDRuUTBhY1l2ajh5UkRJOGk4REFyMk5hdHJHL2tGcHBtbDdU?=
 =?utf-8?B?d0UrSzlCeWRYd1JZWnJDanl3NzlDQkM0TVdSTlkvRlovZHBTRW5EU0wrVVhK?=
 =?utf-8?B?dVhGN09KUWR5aUVhLzJlSTFJY1Y2MUFPR2lVV3luQUZOUFF2VTBkKy9pMWNM?=
 =?utf-8?B?aFRLTG1JV29ORHlMUzlScm5rL1BSaldVM2l2clF2NDNsaWRSYWlNbUtNTHRu?=
 =?utf-8?B?dm96VW9ZYnl2Y0xNZjNSanNKdGJyWkgxcWlqUjRWYXp2Umgrdi9Ld1FPczE1?=
 =?utf-8?B?bFBnN0pyTkRtek81cDAxa0hVOUd3dnAwMVhEOS8zMTBsaXZVOXV3TkJWM00x?=
 =?utf-8?B?ZElEQzJ6eXE4K3RhaUNMSVhZdDBWVzFuZ0JXMlN0cGdqa0NqTytWWDF3SDVP?=
 =?utf-8?B?MkVHaWt5bG5Da3NjZzdYaytZN1FLc1lVc05EeGF0VUhBR0VUU2RhVWpyZmVD?=
 =?utf-8?B?WldzSFpESk04c0ZwdGtXRWZDb2tZVFhjYk55NmNLcVRQM2hiYW0rYUVZOGtH?=
 =?utf-8?B?Z0ZRbDA2SHl0cnJxV3hDK1RXekhKRVZad01JZE8zK3hqdkJpOU9IcDE4U3U0?=
 =?utf-8?B?MTV6L3Z0QzdwRmZyWmtzK1R1WWJUWVpWVnZOb2xmb3ZHVmlBMXdxK1gyQmNV?=
 =?utf-8?B?RFY0R2Fzd0xodjNsL296RjVwQkVQRzdrS2RsazBVc1pEN0c4OE9HcXVvRWRV?=
 =?utf-8?B?MEJwaDNLNlFkc2lueHFIbmRSVWcrbzd2UjNBMG9oWjRVd3FjK1lFcHJ2QjNX?=
 =?utf-8?B?cU11UThyZzBBTksybVFyQWMxb1FDTUo0bTVQRVA5Z3pCV3pLTmQyVVd0NEZC?=
 =?utf-8?B?NU1BU285dmpNblEwajRyaHV0OTREckNyd1lpTndLaTlUL2g5ekNOSkZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlZOGNnbW1HOXA4YnVOMW91bmZBYVdIMldjdkhWVmFhdzROTExmd1l5VHRr?=
 =?utf-8?B?R1VHUHRidUd2Ry9tYU45am5FRU90OGdUSGdwNEpGN1grdU84eHA0UTJKa1Fv?=
 =?utf-8?B?MGJzSW1JckNsWi9wdGtFRFNKMUhUYnlRSFo1SnpoZW9ueVR4aVN6NjMwdGF1?=
 =?utf-8?B?MXNybFFjWFJyL01NMVkzc3hwK0lLb0gzRW9NUFhqbGJ1ejFBZkgvRVBkSUlW?=
 =?utf-8?B?aFc0bW13dnlnMmFGWnNxTmg4YUhaTmgzVnVCWW5mT1hVbmNWNDQzdnRFNC80?=
 =?utf-8?B?Rk4vc0pMb1QwWWZBODNhVkRRODNVZXY4SmNsWU1WVnBLaGNwbmRhekdQU2Jr?=
 =?utf-8?B?bU1MSmhtTDh1c3BZOWZ2UnMvZkpPMGZFOXdJc3BjVS9sWDY0MGtwY3VwYUQr?=
 =?utf-8?B?TUtnOEhjTnJHOUhkZGVYMDJzMHZkMWp1bktzNk84eXJza3lDQlhwSGdTaHRH?=
 =?utf-8?B?QlBSRXFYMkFEUkRzWGVobVU5RVd0ZTIwZ05Wd3BHbGM1N08vcEg3Z1VscUFK?=
 =?utf-8?B?L3kyVHU2WGg4WWJyQTdBTElLM2N5ekxOdFppc3h1cnFObllNVkx6NzhXK3Fr?=
 =?utf-8?B?WlA4T2JGelV1OEVpUEdXMTY5aFczeHJLOE5vRE1mYk0rSHY2ejl3dzBHOFZX?=
 =?utf-8?B?aDdQb0hQcXNOTVcreWJrbHdDWEZ3cS94UEE4cmczUWhuRkJBK21HZ1VtU3Rz?=
 =?utf-8?B?cmcxMWxkYVg1SHpwQjJQWkJ5ZnhYdldLdytYQ256WUZwSmNqVDBnZXQ0b0Rq?=
 =?utf-8?B?Y091VWpTa2U0TVNwM1dkSVFMdGNndHhkWVFwZDZ0SVJNVWR1OFJMVDJQUUY2?=
 =?utf-8?B?UHhMZkNHQTkvOVZTeS95c1F4ak9YZ0xGTkZLYXJVZUNJT1R4QkZnRGp4aTJr?=
 =?utf-8?B?QzhpMDFoaGw5Mkk5OSt5UFFaWjNncFpUSjhXWU94cmJNdGlsNFZ5T0VSbUVD?=
 =?utf-8?B?eXBKd253UE5menROZWpVOWtRUGU0QTJIM0pUZzZXbElBUTlrRGJ4c09ySEIy?=
 =?utf-8?B?VVRydUlsYXZ0cEsyOTh1bjkyR1NuOUp3WXNOVGsvYjhiL0lSUWxrWnZaL3kr?=
 =?utf-8?B?ZVcwNkdpdzdkeUFoSlB6MkF3WDF1cysvVG1OQnpjU0F0STVPY2h2QkJnZVVN?=
 =?utf-8?B?UkFCNW9QWHJNQnloZkplMUJlU3EzaldyYTBsWi96Q1F6WjNTd0ltVUs5d1hH?=
 =?utf-8?B?VHpjbTY3TVlWbWRGbUpTemZpcTdlZnFVVU4zb1MveXdvWHFzR0FLQktkc2JM?=
 =?utf-8?B?R1lXRFBWeTJKb3paeTNENk1zbXpKTUJpMVVqbnI2YnpIRU04YjE3SXdaSFRs?=
 =?utf-8?B?R2tRNUtvVFVtelhPMlJiVnJFV2xwTnhpcnFQTTRManc5dkZOaG9jWHA2TEN4?=
 =?utf-8?B?aDFBdjhJTlh6MW1XdThLd2pIcXVOKzQxd1BtcnEwVnBKdUNwVGFJeU1hYjMv?=
 =?utf-8?B?UWF2N2k0U2ZPT0wxTFNUNXhPdjJSeDNick5wOVVmenRtbmlPTjRIZm9EOU1p?=
 =?utf-8?B?WjE5T0JTdGJCblU0bi80NGt2OWdRSXZrUWJXaFN2TkJzT3FIOVpGYTRYUWVF?=
 =?utf-8?B?ajhiU0prd2FvRFNOTmNaZG9IY2JhWjgxM3pWdkovL09WWU56ckkxeEx5THpJ?=
 =?utf-8?B?U2lFczBqNHRBTklPUVVuckp4N0sxbGlqNnlJTE11Y1JrSGhNVmF4UDFaSEFY?=
 =?utf-8?B?T0JRSXQ3alBsblFvYno0RW8xaDdTYlBTdC95ay92UzdkbDdJOERUVFB5VXZD?=
 =?utf-8?B?TEtJUTkxbFB5a3YxNS8vcGNQanpXdW0rK1VQckVwTUYrWjgyYU8vOEJncXdM?=
 =?utf-8?B?R1NtSjJrd3dsa3hJb2F5WkhjL3ZBOHprY0krSWl3NWxFR2g0eFNtblIxRVV5?=
 =?utf-8?B?Tm9iVUhGeDdyaC9heFN3WDJQOERsTXEraENDWkdvT2ZtYXdTN1lSQk1TTUFT?=
 =?utf-8?B?WkZCby9TQ1h2QkJUcUg5MGRQTzVvbSswclgyWjJxc3BuTHNnNEpVRmw2alNF?=
 =?utf-8?B?bjk5REo1WWhRa3p1ZUV5aXlodE5EOWVLVnFncFhnTGxUVTloaGt0YzFlNDFz?=
 =?utf-8?B?UWZYZWJUMlFlRFVBczlUdVJSdlhDeWxaSTljaUVJbGRnQTNSZG5McnJpdUc3?=
 =?utf-8?B?WWIvb0QyZW0reGRoRm1tcnJPZmNDQ25UdTFFM0ZIU1JpSklPajZzQUxxMFh5?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4708de-b8a6-4dc0-3d08-08dc86ef9065
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 12:44:26.2505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaJcSUCe+OXVHFVu1kP7Ih2UxNF16uXG+kDn5dfzBFT2AleW3qC7bVDM++q7KN3ioB8bRhyn39GfxGzGW7FpF7zHnd35tXbITyaLiezzeg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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



On 06-06-2024 21:08, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Cleanup force wake registers bit definitions
> *URL:*	https://patchwork.freedesktop.org/series/134543/ 
> <https://patchwork.freedesktop.org/series/134543/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9_full ->
>   xe-pw-134543v1_full
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-134543v1_full need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-134543v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-134543v1_full:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html> +2 other tests dmesg-warn
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
>       o {shard-lnl}: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html> +1 other test dmesg-warn

Failures are not related to patch.

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-134543v1_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@kms_async_flips@crc:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_async_flips@crc.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_async_flips@crc.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@forked-move@pipe-b:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-page-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1 other test fail
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
>   *
> 
>     igt@xe_gt_freq@freq_fixed_exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-464/igt@xe_gt_freq@freq_fixed_exec.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>)
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1924 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html>
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> +8 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html>
>   *
> 
>     igt@xe_dma_buf_sync@export-dma-buf-once:
> 
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-5/igt@xe_dma_buf_sync@export-dma-buf-once.html>
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-435/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html>
>   *
> 
>     igt@xe_gt_freq@freq_fixed_exec:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html>
>   *
> 
>     igt@xe_gt_freq@freq_fixed_idle:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-435/igt@xe_gt_freq@freq_fixed_idle.html>
>   *
> 
>     igt@xe_gt_freq@freq_low_max:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-lnl-5/igt@xe_gt_freq@freq_low_max.html> (Intel XE#1045 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-lnl-3/igt@xe_gt_freq@freq_low_max.html>
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html> (Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_content_protection@lic-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_content_protection@lic-type-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-dpms:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_crc@cursor-dpms.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#2028 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_feature_discovery@chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#2034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-rte.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-rte.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +21 other tests skip
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +5 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_psr@fbc-psr2-suspend:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +12 other tests skip
>   *
> 
>     igt@kms_psr@psr2-basic:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_psr@psr2-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_psr@psr2-basic.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_exec_fault_mode@once-basic:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_exec_fault_mode@once-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19 other tests skip
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-434/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm_residency@gt-c6-freeze:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1349 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3 other tests skip
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9/shard-dg2-432/igt@xe_wedged@basic-wedged.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134543v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9 ->
>     xe-pw-134543v1
> 
> IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9: 
> ec3e566521b91eb773769fa1df899a28063a10e9
> xe-pw-134543v1: 134543v1
> 
