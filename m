Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D0CD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 05:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABD210E06F;
	Thu,  4 Jun 2026 05:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1uT1wZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFF210E035
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 05:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780551667; x=1812087667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Btk5T0lHAMfCGVPBJ/S7i9qbnYjjzPQ7mfVgZKhnds0=;
 b=I1uT1wZIDfdGR58xlBgUGm+6oe/EeLCB9muhOEGAg3hc65BwItiyu5Zz
 nG8ZNeGT6SYBVNoqo9rg6JHH6EY5gJVVDbJFxFRtSRosqM1ziTj9Waj7Y
 4W/2kzri8rifdQzuXrTW5lYdaG86AX7geYdOi9xpb2D4LvycbOh+WCOma
 UJGswRqjFEcf3X4FP3X7mm2pLSbpf+bC30KbWykvuhY8am3zUbSaNLGdd
 uPjdddOQ1TmIUbw+lK3C+fbX1q2VmBtE1p6lGEidavQfi67D039CX6E1T
 LYHSwRIJX++UIKyUtlGimQJWvRFAh64SSPCJ/aKgJKnik+M/HEqK2RqMG A==;
X-CSE-ConnectionGUID: nW9/QllIQWW6HpKo6G+9Sg==
X-CSE-MsgGUID: XiSK8h1ARKmcUhlo0sKOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92056517"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="92056517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:41:07 -0700
X-CSE-ConnectionGUID: ML53gtSmTJGWoDkH3gLRWg==
X-CSE-MsgGUID: eTLKaEKBRO+Iy2Xgu5wGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="246272870"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:41:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:41:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:41:05 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4yhJ2NYLKXvIiiRIIEFZrpzHIdns8BciSotPVaabrZ5aT4HwHBbq4N7QI3v1cp3yDF/rBwesSSFhSxKOonn4QkxuQiTGHgxCCCG0nSiO+ez9xH2WfyymqKDoEA33BOP7v+MS48u7i+TH7qIP3lWMxv/+TX7DGYMlyVUAtNzidCYSfQsHq7FIZJHy+pQLj1RisSvtdew0ivlx6YgK6qW0rlnJi9jsFFAywFnTpPxC7DMreZV/J8YQvm31vuR5uTXbCllmNu5nSWGnOJbMEUxJYfrC5+TkdHbQ+8qiK3MhnVISsxSqr+G3K/SpsaEyg0WtKh5VgUyGLwQYJ34WlsVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH1ZMopDcAdrIl2p47dRyGbski+i9ei4SQKRUj8bJLQ=;
 b=koKP9368tmLdqXPuerB0RiJaHED5XOsZ53LTya6OUqpFYaJHn744YJDCjGr1eflPhBR6shLQQRT+jmruDLfcURF9OW4rrQraFONgOErgJ2L9npGj3yvvz3p80am9t5jsdtWzQQIwwrMbv1hCb/GZ43PGRTC0MXnM66OvOFsysH2EhhVZOpT90jw795dTp41GQiI3kilJahEBTw5x1q5Jo5ymIkCkOHoHyn92r0Oda/6wXHu3kFRAq8AAnEyw69xRLAFW01/owp8HSB6fsfte+gslGSbzF5RAfVvUAlfrtHjs0gFbts2navs+VsN52Haazx2eafaDOQWyg5F12dzWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 05:41:02 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:41:02 +0000
