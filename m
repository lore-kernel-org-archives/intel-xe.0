Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748CAC61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 21:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2347C10F1DA;
	Thu, 27 Aug 2026 21:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcK7PaPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20210F1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787866408; x=1819402408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTo2aWZha2SgK8q649dvE8nKBtEMNkPIoGcc+AqGiTg=;
 b=PcK7PaPJBVF2DJ7aVpxATdgjRkly7wO8vLvr5AQULTUcPK5WoT5OnDz1
 PQgfuhGW0YT+OjeIuK6fAAAa1PybohwpJXAHSv9Y6aX5fWQd8EHIfRTVv
 zL+Qx5exKcJEbymmFCTFxZMweI0yThz6CwykeI4Rv18WEDXbDc8LWAP9E
 lmSlekkScEHZ59SrndplpG76QQmzGmXlq9//Nqn7G6SPP1YKM9Z4u76ER
 M3/3A4Ixwme6nEtNtTPvIKlDUhYPvF2YYMAWVREyYAKjczdIpsH7N2IWq
 OiVnZXvc0dlId6PZ4FdQCj1h55QxrRInFwVMCOrlpGMzjKLDtvRGUa/Lk A==;
X-CSE-ConnectionGUID: /+fec2oSQMS3K02ddx3jUA==
X-CSE-MsgGUID: 48KBB1uZRG2J3qsCPoAmBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99537549"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="99537549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:33:27 -0700
X-CSE-ConnectionGUID: FPG/4xCRSt+z0Mfi3GA6Rg==
X-CSE-MsgGUID: XxFHcDQLRg2DRxKlpbrwjA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:33:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:33:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 14:33:26 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8dvtVXrkfhddejIuurSdhGLvG99w0/gGW/5aVHX+s9mqcXLnUauaS7Ily/YR7pGyH5tptXwEjuMTPu4/S5uFMRRAYprTctCwC/P3PMvED4vOHhFexj8hxW99NSuHV0iXbmPPqNnDtdSr14UtG/2lUqhPfLkP9mk+YFtpLeoF3DKI42X4+ovOM/ToGpuWCth5fAg/fNSO3RsY3BFCy+Yy+SPJiDzvG31wfhczFhbTDHx3Psd261mXxdZAUXTX9HCYVNKLejHcQrjpMhxQf/V8t5Zlb3e56IZfN7etUl1OHDlMyrj2H7XVhWPofblqQRmNXbhilEqfIVI6HrWCy8sow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJSQZYCBhZ/MjPygUm86g6HvDb+gX+76CeznmIDBxjs=;
 b=nbVAdQXbvHeg9To1zkLgd1PONm6O7SUdAmbCLEboDEdKniDpdPbyOFci36EgViUduBKhKguNz5Mf6oR3vFZFgqgHlBPinkO0V0x+ErFaxQ4T5PJfAHpn7wqdYcrG9OqPYy6KsjsK1sF4SyVl1u3JEW/84w+64gZCLqurPshDUErTUsAP7Arc/TFYl3lQfRUUejRz9m82JMK2ttgORW4COcYnJRP+4/DWEPC2yyZjh7u8ebsCq5n8sZhIyhg8tXUAdatQVh4HetoB/VUpw1dJ8eMzz8e8iEFokbqAb0qWSruS/KBu6ohvVrryNaeY5n7baIW32Azc0lT9P9ENyRrLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 21:33:22 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 21:33:22 +0000
