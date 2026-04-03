Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C5EEB577
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195310E08D;
	Fri,  3 Apr 2026 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgRaWha4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1810F10E08D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775249332; x=1806785332;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oZhqrIL9Av4D2Aim0mzWaCHa83liuTBW8Q2IyPJRu44=;
 b=FgRaWha4ayhcZ9PZzqcmj+JYoibJWq9EgIYDUw0EHNtGqx0EV7TlJtcT
 kHccIsHaslPUMAhuFjPEPrM0wBgxzT2uZOtib7M3osAkbdnSCRzXsOjGq
 2ufYSXFxWm4lQLc08yElipXCpj4yTEwo4/6E3moV3ar2fRsM+cbq399/2
 AIh00Zb0vHa65BWK15BcC6PAivtu/xPNRvMphprHTSC6VcYj1zmO7AM1v
 yb/nx5OkqzKnUr0M33+rM3Fb4oZiBC7vMzGQi36Y2nAbpVE/BFD0UVweA
 A+JL9qI1BYOc32OTOeVsq7D3BUlWkfyjXFu4L9l4C5HHgf3CMZUO8tQ51 g==;
X-CSE-ConnectionGUID: 0kMUf8K6Qh6EdM14LJMfiw==
X-CSE-MsgGUID: R6D0ABUARC6IIRzZzilIag==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="80165914"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="80165914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 13:48:52 -0700
X-CSE-ConnectionGUID: wgVH5WmJRnaSm0XPL9k8eQ==
X-CSE-MsgGUID: GwSmqEZ9SfyqlBH03ofeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="250412593"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 13:48:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 13:48:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 13:48:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 13:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LszpIqpI+ElWMUxZqvmEIry4Kr2r/AyWRcjjKkPnLGEq4FdXevVbHg/ErcvzO3c6j/UJnpm/htyf/v13s3HOGApqc+UtdSosD17zzlLK/CVLRopafeNuLakf4nJhtY992vhDFsA3oWaKQfLtWDVQubXeSsmO5aZbQe7Yxmn6Fx1kh4OFaUCjEHKTLqYtK59FO7O72m4cXfaMyW6xMLCScOwDVrBy2l6dRPYKReJCJzA87Xy0SLCa1zz2wWLv5HKYQnE8ZMFNclWsjeTSOO9gqrEB5tp3odqwRf6laNDtb18dHtRjRxWnE1nKu5r3yAhliyStM7qsu504sVDSsvMolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKL2+e0Z3m8eagFXlv+N2tu13HDhR0Cd1zlNjJvYxcw=;
 b=UBtT+TlmKMFaX2g21rS+QDmhnBAbN1M/UK3/27S92ZZh62aOV98BQNsUj9jxPtSimdreYeGBjpC1unJmehyUsrDXgeEcs1fQbxIGlevGkpZnooDqpaQWvptk2cXDSfGoZI0Okko0R+2AdSl6RGB9ynE5wYqj4FN8A8nWNKiGrtd2aLMCyWL0bqll+LBWIkIabb7YFAW8H/C7LoDNEYqEPpNJTJoIvQpj5/hIWsovJXG0z9yN/S5EVPsjh1tx+DrxLxMweCnubqbNhb3rAg2ChuAfART5BZA52yVfW8iev4k0JTdPvx8MNzFljQNnIeemLVlCLiEEU2rn8pRO0zJQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Fri, 3 Apr
 2026 20:48:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 20:48:48 +0000
