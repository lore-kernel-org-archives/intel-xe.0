Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23431CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 13:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897A10E45A;
	Fri, 15 May 2026 13:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoZaNGQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8EA10E45A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778853306; x=1810389306;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/vEbtYxYgce9QaODb2H/BX6Ldr9OIHqVnDkYbzJF9Zc=;
 b=RoZaNGQpjOANdzzB1o5RL4yfFx8z4CNuq3GyCkXxiki8o7f0fBa3jkbd
 KttfuNtfP1iDcNLAaC6+cAuVY7uUt4jy4ThXWBfw5t2RgrWQELpd1T+LJ
 PkvnbMu6bLuMX8OiQWYr+5A/wJZpkKIjk41MAWLBeEpIod4jdVVCHQYmR
 euK/XThArL1lrj5SeEc5I4M9D72MWTC+M4pj2E+0mDmZ2XuJ2BVa4/mNY
 0E0WLw+P4/JHSeDaLZXO7WVOCvHolbbA/CQSuMR7cGF1D2sAHHaEbYOzq
 49DNzbpa51YbwwtJjS1iAKi/Y9QbPlscYfthZ3K16Tfa5GIN9c3J9+qoG Q==;
X-CSE-ConnectionGUID: B8YCMhw3RTeQ2ZUnjWlHEw==
X-CSE-MsgGUID: op2M8e0YTn+god9RrucKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97235816"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97235816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 06:55:05 -0700
X-CSE-ConnectionGUID: WOwVKS3SRDSwtdFO2W/AZA==
X-CSE-MsgGUID: aljk0LZwTxGtDFzT60tOMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="243047502"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 06:55:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 06:55:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 06:55:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 06:55:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR2B88aUsrsYu7PhhftQBL70+i+SP6gLnLkWqIkgPReId4C9MnZQVcY3CjwUAM0E81LXehxYFLLgx7daSHfo9NgjPHWiyuAquSLG7F4v/eWn2LmHt+gYCre0ndCXO5L38gGHmi5Zkdv4HO6aLxr67x5EfYDtCSzc9efHk2uTPb96Gs26vzdFKKbA4Mlg9wsD30dylQl9p3u9pDeVtELDSP9eAut6b2ag0p9YXZm9ASOn4WHSNPQ8vHEC+ZqaouQG7bfv4cr905jOpYcuzdgVvjv023KcT2dtw57ofi8dgztmbpsgHQeQZ8KmqvQKCtsmZh9o1JjlISpgbtKCPee2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHYCoeSztuKoboQV5aCIHxzdrMTeaY6EKByG9WIL0K8=;
 b=DHAib1IxQfROH0kEyyt884/dc7eJIKI1rNLy7ARFU1FWbmXK9cUpHNo+yMa281BjB8tScQ6/xkh8aZKmhqPBjN4cKyjU/uNDdxTDiLCsrjo+ObSqROOE/nU9iw8l9YS0gyt8CJrj1mmbG8OgG4Gagp21rcNRWXbfN958kyJOtlhCuvMZDkN8kIIo1mw+tTlFg0htbKgbE9HdxXYc2BW8kwD37WoVZJ1uZKaxP68QLd6yWaafrWX4Q5wshcHIEyKJGujcVcJBkAspZZ8n37W0RaXUWkTjDDGqJ6dwyGrImwlXPW2we0bg8wmFi51yZ9wf8zv7JDRgse2RY1Y+AaivLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 13:54:57 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 13:54:57 +0000
Message-ID: <7feacdca-7240-454d-b4d9-57992ff16c3f@intel.com>
Date: Fri, 15 May 2026 15:54:53 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IFJl?=
 =?UTF-8?Q?fresh_MEMIRQ_code?=