Message-ID: <95b27c85-0c96-4ba6-845a-1e0160399dab@intel.com>
Date: Thu, 4 Jun 2026 11:10:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/7] drm/xe/vm: Preserve cpu_autoreset_active across
 GPUVA operations
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-3-arvind.yadav@intel.com>
 <afLaoQqACZaoECxb@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afLaoQqACZaoECxb@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aea3aeb-c280-4bb7-0007-08dec1fbdcf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|3023799007|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XirTiF3CEK2LWPXevvk/1TSJLrkCvx6S/hjW+PB8xAvxWsiFTJE2KKYs8exDBgsmgKh40Te81Q67UiL3Mdf39slRpTNWE2aAF2ysUcaBOhGf2F8a0xXzZoiqcF4jQmzBxDpKvpsEQ6t4jdCdWUZLCNsm13IYIsa9K/5MR6DJ/Keh3qAmucMOt95LoScfKZ7J5dhCZWfbFaXU41tje8u2PPaPgz6xgxDyb5h+LPyWrF3qd69Atb24tVPBM64mzTV9iX27WN9bId0+rWxmgzeN4RmLXL9k8i0NT4XgssWOJs3eXEVTA6Ems49KpoLS+pf5JW1vSTbWkd1uIJqAGO32MUNE7CFzBJEaJeLPd3AA7/frk6vW51g9mCUdGMXsF7MZ/pdmVBZpG8kO7QkLEjC5JEHM/UqJHO5vya8LLu+IybZO4E9kZisraqxbLvvHjqBVv3IL1dpvi+s51QTzAsS3pvIEvLkK7Fl4tyweRHP2sjBfzI/Pn6lNQMBQuLxQSfLIy6ctpXNlFH5BZk81fZI+FZb1hzdDWwz0MVaSZdKeoVJK6TkqDis+E7TMV+xHd+2HVw7PfzwGLtN/qoO04y+aawgegHvKHrLP2tBKD8Q75oyrP2vkkAnriKNP0OA44S4AN5MN4wrrS6PmV2mE4EV9A8iwOX0LdOeD8d/pCSSwvxZOiPGjqIcfGk7Il5v7XlNY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2d5M3VRUkFrTHYxaWZRcHZjUzVueTNMVjdYRkZXUjB0NzJSRkFYbjE5aG5E?=
 =?utf-8?B?dEdpeTBPWStHT25nVzdzRnBrczZ2bWVwajA5am9YeWxlTW9XemhhdkdIMDFZ?=
 =?utf-8?B?eEREdWRwQTVoUFZYRDZRczJKUW1GTnZpNDc1QzM0K3NoTzlQWE5zdDRmVXdQ?=
 =?utf-8?B?b3ZlaFJvTlBXOGswd2FEaGZiSFdpREVkZS9RWE0rbTY1UTM5Y2pvUDhqTEdL?=
 =?utf-8?B?VFRQMlVyNnhNSDFwdmVnN1VGVzFJS2pUOVhVVXdkL2dxNFNOR3Z3czZUUDFK?=
 =?utf-8?B?ejZrendES3M2QjV6ajJOUnBMYjZBTGpuRHUzMGpxMGVIZkFPbVBzaC9WNGxv?=
 =?utf-8?B?NTNMS0c5b2UwQkpXa3N6d1hsTjFaZHIvWWh6aEsxdUE3Q3pYWG1PcEFSVS8z?=
 =?utf-8?B?VWJVMzN4cFQxWU0zWWdHOTBnYkRoM3FNWG1YNFByc0ZVWjdMVUlzUGhadnRx?=
 =?utf-8?B?aCtDZHJxeEN4MlUvVmJqak1NUktiQWFoMlQ5cndlNSs2YnEwaWtHMCszc1M1?=
 =?utf-8?B?OHlEa0l1QmlvVUxpYjJlTkdMZnFUQnB2RHNjVFI2blU5OUxCNHQzK0xJU25k?=
 =?utf-8?B?WXdTSkhzNHhiM1pyZ2tSNno5U3BzbjdzaWdhZ2pDYjRhRVVGWklIUVM5SW9y?=
 =?utf-8?B?SFluR1UrVnNPbk02cnVjY2R6bkVOS0g1STlJR2tzRjlXZi9GZ0ZBNnVHMkds?=
 =?utf-8?B?WDRCN2tnSUE2Mm9EaUVIUi9ac1RCNVVXdDdLN1pCQ2lyWHloejNwNExtTnVH?=
 =?utf-8?B?T000TW5aTzZRaGdEZzRtb3I0K2RGUlhsSXZNWlNFa281U05LZHBQMlN0MHRk?=
 =?utf-8?B?YjFDYXpqQjNyNmxuRGJtMXN2UnFsUGxGSW5KRUR3ODJZa2FBbUU3VktWMFpC?=
 =?utf-8?B?UDl5SXNsWEp6VkMzb2RDaU56dFZrNGJjMmtQckpMZGY5U21SR3Y1WElwSk16?=
 =?utf-8?B?M29McnEzMThwdkFpSXJsUTUzUnM1SlJHdnY3a2ZINnBwakEwU1JYOW1DTGVH?=
 =?utf-8?B?WjQzWDRTSGxJNzFHS0NhSldUTURYc1lRS3FJN0gzSEhQNjN1TXRmU3lRa1N5?=
 =?utf-8?B?MU1pSnQwdTNOVnd5dFg3ZjVndXNmdHVuUGoyR2V2bFlFRW5qUmQrSldzdExZ?=
 =?utf-8?B?cmZqUkZyUnJqZFQzV0RERkJFdDE2NGw2L3pRUXFmSFptdTFwbndQdlFCUFpV?=
 =?utf-8?B?RlVNelAxV3pJUkpXamNweWpTa25uUjVlTHdyMUVaRUFaNmt4MWlmcEpvVHVh?=
 =?utf-8?B?dy9LVzRkVFM3L0s5aG9vUEVCWU5LVlAxZnBqaTNqLzVSd1ZnSXJTdU05Y3VF?=
 =?utf-8?B?cmNpVW9CVGYwMGlkNDduYXRsT1dCUk80dVY4WXJJMm8rclJaMUxkT1JsSGJU?=
 =?utf-8?B?dmtvRGxPRUNlSkljWWNjYmdhM1pYVVdQTkFBaGUxU0pRYTNlUzlxR2xqekdy?=
 =?utf-8?B?TUFPWklSNFFoNkxKOVJjTi9qNTF0Y1FrNnorTFdJMm80MjgwemtxQTl2R3hK?=
 =?utf-8?B?OFplTjJwWWxzL3dudkZYWUgwb0N2NUN0YlZFYlp0V2o3UkY1a1l5RU9yeExy?=
 =?utf-8?B?TXkxSjc5SGFMLzRqcUpHbWVwRTB4QVdtTkl4RlhKREo4ZGxyVkhrQ1NZZ01E?=
 =?utf-8?B?cW9ERTQzYk10dFBUVjA2bUh2M0J3N0hBRE82NTRsdnJ4ZlM5WHFIV2R2VW51?=
 =?utf-8?B?OGc2bTdrT0FBbS9TK1luUUttRlRaaUxjY2tMU3dlR0c1Sm10cy9VdXRhZmpB?=
 =?utf-8?B?YTlBb0VSU011dExvTzZweFd4bjVRNXRBc3VjQVNhaUZRcTZCNEovSzcxd3Av?=
 =?utf-8?B?MnZjQ1J3a2JkaE5HdW1rTkQ2a2hPeHlraWF0QVJ4T3d3WU1HSUdIdk1iVTlC?=
 =?utf-8?B?ejJBQStsbW5yTDZhWXIrYVozQ3o3L2VaTVp0S3VZZ00yWFZHWjhvV0NmSFdy?=
 =?utf-8?B?UzZmZ0pZWmFkQlMwRllaaWNVK2piRVp6QzVaMHphV0lIbWduRnBZWGxvNU1u?=
 =?utf-8?B?K0pISUhMNGJsOCtodFNiQzZGRmcvUUpZR2NBaVdyVk10SWQ4M1VodlpycGQz?=
 =?utf-8?B?d2dKQUdsZ044WGM4ZnNsZ3Mzb2pMYUl5c1F5cjQzRU1SQW5wZWhzdjZtNEhs?=
 =?utf-8?B?byszNEVaMVozUTZzejAvTTh3bHdlSFpjNGJpZ2tua3ZSOGVCYXk4d2I3TTZZ?=
 =?utf-8?B?c0FyOXp2YzhiOEtPb1pVMm12T0xvdnY2QVYwbU11L056Q2dlbzlDTmRQT3FX?=
 =?utf-8?B?WHQ4K3VMc3NTakNYbmVSVWZQNHdaUy9GRUpibm1MVlYrd1hOVTlrZ0pRNHVY?=
 =?utf-8?B?MmNUSVhJSGtQelNXV3NCY2lTeGI1Nk93ODdCWkJnQlNaZXFCaXlIUT09?=
