Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22296D59F5F
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 00:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E5F10E03C;
	Thu,  7 Nov 2024 00:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGM+4wSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E1410E03C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 00:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730939609; x=1762475609;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vt+Ro5D3v4BHW4wWA/YrU6odxUmFxeWjhk3CL9q4Ft0=;
 b=GGM+4wSk0nXPEnkxrso4IsvbJthnMCe5lxDcxTXUzn5uAfMrsYPjmpO3
 9gyVOVWdYDSeIZW5QI+w4gadudNosT44dx3PmucA6JDaMup2o5nywYktv
 hTF8rq0wMpTvryPFO9AOKwrfa5rRW1dZ9u+09pT/6Y+mdjkBXjfd2Ks7c
 9PmNyqGF1gBPQR7RCVbAsxvESNS2B3EChtg1QIMKgFwQXSzOMO9fAfQO0
 RzhQUpIzRh7VGI8oW+uU8shmJf85/iXgSUMRSI/3MxAotKjNIDY/h68gc
 Rey50WSGK/MiSGdmXMsyuP27tHi1H4PbMsezVV9q8Mp6Q/4W9rrJCJCuF A==;
X-CSE-ConnectionGUID: JWfuTW86RDm5tnRjFrxfow==
X-CSE-MsgGUID: F0R2mIv0QVaPFP+H4CR4vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30727012"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30727012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 16:33:29 -0800
X-CSE-ConnectionGUID: GtSZovFRRvahGTRRaKP3RQ==
X-CSE-MsgGUID: z1ifM81YS9e8zlJpEu5G9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="122370457"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 16:33:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 16:33:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 16:33:28 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 16:33:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKBwUNlEQSFYzS4h3R1Va+Y/BkyeKqlmzsbASjBdYTZRoHufZsSMDQXUIjZIcn2miZF5/dMceGSu6eUlv5/EL+V1mAbCL8RAp9jWLlcP3wLF33nLSNdaz4bq2RjzhY0fuEebX7zipGrclY1YBEmHQelGffvioFYJt8s1m0sAHJ2i6PWsESvjU66ZMpxclLM5EWA1H9pWcA0ZWkGLEpn2Qej0t61vtEwZ82as2ZzWGoTvmbrr6NgVeUripDb0kFIphUXVoSoLhTj4AMtVEjMiV0PMHxQxp19zY6Y6Oa+vO5S5qMDbiglJpiXW61jKS1ZzqNyAmvqqhQtK7FqnOcuJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m95vMvw+xM3WuX6ZyLcEpNhAdPCRSJFmy6znJmmCcv8=;
 b=qvNcpLmit5olaKz3UCtmRqn2rlDO70ly5EcMA1Lu2mO1JGlBNjDWYAOtmtx/2zPKiyoG3Hb6wvDNlcm/dD3h+pqsCmg6+zVitF7mQL4PSorGeV04EvobF0jbHw3vmlwWjvrXciz8yJkCq+S31v3VYZYg+6i6TIyXwI+c3s3PxTCox06BTzgwZSAHXlGnzWzOlPA3DDhAEYNMJOXUvdQJRWEYw0+q6pLqDLPliynIFH8XcXZHKCL3yu1khkTu/5XXjlONJ1WkhnfToztLdXz/PbRm/CMI0KmlKRW4EMmLyUqiqLvnOPLZyAEnUE9Motfn5TuzsMAceTOM67ERxdf4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 00:33:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 00:33:22 +0000
