Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05407C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 23:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55110E039;
	Fri, 28 Aug 2026 23:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbI7SDnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8867A10E039
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787959817; x=1819495817;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/oJ7gUbZc6X/jphWfZ7r36Ulk86EeE2pN0ReQFByDg=;
 b=MbI7SDnWiZZ9m+efc0TI2FhZbpiKEUTFoC33XljBxxjcXvIP1KFoIB93
 cD3B2Ty0EUCqnEmJq3+9xb696EGSseIO5eD8wKmv6a7iAKGq+SG7xK9kx
 R1Js95GpFpBkfThdyMyK3CrbgAMzanCf7nDS3cKYc24+aKcD9DCipKBSp
 MMGU55wbVl1LOjpcNOaZ8wuhSw9SkrSHfIhhsCDTfIRA3QVVcayDOJalj
 XPzgnqS4gyZ0OHRfpj9sFUzK8h7KMHW8uofRsr052Q1CHFOceM9xTVCiU
 foruDMudl/eVESf4g2RyPMdWrfnMLo4DFSFd1JxI/Ds+gOqIWzH6OreUR g==;
X-CSE-ConnectionGUID: gPAAEoOCTn+UkvTtyPhZWw==
X-CSE-MsgGUID: NF7sCKbJS/SI6LN6/0+MRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88326706"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88326706"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 16:30:17 -0700
X-CSE-ConnectionGUID: MABi9fLgRom6yWeUaUd9EA==
X-CSE-MsgGUID: 5sJ1AOTQT7Cr6vbRtQvHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="306516084"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 16:30:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 16:30:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 16:30:16 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 16:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ6laFYd+DB3gxpdyht1wlziHu6hC1fQpFv9sLeKRfPRJyw/vrjn2/A7LpKfCud8x4UeXdPXuI4mIjX+SB4y8GriKvLeRvTavUVH9v5omvQpgoQthvJbeM2CxSuiVIyUHEtT7iIvlpxnN/riH6mCYUXAJ1Ye97kfDXDBdjfSpPZAMa7VBv0ytBBiWob2QzWaJIcvwUAIeIgPb8bEX8KZctUqBytdFiswZdLzrapoYuf4YG4TydbRLQuxvrv/vJubgpDFl8LC2a4Wck9s7jl0E+pj7RT6gNlbOzpqQDYy/8W1gbpaD+q+D79b3geKF+ujjX8COEXqneDl7RtAzPG+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGa1BftNDHc5O8ATGmrs7MK8J9AQRH3je45hleod6mI=;
 b=RGezZlKpaqTQB4hcCwFdWCl2GuUXAnWhIxW9OXk1xpklukqmvJ9QeVhG+/LoUMqJyowX7icdMeVHiOuUKZSyXRs591nK0AmpdzKYGe1+yeG7rK0gzUYqLkolYvNUtfhmCVv7iMZjTc6TPGmcfd6+JL674ezIRVvWeCyk3CBKYdtKmekbhjKNPS5PyxOctCP+uc4rwKm/q4G5Mq9bBF2pYM2hQf1BXkqS2B9FKyLLhw8rKfj3SFJwz9uT2XvGONcn5iZcMrz4pBjOlRyucJ3SzlMFIixtSUIu8YAXF7oyqlLy9f+AHawoz18vbN8XgxLRhSChNQKR9bUl2Ks8aCF82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 23:30:08 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 23:30:07 +0000