X-Exchange-RoutingPolicyChecked: dHzaaVjGLJQfhj8wFhiEm/4cooRxnAPWJpC6ZbZNnrr3m/5h4MA+60niRX0VRBnFyqHiE6hWT3DHPGZSdcoHvL11a7/jS0DlN89fvq8USG6cUB1XYmKLYz/1qnLKF1SKoEu8Np8UMb3EXQRh//6JpHuBqherU2r/5WMXBAnRrr45WGrfpFG3SfpaR81BwsOPYC6EN9fYtQZij3MIGGgTF67AvdoeVKWarET2ObhUlsdfTDJrZJVsgljbmFtxYV0dkYpj/GwDwep/meAkC7eXaP9AFwkIMm/XzYvSDH8q353D4x8ZToiu32Fq1j3w+X8QiJ1E+ReLFwvDmqrG+h6BBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aea3aeb-c280-4bb7-0007-08dec1fbdcf7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:41:02.2925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFSR4qci1eJE2gNeSVavgzivUMdkYfhsLCSKyuh31f7Fcu8Zu09czFBWzmKQFivrPmIvuwWwKd+6mb0mU4N/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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


On 30-04-2026 09:59, Matthew Brost wrote:
> On Mon, Apr 06, 2026 at 02:28:25PM +0530, Arvind Yadav wrote:
>> GPUVA split and remap rebuild VMAs using XE_VMA_CREATE_MASK, which does
>> not carry runtime-only state. Forward XE_VMA_CPU_AUTORESET_ACTIVE through
>> the pipeline so xe_vma_create() restores cpu_autoreset_active in the new
>> VMA.
>>
>> Also preserve the effective PAT index on REMAP so madvise-applied
>> overrides survive splits.
>>
>> Relax XE_WARN_ON in the UNMAP path to allow non-default attributes on
>> cpu_autoreset_active VMAs.
>>
>> Add xe_vma_effective_create_flags() to centralise flag propagation.
>>
>> v2:
>>    - Move runtime state to xe_vma bool and keep
>>      XE_VMA_CPU_AUTORESET_ACTIVE as pipeline-only. (Matt)
>>    - Add xe_vma_effective_create_flags() to centralise flag handling.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 52 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 45 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 2408b547ca3d..65425f2f1bf1 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1106,7 +1106,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	vma->gpuva.vm = &vm->gpuvm;
>>   	vma->gpuva.va.addr = start;
>>   	vma->gpuva.va.range = end - start + 1;
>> -	vma->gpuva.flags = flags;
>> +	/* Pipeline-only; runtime state lives in vma->cpu_autoreset_active. */
>> +	vma->gpuva.flags = flags & ~XE_VMA_CPU_AUTORESET_ACTIVE;
>> +	vma->cpu_autoreset_active = !!(flags & XE_VMA_CPU_AUTORESET_ACTIVE);
> Should we only cpu_autoreset_active when the attributes are not the
> default and is xe_vma_is_cpu_addr_mirror(), I believe that is the only
> place where this relavent, right?


