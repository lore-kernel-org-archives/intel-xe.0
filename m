Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B1AEDB7EB
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 22:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3810E3B8;
	Tue,  7 Apr 2026 22:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSYUrUd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8810E3B8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 22:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775602337; x=1807138337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RJ4LR8jWlbQzlLB0rOpBrL2/z9/2E8+GO6eIfAlkAzA=;
 b=lSYUrUd4FI0q2dl2YFDNUQu5ZM0LgkmBOE6dHmNMjOBS7vuXO3FW2Syn
 kjodaNWamZKwoKQCQBvrNhWaoVYu4TRLG2CkhG4ztaDKKZ+j4yDLNBJUP
 kW+7jhOGvBBF3U/dpaqORq6WfmBvfgSiJhz+ADo/qTy0Hd4rq+iDYk+pt
 Pd00yJ+j8cIKpSG4c5RxsV8YQyd0dpPlTpaa9hWrSftgDQ0YClMq08G3S
 MPM7EYqaPT9Yq16E9bAGkwhRwPxd8gDE0cz+s0TjeQj0wyA011FdFUxaQ
 Fwfu0znzqk4qxKpyN0+7FoLKFi6upZSK29xPzAbozQ1qmhm6abJci/48Y Q==;
X-CSE-ConnectionGUID: sYYRtToxQx2ZkkhJIlyu+A==
X-CSE-MsgGUID: kc6rgoa9QgSXhPzQiUQO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64123250"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="64123250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:52:16 -0700
X-CSE-ConnectionGUID: HBsY32CLR2+6JQOJaW+15w==
X-CSE-MsgGUID: 2q0jw8z6ScukIu1wS4MBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="228197254"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:52:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:52:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 15:52:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW4s8i/14UhTKEGxcqtrDpLAgHN9ZJfNrEzu3AJsN+XtDKXinESbdJR38ByqEAQiK86mqP5I3BvSGJty47vySZxW8MnYyS5PcdSKu3pX+2UfnlEQW19v135rAipJma5elyG7nAOFZE+CQ80hbMg3KGJNUxjPmflJg4IB2zdV8JmqyEYvtWIaRPc7RIQ6Fj+wMNH57FeOxL0X8YW8QcEdTG2jDxbm9ZQRF8AlGFErgwwC4LikYYrOS3N4BiFPcC2Sz/DVrmOSP2uRTWhnDq7/A52vsbKjurRc7JD7XyFsXQNgpMDomRbL2Z15XRl+pV3AXJL3LLafp5qQGTazrGTiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOqnMW0wwU9kVT72FZ18VuMcy2rDJJ7JpqjhhITRea0=;
 b=mrMqKihCgMe8O/tsdUTJe41btzDRUTyY/LCMoHLxxVzoWUk5TNoUQd5n1mfv2F3bgogM0QoQXrT0jJBdjarPQHYJIwlewH3bi+Q3eAY9v5cnHZQce5RVAKx3F8o6rUQHqnTBqHVOm9zEbdC8UMSJvcZnb7M6g0s7dOCDphWkAEf4wXmDhIKZsfPFIql/8RArtb8krKsiVMgyn0l3c1tR0Hxg3FLUqPvbmFQloHeqCuE5M6PRHCKPpfLqCDbefuFUGzIfPOzSbWPfVsjpHrb2QnPQo2Sl9F524O1W2HvzsbEiJJ2mi9TmSReYInTTR9UzEXVvw25m9zBKhKoEb92gyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 22:52:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 22:52:10 +0000
