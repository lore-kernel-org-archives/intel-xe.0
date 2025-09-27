Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B4ACAC5B0
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 11:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46010E037;
	Sat, 27 Sep 2025 11:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VetTdHjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161010E037
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758971201; x=1790507201;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bACWopujqfsP8ppiNSSuSa0FyuGS+oukPwQOxx+Hckc=;
 b=VetTdHjJlvl/TOPE6vfLH9nh9VzOOm58+V33KD2suxGUCIJ+jSJ7PeD/
 6yAOx5nQsXs2gvg2hIO5D7o3rIjRKr0Uy5KKa2AGthqbNh6jdZFDMTqaA
 RapG5262S62d0+LOzlgqDbqrxW5f20CZUEWeV9JtJObV7VoqRW7/Fsqkb
 jUadeWv1Ffw8TlRdr4/uJHBHdookmwKttayK5XPN390Nu3HiXMj6AxF8D
 tkihlMebDvShdQz70Ajy2Hw+KYJgD1Csr/P+zTtmL8Bm2zAP9/lAWY3fo
 n2fmfqxd+Nir8CkkkAH6pHB4P5XbUQqKJmemqHScSpDiQXUCTUPUDvbbi Q==;
X-CSE-ConnectionGUID: PevkE8vfQAWYy/4uUYyxTg==
X-CSE-MsgGUID: 1DpWewTcToaZe3/NvAZ0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61176450"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="61176450"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:06:40 -0700
X-CSE-ConnectionGUID: O9sKcyF7Sh6aFHX+HLhT9A==
X-CSE-MsgGUID: U2+NJRx4RKmF7X/t0dKw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="177084750"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:06:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:06:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 04:06:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiCn1T3w2ti2XJ1V3eUkwtUH3PtCIqgZxEdoIsg69FWv6x2/RK8f7GmGfM+MaWeBQ8ik6ADdv1dhgtCLzS9ua3Tip10ipcjqcpAlO+v5qGXuMmfj0U9WbLUc9tE08GrixTXQb+Pk8yeWco38vt0H2Q0UvVLNaDNt/D8locP9f78bbK25dCnyE3yO8Sl0JGKWLe8sSh75GhN6roL7qSrUw1T3u3zFHAwGCqFhXa+M7TF8fde7ByguapQBmNeJ/1ck2nse9hwKvD++H3jlRjVrUBzxuDLLOjN2MSPYDheTzZ3I2eUtn842EBlS4MwIT0oTfEzBTJuEQ/7RxzVOk7e99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQiFYva+1vd7yJ6Xfbb0JeEEjfkvOlXXRtoft9Qx7Dc=;
 b=WVCOkif8rJPQrqvXu8F6IQRRV5+3y9NlezZmiNcTeryno3OKAvUibbWtW25QpXQSRbBL9V7cQt7faheQV4coi9fhxFAJ8MJB8sAMwZYRHGKgNR7mqeTuS7e6HLgAnX++7lxAgkvT+1yc2DDQX/zQuqWjzLy7sJDyDGEeKXwTvn+3WcYleSC+HUoSfJrk0aN+JyYXtysFmVURxY2ObytxLpMuHhrTBv9Ky+zLQP2iV4M+eaiWh19X5xllov7emmdVTd3p4ckBzWjmWrmNaZakfRztUyt/OALdxJvdG+YEa38tsVGJZVPYb0VAMkOes+exjYxY9PL1jX2dobrwfwvTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 27 Sep
 2025 11:06:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Sat, 27 Sep 2025
 11:06:36 +0000
