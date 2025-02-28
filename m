Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0AFC282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BEC10ED42;
	Fri, 28 Feb 2025 20:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVRVMaXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0A10ED2E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740773613; x=1772309613;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ndXBV0Pau6sr6huTDpACQZEdxP+63mxDnrlVSOUP+3Q=;
 b=hVRVMaXUvRDQo6x8NrgJAs/NwqMnjHvWGau/yuok1nfrryaUpAusTwlT
 CNHi1by2kDmQNTwbae6WlWHmljIBYcw93rn3sBrV8PILbQnWupHX9FJA0
 9/iTtg3sOmiyewUGxbOM+ri2AQvn0W9q9zQvDCAMpZNnMOGzMXPXcR3M6
 3ill3jsXhBRFVPlm6xoxKyi7nqy36ssKnw6zCVD4/X3zc2GA7I4Yfho/8
 9UbRZuAEo0CNeGVrssq4ISnnTIm0r38jr4KLpg/jEkrmIvhCNE3usIlMl
 gITt2kPesGNujYNO9syRwc/fSx+xlMXo+stbxqu8KukfEJ026FMcfk/un Q==;
X-CSE-ConnectionGUID: FDDoa2VuRqKEszXCfAAozQ==
X-CSE-MsgGUID: N7V2rdh6Szupuk7Z9jU4VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40887829"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="40887829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:13:31 -0800
X-CSE-ConnectionGUID: 39ft6hkHRDKfe4v+PmoXeA==
X-CSE-MsgGUID: S+EN9a8aT8GP0AauHYbMOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="140657225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:13:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 12:13:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 12:13:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 12:13:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4LCNYiflo2MpDo46ULpEGEtHor7FDJQYG4u0Zc/1KEB71Iw0JbOBh/9cUg7DOc8kx+K+XWUqaTu4GUbJMjzgr18sjb1xs8GsPh2ueQCFoGZNifl90EZB7Knx6beIrTCh3/VHN3AY5hgiJJ5ZmkU50odHDLtkGSI5gpOwb0KaHBJAXOAK4PDr02iqybG54eIE9knS5vq4jbWInU9QkgSQoZLwhS/ROiQDuOpyio9Me49FQLPFOsp3WCQfc5XUJjMqRSB1NKSrqc3UXHZUlF+7juQbKfu7/PNPCgiRKOTMIiyAVLKUeFiMgJh4pyy9EVc0aSahogNJl7ID4q+O7/79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyNgScOuWm5gPbBhxfeD2IaORKDh7Tz+uVJ8+/whRmE=;
 b=CnkqrVbF6fiFFDjE5DyHH0PRljGZxltXMWgiSEOQMo2LNte9O+KREsLQX8UvB8dNDbNyvlngfSCejLCswMnlUg0kPFf/nHdQfbnE685SX8HFv61WrpppMWGLWszfYhiFDqDAjoYE5EX2nI3riO5O/D0uHEUsSSuCI3wYh5rgXEhwTirizXP0LH6+hhOBbO5C4DQxY0C9jM/+u/GjqtGuBzvrOkwQapZFyLWMff4bS7E39YUMPV/l+enz14iOqLIBVKHa8bAcauAOXaYFWgI3su0CDy0IF7tmGPdiGNlWDu1u+f8tJ63mzWLhWXv/ZLjLI3P0CXW59sFfAlTa8nDECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 20:13:27 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 20:13:27 +0000
