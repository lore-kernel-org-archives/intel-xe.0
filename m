Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A42710F2872
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 22:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE5510EDDE;
	Fri, 27 Mar 2026 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSLJXaIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262010EDDE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774651722; x=1806187722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Zn/kl2+pej9mbr+009DGQf5r7fxWoojaBOAycaTCRoE=;
 b=mSLJXaIV2vtgCaW2/0xp0fVvcjFOM5GY73oriv9PQAQMZ/ZRONCn4ONL
 +nHTM0Hq0ZTfH/3k4F1OMyYfLZDrJpuYT5Y3Hl+iowBi1XmRIV0dBcb/j
 gBxZA0xKUMbfRzt0xzGAXvut73HQ2JVkHxsIabpJZ7SHPyueU7kA6s0Qs
 gDQe5wC813NUmSJ1GA+jjpvJV8002eZqsFVltz5JRbbrFdA2SxN/KnDE5
 f7g/li4DYFGvzUpBczyBxtblXABLSCa/ITW7AfwDhdlRF2v7CSxrX0aJT
 RMupv6BocV29L5JiX/F276jPpye7U97Rk/3hEVEeGljD5lElCB6hrlm7q g==;
X-CSE-ConnectionGUID: G+ETGM3rTyyJf/7A3umyEQ==
X-CSE-MsgGUID: pHCyh4QLRf2QniLL/5PdEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86808562"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="86808562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:48:42 -0700
X-CSE-ConnectionGUID: MxM9PtjZSxa9PQwdA7XpjA==
X-CSE-MsgGUID: bsVAbz95RrCeS4tomlB7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; d="scan'208";a="221048107"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:48:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:48:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 15:48:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPfoKe1G8sfMgSh8Fu9IxYKdNkMnaPxCFcAXg+qrTWtxvFcWk9Yz61e8d+fmKADH6dtwlheb40cI1efMYTuxZyKBiD5sSHAFFZ8U4xRTQUbDRvm0oqPvNc12PVWjW4hV7AV6/JXd0/mtt714tHkKEx668elmLTWGacSaYVLQjay4F8Eman65LiAq8P84weEvtUYYqjI2mXjzNldEi6Y2Fm6tZ1XJf6+HRhaP1gniirHJ5UQX4OsnIrEip3AkU9DxiZ8F2bhb1N9lOG+pi7OMIiXw6Bu6y1B9C5ivuBwbvuk8iv9kolJicnqmwqwBGqb4ynVkySGr+iCS0qRKs+tC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzyOtkBGNVrPoAMlo0ktpa6pH8Y+ZGziOcG4i4j6aIY=;
 b=MIO2+Q/FVRbaWkE4hGSlBPWUxq/xzgHy3AbkunGQA5S7eT3iMBDphdTDY2julSLVi8NPzB/o35Xyiryf+qe6e5QYh3gH19yDa6plpc5KxtnbTKmz+sM0mRDw0kMeGOyTIW9HvQrHNKkAegjJwzJ/zrzElZchmtp08V1MBrE7I52OjEs6sSjw1JMA0A/CEzUKSJUQeUh4o7qZrzNDxv6gd7aZEx2SI9FqXa9VMUMcU8J00wf8j6kAO9+5EXauayjosZ6KOIFy6pEeZ/CGwmtqFPhQ5bm6f+eyFWmrrbw/XqcNpjKX5TcQvIthq0EZcqq6iOpjtBXh0hzon1owMD41wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Fri, 27 Mar
 2026 22:48:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 22:48:30 +0000
Date: Fri, 27 Mar 2026 15:48:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v13 0/7] drm/xe/xe_sysctrl: Add system controller
 component for Xe3p dGPU platforms
