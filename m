Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B60D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 17:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838810E065;
	Fri, 15 Nov 2024 17:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDZD5+ux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619B510E065
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731692978; x=1763228978;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JFeuZGPQDrErrHdtMKY0EuUdq/mU0MXnbFXCyRppwlE=;
 b=FDZD5+uxpBxW83P3MfLrH/ymeAqlJWsIHYCtyWgB+GRNNk0CZuScX4I4
 gCP1etmYItZSRhkENM+TKDSLSvVI+MKkj0TW9OuZbB4QS3SSaB+CCSRgU
 mequLqdKHvltNfpRsxMYCOxSjBVSYFegfxZMafT9WswIWxBhbcp1Iiq55
 kg2JK8ZJS20tN2T3aDzOfjDvQXH6+hO5flsEHcNGbnY/JeBIQG4jHQRMR
 u2AFMtyLD5WnaI/MDg9MqBczCVLFu/dOcF1ycVj6DkJSNgGEHnXZttd4g
 DqnVcsoBk4vbu8ro39PmKhGsODomqQnImAEi7W29IPX79YkCaDCx7hXyD g==;
X-CSE-ConnectionGUID: Vp61Fiw9R5SVdsByUH9l4g==
X-CSE-MsgGUID: pU706BN0SfKcYxd9EvNvSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31552026"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31552026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:49:38 -0800
X-CSE-ConnectionGUID: tLh4yQBdQwWyIsDblQREoA==
X-CSE-MsgGUID: wTWs4XL7QZK1gy82E0DnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88386285"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 09:49:37 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 09:49:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 09:49:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 09:49:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtRbHiIJs3gpdsnSSYimmVU/f/3+3klVmqZO6iosMbZ6WEVnRhzgEq90qbxRCVFbUY6MsvBKRomRgnaMcgH47MyVZO/+TtkMHZzYpZ1HS7cgesgPZv+Tpuoh1DeQViAqiBv2tZ7BrCnVrDx2qsLagUvU0ZMQZ8HdAOcTtVQhZBiAEft3z5gHHJbSUSpHsIQOrLb1Wkgl7bjEgjwpWI3I6Vq5miwTTSpagE84BuSpNwccShUhVmPylNWWpdf2+X9FDlpPe9hz3MIIe/4m/oe66M11nNR7RZXcxig1ekAl7rlem6krYHsZYcLosRHnqyp8y/IrPPx9gbPsJJqRKTgzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n2DPOn52va0TKwq/kOSK0x93DQdrh8gf/mTSqXErtk=;
 b=KaHAPYnMey33Eb6inp1zX9JKvwF/Kh4puDHeimh1Xg6Xmsbnvt4N7q0+XnOpW5rW421oJ0JZj3tl/bwvABx1t6dhnjJZHYAupbDdmEvpdACv8vnJ2h/QjfyclVg8M/t0oNDoFsPiMBfOpKu/Z0CdfSei07arSiWtOCq9GdHrtRqHx3G2bqxMS96MdhLXQ2wugJ3D/2xPoB50XjaMlc8KfzWpV75dqSnNDbi4K/x9hgNnKvxei/4pFNUVnhw0uF1DgiNJVkO9VSMu2v+rmgwDpx3uiV5wePFnGp3C+K6cAW3Siw1CC7su1qFHuLcA0YBelEJ0a7UEEDwX/P4Xtocaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 17:49:34 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 17:49:34 +0000