Message-ID: <f9ffb2c6-00a3-43f7-b7c3-68f8de064254@intel.com>
Date: Fri, 28 Feb 2025 12:13:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
 <a11812cc-bf0e-488f-9701-317ee9807699@intel.com> <Z8ISULSSQYvaYIjl@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Z8ISULSSQYvaYIjl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b9c638-2ffc-4c79-9c12-08dd58345c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVljS0JkSjNSVm8vN1VrRVpZa21pUmZqYllGTWhYVTRyYlJJOWlweGt2eW5o?=
 =?utf-8?B?R3laNkpGWjNTTlN5T2lFN3gzS1Z6d3pZTlorSFNOVUpLS3AwK0xQTWJqSUhu?=
 =?utf-8?B?cG0vWWtXVnYwT2pWT3RmQTc4cjBvbWF1YUlpSHRzbUhPWmFFVHVwTkM4SElM?=
 =?utf-8?B?eWowVzI0Z2p0SmJEdHdFOWZhRWpia2hwY1hac1FPMjJmQU12ZXFGYnhhb21P?=
 =?utf-8?B?NFljcFJ4VXVlbi9WVHhjTjVpRFMzb0svTnRObHpwV1p5K2paRUFUbGZRTUZk?=
 =?utf-8?B?ZDBtUFhNUmtCeGtYYjV2aHFxTlQyWncyQm4ydVNmcXMyY09PWmxlNjZrWW9P?=
 =?utf-8?B?OWJ0QWczenlBZXFRZVhrdjBJRlJyN3JtYk1rTkxBUGZSdHVBYi84RkUvSmhj?=
 =?utf-8?B?L29NOXZIK2pBcHdIbzROeE40S2czT3FqWGI3b3M2akdYMEp4WTVXODNBWFlx?=
 =?utf-8?B?UC83bUpCRzEvVTYwaU1PUzF1SzQ1eVM4UDU3UWd4THBKTkRaaW95b0x4RDVl?=
 =?utf-8?B?Ny82TFIzczJ0UldJcVVHd2g3WG5pMXFCTW9yL0RKaTZNMlFNclFtaGtnQkNG?=
 =?utf-8?B?TlIxZkp2QTg4UFB5SkdINUlSUXFBMGlDZEpaYjJ4ek5DQzZYcTNJcWk3eVF2?=
 =?utf-8?B?V2hVTW5wZitOc3QxTnhVbFlPcmF0eHp1Q2ZQQ3FXS1pPTFZUOHVBVlltQ0Fx?=
 =?utf-8?B?dFlzT3hpb2VvaGQ2NUQvSksxY25jVFp5NW44WjR4WXBHVWthRHhCMXdYUHJ5?=
 =?utf-8?B?V1kwVHJDakpibC9RWUtoZTY1K0h1d256dzJlbTVCZ1pFMzR0SjNjL3BHVFlu?=
 =?utf-8?B?Z1ArRjc2SitYd0JuMzdJQjBIMFNmZzBzYzFoN2xjYmNNZGpQUjE2cGs1Vm1w?=
 =?utf-8?B?VUdsM3FuUDNPWnlEN2JxYzVibUhKK1FiTWRoTHFwTmdyaTN6QnJMaTIvdnRS?=
 =?utf-8?B?NnRNY09ZdmJSOU54eHFmKzFxR1VlOE9ZVkJOSFJjaVhZRWFadkxnd2NvS05P?=
 =?utf-8?B?V21TaEFsWUp1TEhSWnFnR2NubWZ1M3hEbnZwVkN0ZG1SL3JubnZSTkVKelFT?=
 =?utf-8?B?a1BIUWlocStOcFpzRjZLUlZOMnVxcnFPd05FZ2FzY1BUaW9pd2UrSldvRVBK?=
 =?utf-8?B?U2FmSG84aXI5UTVyZ283ZnJSd1MwbWxmbDRFTURyRit6TnRTN0hXeEhoTll3?=
 =?utf-8?B?ekhhNmJrRGNUWDMvQmM0V3krQnkxOWhvRGhGSk9LeTR2em9XSFl4Vk5jL1Ry?=
 =?utf-8?B?bWg5VlBmRmRkeXZ2T1FuZmhLUWQvRU1oV2M4RlRWczUvR2xHVjRTLzRFZ1kv?=
 =?utf-8?B?L3JXaVBWWlhCcmRsejZIa0RjdTd5UDdWSUFYYmpoYnh2cngwQnJUdFpiTXJR?=
 =?utf-8?B?cjRkSm43VmVQMlpHcDJrTFBtU1JvbGJGUm1Rb1FuNmlrOXBpajAzb0xzWTlF?=
 =?utf-8?B?Y25MajJHaVFzSXVLdjlWSTNBNFdTMEF6L0xRU2dscXV4YzAzc1Zwc1Arc0F0?=
 =?utf-8?B?R1V3bzh5T29CQ1FpWUhGR3JUaUE0ZFUxVkFCLzVQRjAyVnlKZXdhejdsZm9B?=
 =?utf-8?B?UVZHOFUxTEJHbnF3RjNOeWNLbW1MM3J3MXBVZ0hicWhudGltQmkyTFl2THF2?=
 =?utf-8?B?OWtvdE9qRWZNSjVyYk9Ka1JYb20wbVFZcGNLeEVaeER0YmR2eTR3SEYyeFJp?=
 =?utf-8?B?QTBYcGxLVXhoZzRFNUs1bGhzMDVPcVVSeW16bE90WUdlUXpYZ1ZISHFncTBx?=
 =?utf-8?B?am9raGRJRGlvbkhrUlJ2K0VqUW51Rzcva2NpcjFGcTZiS0FNWlJ6RkZ5Y0Fu?=
 =?utf-8?B?YmhkMENJeittbThuNEFXNXNNci9pL1R1c0lPTlpDeUhCVEtOUStJOXE3ZG5z?=
 =?utf-8?Q?bddyr7p9fy6UC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xzTVV3Y2dhRjdqZDYyMitiSThkcjY5R0hCeUxubGxxc3VZTGZVc2ozc0RJ?=
 =?utf-8?B?YmVUM0tUMzhFWnBpOUtZOWR1QWdlTXFUandyZzVzOThJQjAwZE95YWN4bDh1?=
 =?utf-8?B?aDA2RDBub2hPVy9lM2c4YlVoVktwcGo2NUFuUXE0eTFwSTZJa0FsS1d6VTBx?=
 =?utf-8?B?ZHo2dU5SVzFnbWFkcGF3TWIxa2xEbmV2Tlh3MUxGWTNGZHRmcWtuOUhGa0JX?=
 =?utf-8?B?TWZRU0N3cC90MWpWVDdKb2VLaTcwbXdtRXRIK2xpL0ZEVE02clV6cmhVRXoy?=
 =?utf-8?B?SzVBa3NwZUJ3bm1sWVk5YTI5YVhnbTVZUWZDRjNSZEFhVWpHZTl4N0JJVVNP?=
 =?utf-8?B?MFFBaHUrQmdnN3ptTjlhWDgrN2VwMDJIVyt3bC9FQmhGYnBJbTIyY1dDcC8r?=
 =?utf-8?B?STZnUi80dW1jc1lwN21vZjZ1Q2M5bERVWTdBdTBnRGJXT2E3aGs5NVViZkpW?=
 =?utf-8?B?cEVQS1JkVFpqZXVvZzlqUzlmQmV2REdmTUFmVFA0OEJYc0djMXdnalpQd2c5?=
 =?utf-8?B?OHFySTJmODhRQXF5YlpnTkNYRGJmVno1MG5oYlRKVWRRam41L2NmNzllYnJX?=
 =?utf-8?B?Zk96WmF6R1VHdkpjY0tBZ2tkQ2EvSGJMdkovTkx3UUdmWEEzNURmSHVGTjRs?=
 =?utf-8?B?SmR4dmhnMStibTZkd0dHcWlFSDMvZmVjd3h4cDJNaFpWTDFweVp6WW5KQUJN?=
 =?utf-8?B?TG9mQ0VHNk1vWmRyQ3pKU2FKeXREUnBiQzFaMW9xZDZTSTQ2Zm12enBzTE9Z?=
 =?utf-8?B?R2JUOEVHTUJhTk4rNHlNLzM3MmZRVFpzUC9pRy96SU1QWXBicll3VFF0alcw?=
 =?utf-8?B?eno4S2sxemg4VWZURStSR1VSOUNuc3JiNnBlbHhGeWVCWXhBOTF2eUJmRGlL?=
 =?utf-8?B?eVRZYmI5VzJMdXJKSENDcENkVVl4NTRTOE1EcEV3dUpubStBb2V4dGVhdG0v?=
 =?utf-8?B?OTZubDF3OVkyZm1FMUJNb1NPMm9rYnpva0J6T3B0VGZ2VXZuNnFUUEM0RStu?=
 =?utf-8?B?WWx5d0w2cU4rTFVqM3pTUGFPVVRjUmxuQ2VQVGVveUhpQTJIWUdZYTcyOW1w?=
 =?utf-8?B?YXVNd2g0MEEzSkNYMGJzWVdNR2huZk5IUzRVdnBRNitpdHVzTjR3SkhCbUxR?=
 =?utf-8?B?SGQ2VHlzSjkvQzZWdUZQMlZsVHNQQ0FNNWxVdisxTzlnL1FQTjJrYlhBNnlI?=
 =?utf-8?B?REhrMU03YlFGcW85VzBHeG4wMXZ0ak8rWDI2MFA2NkhYYTlERFgwM2hzbENQ?=
 =?utf-8?B?VDN0blJoOFpQRGZJd1ViQi9EMmlxOXlmTjg5MUlyMzFIMUxLT1FmSUk0MFRB?=
 =?utf-8?B?ZVRyZXBTeW5HVmpJUE12UHJ2d0JyQktsdzJTa3NKd1o5UWNUTjc2SE1MMjlu?=
 =?utf-8?B?RE05UXNRbkNlSVpxU0dTMUFCcXN5bDZ4UWF6cEVKYXA1SFcva1FBR2xvNmY1?=
 =?utf-8?B?OGhXYUczTUtrQy96VlFPL2MrL0RCb2s4eVJmL3MvWHErRUYzM0o0N083Njgz?=
 =?utf-8?B?b3AzbElVSlZuMjVURDQzYzJkWFRkUndVTzh6ZFVjeDdJN3N0TVFuVlpKQnIz?=
 =?utf-8?B?U3BnejlwSG9PaGJlVFF2STY0cUhZMndWZ3EyUDdVTmxHbTEzUEljZmlnQyt3?=
 =?utf-8?B?NlBlaWRyMGpGMkJES3dXRjg2ZjJPUEttUERqTXp2aFNXK2YweVNqcU1OSzNj?=
 =?utf-8?B?LytPNzhwdUZqQ2UrVmg3OHdvb3EwQTFuS3RuUGVxRk9xUlE3NUhORC9JbDVR?=
 =?utf-8?B?NlZsVWc2bEowTWFYOUNYRkZEWjgrWU0rQlJxRW9qakxVU1ZZK0hMQTRtUTJm?=
 =?utf-8?B?SnBuQ25JWE5ESXgzSGZxYnFCMGUweHJEeUNoc3FBZWFtSmVwL2J3cWx5THRB?=
 =?utf-8?B?YXAwbGtMUzNzUjVrMEkxa1JJNUR6MER1ZFRGUktwR3IyaHFoN3hqd3RueEIz?=
 =?utf-8?B?bnljREMvT1E2OTE3cmx6UVpRaHp6NW1wMUtla09oN3lGdWhJczRTVXdaNTVX?=
 =?utf-8?B?enk4T1g1dHFiMFFSR2tVeEcwSFZGNU5mU3cxeDFlcHJnNndOcENGQ3lzaVI0?=
 =?utf-8?B?bjRMWjN3M0FUT0NpUGk4TWpIQUVQZWRrMGNuRU1tU3VYOXlhU0pCMm5Td0hB?=
 =?utf-8?B?NzNTSVhNUFRmWm9PL0NLVjdocGRoZTZEZU5WQ0tlY0ZIbExiSk9LaGx1bXlD?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b9c638-2ffc-4c79-9c12-08dd58345c83
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 20:13:27.2076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PvOUg4mW4ZaGJsHQHSrAzIzSXjn8rwx6Tw7sYtHCZhLRtxBSnazB/SuxmI/weVVC4v2EstAI6bE1LcNGexnh7xqXwHvVY1cOZtH3CbvJ60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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