Date: Tue, 7 Apr 2026 15:52:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
Message-ID: <adWKmJO8gmh61IHJ@soc-5CG1426VCC.clients.intel.com>
References: <20260407030219.444060-1-ashutosh.dixit@intel.com>
 <20260407030219.444060-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260407030219.444060-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e55cf-4488-416c-f4a2-08de94f84d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Fi4lJsnD8IzSs+6PQ2n85cQqoXmYpEMy6eCJA7vnm/1w/TeX+nLfSw+prxShWWz/mA/WK5qOKPjSMkGIr4uKSVWdt1Vm6/ROBokoKFHg7MwR9WGEXPUdpohCfPdllH9iYwK+YsGvIpcvjlxnHAcMPpTgepeEQHHv3+ZgL5dy8X1gzDPp7K8VtzfDBb2ME/3EvDQf0qHg1/HZkFAqgM1WlcqvgiWVfxNz+K1Ww42wg3QIHMDscy6pxc8i5Al2SrfNPD6M8bS7zbbT5HZEJ2PE2UI3xGykAA2hA/d0ADoeLgzdV6wBfspCGcUW2wUaiUD4EaLbYxtadX2XJSgVz/Vxd8IxnOk/YrHxIqigy1W2awN9ALMoU25QDPzrQ5aa7UfOxgnZzhXHLhKWKCCdsz/EK9eTl1X69/1jFB9tK3LtNJJFEF48yP2N6OubyRkvsrHdIu9zEVmwi8CK8lVkC1PYdtCpnnb4ZgHsyL9W4l4dMpI1kAcQX9KrySQCTgaLRIMj9bhJMXQurKcHa6vWESErf5pm92+szKIUH4w8c68B7uxHCLd/skseuTsAARhH5wtfSEvudNHmeyzLH0sncWJwTBTGTEKwipMAA373mb2AoXI+fisiGeBSzcUx/V5TG/9REF43NPHQQeqJYUt9L6697QFsqYNJFgJhS5+RWuQebUgqVKHP3oTUee6Rz6nQf7fZMJqsQsYvSHgQJ6ViKIkpBOEVT31Z3FbEhFIjZgU2YRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3h4bmd6Rm9NZGdscGE4T2VFVkJQd3JqdDhoa0FFRWZJelRWYk8vekVXcTdF?=
 =?utf-8?B?YWV1TXN0bVFGM1FNNFBxQ0wxZnY4b2s3MTRYNFBWMlYyY0J2TUZscFlYN0NF?=
 =?utf-8?B?Z1V3NDdoZ0c4MVB0eUk4OERFcjJGYjZ6TVQyNzZpd1RNZmRTbS8xRW5JeTM3?=
 =?utf-8?B?bVMwZG0wUUJ5YmMxaGV3RGJGdUJGenNQOUtoTy83eHFPSG83NXRMbnQ0Z3pk?=
 =?utf-8?B?UzlmdmhwUnVsbzVkMUZlb3hiZHB1VHNVQmxGK1p5citSejBuR0IvUEdkc0FD?=
 =?utf-8?B?WlZ1cVFCS0wyMTNLY3JMRlZibjFpc3Q1UjFra2N6SlJaNGpuaEprMHJIUkdh?=
 =?utf-8?B?UTlicUJjVTFOdytzZDk4eTBTRm8xbjVQbXJJWnZRYmpGeU15NFBTMXBJQ0t3?=
 =?utf-8?B?dkpaSW93SzJJeFA5azYzcFNoS1FTeHBQbVRKcVI5T2NnS2pBdjBBU0Q4d2U1?=
 =?utf-8?B?aW5GL0p5Q25CbXB3d1hmY2E1WjIvSHJtSDV3TEdwWEoycC9zTG9DbVlWYWpP?=
 =?utf-8?B?N0srUG5GZFVPeU5nL2J1VjQydmVHbFVjMGhiSmlWMWtDTUdYcjVXcnVyZFQv?=
 =?utf-8?B?ZE9VUTJiQkFLSmRqa1Y1dmVEL21qQ3hjVmFBZDJjSUhNcW53SmtPSE9Rc3d1?=
 =?utf-8?B?dlppNTR1dy9pT0V6RnRiNXJ2cW9DR1JTYURlVkNsQ2MxR0dYNFMxc1BKc3RW?=
 =?utf-8?B?QjU2ektBVkM3TXhFZ24vQWRrMmliRHBQMkt1RHNHTWhPYjU1L3g0UkV6ZlBT?=
 =?utf-8?B?ZkxPSi9NbDF0YU91cUZqcElDWVNmbi8vM0pvczIxNDZlK216ZmVCWC8vSyty?=
 =?utf-8?B?Q0c4L0c3YXpzN1laajMvNXdIWEd0Z1dXS3JBcndPY2duaTltaWFiUFI0Ym9T?=
 =?utf-8?B?TVh5SHB6TVo4eXZqUDdZa2VodDdQYXNQU3dKVDlzNUxlVFZmbjdWd1N1WWsx?=
 =?utf-8?B?UW02dk8rcVY0NDBNck1FRWg4OXUwc1Zxcmk5d2tqajNlYkk0cFpjaXdHMUhK?=
 =?utf-8?B?K2FtYjJlK2RnZmhFdkEwbzFGei9iZXkyWjkvc3Z5V2gxZm9FNHBzdTIrMUg5?=
 =?utf-8?B?RkdHV09yMmVsZ1NSMWxUeFZJWnNhYUVjbGVneE5QZEpGWGNxMzZyd2ZUYm8v?=
 =?utf-8?B?Q2xLaHpGcXpLejcxSkMrMWF0ZytpZFRCZUZYSWt6YUs2dHB0WWZqSHkwZFV1?=
 =?utf-8?B?VXRkSmlIdjQwZGFtYlZhcWdHUXBlU2tMN0JJOWd4Qkpvd0FaOW9LMXFZRDRk?=
 =?utf-8?B?ZEt5QVBMTnBkV1doR1lYcklwYzF6NExnUzdTeGNQU2ZaeUNGd3k5QjgzOHNU?=
 =?utf-8?B?M2g4TlUzeHRlSVp2LzB4WU9BcjZ0VGpMcHlEanhXSk1lbGkzOG1MN1pybkZT?=
 =?utf-8?B?b3luUmtIZkFLN1V6b3l1dnNBdUdMZ2hIUkxXMllqK0tFNjlENFRXZDlOQTUw?=
 =?utf-8?B?N0QrVkdMR0dWcThieElSaDV0cTdHQTdEN0JKaWY0WmtkTkhONjFMb29KRWpm?=
 =?utf-8?B?eEwrcnk2QTlVQWRleldFMmNOSFBCV2dld1dIZGgzTXYvR3ZadWhPdzI4d29k?=
 =?utf-8?B?S0oxeGo1cjRrYnU0cUV6YkttUFJ5bWZIc2tua3JjRVlqb2xUekZEYk9ueTQ1?=
 =?utf-8?B?Q2R5dkpybUg4V3JFanpUNnAvaEhmaWtWLzBZSTlCNDl3MExNc2ppL3hlOFR1?=
 =?utf-8?B?NDlnNldCWlVwcHlCN1cxSjk1ckkvYVRFSFdQVHdiTlFCT3YrZ2YyKzIvWk9O?=
 =?utf-8?B?Rm12a3lLZmwxNlhLWEpjMnB0dVNWSzRNVFN2K3ZXa3ZzQitHQXc0YVdVSzFM?=
 =?utf-8?B?SC8yVXd4bzhzQVUvTGw3TlFUMDEzVW5WeXQ2OU41aS9ka09ZSW1Sc3Jyb25C?=
 =?utf-8?B?RlFqcEhTUjFXckVJWDZUUTV0bGxZRFNxNmpQSkxyUjVSV2RZa3BQR2FJRy9u?=
 =?utf-8?B?S1dyRWl3Y3I2U2krL0FTcVN0Y01YK0lIY0d0b2RITEhRTGJ6cys2YjBSTXc4?=
 =?utf-8?B?Qm1zMEpJenFQWE5mSk5sMHpqbzdsZC9lZFNSK1BOMDM1WmNQY0xTUXVML1Y5?=
 =?utf-8?B?SzcraXRRM3k3aHJmbTdwOVFTVEE5WE1yVmpXUHY4NURLaGlmU0ZFT3YrTmRs?=
 =?utf-8?B?dkgzMU5YcXFrem9DZXVjamJWTi9hUGt5S1JVd1V2d0JsL2lMVWp3WWZKTVlG?=
 =?utf-8?B?Vy9aSGowakhya3lMUmZrdnBDeTNGQUxjLzlIanl3QURrd09IMTRsZnZTdWNy?=
 =?utf-8?B?ZXJuVDdteGJ0SEozekJxNEw3anUwd0F0cGRzWDQydlVmYlRDR2RvbjQ1M1Bw?=
 =?utf-8?B?alc0OW4xSVQzYmRUNWYvZ3g1UDJyWDBRa29NOFgvS3djYVRNajVWaUtlejlV?=
 =?utf-8?Q?bKeO4Irm0xK9hjDuk9fFmjnC5bAzIQFWKyggE?=