Message-ID: <accJO59b41zevlR7@soc-5CG1426VCC.clients.intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: f896c821-a388-4d79-d52c-08de8c52f76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: mukOajOs+LKQFC3WGhZyLJbqTE0kF6pJhdetyKuu6IMmMsa+EcQAY0+fGer3/NBxnOxAu9/scnwJnQ57QwbQPFL08tiHFe5Dh5ex4dDnAm6WtuhKu2ZPW1nvFeB0+UKJg4iuGb2CuyE4dT8xU68qShos8NUgb7iRFwQqXJQV9QWBCgbrG1kC6YXsWsa8Pu8F4atggCYXZzuw/XmWY8Cf/1hv+4VScxMk3xhOEGMg0rTEnNR05VPq8RENOoVAn9enZO2sGs5FSuK7TbBoJCYqxpGHqOQbrhE0QuUBSjUbh6KM8FbUPjD+XXxtF+7Rn6BNgTVI4MOKow79zBsNS/SVxTsjXANFZN5r7zlhErPcpmoeLMUXI1J2EXYurNg9G6PB/WnbLtIbVs+qAFcXw8hrd2n5rlVbb/zez9y9Rl0rfRWzgD3IjwbtUr3LB/07UZ6/6q7cSDc5K4Syt2XgWhz/EGVt+7PmYJ0elWkxX1A7zRxK3UluulaHNJH/4kozX8Ppsx50+cNsALxivGkZCZS8Vq4ZZIWl3Mg0ftbYb1JSwhQvga+sx+gsnQOXs0IUvOEwqa7281dQyFnDilzQ+cklaRHKv9Yw7CZkqFpyqHsLk3MZnOCvswbXV3p3Jt8UyzGUSo2R81PmCQgBir1yeY3MaU3a+BsfPrmUcUMlrMpiy4sneERE4iw4wQcRc6zK7/q4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNvdWlHOU1BNjVmazN0ZTY1M2tDS1BoRHI1dlNHM0dtSHlKbi8vTzdvc1hx?=
 =?utf-8?B?U0IxZmIwMHRMU1BocDd0VGJ6c3RLZTFTbWpMdFhPOG5sQkRKWFhNVVRlOUpo?=
 =?utf-8?B?UFFkSU5xWmZqNVdyNzRZbDBaK0xXN0dZZWxjQkdYRWg1cm9MVzFUWFMyKzJv?=
 =?utf-8?B?WVdnREhsZzVXcEdESU1jMTFackZHUHh5TXo4TGN5WjJPcDVrZDBjZjRjWFpR?=
 =?utf-8?B?bk9WOXo2MFV6QzRYKzllUmtrNHY1WU44c1hvRkFVdytQM1Y3NHh4UUxlMjhF?=
 =?utf-8?B?RGVISGxpSXR3SGtjR0JRSXdyd0JIRzJkUHJOejNCazhOeW80UnZqRXM2eFRC?=
 =?utf-8?B?VktlV3JvMllSeHI2bS9lL1VFc3EyWU1VekJxZGJuQ1hYY1UxYUMwRzkxb0Ro?=
 =?utf-8?B?MHR1NHBlWFdLc0ZBUG05Q3dIK21BNituN1RTVmdMM3FaczVlMzl0K3pXRTNa?=
 =?utf-8?B?ci9QRkRmdXpYN0dPS0xiUWRIcVhmeml3TEpBVnkvR0lETnk3M3lTS0grZjJT?=
 =?utf-8?B?M0JkbklMdWR6OTRxRzkrbzJTVTJKbHRSOWN1WjMxOGRLR21MWDJqSmRLMm9i?=
 =?utf-8?B?MkZINGgxTnR1Vkl2YjMrNTVyU0Fxa0ZXV3dxejJyYXNQeUtkYlNOZHg1dWk1?=
 =?utf-8?B?Q3hQZ3piQmdCM2RERng4bW4rZ2Eyajh5TFRKR3VaYUtha2NKWVNac3AyK2l5?=
 =?utf-8?B?Rk9wdWNwL1RQSkN0UFhhWnVkSzArWDNqbm9PN0NhYlU5SFM3NmVrcDVBcjhr?=
 =?utf-8?B?ZnlaNk8wQklYTFpkKzhneGU0aFZOZUpDb3htOFArNEF5b0V4UE1yMkFZOHhS?=
 =?utf-8?B?djMvSVdGb0NRQWtWZ3ZOYlBaWko0ZWxLaGpmdmxjNjZ1VTg2VXpwb2xiVjQ3?=
 =?utf-8?B?azZiUWlvcUNQM21zcUFRb1NkejlZTHppUU1JS2ZrcU1zTS9sWGo4cklBWlMy?=
 =?utf-8?B?S3UxblE4UHJEbmJLbkV5MHVXZ2EwT2p0cTZ0VWVsa0E1WGlTLzVGbVkrcGZa?=
 =?utf-8?B?QVRNYmpEdG1ITGV4UjNTb1JHcExMKzhGUXBzcm84d2NkaFhXUUJQRjdndGZw?=
 =?utf-8?B?azJGUzUzQk4weFh0M21CVkZ1WUNMU0x1TWtyVlFMcmR5aCs5U2dyTjRTY3NS?=
 =?utf-8?B?Um5zYWRmNFVyRGdKY3E3a3k3VFBWSW55bk1aNndFMC9WV09WS3JaL0FyZFV6?=
 =?utf-8?B?cjBJNDZ5OXNxWG8vQjNlblNLMGoxdVhnTUdjeDlLSXg3OGpVejRDc0JZZ3FI?=
 =?utf-8?B?Y3NNK0FQTmh6VS9nUk1zcWZENCtEdXY3emloODA3SG1ZRzZkaitKZ3VUekQ3?=
 =?utf-8?B?Q2txWTM1RDFPMTA3UlRNdk1FenJhK1ducHgzQkljNEQ4c1FHUzdVMHVwNjQv?=
 =?utf-8?B?bnowRHkwcG43d3BqTExmTW5GVnJmUmk2MTNYWVFvQjBJSXFmcnBRSEtoQjZL?=
 =?utf-8?B?TUxINER3Ui9TL2prOERaSStQWHQzQmVLWG5OM1BRNlNjT0dFMnVwS3F2ZlpR?=
 =?utf-8?B?QTR3REthcHlXVWpqaGRFVm5nUE4ySys1WWhWZ3VzUHoyS0taOWlFWkd1MldR?=
 =?utf-8?B?WXZHM0wycHBKZE9HOUd1R3RaTERWbWRWRDYwa3ZEbWFCUUhYL0dGWHg5TERJ?=
 =?utf-8?B?aXl4akdwQy9WTi81TGRSNlhmQThtY3h2U054VXBVVHVpSFZ0S0FzSUR2TDF5?=
 =?utf-8?B?U0xTQzZWc1lmeks2Ny84Sjl3YjI2NkpOV0hROU5zTlc3VVppcUx4L3NFbHBC?=
 =?utf-8?B?aTdtV0pmaDJ4VVBockQ4c1V5UjhCUVg4dW1kZ1NZRldjamJ0Q1BMZitkRXhW?=
 =?utf-8?B?ZGlmV0xiSE5XL1EyTFFXYWVYUkVIT1lKT3E0MDM3SWVuUXlFeXVoZFVyak5s?=
 =?utf-8?B?dllGMzNGWmRKb2k4TW5HakQ3MUtTT2d4RUo4cDliRXNwUTN1VC9HMkpUQUhy?=
 =?utf-8?B?L1RuK1p1SkZnSndvQ1BRUzdUblllbHpPTURTQkZ6Y0lzTmhqbnoxSTNmWFJU?=
 =?utf-8?B?Wkk0TVJWTis3L2lQY2tndGU1cnFidlBKNjVld1UwQmZYWlNmRnJsYzR4SXpm?=
 =?utf-8?B?eFJ6OTJnRVdrL2ZFQXFXWmtOczNFTmlwenV6em5oR0RrbDloNmR2eVROTGVF?=
 =?utf-8?B?Rit1eEJoblVPSHZVSGljNFBRYkExMUVmTUlqaEh4ODNpK0hocG9mbUw5YlFM?=
 =?utf-8?B?azNTTDZhV0JQUmNxWkhjS3lreTlSTW9ZN3k4ZFJWbnNYRXR2SExjU1RSMWFO?=
 =?utf-8?B?dkJQcSt5T3Q1MWVSZEpsYkJNOXhlL0NLYUUwdzJDNnBiaWtKaTh6bVlIWlZN?=
 =?utf-8?B?d1FzWU14eHJmb2V3UjNkK3luQk5jaThSci94ZHVDVmhpUzlEOG5sZU9wRm9P?=
 =?utf-8?Q?+FvgAM8Y2LZc+tWo=3D?=
