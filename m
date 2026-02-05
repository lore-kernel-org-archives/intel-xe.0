Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214AECD9A6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 21:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11410E0B7;
	Thu,  5 Feb 2026 21:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNpzLPH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BB810E0B7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770325819; x=1801861819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1yiK5xtImrTRxae/guP5Wsye32FqLnFCorPQBhQe/RM=;
 b=XNpzLPH3c+Itdlgwdy0dhkETPUltLMqVZ8CLS3ir4qT1eDRJLwnRl5VT
 RGmm290wSwdkXRS2cHyXleYJ3daBTNARqclaQW1Zb3yVHz7y2AO3UFxaI
 LfsNblIsfwh4XcDcswchWhnkct6Fz24GIDqlq3eKZlIqXmn2GVmAWXPl8
 75WCvtosmRODilWXE8hFYv3y9XsRyLEcPbwvJ6LP/+rDWq29xjaWOVcD2
 Dlw0bLZEJ+s7vT+albOxKFk50F3dOcHdsj9rSIapdxBsCJFbs+FebjvLW
 kzlfjwcfdf/hjeNaKViWZIT7bLswAq3/JMDWy8O1GNmbQker+0lkQ+Ckq g==;
X-CSE-ConnectionGUID: PIcByCAsRBauttolITJQSQ==
X-CSE-MsgGUID: 2npNx/IXR5W8zZskF1cnbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="81849319"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="81849319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 13:10:18 -0800
X-CSE-ConnectionGUID: gKcrnpvUTYarUrsIfyqETA==
X-CSE-MsgGUID: 4oSyFTpfTp+8JbBInPPDKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210619791"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 13:10:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 13:10:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 13:10:17 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 13:10:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjG5klhvI3Fd6rnzAJhtwVDimx9ogFuuJBQ7SLozguesLDESbby9+JWmPH+XGbTpgXN4TOJFJ5r1sJIzhgkh2zNi9uFBahFh96OiU6HMGr/rHQGkGUbx+yaOO4u4XyE7L8I8Pm+GV0cw++U24dAuPUA9VHngbJ7z3xCWDBfv7Jy5U17MNBwVoEutySPvZXh95nYNXBwMI+qT6oSBSHxNJ5ei9HexeMXKK1z8Vc5x8rfVMtULvqGZuE4dAnIipghwDWTIHczrd/i4uS8IRLbPnud7tjPRF09Y2VjTi/0HmWoVIp7sNs/ef/S/4Rkcvwnmbe5yWyy8OZhYH2jpIqqcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szn1ubM8xrkO6HAYGPAMT9wGffLCggLgMFd/7AtYWPI=;
 b=Rua3bANhY60G8GT/VRl9Eg+l8fpuGJb7Xu2DfdvccW6TAunxZDW31VlQaoMzVTrrB5cSn1NVoLj55gITfT64ESLPX2dYaXElFFZEgkrlQWzjOBtJsbluYfPLP4/wQIBx0F2/w0z8qZghb4d2J8uk4VHzVG7whZXYwZYMTK2cijN+2SXLynnGF00x/9KqegfvRMA/KGXWgsyttAG2WYX7NrZ5mOtUDt6ZgcqMbMO5OBjL+zABkmb/LqjsRHYG8txI6DG0DiZiRcwDrKzYG6zu6ss27bbRNymemlj3aOB6yLF+MhwRGRTN5ReFZTtls0gQ+EzY0N20oPrUNcYX+Ms8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 21:10:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 21:10:14 +0000