Message-ID: <b3f36afd-c702-4359-bac6-3e5eec11aa66@intel.com>
Date: Thu, 27 Aug 2026 14:33:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Alan Previn Teres Alexis
 <alan.previn.teres.alexis@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
 <20260827002801.837731-3-daniele.ceraolospurio@intel.com>
 <c88d3c1e-4b46-41b4-be7d-829b12e2e18d@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <c88d3c1e-4b46-41b4-be7d-829b12e2e18d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: e08d459f-7222-42df-0ea6-08df0482d1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w4Ke6o+e6C9Jfa34qgeYKlcbJ4fLxDNVu1CljM2YjyUtmcHJ8Wk6QjShwda3DZxMsy4x2PTGZgzxIFAX0fXDg8HwaaOE91R8clM7yMU19dyirO9fpQlkK8NWnO8fkZhQbEQbRe4w/Tw/KTWH1h5pNqg3vK/6RgTNyhbNYjmCP7ofOiPldRQrpvYQCkcoZN6cwqKtIWqVP7VjBh3n1dWsDsY3oUpMTw32THM2UT44g9GqkpzYi4tS6tT1c+s2pz4yY5ODdEJ/oJNQvBjMyN1UYbQEnwnnOd0i5EqrHIaQjclS121Ri7ylfG1ukYEUKrNrDIyuzKdDPRP9YwzQGa1GgkdECFDm2ibOJ32cHSrwg2u6yXa16zj02exqrCfpk2RtbAo0GDbEh3EmeY2NpQSyJgDX9Uuq0dhaj0galjkTLDbrK3LUN2DfXZespwmyFH10LsxjvGs08J2/QX13G1Fl9p2L5c3GTbcCqtZAG+g9+cTIeWc4d4Vf4NkAh7L7WTn74P4Sw/UF3tkDrvxBbMZ4JUtGpxEKijYh3oJVYJ4zp16ZzQ0vaFizxvVFfpE0g1SPk09hnXcC3AYbWjoNA8UC2t+9PIj5mlwsRc5iscHs293Rz2oQ++FiRkSTgdVi1nDjjVEM1l2dzGZbB49RNO0kWkn8nd2ZW61Lu/erUi3Z6Ao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0t5dUhXSzhrREZrbWhnZmRIRldSOG1VQUE4NnpDajE4RG1ORldyd3dXc3JM?=
 =?utf-8?B?dXRDRHpVYWFyZ3YvVWgrck5YM3Q5V1VTRnFhSFJzbk5qUGt2cVRITldERkpN?=
 =?utf-8?B?RFB5Tm91U2xnRWJ5MjE0cTAxdDlVOUk3Nk1xN2FTeDZrUkJ5MGdVM29wL3VK?=
 =?utf-8?B?YnE4UThZSTRsMVNFL3NsVnJYYmpPTXRYaHdvOEZCZS9iQlBWRkZMTjVmSytq?=
 =?utf-8?B?NGFBeUllcDV0ZkVDMFozNHRyTkErbEgvUEpDTkprQjNjYzlIa2ZzZnVnaUlD?=
 =?utf-8?B?T016K1BCN1FSWnArSkNMZFQzVnBXR1oxL3FjV3dyZHU2cVFMYzA1d05TSUxt?=
 =?utf-8?B?VEx6cmwybkk4clJOSmxuQWMxL3RPL1YxbkhQSXU2azhGdkJCUHBveHc3ZFFD?=
 =?utf-8?B?RFA0NUV1N1o5UjdQVDlJVGdaTnJjV2FDa2lyQ1pUK3p4MnJWOGYrang1L1NS?=
 =?utf-8?B?M1d5eDBZUUxyeGE5elZHbzJUZVZVLzBNdGo2L2VaVHlGMDRyWEVWaEQwOUdm?=
 =?utf-8?B?L2NZMEJKMU5IL2pGQ3JsSTYxL2NWR2RnS3BBL1pGUTk3dDZOdkQrMDRxVjRq?=
 =?utf-8?B?cUpSQjRzQXBKM21rZEVBRFlaMnZ1S1lDVUVSajlWYy9JWEtMRHh3eVlScS9L?=
 =?utf-8?B?SUs4UkdKMGFVclRoSkhhQmNsa3hyOU5kTWlHM21FcGl1aWk1NlJMblU1Q2lI?=
 =?utf-8?B?eVVkY2w5eEE0SUdkaWdRN0hnY3RvNW0xRHlzVlZ0VHg5VDBoRzhJTUt1Y0J3?=
 =?utf-8?B?UGdCWkQ4QU1ZSDBpMGlJMUFxRU1mWU9FcVIxK1ZMZ2hiQjV2QzJRTXgvb084?=
 =?utf-8?B?c0o5WWhMSUN0My85TkxXdTlMeTFLamxzOHZtRjRHZ0JOMENLKy90UnBLQ3Ft?=
 =?utf-8?B?Z1RhcTNDNGlxSlMwalYrbHhvQUs1ZURPWmpNaGhHcDFuUUlwZzNocTdLWTVq?=
 =?utf-8?B?cFlYQVZxSXpnY3EzQzBPTHJ0U2QwWlFnOHFYOU1HbGk1d0xBNjlacTd6UWdu?=
 =?utf-8?B?RllNK2JwZmsrT3VaWnBtUStqb2pOQXl2NUtJV3ZOaEQvblpkYk9MM2hmUEJ4?=
 =?utf-8?B?OVV1YmRnc0Q0VVRvTk1hT09oWmZuM3l5SGV0ampvN2JGZ2N4ZTNnYXU5MkYw?=
 =?utf-8?B?aGpKMnJzYVNXRVVrSW12REo5bEJYZitzRXVVQ1ljcFEwUzNTcnp0bDVXZHlY?=
 =?utf-8?B?aUFkR3Y3TThkcjY1enhrRDUreWh0cHR5MURiZmJHVkptYVpZaTh5NFo4UzZN?=
 =?utf-8?B?STIvT3IxZGJHTUdkOU5GZVBaUXpONGxhSklnbVpQOFVFRjBEaVhxNHpoOFRP?=
 =?utf-8?B?S1F4b3VibWNEZW5VNS8zZ1lKdW5SZXBEbXd3aWQ5TG1DdGkxeTVQUk84UEJy?=
 =?utf-8?B?L1J3ek8yTDVmaFRyOVZJaEVZSVp6UkppMEZhVlVkWWx6VWtlS3BoOFAxbTlp?=
 =?utf-8?B?ZE1JQmN5VFRMYjkvUjVZc3FJc0Mwb21BR1VNampxeDZ5YTZMeCtvQTVhSWtZ?=
 =?utf-8?B?S2l5MkhIZVpZWk9EWk8wWmQzNzdtcjNqM3czQTcwVWRtN1doWjNkc0NhV1N6?=
 =?utf-8?B?dnhqdExOQXVkcjBzZzNZOFhCdDRiM0xQemh5ODZXSEdnVmQwaW9mWTFidllR?=
 =?utf-8?B?NndPaXVhU0VldFEyaURncGROR1h2YTZZTVBFOTdLSUxwSWlZY1VVanZBK3lF?=
 =?utf-8?B?ckRlL0hESVdLd3B2Y1A5OXBwc0FSOGxuNjdmUWNLN29UTnhiazRaSmw2Nmc1?=
 =?utf-8?B?STVFaWtzQlZzdkhTTEkvMkVDc2dUNE5jK09zR282ZHRUSlI4NklmVml2Q2Q5?=
 =?utf-8?B?cjJhK3hmNlZkOU1LSXc2d05jS2lpWnVuQ0FISjlQODA2d09zRXZHRnUxekJM?=
 =?utf-8?B?TXpuVDdDTW54RkJHYmFTbmlLYk5URFNpSFZEaUdJcFlGaWpMdndhVUxud2o1?=
 =?utf-8?B?K05WV2xacVJqMHd5MGlDa0MyNjdIeXErWDgyTDQxZnBCSzViTTJtcWt6djJq?=
 =?utf-8?B?QUExbHRrUDFZcElXdWJRSDFvbGxOZm1rcm10WHdnSFJ6YWIxTG1lMldsZDZX?=
 =?utf-8?B?UFhRLzh6eE91dkh6bWRSLzNES0FEQ05jRExESHFQN0k2bUdHL1g5aVRUTWtT?=
 =?utf-8?B?RFFMZ0gvaDMxaFFwc2FRT2VUNSt0MGk3anh6cG9tN01vYVFPSXhUNEVXQjJ0?=
 =?utf-8?B?WmFqb0F0MEhXbHI4RnFiMGp5MVhQMWgrbHRPMGdkZXFndGN3NjV3cC9MWWhX?=
 =?utf-8?B?V09vV3ZrRUZvZ1U4QlBCRGdlckdpTUcycXFaMUk3SGZ1d1hqSVRMdzhoRWtJ?=
 =?utf-8?B?QlJONFRRZTNla015UGNnZ1hOQ3E2YXVrd2JHVGRjdUZvNktGMGF3bzcrOG9H?=
 =?utf-8?Q?GPJlqyupExMAqbqE=3D?=
