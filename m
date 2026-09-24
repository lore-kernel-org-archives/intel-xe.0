Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DF0C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 13:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF010F586;
	Thu, 24 Sep 2026 13:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu8CEpPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E010F583
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790257270; x=1821793270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Bdgg5NnNeDOtQtDMdhqFWor6dn8yF/9r1t15vL5bH78=;
 b=Fu8CEpPEAl95f9/dU5gt5j4nllOj07jt2eUH+yQOzr3psSnCQ2jQfiYO
 yXunDnssYwdf6nf6nuJeNxlkVbhWcg4142vdWrju5NOuOL9MbZTHRRwhJ
 xtOCqGzz5IR296kePQMPtzwn6fnaB5IvOII6TBTHBv2a1r3TzILRoivWn
 Jwr+RS6aSD2gW9gYpXuUvOtkjpxooeLpdXziCTgKAcVGgximReVuW9X3D
 +sbnYeojeG+Giy0fbvvFwlWtPMZ2Tvb2gvQOaugM6ncqv7uxUqs/6P7KD
 X5hhW8L5ERuMHsaSVci3uzNt+ACt50vyC4E0IHii77uqsIBpBrXMgbFtR g==;
X-CSE-ConnectionGUID: beyuYpIITVO/HZv++Eg5GQ==
X-CSE-MsgGUID: vRjE4naWQAaWn1y6kM0fQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101606966"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
 d="scan'208,217";a="101606966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:41:03 -0700
X-CSE-ConnectionGUID: kA1KdQAARjGradqcbXoyNg==
X-CSE-MsgGUID: mmwMcpauS/6rlO9DTH4Srg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
 d="scan'208,217";a="272615887"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:41:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:41:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 06:41:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxDoayOmnBt5NUouPJugxMfykFkGz97IVXzft54Ve11BgYjDvanZ/ShxJZFryS4Si3o6bCohJeNb+sn5CmxxYXypw7y7BxMFXg8sUHI0qK49ilBtqRnGZyNx3sSmB5Df9jECfsGcALmfj2jrMJNr7jEz6hnLQaHkixZoVBxvjWSHgt7cZ88BsI88hkpm6S0vAGvFg+Y3lrMYOk+oDxqzJKcBK6YhLc7TlVdYscvwU9Ior8lsWc9PeTdq8Fplv9TxG5nL6PWPPx+/THHXn4soUnTSdDgggqXiTI/vTICNH9jfTJ8ptW+cIW4p3J/S9oS9GnYmR/RjJztYLGFl+CHRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbTo+uKlHZYB7jM/+cHqc0K7m57NNQa1+02K+jT527Y=;
 b=Zwlj5oGUkmU9gYwea+RcfgJiM+tHy6eYoNsxLEudIFLXmY03yA9x6k+Y6qdheVLztaoxpfui9LBMUipPa7y6droJCZyLnGUTehA4BpwmTDNE23yYysFxAFGsKWXokTixKgDpbJV/uFBuYmeN1B3YbAQ0k2EtTM3MG2JnMh0jM1M/fn0wc2YjDfY/prfEBYkscxbbLy78MjqY71w6gODt9I5n5hkfKOt/2k1ldUQruVKQMAQ/7FIt0bTOdqCVBZIzC/nIrUT5cTYCsIZFM4LE9a7DMTEYr3nm1HRfjQhGdD1k2KG9Rejg5awPDewc0pFP58++IJUr9JhuDBRzBUbYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:40:53 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:40:52 +0000
Content-Type: multipart/alternative;
 boundary="------------HnoHE7y9rpv4fPnw2XuQsfHs"