Message-ID: <92bf2146-0cba-4746-9a5e-70403fc24b6c@intel.com>
Date: Fri, 15 Nov 2024 09:49:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-10-daniele.ceraolospurio@intel.com>
 <29b4c644-f70c-4608-b8cf-7a24d8c6817c@intel.com>
 <ec48bace-df0c-4ac4-b666-711555f312c0@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ec48bace-df0c-4ac4-b666-711555f312c0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: c520cbfa-b916-485f-44b2-08dd059ddd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnVZVUNScjdmSnZKRXNWQnJ6cUcxLzl3RVNVSjY2SnpDc1NEalAwNS9yMUFE?=
 =?utf-8?B?QzNtakg3V3BLWVZYMDhsZWdMN3drWk1MK2pvaS9BNm5yU01nM3l5SWpTbkRC?=
 =?utf-8?B?dmJkcGlmakF0SWs2M2lzajF0SWQ5MldocC9HbUxlUnQ3SXlEaXdzL3FwSFVH?=
 =?utf-8?B?Qlh3ZnJkU3diNm9VSFMvVUZPcjVSVi9pWHcvUFl6bTROUFFzVHpjM0JNTzEx?=
 =?utf-8?B?dWYxV1J0d3ZhbGFxOHdNdjNEL0hiTTBwdFc3Q2ZoOUsxRHZ4MlFWTmFndzdj?=
 =?utf-8?B?VDF4R0NqMGdDbXFWd1NSUXFLR1RuenFwNU5ZUzJ1UHNPMDREeFprWFB2ZlhS?=
 =?utf-8?B?NTJ6MHNFYTRoQTh2VDJUd2l2b1BpSnZ0VWVrRXg4YzA3V3RVUFY4SUhvR2pu?=
 =?utf-8?B?R0JRaEpTbmRnb3NOV090TW55clczQVhDSnJMU1FpUlYvODhodzhza1loMUdO?=
 =?utf-8?B?SUFXRmczRTlUSjcyaDkwbmpJdWRmSFBQMndPanpRMXdMcmlUOU9ubm9lWTF5?=
 =?utf-8?B?Z1A5MlVLbWFWcHF2K0EyRHdsa2lhWFpjaFVhYUx2N0R0ZmhVQy9MWG94WFUr?=
 =?utf-8?B?Um9xc1NVanpZUk9kY05iK09YNnBuY0pDZmh3RURnRUpuZXB2WTlKNFFtUTJK?=
 =?utf-8?B?YWEyYlVRc3h1Wlc3YStxN0FGM2pkT005UEUzTmtzL1NXN0tiZW4wRFdzYUU5?=
 =?utf-8?B?OXRVVmVmUTJ2cnhmT2JVOExhYzBZYTNuU2RDK0hzV0ltK2trUmhCMEFQdVBM?=
 =?utf-8?B?YjY5MDJGY09OK3hncXBubDVyUUNVcG0zSU13aElYdmhEL2swLzlIYXp4dWRu?=
 =?utf-8?B?bldwN1l0QTl3ZHFaTkhBYVRiaTBrMG55SDlWYnRnUXJyZjZRbjlFYi9Caldv?=
 =?utf-8?B?WW11WDh2cEdycFdtMjNEbDg0OFpPR0wyL2R0a1hmWVZVZnU2byt5R2RaM1Q5?=
 =?utf-8?B?KzZyWjl5TS9GaE1JRmliZUk0MzZJTHpmTnltVFl1Z3g3M256cHVicERmSW9S?=
 =?utf-8?B?NjQ1UlRoT3d3emgzRUtTaXNSb1hCYWREZmt2RE1jcnRpNWoyVlIybGVrbjR5?=
 =?utf-8?B?RWxHWDlUZkJRTFhmeWl5RzlSZk85RzMycjJPbm1pTzB1akxKRU1jVTE4MmJF?=
 =?utf-8?B?cGFOMGdIeTZPeWM1eXZpaHBKODdnMVZPLzJ5Ym00bDNYK2hWWVVXeEFFK3M5?=
 =?utf-8?B?bGVsNEgrZlZSaVR3L0lYSWt2OXFWaGpQd0NtQU5VVG9NbkFpUnZlTE9rTSti?=
 =?utf-8?B?dmFEMVZDNHc2MWtuV3BReVJPY3JkUUtSOFVma1FGNlVxY1FzQldzdHZ5RitG?=
 =?utf-8?B?cTlqNmdHRHlCaDBFa0dFa3ZCb0lhTnh2WGZpSEFqVmpHS3gveUFhWTIzdzZn?=
 =?utf-8?B?Vnh4eERRTkkzMTZOU0J1Q0RRK00xMUFuOG1uZ2I0Y29jNitXV1ZWOWNob2ow?=
 =?utf-8?B?SkpzV1FQeUloWk5wK3NyMzZoeHRpQVpDaE1qNkdONzVxdXM4dXdkZmR5RTlE?=
 =?utf-8?B?YWNxSDlrRXlEaEErR3doZzlyWENOTlB3NDJ6SnNzL2FoSXFGTVJaMWU3em1p?=
 =?utf-8?B?UXlPNkZNei8wa2t6eHdGV3BYZ0VVSmFLTHZwV25NT2VBSmxpZElJYkhSa3oz?=
 =?utf-8?B?Z2xlb096bjBXWWNGZUQ3L2V1NDk2b3V6MWo5V2Z5TC9GREdNdHpIWVJiRU52?=
 =?utf-8?B?b2xXRlBteUgyenp0V1J6QzFWTERLMC9JNzdWY2RZVDBNenA5dFRqbFlkTGkr?=
 =?utf-8?Q?QanbosB4TEz47SzP0adLQuYUNnExux84ewE/vBN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRvYTJjOXVoTzVaNFNKS0h5OUxPSjRSeDdhd2dqdHlQQi9rMkxXVEt6VHJk?=
 =?utf-8?B?T2NNSC8vZnA2TVE0WEZvMGE0akdheW13akRDcjhITjN0MG5zZ2N2MktIZzda?=
 =?utf-8?B?UkhMc0czQy9QYkQzay9ZSnZab1B5U1pLSURXeWdJRWdKcDEyM21uVjNjRkpG?=
 =?utf-8?B?WlpwNDd0Vzh0bmhjOVBsTmo3YmU1L3QyZ0pRalZjRUVSNytWWG01ckZ6SkZ5?=
 =?utf-8?B?U0wyaVdZOFlMSGM4UXdneXh2MVIyb0R4RHB6S1dvVVdZOVpIeDQ2bmVLMVli?=
 =?utf-8?B?akpIYWxiMTUrNk04a0dMd09Eeng0UCsxMllMMjhqVzV0dmZzYjRjbTJRa2xk?=
 =?utf-8?B?NXRmblFiYy9yRFpBbEUvTFNmL01zZkhWSHk3UjJZWGJQYkdjd25WMzc5dnQz?=
 =?utf-8?B?MHNrQUc2dEczb1ArdEoxZVVKdnhlUFRiZ29GTW5PcFBZOXFrV3k1dFhoZXgv?=
 =?utf-8?B?NmVSM05qRW1uOS9qYTV5aUxMY0dYRUY4QVV1WWdraWl1bVlxV0M3aU90Rkd3?=
 =?utf-8?B?c1V2Ty90OXJkanZVbCtQRjZqNHRnRjRMNGdRc3Yycmt6aFRDKzA1Rnk4QlRw?=
 =?utf-8?B?ZElXam5CMHp1RGp4RUJwd0JwaU01R0JoL3hoVFRPS2hyWlN0YzFCOEhNY2JL?=
 =?utf-8?B?NC82a3JOUDg2MFZhOHk1N3g0ZXVZVk1OSnJrUzgvZEN5a21FQTR2OWNaV21E?=
 =?utf-8?B?aTJ6eE5XV3NORXVpbFFFRWxyeEFxSVY5QWtUQ3J5N3FxY0dySmVKaDRBVFc1?=
 =?utf-8?B?c0x2WE1IV0JXYVRWdEhDQ0l5dGtjTWYveXJjNGRvQzNYaFlRdDdGOUx5by9l?=
 =?utf-8?B?YlUxYjlHN3VQaG5qb2JYTVRlVXZMaVFIMlE2d1RaWHNJcTdWajdEa1dIUFh1?=
 =?utf-8?B?RDVWZTBjL2w0dG42Y21taUpwSEsxaUtpVCtldGJnYVgxUjRTT1dLeWczZ25W?=
 =?utf-8?B?ZnE1d0syeTA0RWVxYzdVM2JlMW9IS2syT0tvaFlha0V6SVJGK0VVM1NQQmZa?=
 =?utf-8?B?Y1VBUUR3SHNCL2dXUjVxNVUxVWNpRUhYb3dLQTJmYlNrZ1gyWWlSREJyOWRi?=
 =?utf-8?B?dmllMVlXcFJiRGlhWlc2WnRvYm1WM1ByYTE1SjAyZ2lRMEhDb09nSXllZk9R?=
 =?utf-8?B?SU1DVmcwa1ZIL21lb0VpYkNpenRZKzhNWXkvajlHRjRiWkUxa0YzOTQ0U2FW?=
 =?utf-8?B?anAxSlZvOGJ3RFg2amQ4TkJVZUhjYnRqYVdjTVo4MWNDcGJ5L2UyRGRaSVp3?=
 =?utf-8?B?UHg1OVNsYVBNcGQzWTlETFFUL3VCWm9HYThCbXdnQUhaSU9iUFYxYWc5Rk1B?=
 =?utf-8?B?VW40TXkyQWZJOFFBZWhIS0xSM1RQcXBwSFdNaXRJdkdjM1MvY2UwZzdmWXFI?=
 =?utf-8?B?ZGJ5akRJa0I1bU5UVU9RZVY1Y1ZIZXBWMjNhd1ZCNUdsbnVmd2VEWi90ZmZp?=
 =?utf-8?B?N0RVY0VIbUZacE5hK3NoZlJCRmZrZm9LWmYwdVBmbHladkFXNklmQUxoU0dq?=
 =?utf-8?B?ejV6SzJ4TElKSEZLQ1FtTkJ0cTRYKzJ5NDNleFQxK21PUmp2WjNlblJtNWFQ?=
 =?utf-8?B?eHVMVldwenRPQTRSRGdCQVVRMEg5aGpuSG9DdzNDUmlWdVlKM1FWcTlMYzVC?=
 =?utf-8?B?VFdxaVpjYWpCdEt4NVI5M1J4VkN3TkRCZ2tsaDZNdStEVngyRlhmTUtuM2VP?=
 =?utf-8?B?VDZZQU9JZ3hLVlhlRVVVQUR0OUd3NlVpUVFSYVJ2ekpsVlNEWHhKSUM5WUx1?=
 =?utf-8?B?M2xmNW5WUUh4RnNOSWNObzV0eXpYOU1EcE5GUjVSanRTck1oeHoxL3JqcVZM?=
 =?utf-8?B?eUtiZTBMNTVLOTdQMUx0ZkNBcDNyekRVdHdJenNia3NDdng2S2RUeUZoMEVG?=
 =?utf-8?B?Wmo3YkhoVFh6VUdRRXZUaElRTzI5elhZSkV6Skp2S285QTV4NHZlaWxKWVZK?=
 =?utf-8?B?d1BlNkJFYlg4OFh0dVpFRkVjVkpaZy9zUC9WQlJKaXB3NDZQREtpVGF2eUx2?=
 =?utf-8?B?RWFOZVpaWnVzb2c2SUNxVjhDaW9sQ2FsdHU2c3crSHBVcUhkUEdOZkZNcTdi?=
 =?utf-8?B?MEFlVzZ3ZE81K083bDVuQWI5SnZidnd1UDg2YzVDREFaMmY1SnJxN0NJT2Vr?=
 =?utf-8?B?R1BiZzdaWmQwZytIWmwyUkRRMWxOakZtNFRBanZhckNsNDVwcUJpUVkwd295?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c520cbfa-b916-485f-44b2-08dd059ddd8b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 17:49:34.3482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5iYDzEvoQT67TJ5XRdgAEwmRxnpHnJRW4/WFyqEwp29cwmjcaj4YBXlGacqisfA0N31oBNcr/TyRSnrzr5wDQ3rwAYL6qFy2y6jlxjQ/5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
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