Agreed, this should be limited to CPU address mirror VMAs.

Thanks,
Arvind

>
> Matt
>
>>   
>>   	for_each_tile(tile, vm->xe, id)
>>   		vma->tile_mask |= 0x1 << id;
>> @@ -2454,8 +2456,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
>>   			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>   				op->map.vma_flags |= XE_VMA_DUMPABLE;
>> -			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>> +			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) {
>>   				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
>> +				op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>> +			}
>>   			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>>   			op->map.pat_index = pat_index;
>>   			op->map.invalidate_on_bind =
>> @@ -2775,6 +2779,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			};
>>   
>>   			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
>> +			/*
>> +			 * Pipeline-only flag; forward explicitly so xe_vma_create()
>> +			 * restores state.
>> +			 */
>> +			if (op->map.vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
>> +				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>>   
>>   			vma = new_vma(vm, &op->base.map, &default_attr,
>>   				      flags);
>> @@ -2817,6 +2827,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			op->remap.old_range = op->remap.range;
>>   
>>   			flags |= op->base.remap.unmap->va->flags & XE_VMA_CREATE_MASK;
>> +			/* Pipeline-only; forward explicitly. */
>> +			if (xe_vma_has_cpu_autoreset_active(old))
>> +				flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>> +
>>   			if (op->base.remap.prev) {
>>   				vma = new_vma(vm, op->base.remap.prev,
>>   					      &old->attr, flags);
>> @@ -4659,6 +4673,20 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>>   	}
>>   }
>>   
>> +/*
>> + * Returns vma->gpuva.flags with XE_VMA_CPU_AUTORESET_ACTIVE injected if
>> + * the runtime state is set, for passing through MAP/REMAP pipelines.
>> + */
>> +static unsigned int xe_vma_effective_create_flags(struct xe_vma *vma)
>> +{
>> +	unsigned int flags = vma->gpuva.flags;
>> +
>> +	if (xe_vma_has_cpu_autoreset_active(vma))
>> +		flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>> +
>> +	return flags;
>> +}
>> +
>>   static int xe_vm_alloc_vma(struct xe_vm *vm,
>>   			   struct drm_gpuvm_map_req *map_req,
>>   			   bool is_madvise)
>> @@ -4694,19 +4722,25 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>>   		if (!is_madvise) {
>>   			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>>   				vma = gpuva_to_vma(op->base.unmap.va);
>> -				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>> +				/* Attributes must be default on UNMAP; CPU-only VMAs are exempt. */
>> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma) &&
>> +					   !xe_vma_has_cpu_autoreset_active(vma));
>>   				default_pat = vma->attr.default_pat_index;
>> -				vma_flags = vma->gpuva.flags;
>> +				vma_flags = xe_vma_effective_create_flags(vma);
>>   			}
>>   
>>   			if (__op->op == DRM_GPUVA_OP_REMAP) {
>>   				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> -				default_pat = vma->attr.default_pat_index;
>> -				vma_flags = vma->gpuva.flags;
>> +				/* Preserve current PAT index, not default, for remap */
>> +				default_pat = vma->attr.pat_index;
>> +				vma_flags = xe_vma_effective_create_flags(vma);
>>   			}
>>   
>>   			if (__op->op == DRM_GPUVA_OP_MAP) {
>>   				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
>> +				/* Pipeline-only; forward explicitly. */
>> +				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
>> +					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>>   				op->map.pat_index = default_pat;
>>   			}
>>   		} else {
>> @@ -4715,10 +4749,11 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>>   				xe_assert(vm->xe, !remap_op);
>>   				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
>>   				remap_op = true;
>> -				vma_flags = vma->gpuva.flags;
>> +				vma_flags = xe_vma_effective_create_flags(vma);
>>   			}
>>   
>>   			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				/* Madvise MAP follows REMAP (split/merge). */
>>   				xe_assert(vm->xe, remap_op);
>>   				remap_op = false;
>>   				/*
>> @@ -4728,6 +4763,9 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>>   				 * unmapping.
>>   				 */
>>   				op->map.vma_flags |= vma_flags & XE_VMA_CREATE_MASK;
>> +				/* Pipeline-only; forward explicitly. */
>> +				if (vma_flags & XE_VMA_CPU_AUTORESET_ACTIVE)
>> +					op->map.vma_flags |= XE_VMA_CPU_AUTORESET_ACTIVE;
>>   			}
>>   		}
>>   		print_op(vm->xe, __op);
>> -- 
>> 2.43.0
>>