X-Exchange-RoutingPolicyChecked: GYBVIhvDqbCOh8ghSLzkXL9jRCORbLPvMeuWVZkbpcGBAzSITbao0tt5U78B/BObisElZr4nuxzpCyeAWlJ4omGK10Z1drrHDrrhOONp1TzfmxNO+ORJGewqTgVkh6GV8fFWLTv31XWY7REDDj3XfOamoBZTsQY3iBUfNpHFP+TdNzVKd8EZPcnjz6hevMRCZgY6i1ITSfDV52sUksXtrCMQeGicCYHL4XAAlNg1nMB6xzVvRyiilgajTSEQAlDBPEh5NhAFhxPLcECQo1F20IpBq8/4S6A7dTP6KhLJ7YxKo5SxD6LUzSlB4pnE1cKmmf8nqO5htFDlp2m81N++CQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e08d459f-7222-42df-0ea6-08df0482d1ad
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:33:22.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfLyurziJEtb2zTR2s3cY1EeQsUO1CDqKbjJKheu4iq2Er8UTJmcD0gxsiPeRTP3kZcigDssRX4Pgr2IhQ07Znb7Q5Mlj2JIyQO2LVyNiec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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



On 8/27/2026 7:34 AM, Michal Wajdeczko wrote:
>
> On 8/27/2026 2:28 AM, Daniele Ceraolo Spurio wrote:
>> Convert any errors that can cause the CT to be declared as dead to
>> use the xe_log_err() helper. Errors that are escalated to the callers
>> are left for the caller to report with SIGID if needed.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
>>   1 file changed, 51 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 5c4733da385c..4efaf2d24c3e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -30,6 +30,7 @@
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_guc_tlb_inval.h"
>> +#include "xe_log.h"
>>   #include "xe_map.h"
>>   #include "xe_page_reclaim.h"
>>   #include "xe_pm.h"
>> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>>   	return 0;
>>   
>>   err_out:
>> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> +	xe_log_err(gt, GUC, err, "Failed to enable CT\n");
>>   	CT_DEAD(ct, NULL, SETUP);
>>   
>>   	return err;
>> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>   
>>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>   
>> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
>> -				  h2g->info.head, h2g->info.size);
>> +			xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
>> +				   "CT: invalid head offset %u >= %u)\n",
>> +				   h2g->info.head, h2g->info.size);
> nit: we usually use -EPROTO to report mismatch in the messages
> while here we have corrupted descriptor, so maybe we can use
> something else, like:
>
> #define	ENFILE		23	/* File table overflow */
> #define	ESPIPE		29	/* Illegal seek */
> #define	EPIPE		32	/* Broken pipe */
> #define	EILSEQ		84	/* Illegal byte sequence */
> #define	EUCLEAN		117	/* Structure needs cleaning */
>
>>   			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>>   			return false;
>>   		}
>> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>   	bad |= !ct->g2h_outstanding;
>>   
>>   	if (bad) {
>> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> -			  ct->ctbs.g2h.info.space, g2h_len,
>> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> -			  ct->ctbs.g2h.info.space + g2h_len,
>> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> -			  ct->g2h_outstanding);
>> +		xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
> hmm, here the "bad" flag is more an indication of our (xe) miscalculation,
> not something that FW did wrong, so -EPROTO seems wrong, maybe
>
> #define	ETOOMANYREFS	109	/* Too many references: cannot splice */
>> +			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>> +			   ct->ctbs.g2h.info.space, g2h_len,
>> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> +			   ct->ctbs.g2h.info.space + g2h_len,
>> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>> +			   ct->g2h_outstanding);
>>   		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>>   		return;
>>   	}
>> @@ -961,21 +964,24 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   
>>   		desc_status = desc_read(xe, h2g, status);
>>   		if (desc_status) {
>> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, -EPROTO,
>> +				   "CT write: non-zero status: %u\n", desc_status);
>>   			goto corrupted;
>>   		}
>>   
>>   		if (tail > h2g->info.size) {
>>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>> -				  tail, h2g->info.size);
>> +			xe_log_err(gt, GUC, -EPROTO,
>> +				   "CT write: tail out of range: %u vs %u\n",
>> +				   tail, h2g->info.size);
>>   			goto corrupted;
>>   		}
>>   
>>   		if (desc_head >= h2g->info.size) {
>>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>> -				  desc_head, h2g->info.size);
>> +			xe_log_err(gt, GUC, -EPROTO,
> as this indicates that FW found an error in CTB, maybe:
>
> #define	EPIPE		32	/* Broken pipe */
>
>> +				   "CT write: invalid head offset %u >= %u)\n",
>> +				   desc_head, h2g->info.size);
>>   			goto corrupted;
>>   		}
>>   	}
>> @@ -1220,7 +1226,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	return ret;
>>   
>>   broken:
>> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>> +	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
>>   	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>   
>>   	return -EDEADLK;
>> @@ -1558,11 +1564,11 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>   	struct xe_gt *gt = ct_to_gt(ct);
>>   
>>   	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>> -		xe_gt_err(gt, "GuC Crash dump notification\n");
>> +		xe_log_err(gt, GUC, -EPROTO, "GuC Crash dump notification\n");
>>   	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>> -		xe_gt_err(gt, "GuC Exception notification\n");
>> +		xe_log_err(gt, GUC, -EPROTO, "GuC Exception notification\n");
>>   	else
>> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>> +		xe_log_err(gt, GUC, -EPROTO, "Unknown GuC crash notification: 0x%04X\n", action);
> maybe crashes should be identified as one of:
>
> #define	ENETDOWN	100	/* Network is down */
> #define	ENETUNREACH	101	/* Network is unreachable */
> #define	EHOSTDOWN	112	/* Host is down */
>
>>   
>>   	CT_DEAD(ct, NULL, CRASH);
>>   
>> @@ -1592,13 +1598,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	 */
>>   	if (fence & CT_SEQNO_UNTRACKED) {
>>   		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> -				  fence,
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>> +			xe_log_err(gt, GUC, -EPROTO,
> FAILURE response is a valid message, maybe:
>
> #define	EBADE		52	/* Invalid exchange */
>
>> +				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>> +				   fence,
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>>   		else
>> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> -				  type, fence);
>> +			xe_log_err(gt, GUC, -EPROTO,
>> +				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>> +				    type, fence);
>>   
>>   		fast_req_report(ct, fence);
>>   
>> @@ -1674,8 +1682,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   
>>   	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>   	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>> -			  origin);
>> +		xe_log_err(gt, GUC, -EPROTO,
>> +			   "G2H channel broken on read, origin=%u, reset required\n",
> #define	EBADMSG		74	/* Not a data message */

For this one I can switch to EBADMSG  for the log, but the return value 
needs to stick to EPROTO because the value is returned all the way back 
to receive_g2h, which checks specifically for EPROTO or EOPNOTSUPP. 
Changing this flow to handle different error codes is out of scope of 
this series IMO.

>
>> +			   origin);
>>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>   
>>   		return -EPROTO;
>> @@ -1693,8 +1702,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   		ret = parse_g2h_response(ct, msg, len);
>>   		break;
>>   	default:
>> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>> -			  type);
>> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
>> +			   "G2H channel broken on read, type=%u, reset required\n",
> maybe this should say: "Unexpected message type %u" ?
> and since we rather do not expect new message types in CTBv1 then
> maybe this one should be actually -EPROTO ?