X-Exchange-RoutingPolicyChecked: fsmgNzxEtCa6r3tZGCIrZ7OOdQ5yRRcYoFnDu56JAYRnfEAo8o+BkK6KYrLLg5K8erOfMPAgxLewgi0jnY8cF0DcfgFychkp8doHTWxuGw2vb5dOdH1/u5GwwGySMAlssXXGKR+tVxSoraRfJIbgAj8MzdL2I43/NhvAve7Wio+gWX25VzzOEuPyaq38EpJktXBJhJPgLSvnJYYrN0wTE1AeIDIhK3rOxMXYO0J9WkOJTe97b++E3xT/mhdf+aGmSG8Fw9uCQ01haSir1r540jhhKis4nMbeNvgjPwy4oPMtc/ebGWSD+ZQqb1mZ25GlvhZZibK09qL3v5SaMf9opg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e55cf-4488-416c-f4a2-08de94f84d31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 22:52:10.3059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9oQ+gJ+9vA5cW8/HzYmka0y8MgMJXTWFvrUkO5vaQv/hfiJvg4ngRn60O79jPReYWbuQv6bjBHlQFKcrr+z5OcfTWH8N+HZgYdiuV7xpng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

On Mon, Apr 06, 2026 at 08:02:18PM -0700, Ashutosh Dixit wrote:
>OA buffer mmap can currently only mmap OA buffer in system memory. CRI
>MERTOA buffer can be located in device memory. Switch OA buffer mmap to
>using drm_gem_mmap_obj, which can handle mmap's of both system and device
>memory buffers.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