To: <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <177884384092.75062.11265121251262395630@5ab824fced77>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177884384092.75062.11265121251262395630@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc41a0b-c006-475e-5cdc-08deb2898c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|13003099007|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: EvmTwXlrvPhVCcVj/8TiIpWTyFqBA58G/GNXTFGiU9sbYTvE97+B4FhrGp4c5kI1HJqmkldpJr5CnkKPWGz/Mwkq3Q+gq6qFrRzROQGMwXc2aNl+NNsth8DpOz1OQZtDAgK6dg8gMhxK+dBtBFowc81fKkJ/ehWlk/bsmsV70O5P1eeGl2kV/eJAauupAUM/uVZFtNqUVIUeq8CpSaRpofpRHfeF3EK+YjOn/VVAa0Q3fouoOEZLHtGslG+XUMynYCALEOw4O01lC5Yiw25D/r6Hg4k/znmy0a5qx6oT8FGPNPfWqURlIwwHXjDi7gg0D09PU8aLZfFWQbFgqyoym2ltfI3WgTmdC/9PUKdRA71ZLlsw2G7fNXUdpNV7tRt4W1x87WE6Ue5AkQp+/GZh3AC7bfjT/jdVQxgCH9ON+ES+BUSHb8cWZL052YCufXA70xHp8WM6jib67+umi50V+j/GYEg0pctPQtFx+qEc7xHIupVjhkXlajef6rlv27AbK0VIpyonyQzR3yZRDlTM1XZzytlb7CU4gF5oZrDgwP2PteEQb3YTayv4o2DXlDDcwyvk23JlPOr+QELefYVNrrq8RVTC398TAjwNghvB344s/EiPGPv4rXRWBfisgSetuIbKbndOuKSNdE8r95ACBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(13003099007)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJ0Q1I1Szk3QmJPNlhzL0Jyd3ZWdS9rWWJYOTl5N2Jqc05kd0d0cXkvOWxu?=
 =?utf-8?B?dy9QRVJxT0RUY3ExZGdSbnBUOGx0djVWQm9Fc1BIZVZrZjgwa2ZMdjlaalIw?=
 =?utf-8?B?RWVTMlp3aDlIUkVIZDZhRnNmeHo0KzJBOFd6VTlhbzRmaU4xejFxQ3c5QVdZ?=
 =?utf-8?B?cExEZ2hFY2dSaWFaSS9WaWhvM1M2ME9pa2x1RGRmcG9ielVUcmhKRmZtNWtC?=
 =?utf-8?B?ckFSc3IyK05USy9NcHdVQ1VNZWpMU3M5R1F5SlJSeU9VWXhnR21ZWkNYY092?=
 =?utf-8?B?Yll5RHB1Ti9rVTNJekttc0lJeWc2NWp2N0RPUm9seWZjSUtBTGsxTEpkTzFi?=
 =?utf-8?B?b0ZudW9DMGhjSUQ1Q1MwWUlob3UyL0E0NWNnNmdvdW9FQkNBQzZwa2NXSDVU?=
 =?utf-8?B?UE53U2hOZUVjQyt2SzVaZmR5eFFDSWlvbFFMZjNMQ2xYYzNCcnpQeE9CQU01?=
 =?utf-8?B?QXVLbWllRkIxdDJpeHBZUjVnYXJOVmk2b3N3SWNnRDBLNWxObEZHdE9pdEl1?=
 =?utf-8?B?bTBVYXdDRHNIMkRQR1I3NTU0NWhkY3BnYkplMkVtVldXaUhPeUY2U2E1enpu?=
 =?utf-8?B?RkpZUjY0UitOMXFxc0NISjB3RzkxTWltam91WXpqcmlpQ3AzYXVOL2ZDcTBz?=
 =?utf-8?B?VER1cFlOWWRKNTduaVUwUE5ZMmhBZURyTDB5Ty9iSW00VVE2UHE0SnBYV0NS?=
 =?utf-8?B?d3FLS29LSThkZnZtbmpZQzFpNVdHQy9DSWhGWnI3M0kvWVFXYjBGSUJxaFdD?=
 =?utf-8?B?dHE2cVdoSW52ckwrYVRkdjQrWHNjamt2TjRNZmNlVnV0YkdacENBamMyNnlC?=
 =?utf-8?B?QlVZN0xoaGtnM2Q3UUt4V3VIL0RCbStTV0haeWRTa2RvbzZWRnplT1dBUFJM?=
 =?utf-8?B?c1ZUQzR3N3VwRTREVnVIeUlCMmdWMWxXamhjTmg4ckpiOWV5ejBFcXlBZlpQ?=
 =?utf-8?B?RENYOTBMTkhpZVpOQW1lYXhxWUVGclRKM0MrU3BVYTQ2eklaNG1CSFI3d21U?=
 =?utf-8?B?MXRRY2tJbFAzZ0xrYW9WWFpyQXl0TVlBZFRLNlJvOE8vQ0JkUkpkYjgyaVZO?=
 =?utf-8?B?WkUxYWdlcmdvVUdRajFSSEYvZzNaN1ZZVDVjVEw1RmU0TjZ1cEFCL0tyd2U0?=
 =?utf-8?B?ZHJFWmF6QWlhMmx0dThOb3dlaCtpT2VoRkVBM05nK0xBM1JtbDFaTm51OFFS?=
 =?utf-8?B?MTFOcjZQQnk1VUZ5WjM2M0x4bSt0aUJ5dVM3bm8wL3ZoaEZqMmxLZUx3MFFE?=
 =?utf-8?B?UG9YaGNDSHB4U0gyS2p0R3UvMjVSRnAzM0ZXenMzR0E2UWU4VS9ETExzQlRT?=
 =?utf-8?B?UFh1cFRHWEhjQTFRVE1UZlJmdTJCcTVJLzNieFVUNzRYeEVjT1ZDRVV1cVd5?=
 =?utf-8?B?eThYYWw2K0MzUXlmWmlFZ0pUK0I0TUpMQXBPandWUWhYTFp6R1FkbXVTRFV4?=
 =?utf-8?B?V00wSFltMiszQWdLWHJpQnpMZUQwZWl1YWxZamc2N0d1eGFOMkdQTyt1aFdI?=
 =?utf-8?B?NE5ibzNFQUlYN0ZFbUgrSStKTUhQcXZKcE16akJvNDh3dUtyVU5TUHN4L0cw?=
 =?utf-8?B?SVRiL1JmZ2QzQjRrb29DN0tBM0o1Y3M4WGx6ZkRrdmFGRDZHMzFmdXJrVHRm?=
 =?utf-8?B?ZWI4VkN4M1dUOUdDc2J1MFltWk9nck5ZdzVvUmd1cTZtOEh3d29KREx2amhC?=
 =?utf-8?B?a3lIVy9ES2hxbEJmUTRvWFJaNmUrcmxjZ1d6MUVTeWkzVG9jOFRvMktTcFd0?=
 =?utf-8?B?NG05K2tmcVM3MGJjZTdQci82RDZwYWgwS2kvRDIwOEpUbEl3UnpUbDZrdWhV?=
 =?utf-8?B?d2lQR21oZTRjYXlXQndUR0RleWthbS9seVFZeDBwTk1MTlBaWmlPY0JxMnVW?=
 =?utf-8?B?SGF4dmF3cWZFeG40d3JKNVE2cmdPempneFI4NmVTM1JYbGRockxyNG1Qd0pk?=
 =?utf-8?B?TFdWdEUxL0RPM2ttVkVEV2NCQ3ZRSzZxRHZmbHZBWTVKWFNpU3VkQnQ3Vm83?=
 =?utf-8?B?YlVZby9qV0ZBdmNwM0xpRllCSjk0dGdOTjBiRGhqNUYrYU1XQzNycEd3bXh5?=
 =?utf-8?B?VmlHTERGY1VjOUlzZFJlRnpoRTJMTGtncTJjS3M1Y1pYaGsyajlIU0doN0J0?=
 =?utf-8?B?M09nb09vbU1QZGRja0dtSlhnWDlVeERvUVhVUHhCZFBRNzhjUFhnWU00Y0ts?=
 =?utf-8?B?b0w3VkNyUzJXNjZtUHIyYkZ5SmU1TUpNKzJGQi95ajU0ZmhCS1Z2OWRkdVJz?=
 =?utf-8?B?dUpSbnNrWlNqWEVkdGttczIyekJkK0J1dUlseDhMc1VHNjdGd1FFQ2lMYlEy?=
 =?utf-8?B?eFlOQytiOVEwY3dtTklhZUtuaEw0NSs2eUM1L0Nqc0c3cGMwWWVKQnJadStm?=
 =?utf-8?Q?DlHBMau0NHmoZats=3D?=