I think it's better to stick with EOPNOTSUPP, but I can reword the message.

>
>> +			   type);
>>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>   
>>   		ret = -EOPNOTSUPP;
>> @@ -1792,8 +1802,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	}
>>   
>>   	if (ret) {
>> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>> +		xe_log_err(gt, GUC, ret, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>> +			   action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
> drop %pe as it will be already printed
>
>>   		CT_DEAD(ct, NULL, PROCESS_FAILED);
>>   	}
>>   
>> @@ -1840,7 +1850,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   		}
>>   
>>   		if (desc_status) {
>> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>> +			xe_log_err(gt, GUC, -EIO, "CT read: non-zero status: %u\n", desc_status);
> #define	EPIPE		32	/* Broken pipe */
>
>>   			goto corrupted;
>>   		}
>>   	}
>> @@ -1871,15 +1881,15 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   
>>   		if (g2h->info.head > g2h->info.size) {
>>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>> -				  g2h->info.head, g2h->info.size);
>> +			xe_log_err(gt, GUC, -EIO, "CT read: head out of range: %u vs %u\n",
>> +				   g2h->info.head, g2h->info.size);
> as before, one of:
>
> #define	ENFILE		23	/* File table overflow */
> #define	ESPIPE		29	/* Illegal seek */
> #define	EPIPE		32	/* Broken pipe */
> #define	EILSEQ		84	/* Illegal byte sequence */
> #define	EUCLEAN		117	/* Structure needs cleaning */
>
> maybe except EPIPE which we want to use to indicate that CTB error
> was already set earlier (likely by the GuC FW)