Message-ID: <87caf79b-6a07-4973-98ab-c86db8f20e16@intel.com>
Date: Thu, 24 Sep 2026 19:10:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-10-karthik.poosa@intel.com>
 <20260924112409.662051F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260924112409.662051F000FF@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 4522f39b-8b20-4052-c932-08df1a417368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|4143699003|10067099003|11063799006|56012099006|8096899003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1pHmcKU3DRaqc3IUqUm14ugHfjhTFp6gsOLsePyeGCUWN54isIeuYgmqmOCRy3YtaIAKmbZhrASWS1PC7yksPzI3audoDNU5YBUJbz1Hn1F1TBKkLaNm6HVwzF7QszPOLXOh0Znv+9/yA3PKMy36xG52liTymPXZY5R0OlfKSWHENlUZriELwi7SmHthbzOY2SR/NZVOW/HptRtc0D3pLTGKKVFNlcHUCbtbI2D62MtqmByzb0xX+pOHjdqIjeR+x+jgLfJtct61sbSYgJlRuBzLqVqdOUhcs/WZjnrYb5iSkhXjQFIejbdfrcuDWir+GD/EwOmQf3dDZvJJ+34a+JNL+JS5ysNXaFl2kEflO+6524VRdEwYwpV4cWBz0MxbA4agktIIYeSzqzYOkpGCVxNJnXbdzDrAkAQPiGa2U75gAqQnV140dDZmKEfvvs7sf6JByvjaK5UWcXKsE1lVuHJ5e2dfyLKE2NCX5lkrT3LlUoqxrFjqYsHPGM3vb3D4N2UJQzeFcjafZkJTvDEc/VrDo0ZSy0zPDzqB417JAWKaxRRLaggZTjsxDSkOBEuDwTMNXtmNp0j3JxZ2dApbfmisXQXTFERADBEOxtQ2fCoDczEnBK32Y9NVyTOOYVw+sYTz7462mETeY5boCrw4Yd74vG6g4cUIZHxLOQK8E4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(8096899003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZjZm9sbEgzWHRkTHp4MDhiY1lhTzFaWTdPWVFwNUpUc1Q3K25kVTBaaE1l?=
 =?utf-8?B?Y1RveFg4K3NXWXcyOEtKSXZ1dTMwNFBxektZUXhXazhldE12cVhNQStoMUcx?=
 =?utf-8?B?MTNac0tBSS81WVZ0dUs3Y0cxNUl3MzdpT2szNEtKbEpzb0t0N1FieHNxaDRM?=
 =?utf-8?B?MllNcXBIOGhOdUhxNnNka09rcVc4ZXhTVWNCSFEwQk1zZnNLZzR4VUhqSVgy?=
 =?utf-8?B?R05ZcHBtVC9XUTI4SmhGb1NUd1lEd04rMFg5SHIyaElNaWwzeWNkeHVkbGd6?=
 =?utf-8?B?YUlhNnQvYlMzeEpsSWlqeGNib1J2azZRVlc3eHdMWTlUMWcvMEdGMXUwblQ5?=
 =?utf-8?B?NjJnL3hYbHB4TUJwY3A1bzFPOUZHWEJFUG42YTgxMHdPSkY1c1IrNVVtYVli?=
 =?utf-8?B?MnN0TGluakl3aUYyTmhOZ0hYT29XbzFHYXFqTVFjNzY5eExGR0tiaEp5dDY3?=
 =?utf-8?B?ZXZiM3kxR3FTQkJkRTlCeWNqL010WXI2MHk4WXBtV3MvaVJreEF1UVYvQmk5?=
 =?utf-8?B?b01zSXRPc0pocWtBSENGc3Z2WXNxcDJ1YURQVHdSb20wQVRSLzU5VTdqOXR4?=
 =?utf-8?B?L0xOd3FCYVpLWEN6S24zVEZGeUJNUUVmcStVaW41ZGFES0lkeEx3dkVTVlp0?=
 =?utf-8?B?YkVSM1R2QysyZHdOUlZTNlhjOFp6Q09IYWdhN1U5am1nREZab1J3c0hoKzhX?=
 =?utf-8?B?eTV0NjhMYlQwMm9XeEpZQk9qM0tSNkhnVWtwSHI0bUNqdHBpVkxEeU82YzNh?=
 =?utf-8?B?bUtudkFTdUsrcDBtVGNRbWlVZUYyTXg0WGN6TDkxcHNKdEczSnpOOXozdFI4?=
 =?utf-8?B?b3JOZDBWdWp4NEtSNmZZY21qU0lmM0FuUVZ6SmRqRjJnK0JXeDh4djk3Ri9O?=
 =?utf-8?B?NmdCUFRsTGV6RTRkZXlwaHVTR0pwWGdKMkZVbDJ2alU1VmhwOVJIbXM4Zy9N?=
 =?utf-8?B?VVA4b0EwLzF0Q0pZS0pSbXhHQVdaUHpmT2VHNDJMaU9hSE5IbENpcnZ6d0pY?=
 =?utf-8?B?U0M1OE9pamw2R1p5UlUyTmlTb2tHSDFOdFlJbHhDelN2TEpyUFBEZENWSWcz?=
 =?utf-8?B?K0Zsa1pGYUJOZ0JycDJLS2IzNnhHaUpXOWZ2ckp4dlcwRmZNUGdvRTdJeElR?=
 =?utf-8?B?RE9UMWJnUzl4VGJhV1pWamV6YmJySDIxTHZMWWpzdFYybHdYbTNBQTNwRlp2?=
 =?utf-8?B?Q0lEZDhzcU81Qk9hUkZGQzllVEdzZkZPcEkweDE2TzMvY1MrbnV2MUVzSFFG?=
 =?utf-8?B?bnBmVTF5cGZSN2lKQlFrREQwQ0RJNEhyZmtaK29haldSYU5BZDV4bXdVcFpx?=
 =?utf-8?B?d0hKTElaa3hhUmV6eXl2YXd1bXR0VW4rYWlNMGxpcjRRWEh2WnVrRGo2UjJY?=
 =?utf-8?B?d1YzVUFPV1gxZU41SGU4d0VkWFlCNG4zWmd6dmgydkYxVys3aEdnNm5PWi9F?=
 =?utf-8?B?b2ZRUkRMQnFOUUtNYXVCT1VzbkxQU0JrVExmOFdyTXJTS3lBb0d3ak0vTmsr?=
 =?utf-8?B?UitXY3JHOTRqNEZHWFhIaFBsTnpCYUtRa2lTS2RLcGo3UC8zOUZkWkwxZ1VE?=
 =?utf-8?B?Y0hQNDc1N3VRWWdQQmcyUFg1Vkp6V25BKzI5VDBnU1BJd2VZdG90N255cG91?=
 =?utf-8?B?SW8zbFphU3BVakJnV2l4NkZkcktXMSsydFcyQldaVHhEYytxTjYyOG85U1Ny?=
 =?utf-8?B?Z1BTcTl1WDhielNvay9NeXNlU1BYUkEwMXVrOGVtSEozamtuYnBRZnlNZkFN?=
 =?utf-8?B?b1ptMzEzUVhFWmNQWHNhMFlzcG9STkd5K0ljSGZGUi96M0hnYnhKVDNxMWpK?=
 =?utf-8?B?MUhJNlhuc1gzQk53WGw5dVVyVE5IRWlDRm8zL2REM3pxRVN0REpGRUExR2xT?=
 =?utf-8?B?YTNkTmcvNVdqdSttdEhqUkoxT1ltZi9ZVGRPWXpBWnNsZ1pFNnp2OTlGUjh6?=
 =?utf-8?B?SXRQc3ZobWllWUEvMjMzSCtwdUFYZ0VQRTNqV0lXY2RnZmFqVWVucDJudUJM?=
 =?utf-8?B?MUZtYTdkdFRHOXJRRkx0K0VpSCt3dm5uazg1RU5GbGloQ2RDRDBGOXJBaXo2?=
 =?utf-8?B?ajF2WGJOSE13RnNoOU5CZkczcmVva3IvWWEvVDBlWkN1amphTWZzN1Q1akky?=
 =?utf-8?B?VVVtNzlMdFFxVUFobS9GRHBldkt3aWRKVTNCcDhRMUxPdUZYK1k1RThoVWxQ?=
 =?utf-8?B?RWoxQ1NaT1p4OXhyK1MyWnZRcFFVVkZVUllaL2lIS3ZUdFdaT3U2Qi9MaUJY?=
 =?utf-8?B?NzIwU0phU1BGT1Y5OUVuYk02bWsySG1BbktvckxYdDUyUTNKK0FQcVFuTXRn?=
 =?utf-8?B?RzJoZjIxYjBxK0JDT2NISEFuQytBY0FjTXo1bk9lSkQ2TkVXVGdOQT09?=
X-Exchange-RoutingPolicyChecked: xPlCSC1eUsTqo1B3x+JqGFjgrfqXLbu6qQmGm7H1duhXL7uzCsKOJI59890w1HwwVZakhuV8OgwFiBCJmvJLVbgjyxWQszx2zBpnQjA61dAMVQQUJou0eqWVgITRuUdL35OIuw0r6zwYhNuoer3GjYEW28IAinOeuyqZ7JSS6sXfeqaHCztxfafQWefwdl4FioBjmDBWYjKh/I0mohnGK72Jjg8gpfM2zgFa+IK8TnkhyJpZhdzHqJKneXZDRuCGQqjyIs6C2YSE0ztfPJIP/4YngMiQKiQ6IrMeRpsyv6I0a9fWzeTDwmNEYZcGyI8qR1qYoZlgmwBXkIePpB/dPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4522f39b-8b20-4052-c932-08df1a417368
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:40:52.4727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39yq0BEr9DwFc/qQjVmKkSv/HbucUGizxsqY2Z8a+OGw0/CdFci9WD3TVr1TzgCRiX63e2cwMfNRxQ+gzs2KTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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

--------------HnoHE7y9rpv4fPnw2XuQsfHs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-09-2026 16:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] hwmon: VRAM temperature array overlaps with CRI control registers
> - [Medium] hwmon: VRAM temperature channels truncated for sparse MSU masks
> --
>
> commit e9469679c20c906facf743cdf68972d046f4524d
> Author: Karthik Poosa<karthik.poosa@intel.com>
>
> drm/xe/hwmon: Add platform-aware VRAM thermal channel support
>
> On CRI, derive the number of available VRAM temperature channels from the
> CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
> VRAM_CHANNELS_PER_MSU channels.
>   
> Increase the maximum supported VRAM channel count to 80 and use the
> derived count to control VRAM sensor enumeration, channel access, and
> VRAM label allocation. Add a has_fixed_vram_channels platform flag to
> preserve the existing fixed-channel behavior on non-CRI platforms.
>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index c63b409d7a821..11916b4f7cfc0 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -29,5 +29,6 @@
>>   
>>   #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>>   #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>> +#define CRI_MSU_VRAM_ENABLE             XE_REG(0x138340)
>>   
>>   #endif /* _XE_PCODE_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index cf5d51c685360..1b587bd9487e1 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> -#define MAX_VRAM_CHANNELS      (16)
>> +#define MAX_VRAM_CHANNELS	80
> [Severity: High]
> Does the VRAM temperature array overlap with the newly added CRI control
> registers?
>
> The BMG_VRAM_TEMPERATURE_N(n) macro calculates the register address as
> 0x138260 + (n * 4). By increasing MAX_VRAM_CHANNELS to 80, this expands the
> temperature array significantly.
>
> For channel 56, the address evaluates to 0x138260 + 0xE0 = 0x138340, which
> overlaps with the newly added CRI_MSU_VRAM_ENABLE. Channel 57 overlaps with
> CRI_PACKAGE_TEMPERATURE (0x138344), and channel 58 overlaps with
> CRI_VRAM_TEMPERATURE (0x138348).
>
> Reading VRAM temperature channels >= 56 will read unrelated control or
> status registers. This regression can lead to bogus temperature reporting or
> potential hardware side-effects on platforms that enable them.
0x138a00 is the offset for CRI_VRAM_TEMPERATURE_N, This is missed 
change, which will be add.
>
>> +#define FIXED_VRAM_CHANNELS	16
>> +
>> +/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
>> +#define VRAM_CHANNELS_PER_MSU	4
>>   
>>   enum xe_hwmon_channel {
> [ ... ]
>> @@ -805,15 +887,38 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	u32 config = 0;
>>   	int ret;
>>   
>> +	/*
>> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
>> +	 * set the count up front so those sensors stay visible even if the thermal
>> +	 * mailbox reads below fail.
>> +	 */
>> +	if (hwmon->xe->info.has_fixed_vram_channels)
>> +		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
>> +
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
>> +		hwmon->temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
>> +		/* Each enabled MSU bit maps to VRAM_CHANNELS_PER_MSU channels. */
>> +		hwmon->temp.vram_count = hweight32(hwmon->temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
> [Severity: Medium]
> Does this calculate the upper bound as the population count rather than the
> maximum active index?
>
> If the msu_mask is sparse (e.g., bit 0 and bit 4 enabled, yielding 8 total
> channels), vram_count will evaluate to 8.
>
> Later in xe_hwmon_get_reg(), this vram_count is used as an upper bound:
> in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count)
>
> When iterating, channels 16-19 (corresponding to bit 4) will fail the
> in_range(..., 8) check because their relative index (16) is >= 8. This
> regression causes valid hardware sensors for higher-indexed MSUs to be
> silently skipped and not exported to userspace.
>
>> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel count %d\n",
>> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);
> Agree this will be fixed in next revision. For CRI we shall use the MAX_VRAM_CHANNELS in xe_hwmon_get_reg()
--------------HnoHE7y9rpv4fPnw2XuQsfHs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-09-2026 16:54,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260924112409.662051F000FF@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
- [High] hwmon: VRAM temperature array overlaps with CRI control registers
- [Medium] hwmon: VRAM temperature channels truncated for sparse MSU masks
--