On 2/28/2025 11:45, Rodrigo Vivi wrote:
> On Fri, Feb 28, 2025 at 11:22:02AM -0800, John Harrison wrote:
>> On 2/14/2025 09:25, Rodrigo Vivi wrote:
>>> In a rare situation of thermal limit during resume, GuC can
>>> be slow and run into delays like this:
>>>
>>> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>>>      		 [status = 0x8002F034, timeouts = 0]
>>> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>>>      		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>>>      		 perf_limit_reasons = 0x1C001000]
>>> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
>>> ------------[ cut here ]------------
>>> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>>>
>>> If this happens, this can block entirely the GPU to be used.
>>> However, GPU can still be used, although the GT frequencies might be
>>> messed up.
>>>
>>> Let's report the error, but not block the flow.
>>> But, instead of just giving up and moving on, let's re-attempt a wait
>>> with a very long second timeout.
>>>
>>> v2: Keep the precision comment (Jonathan)
>>>       Use a define for the regular SLPC reset timeout.
>>> v3: Improve messages (Vinay)
>>>       Only skip initialization if the second full-second wait failed.
>>>
>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
>>>    1 file changed, 33 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 02409eedb914..74cc13012532 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -20,6 +20,7 @@
>>>    #include "xe_gt.h"
>>>    #include "xe_gt_idle.h"
>>>    #include "xe_gt_printk.h"
>>> +#include "xe_gt_throttle.h"
>>>    #include "xe_gt_types.h"
>>>    #include "xe_guc.h"
>>>    #include "xe_guc_ct.h"
>>> @@ -50,6 +51,8 @@
>>>    #define LNL_MERT_FREQ_CAP	800
>>>    #define BMG_MERT_FREQ_CAP	2133
>>> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
>>> +
>>>    /**
>>>     * DOC: GuC Power Conservation (PC)
>>>     *
>>> @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>>>    	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>>>    static int wait_for_pc_state(struct xe_guc_pc *pc,
>>> -			     enum slpc_global_state state)
>>> +			     enum slpc_global_state state,
>>> +			     int timeout_ms)
>>>    {
>>> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
>>> +	int timeout_us = 1000 * timeout_ms;
>>>    	int slept, wait = 10;
>>>    	xe_device_assert_mem_access(pc_to_xe(pc));
>>> @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>>>    	};
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	/* Blocking here to ensure the results are ready before reading them */
>>> @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>>>    	};
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>> @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>>    	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>>>    	int ret;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>    		return -EAGAIN;
>>>    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>> @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>>>    	return freq;
>>>    }
>>> +static u32 get_cur_freq(struct xe_gt *gt)
>>> +{
>>> +	u32 freq;
>>> +
>>> +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
>>> +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
>>> +	return decode_freq(freq);
>>> +}
>>> +
>>>    /**
>>>     * xe_guc_pc_get_cur_freq - Get Current requested frequency
>>>     * @pc: The GuC PC
>>> @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>>>    		return -ETIMEDOUT;
>>>    	}
>>> -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
>>> -
>>> -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>> -	*freq = decode_freq(*freq);
>>> +	*freq = get_cur_freq(gt);
>>>    	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>    	return 0;
>>> @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>    	if (ret)
>>>    		goto out;
>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
>>> -		xe_gt_err(gt, "GuC PC Start failed\n");
>>> -		ret = -EIO;
>>> -		goto out;
>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>> +			      SLPC_RESET_TIMEOUT_MS)) {
>>> +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
>>> +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
>>> +			   xe_gt_throttle_get_limit_reasons(gt));
>>> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
>> Shouldn't this be a define as well - SLPC_RESET_EXTENDED_TIMEOUT_MS or
>> something?
> good idea! will do.
>
>> More importantly, Is 1ms enough of an extra wait?
> The new timeout argument is in ms, so it is 1 second.
Doh! Yes, I saw that but then completely spaced it out again!

>
>> If the GT freq is 100MHz
>> instead of 2GHz or some such then the expected max of 5ms could now be more
>> like 100ms if not even longer (the slow down does not seem linear). As an
>> example, the GuC load itself should be <10ms but with clamped frequencies we
>> generally see over 500ms, sometimes over 1s.
> hmm... over 1s possible? so, perhaps 1250 to be on the safe side?
> other suggestions?
I think a second should be good but I don't what is involved in the SLPC 
start up? The long delay loading the GuC is due to doing decryption 
which is a hugely CPU intensive task and the GuC is not a huge CPU! If 
SLPC is more about waiting for hardware to respond then maybe the slow 
down won't be as severe? Plus the GuC load is inherently slower in the 
first place - our original timeout was 200ms with expected values in the 
5-15ms range. If SLPC is starting from a 5ms timeout then presumably the 
expected time is actually more like 1ms or less?

You could try running with the frequency manually set to 300MHz and see 
how long it takes. I think that is the lowest we can explicitly request 
from the KMD?

>
>>> +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
>>> +			/* Although GuC PC failed, do not block the usage of GPU */
>>> +			ret = 0;
>> I thought the new policy was that any subsystem failure should now be
>> considered fatal and abort driver load? I recall a PXP start failure was
>> recently upgrading to being fatal even though PXP is almost never used by
>> any actual users. SLPC seems much more vital to the system than PXP!
> Hmm... good point! I have to get back to the board then and have
> this logic only for the resume?!
>
> If this happens during the probe yeap, let's block because subsystems
> are buggy. But the case I'm hunting here is a resume from S2idle that
> is entirely hanging the platform when this happens under thermal constrains.
Hmm. What platform is the problem showing up on? There are a couple of 
other bug reports about systems coming up in an odd state after suspend 
- e.g. GuC image not loading due to memory corruption. I wonder if it is 
not actually a thermal problem but just something confused due to 
uninitialised state somewhere? Plus, how can you be in thermal meltdown 
on a resume? If the power was lost then the device should be cold!

>
> Thoughts? I'm open to suggestions here.
My main thought is that if the frequency is clamped (by the hardware 
itself) at absolute minimum then the system is not going to be very 
usable anyway. So is continuing to run by using huge timeouts actually 
beneficial? But not sure what else we can do at this point? Maybe try an 
FLR? But yeah, it is probably good to try harder to keep going on a 
resume than on first driver load.

John.

>
> Thanks a lot for raising these so far,
> Rodrigo.
>
>> John.
>>
>>> +			goto out;
>>> +		}
>>>    	}
>>>    	ret = pc_init_freqs(pc);

