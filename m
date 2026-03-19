Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3E11088E73
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 04:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA8A10E0CD;
	Thu, 19 Mar 2026 04:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNktYxkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DE810E0CD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 04:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773894667; x=1805430667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6gUWdtMGWH/lIa1/Vp8EMRowyZ92chZYIMdViWXg5Nc=;
 b=XNktYxkMDgbrBQ7lZiyVOoYt45y+VlWd1uYLcW0o8LDHifVsJaIdOc4X
 BPJWVJnDoVvXqW1XbeTno8H6a7wJ150lf/lMInOmNnVgjyPcdXqCfq0oC
 Z6GYGsZs+Tgl3iie1tDB+8T3wZVcZcVI71WAv6TtWAqZcREr5N9fuU7MG
 NGV7i4NP3D6Ih8AZJDZsNyu2ZcJ56UfHpmokbuoLQHluBeTfDA6E1Htow
 Nr+j9/6chbmVsvQhfUvgcnrnS6bo1DOaXThoqDtkOWX9tG3Dy72w7Jkfj
 4DfCYF/0je3nDxJBZ/bp/x5xws3kHIyCgPqF601ybkcGEeQ85Kdf0ZZSC A==;
X-CSE-ConnectionGUID: Yw4JTjVqQhC8fog1OBKFJQ==
X-CSE-MsgGUID: T6yJXxAeSy+aG1XS5MDncA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86439301"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="86439301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 21:31:06 -0700
X-CSE-ConnectionGUID: IiLgA+ryTdaS9Fh2CX6VUA==
X-CSE-MsgGUID: mrv9+sIWQIGKmPbVBgpLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="245872406"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 21:30:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 21:30:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 21:30:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 21:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEI1w+P1yvra8cwGYujnAqxsDwRbe7cfgyPbinKJzXOofR+iwRAHphULeDaxN2vwJxNWB0XXS7hxb+Bdwn9DBtydKDTLUsgYvgg5nmPbfMF/AoTbS9WJmdcpddY1spMauDzNRJ5otWTRIpv0nJMNcuCMSV18CPQuODzEgyJ1cSzfK+a+JXSuiVv+4F0fNekTl3B5FAfpeyMsA6ehzOV6BQWQw+hb4hGD0/8c4+mA8ag2/5J19t2ZrcwiG9D1e6EK9U8P3oIn57ljeZlOUtCYniZ7j68jcKuwKLON4umm4qf66PI0SmhWX6RDRvzoUVecYdgX7av0NcinQT9w7k/WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsJ6z23GsLmwyOkFT6UbPLc904euy6fYp01STC+E3ws=;
 b=PYYv2Xh3JIt+MusAm8ngSTwxV6wzFAuVXUtmxql0z6ZbzO7JrDGGffbt3dHXEa/haubSrn2wGD+zPZOpLnEuyHjGXD8s9AOd/o0Yafq0GqIw36NpYbbunW0djB1Bb86EO+mU90r1DEFge5eva0goIqaMrSeswVyUeiUZ53vkoAqocs0mqCKDKoYGRZq69OqfRY71y1WLOWTRpaV4Z3Qk6JuMpAqhNMel4Zkv701EiBYiiB8sMlA8PX5JlNE8orJliGbJSqXj6HWDzLUrYhwRzZiKunTudE4yR85hdncBzqBxLJKPudFaeNMGTIg5AsTkzwC/5Pe58YpQxd8xT0Q+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 04:30:47 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 04:30:47 +0000