Message-ID: <2eb53217-757a-47c0-81ab-6106d3e00c7d@intel.com>
Date: Wed, 6 Nov 2024 16:33:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/xe/pxp: Handle the PXP termination interrupt
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-6-daniele.ceraolospurio@intel.com>
 <9655d74e-f3f0-4d60-bef3-b9006db61bc3@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <9655d74e-f3f0-4d60-bef3-b9006db61bc3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: e32d0565-917c-4cd0-0e6a-08dcfec3c8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V05WdmRrK1FkRlA4NDBtOENnOWlrQ1NsTk5kNmdVVnoySTZzQkc1cGFRZExw?=
 =?utf-8?B?OTBmVHU0d1dFVzRDS3M2cHBtWU5kRnZCNUdYVEw2OW1ZRHBzRzZwWS8rVkVX?=
 =?utf-8?B?YkdBbFBBcDV6VDlZdi9wWHVmdnQwcWlISkNsYlpRdUhUMnQrTkY0VGU2OUJK?=
 =?utf-8?B?am1kM0dHa1Z5MzNCM2ZjQnQvVVBIUDlQNnJ2S1dBdUxVUDdQbkh5NEQ0dFFS?=
 =?utf-8?B?VTMzL1VUcktYcXhxK0luN1BkVDU1alJJOEpqVjZra1hmR1FUcXp0a2dOZXBL?=
 =?utf-8?B?UFFsUTBscUdqdHF3YXNqYU1PMGszNGRoYXVBYUNNUnNuWlo0UjRHREViY21w?=
 =?utf-8?B?bWNoMnd5a2FCUmFRQTROdEE1a3JRQmxTRVJzZFpGTGdWa0NRTmZxQXpnNmhV?=
 =?utf-8?B?bEd4dlBpb3JqRjEzdW5zQ05TYlAzU1NCZVFscHQ4Y2VhQUlVeDBrVFRDL21s?=
 =?utf-8?B?bGRoNHNDTHkvZTB6WkxtV01UUmJwMVU3SHpjd20wL0gwZDk0cWN3QzFUVjk4?=
 =?utf-8?B?MW8vaDQrNnAzckxzOXg4VTV6dkkrby9ZOHp0TFk4b2l5Z1NUUTJxSHAxVVlP?=
 =?utf-8?B?TVB4SytnMFpSbXYrWTFKbXdvalV4RWVOZ3VZRElkdkdrSWFackd3WkFQZ1Y0?=
 =?utf-8?B?MTByL1hST2VpVncrVC9GT0t0bkQrMzRMZ2ptZkQ0SEtPbFYzeERMNXpsb2ZI?=
 =?utf-8?B?MWg0RSt6MlJxd21ZZGdRZDFZNmFFTHkvbENsZUVySzJqYWQyTURJNjAwdERB?=
 =?utf-8?B?OEk3QjE2aEtiajU4czdBQ2oyekltakRFRTIzY0VnTmh0ajAzVE5XMEZuT3BG?=
 =?utf-8?B?aU1UOVBHQ2xyS0FBeUtBK2N3Y0JrZmFZYytWeFR5RFg0WDZnZDlUb09VL2FJ?=
 =?utf-8?B?QVkwM25PTjVBekVadC9xNjRsVmRvOTZZTm9JbW9sdVMxOU9ZelVOeExmRXR4?=
 =?utf-8?B?dWFmdEt3WFk5eitqcDhGU09BQkpzK1l0ZGs2RHU2OThjYnFtUmFDc0xCc2NO?=
 =?utf-8?B?dGdkaElsaXhYZGtPOU5pTDljanc4WWNNY2x4L3pJUWFPdUQ3ekxIRzJMSFU0?=
 =?utf-8?B?TDJDcWI0VkJxSlhJQXZHd2VvUmpseVYvaUtNd2F4ZnNZUmFFeTZWSjVNQ3VI?=
 =?utf-8?B?ZHNzSjNrMy9xa21ZdForVk8xd0hpVnNJV2d6R2dtb0EzTkt0ZnBRMjVKY1RY?=
 =?utf-8?B?SXVENXYvT0NnRThldUE2ZFZyOVZNdjhuOVQwQ2d4UUxxeXh0bnpaUXdBZllr?=
 =?utf-8?B?b1FIUGtCQ1VqUXpOU2p6SnNyVGJZSCtQS3dHT1NuNERBQ2dadUYrZHBUV3Zh?=
 =?utf-8?B?ZHl4OWJocXN2UmtuUWVJTGRWa1daSXVYdlpRM2MwNXVIQWVaN2ZwTWxuYUVN?=
 =?utf-8?B?dHFsVENtSzEvbTJJWlhQY1R1SzZZMTJwbnR4ajVPMEVqR1huUytiY0VPVjhi?=
 =?utf-8?B?TFQzc05tbFZtK0xpMjlFRG42ZjhOZitmUlBzZ3FRSjhRcVZRY2VJZnkvVWpB?=
 =?utf-8?B?MElLcEliRHppdHBSNzM1VXc1a0ttTGU1Z2loYVpMbllOUGwrekZsenpIOG1B?=
 =?utf-8?B?NDRJK21DUHhIa2ZPYUN1Tm5CTnBHNElEN2JGTGsrUUlXUFJiS1paWkE5a0FM?=
 =?utf-8?B?WmlHMDFiS05hZTE3OFJTWjFRbzhCSzY4WklLOTJKNi9SQldyNSswREp3OHk2?=
 =?utf-8?B?T0V5Tmt4cHR0WmUzT0dyeno5RmFuODV3QmFYOWhWclF3RUdtQU9GUEgyenNW?=
 =?utf-8?Q?+MSEOY5rEDFvzMBdSvbU8YC5CpFkASBjtz195VC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzBxcFJ0dGVPQjV1c09VV0o3Y0pvOGlHZVRmcmJ5YzNoVVIvODJXYTdiZGpK?=
 =?utf-8?B?QWdCQ2wwREpsVXFVYnRjT0NqK3dOdndSYzVKNGRtaUV0Y21CdHRDaVlTQXhB?=
 =?utf-8?B?N2JmZXRFQTNKL1I2N2Z2QnZGT2Mvdy9vc3RJeFEwVzdGQWRuKzJmcFlhWSt1?=
 =?utf-8?B?cGpQTzY5UDluU3FpZm85TlZqQUsyTS8xa2dZTnhnOURBQWZpd0pOWmtjazBp?=
 =?utf-8?B?dlZRelhXTFVlS3FoQVlMR2k2Ky9iM3dDUHUwK1ZsZkZsdlI3WnFGWXQvbkd2?=
 =?utf-8?B?c29UVGFFdHM5L25WTm45YmtveThKZmIwRFIwaGY0cGRpT1cvb0dFTXg5TkE2?=
 =?utf-8?B?YkJRdTlNYWVqeVhXOER3Yi83U1ZldG9ObTFrdjJkYkJCLzI3aGpDK3krV1Nv?=
 =?utf-8?B?UnRxL05JdDF5enN5UmtHbFd2ZmZHUmo1UTEyRHcvdjk2aXJDcjVTZDlSZUhO?=
 =?utf-8?B?V3V2cjFhRnlGWlQwakxxRXZjT2MyemxnRzI5U3Z5Q3hoSlVlc2pXckgrQ2Yv?=
 =?utf-8?B?SEp4M2tTL0M3WWhNZ2NsWmw4T3dUbkRHRWFDemk0Qk8wMzdYQ29VRWNXK1Vx?=
 =?utf-8?B?UEZWZ1BkK2VVdTVPVFlJc0ZtenEycExWZTVVcitFTlA3NC9hUG1YckU3bXZM?=
 =?utf-8?B?S1JqMWNIN0tMN1ZhZXUvZklncXM3NEYveVhaV2FELzBVeVZuU3h1WVdEUDJy?=
 =?utf-8?B?bTRJZ3J3SEp6V2ZKZCtCZDY4WHd4MCtRNkswblNJOFB1WjgwdUJMQytxc082?=
 =?utf-8?B?VUcySWpJUHJXTHlGTmd5M29oLzIxQUFKdHhvWm1rbWVkM01ndTJ0NlVZTlJZ?=
 =?utf-8?B?ZDFPNjNHQlQ1ZnNrTHZSM3pSenRQZlNQdHQ3RGUvelNjQUJlUXp4ZHNETWtm?=
 =?utf-8?B?SlI3ZXl2c2luTUNFZnJ5TzBmMUZFSzdqMk54czFQSEdQdCtDN211RTRSOGVV?=
 =?utf-8?B?ZDlpUlIrdm4xVGtaZ3JYS1p1R0phT2k3WVREL0xpaTk0ZHhtbWJXR3ZFNXVV?=
 =?utf-8?B?QWFPa0tYRlVMWG4vMFFDNmN1QmZMZXdRbUJHbU9pUGJtTDAyQ0ovSmFkTjN0?=
 =?utf-8?B?ZlIzV0p2aEJhWWFIMlRCU2RJWXFNV0ZlUCtsTHRwK29uV2dWaUdvOXRLVUhy?=
 =?utf-8?B?cjZUK1NzMHBRY1lkRjZrNWx2MThoNnhHeERKVlJJenpZVDhaem1Bd3ppWGJT?=
 =?utf-8?B?Q3A5YmxYbDQ1dWs5blVyOHh3aEw0U3BGaldqdExDbnorOFdMQUFpalVSTXgy?=
 =?utf-8?B?M0lheHdFM2NCeXgyc1dZSEVHaTZiMGFYL0NQTUcwR3Z2bkt5Slo5UjlidXZu?=
 =?utf-8?B?Y2ZrUCtXaElxeXFuRHl2ZXNVdVJjSkVvT0VodklidmJNamdaNSs0RWczYit3?=
 =?utf-8?B?ckNxWXdjRVl1ZjJRNmlpQVdTNEF2eUQwUEZkYU5EYjl1Q1AyTFlBMWwrWlVu?=
 =?utf-8?B?Y1JhdytjZW5OQWVqbHd0Z0ZRNFBIQkc4T3hjdU1rN2djUkRXamJXUmlRL2Fz?=
 =?utf-8?B?MXRackZyRklCNjN2ek9FZWt0NTJwK01uVzJHU09aVlRhMWRuckl0TWdyQnlW?=
 =?utf-8?B?Y1Z3Nk9CUm1KRjE5VWEvSnR5K2lmZExjVGRkemZVZnFpNU1wVUkyQmxCdEly?=
 =?utf-8?B?YjBjSUFvMTRPZTlzMkhlaUUzV0pITldoSHE0Z3Z0N1hUWDd6MjU1K08zL3dx?=
 =?utf-8?B?VWlTSHkvV3RtbmRpMHdCeitlY1J3Z0t1UGViRnM0S3orUGtsalZ3MVVsS2hB?=
 =?utf-8?B?Z1lGVk9ma0t3bi9kUER3dm9vWklCQW1zSTBHNVREazBhUUpuSVp5eWhjYlh6?=
 =?utf-8?B?bHdMOTEycXhtZUVtTHFSbDJvYXVGRHdkbkVydjlOa3RvN0kwNCt4c0FpUWIw?=
 =?utf-8?B?NEdLSFRlS2NBWDBRMkhNTGxKcDkrYmdydlIwb3A3TzUwR2FOZmc4azFiR01Z?=
 =?utf-8?B?T3Bqbm9ZN0dCRjErRTMvQUV3SnVOQm5LUnNSUnF6WUJxRTlwRjFVSWd0UXUx?=
 =?utf-8?B?VlpxTG5JY2dNNnhXT1RlTDR4THlOZ1EwSmlUK0FQUlNpc2l2ME5OUXEwSkxU?=
 =?utf-8?B?aFRPcjNBdFlVOHd2N0tWWXZVZlZjZlBPb2tJcWpVMjFNdVk4RDNKTkNadXF2?=
 =?utf-8?B?S0Z6L0orWHlNMTYrV2JLWUEzOGlGaTFITUV3R2J0KzA0V2F0VzJ6TmswdDZN?=
 =?utf-8?Q?SEUGgBDAUDxGoRtSWCWTZUE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e32d0565-917c-4cd0-0e6a-08dcfec3c8ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 00:33:22.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ap1vXTGOHSd8cGmVAPRGxoWjH6qxGNoi5lYAULP/2lnZZ2t5rhZnNH87f5U62MLQ6Z/bpr+9TtIuMBLPzHPjDZwsEn9UGSWVEDTAJ1SJDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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