Message-ID: <0ad445fe-8679-4e8d-bd00-ce27e78f6544@intel.com>
Date: Sat, 27 Sep 2025 13:06:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/34] drm/xe/vf: Extra debug on GGTT shift
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-20-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: f07e00bf-8945-4a7a-6498-08ddfdb5ed37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmhiWU1mRjdXc09hL05ITW9XVC84Q3hCUHdBck1Tb0hGK2x3NUFvV3NNRG14?=
 =?utf-8?B?WjNyTllJSndpZjV6dnFuWjR5YzkwK3BBTVdHdUt4OFEyV292WE9ZbDdBZ1o4?=
 =?utf-8?B?K2RPTDdpVkJyWGhsUk1IeEJkQk9sVTZRRmo0OWdKMTVhaURyd3E3cG56Nits?=
 =?utf-8?B?RFEwSURFRVJyTzdXaWFNcjZWdmpoS284a1RETWQzc0F1MUcrVXFjeW5hd2ly?=
 =?utf-8?B?V2c4TGtmRWZTREJEc1ZvUzluWFlJYzVoWXZBQXRtcDdrOGNWMjdxWFRwa2N3?=
 =?utf-8?B?eUFiOG9RZ2ZUVVU5YUdiUmVEQit4MmtnWGw5QWZuQ1Z0c3hWQXRiemJIYjFj?=
 =?utf-8?B?ZkhHaGFhWFEzdjJSanAyenhQeXJlUTdHRmhQTmt6ZmFuSldpM0F6RXI4cUJV?=
 =?utf-8?B?UUo0M0RqeVQwT0ZWMUE5MHFtN05LODFBbG55L1AzL1p2TWlFZUhKRVM1RVRK?=
 =?utf-8?B?dXZNTjRsaFBHeHBQVDNFSDlIVG9GSEsyR0dVMzFWOTBieHBqczExZXE0MkUw?=
 =?utf-8?B?dktkWDcxTWttR1NIcDZFYlBJR2IvaUsySDdSOHUzU09DOFVTOUkrN2hxdmR5?=
 =?utf-8?B?Z1QrUjkvVmI4VTlzWU5zSWx5SlZHTEc2UGY4UDRtSGJKb1p6KzZaUWdIdnZH?=
 =?utf-8?B?VHNxQUVlaHE1TEVmVmJWMFdvWHdaRzhWazg2ay9oNHlWV3VsNFZWQ0lpSzQy?=
 =?utf-8?B?OHJ5RTFhdUFLaTdXUHRhZytRSTV1dXRHdWQ0WWVYTVRNT0s4czEwUzJlc3Br?=
 =?utf-8?B?NGRkaDMxNytCYjJIdDJmNzRNQW91bDFnZjUvRkRGK0JJT1BwRDNDT0FhNFpG?=
 =?utf-8?B?aUlncHE4NWhaQ0FHTHh5ZTRnMWs5R24zQ2FqdXN4cGJnK3VPREdFa0pDbTB3?=
 =?utf-8?B?OVd6em1qMGwwN3VtZ2oxblpqWTNWSjF3Y21Rbm1HbzRYZU9wUDRZZER2VDVW?=
 =?utf-8?B?cStpV1NpVmNsWEplOHNjTDBjV0tSbCtKaUZzWlN3UFRuajdYaE9LMk10ZDJa?=
 =?utf-8?B?Vms1TWNUcWFVWWs1bllCazBUZjJvOEx2MXNUZFVZcG45Q2I2ZGlyMVZvUzVh?=
 =?utf-8?B?anJGYlg3Q2c2T3M0eE5vL29VUGlVdzc4VGZINTA2MkoxU0R1ZHNGUThhQXRr?=
 =?utf-8?B?UHFRVFh6SVA1V3pEeUtPQ3lkQU5UcFMzZnNQNEEzVmQ1MWZNVXVXTzQzM0pH?=
 =?utf-8?B?cFFhY21zcldmdXNJZDB5c1FidjljbGMzblZkUlhHcSt6bjlFemZDTXNJdHk3?=
 =?utf-8?B?NE95QWVnMkgzVmE0NkhSR09malpuZ3liNUpzZ2h5bzhaTS9aVHhlUGl6WVh1?=
 =?utf-8?B?ZFlKQXltUjZmL0dza3Z3V2hkK1FMaFV2eWF0TStlSDg0bEQ2NVMyd05HOEZG?=
 =?utf-8?B?SW13Sm93OTBxbTdiVm1DYTdDeldNdlQwMUUxU1pTbW8vNTNCc2dERHFSSzRu?=
 =?utf-8?B?MERZSGUzUm4vR2xPTnB1bVdmK1ZJL1dObytxU0tLaG5Ob0VzRFdIT1FkSEZ2?=
 =?utf-8?B?RFFmM1RzbDkvR3ZJUDVTVDlpWEJ5Wm1OeXc2RXJyd3JKd082UEJlU3JYNlBF?=
 =?utf-8?B?TSs4eHRqM3BVVW9sMDJETEpndkZsaE0zbVFHY3U3ZWxHc0dFbHBQMzUwRG5y?=
 =?utf-8?B?cU1lb3VDdFR5aW9qOHBTL2dGOEtyMDhpMkdyVzFHdW4wT3RCUU1sQjZZMDk1?=
 =?utf-8?B?Vld5cnFTdzRPQVpFR3VlTWJFSXZ3WjNqd1kvakh2MHAyZFFsRHdzbW8xeHlp?=
 =?utf-8?B?dmpjZ3h6UXg3c1FrYWswZEtwSjEyYUpMV3VzTXdPd3ZaMzgrQmFUenVHb3Rv?=
 =?utf-8?B?elRxV3lyU1g1S3RJZ0F0Q3hKTTB2QmFOeGpZNE03TlowMndydzJpdVpheHNH?=
 =?utf-8?B?Qm5LRzZXZTFzT2JUYlhoYVJXOGh1VXBWc2ZpMExkZnRNZ0FiT0ZueUJLVVVq?=
 =?utf-8?Q?Gizn9XkxhAA12X8hiLHkvR1yh2dVuSDW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHVqRkJlb3MwK1F2RmNrZUZMbzFUQy84V2tVTERacHhaVFRwWENIanc2Zloy?=
 =?utf-8?B?TENkaE1tTGx2bGRXMHNiSFc4d1R5cmVtRmN3OGlCRUZiRFI3V0dCemNjV2F5?=
 =?utf-8?B?ZHM5VE92VklFZnlvWWx6VTlndFJ0d3lseHQ4b29JOC9sQnFDRkd0dlhFaXdB?=
 =?utf-8?B?UzNkc1YyTUlmZXJpZHpNVnp5Zm5ja3lSaFdCL2hlRnM4dDRJTmtucVQzajJq?=
 =?utf-8?B?bStkUnF4eXVpTU9ibjRTZ0htV25EeGZqTjFiekl3ZmdMb3QxdjduL0EwQW9y?=
 =?utf-8?B?SnR2M09MK09XUCtId0hKeHdQK2NxYWxLZ1NSOE1FZTJORDUvRUZYZVkvTVla?=
 =?utf-8?B?SjZTVTl0QjBGeFVLRTRGK21ydzFTMlFTd2lxUkxWWGZHSHdzNUlxcWxXNzl1?=
 =?utf-8?B?WFB5cHRGcy8zOGx0K1dKRHdneUErb1JWbTVxNTRiZm1NL21kbGNKZUI1RHZQ?=
 =?utf-8?B?cjdEaFE3akxCS2xkc2J4bjVYZmh0a09CbHlhbjFRZUR3djFzdWZDMmt6Q2p3?=
 =?utf-8?B?WVBVVjhYYmpXL0dZSDJ0QUsvbjdQMjRCSnJmSFRiU2Q5NDJQNXJEQTkvdThQ?=
 =?utf-8?B?SkRpT2k4dlFhejBXRjBlVnZSdzNIL0doZzFWNjlKQkJxbXY5Y1NjV0NIa3VY?=
 =?utf-8?B?UGxEZjVrcEd0bDJRVWh1blhCMGlsbUJZRFpDMGxKaDlYKzZtUVpNM0RSclY2?=
 =?utf-8?B?QTZoOGJEMUgxZ0VQZ3ZkNzQwb3JCMGRRcXhIei9Mb1dNSGcvbSsxTlN0dTg3?=
 =?utf-8?B?R1E3VENhRndwWm5FV3lqTTJwNW0vR3I4bHZ4UytTWkJoekR4bm5Xa2RrdERq?=
 =?utf-8?B?QzNJQStxQmxibEh6WHhYRm9raUwyT1hRMTd1dWM2eFhlNnJ6bncxaFBMby82?=
 =?utf-8?B?bTFwcFBDN1Zma1dCMGNTSy9VRjFEOXdjR3hkcGZPS0ZaQTZ2K3pqS09TQk8y?=
 =?utf-8?B?OUFyZlFYQ0trRENha1p1dVVGSlVqYldGcjV2TlMvRUVqSUhlU0QyTXBHRnNy?=
 =?utf-8?B?dkZIMWdBbDBoUlhhTXdIOUJQZ2cxZ01TOFp5S1lzcVpmUkFFVU5GTXZwWmZt?=
 =?utf-8?B?NnJXZ1oyNFJLZVJJUytVNTlFNjRlcEhmZEVsUk1PbWhQcktoelBhYWtYdmdh?=
 =?utf-8?B?c01zOFY5c24yc1FLbndLcE50UnZ0WUViZkRHb3hsVTNjUHhrd3NZeG5tOHJ3?=
 =?utf-8?B?dFZJWWU2eFp5ZC93OERjZXhqTXgxOC9taDlOWGZoVlc4ZERkNy9qaW5oUldW?=
 =?utf-8?B?MzFybzNsaWx4MXV0OVRtRE5meHRIVVZBT1g2RERrYXRkeUNCTkh0TkFmTGE1?=
 =?utf-8?B?K0NZOVlJakNLNG1LbWdzZ21NLy9DVjNtZEd2ZEpaMUNtZmMxSVVMZ0xFQUZk?=
 =?utf-8?B?MkdnUXkwK0N6aUJjbGpvUjBPcXltTEZCejZmcXp2N2VRSW5nNGZpWnI4REx2?=
 =?utf-8?B?bkcxUWo0a0R1eURDRStRcnFjM1NCamZPbFNISFNka29IbkI2ck9qOFNSemx1?=
 =?utf-8?B?VlV5UkdWY2tnY1FhR1BaTXlhcUR5Nlg4OEREMEN0ZE9jTFgrZHJaaUpEZ3p3?=
 =?utf-8?B?N1dla2Y2NVBydzVwbi9kc3VxMU9JQm0xbmtDaDhOSVlzY3NZajlaZGxyMFFR?=
 =?utf-8?B?UWJLU3RYQk5TcUR0SWlDa2pLUWxYY0xYZFRGeUkyV0RINEF5emR1VFhsdEF1?=
 =?utf-8?B?MStmcHJrRXhTUEdHU3dRNk5BbDRVWmxpeFhrK29ENjNvZFU2ZkFBbU16Slc1?=
 =?utf-8?B?WUt1N0tFbEI1NkZWUlIxYURJUDZuMEhYZUVyL3cvR0FCcThCRWZjWE5iTU1i?=
 =?utf-8?B?MmJNWENic0lLMlV4Z1BWQTgxNUF3bmdrUitoemJ1SGhScit6M0NPQmxvQ0w3?=
 =?utf-8?B?cVl1ZlZZdFVtdGRyR3ZnbUZRclgyM1FhWlNwblB5QUFIWlNMT0Z3UkkxVUtw?=
 =?utf-8?B?UnB0eSsySnZQZE1iR1pNNmZZSStERmdQUHpXSVNWRDUvQUwxcmpkTmVZa05j?=
 =?utf-8?B?bDd0ZXdBNXJHL2drcTFBdkJZSkN3RDA5TmxtbFdHb1FJMXJYWmVmdzNSa0Jk?=
 =?utf-8?B?dTAzOWVvUUtsZEtCTC91ZWo4ZFdZUkhibmN3OEQvWHpEZmhWZW5IbXVaUEx5?=
 =?utf-8?B?Mk00YlVUdUpSdk5Rdzhuc2JnL21NcktlYkpiRjBQNlI5TXllQmhaWmdmOHRh?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f07e00bf-8945-4a7a-6498-08ddfdb5ed37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 11:06:36.9348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Un9t/LNhw+OoYowrXz/6btDaLmnRW0PN5mhEAx56LEI/LjeNSBxGrIYW8UkQAkaxeuX2QAExnFPq4vKb62PB1Y3h9g8RhE5TTAnm4aEwZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> A little extra debug on GGTT shift printing the GGT shift value is

s/GGT/GGTT

and maybe consider some rewording as I'm not sure it's right

> helpful for VF post-migration recovery.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a96e0dd65bc1..e79ab4a2a273 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>  		primary_config->ggtt_base = start;
>  	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	if (!err && shift && recovery)
> +	if (!err && shift && recovery) {
> +		xe_gt_sriov_info(gt, "Shifting GGTT %lld -> 0x%016llx\n",
> +				 shift, config->ggtt_base);

since this is "info" level message, maybe we can make it as:

		"Shifting GGTT base by %lld to 0x%016llx\n"

>  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);

and print this from within this tile based function, where we could
use tile-based printk function (instead of currently used GT-based)

> +	}
>  out:
>  	up_write(config->lock);
>  	return err;