Message-ID: <dfcc7748-28db-4aec-9c95-23bcf0b88894@intel.com>
Date: Thu, 5 Feb 2026 22:10:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/xe:Mutual exclusivity between CCS-mode and PF
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0036.eurprd03.prod.outlook.com
 (2603:10a6:803:118::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee2cae4-64d1-4967-08f1-08de64faf48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REZMZVI3cmo1T2VWdityVmxkWDdzaTFBbFBWdVlJenVkRGpmWU0wNkNqUEwz?=
 =?utf-8?B?V1Nza2x6YXZDODBKWHozellmbHdDa2ZEd1FXSjIzUmJnNis5WTlTRDg4L1Z2?=
 =?utf-8?B?MzZtM1dERkRIKzQ2L3Q5TGE3a3lBR2gvVlp6ZkdzNE42b3ZKeG9qU0N6K0RL?=
 =?utf-8?B?MWZmcG1XV2gzTFVWSVpEQ3B2WkV3U2xmZHNSOHVCNy9BcTFRN3NodFR1NjNF?=
 =?utf-8?B?TnZhTE5uOUx0L1ZRMTNXYWVjUENyazhqTUhxT2tHVWkzYzVRT01DZEhaZW96?=
 =?utf-8?B?bEMzakRaZnlUajlNRExya0pPUUJCL2xwV1dvSWJuK2YxWFhrQTFndUhmZlJZ?=
 =?utf-8?B?TkZ0dlcySW45OWJSLzUyckxUeHZTS1pWSGo4dmVDWVVHOUQ5WEdKVnNqb3dP?=
 =?utf-8?B?ZFNBUlJ3dzJLZDNXaEU0NnNYTktPdUdNM1dNYWEvQWNSY3ZGMDFzY2NMU0wz?=
 =?utf-8?B?ZmdXOVRwTVIzK0ZQRjdjNmJqWkhWQ1RFY2ZtY2h2WjlHdjU3UDgyb1dMTXAy?=
 =?utf-8?B?dXArVlQ4d3JPN1FFdTB0R245OG1TUWpCV1Q0V2FFU2FBYU9ob2hQRnN1WjFn?=
 =?utf-8?B?V3ZvSDJxOGZWODE0UFVOVVBWYzFmeEUwa1BCVmMyN2F5R3BJazVackFKRXRG?=
 =?utf-8?B?TUhKejNGUUNxOTJFdlpRaEVaYnVnM0Fhd0pEd3BJSklmUWJEcVFNTkREN0NG?=
 =?utf-8?B?cnZGb01xOFZzcFR3dG9xcTJFY1hEejByMXMxQ0tCdUE4anRRbzBLOVRlcnh3?=
 =?utf-8?B?UEZFZWNBOVlkL1gvbFA5VHJ1dUs1ZkZJR0kvelVMVlJxYWluNmM3MlhLZGQ1?=
 =?utf-8?B?cG5qTVZFdlh5M2daYzJibTJHWit4SVNpaHRJNk9KVk5TYmtoSVQva2Y0Wmc4?=
 =?utf-8?B?SHJXRlVqV0ljb2s5MDZMcXVOUUluMlUxZ0IzMUNYSkdKS29tMElrRU1NdGJO?=
 =?utf-8?B?TVZ2MU5yM2RueVdHZXRlN1lZRzFIQkJVK25iZVVwQkNEcG5PcmFqQkRWMTFw?=
 =?utf-8?B?dUE4SlVVaHBnWitQalh4ZnV6ck82cDJaQWt3c0RIUnJBVC81dFBwZklQNzFN?=
 =?utf-8?B?TjlOdmhmQVdDd1Rvamt6bnFlZ1RVNWJnRm10K09pd3FnVFNMMG5Zd2p1azVV?=
 =?utf-8?B?M1BMaXVvYmhSRS9DNDNVYnluM0VXeDR3ei9XdE1WTE1OSDhndkNIU2J1Nms1?=
 =?utf-8?B?aExpeTRQOWxXMzdlYzJNTmpXUCtVd2pNSy92VnBOMWdETXRSQkpqY2FYT094?=
 =?utf-8?B?UlNJNjQxTUN6V25WaE5JOVA5VGZqZ2xVd3YrNlRBZUEwVUgxWEVZZktMV2xN?=
 =?utf-8?B?eFdqMXV2cG9KRjUrNW13YXZwcm9sWGNhRjdXQm9KZ2RyZzdkblVGZUk3Umha?=
 =?utf-8?B?QzcvVUhaWndjSmdqZDRZalZWb1JxcXBrVWY3Z1pMdWdjQzAya0lBWjZmNjdq?=
 =?utf-8?B?TDVLTFZ4T2V1YWF0MEJGSnVGUXFWUURrQkFnQ2JMVGdnUUF6QXFqV20zeWZu?=
 =?utf-8?B?N1Z5WjlwQUxFSllhV1dxWERpTFdkdm5KMXZWNXdXeitJTzc2T3lPMTl1d0h0?=
 =?utf-8?B?Y1ZSNUkvbzAxbXpOaXpna202UjZpTVF1STFyd1Q4RVVLczhoNC9OM1V0dk5U?=
 =?utf-8?B?NXZvZ0QyZ0Z2NlpFVURURmpNTW9mRmJPaWF5N0ROc2FhVzVZN2tEWGZsbjFn?=
 =?utf-8?B?QWl5RDRMMkhJYkp5Tk1vaG5pRHo3KzdYdzRHT0k2ajcyTGxheit1blJHV2t6?=
 =?utf-8?B?LzhnREExeW9VOTFEdnhhUXFwNUtpU2pEM1pReVNzWFdtNEgvWVFoMzZuMXZ5?=
 =?utf-8?B?eCtnUGEzOGxkdlkrR1NSTmNxVXl4MHhzRy9UMHJaY1lKQldZKytGRkZDR3VJ?=
 =?utf-8?B?RHlkMUd1LzRURE9SUjZ5ZXNKcHhLbm9rY3BqNG5zYnFHamoyQ29BRE9YNUFi?=
 =?utf-8?B?bWRacmRtUXFlVzE5UWl4WUY5U09rYlFIYzd5OEpSMVoyak9vS0JodmFadWhT?=
 =?utf-8?B?c2haZHVuRm1mNGl1OWpPb3FiTVZzQ1ZRcmExQld1SkY4Vk1BYWx4QS9jclFv?=
 =?utf-8?Q?a0Qsq8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDRTR2cvWlREMHlZeC9PMU9KYXRsdUwrdTJJTzRqbncrdDN1ZkpOWDZYRXEx?=
 =?utf-8?B?N21FejdpN3ZYOWFid2EvL1U5QjBqLzU2SW1pYkJ6OHh5azVua0RGVXZNL0Zn?=
 =?utf-8?B?bENvNjJNekRjVXExT1BFb0hxYmlSaUpzMnp2ejEyQTYzd1pOR3FVSWlqU0dD?=
 =?utf-8?B?S2VjM2FOK0NadW9Uc0NLRHJJNWNwamd6akIvVGxzdkZDU2YzQk9zc2RUV2hp?=
 =?utf-8?B?NnErRldBTzAySHBDVUU5cGJQS1gveVA0b3IrUXdVYUM1Y3RNdG5GS3YyV0w4?=
 =?utf-8?B?ZGcwSlhRNk15UERHWXRpQVRZY0twdkdDRTM3dGVaRmMyRlVyb2pnRm1QUUF5?=
 =?utf-8?B?bWlIZW9HVUlZRmNGUXJmY2lBK3RSbmpRU0hqT1cxeWpiSWZBbE1adkVkUm9K?=
 =?utf-8?B?OUhJRkNDejlaY1NDMkZ5UVF1VUNPTExGNjM3MWxKbkFuTXc2aGFNVFNhR2w4?=
 =?utf-8?B?OGRJWVFyR3BneEJad3ZjS25RNUQ2cW9aSVlaQ2IyZTNLSnhVTDZZbWRBMHNF?=
 =?utf-8?B?RkVmaE9saTVLb3FSUEVnQmhOaUtlSVlxTzVGUERKRkdqMU41cnV3d2R4UUtx?=
 =?utf-8?B?MmthcHpuSktVNHJvcTltREpEd1JtMkJaRXhrQ2g3OE9DYnlTcmYrYnA1cHJs?=
 =?utf-8?B?cWtOcXA3c25xQVBVVFR1UUN5bHdoaXJpTWVWL0ZGVmh3dVhpWENWUE9hN2Iz?=
 =?utf-8?B?N0lSTTFvdyszcEs5VStSdGEybUgxcVUyeWg0V1BqUUovWXZVbTBobmNWaWJs?=
 =?utf-8?B?b2JNY0FPdG90WEYxQ2FQZjVIY1cxNkFyMUx1SEYzeGxKOGlSb1pTZGQ2b211?=
 =?utf-8?B?djZZVU04V3RjVWduSnE3cXJ0RWs2aXRVUlVES05DYjRzdVJuOEJXN3lqa2RG?=
 =?utf-8?B?VDJuU3hJenpzclI4T0ozY2J1Szhwb1dveVAzQjNUUk45SlJhQ2dvdndhSkJ3?=
 =?utf-8?B?NWFPSFZXRnRpY1RlbFV2Tkc3Y3Q1WDhCa3R6dFUvYUIvejhNT3pLcDBYVWlp?=
 =?utf-8?B?WHowNCtCdzlwSklqWjU2eDVLOUZpc2Q5VE93alB6Y0pob2pqVVdPTzQ0OUtP?=
 =?utf-8?B?ck1LdlVKcFJ4eW40M1A4Y3BkMEpQS3Iwa0ZNUjRFU2g0OGx0RW1UTEJNVVJt?=
 =?utf-8?B?VnVOcDB1cFE2VW1tc2xxVkExRFMrOXdxLzJEOVNEYjBNM1M4cDFpblhGcTBV?=
 =?utf-8?B?QndkbU1mRXBSb1BUKzM1K01sSi8rZS96Z2o0R0p5SmJMc0tjMDduSXB0TEtz?=
 =?utf-8?B?TXk1UEM1TFpGRGFDc1drWlhxNHJyK2l6S2t4c3I3cno1cUhwTERnbm5lcHk1?=
 =?utf-8?B?d2Z5L1JLNGZMRjJVcmY2dU9uTmhQSms5TEVhUFJVY0lqeEFRWVZ2UFdEVUNV?=
 =?utf-8?B?d3FoMHozZThUYWVsR0N6YzVjS3Qwd2hhTHFQVnlJMjBaUXBuNHIyTFJCUGcz?=
 =?utf-8?B?S2pqYUVGRW9ZL2IySysrUlI1aFJxa2pLRTZtL0tzVGNoMW4va0hhQnhTK1ZD?=
 =?utf-8?B?K3FXdEJyaUx1SXJsOVY0TnRSMnUxcFh3bkYrSmVOTld0clZxZ24yOHZzN1Nq?=
 =?utf-8?B?STRKNEhNVzhvakl4V1JyckJSdnhoSU9Ic0NLa3ZTZ0JDTmNEWkdyMlBORXgr?=
 =?utf-8?B?K0FZVThOVnc0VitLZitEcVVzMTNndVpianFNOXMyN1VwUHlXRytXeXRINnUv?=
 =?utf-8?B?VEtVOE9rT0o1czJodDVxbzh1c1pDNEVvbzF6QjVJSkg3M1NTZDdXT1YyMHpP?=
 =?utf-8?B?a2dBTGNCYTdwL0R2MGFoR1NzcnJiY0dMd2ZDWk5TMGIzZzZWRkpsSjc2WkpO?=
 =?utf-8?B?ZHVJbkkyV2pzZlZTSHJ0cmVTS25DVGlHcFBOV1R0bUhCWTc2SzVVcHljUHNG?=
 =?utf-8?B?QVhPbmhEUUxKV2lOa0E1WU1US1JQVTFkYXlJcmRtNVJ4SXEwOG1kazFBcDg2?=
 =?utf-8?B?WGlrQUxXWmNLNkpSZXF2cHNCUFludkFFRjMzRUhoMWpKdDdyaHQvWDcwSm1l?=
 =?utf-8?B?K005VUorRno5TnRwd21zNWVtcklQZFFVYnF3YnorckVwRVBsMjV0U3JtMklT?=
 =?utf-8?B?NWVJY1VVaWpSM0gyTytjK3FuK3llWjVmVTRSWkVPY1NpYnN5QzVRMXRCVWJN?=
 =?utf-8?B?cUNON1pLS1Viajd0QkxXZ3crUFZPWWJlSGdaRzFlNzM5cjJ4NGpJSjU0VGV3?=
 =?utf-8?B?aUk5QVdSVjU4MHNRN3JuVlpDNk41M1UxUDUrYTI4VmlzMVNBTUpaZjVjSUhk?=
 =?utf-8?B?WWFkRXplUkZqaGlKSTNqZnhDa2wwa05sWlBxL29sc0MxS3AreSs4SXk0cG5E?=
 =?utf-8?B?dVdQWFBOZ0hZdnhtdWhGbGRWUkh4MUpKTjlMUnk5RCtHK3RKTnAvbUZFcUoy?=
 =?utf-8?Q?q2lQh8gyZtZX5PXM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee2cae4-64d1-4967-08f1-08de64faf48f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 21:10:14.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fmwy+CwBghdXytO//Q9Z4p+qJMrMzF9j1f4eQmch8TRDK25+xS6WpYfc4hEP23pe8xFRqKRbCUSwRHO6u1rfBab6HnltsXODh32MZgcQ1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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



On 2/2/2026 6:08 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs, Currently we block CCS mode
> changes if driver is running as PF, even if there are no VFs enabled yet.
> Use lockdown mechanism provided by the PF to relax that limitation
> and still enforce above VFs related requirements.Also skipping CCS-mode
> sysfs entry in VF Mode.
> 
> ---
> The previous change log can be referenced at the following link,
> https://patchwork.freedesktop.org/series/154538/#rev9
> 
> v1:(Michal)
> - Split into two patches with cover letter and subject of cover letter
>   refactored
> 
> v2:(Michal)
> - Add direct code instead of gt_prepare_ccs_mode_enabling and
>   gt_finish_ccs_mode_enabling function's for readability
> 
> v3: (Michal)
> - Remove Fix up tag in commit message
> - Refactored Commit Message
> 
> Nareshkumar Gollakoti (2):
>   drm/xe: Fix Prevent VFs from exposing the CCS mode sysfs file
>   drm/xe: Mutual exclusivity between CCS-mode and PF
> 
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 44 +++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 

Corrected commit messages and pushed to drm-xe-next.
Thanks for the patches.