If it works for both types of memory, then this looks better than 
before,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 19 +++----------------
> 1 file changed, 3 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index dfd3b6a789cc3..0e65141e57ee8 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -9,6 +9,7 @@
> #include <linux/poll.h>
>
> #include <drm/drm_drv.h>
>+#include <drm/drm_gem.h>
> #include <drm/drm_managed.h>
> #include <drm/drm_syncobj.h>
> #include <uapi/drm/xe_drm.h>
>@@ -900,8 +901,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>-	/* mmap implementation requires OA buffer to be in system memory */
>-	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
> 	return 0;
> }
>
>@@ -1683,8 +1682,6 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> {
> 	struct xe_oa_stream *stream = file->private_data;
> 	struct xe_bo *bo = stream->oa_buffer.bo;
>-	unsigned long start = vma->vm_start;
>-	int i, ret;
>
> 	if (xe_observation_paranoid && !perfmon_capable()) {
> 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>@@ -1692,7 +1689,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> 	}
>
> 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>-	if (vma->vm_end - vma->vm_start != xe_bo_size(stream->oa_buffer.bo)) {
>+	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
> 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
> 		return -EINVAL;
> 	}
>@@ -1708,17 +1705,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
> 		     VM_MAYWRITE | VM_MAYEXEC);
>
>-	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages == vma_pages(vma));
>-	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
>-		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
>-				      PAGE_SIZE, vma->vm_page_prot);
>-		if (ret)
>-			break;
>-
>-		start += PAGE_SIZE;
>-	}
>-
>-	return ret;
>+	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> }
>
> static const struct file_operations xe_oa_fops = {
>-- 
>2.48.1
>