Message-ID: <17637084-1ba5-4f7b-aa0b-3933a506c5f3@intel.com>
Date: Thu, 19 Mar 2026 10:00:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-15-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260313143303.2441609-15-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: db2bbd7e-aff9-4cd8-77d1-08de85704ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: j5fU+FET5Bzgy6UvD84JPmxsAZ0l8apbrZvckaH6ccJyYa1nq03QApInpN7+9ocvVyKnxe2n33jrGLcnkHECVPtIFscg3N+xgxkprEXjljFujADnKfKWol25U4Zc3mHsCtyjqqlJeDmmi3Ae08wcXIEsg2DhvjCpn9cu9D9ImBsisnPOP77/FVB0jTB9Av0rwe7RBraWc7KKbN/W44l2trxmSw379+4xXmZM2GsCYk0R2SmDn1ZGNtupIisMoVLnr0bWkMl8ZX/UtcU9SFvtQ8GORzNXAbmtfxy1s4mInnLNPHT23Td9UdU5zgOA+KXA1xdLVlTGGh+8SR9cT+3PKhbba5m1aNT0wwYmY9bEXI+fdYPEc126c0OvLrRsOSvTldvJYUbEbVzKuOcJw9+bg6lfsFk3nOPjGsVIChoc8+Iy9naDixS86gF0jPCLdq/9adr6LDmzYTnNUWiYBOfWMGzQk4xgDzdKfLosKIlp9hkeptisrm6rPiUxhkrrGLqYFH8CinXZmrnUiW/YlXooDZO2DxYOyC8u5dlk+vaNT2QTbb7LHZdzQActTX5om7YOHixhymmyXr+AXc8/xQP0bMZICseg+0oo/VdXWU2RBli2cBFJ6NN7Trz/S77kUtHD8GTdNHqhKKWSWVsjr/gyPoUm9MAQAOdaq4Srfc3SdlS83xFqvsV0MiD8mbee5J0wX9Dl4MrAYmN14YCGTQXTj95mrHuicLN31az3Wcgzdkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmVZNU1oWktpTDNDajlQSmw3bjI3bVQ2OUJrNm1iU1JjdHc1S2tmbVZidGNV?=
 =?utf-8?B?TDQrYk1WdFRVSkRSUy9yaDNldkM5czQwQjZmWWFqQ0V1cUJNS2tlNHh4VTI4?=
 =?utf-8?B?NTBUdDRvRCtCQ3N1dVdjOVpTRkttVWJmNWNWc2tHZ1dVUUszcG1Ock9qT1FK?=
 =?utf-8?B?anF5MWY3TUFtUTVuVU1Kclorc3MxUFZmYU8rMXFDc3d1TkVCRjV3ZVZySVho?=
 =?utf-8?B?TDdLa3RZWUVOZ0VVeTlwRDBnMGVrTjBYa2F6dVF1TnZnWFFuUlNWRTRNRnly?=
 =?utf-8?B?WlF4bXJFSkN4amQzMXN5NWFGL1lvc0JKNVIrbEJZRW1KWkk2eUt3akduRWxs?=
 =?utf-8?B?SmRLbWo2YlhrWGd2VmxwNDFWVWlMRGdTUGgzazNCU2dRZnpoYllXeE44L3Nx?=
 =?utf-8?B?VzZMUTh0Zkw5S3U5UjRNZ0JYc2FnWDJMQWp1R3loOWpoVFcvcitwNFYwZ1BW?=
 =?utf-8?B?STMvZHI1cENISzZwNWczcXllenYzcWtwckpnZHhLUlB4d3ZjS3lqYjMvaytk?=
 =?utf-8?B?QTJTYzA1dTRScUM0UGNvVkUwOFlwZVMwbklRUmxIMzh3RW9udDJNR1ZscUNZ?=
 =?utf-8?B?TEM0Ty9iVXJGWjE2VElNSENqdjhrOHdqTktKVTR0NDdJdlF0ZWNSZW9KNWZF?=
 =?utf-8?B?Skc5cmU1TVhicnlZaGsvTTJWVGtuY1hoV0R4cnJzbDJMRnJTV3kwK1c3dGNw?=
 =?utf-8?B?eXAxcHhKdXBNZHVKbnlyck12VUtQU1BCajU0SUpwZEhuU3hvTUpheHl0TENH?=
 =?utf-8?B?K2pxQlJwdENYdExpUmdKLzBwVmFIL2JQRmtCWm5wWnN2OVVqZTBYSGF2R3Nw?=
 =?utf-8?B?R2J3MDJ4Y25rSjRFRGVERkFoaW1HOEo4OTVzSkEwY3NZbExXeEJ0REUxcnU2?=
 =?utf-8?B?OUwweUQvYkd4WkVBMHRCNzdkdnc0SUZ4Vzdpamkvam1sbHJ4Mkc5dWlrVnha?=
 =?utf-8?B?bW1vdHptalVXTm5GblZFN1hDWkZWL1poTjRuTXR0Kyt0WlgvSVZuK2pGNnd3?=
 =?utf-8?B?aXlyVHNOSzNwNGpqT25QRGlhbGFSV3VHZTA3Ynd4N1NWZG1uUStReXJlTHRQ?=
 =?utf-8?B?RzNsYXV1Q2dQdzFyNVRGR3hvWG9aL1R6eG83bTR0OW13KzdEeDhzbXdadDVF?=
 =?utf-8?B?dldBeFR0dzlxZjFxalp4QkREcXlvOG9Ja1l6dkdGY2VUWThWNktBYlA3aGhu?=
 =?utf-8?B?NnF4YUp3cm1adTlMVGt4eWd4UithVTl1aWxuS2xibGZvWld6UkNsbW5UQ3ZF?=
 =?utf-8?B?Z01NRlRnL3BFZHBTOG8wSWdoMytBb1JZRHNhWEo3N2U1NWZHTHpIalliZFJ5?=
 =?utf-8?B?MFl4YS84TXRYUjJIVHFHQmIwVFdrL0JrZWJjR3pRcHBEY2FydlZ4T0U3Ymt1?=
 =?utf-8?B?allXNndWUS9vVkNDdzl0cnRVSk5wcXBpdjA0VDRlNWljMExWbjVpVXRFYU5C?=
 =?utf-8?B?UExPMHBhUWY2MlNVc0pGZGFaSWZtRzJ1bWNCV1RWV1ZkYVp6d051Q09vb3RO?=
 =?utf-8?B?NzE4M0h2Yzh6RXI5RjBXVnYxcE8yQmFPQzRGaERNV0VQRHJHUHlzdmNEMjB6?=
 =?utf-8?B?dU05Ri84b0VTcDAwK2xPeG9pek94T2FiMzZDUERxNUV0Tm5lQ2JMei9neGpL?=
 =?utf-8?B?V0pSS2JlS3N1dHpRcmIzU25KMjk0RkhpN1JJTkhDZERDWWN6Zm8wZlBmWVlY?=
 =?utf-8?B?TWZUNDlWWjlXbG8xd2VadFFpMGlET2hMQUlsVEVUb1Zlbld2MzdTVjhyREFX?=
 =?utf-8?B?UUtqN2JhRkVhd3BnRW5PVzdwUXFhbDRQZTNUSE1mSlU1TURFMmh3VERZcGUr?=
 =?utf-8?B?ajNoZlRyMS9jNm9GTUF4MTk1RGhtUHNkdWIwQ1VOdU9jcXhUVEVoSXhHTks2?=
 =?utf-8?B?V0NrQjV2dW51TFpseVh1QzlmancyU0hpV3V5dDVkVWdVeFRsazJYaTFpemRZ?=
 =?utf-8?B?dGFqR1AzQTRWbzN1QlZuUVYzOUIwbU1MdEg5bmM0TFNvVzNaNVduL1BnQS9a?=
 =?utf-8?B?QW9raGhveDBRV3g0b09DUC9DbmNORkJYZnhWbjN6bzVLZEJtTG4wV1ptVmFF?=
 =?utf-8?B?UGw4MXJwUkpIZmJwNkNOSVZtMmxwNVpzcU1hVjBPTXFkRkY4TTBQNFFFVWhI?=
 =?utf-8?B?TWZLUnRpVXBVYjdLZ1NxZTBYbHEvUzFyQWlPL0VVUWs0VDl1VXNkT1NGOTNn?=
 =?utf-8?B?M05FdHd6aHRCUWhaMEh0cmd3c2VyNGJ1dFY3OGJnbFdpcW53a0lDWWo1Wlhu?=
 =?utf-8?B?N3YvVFRoSy81MnJhdnN5YTVrMTR5UnBtTUVaMC9mQW5FQXFEY0NyVWFqQTRk?=
 =?utf-8?B?TVU1SXdFcDBIa2VoY0h2U1p2dHZtYzFJZ1hrQ0tsZ2x0OUJnOTlodz09?=
