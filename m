Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C0CFA3728
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 16:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC6D10E2B1;
	Fri,  2 Jan 2026 16:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNDdAxBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF04110E2B1
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767372594; x=1798908594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RCuGDG3BSjSrCn2HSzYJtmonsS0ee/IHc1DzzAs8rgI=;
 b=QNDdAxBH17BLV4GmirPpHpnrvI9U42czX30m06DJcSZsuq+BZZZRRSFg
 oZxK9P/zb2LfOLIyHJXovwGL3swDctbN6MUtD9vJDR8ZMpBpHGtsCnPqI
 84Um6p5OxcTJ8oYCtaXIBfUAL60pG+TYZFP8K+Pn/bvqs/UoaPc4DRfb0
 Q/qMBKWJ4T5u8l5sSySZNmRWTvm1g84/uS1rad+w2TpV8IvHDOVq7dnGt
 GbbIxpdpf9gG/ntijQeEXvBaEL/8hZamjV8M12rgaIqIlw9N3UN+t4WKK
 OOKMneh0HKLIP8fTlY/0gIBx6JyNVdd+0hzGCRGoSsDdvXG8XsCqWcqd/ A==;
X-CSE-ConnectionGUID: w3uUFUZmRtSbQfWr2Zz++A==
X-CSE-MsgGUID: nw2Dbc3ITMSZ2HaT/80sNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86284763"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="86284763"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 08:49:53 -0800
X-CSE-ConnectionGUID: MWxf9KCQQaK6hmvD2dKe3w==
X-CSE-MsgGUID: Taxjcc5YTMCjlAFKpZ9CQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="225344379"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 08:49:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 08:49:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 2 Jan 2026 08:49:52 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 08:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v81CHmlRVKECcrsGKKD5GfY27RuegCeUVTXUdsi1zFfdQPcnnu/KDXVCmD3cJWr28DJ1k8T3shE91sRGVj5GKT+uPRjwy+aYKLgvln1K6dSb8G9UiDjWucOLK1pkEyAou/kPSyH5w4oVPCbEXtqez//UTXAaVizEmYhxw8Ba3EuG5o/upOHxHFrD7ZIM3KPtvV3AbSyVHr00rDXOPVH6y6sCghDBMMWMDhJQrQ7mX3N3Jjtsr2LYSoj9VXZREbHxAGUg+Gu17dGX+N3KDno4fFyT26QLQ9AGE/VcHtiyg6B8DdTzvx/FtMyiIj8PXMR0nH6dDVbIgbae5ayLW5QCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgjt5OfoM8mhnv+BGRc1cCHdklBGoQQzpgj77S6AboI=;
 b=spPKcfC/XhGQgQ4Sa+TIPTOFXx1lrMuvrsFsn0l9XRf6oFZtK+eR6DaaJ6yds0CA3ZLgwfQaDfOraHN7md1ifBQUQ7so0zI5e94r8GljIRDkX7qMQp/omItm1FVu4HXUYgdJD/6BQyGZr3RBea+HN3zz6Hi2mn60eLg3wcAgnitVUzACGGy+RvxfDlJV9rR5+5YW8LdWkYfou4nb73/lqY5hvoZr+uZQoxICe1NiKAdjKc/czQoVILn070O48z/7QEx94NsZTZMFuXvazm6skUsFV1uM1sULp58ctw5EGwkGmRXVLd97xW4ImqP+4faJgkXrOydNKuJyDV1eVI+6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 16:49:40 +0000