IMO grouping all cases where the CTB header is in a bad state (whether 
because the GuC signaled an error or because it wrote and invalid value) 
under EPIPE is cleaner. Having too many different error codes will just 
get confusing.

>
>>   			goto corrupted;
>>   		}
>>   
>>   		if (desc_tail >= g2h->info.size) {
>>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>> -				  desc_tail, g2h->info.size);
>> +			xe_log_err(gt, GUC, -EIO, "CT read: invalid tail offset %u >= %u)\n",
>> +				   desc_tail, g2h->info.size);
> ditto
>
>>   			goto corrupted;
>>   		}
>>   	}
>> @@ -1898,8 +1908,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   			   sizeof(u32));
>>   	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>   	if (len > avail) {
>> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> -			  avail, len);
>> +		xe_log_err(gt, GUC, -EIO,
>> +			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>> +			   avail, len);
> #define	ENODATA		61	/* No data available */
>
>>   		goto corrupted;
>>   	}
>>   
>> @@ -1981,8 +1992,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	}
>>   
>>   	if (ret) {
>> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>> -			  action, ERR_PTR(ret));
>> +		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed (%pe)\n",
>> +			   action, ERR_PTR(ret));
> nit: you may use %#x
> drop %pe
>
>>   		CT_DEAD(ct, NULL, FAST_G2H);
>>   	}
>>   }
>> @@ -2080,7 +2091,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>   		mutex_unlock(&ct->lock);
>>   
>>   		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed: %d\n", ret);
> drop %d as we will already print ret using %pe
>
> also, maybe worth to mention "..., forcing GT reset" ?
>
>>   			CT_DEAD(ct, NULL, G2H_RECV);
> hmm, I'm pretty sure this is redundant as we already call CT_DEAD
> on every case where we report an error, can you double check?

There is at least one failure case in process_g2h_msg where we don't 
call CT_DEAD. If we want to rework this so that CT_DEAD is not called 
from here I believe it should be done separately.

Apart from the suggestions I have commented on, I am implementing all 
the other ones.

Daniele

>
>>   			kick_reset(ct);
>>   		}