Message-ID: <ecfc0273-eab7-4d5a-8937-53da468a5a73@intel.com>
Date: Fri, 28 Aug 2026 16:30:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose per-engine idle status
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260723194303.2507234-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260723194303.2507234-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca05f8c-dbd3-4b41-8066-08df055c4ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: EvBK3Bj6xrvSvp9JSjnTfv3E4baXaX4g3vV12V3E1cn5q8paSWbtt297Nb9H22r/HVZ/w5E42b5SR5xgfKKjoYG5kkTWcEIBgFsIoXeQ9ozfViSe+d+jUsWWzetkVz7jvVQKrRNzVh0R/IePLaxuanGkfPYtJvxnIY4WvcadQCOGBLtwxwYi15coQVOMByiPDKSG1krjTVW9FSk78JFrXDQOtmXZgHmq2IXLc64ffbzGNHEV8MnoSOzS6RJ1sbmv+4jw9cRTL0G3Bz5btOLV2sf0QPfm7RxrK300wxeCviN5eaxAkGvLgR0YGXUhN7SkQbCOjPBonA/QH4nvc+FR4oLwiVTdMEL8vxkx868gAJPIQeZQ0Y0AIeKHsrkabETxNOpdhmI1DGyB4u6ob3/pmEGSIc6gx/nt/fScxLWatY+Uwi91++3glDSxGSIjgo/HaxJr8A0+8fIbDDtAVaPDEEhkXogirZYPdWy6bBwnw/KUlAH3q7073g1R3iV0TW0YWngz1w0VdLCxsXPU4K2v/Iu2PpmT+OH5NTRphiltb69SyV6Blp1OfUywBMrUkTbg384y5SN1NoY1AYnr5lX9RxYVPqrC7FiCPKqT7fq887IXYzwgR86sZAdXY4qkTP9CZyJuG8hRz+tTM/IThlRuuOoQ2yc9anem+KaHXczASlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVB0TDJiS2RPVXI3Q0dZWEh1UDdhRHJxMTlKSC9rYzNaVWt5cDVIMVNvYkJ0?=
 =?utf-8?B?a0Y4SjBuRmNWYU9ndHFFaXNydUtvdnMxUkN2VFp1NTIzeG1qQVBXbGNwdXo0?=
 =?utf-8?B?RzA4aVo2b2tFN0lkRVY4OGxlOXZrNjJOcFpOWkZzM2JZMHNpcmJXWlR0cUYz?=
 =?utf-8?B?ekxxNDlSU3piTkNTVEREeENnT3NLQ0tXejhhMHJHSE5TOWp5NHpaTHMxcXdu?=
 =?utf-8?B?aitpa0hFdC9GODJVMkgwTFJTMUJUc3lEZWlCRVdGREtudHZOeHdKMW42VkhY?=
 =?utf-8?B?RlZTcmNDYUFjVnJXQk1FL0xoR0ZvRlBBUzNydDNKMU03Uk1Qd29CYUxTWFY1?=
 =?utf-8?B?MkRta1ArSDR2NmQxY3NPNWVucUNBaTNyUnltZ3BoVXd5dXU0bVpSMlNsOFlR?=
 =?utf-8?B?K2cvS3kvc0VZYm9VVnEyOW1KWTZrclU5bzljZ1Q4Z3FRL3pabEYwTGNHUzJX?=
 =?utf-8?B?MWg1dWh0ampJRGZ0bi9BN0U0aGhMV0ZPVE94ODFzY1k1SHN5OGdsMndCWHMz?=
 =?utf-8?B?R1pDdG5sTUpYRVlUK3ZFbTNjQjlvZHNQcVByMy9uRHlXNDdXN0F5Z2hROG9z?=
 =?utf-8?B?K0FQaS9PSE1odkRjMHBmY0ZBdFYraGpYL1QzNHJLZXdqUE1nSjQ4WjR6NlZM?=
 =?utf-8?B?N2ltU09pcEZPcjhQQzVOeTFWOEphS0IyLy9EUEJibHRzTHlwWjlrd3V5d3d0?=
 =?utf-8?B?V3dFa0FLQTE3MUE2S3lFa3phOG54QnRMWHN0eTM4ajU0REF1QVNKMnBRc3E3?=
 =?utf-8?B?c0xqVkM0VHdta0Z5cVFreVZ2bm03OHUvMms5eks1V0NGVkRVSnhUY0djQVR2?=
 =?utf-8?B?SnA3T0hKbUV1MWVraGY4cDJBM1VOWU5VNDB6d2dJSks4M0ZpVGdPL0tBVzFz?=
 =?utf-8?B?UGlxTVlnaVErRUVXaGVFbFN6ZW9NSWk4bk1NMm1Id0dvS1lLRlpNMGVxeW9m?=
 =?utf-8?B?NS80MHdEQjgxb1JZVjJRN2tmSXJpTGVPcDIwS0wrMnZKY280dlRyNDFQZmRo?=
 =?utf-8?B?Smg1LzIrSUxHQkZXaTl2UmRUV3pmM0JZUjFhWmt6R3R4bTY4WWtKUzlFWHRK?=
 =?utf-8?B?OXgyYWRlVTdiRm1PWVQySXgwZEdCcXdWdWZWejdIbEFKSk9pcHpydXBYZ2U0?=
 =?utf-8?B?YjRKcVRwZnhkbEtuYTZvcTNpY2pVeDFmVG1OTmRCZnc2RU96TEJ5NGlwekZY?=
 =?utf-8?B?YjlMTy8rVzZBM2wwSUhDVWIvbmp0RWxmbk5zcmpwbG1lUGlKRmgxeHRkUkRl?=
 =?utf-8?B?V2NHekR6U0dRdEVHL2ZNNkFwVnJXcithWlNJN0ZOM0thTlRvMlVkRjUrOGxi?=
 =?utf-8?B?aGFjdFUzZmlOZ2ZiNnhsTytmYjhzN045NmFieHoraGFDSEJMTHFVeDlKKzRO?=
 =?utf-8?B?R2lZc0RnZk5RSjVrTkxIRTdyb3BYWVo3dWp6NE9CaHp1d0VmOXlwM1I3VmtT?=
 =?utf-8?B?QVBzLzcrcFBKdmtlVnkrRWN4WTdicE1DZE5GQXB5eXpIWU1KMDJoNzlmckJ6?=
 =?utf-8?B?bXpKZ3VpVHkvbFlqWFVyV0VBbkQ4K2JxZHZvV1lwL1c5V0VvS1NPYU5MNFhq?=
 =?utf-8?B?QWkvczZMV3lmNE52MHdidmNYbzhBL2I4dGFpOEw1dDB2K3NVUGQ4c2tNZExh?=
 =?utf-8?B?clVHSlowZGRuMDhJckxOUU41Q21nK1h1Sjdsa2hlNklySjlkRDZWWGZma0dr?=
 =?utf-8?B?QktITjFrWjZkWVh6UldnRVhPTTc3YmtlUWFrcFI0QWh3K0wrWThtSjZyaFlE?=
 =?utf-8?B?VFowRDVONmhuNHhtczVXd1hlaVJ2ZEJpdDFJSHc2TndFak1sQm9wYnc3Qkt4?=
 =?utf-8?B?cFhGMFZVUFRmdzN0SXNBL0lPS1RJRjlINHRJeWtZeFlnT1prUDBiMDVlZjJO?=
 =?utf-8?B?L0d5OWFxc1Q2dTZSeS9UQ3AwUUVYNm5rbGJzcXlHVlEzbHVITXNrSEJDZWJU?=
 =?utf-8?B?US9TT3UxZEdCalFzUFZpZ2ZuN0h0OVdlNEY0VlU5aUVHZzhSZWorbG5yNEF2?=
 =?utf-8?B?RVV1Y0RuWlN3UmUraDhaMHpDL3ErM2xmRWx0d01EZzZMK1gvY3lDOXY2US8r?=
 =?utf-8?B?VEZ4YTFxVjZHK3NqN0ZYalUrS1FWV1ZYVW8yZzBWSWc5UUFVUEQ4cmxxdERI?=
 =?utf-8?B?TlhjWmdMTFl2TFU0TUlVanlreVdpaGpNSFBnWGpFd2c3cCtoTm4zaTV2SW5h?=
 =?utf-8?B?dHROd21tVmRqWmhwRUU1T0pFYUxCekdjTTZwZVdqWlpZZ1VJOW5XMThhcUlw?=
 =?utf-8?B?SFhId2hnbEVJcGloaXZJMFFjTngvbTU1ejNsTENxSjBBTEcvQ0pKYnNYdUcz?=
 =?utf-8?B?QXJ4bGsrcDNCRDFwNmZXQUxZVmhiOU94Rm5wRE43aWl0SGZOb04wTGFpZGlF?=
 =?utf-8?Q?ZufGrvXqeIyA2GUQ=3D?=