X-Exchange-RoutingPolicyChecked: q4NLyJh3iMl18H05oQ9+dz9S3Zezwd6H/lwChm2E+p0kK/Drb5U92dLi2Rgz3R5wIysy+aMzpfXe7XF5pcLfiDJ+ZzeKIhVIlk/EYe3TASPIPxIk9JzGNl6VWzJqMmr1MwwspPbk6hbqfxnXq7vEAE0nGPiecZBHXS7t/n0rchNgjMJEGCiEIQzdw4vuBFhFnU927J4lxKk7y7uC9SYocu0tgmTmFACGBWA7x9HLB36GUFuAaf/EHPtYI6VwfvLqNkjYg8UnX5Zn9zhzRHT9m4Vkw9qQ0bweS3V8SC0htuYqhX3pJMpdB0uzDMbUuzaBb+FviXhtr81S1GrOE6guBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f896c821-a388-4d79-d52c-08de8c52f76f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 22:48:30.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8W9hJ/iALXTxvqyyMaACEDizKictteykDPCdNVkkPG6jOAc+BQjtuGxb5j2+sjyey96obhoZgpuOyXHMpdw8fWQakgUCDb+ROCWPCjEHI1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
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

On Fri, Mar 27, 2026 at 06:18:37AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>This patch series introduces initial support for System Controller
>(sysctrl) component on Intel Xe3p discrete GPU platforms.
>
>System Controller is a firmware-managed entity responsible for selected
>platform-level management functions delegated by driver. Interaction
>with System Controller is performed via a mailbox interface.
>
>This series adds foundational infrastructure required to detect and
>initialize System Controller interface and to exchange commands and
>responses with firmware, including support for fragmented message
>transfers for larger payloads.
>
>This establishes base for subsequent System Controller feature
>enablement and firmware command handling.
>
>Follow-up series covering sysctrl usage are available at:
>https://patchwork.freedesktop.org/series/160482/
>https://patchwork.freedesktop.org/series/160184/
>https://patchwork.freedesktop.org/series/161655/
>https://patchwork.freedesktop.org/series/163562/
>---
>v2: (Umesh)
>- Fix commit message to 75 chars per line
>- Address CI.Hooks and checkpatch warnings
>- Add sc_to_xe() helper for cleaner conversions
>- Alphabetical order for headers
>- Simplify write/read frame logic using memcpy
>- Drop redundant frame length checks
>- Use xe_mmio_rmw32() for register updates
>- Align FIELD_PREP macros
>- Improve error handling and timeout messages
>- Handle phase_bit revert on write-frame failure
>- Update rdata_len on partial receive before return
>- Remove unnecessary headers
>
>v3: (Matt, Riana, Umesh)
>- Split patch into logical series
>- Rename SC_* macros to SYSCTRL_* for consistency
>- Move MKHI_* defines to .c file
>- Pass xe directly to helpers
>- Place devm_add_action_or_reset() after set_sysctrl_region()
>- Add kernel-doc for xe_sysctrl_mailbox_init()
>- Add short documentation for System Controller in xe_sysctrl.c
>- Avoid hardcoded sizes
>- Move structs to _types.h
>
>v4: (Matt, Mike)
>- Code style improvements
>- Add domain-specific MMIO accessor
>- Change phase_bit to bool type
>- Add input validation and buffer overflow protection
>
>v5: (Umesh, Riana)
>- Reset phase bit to 0 on error conditions
>- Refactor mailbox receive path
>- Updated xe_err messages for consistency
>
>v6: (Matt)
>- Move protocol constants from xe_sysctrl_regs.h to xe_sysctrl_mailbox_types.h
>- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
>
>v7:
>- Fix for CI failure
>
>v8: (Matt, Michal, Shuicheng)
>- Reordered patches for logical flow
>- Moved ABI definitions to dedicated header
>- Static functions renamed with short prefix
>- Fixed include order
>- Added VF check
>- Converted runtime checks to assertions
>- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
>- Added frame length validation and command overflow protection
>- Use REG_FIELD_PREP for hardware registers
>- Changed error format to %pe
>- Removed unnecessary NULL checks and explicit zeros
>- Fixed kernel-doc syntax
>- Added sc_to_xe() helper
>
>v9: (Matt, Umesh, Badal)
>- Extended commit message to explain System Controller and purpose of
>  `has_sysctrl` flag
>- Normalized hexadecimal literal casing
>- Renamed MKHI to SCHI (System Controller Host Interface)
>- Fixed kernel-doc syntax
>
>v10: (Riana, Badal, Anshuman, Umesh)
>- Removed SCHI terminology and aligned to sysctrl mailbox naming
>- Cleaned up commit message
>- Updated sysctrl documentation
>- Fixed mutex lifetime management
>- Added System Controller ABI kernel-doc
>- Converted xe_sysctrl_app_msg_hdr data field to u32
>- Fixed macro alignment
>- Added sysctrl suspend/resume handling
>- Dropped redundant header includes and unused variable initialization
>- Updated runtime PM guarding in xe_sysctrl_send_command() to use
>  guard(xe_pm_runtime_noresume)
>
>v11: (Umesh, Badal)
>- Improve struct member spacing for readability
>- Updated System Controller ABI doc
>- Remove explicit SoC remapper disable on suspend
>
>v12: (Badal)
>- Drop empty sysctrl suspend handler
>
>v13: (Umesh)
>- Disable sysctrl and SoC remapper capabilities for SR‑IOV VFs in xe_info_init()
>- Drop VF-specific checks from sysctrl and mailbox code
>- Gate all sysctrl/mailbox paths on has_sysctrl and has_soc_remapper_sysctrl
>- Return early when SoC remapper or sysctrl is absent to allow probe
>- Replace sysctrl asserts with error returns

Diff between v12 and v13 addresses the above comments, so this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
>Anoop Vijay (7):
>  drm/xe/xe_sysctrl: Add System Controller types and device integration
>  drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
>  drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
>  drm/xe/xe_sysctrl: Add System Controller initialization support
>  drm/xe/xe_sysctrl: Add System Controller mailbox communication support
>  drm/xe/xe_sysctrl: Add System Controller power management support
>  drm/xe/xe_pci: Enable System Controller support on CRI platform
>
> drivers/gpu/drm/xe/Makefile                   |   2 +
> drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  65 +++
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
> drivers/gpu/drm/xe/xe_device.c                |   5 +
> drivers/gpu/drm/xe/xe_device_types.h          |   6 +
> drivers/gpu/drm/xe/xe_pci.c                   |   8 +
> drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
> drivers/gpu/drm/xe/xe_pm.c                    |   6 +
> drivers/gpu/drm/xe/xe_sysctrl.c               | 101 +++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  22 ++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 371 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
> drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
> 14 files changed, 726 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>-- 
>2.43.0
>