commit e9469679c20c906facf743cdf68972d046f4524d
Author: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>

drm/xe/hwmon: Add platform-aware VRAM thermal channel support

On CRI, derive the number of available VRAM temperature channels from the
CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
VRAM_CHANNELS_PER_MSU channels.
 
Increase the maximum supported VRAM channel count to 80 and use the
derived count to control VRAM sensor enumeration, channel access, and
VRAM label allocation. Add a has_fixed_vram_channels platform flag to
preserve the existing fixed-channel behavior on non-CRI platforms.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c63b409d7a821..11916b4f7cfc0 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -29,5 +29,6 @@
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
 #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+#define CRI_MSU_VRAM_ENABLE             XE_REG(0x138340)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index cf5d51c685360..1b587bd9487e1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
 	REG_READ64,
 };
 
-#define MAX_VRAM_CHANNELS      (16)
+#define MAX_VRAM_CHANNELS	80
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: High]
Does the VRAM temperature array overlap with the newly added CRI control
registers?

The BMG_VRAM_TEMPERATURE_N(n) macro calculates the register address as
0x138260 + (n * 4). By increasing MAX_VRAM_CHANNELS to 80, this expands the
temperature array significantly.

For channel 56, the address evaluates to 0x138260 + 0xE0 = 0x138340, which
overlaps with the newly added CRI_MSU_VRAM_ENABLE. Channel 57 overlaps with
CRI_PACKAGE_TEMPERATURE (0x138344), and channel 58 overlaps with
CRI_VRAM_TEMPERATURE (0x138348).