X-Exchange-RoutingPolicyChecked: xil+P3P4+w4GO8512ESGBXWseSAntRK+qc8ljQizRiI4dLhL3IY4kzdtNX5gbW9YE7yZjbguSAWOUgQ7w/Ee1yIrmDZTuA+edAujjdgO5K/a38ftQtHQtsEW1cxDdB365BzypbdLfbdefZ6V4xHJbbxzv//I3C14KU7OLHIxpjJgvjvFJAj41T3lr7Sw0wZ3LT1In0wfzOGWQ4K5wBqT1Lxd8K/u0lYbk8eYSBMbK0Pn9HDe4iWhXnGfy13KDqg/OqhSMoyQJOEtHATXdZRhN8gUpQTH4JS+zDoANkg4tPLCLMou74JRRef5XCnlLqIF1Maswo3hUiEvs6BVBeaPqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca05f8c-dbd3-4b41-8066-08df055c4ba8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 23:30:07.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qt1sR9d2iOVrdqqrHraiMC7x8HTltsA4MVbU/Wpr3CRrw2myvJol21TbhDZviqGt/3pGZVM/hF/F05/Q/DrrnKtlj44kVHFhjqwYD0fVGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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


On 7/23/2026 12:43 PM, Sk Anirban wrote:
> Extend the existing "hw_engines" debugfs to iterate over all hardware
> engines and dump their idle state: whether the engine pipe is idle or
> busy, whether C6 entry is allowed, and (where available) the forcewake
> request status.
>
> v2: Use existing debugfs (Matt Brost)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 ++++++++++++++
>   drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 54 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
>   4 files changed, 83 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..accf3012bad2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -196,6 +196,33 @@
>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>   #define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
>   
> +#define MSG_IDLE_CS				XE_REG(0x8000)
> +#define MSG_IDLE_VCS0				XE_REG(0x8004)
> +#define MSG_IDLE_VCS1				XE_REG(0x8008)
> +#define MSG_IDLE_VCS2				XE_REG(0x80C0)
> +#define MSG_IDLE_VCS3				XE_REG(0x80C4)
> +#define MSG_IDLE_VCS4				XE_REG(0x80C8)
> +#define MSG_IDLE_VCS5				XE_REG(0x80CC)
> +#define MSG_IDLE_VCS6				XE_REG(0x80D0)
> +#define MSG_IDLE_VCS7				XE_REG(0x80D4)
> +#define MSG_IDLE_VECS0				XE_REG(0x8010)
> +#define MSG_IDLE_VECS1				XE_REG(0x80D8)
> +#define MSG_IDLE_VECS2				XE_REG(0x80DC)
> +#define MSG_IDLE_VECS3				XE_REG(0x80E0)
> +#define MSG_IDLE_BCS0				XE_REG(0x800C)
> +#define MSG_IDLE_BCS1				XE_REG(0x8680)
> +#define MSG_IDLE_BCS2				XE_REG(0x8684)
> +#define MSG_IDLE_BCS3				XE_REG(0x8688)
> +#define MSG_IDLE_BCS4				XE_REG(0x868C)
> +#define MSG_IDLE_BCS5				XE_REG(0x8690)
> +#define MSG_IDLE_BCS6				XE_REG(0x8694)
> +#define MSG_IDLE_BCS7				XE_REG(0x8698)
> +#define MSG_IDLE_BCS8				XE_REG(0x869C)
> +#define MSG_IDLE_GSCCS0				XE_REG(0xA62C)
> +#define   MSG_IDLE_INDICATION			REG_BIT(0)
> +#define   MSG_IDLE_C6_ALLOWED			REG_BIT(1)
> +#define   MSG_IDLE_FW_STATUS			REG_GENMASK(13, 9)
This field is called FW_REQ in bspec, we should stick to the same, so 
MSG_IDLE_FW_REQ.
> +
>   #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
>   
>   #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..b918f046ae15 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>   
>   	drm_puts(&p, "\n**** HW Engines ****\n");
>   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> -		if (ss->hwe[i])
> +		if (ss->hwe[i]) {
>   			xe_engine_snapshot_print(ss->hwe[i], &p);
> +			drm_puts(&p, "\n");
> +		}
>   
>   	drm_puts(&p, "\n**** VM state ****\n");
>   	xe_vm_snapshot_print(ss->vm, &p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..621d1e57e997 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> @@ -22,6 +23,7 @@
>   #include "xe_guc_hwconfig.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
> +#include "xe_mmio.h"
>   #include "xe_mocs.h"
>   #include "xe_pat.h"
>   #include "xe_pm.h"
> @@ -111,6 +113,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
>   
>   static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   {
> +	static const struct {
> +		struct xe_reg reg;
> +		bool has_fw;
> +	} msg_idle_reg[XE_NUM_HW_ENGINES] = {
> +		[XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
> +		[XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
> +		[XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
> +		[XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
> +		[XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
> +		[XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
> +		[XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
> +		[XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
> +		[XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
> +		[XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
> +		[XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
> +		[XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
> +		[XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
> +		[XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
> +		[XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
> +		[XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
> +		[XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
> +		[XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
> +		[XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
> +		[XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
> +		[XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
> +		[XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
aren't the media related idle message registers only valid for media GT 
and similarly those for render on render GT? Here we seem to be reading 
all registers on both GTs? So some values are invalid.
> +	};
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   
> @@ -118,9 +152,27 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
>   		return -ETIMEDOUT;
>   
> -	for_each_hw_engine(hwe, gt, id)
> +	for_each_hw_engine(hwe, gt, id) {
> +		struct xe_reg reg = msg_idle_reg[id].reg;
> +		u32 val;
> +
>   		xe_hw_engine_print(hwe, p);
>   
> +		val = xe_mmio_read32(&gt->mmio, reg);
> +
> +		if (msg_idle_reg[id].has_fw)
> +			drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
> +				   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));

should be FW_REQ here as well.

Thanks,

Vinay.

> +		else
> +			drm_printf(p, "\tpipe %s, C6 %s\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed");
> +
> +		drm_puts(p, "\n");
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 82df19b304e1..5a4d085660a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>   					     list);
>   	}
> -
> -	drm_puts(p, "\n");
>   }
>   
>   /**