On 11/12/2024 14:23, Daniele Ceraolo Spurio wrote:
> On 10/8/24 17:42, John Harrison wrote:
>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>> The driver needs to know if a BO is encrypted with PXP to enable the
>>> display decryption at flip time.
>>> Furthermore, we want to keep track of the status of the encryption and
>>> reject any operation that involves a BO that is encrypted using an old
>>> key. There are two points in time where such checks can kick in:
>>>
>>> 1 - at VM bind time, all operations except for unmapping will be
>>>      rejected if the key used to encrypt the BO is no longer valid. 
>>> This
>>>      check is opt-in via a new VM_BIND flag, to avoid a scenario 
>>> where a
>>>      malicious app purposely shares an invalid BO with the 
>>> compositor (or
>>>      other app) and cause an error there.
>> Not following the last statement here.
>
>
> If we always reject VM_BIND on invalid BOs, a malicious app can 
> intentionally pass an invalid BO to the compositor to cause its 
> VM_BIND call to fail. The compositor might not have any knowledge of 
> PXP and therefore not be able to handle such an error, so we 
> definitely need to avoid this scenario; therefore, the check on the 
> object validity is opt-in. Any suggestion on how to reword it?
>
> Note that the worst that can happen if the check is skipped is that we 
> display garbage, there is no risk of leaking the protected data.
Got it. Maybe something like this?
'...shares an invalid BO with a non-PXP aware app (such as a 
compositor). If the VM_BIND was failed, the compositor would be unable 
to display anything at all. Allowing the bind to go through means that 
output still works, it just displays garbage data within the bounds of 
the illegal BO'.