On 10/7/24 17:34, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> When something happen to the session, the HW generates a termination
>> interrupt. In reply to this, the driver is required to submit an inline
>> session termination via the VCS, trigger the global termination and
>> notify the GSC FW that the session is now invalid.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
>>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
>>   drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
>>   drivers/gpu/drm/xe/xe_pxp.c           | 138 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pxp.h           |   3 +
>>   drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
>>   6 files changed, 184 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0d1a4a9f4e11..9e9c20f1f1f4 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -570,6 +570,7 @@
>>   #define   ENGINE1_MASK                REG_GENMASK(31, 16)
>>   #define   ENGINE0_MASK                REG_GENMASK(15, 0)
>>   #define GPM_WGBOXPERF_INTR_ENABLE        XE_REG(0x19003c, 
>> XE_REG_OPTION_VF)
>> +#define CRYPTO_RSVD_INTR_ENABLE            XE_REG(0x190040)
>>   #define GUNIT_GSC_INTR_ENABLE            XE_REG(0x190044, 
>> XE_REG_OPTION_VF)
>>   #define CCS_RSVD_INTR_ENABLE            XE_REG(0x190048, 
>> XE_REG_OPTION_VF)
>>   @@ -580,6 +581,7 @@
>>   #define   INTR_ENGINE_INTR(x) REG_FIELD_GET(GENMASK(15, 0), x)
>>   #define   OTHER_GUC_INSTANCE            0
>>   #define   OTHER_GSC_HECI2_INSTANCE        3
>> +#define   OTHER_KCR_INSTANCE            4
>>   #define   OTHER_GSC_INSTANCE            6
>>     #define IIR_REG_SELECTOR(x)            XE_REG(0x190070 + ((x) * 
>> 4), XE_REG_OPTION_VF)
>> @@ -591,6 +593,7 @@
>>   #define HECI2_RSVD_INTR_MASK            XE_REG(0x1900e4)
>>   #define GUC_SG_INTR_MASK            XE_REG(0x1900e8, XE_REG_OPTION_VF)
>>   #define GPM_WGBOXPERF_INTR_MASK            XE_REG(0x1900ec, 
>> XE_REG_OPTION_VF)
>> +#define CRYPTO_RSVD_INTR_MASK            XE_REG(0x1900f0)
>>   #define GUNIT_GSC_INTR_MASK            XE_REG(0x1900f4, 
>> XE_REG_OPTION_VF)
>>   #define CCS0_CCS1_INTR_MASK            XE_REG(0x190100)
>>   #define CCS2_CCS3_INTR_MASK            XE_REG(0x190104)
>> @@ -605,4 +608,9 @@
>>   #define   GT_CS_MASTER_ERROR_INTERRUPT        REG_BIT(3)
>>   #define   GT_RENDER_USER_INTERRUPT        REG_BIT(0)
>>   +/* irqs for OTHER_KCR_INSTANCE */
>> +#define   KCR_PXP_STATE_TERMINATED_INTERRUPT        REG_BIT(1)
>> +#define   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT    REG_BIT(2)
>> +#define   KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT    REG_BIT(3)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>> index d67cf210d23d..aa158938b42e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>> @@ -14,4 +14,10 @@
>>   #define KCR_INIT                XE_REG(0x3860f0)
>>   #define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES    REG_BIT(14)
>>   +/* KCR hwdrm session in play status 0-31 */
>> +#define KCR_SIP                    XE_REG(0x386260)
>> +
>> +/* PXP global terminate register for session termination */
>> +#define KCR_GLOBAL_TERMINATE            XE_REG(0x3860f8)
>> +
>>   #endif /* __XE_PXP_REGS_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 5f2c368c35ad..f11d9a740627 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_hw_engine.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pxp.h"
>>   #include "xe_sriov.h"
>>     /*
>> @@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>           }
>>           if (heci_mask)
>>               xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask 
>> << 16));
>> +
>> +        if (xe_pxp_is_supported(xe)) {
>> +            u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
>> +                       KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
>> +                       KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
>> +
>> +            xe_mmio_write32(gt, CRYPTO_RSVD_INTR_ENABLE, kcr_mask << 
>> 16);
>> +            xe_mmio_write32(gt, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask << 
>> 16));
>> +        }
>>       }
>>   }
>>   @@ -324,9 +334,15 @@ static void gt_irq_handler(struct xe_tile *tile,
>>               }
>>                 if (class == XE_ENGINE_CLASS_OTHER) {
>> -                /* HECI GSCFI interrupts come from outside of GT */
>> +                /*
>> +                 * HECI GSCFI interrupts come from outside of GT.
>> +                 * KCR irqs come from inside GT but are handled
>> +                 * by the global PXP subsystem.
>> +                 */
>>                   if (HAS_HECI_GSCFI(xe) && instance == 
>> OTHER_GSC_INSTANCE)
>>                       xe_heci_gsc_irq_handler(xe, intr_vec);
>> +                else if (instance == OTHER_KCR_INSTANCE)
>> +                    xe_pxp_irq_handler(xe, intr_vec);
>>                   else
>>                       gt_other_irq_handler(engine_gt, instance, 
>> intr_vec);
>>               }
>> @@ -512,6 +528,8 @@ static void gt_irq_reset(struct xe_tile *tile)
>>           xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
>>           xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
>>           xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
>> +        xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, 0);
>> +        xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~0);
>>       }
>>         xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index 56bb7d927c07..382eb0cb0018 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -12,9 +12,11 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pm.h"
>>   #include "xe_pxp_submit.h"
>>   #include "xe_pxp_types.h"
>>   #include "xe_uc_fw.h"
>> +#include "regs/xe_gt_regs.h"
>>   #include "regs/xe_pxp_regs.h"
>>     /**
>> @@ -25,11 +27,133 @@
>>    * integrated parts.
>>    */
>>   -static bool pxp_is_supported(const struct xe_device *xe)
>> +#define ARB_SESSION 0xF /* TODO: move to UAPI */
>> +
>> +bool xe_pxp_is_supported(const struct xe_device *xe)
>>   {
>>       return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>>   }
>>   +static bool pxp_is_enabled(const struct xe_pxp *pxp)
>> +{
>> +    return pxp;
>> +}
>> +
>> +static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, 
>> bool in_play)
>> +{
>> +    struct xe_gt *gt = pxp->gt;
>> +    u32 mask = BIT(id);
>> +    int ret;
>> +
>> +    ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = xe_mmio_wait32(gt, KCR_SIP, mask, in_play ? mask : 0,
>> +                 250, NULL, false);
>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +
>> +    return ret;
>> +}
>> +
>> +static void pxp_terminate(struct xe_pxp *pxp)
>> +{
>> +    int ret = 0;
>> +    struct xe_device *xe = pxp->xe;
>> +    struct xe_gt *gt = pxp->gt;
>> +
>> +    drm_dbg(&xe->drm, "Terminating PXP\n");
>> +
>> +    /* terminate the hw session */
>> +    ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
>> +    if (ret)
>> +        goto out;
>> +
>> +    ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
>> +    if (ret)
>> +        goto out;
>> +
>> +    /* Trigger full HW cleanup */
>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> Why WARN here but no explicit message at all if the earlier force wake 
> fails? And is it safe to keep going if the fw did fail?

The idea was that if we know that the state is good enough to terminate 
we could try to do it even with a forcewake error, worst case it doesn't 
work. If we don't know the state we can't attempt a termination at all.


>
> Also, given two identical, back-to-back fw get/put sets, would it not 
> be more efficient to have pxp_terminate do the get and share that 
> across the two register access? It would also remove the issue with 
> failed fw half way through causing problems due to not wanting to abort.

will do.


>
>> +    xe_mmio_write32(gt, KCR_GLOBAL_TERMINATE, 1);
> BSpec description for KCR_GLOBAL_TERMINATE says need to check 
> KCR_SIP_GCD rather than KCR_SIP_MEDIA for bits 0-15 being 0. Whereas 
> the KCR_SIP being checked above is KCR_SIP_MEDIA only.

That's just the spec not being super clear. The description is common 
between the render and the media copies of the registers, but you need 
to check the version of the registers on the actual GT you're doing the 
termination on.


>
>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +
>> +    /* now we can tell the GSC to clean up its own state */
>> +    ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, 
>> ARB_SESSION);
>> +
>> +out:
>> +    if (ret)
>> +        drm_err(&xe->drm, "PXP termination failed: %pe\n", 
>> ERR_PTR(ret));
>> +}
>> +
>> +static void pxp_terminate_complete(struct xe_pxp *pxp)
>> +{
>> +    /* TODO mark the session as ready to start */
>> +}
>> +
>> +static void pxp_irq_work(struct work_struct *work)
>> +{
>> +    struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
>> +    struct xe_device *xe = pxp->xe;
>> +    u32 events = 0;
>> +
>> +    spin_lock_irq(&xe->irq.lock);
>> +    events = pxp->irq.events;
>> +    pxp->irq.events = 0;
>> +    spin_unlock_irq(&xe->irq.lock);
>> +
>> +    if (!events)
>> +        return;
>> +
>> +    /*
>> +     * If we're processing a termination irq while suspending then 
>> don't
>> +     * bother, we're going to re-init everything on resume anyway.
>> +     */
>> +    if ((events & PXP_TERMINATION_REQUEST) && 
>> !xe_pm_runtime_get_if_active(xe))
>> +        return;
> I assume it is not possible to have both REQUEST and COMPLETE set at 
> the same time? I.e. is it possible for this early exit to cause a lost 
> termination complete call?

A complete is only received in response to the submission of a 
termination request, so they should never be set at the same time. 
Doesn't really matter anyway since we submit a termination on resume anyway.

Daniele


>
> John.
>
>> +
>> +    if (events & PXP_TERMINATION_REQUEST) {
>> +        events &= ~PXP_TERMINATION_COMPLETE;
>> +        pxp_terminate(pxp);
>> +    }
>> +
>> +    if (events & PXP_TERMINATION_COMPLETE)
>> +        pxp_terminate_complete(pxp);
>> +
>> +    if (events & PXP_TERMINATION_REQUEST)
>> +        xe_pm_runtime_put(xe);
>> +}
>> +
>> +/**
>> + * xe_pxp_irq_handler - Handles PXP interrupts.
>> + * @pxp: pointer to pxp struct
>> + * @iir: interrupt vector
>> + */
>> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
>> +{
>> +    struct xe_pxp *pxp = xe->pxp;
>> +
>> +    if (!pxp_is_enabled(pxp)) {
>> +        drm_err(&xe->drm, "PXP irq 0x%x received with PXP 
>> disabled!\n", iir);
>> +        return;
>> +    }
>> +
>> +    lockdep_assert_held(&xe->irq.lock);
>> +
>> +    if (unlikely(!iir))
>> +        return;
>> +
>> +    if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
>> +           KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
>> +        pxp->irq.events |= PXP_TERMINATION_REQUEST;
>> +
>> +    if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
>> +        pxp->irq.events |= PXP_TERMINATION_COMPLETE;
>> +
>> +    if (pxp->irq.events)
>> +        queue_work(pxp->irq.wq, &pxp->irq.work);
>> +}
>> +
>>   static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
>>   {
>>       u32 val = enable ? 
>> _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
>> @@ -60,6 +184,7 @@ static void pxp_fini(void *arg)
>>   {
>>       struct xe_pxp *pxp = arg;
>>   +    destroy_workqueue(pxp->irq.wq);
>>       xe_pxp_destroy_execution_resources(pxp);
>>         /* no need to explicitly disable KCR since we're going to do 
>> an FLR */
>> @@ -83,7 +208,7 @@ int xe_pxp_init(struct xe_device *xe)
>>       struct xe_pxp *pxp;
>>       int err;
>>   -    if (!pxp_is_supported(xe))
>> +    if (!xe_pxp_is_supported(xe))
>>           return -EOPNOTSUPP;
>>         /* we only support PXP on single tile devices with a media GT */
>> @@ -105,12 +230,17 @@ int xe_pxp_init(struct xe_device *xe)
>>       if (!pxp)
>>           return -ENOMEM;
>>   +    INIT_WORK(&pxp->irq.work, pxp_irq_work);
>>       pxp->xe = xe;
>>       pxp->gt = gt;
>>   +    pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>> +    if (!pxp->irq.wq)
>> +        return -ENOMEM;
>> +
>>       err = kcr_pxp_enable(pxp);
>>       if (err)
>> -        return err;
>> +        goto out_wq;
>>         err = xe_pxp_allocate_execution_resources(pxp);
>>       if (err)
>> @@ -122,5 +252,7 @@ int xe_pxp_init(struct xe_device *xe)
>>     kcr_disable:
>>       kcr_pxp_disable(pxp);
>> +out_wq:
>> +    destroy_workqueue(pxp->irq.wq);
>>       return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>> index 79c951667f13..81bafe2714ff 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>> @@ -10,6 +10,9 @@
>>     struct xe_device;
>>   +bool xe_pxp_is_supported(const struct xe_device *xe);
>> +
>>   int xe_pxp_init(struct xe_device *xe);
>> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>     #endif /* __XE_PXP_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>> index 3463caaad101..d5cf8faed7be 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>> @@ -8,6 +8,7 @@
>>     #include <linux/iosys-map.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>     struct xe_bo;
>>   struct xe_exec_queue;
>> @@ -69,6 +70,18 @@ struct xe_pxp {
>>         /** @gsc_exec: kernel-owned objects for PXP submissions to 
>> the GSCCS */
>>       struct xe_pxp_gsc_client_resources gsc_res;
>> +
>> +    /** @irq: wrapper for the worker and queue used for PXP irq 
>> support */
>> +    struct {
>> +        /** @irq.work: worker that manages irq events. */
>> +        struct work_struct work;
>> +        /** @irq.wq: workqueue on which to queue the irq work. */
>> +        struct workqueue_struct *wq;
>> +        /** @irq.events: pending events, protected with 
>> xe->irq.lock. */
>> +        u32 events;
>> +#define PXP_TERMINATION_REQUEST  BIT(0)
>> +#define PXP_TERMINATION_COMPLETE BIT(1)
>> +    } irq;
>>   };
>>     #endif /* __XE_PXP_TYPES_H__ */
>