Message-ID: <65f02bfc-6afd-4ce7-843d-15cfcd2edc94@intel.com>
Date: Fri, 3 Apr 2026 22:48:43 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Improve_EQ/PT_provisioning_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
 <177520867238.430832.13504999596712780226@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177520867238.430832.13504999596712780226@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0099.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9993af73-a061-47f3-75a2-08de91c26796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PSYyP3cirnaVdFQULkNQ9XSCFihpKo0ZAH7TRGGD6EfzPPrTzMl+V1g//f4Po9xLqh1PDcuBc6aVGv0tMUJLRQ108h6V5UU5rkJ/cFRbG3zNMSzwMCnDHQJva4NZ1tCVNagbTxieusgJqsAEQCV+SXipS8owiFQw5W/qMj68m68SS0vdgBB/RpPjTfDKlTgAoHVzENTjM5V+jeV8R7Hw/F+LM7lClgKMg8qjEB3MmlUL/1FMRu/H39jKFXMDBA6EgzediAUIpCTo68gxR93F2bkjxppa4hpVJfRcVn6q2dW6v+4ZOdBS1j1RjePzkOs1gEQY6gUaSo0t1AVO4eP57hN6BfVL50GYNIG/IdzE94jt8dwvpZeLadL0tE0R+UZY+kLpjxnFkeAd1o2lcWJfklA1RyLlFWtRoSyqY8dBwO7rYZhQ8p2/lkVj0SNDXQCjUc31+h84ScbucL18hAbTDp4+YC7MqF1PxSS2Y7oq1qjQgfGOZ1/f5C/ME6jyWMSXrOQy0CMyq66y+2XuB8y6ZeT0ZtaoA59owQaGn8u+4EBOQ/qDerHoEoKpaQNTnzFuUpJvX/Hlzdm9MoTmEbMh6fCXQdh5ZWVEQKhQyobsTAo5BndchEXEDeFHZZMzE5X1DMnSQgn0GbyzS7JSYZgFS56+C9FoLXL+qHIRFa4tPWBQNl7PrZO6ceeUp0hOvk12
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlCUkxIbmc1bzNGSWIxYm54Y1dIdTFpRkpoa2VsYmh0SXRJbGhxSktJczB1?=
 =?utf-8?B?UHRELzY0QlVUT1l1bm9IRHNKSkRUUHRTRW91Z0xScnpSNCtsZjVoMkxlQWtL?=
 =?utf-8?B?L3ZUMzlOaE1VNzBuNEdkY1BFUVZhcXNtM2hVSlVLMmhUSUkyK2E3aEQ5N2RQ?=
 =?utf-8?B?NFh6Zy9rL2JDcHdKMmxUWEozWUlYRFN1QXFGYk4xS0pUZXBuMVQ2U3JZMi8r?=
 =?utf-8?B?TGhUeGhPcUNPOXVzVzlTSUhZNGJmbjlOLzlxSGJzK2RiZ2N4YmFMT0dvditt?=
 =?utf-8?B?L0o4QXg5dUhxT0JNN2t2b08rZGdPSCtzMHlKS25CeEhwZXRKeVkxRW5tdUMx?=
 =?utf-8?B?VUdrQmREcngyK1A5NlU4WEFHZklrZk8wZ051RjRqeUxjcmk4VUxBZitUSnZu?=
 =?utf-8?B?MnVSdWxYS1JzdVhmMWJqVUgxZEFBWldmR3lrMnlxZVZWM21EZ0pBNWRwLzNX?=
 =?utf-8?B?cUdBSjhLNjl6ZnE0UkF0ZXIvcmhqdkx1aEtVd1hCMTgzdFVoQ3pjbVhpb2w0?=
 =?utf-8?B?T3RNaFd5R0ZnVGY4enRBVVR0cFBrblhSUGtHUThYVm00ZXBiZGdoUEYyWDlU?=
 =?utf-8?B?TlJUVDY3TEcyWkJud094bzZzanVxV3dheGZzSGNJS3YyMUVlN1hLSTJuWnBO?=
 =?utf-8?B?ZlRSdUIxRVpvY3VxQXVMZXFtUGpUR1dYOUZUR3NFNFczU3poL05tU3ZVWnkz?=
 =?utf-8?B?enNJM3lrTUQ2RkhvaVFDbForeUM2bDdQZ2ppa0R2NUlRRU5UbnpHVjNmRmxB?=
 =?utf-8?B?Z2ZDeTVSaTZ6SlhEVnVLUmpvYzRLakhNQ3lwREVsMEQva3FZMnVEWm9TU2pG?=
 =?utf-8?B?eEZBQzNqbUZ1eHRuZmVnS25PNTFnUDV3bFVCVThuR1NYNlZsZEEra2x2eTZH?=
 =?utf-8?B?a3U5bS8zTkdwTlBLWm1Lekc3alV2M1VDMGJiTFdYT3NhbTkvUHo0YVVuSG95?=
 =?utf-8?B?Z29ubE5HOE5pck9aUlY1aWExeHgxWHpoZFcwMDlqK0w3b3N3SU5OUlk4YW1y?=
 =?utf-8?B?K1cyRzBXckxVeGVDaysvdWVhL2h5WjZaTnVJMDJLbE5rOWpvNG81QTluUWpa?=
 =?utf-8?B?cnc3Mzd2S3ZqdUtkSkNsTE5EeXRFZUNpLzgvZzNMUEt2QjVJNFUrQ2ltTFZ3?=
 =?utf-8?B?M0FRYkZ2UW90Y2N6ZEtneEZqaU5vSDNvSVgzbkQ1YmxjaTNSL2tzenhLWUxR?=
 =?utf-8?B?TjRZa2NtVkFhL0lIaEhENnpCM3FLZ21tcXIrclVLM25KOXhWbUFwR1NpZ0kz?=
 =?utf-8?B?WHhHVUorNzl2YUFKVER2c2xNb1ZTNlJvcmVTSTFhV3lFZW5ybW9oNnVFVW1u?=
 =?utf-8?B?VFcyUVgwZjY2a0kwV05ET3V4dFErVmVVTFN3dWdldHJRR29GQWt4dmVxWGF6?=
 =?utf-8?B?cUFjVC9BWEljR2h5VU5ZTjJ3czdpdUwzUVd0TnYxOE0vdWZ0TTBHeGhWRGpo?=
 =?utf-8?B?UCt1bEVhVFpLMWEwOWFRZUdUZ2pWQ2ZWc3NBZkt4RkFTY1VmdW51d2tLWVh0?=
 =?utf-8?B?cThMQWlvQWs2RHk0TWpEUXBwTEN3eStTRDRKeTJ6NG5wSzI0cFRSRU5PeXN3?=
 =?utf-8?B?SXZlWER3akRPVVNNc1k5WHhNK2E3ZVdKN1JndW9aejFoV1N0VitNakVlaW43?=
 =?utf-8?B?ZVN5cG0xbUgvT2cwamZJSW1CbDUxcXRYSGdqUGNMMUNOVEQ4cmhoSU5HNEhm?=
 =?utf-8?B?NjgxUTYvOEc3UGc3eUxiWjMyaUhaOEd4WG1VdCtsdkNVLzBBQ0l3bis1TE9h?=
 =?utf-8?B?bTByaDRIdzd5UlVQdjgzZTNtbXRkYTVYR1BTY1pBMHRZc0Z6TVRQU3VvczVs?=
 =?utf-8?B?aEQxd3dGZ1NCUlZaKzFScFo4Z21GY1ROREpkSEc1VjFlOXVoc01rbmZCN3pN?=
 =?utf-8?B?UVFvT1VVWkpBYjd3VWJBUFJ1Q2xYaWd4b0J5Qlk5VGczeFUzaWdPZ2tJdlJx?=
 =?utf-8?B?VkNWUStkWHVBUEdpd3dZeXQxS1FXdzlNc0pRTEZ6S3lZNHFLU1dGSTdSWGNv?=
 =?utf-8?B?WldXNUhwUEFjZ0ZpRVRBOHRqdWRyK0hnNlVEeXgwa2xwaGs2NkN2dGJ3dEo4?=
 =?utf-8?B?SWRsZkZkcmFVVWpwOWY4ektaL0ZSb21EbElBS1JwSkhzVHh3WHJEUFdXWmdt?=
 =?utf-8?B?cmZEOEx6ZmkxeEU3ZGJEYVk5MnoxRlBBSHNLaFZMSFFyWUtQTTdUVmRDNGty?=
 =?utf-8?B?OVZjM2dZMlcvWXYwM2ppdmViY3F1YjZObktVQU16SDRob1A0bG80Z0hCdURH?=
 =?utf-8?B?VVFiT2FTbUZiZ1lvaUNtOHJnck5kNmZ6TC9qVWFDdDIyTHQxczZoVjRRNHNI?=
 =?utf-8?B?N2c3MTRKV2tPaEJzWTZPM3lyQXJSdGJObEZiNGVzZ00xWjZ1TUwvbFlhSnVr?=
 =?utf-8?Q?BRelU6e4VMdo0oxM=3D?=