>
>
>>
>>>
>>> 2 - at job submission time, if the queue is marked as using PXP, all
>>>      objects bound to the VM will be checked and the submission will be
>>>      rejected if any of them was encrypted with a key that is no longer
>>>      valid.
>>>
>>> Note that there is no risk of leaking the encrypted data if a user does
>>> not opt-in to those checks; the only consequence is that the user will
>>> not realize that the encryption key is changed and that the data is no
>>> longer valid.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   .../xe/compat-i915-headers/pxp/intel_pxp.h    |  10 +-
>>>   drivers/gpu/drm/xe/xe_bo.c                    | 100 
>>> +++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_bo.h                    |   5 +
>>>   drivers/gpu/drm/xe/xe_bo_types.h              |   3 +
>>>   drivers/gpu/drm/xe/xe_exec.c                  |   6 ++
>>>   drivers/gpu/drm/xe/xe_pxp.c                   |  74 +++++++++++++
>>>   drivers/gpu/drm/xe/xe_pxp.h                   |   4 +
>>>   drivers/gpu/drm/xe/xe_pxp_types.h             |   3 +
>>>   drivers/gpu/drm/xe/xe_vm.c                    |  46 +++++++-
>>>   drivers/gpu/drm/xe/xe_vm.h                    |   2 +
>>>   include/uapi/drm/xe_drm.h                     |  19 ++++
>>>   11 files changed, 265 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h 
>>> b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> index 881680727452..d8682f781619 100644
>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>> @@ -9,6 +9,9 @@
>>>   #include <linux/errno.h>
>>>   #include <linux/types.h>
>>>   +#include "xe_bo.h"
>>> +#include "xe_pxp.h"
>>> +
>>>   struct drm_i915_gem_object;
>>>   struct xe_pxp;
>>>   @@ -16,13 +19,16 @@ static inline int intel_pxp_key_check(struct 
>>> xe_pxp *pxp,
>>>                         struct drm_i915_gem_object *obj,
>>>                         bool assign)
>>>   {
>>> -    return -ENODEV;
>>> +    if (assign)
>>> +        return -EINVAL;
>> What does 'assign' mean and why is it always invalid?
>
>
> In i915 we used the same function to both assign the key at first 
> submission (assign=true) and to check it later on (assign=false). This 
> header is for compatibility with the display code and the expectation 
> is that the display code will never assign a key and only check it.
Okay. Add a comment about that?

>
>
>>
>>> +
>>> +    return xe_pxp_key_check(pxp, obj);
>>>   }
>>>     static inline bool
>>>   i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
>>>   {
>>> -    return false;
>>> +    return xe_bo_is_protected(obj);
>>>   }
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 56a089aa3916..0f591b7d93b1 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -6,6 +6,7 @@
>>>   #include "xe_bo.h"
>>>     #include <linux/dma-buf.h>
>>> +#include <linux/nospec.h>
>>>     #include <drm/drm_drv.h>
>>>   #include <drm/drm_gem_ttm_helper.h>
>>> @@ -24,6 +25,7 @@
>>>   #include "xe_migrate.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_preempt_fence.h"
>>> +#include "xe_pxp.h"
>>>   #include "xe_res_cursor.h"
>>>   #include "xe_trace_bo.h"
>>>   #include "xe_ttm_stolen_mgr.h"
>>> @@ -1949,6 +1951,95 @@ void xe_bo_vunmap(struct xe_bo *bo)
>>>       __xe_bo_vunmap(bo);
>>>   }
>>>   +static int gem_create_set_pxp_type(struct xe_device *xe, struct 
>>> xe_bo *bo, u64 value)
>>> +{
>>> +    if (value == DRM_XE_PXP_TYPE_NONE)
>>> +        return 0;
>>> +
>>> +    /* we only support DRM_XE_PXP_TYPE_HWDRM for now */
>>> +    if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
>>> +        return -EINVAL;
>>> +
>>> +    xe_pxp_key_assign(xe->pxp, bo);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
>>> +                         struct xe_bo *bo,
>>> +                         u64 value);
>>> +
>>> +static const xe_gem_create_set_property_fn 
>>> gem_create_set_property_funcs[] = {
>>> +    [DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = 
>>> gem_create_set_pxp_type,
>>> +};
>>> +
>>> +static int gem_create_user_ext_set_property(struct xe_device *xe,
>>> +                        struct xe_bo *bo,
>>> +                        u64 extension)
>>> +{
>>> +    u64 __user *address = u64_to_user_ptr(extension);
>>> +    struct drm_xe_ext_set_property ext;
>>> +    int err;
>>> +    u32 idx;
>>> +
>>> +    err = __copy_from_user(&ext, address, sizeof(ext));
>>> +    if (XE_IOCTL_DBG(xe, err))
>>> +        return -EFAULT;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, ext.property >=
>>> +             ARRAY_SIZE(gem_create_set_property_funcs)) ||
>>> +        XE_IOCTL_DBG(xe, ext.pad) ||
>>> +        XE_IOCTL_DBG(xe, ext.property != 
>>> DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY))
>> Two overlapping checks on the same field in the same if statement 
>> seems unnecessary.
>
>
> I've followed the same approach as the existing 
> exec_queue_user_ext_set_property for consistency.
Hmm. Still seems bizarre and redundant.