X-Exchange-RoutingPolicyChecked: FwcqSINBJEGVhJtcd9O5LtacOQ6tN8KtKdAyA4V27bkuelwbv3NXNMepyv2Z72xE0QWsQZMhu/TjYoF/wAwq1IvE0PN+d7K4usVXZGn8XPwMJ5WfChdUjt3eLQOmtmj5lvrK4ezBXOtKA4lY2H9890et0CV/cE1FMaGCEogj6pz04jelkVBrXh/0aHaZCDEgVW4uOyaMpVi4R3djtiJspZvSZCUTuuhQJl9gsl8YKOc5KfDLeU/h7WOifgtX1b3v0OEE7H5eFRFA8RryqwCnsJ/U2BuUofoLkSXnbl1E0VXwgv6ayS2rNrQ44vt9MzrXrgEDRl3qOpqX7wjjzZ8BRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc41a0b-c006-475e-5cdc-08deb2898c56
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:54:56.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRxI8ArWAapJGeVyvQRzU2F/MOrgAWvKg55u3CtfIIVEbFj0Q8GtluCwyqI4sxRENjtuya4i9rmo1kbzRxbeNH9QEoFOEKWVKJVE2OJ/cw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7921
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



On 5/15/2026 1:17 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Refresh MEMIRQ code
> *URL:*	https://patchwork.freedesktop.org/series/166580/ <https://patchwork.freedesktop.org/series/166580/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88_FULL -> xe-pw-166580v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-166580v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-166580v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-166580v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-while-active:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5063-121c16f9d8c56ea07263df84ab971cc10870fe88/shard-bmg-9/igt@xe_drm_fdinfo@utilization-single-full-load-while-active.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v1/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-full-load-while-active.html>

unrelated, as this was PF run

<7>[   39.485861] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] SR-IOV support: yes (mode: SR-IOV PF)

while series is touching VF MEMIRQ code