X-Exchange-RoutingPolicyChecked: cd0Skh/UGZOpGljOEkJ1Yu/M4qZHT+A+mlVi9euQBcV01dV83nUHVLLPC4uqxtVHaIeyev/4wJP+mlrEbZjcgrz+GYCWpBX/OVULQMpMDHZQ+vGxRJ+3vkxOT+ffzzsZXIOhVvnnMqlXhbjw1mK7v2z8BpbJqTxI48F6RBYAe6VA2TN9rSCYtDrlg/NxTUzHoW/M36KZy0RUcaSd6Vjl05jfQamOzFccZbgOHvPlb471XH0kSon7MQ/SDnqAhakQFwU52LV/+WBRGoFiBzSeByZiWScojx0M8QhGH044JO0w1peGwdJ3b8q5cnNXUGFG9I5Pwb6MWxGH7/BdUc0rjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: db2bbd7e-aff9-4cd8-77d1-08de85704ac9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 04:30:47.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFuAlF+h4q1tnIZiMQ0wcZTWsxPZh8Zh9u7iSjfKFTgK9eeHCJK7UolVd9bcZ3O616SFAyi0RjCH2ekKThBGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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


On 13-03-2026 20:03, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Add suspend and resume handlers for System Controller to handle system
> (S3/S4) and runtime power management transitions.
>
> The handlers disable SoC remapper region before entering low power
> states and restore remapper configuration and mailbox interface on
> resume, re-establishing communication with firmware.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v10: (Riana, Umesh)
> - Added sysctrl suspend/resume handling
> ---
>   drivers/gpu/drm/xe/xe_pm.c      | 11 +++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c | 40 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h |  2 ++
>   3 files changed, 53 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 01185f10a883..abdddd44a575 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -26,6 +26,7 @@
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov_vf_ccs.h"
> +#include "xe_sysctrl.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   #include "xe_wa.h"
> @@ -206,6 +207,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	xe_i2c_pm_suspend(xe);
>   
> +	xe_sysctrl_pm_suspend(xe);
> +
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	xe_pm_block_end_signalling();
>   
> @@ -259,6 +262,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, true);
>   
> +	xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> @@ -618,6 +623,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   	xe_i2c_pm_suspend(xe);
>   
> +	if (xe->d3cold.allowed)
> +		xe_sysctrl_pm_suspend(xe);
> +
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return 0;
> @@ -670,6 +678,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>   
> +	if (xe->d3cold.allowed)
> +		xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 84e3b70043a1..a3ac49e1985f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -82,3 +82,43 @@ int xe_sysctrl_init(struct xe_device *xe)
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_sysctrl_pm_suspend() - System Controller suspend handler
> + * @xe: xe device instance
> + *
> + * Invoked during system suspend (S3/S4) and runtime suspend.
> + * Disables SoC remapper region to allow safe power state transitions.
> + */
> +void xe_sysctrl_pm_suspend(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, 0);

Do we need to explicitly disable the SoC remapper region here? It will 
anyway get disabled on D3 cold entry during suspend, so re-enabling it 
on resume should be sufficient.

Thanks,
Badal

> +}
> +
> +/**
> + * xe_sysctrl_pm_resume() - System Controller resume handler
> + * @xe: xe device instance
> + *
> + * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
> + * Restores SoC remapper configuration and reinitializes mailbox interface.
> + */
> +void xe_sysctrl_pm_resume(struct xe_device *xe)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_sysctrl_mailbox_init(sc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index d5d8735038ae..a816feed8da6 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,5 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_pm_suspend(struct xe_device *xe);
> +void xe_sysctrl_pm_resume(struct xe_device *xe);
>   
>   #endif