Reading VRAM temperature channels &gt;= 56 will read unrelated control or
status registers. This regression can lead to bogus temperature reporting or
potential hardware side-effects on platforms that enable them.</pre>
    </blockquote>
    <span style="color: rgb(51, 51, 51); font-family: Roboto, Calibri, arial, sans-serif; font-size: 14.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">0x138a00
      is the offset for CRI_VRAM_TEMPERATURE_N, This is missed change,
      which will be add.</span>
    <blockquote type="cite" cite="mid:20260924112409.662051F000FF@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define FIXED_VRAM_CHANNELS	16
+
+/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
+#define VRAM_CHANNELS_PER_MSU	4
 
 enum xe_hwmon_channel {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">[ ... ]
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -805,15 +887,38 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 	u32 config = 0;
 	int ret;
 
+	/*
+	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
+	 * set the count up front so those sensors stay visible even if the thermal
+	 * mailbox reads below fail.
+	 */
+	if (hwmon-&gt;xe-&gt;info.has_fixed_vram_channels)
+		hwmon-&gt;temp.vram_count = FIXED_VRAM_CHANNELS;
+
+	if (hwmon-&gt;xe-&gt;info.platform == XE_CRESCENTISLAND) {
+		hwmon-&gt;temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
+		/* Each enabled MSU bit maps to VRAM_CHANNELS_PER_MSU channels. */
+		hwmon-&gt;temp.vram_count = hweight32(hwmon-&gt;temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
Does this calculate the upper bound as the population count rather than the
maximum active index?

If the msu_mask is sparse (e.g., bit 0 and bit 4 enabled, yielding 8 total
channels), vram_count will evaluate to 8.

Later in xe_hwmon_get_reg(), this vram_count is used as an upper bound:
in_range(channel, CHANNEL_VRAM_N, hwmon-&gt;temp.vram_count)

When iterating, channels 16-19 (corresponding to bit 4) will fail the
in_range(..., 8) check because their relative index (16) is &gt;= 8. This
regression causes valid hardware sensors for higher-indexed MSUs to be
silently skipped and not exported to userspace.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;MSU VRAM enable mask 0x%x, VRAM channel count %d\n&quot;,
+			hwmon-&gt;temp.msu_mask, hwmon-&gt;temp.vram_count);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Agree this will be fixed in next revision. For CRI we shall use the MAX_VRAM_CHANNELS in xe_hwmon_get_reg()
</pre>
    </blockquote>
  </body>
</html>

--------------HnoHE7y9rpv4fPnw2XuQsfHs--