X-Exchange-RoutingPolicyChecked: ib6gFSd9jivhc6qV24kKXhTYrxFIqfufHkRTA0obPr4hsVsu35CYoKRUGzn3v3jA5Yg+2ZN9G1tmqH/Hrz8W7LqZ4XT8KtWH9ANOwsyZu5ByxDVmhDtWJMiKdfb/pKJ3qXLU8tZfMMvx9AM2sS/20vLdK0jadhy7BnWMH8MJRVqjBbBjVaahs6GI2vHDnRoG0Zx3CuL6fF8JgFMMAWoxwf/9lNMSZORixPsufsOGsAdTsTkdrU5FDQhUBPWroTykvxb7acbHdEXynqeEYU7w8Fpsv2JO3N1XC4+jbb/aZECGCH0bad8HoiHTgLTZwREhDZNzRR1CYIUhW0FOPMYA4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9993af73-a061-47f3-75a2-08de91c26796
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 20:48:48.2712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcRaHKTnIYoYeRqatlAjyPylSRTSzO7doXTfsNv5cqnQH9uuJ++2sxIRJ4qA9ohDuNhm9hcDiQzouCaD2xGCCSZon8t47451prYbNJxauAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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



On 4/3/2026 11:31 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Improve EQ/PT provisioning (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/164119/ <https://patchwork.freedesktop.org/series/164119/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b_FULL -> xe-pw-164119v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-164119v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164119v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-164119v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_reset@gt-reset:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-7/igt@xe_exec_reset@gt-reset.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html> +2 other tests dmesg-warn

<3> [159.952583] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
<3> [160.155952] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95

not directly related to this series, just exposes a gap in our CTB implementation
should be fixed by https://patchwork.freedesktop.org/series/164357/