>
>
>>
>>> +        return -EINVAL;
>>> +
>>> +    idx = array_index_nospec(ext.property, 
>>> ARRAY_SIZE(gem_create_set_property_funcs));
>>> +    if (!gem_create_set_property_funcs[idx])
>>> +        return -EINVAL;
>>> +
>>> +    return gem_create_set_property_funcs[idx](xe, bo, ext.value);
>>> +}
>>> +
>>> +typedef int (*xe_gem_create_user_extension_fn)(struct xe_device *xe,
>>> +                           struct xe_bo *bo,
>>> +                           u64 extension);
>>> +
>>> +static const xe_gem_create_user_extension_fn 
>>> gem_create_user_extension_funcs[] = {
>>> +    [DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = 
>>> gem_create_user_ext_set_property,
>>> +};
>>> +
>>> +#define MAX_USER_EXTENSIONS    16
>>> +static int gem_create_user_extensions(struct xe_device *xe, struct 
>>> xe_bo *bo,
>>> +                      u64 extensions, int ext_number)
>>> +{
>>> +    u64 __user *address = u64_to_user_ptr(extensions);
>>> +    struct drm_xe_user_extension ext;
>>> +    int err;
>>> +    u32 idx;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
>>> +        return -E2BIG;
>>> +
>>> +    err = __copy_from_user(&ext, address, sizeof(ext));
>>> +    if (XE_IOCTL_DBG(xe, err))
>>> +        return -EFAULT;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, ext.pad) ||
>>> +        XE_IOCTL_DBG(xe, ext.name >= 
>>> ARRAY_SIZE(gem_create_user_extension_funcs)))
>>> +        return -EINVAL;
>>> +
>>> +    idx = array_index_nospec(ext.name,
>>> + ARRAY_SIZE(gem_create_user_extension_funcs));
>>> +    err = gem_create_user_extension_funcs[idx](xe, bo, extensions);
>>> +    if (XE_IOCTL_DBG(xe, err))
>>> +        return err;
>>> +
>>> +    if (ext.next_extension)
>>> +        return gem_create_user_extensions(xe, bo, ext.next_extension,
>>> +                          ++ext_number);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>>               struct drm_file *file)
>>>   {
>>> @@ -1961,8 +2052,7 @@ int xe_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       u32 handle;
>>>       int err;
>>>   -    if (XE_IOCTL_DBG(xe, args->extensions) ||
>>> -        XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || 
>>> args->pad[2]) ||
>>> +    if (XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || 
>>> args->pad[2]) ||
>>>           XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>>           return -EINVAL;
>>>   @@ -2037,6 +2127,12 @@ int xe_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           goto out_vm;
>>>       }
>>>   +    if (args->extensions) {
>>> +        err = gem_create_user_extensions(xe, bo, args->extensions, 0);
>>> +        if (err)
>>> +            goto out_bulk;
>>> +    }
>>> +
>>>       err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
>>>       if (err)
>>>           goto out_bulk;
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>> index 1c9dc8adaaa3..721f7dc35aac 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>> @@ -171,6 +171,11 @@ static inline bool xe_bo_is_pinned(struct xe_bo 
>>> *bo)
>>>       return bo->ttm.pin_count;
>>>   }
>>>   +static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>> +{
>>> +    return bo->pxp_key_instance;
>>> +}
>>> +
>>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>>   {
>>>       if (likely(bo)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h 
>>> b/drivers/gpu/drm/xe/xe_bo_types.h
>>> index ebc8abf7930a..8668e0374b18 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>> @@ -56,6 +56,9 @@ struct xe_bo {
>>>        */
>>>       struct list_head client_link;
>>>   #endif
>>> +    /** @pxp_key_instance: key instance this bo was created against 
>>> (if any) */
>>> +    u32 pxp_key_instance;
>>> +
>>>       /** @freed: List node for delayed put. */
>>>       struct llist_node freed;
>>>       /** @update_index: Update index if PT BO */
>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c 
>>> b/drivers/gpu/drm/xe/xe_exec.c
>>> index f36980aa26e6..aa4f2fe2e131 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>> @@ -250,6 +250,12 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>> *data, struct drm_file *file)
>>>           goto err_exec;
>>>       }
>>>   +    if (xe_exec_queue_uses_pxp(q)) {
>>> +        err = xe_vm_validate_protected(q->vm);
>>> +        if (err)
>>> +            goto err_exec;
>>> +    }
>>> +
>>>       job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
>>>                     addresses : &args->address);
>>>       if (IS_ERR(job)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>> index ca4302af4ced..640e62d1d5d7 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>> @@ -8,6 +8,8 @@
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/xe_drm.h>
>>>   +#include "xe_bo.h"
>>> +#include "xe_bo_types.h"
>>>   #include "xe_device_types.h"
>>>   #include "xe_exec_queue.h"
>>>   #include "xe_exec_queue_types.h"
>>> @@ -132,6 +134,9 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>>         pxp_invalidate_queues(pxp);
>>>   +    if (pxp->status == XE_PXP_ACTIVE)
>>> +        pxp->key_instance++;
>>> +
>>>       /*
>>>        * If we have a termination already in progress, we need to 
>>> wait for
>>>        * it to complete before queueing another one. We update the 
>>> state
>>> @@ -343,6 +348,8 @@ int xe_pxp_init(struct xe_device *xe)
>>>       pxp->xe = xe;
>>>       pxp->gt = gt;
>>>   +    pxp->key_instance = 1;
>>> +
>>>       /*
>>>        * we'll use the completion to check if there is a termination 
>>> pending,
>>>        * so we start it as completed and we reinit it when a 
>>> termination
>>> @@ -574,3 +581,70 @@ static void pxp_invalidate_queues(struct xe_pxp 
>>> *pxp)
>>>       spin_unlock_irq(&pxp->queues.lock);
>>>   }
>>>   +/**
>>> + * xe_pxp_key_assign - mark a BO as using the current PXP key 
>>> iteration
>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>> + * @bo: the BO to mark
>>> + *
>>> + * Returns: -ENODEV if PXP is disabled, 0 otherwise.
>>> + */
>>> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo)
>>> +{
>>> +    if (!xe_pxp_is_enabled(pxp))
>>> +        return -ENODEV;
>>> +
>>> +    xe_assert(pxp->xe, !bo->pxp_key_instance);
>>> +
>>> +    /*
>>> +     * Note that the PXP key handling is inherently racey, because 
>>> the key
>>> +     * can theoretically change at any time (although it's unlikely 
>>> to do
>>> +     * so without triggers), even right after we copy it. Taking a 
>>> lock
>>> +     * wouldn't help because the value might still change as soon 
>>> as we
>>> +     * release the lock.
>>> +     * Userspace needs to handle the fact that their BOs can go 
>>> invalid at
>>> +     * any point.
>>> +     */
>>> +    bo->pxp_key_instance = pxp->key_instance;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_key_check - check if the key used by a BO is valid
>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>> + * @bo: the BO we want to check
>>> + *
>>> + * Checks whether a BO was encrypted with the current key or an 
>>> obsolete one.
>>> + *
>>> + * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, 
>>> -EINVAL if the
>>> + * BO is not using PXP,  -ENOEXEC if the key is not valid.
>>> + */
>>> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
>>> +{
>>> +    if (!xe_pxp_is_enabled(pxp))
>>> +        return -ENODEV;
>>> +
>>> +    if (!xe_bo_is_protected(bo))
>>> +        return -EINVAL;
>>> +
>>> +    xe_assert(pxp->xe, bo->pxp_key_instance);
>>> +
>>> +    /*
>>> +     * Note that the PXP key handling is inherently racey, because 
>>> the key
>>> +     * can theoretically change at any time (although it's unlikely 
>>> to do
>>> +     * so without triggers), even right after we check it. Taking a 
>>> lock
>>> +     * wouldn't help because the value might still change as soon 
>>> as we
>>> +     * release the lock.
>>> +     * We mitigate the risk by checking the key at multiple points 
>>> (on each
>>> +     * submission involving the BO and right before flipping it on the
>>> +     * display), but there is still a very small chance that we could
>>> +     * operate on an invalid BO for a single submission or a single 
>>> frame
>>> +     * flip. This is a compromise made to protect the encrypted 
>>> data (which
>>> +     * is what the key termination is for).
>>> +     */
>>> +    if (bo->pxp_key_instance != pxp->key_instance)
>> And the possibility that the key_instance value has wrapped around 
>> and is valid again is considered not a problem? Using a bo with a bad 
>> key potentially results in garbage being displayed but nothing worse 
>> than that?
>
>
> Considering that the instance variable is a u32, even if we had an 
> invalidation a second (which is extremely unlikely unless someone is 
> actively attacking the system in a loop) it'd take way too long for 
> the value to actually wrap. And yes on the second question.
If it is a malicious app, it can be much faster than 1Hz. It only needs 
to attack at 1kHz or so to bring the wrap time down to something 
realistic. But if the malicious app can't actually get anywhere even if 
it did successfully spoof the key by forcing a wrap, then it's still not 
something we need to worry about. Because it is not actually spoofing 
the key, just pretending to?

John.

>
>
>>
>>> +        return -ENOEXEC;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>> index 868813cc84b9..2d22a6e6ab27 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>> @@ -8,6 +8,7 @@
>>>     #include <linux/types.h>
>>>   +struct xe_bo;
>>>   struct xe_device;
>>>   struct xe_exec_queue;
>>>   struct xe_pxp;
>>> @@ -23,4 +24,7 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, 
>>> struct xe_exec_queue *q, u8 t
>>>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue 
>>> *q);
>>>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct 
>>> xe_exec_queue *q);
>>>   +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
>>> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
>>> +
>>>   #endif /* __XE_PXP_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> index eb6a0183320a..1bb747837f86 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> @@ -108,6 +108,9 @@ struct xe_pxp {
>>>           /** @queues.list: list of exec_queues that use PXP */
>>>           struct list_head list;
>>>       } queues;
>>> +
>>> +    /** @key_instance: keep track of the current iteration of the 
>>> PXP key */
>>> +    u32 key_instance;
>>>   };
>>>     #endif /* __XE_PXP_TYPES_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 56f105797ae6..1011d643ebb8 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -34,6 +34,7 @@
>>>   #include "xe_pm.h"
>>>   #include "xe_preempt_fence.h"
>>>   #include "xe_pt.h"
>>> +#include "xe_pxp.h"
>>>   #include "xe_res_cursor.h"
>>>   #include "xe_sync.h"
>>>   #include "xe_trace_bo.h"
>>> @@ -2754,7 +2755,8 @@ static struct dma_fence 
>>> *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>>       (DRM_XE_VM_BIND_FLAG_READONLY | \
>>>        DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>>        DRM_XE_VM_BIND_FLAG_NULL | \
>>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>> +     DRM_XE_VM_BIND_FLAG_CHECK_PXP)
>>>     #ifdef TEST_VM_OPS_ERROR
>>>   #define SUPPORTED_FLAGS    (SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
>>> @@ -2916,7 +2918,7 @@ static void xe_vma_ops_init(struct xe_vma_ops 
>>> *vops, struct xe_vm *vm,
>>>     static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, 
>>> struct xe_bo *bo,
>>>                       u64 addr, u64 range, u64 obj_offset,
>>> -                    u16 pat_index)
>>> +                    u16 pat_index, u32 op, u32 bind_flags)
>>>   {
>>>       u16 coh_mode;
>>>   @@ -2951,6 +2953,12 @@ static int 
>>> xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>>           return  -EINVAL;
>>>       }
>>>   +    /* If a BO is protected it must be valid to be mapped */
>> "is protected it can only be mapped if the key is still valid". The 
>> above can be read as saying the BO must be mappable, which isn't the 
>> same thing.
>
>
> will update.
>
>
>>
>>> +    if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && 
>>> xe_bo_is_protected(bo) &&
>>> +        op != DRM_XE_VM_BIND_OP_UNMAP && op != 
>>> DRM_XE_VM_BIND_OP_UNMAP_ALL)
>>> +        if (XE_IOCTL_DBG(xe, xe_pxp_key_check(xe->pxp, bo) != 0))
>>> +            return -ENOEXEC;
>>> +
>>>       return 0;
>>>   }
>>>   @@ -3038,6 +3046,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>>> void *data, struct drm_file *file)
>>>           u32 obj = bind_ops[i].obj;
>>>           u64 obj_offset = bind_ops[i].obj_offset;
>>>           u16 pat_index = bind_ops[i].pat_index;
>>> +        u32 op = bind_ops[i].op;
>>> +        u32 bind_flags = bind_ops[i].flags;
>>>             if (!obj)
>>>               continue;
>>> @@ -3050,7 +3060,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>>> void *data, struct drm_file *file)
>>>           bos[i] = gem_to_xe_bo(gem_obj);
>>>             err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
>>> -                           obj_offset, pat_index);
>>> +                           obj_offset, pat_index, op,
>>> +                           bind_flags);
>>>           if (err)
>>>               goto put_obj;
>>>       }
>>> @@ -3343,6 +3354,35 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>>       return ret;
>>>   }
>>>   +int xe_vm_validate_protected(struct xe_vm *vm)
>>> +{
>>> +    struct drm_gpuva *gpuva;
>>> +    int err = 0;
>>> +
>>> +    if (!vm)
>>> +        return -ENODEV;
>>> +
>>> +    mutex_lock(&vm->snap_mutex);
>>> +
>>> +    drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +        struct xe_bo *bo = vma->gpuva.gem.obj ?
>>> +            gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
>>> +
>>> +        if (!bo)
>>> +            continue;
>>> +
>>> +        if (xe_bo_is_protected(bo)) {
>>> +            err = xe_pxp_key_check(vm->xe->pxp, bo);
>>> +            if (err)
>>> +                break;
>>> +        }
>>> +    }
>>> +
>>> +    mutex_unlock(&vm->snap_mutex);
>>> +    return err;
>>> +}
>>> +
>>>   struct xe_vm_snapshot {
>>>       unsigned long num_snaps;
>>>       struct {
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index bfc19e8113c3..dd51c9790dab 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -216,6 +216,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm 
>>> *vm, struct xe_vma *vma,
>>>     int xe_vm_invalidate_vma(struct xe_vma *vma);
>>>   +int xe_vm_validate_protected(struct xe_vm *vm);
>>> +
>>>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>>   {
>>>       xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 9972ceb3fbfb..335febe03e40 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -776,8 +776,23 @@ struct drm_xe_device_query {
>>>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as 
>>> write-combined. This
>>>    *    is uncached. Scanout surfaces should likely use this. All 
>>> objects
>>>    *    that can be placed in VRAM must use this.
>>> + *
>>> + * This ioctl supports setting the following properties via the
>>> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
>>> + * generic @drm_xe_ext_set_property struct:
>>> + *
>>> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of 
>>> PXP session
>>> + *    this object will be used with. Valid values are listed in enum
>>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default 
>>> behavior, so
>>> + *    there is no need to explicitly set that. Objects used with 
>>> session of type
>>> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP 
>>> invalidation
>>> + *    event occurs after their creation. Attempting to flip an 
>>> invalid object
>>> + *    will cause a black frame to be displayed instead. Submissions 
>>> with invalid
>>> + *    objects mapped in the VM will be rejected.
>> Again, seems like the per type descriptions should be collected 
>> together in the type enum.
>
>
> This is how this ioctl handles those values, so IMO they belong here.
>
> Daniele
>
>
>>
>> John.
>>
>>>    */
>>>   struct drm_xe_gem_create {
>>> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY    0
>>> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE    0
>>>       /** @extensions: Pointer to the first extension struct, if any */
>>>       __u64 extensions;
>>>   @@ -939,6 +954,9 @@ struct drm_xe_vm_destroy {
>>>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>>>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>>>    *    implement VK sparse bindings.
>>> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted 
>>> via PXP,
>>> + *    reject the binding if the encryption key is no longer valid. 
>>> This
>>> + *    flag has no effect on BOs that are not marked as using PXP.
>>>    */
>>>   struct drm_xe_vm_bind_op {
>>>       /** @extensions: Pointer to the first extension struct, if any */
>>> @@ -1029,6 +1047,7 @@ struct drm_xe_vm_bind_op {
>>>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>>>   #define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>>>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>>> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP    (1 << 4)
>>>       /** @flags: Bind flags */
>>>       __u32 flags;
>>