Received: from IA1PR11MB9494.namprd11.prod.outlook.com
 ([fe80::be2a:cd72:6a2d:7f72]) by IA1PR11MB9494.namprd11.prod.outlook.com
 ([fe80::be2a:cd72:6a2d:7f72%6]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 16:49:40 +0000
Message-ID: <23ded605-a085-42b3-bc71-af3178d07bc7@intel.com>
Date: Fri, 2 Jan 2026 22:19:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20251230151722.293657-3-anoop.c.vijay@intel.com>
 <20251230151722.293657-4-anoop.c.vijay@intel.com>
 <aVRh5o7gifmgkFdF@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
Organization: Intel
In-Reply-To: <aVRh5o7gifmgkFdF@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::13) To IA1PR11MB9494.namprd11.prod.outlook.com
 (2603:10b6:208:59c::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB9494:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cfb072-3f06-4f64-87e3-08de4a1eebe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHVaN3RHZU1VV3JpRWV6Zm5TUWRQMnV3WWhTdkFpUjcxemg5NTJTdVk3ZVlB?=
 =?utf-8?B?SWlocldiWkRPVjdCK25weEpXazFuZDlOdmxoc3BRcGtGK0JUanFPMUlOTFMr?=
 =?utf-8?B?TXRvdEJJWWF3d2xKYzMxa3p6RGtDZXozbmExOGVNZHdZVDk5RCtvWS9ySnFT?=
 =?utf-8?B?aDVFTG5RRTRPcXdVcWxlbW9sZGF1NTRVSmRsYnRkd0Z6NmJFMGJMbVFUNXh1?=
 =?utf-8?B?b3pvS3JtdTFQcDFiK2ZkQWI1YWZDQW1kZzZVdFFURDFsaUtOZTRIY3l3dW0v?=
 =?utf-8?B?OTIyaVFyV3VvcTZVODljOVR0Q0pwMzZjcUcyaFNVZlRTVlZLM1E1UzJhNXY0?=
 =?utf-8?B?ekhQeHpTclYrSEdHS2M2QlRtRU1RQ1ZVTkdWOEJFcC9weFNVS1pxZnlhZHNT?=
 =?utf-8?B?NlYxTnlqWHUrVUNBS09vM1IvVDRMOEM5a3ArSGFYU1Q1WDZBUjJTVE0xZWh1?=
 =?utf-8?B?K2N1dGJuS0xVVWx0RE5mRHVjaWF0VlJBOVZuUFR4ZUlWZ0pOb243SjVTK2gw?=
 =?utf-8?B?Y0hYeitXb01lL1ovRmlhTmZxU2ZBMVdLV2kxbTIxK0ozUlZwYnBHcCtBZUh6?=
 =?utf-8?B?Y2xRVTRMcHl2OHRiUHN5VjBMQkh4Y29XT2tTbHBoSit5S0xaeEVPTDF3T3Nr?=
 =?utf-8?B?UytocXRtaXpLcjZvQkZLdC9lQmdqZXU2TDJIRyt1a0JjbENCd0wyRWRISjZq?=
 =?utf-8?B?c0ZPZTdkZjBhcWovODlJVnhPNjJYN0VkRVpZckZidmFaT1VHWXN1c0dIVXZS?=
 =?utf-8?B?TEJjVlBLNE9GTmxIcmRqQzRGd3V0c1QzL0JtTjFZQjk0dVYrbkxublVxWDFH?=
 =?utf-8?B?Vk1sUDVrOVpDM1ppNUs0L1BHUDFzLzQzNGxRekFkTVQ5VDY5allEYit5ZHRH?=
 =?utf-8?B?M2s5TmlyQ2tmWGV0RGFGREJTc2dpYnk3SEowVmJaMWVWTXA5aTVIQ05MSXR1?=
 =?utf-8?B?amNLdEs5N3ZoaEozUzlwZ0pYNVdlZGZVMENBYUIyMjVUNnJBOVFkWStzci9o?=
 =?utf-8?B?SUZiQmkyVk9YYncxOVI3ZE5FcFgvM2hPUWF4YXYxa0RoTXdpa2VISEJUUWpD?=
 =?utf-8?B?REwxZGpQNFpWZVRMV040UHRhSlpMMUxla2hNNTNFeWlEV21rWEZqZWI4YmNm?=
 =?utf-8?B?blJwY2N1WktYOUxQWXhIYWk1Z0F5SWxDc1IvMTUyYTIvRm9uYU1CZDBYdXkr?=
 =?utf-8?B?QlYzeElSdU9uN2FPRUhJUGJ4L29OYkJkVEg2amJoZHBkcFB0R3FPSWs5YldL?=
 =?utf-8?B?bHRmRXNxVCtxaEJ5QVMweUFza054RmZhQ1duMFhzV3JObkZkRnlMS3Y3VlFt?=
 =?utf-8?B?a21JdFU3OTh5b0RmbHNBRlUyN2tOY1llZUo0Sk9CbzBJeUU4akRSZUhoRER1?=
 =?utf-8?B?a3hWYnlSL2szZWZJYlNNR2FWcmN1WnBZbTV1ZlI0S0tRblorMUYyNnV3QUIv?=
 =?utf-8?B?TFV0WGtHSFU5Z0hFWnVTNnl0U2FkVDc1dmIveFkwVGExZ0Qvd2wxK3ROdkN2?=
 =?utf-8?B?S2lXdVhRNUFOeHl4MDZhdlZ6aUJrRzk5UmFEM2RkWDZnYUs1TjRna3dpU2Zp?=
 =?utf-8?B?eEc3Z3J2M0JNUkxhQ2FNQ1ZOVFF0YzdCN2JnY0VnaUZsQWRyWE5wMkJtcTJX?=
 =?utf-8?B?WlZyZ1VDU2h0cHltaEN1ZHRwcHlBQWlNVHI5Q21hVnBxMlh0NHRvaFhHSUpQ?=
 =?utf-8?B?bE85TXQyU3dXUmF6aTNKTWlkd043QVgrdkE0ODN3RzBRTkVGVFJYKzBIZmZU?=
 =?utf-8?B?QnRQTEZ6L25EL0RlRXFIL1hEdFZGa3Z6c01QY1c2d1oyR2d1VEJmOW9RdHFD?=
 =?utf-8?B?Rk9iWjh5SXp1K0tmOXFCVlByL0J2ZjdmRzdRUXo3NnIvODl1ZkFtK09tNG1r?=
 =?utf-8?B?UFkydDlJOUV1TjN2U2o3VEZtTVJHYUhGVFRFN2tNejdIZzVEakVMM2FqRTNt?=
 =?utf-8?B?V09RaUZBcWhiNFZQbVRoQkg2UEVUaFl6M1JWdmpadVA3azBwU1J5NkFkNnlE?=
 =?utf-8?B?VDdnS2gyMTJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB9494.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldTeUtJMXZTcE5WVmJRTFF5bTd0VE1qS0hJUVNRTm5rZUFwWmxoNE0wL2ls?=
 =?utf-8?B?ZUtXTWs5SlpyT25nU0xiUjhpdnRxL21vQ2RHK09nTVU2a21hQWZwaHhHY3kw?=
 =?utf-8?B?ajBqdExqSWhEQkV0SE15Y2dqamdzYkV4TWYwb3hXSW5iM00waFdBQnE2cHBx?=
 =?utf-8?B?Zm1vSm5YWStOWXFRQkRpcjNBSFBxWDlzclNiK1FlM3BCblFBTVdMVEVINDVD?=
 =?utf-8?B?VnNsSjVSWmlHdDJwTVljMzFRTUs1ZVlWaFVCMjlMMmhEZGZ1cGZMR2FjTDBO?=
 =?utf-8?B?cVdzZVFyQi9JeEZ6bE5YdWF5SjNOWWQvWFgrc21hV0Y4UWl4U0FUWEp4OHVh?=
 =?utf-8?B?MjJDSktHczJLVXVEV003OFJYeWdpWmMzZkt0NDdJTGZPd1ZTelJneGRlZnBJ?=
 =?utf-8?B?U0ozbVg2QkNERkxtbXl6UGhFMWFGSGZINmk3bGUydDkzYzZ5ejd4VkxWN01i?=
 =?utf-8?B?eXNRL3hqQTFOVU1zMEJzQ2Y1Y1VYMTc1OHY4WjhrQ3BZVmJSbm1HL2paTXNC?=
 =?utf-8?B?RFAxWTRhQzloSVQzd3ZOc1h6czBOVWZWa0JWV2h4Mk9QMzk1WmJSMVREMnYy?=
 =?utf-8?B?WG41Zzh1dTRUdzYrVU1uWFp1Wm5xampvSzNwTDA3eno1RlpYcVN6S2lqaHF6?=
 =?utf-8?B?WDVIM3JLMmIxdmRvNlRWQkRCQlR5RDBrQnhzV2tlcGI0VEd2bzFpczYzOEw0?=
 =?utf-8?B?QlpSNVoyNUpIOFh1OUJlelJLb3VISmIyVm85MElIRXhXajRuSGkrRFJGYVI5?=
 =?utf-8?B?MmM2VTAwZ2J0NUdxWm0wcDRmMitBdkY0NWhGOThhQmhsMGRucTFwenAzRisr?=
 =?utf-8?B?VzdvV3Y0QnZ5SVVsbmpQUEpMWjl3cWQySC8yb0NKa0N5ZitpTFI3MDZpRUZn?=
 =?utf-8?B?UHo5SnRvNXhOdDFRM1grbllCWkhOcDdtc0FhcjdISlNacllDNTdJQXptclNy?=
 =?utf-8?B?NmtFbGgzNkhzRGNLMUVYVkZENldiOXZ1VnNSS0FDNVEyUmI0ayt4eUhTMW9r?=
 =?utf-8?B?bHo5bW5RSlBtdE5pYzFWTnlWRjlUSTE5SG45L0dQQ3lWcTBqM3hwSjY1RGx6?=
 =?utf-8?B?WHc5L3FVUFZRcWZMbzI0MlRWMW81WGJFSDRpK3o0UVo3NTY5ZTR4ZEU5R3Ro?=
 =?utf-8?B?T2xrdjA4VzE5Q2F5Q2VnVjJkelp0dklXTHcvMGI4MFBXTGV0SjJjYzRXUjh6?=
 =?utf-8?B?UExpbUVoVWE4ekpSeWhXR3RTcnJSTHd5MmZHTVZWR2xBY0RkVUM1QVFzVjF1?=
 =?utf-8?B?M29vc1YrZWRpMUxiWkJ5OWx1SmpkcVFXcWIrMTdmN0NmdEpLcUkvN1Q1dERW?=
 =?utf-8?B?OGJ4eGNVNTZyK2VHY0tVQVBuaVZSVExCVm9ZOWdPSWk4eGs0Zm96Y214Q3RE?=
 =?utf-8?B?QW9xWjhxcUZkUFpWc3ZhVkg1Z2dWL3IzVURpNUluK3JsMElzZ0wxSmFaaENG?=
 =?utf-8?B?UGtKQ3hod3BuaUJtMEZFU1hzcU9reFVkUklXdCt6RXpGZm9odWpCQUxQL2s5?=
 =?utf-8?B?MTVPNEh4ajlQVFB3S0ZNMUZVbk8zQkFnazdrdXRHbDdqTlRVVWUrMDY1L2Fr?=
 =?utf-8?B?VUw2MXFzOTlVUEI5UktGOHZuYzZkQWxxaEMxV1pSNngxZ3VOc0dJZUhIOEN6?=
 =?utf-8?B?Nnl3ZFo2Tys4OFB0ZXp1b2h5U3JUR25obER3Rmw1Yy9CbFJhd2lZZXhPcEVU?=
 =?utf-8?B?MkNEcmY5eWx3eHQ0RndYVVB5YjcrK3pja2tjV2owVXludFF1bHlDc2lHVEFn?=
 =?utf-8?B?TzErOGo2MmwwR2tpTW1oaVJJTVNXNVFHT3VUWWI0TWx3OVQzWVdHaG9KdFla?=
 =?utf-8?B?TEpNMmx5NXlJeWdYc21SeXkxWCtxeFdaTEYrT0RDSm5mdmE0MGF1KzlNY085?=
 =?utf-8?B?eVZlaFErUnpkSVhpQ2ZXbDlka2hEQ1VEaXhDSCthcjN6ck1IYXZLYVZqVTFp?=
 =?utf-8?B?WStDOWxWNG04UHRNQXI2ZGd0ZTJGRk92WXZNbDVoOVBMdk1xTUx1eWRpTzVn?=
 =?utf-8?B?ckF2OVUwVEFPdEpQRUY2WDk5anJiOHJsWDJPMXZsd2xrOXBEaHhqaXFzRGNX?=
 =?utf-8?B?dVVQUWFRSE1oN1dkRlYwaTZ1ankweDhwZVRHcVJMd24rRGdMZXdUOW5MOTRZ?=
 =?utf-8?B?U2JXVXJYNkdQTExvb25pVGZId2l6cGpCZ1hOb2lTNHpNY2JCdjBOL0x2OG92?=
 =?utf-8?B?cUJpK3N3NStabWxuY0szY0FFWVh0UWNGTzJKV3kyalZWajBoMURDbHNhSFdn?=
 =?utf-8?B?a04rWHdnbDdNZ3g2eHZNclc0S1E0N3VnYUpvMko0VmpqWWZqM1NiSldEOGto?=
 =?utf-8?B?VDloTFExSm9jZkppUUcrbkFGRG5DZ1lrZHBxMjFTNjN4OC84ZTBHaUs5cGli?=
 =?utf-8?Q?6HiwIJpEe9NP3of0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cfb072-3f06-4f64-87e3-08de4a1eebe3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB9494.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 16:49:40.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcIhJGLaa1e5k8gOPGMgT5GfanAYCv2iVOggD1yzTeU1uUdw9A1VATJ3nxPVrkU3NTMeCBy5wI+NxR4HBfmbAw==
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



On 12/31/2025 5:06 AM, Umesh Nerlige Ramappa wrote:
> On Tue, Dec 30, 2025 at 07:17:23AM -0800, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add a new system controller (sysctrl) component for Intel Xe3p dGPU 
>> platforms.
>>
>> This component provides the foundational infrastructure for communication
>> with the System Controller firmware using MKHI protocol over a mailbox 
>> interface.
>>
>> Key features introduced:
>> - Detection and initialization of System Controller interface on Xe3p 
>> dGPU platforms
>> - Mailbox communication with System Controller firmware
>> - Fragmented message transfer for large command payloads
>>
>> This implementation establishes the base for future System Controller 
>> feature
>> enablement and firmware command handling.
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Commit message should follow '75 chars per line' format. In general, 
> please look at the CI.Hooks and CI.checkpatch warnings/errors and fix 
> those.
> 
> checkpatch can be run before posting:
> https://docs.kernel.org/dev-tools/checkpatch.html
> 
>> ---
>> drivers/gpu/drm/xe/Makefile               |   2 +
>> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
>> drivers/gpu/drm/xe/xe_device.c            |   5 +
>> drivers/gpu/drm/xe/xe_device_types.h      |   6 +
>> drivers/gpu/drm/xe/xe_pci.c               |   2 +
>> drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
>> drivers/gpu/drm/xe/xe_sysctrl.c           |  64 ++++
>> drivers/gpu/drm/xe/xe_sysctrl.h           |  13 +
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 438 ++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  61 +++
>> drivers/gpu/drm/xe/xe_sysctrl_types.h     |  25 ++
>> 11 files changed, 661 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 3315f93a35b2..cd03e4c53127 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -121,6 +121,8 @@ xe-y += xe_bb.o \
>>     xe_step.o \
>>     xe_survivability_mode.o \
>>     xe_sync.o \
>> +    xe_sysctrl.o \
>> +    xe_sysctrl_mailbox.o \
>>     xe_tile.o \
>>     xe_tile_sysfs.o \
>>     xe_tlb_inval.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/ 
>> drm/xe/regs/xe_sysctrl_regs.h
>> new file mode 100644
>> index 000000000000..b31b6e24c18e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SYSCTRL_REGS_H_
>> +#define _XE_SYSCTRL_REGS_H_
>> +
>> +#include "xe_regs.h"
>> +
>> +#define SYSCTRL_BASE_OFFSET        0xDB000
>> +#define SYSCTRL_BASE            (SOC_BASE + SYSCTRL_BASE_OFFSET)
>> +#define SYSCTRL_MAILBOX_INDEX        0x03
>> +#define SC_BAR_LENGTH            0x1000
>> +
>> +#define SC_MB_CTRL            XE_REG(SYSCTRL_BASE + 0x10)
>> +#define   SC_MB_CTRL_RUN_BUSY        REG_BIT(31)
>> +#define   SC_MB_CTRL_IRQ        REG_BIT(30)
>> +#define   SC_MB_CTRL_RUN_BUSY_OUT    REG_BIT(29)
>> +#define   SC_MB_CTRL_PARAM3_MASK    REG_GENMASK(28, 24)
>> +#define   SC_MB_CTRL_PARAM2_MASK    REG_GENMASK(23, 16)
>> +#define   SC_MB_CTRL_PARAM1_MASK    REG_GENMASK(15, 8)
>> +#define   SC_MB_CTRL_COMMAND_MASK    REG_GENMASK(7, 0)
>> +
>> +#define SC_MB_DATA0            XE_REG(SYSCTRL_BASE + 0x14)
>> +#define SC_MB_DATA1            XE_REG(SYSCTRL_BASE + 0x18)
>> +#define SC_MB_DATA2            XE_REG(SYSCTRL_BASE + 0x1C)
>> +#define SC_MB_DATA3            XE_REG(SYSCTRL_BASE + 0x20)
>> +
>> +#define MKHI_FRAME_PHASE        REG_BIT(24)
>> +#define MKHI_FRAME_CURRENT_MASK        REG_GENMASK(21, 16)
>> +#define MKHI_FRAME_TOTAL_MASK        REG_GENMASK(13, 8)
>> +#define MKHI_FRAME_COMMAND_MASK        REG_GENMASK(7, 0)
>> +
>> +#define SC_MB_FRAME_SIZE        16
>> +#define SC_MB_MAX_FRAMES        64
>> +#define SC_MB_MAX_MESSAGE_SIZE        (SC_MB_FRAME_SIZE * 
>> SC_MB_MAX_FRAMES)
>> +#define SC_MKHI_COMMAND            5
>> +
>> +#define SC_MB_DEFAULT_TIMEOUT_MS    500
>> +#define SC_MB_RETRY_TIMEOUT_MS        20
>> +#define SC_MB_POLL_INTERVAL_US        100
>> +
>> +#endif /* _XE_SYSCTRL_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index e101d290b2a6..805d48dd954d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -66,6 +66,7 @@
>> #include "xe_survivability_mode.h"
>> #include "xe_sriov.h"
>> #include "xe_svm.h"
>> +#include "xe_sysctrl.h"
>> #include "xe_tile.h"
>> #include "xe_ttm_stolen_mgr.h"
>> #include "xe_ttm_sys_mgr.h"
>> @@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
>>     if (err)
>>         goto err_unregister_display;
>>
>> +    err = xe_sysctrl_init(xe);
>> +    if (err)
>> +        goto err_unregister_display;
>> +
>>     err = xe_device_sysfs_init(xe);
>>     if (err)
>>         goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index a85be9ba175e..6295b2c35d4a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -29,6 +29,7 @@
>> #include "xe_sriov_vf_ccs_types.h"
>> #include "xe_step_types.h"
>> #include "xe_survivability_mode_types.h"
>> +#include "xe_sysctrl_types.h"
>> #include "xe_tile_sriov_vf_types.h"
>> #include "xe_validation.h"
>>
>> @@ -340,6 +341,8 @@ struct xe_device {
>>         u8 has_soc_remapper_telem:1;
>>         /** @info.has_sriov: Supports SR-IOV */
>>         u8 has_sriov:1;
>> +        /** @info.has_sysctrl: Supports System Controller */
>> +        u8 has_sysctrl:1;
>>         /** @info.has_usm: Device has unified shared memory support */
>>         u8 has_usm:1;
>>         /** @info.has_64bit_timestamp: Device supports 64-bit 
>> timestamps */
>> @@ -606,6 +609,9 @@ struct xe_device {
>>     /** @heci_gsc: graphics security controller */
>>     struct xe_heci_gsc heci_gsc;
>>
>> +    /** @sc: System Controller */
>> +    struct xe_sysctrl sc;
>> +
>>     /** @nvm: discrete graphics non-volatile memory */
>>     struct intel_dg_nvm_dev *nvm;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 91e0553a8163..b6dc3030b673 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
>>     .has_soc_remapper_sysctrl = true,
>>     .has_soc_remapper_telem = true,
>>     .has_sriov = true,
>> +    .has_sysctrl = true,
>>     .max_gt_per_tile = 2,
>>     .require_force_probe = true,
>>     .va_bits = 57,
>> @@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>     xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>>     xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe- 
>> >drm.dev)) &&
>>         desc->has_sriov;
>> +    xe->info.has_sysctrl = desc->has_sysctrl;
>>     xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>>     xe->info.skip_guc_pc = desc->skip_guc_pc;
>>     xe->info.skip_mtcfg = desc->skip_mtcfg;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/ 
>> xe_pci_types.h
>> index 5f20f56571d1..53e44a32883d 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -56,6 +56,7 @@ struct xe_device_desc {
>>     u8 has_soc_remapper_sysctrl:1;
>>     u8 has_soc_remapper_telem:1;
>>     u8 has_sriov:1;
>> +    u8 has_sysctrl:1;
>>     u8 needs_scratch:1;
>>     u8 skip_guc_pc:1;
>>     u8 skip_mtcfg:1;
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/ 
>> xe_sysctrl.c
>> new file mode 100644
>> index 000000000000..9f3e0b1db380
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_sysctrl.h"
> 
> The above header should just be placed in alphabetical order below.
> 
>> +
>> +#include <linux/device.h>
>> +#include <linux/mutex.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "regs/xe_sysctrl_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_printk.h"
>> +#include "xe_soc_remapper.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_types.h"
>> +
>> +static void xe_sysctrl_fini(void *arg)
>> +{
>> +    struct xe_sysctrl *sc = arg;
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
> 
> You could use a helper and replace it everywhere with sc_to_xe(sc):
> 
> static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> {
>      return container_of(sc, struct xe_device, sc);
> }
> 
>> +
>> +    if (!xe->soc_remapper.set_sysctrl_region)
>> +        return;
>> +
>> +    xe->soc_remapper.set_sysctrl_region(xe, 0);
>> +}
>> +
>> +/**
>> + * xe_sysctrl_init - Initialize SC subsystem
>> + * @xe: xe device instance
>> + *
>> + * Entry point for SC initialization, called from xe_device_probe().
>> + * This function checks platform support and initializes the system 
>> controller.
>> + *
>> + * Return: 0 on success, error code on failure
>> + */
>> +int xe_sysctrl_init(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl *sc = &xe->sc;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return 0;
>> +
>> +    ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!xe->soc_remapper.set_sysctrl_region)
>> +        return -ENODEV;
>> +
>> +    xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>> +
>> +    ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    xe_sysctrl_mailbox_init(sc);
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/ 
>> xe_sysctrl.h
>> new file mode 100644
>> index 000000000000..f1ad12656e48
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SYSCTRL_H_
>> +#define _XE_SYSCTRL_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_sysctrl_init(struct xe_device *xe);
>> +
>> +#endif /* _XE_SYSCTRL_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/ 
>> drm/xe/xe_sysctrl_mailbox.c
>> new file mode 100644
>> index 000000000000..e9f4d4b13bb1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -0,0 +1,438 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/errno.h>
>> +#include <linux/minmax.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
> 
> Do you still need this one? Can you also double check if all headers 
> here are needed.
> 
>> +
>> +#include "xe_device.h"
>> +#include "xe_mmio.h"
>> +#include "xe_pm.h"
>> +#include "xe_printk.h"
>> +#include "xe_sysctrl.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_types.h"
>> +#include "regs/xe_sysctrl_regs.h"
>> +
>> +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, 
>> u32 bit_mask,
>> +                          unsigned int timeout_ms)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    int ret;
>> +
>> +    ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), SC_MB_CTRL, 
>> bit_mask, bit_mask,
>> +                 timeout_ms * 1000, NULL, false);
>> +
>> +    return ret == 0;
>> +}
>> +
>> +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, 
>> u32 bit_mask,
>> +                        unsigned int timeout_ms)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    int ret;
>> +
>> +    ret = xe_mmio_wait32(xe_root_tile_mmio(xe), SC_MB_CTRL, bit_mask, 
>> bit_mask,
>> +                 timeout_ms * 1000, NULL, false);
>> +
>> +    return ret == 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, 
>> const void *frame,
>> +                      size_t len)
>> +{
>> +    static const struct xe_reg data_regs[] = {
>> +        SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>> +    };
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    const u8 *bytes = frame;
>> +    u32 reg_data;
>> +    size_t i;
>> +
>> +    if (len == 0 || len > SC_MB_FRAME_SIZE) {
>> +        xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
>> +        return -EINVAL;
>> +    }
> 
> This check seems redundant. You are already rounding up cmd_size to 
> frames and then the frame size passed to this function can only be up to 
> SC_MB_FRAME_SIZE, but not zero. If this function were called from 
> outside this file, then additional checks makes sense, but it's static, 
> so this check can be dropped.
> 
>> +
>> +    for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
>> +        reg_data = *(const u32 *)(bytes + i);
>> +        xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / 
>> sizeof(u32)], reg_data);
>> +    }
>> +
>> +    if (i < len) {
>> +        size_t remaining = len - i;
>> +        size_t j;
>> +
>> +        reg_data = 0;
>> +        for (j = 0; j < remaining; j++)
>> +            reg_data |= (u32)bytes[i + j] << (j * 8);
>> +
>> +        xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / 
>> sizeof(u32)], reg_data);
>> +    }
> 
> I would suggest to simplify the logic here to make it more readable, 
> something
> like:
> 
> static const struct xe_reg regs[] = {
>      SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> };
> struct xe_device *xe = container_of(sc, typeof(*xe), sc);
> struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> u32 val[SC_MB_FRAME_SIZE/4] = {0}, i;
> 
> memcpy(val, frame, len);
> for (i = 0; i < dw; i++)
>      xe_mmio_write32(mmio, regs[i], val[i]);
> 
> return 0;
> 
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void 
>> *frame,
>> +                     size_t len)
>> +{
>> +    static const struct xe_reg data_regs[] = {
>> +        SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>> +    };
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    u8 *bytes = frame;
>> +    u32 reg_data;
>> +    size_t i;
>> +
>> +    if (len == 0 || len > SC_MB_FRAME_SIZE) {
>> +        xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
>> +        reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), 
>> data_regs[i / sizeof(u32)]);
>> +        *(u32 *)(bytes + i) = reg_data;
>> +    }
>> +
>> +    if (i < len) {
>> +        size_t remaining = len - i;
>> +        size_t j;
>> +
>> +        reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), 
>> data_regs[i / sizeof(u32)]);
>> +
>> +        for (j = 0; j < remaining; j++)
>> +            bytes[i + j] = (reg_data >> (j * 8)) & 0xFF;
>> +    }
> 
> A logic similar to the write frame can likely be used to simplify this 
> function.
> 
> static const struct xe_reg regs[] = {
>      SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> };
> struct xe_device *xe = container_of(sc, typeof(*xe), sc);
> struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> u32 val[SC_MB_FRAME_SIZE/4] = {0}, i;
> 
> for (i = 0; i < dw; i++)
>      val[i] = xe_mmio_read32(mmio, regs[i]);
> 
> memcpy(frame, val, len);
> 
> return 0;
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    u32 ctrl_reg;
>> +
>> +    ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>> +    ctrl_reg &= ~SC_MB_CTRL_RUN_BUSY_OUT;
>> +    xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);
> 
> You could use xe_mmio_rmw32() instead.
> 
>> +}
>> +
>> +static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
>> +                          u8 group_id, u8 command,
>> +                           const void *data_in, size_t data_in_len,
>> +                           u8 **cmd_buffer, size_t *cmd_size)
>> +{
> 
> In the caller cmd_buffer has a different type and here it is u8**. For 
> readability, I would recommend using a different name here, maybe mkhi_msg.
> 
>> +    struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>> +    size_t size;
>> +    u8 *buffer;
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
> 
> I would move the xe initialization to the top.
> 
>> +
>> +    size = sizeof(*mkhi_hdr) + data_in_len;
>> +    if (size > SC_MB_MAX_MESSAGE_SIZE) {
>> +        xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
>> +        return -EINVAL;
>> +    }
>> +
>> +    buffer = kmalloc(size, GFP_KERNEL);
>> +    if (!buffer)
>> +        return -ENOMEM;
>> +
>> +    mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>> +    mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, 
>> group_id) |
>> +                      FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 
>> 0x7F) |
>> +                      FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>> +                      FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>> +                      FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>> +
> 
> FIELD_PREPs un-aligned by one space.
> 
>> +    if (data_in && data_in_len)
>> +        memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>> +
>> +    *cmd_buffer = buffer;
>> +    *cmd_size = size;
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, 
>> const u8 *cmd_buffer,
>> +                      size_t cmd_size, unsigned int timeout_ms)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    u32 ctrl_reg, total_frames, frame;
>> +    size_t bytes_sent, frame_size;
>> +
>> +    total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
>> +
>> +    if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, 
>> timeout_ms)) {
>> +        xe_err(xe, "sysctrl: Mailbox busy\n");
>> +        return -EBUSY;
>> +    }
>> +
>> +    sc->phase_bit ^= 1;
>> +
> Empty line not needed here.
>> +    bytes_sent = 0;
>> +
>> +    for (frame = 0; frame < total_frames; frame++) {
>> +        frame_size = min(cmd_size - bytes_sent, 
>> (size_t)SC_MB_FRAME_SIZE);
>> +
>> +        if (xe_sysctrl_mailbox_write_frame(sc, cmd_buffer + 
>> bytes_sent, frame_size)) {
>> +            xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>> +            return -EIO;
> 
> If you failed to write the frame here, what happens to phase bit. Should 
> you toggle it back?
> 
>> +        }
>> +
>> +        ctrl_reg = SC_MB_CTRL_RUN_BUSY |
>> +               FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>> +               FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>> +               FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
>> +               (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>> +
>> +        xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);
>> +
>> +        if (!xe_sysctrl_mailbox_wait_bit_clear(sc, 
>> SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> +            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", 
>> frame);
>> +            return -ETIMEDOUT;
>> +        }
>> +
>> +        bytes_sent += frame_size;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
>> +                          const struct 
>> xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,
>> +                          void *out,
>> +                          size_t frame_size,
>> +                          size_t *payload_bytes)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    u32 frame_data[4];
>> +    struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>> +    size_t hdr_size = sizeof(*resp_hdr);
>> +    size_t payload_size;
>> +    int ret;
>> +
>> +    ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
>> +    if (ret)
>> +        return ret;
>> +
>> +    resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>> +
>> +    if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>> +        XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != 
>> XE_SYSCTRL_MKHI_HDR_GROUP_ID(req_hdr) ||
>> +        XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != 
>> XE_SYSCTRL_MKHI_HDR_COMMAND(req_hdr)) {
>> +        xe_err(xe, "SC: Response header mismatch\n");
>> +        return -EPROTO;
>> +    }
>> +
>> +    if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>> +        xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>> +               XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>> +        return -EIO;
>> +    }
>> +
>> +    payload_size = frame_size - hdr_size;
>> +    if (payload_size > 0)
>> +        memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>> +
>> +    *payload_bytes = payload_size;
>> +
>> +    xe_sysctrl_mailbox_clear_response(sc);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
>> +                        void *out, size_t frame_size,
>> +                         unsigned int timeout_ms)
>> +{
>> +    int ret;
>> +
>> +    if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, 
>> timeout_ms))
> 
> response frame timedout message must be here.
> 
>> +        return -ETIMEDOUT;
>> +
>> +    ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
>> +    if (ret)
>> +        return ret;
>> +
>> +    xe_sysctrl_mailbox_clear_response(sc);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
>> +                         const struct xe_sysctrl_mailbox_mkhi_msg_hdr 
>> *req_hdr,
>> +                          void *data_out, size_t data_out_len,
>> +                          size_t *rdata_len, unsigned int timeout_ms)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>> +    u32 ctrl_reg, total_frames, frame;
>> +    size_t hdr_size = sizeof(*mkhi_hdr);
>> +    u8 *out = data_out;
>> +    size_t received = 0;
>> +    size_t frame_size;
>> +    int ret;
> 
> int ret = 0;
> 
>> +
>> +    if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, 
>> timeout_ms)) {
>> +        xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>> +        return -ETIMEDOUT;
>> +    }
>> +
>> +    ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>> +    total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>> +
>> +    if (total_frames == 1)
>> +        frame_size = min(hdr_size + data_out_len, 
>> (size_t)SC_MB_FRAME_SIZE);
>> +    else
>> +        frame_size = SC_MB_FRAME_SIZE;
>> +
>> +    ret = xe_sysctrl_mailbox_process_first_frame(sc, req_hdr, out, 
>> frame_size, &received);
>> +    if (ret)
>> +        return ret;
>> +
>> +    out += received;
>> +
>> +    for (frame = 1; frame < total_frames; frame++) {
>> +        size_t remaining = data_out_len - received;
>> +
>> +        frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
>> +
>> +        ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, 
>> timeout_ms);
>> +        if (ret) {
>> +            xe_err(xe, "sysctrl: Response frame %u timeout\n", frame);
> 
> this message should be in xe_sysctrl_mailbox_process_frame.
> 
> At this point you have already copied some data into the out pointer, so 
> you might as well update *rdata_len with the partial copied data. So you 
> can break here and return ret at the end of the function.
> 
>> +            return ret;
>> +        }
>> +
>> +        received += frame_size;
>> +        out += frame_size;
>> +    }
>> +
>> +    *rdata_len = received;
>> +
>> +    return 0;
> 
> return ret;
> 
>> +}
>> +
>> +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
>> +                       const u8 *cmd_buffer, size_t cmd_size,
>> +                        void *data_out, size_t data_out_len,
>> +                        size_t *rdata_len, unsigned int timeout_ms)
>> +{
>> +    const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>> +    size_t received;
>> +    int ret;
>> +
>> +    ret = xe_sysctrl_mailbox_send_frames(sc, cmd_buffer, cmd_size, 
>> timeout_ms);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!data_out) {
>> +        if (rdata_len)
>> +            *rdata_len = 0;
>> +        return 0;
>> +    }
> 
> The above check should just be
> 
>      if (!data_out || !rdata_len)
>          return 0;
> 
> I would recommend writing to *rdata_len only on successful receive.
> 
>> +
>> +    mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr 
>> *)cmd_buffer;
>> +
>> +    ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, 
>> data_out_len,
>> +                        &received, timeout_ms);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (rdata_len)
>> +        *rdata_len = received;
> 
> If you added the above comment, then at this point you already know 
> rdata_len
> is valid, so the check can be dropped.
> 
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_send_command - Send command to System Controller via 
>> mailbox
>> + * @handle: XE device handle
>> + * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
>> + * @rdata_len: Pointer to store actual response data size (can be NULL)
>> + *
>> + * Send a command to the System Controller using MKHI protocol. Handles
>> + * command preparation, fragmentation, transmission, and response 
>> reception.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t 
>> *rdata_len)
>> +{
> 
> Why void *cmd_buffer? Do you expect anything other than 
> xe_sysctrl_mailbox_command? If you do, your function signature will 
> change anyways, so why not just define it as struct 
> xe_sysctrl_mailbox_command *cmd?
> 
We used void *cmd_buffer for flexibility and future payload support. If 
a strongly typed API is preferred, we can align with consumer modules 
and update it accordingly.

>> +    struct xe_device *xe = handle;
>> +    struct xe_sysctrl *sc = &xe->sc;
>> +    struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
>> +    u8 *buffer = NULL;
>> +    size_t command_size = 0;
>> +    u8 group_id, command_code;
>> +    int ret = 0;
>> +
>> +    if (!xe || !cmd) {
> 
> I suggest splitting the 2 checks here into separate if blocks and use 
> pr_err or pr_debug if xe is NULL.
> 
>> +        if (xe)
>> +            xe_err(xe, "sysctrl: Invalid parameters\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return -ENODEV;
>> +
>> +    group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>> +    command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> 
> Would be good to check if the group_id and command_id are valid here.
This function is intended to support multiple groups and commands, so we 
avoid enforcing strict group_id and command_code checks here.

>> +
>> +    if (!cmd->data_in && cmd->data_in_len) {
>> +        xe_err(xe, "sysctrl: Invalid input parameters\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!cmd->data_out && cmd->data_out_len) {
>> +        xe_err(xe, "sysctrl: Invalid output parameters\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    might_sleep();
>> +
>> +    ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
>> +                         cmd->data_in, cmd->data_in_len,
>> +                         &buffer, &command_size);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    xe_pm_runtime_get(xe);
>> +
>> +    guard(mutex)(&sc->cmd_lock);
>> +
>> +    ret = xe_sysctrl_mailbox_send_command(sc, buffer, command_size,
>> +                          cmd->data_out, cmd->data_out_len, rdata_len,
>> +                          SC_MB_DEFAULT_TIMEOUT_MS);
>> +    if (ret)
>> +        xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>> +
>> +    xe_pm_runtime_put(xe);
> 
> hmm, not sure this ordering is correct. Ideally you want mutex_unlock 
> before runtime pm put, but the guard will only make sure unlock happens 
> at function return. If using guard, you may want to define a similar 
> guard for runtime pm. Maybe that's what Michal was suggesting earlier.
> 
>> +
>> +    kfree(buffer);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_mailbox_init - Initialize the system controller mailbox 
>> state
>> + * @sysctrl: System controller structure
>> + */
>> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>> +{
>> +    struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>> +    u32 ctrl_reg;
>> +
>> +    ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>> +    sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>> +
>> +    xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, 0);
> 
> You could use xe_mmio_rmw32() instead.
> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/ 
>> drm/xe/xe_sysctrl_mailbox.h
>> new file mode 100644
>> index 000000000000..6380d1d68f8f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_SYSCTRL_MAILBOX_H__
>> +#define __XE_SYSCTRL_MAILBOX_H__
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_sysctrl;
>> +
>> +#define MKHI_HDR_GROUP_ID_MASK        GENMASK(7, 0)
>> +#define MKHI_HDR_COMMAND_MASK        GENMASK(14, 8)
>> +#define MKHI_HDR_IS_RESPONSE        BIT(15)
>> +#define MKHI_HDR_RESERVED_MASK        GENMASK(23, 16)
>> +#define MKHI_HDR_RESULT_MASK        GENMASK(31, 24)
> 
> My interpretation was different from reading the spec. More like 
> group_id is at bit[31:24] and result at bit[7:0]. Have you confirmed the 
> above bitmask?
Yes, this bitmask works as expected in loopback testing.

Thanks,
Anoop
> 
>> +
>> +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>> +    __le32 data;
>> +} __packed;
>> +
>> +#define APP_HDR_GROUP_ID_MASK        GENMASK(7, 0)
>> +#define APP_HDR_COMMAND_MASK        GENMASK(15, 8)
>> +#define APP_HDR_VERSION_MASK        GENMASK(23, 16)
>> +#define APP_HDR_RESERVED_MASK        GENMASK(31, 24)
>> +
>> +struct xe_sysctrl_mailbox_app_msg_hdr {
>> +    __le32 data;
>> +} __packed;
>> +
>> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr)    
>> FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr)        
>> FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr)        
>> FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>> +
>> +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr)    
>> FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr)    
>> FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr)    
>> FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>> +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr)        
>> FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> +
>> +/**
>> + * struct xe_sysctrl_mailbox_command - System Controller mailbox 
>> command structure
>> + */
>> +struct xe_sysctrl_mailbox_command {
>> +    /** @header: Application message header containing command 
>> information */
>> +    struct xe_sysctrl_mailbox_app_msg_hdr header;
> 
>> +    /** @data_in: Pointer to input payload data (can be NULL if no 
>> input data) */
>> +    void *data_in;
> 
>> +    /** @data_in_len: Size of input payload in bytes (0 if no input 
>> data) */
>> +    size_t data_in_len;
> 
>> +    /** @data_out: Pointer to output buffer for response data (can be 
>> NULL if no response) */
>> +    void *data_out;
> 
>> +    /** @data_out_len: Size of output buffer in bytes (0 if no 
>> response expected) */
>> +    size_t data_out_len;
> 
> Empty lines between members above will help readability.
> 
>> +};
>> +
>> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t 
>> *rdata_len);
>> +
>> +#endif /* __XE_SYSCTRL_MAILBOX_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/ 
>> xe/xe_sysctrl_types.h
>> new file mode 100644
>> index 000000000000..80e674cfa385
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SYSCTRL_TYPES_H_
>> +#define _XE_SYSCTRL_TYPES_H_
>> +
>> +#include <linux/completion.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
> 
> Use only what's needed in this header. If you C file requires some of 
> these headers, you want to move those to the C file.
> 
> Regards,
> Umesh
> 
>> +
>> +/**
>> + * struct xe_sysctrl - System Controller driver context
>> + */
>> +struct xe_sysctrl {
>> +    /** @cmd_lock: Mutex protecting mailbox command operations */
>> +    struct mutex cmd_lock;
>> +
>> +    /** @phase_bit: MKHI message boundary phase toggle bit */
>> +    u32 phase_bit;
>> +};
>> +
>> +#endif /* _XE_SYSCTRL_TYPES_H_ */
>> -- 
>> 2.43.0
>>

