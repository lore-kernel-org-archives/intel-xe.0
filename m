Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F5C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 18:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B99F10E19F;
	Tue, 14 May 2024 18:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NibfRSOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64DD10E19F
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 18:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715711475; x=1747247475;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GwHC4d8I0X8Z/a1vyk7hsVy32fBGFzQq8T2Wy0BJlZI=;
 b=NibfRSOClEE/M5UFPGpGisxW9+0wbvIJEPpBFb920soBJGaIj1j3adiz
 TWciMno7j+3Av2B065gJppom402SiJUC69keo2ZsBnOf0etx0vF0F4/6u
 WMvqSF9yndEl/bCHhzdvgwlo1dOirDvrbC62MvfrxpKuGZISQhFXaibQY
 p/NJtPGdH1GEtFLiVtPPgEEgIRNiAfHfGNfN7jXu2mmUXEgsDeZ2Eu0Cc
 Dxb40axwRNL4tUs5wCg8fvDRvjz/C/rw7Z4ptYdbFYPHl6OSeMYHwX7AY
 1Pu/QegCKb5oVmV2xIZua7c+rjtxl48kZQv262wiC0llUw8x2QTqKJCCm Q==;
X-CSE-ConnectionGUID: gv8rm7+uSGK4YY05hbz/Uw==
X-CSE-MsgGUID: NYAXUdxCSNqaZCT+pzYygQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11849323"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11849323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 11:31:14 -0700
X-CSE-ConnectionGUID: qRGmi+YRR5qEBmrB5vlTtw==
X-CSE-MsgGUID: oPaJ03DxSpqtTeU+J26S1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="68235204"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 11:31:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 11:31:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 11:31:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 11:31:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 11:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUZtfdbCX+/IoZmXhkVu6n0jWB49J5jmwycoTohj35gpEzkGIrwQyL1Bag8uxQxn20I9J4oaRf/jY1h9Wh7xhuUF450zFA/fkhofdkPu+3g2IAcwelWHVWPeHvCXJ3+mp1VLiPiXLXm9Fus1Vipcblzr/wEyoChTid7Np9eNG81jEb63vYpXWfgfVQGUEp05bGXObjKNpR2tnKOX0cKmfSWhU4NnhIQM3m11FzoFXPz2lJSU0Rm4zrgxmhbQZKC920HYOU+nep8WbBg7pZ68c5wa07jQOwqVpnxTBYeWQUOncWTSlQSdeRn203lwqw/vkLrg+ksY5Omh/Rdx4huLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CcF5RcmKZ2aeybQ25RgaRCBUdQDN2iOmjwrpg+YY18=;
 b=kp+wSTOwu+30FR56pFyYL7IA5hhguN2XroUlzcidOF5iR7/ep5yLb4p8aQblURuJ3NX//ulVTATHKlHXW6dPk7Dpv3TBPn3tA17o+2SYkZq5ne65dh6BBiPOxjwYvHKpn3Pmlp+fRdQWvU7VxsWEvC7ERd7IfFVx1hw/WUZJbKHbpbm5BLqVPmw3X/nx11LW+zyn77/Z7fWfYZ7WLdhDrj+QjrG19RZu/VmJji0zQ+GCVNBEgkClQXKqQZGId8B8i4GzwBwLVX9PL38FwKjDJ8xUxgtYkrffwOx3nfXoy65348zGYnknjsmJUgidDmvh2kYHSySWembXMERWwuWrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 18:31:06 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 18:31:05 +0000
Message-ID: <9da5ca75-58bb-485d-a0fa-909a5d31f8c7@intel.com>
Date: Tue, 14 May 2024 11:31:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <b978eca4-d69f-4d67-b3f2-34ccfbd1b506@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b978eca4-d69f-4d67-b3f2-34ccfbd1b506@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 692ef104-bd7b-4dd0-518d-08dc744403f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDVxTlR4TnhBbzZzeTNvR2NES2VsQmx3VVlmblBOMWtrVzJLTWQrazhvYnIr?=
 =?utf-8?B?ZEV6SVlEY0lTRlpqVi9jWC9jNUljc1VTcVM2VGhDaFBvMTVzVzcrUVZXaWdm?=
 =?utf-8?B?N1Y4SjMzMzllT3I5RFVvK1NacjUwSUVrckJ0TW9RanRRdGpBR2ZPWVlQRjNF?=
 =?utf-8?B?bUJEc3Q3WHNSeS8zWjJyTldkZHdVMFpYWWNodXVPWGtQdmZDWGVLSFMwa1FP?=
 =?utf-8?B?L1lFVGlBMzNBTlR1SEtMU1FLWWtHTVpMTTZrODNpOTdXQUZsWVRKaUhqcTNR?=
 =?utf-8?B?bXMrYXZ3c21UNW9RbHRTcGFsQVpFYjF6M0RsUW9nOVVid3lRa1VERlFpSmtM?=
 =?utf-8?B?SStFVlJ3U3E1M0R6NzZveTUvV1ZzM0ZnNjRvaW1USGVyalpYNEVjVnBpNVlY?=
 =?utf-8?B?L0lNZVRwUkcxS3RPV2RqSEFGQ0orWmdFUG1DaHBXZy95ZVFtYVhKQUJ1N3Yz?=
 =?utf-8?B?Z0U3R1Z6bStQVzBMd3ZGRyt4Vk1oMkVnYmpWOXBTcXB4c3RUNW9vdjFJd2h5?=
 =?utf-8?B?N2RxY2dRd3dIT1NwK2NKL2FaNlhhZFYyekpQYnpiRy9BcFhSK2lScGt5dDdt?=
 =?utf-8?B?a0l6SVo0emhaeHhZQU9QbkJFNDVQMWRsNGQ5eXgwcXBCb2VxSGxSUDI1ek5D?=
 =?utf-8?B?aXRkK2VTSkpEOHdXQzh5TWJkVzg0cXVyR3F4ekt3d2swOTNDK1UyUUNjZXlR?=
 =?utf-8?B?bGJNZU93MW9IVFN3cXp6MUtMR0hWQVBrMjRYQWwxM1gzYVZHUGo5bXU2OXRo?=
 =?utf-8?B?U1pWbm10NWt4YVBKb1RQS0tTVmx3L3AvRy8yTWFwMEJKcWJmOFFTSmhRVnlo?=
 =?utf-8?B?bXZiRHdrVjZ2cUxqRnNUb00wZ1Q4dzlzS2dVUDVZaDdOZVdmSGprZlN0RjJI?=
 =?utf-8?B?UWl1aW96ckVHdGNBU25zT0Y1bGlCZ0RJTHFyeDNlaEc3dE4yY2ROQjR4YWR1?=
 =?utf-8?B?N2pQcVQrM0FYdDBxMG5hd0pQMXhCbGNRNmc1eEdPZnNDRTdaWk9mL25RdER6?=
 =?utf-8?B?djhnZzB4WDdBbTI5N1E5cUhvcUN2eDNtNjFXOHRVa2FqTjlHeTFreGtHRGwx?=
 =?utf-8?B?dFJPb2R5TTc4ZE1ReEw1ZkxIRjJBRkdTdUlCMUhnMCt3QVptdHp5eVJ0aG5K?=
 =?utf-8?B?ejJvQnhiTVNiM0xqUXQwVTFsVjFMM3d3cWpDOFUweXVHZk9rNDV1Q3V6THFv?=
 =?utf-8?B?Uk0xRWMvRTJ1bHdaQW53WkZEbzE5MWNwRFUxMkxhSEFha3NqdTdoRGlVSXpD?=
 =?utf-8?B?Q0VkMzlBblhpZjMrZGROS0s0R1g2eFN4a0wvMGNhZkJ1MC8zTjlhMFh5VGdR?=
 =?utf-8?B?VnMrZWlxbHBnRno2UHBXR1BYenNaS3ZrL0MvR1dvenNpcmlKVE9HYXN0dzJr?=
 =?utf-8?B?ZHJCalNWZGlFa1llVDRnc2hmcU5MOEpBOFliMmlid0poeTJGQU42ZnNicldQ?=
 =?utf-8?B?RHovMkRsVlB4bzZpTWowVmxHTTFDT0FGUllrLytwOWs4ZDFldkd4TjAzQklH?=
 =?utf-8?B?Y0M1YW9hRjBmSXZtSVVYMGZUNzdsZzV3YVl1TUNPM2F4UFJyWWwrbHlwRVBG?=
 =?utf-8?B?YTJNOVRJNVc0R2Zpc0FqbmdDUlg2REdZc242RXFMaXl4QWZ1VlQ4L1diOVNr?=
 =?utf-8?Q?AT92qurc7cedbXLX9UW0WgX2Vv6PAkm3nIxtHjg56zVs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9ldUFsd1Q3dDhUbEpqNEMvN2JWcW9aRkk1d3Jva2tVV09XWEl0OE55Q0th?=
 =?utf-8?B?QVpQUkh1dW1wV3FHdEk2Y0N3TEVBdk8rNTBBdkZaRWo4TGtaWTZ1eG5iemNR?=
 =?utf-8?B?UkttMlVENlBoZ0ZMcENRbmNibHZMMm9YdnJnT2p4ZnBqRy9oMUJQY0hIZ1l2?=
 =?utf-8?B?ZzNYSlQ4aDQvT1VBK3ZSWjFHOUdBZzA0SjNNVk1oRDY5Nng0ckNqQ0RVR2Nv?=
 =?utf-8?B?dmw5aTRsSFdvYXdGMFFNcmNwQ3drSmFqaW9zNFlINkVVRENSUm5VY3h2andB?=
 =?utf-8?B?TE5HNVI4NG5xVkR5emJyRmpSV1dVTitlS080OUF5NDlqaDlvK0J4eWluMUVZ?=
 =?utf-8?B?RlZEWDg0ZzFpeDdCS2dnR2dhd21PczY1b1JOL3hXTjlsZ3cxMzJhUE5ZZFYy?=
 =?utf-8?B?Wlcvd3FsTWpaVkRiTDZXNE5iS0t1c09JS3Y5dmJubmg4NkFvVUM5R0dmUVBY?=
 =?utf-8?B?Qkp0ZmNTTmVZdWdIRUdqYTArMFF0OXRmN25KS0dGMUxPVzdhNWdiWk0zRld4?=
 =?utf-8?B?VzBwbm82cGhsUTJLS2RZcEhYRkN2aVRxeTl1WFhiTFFZMmIzT2F2OUw2c1da?=
 =?utf-8?B?VitJMGwvb1gzK25Mc0VIeGxySFpJL0JaQ2JKQUZBaUwvMzJkK1Q4VU1Wdzlt?=
 =?utf-8?B?OXlrQk1NYy9naW8wbnUyRW9WS1lKblFzblYzclJVdTdteHp5cHEzVkNxbFVO?=
 =?utf-8?B?ekc0WW9ONHdEQ3R1and1S2ZXUjBnNlpCRlFNZDdSQkI2YXZDQ0VycmVYQ2dY?=
 =?utf-8?B?OXpxR0YyMlY3cG1wWGtWWVlsSkdnaHhjd1BONmtQN0llamxudGpHclRwMkU3?=
 =?utf-8?B?a2lSNWJBUnRwUjFaS2QzZVZLb3NVRm04a0MxdFkvalBBY1JtM2Zib2JUVTRn?=
 =?utf-8?B?Ly9VUFdpRy9MRWlieEQ4K0JyM05FS0F6YnJiVlE1dVVodS9BV1hIQkVsaU9y?=
 =?utf-8?B?cUlGTGE2ZXdIeDRLdEhpR1F2ZmhxVHRkRFc4U1FEY2ZjNE1YUnRzZkZCcnBl?=
 =?utf-8?B?c1FvcmpkcGhoQStXYTR4YjZDWHBBNVpyMWQyTFMva3ZiTWd6d1dVOGcxbmZP?=
 =?utf-8?B?US80eXZZd0NRNXQyeHN1SHlGMHRtT2d1RzgxeWhqYm95ZHJXelk4M2ZxZjVK?=
 =?utf-8?B?VTA2UkhaMmxMRjNyY3lnS1IwbWVHc1dZdFZCeDRvVVhEaUp0Q3BuTFhpUnpC?=
 =?utf-8?B?QVlwZW8vL2JteDd4aDRZTGpGTS9EV3ROY1JyMHJZN1NpYlU3SldkM2VTNzR4?=
 =?utf-8?B?Zk15NTFzdkZSMGltaUZNV1p6MWMvMEl5WW82dkUvTXZjWmprVkVGdHJYcEVy?=
 =?utf-8?B?RzBiakgzUG9ia3Z4R21KTEFhU0gzTDVXb3pjSW5YUEovakV2azdzRWIzbzZz?=
 =?utf-8?B?ZWRnTmpzYTkrL044MUQvYkk4dDFQamlFYUhWeFRyeEFRWDlUeFVxcm9QYktv?=
 =?utf-8?B?c05OekR5Q1p1T25LU1hDY1krcWVLY3VYQUpqYlJLbWtRRjRxaUJnWGZiRGVj?=
 =?utf-8?B?NVhYUmtPN01wUE1BNklMbGZ4YkVwMnplMkJKUTFzdzY5c0hlQi9IMlB2bTRF?=
 =?utf-8?B?OUVDcWVUbHZTaTVWazkwMmZTdzJqaVJYSlZLL09lWjNPcGVMeU1kV2k5ODE3?=
 =?utf-8?B?MGxzOEtvZit5elIxdk9pV0NlN2xlbk1ZNVBYa1kwQzZpcWF6eiszTkZxc1Zx?=
 =?utf-8?B?UDl4ZHljQWgxN3N0NFd0aTVzNUoxQm9NWFR5QzVJQ1c2N2hvV1loOVBzeERX?=
 =?utf-8?B?dzlYZy8zU0wxSTlqbVFWb2FkcndJZkV6T1ZYUGREazJrM2sxeDlRdlVUNzlQ?=
 =?utf-8?B?MFNyY3d0Y3JpV2Z5NFQyVDBxNXJlT3hmVmw4YVZVRlRxemwvZ1hUNFVvWEx4?=
 =?utf-8?B?NEpHZFZDZjlsVXY0YjNWNEZ6dllOUUttdWxsV2srNWlSSUh5S3RreTRzZlZW?=
 =?utf-8?B?dHJScHptdlJhZ3NTWGlabkpBblpYZW0zKzRBRGhQcjZpQnhSNUd4TUZsQ2xh?=
 =?utf-8?B?QzZ3QWpvcS9WbzYwbUlMSTJUODkwanBBWFc2WUlNK3p4UkovMG8zU3QzQTZz?=
 =?utf-8?B?S1U5elc2TXl3bXRRWXlHMFpGd1ZsWXV3Y29sdndoZ2hRNzBIY3lLOVdRZU10?=
 =?utf-8?B?Z2hGQy9UUUJXOXZobjhLUE5jd29Fd0VqazlBeUhBZ0FBcWpoaUp4cUs0aldV?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 692ef104-bd7b-4dd0-518d-08dc744403f2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 18:31:05.4133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdHUZKnVFLTF2V58xJPEbTIosTu0W8Jxqc1FT0qQlkiNUELoUSB4iY96wV2Mu7crgrT+T3fTEdDXuAHD3PzeNaiJhdRD4HduFMonTcpYGAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

On 5/14/2024 09:01, Michal Wajdeczko wrote:
> On 09.05.2024 00:49, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a debug mechanism for dumping the GuC log as an ASCII hex
>> stream via dmesg. This is extremely useful for situations where it is
>> not possibe to query the log from debugfs (self tests, bugs that cause
>> the driver to fail to load, system hangs, etc.). However, dumping via
>> dmesg is not the most reliable. The dmesg buffer is limited in size,
>> can be rate limited and a simple hex stream is hard to parse by tools.
>>
>> So add extra information to the dump to make it more robust and
>> parsable. This includes adding start and end tags to delimit the dump,
>> using longer lines to reduce the per line overhead, adding a rolling
>> count to check for missing lines and interleaved concurrent dumps and
>> adding other important information such as the GuC version number and
>> timestamp offset.
>>
>> v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
>> v3: Add firmware filename and 'wanted' version number.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 85 ++++++++++++++++++++++-----
>>   2 files changed, 71 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 11682e675e0f..45fb3707fabe 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -82,6 +82,7 @@
>>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>>   
>>   #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>   #define   GUC_SEND_TRIGGER			REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..7e7e2fdc9a11 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,11 +7,19 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +static struct xe_guc *
>> +log_to_guc(struct xe_guc_log *log)
>> +{
>> +	return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
> as you have log_to_guc() then this log_to_gt() could be updated to:
>
> 	return guc_to_gt(log_to_guc(log));
Is there any point? The existing version works fine so why replace a 
single indirection with a double indirection?


>
>>   {
>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>   		CAPTURE_BUFFER_SIZE;
>>   }
>>   
>> +#define BYTES_PER_WORD		sizeof(u32)
>> +#define WORDS_PER_DUMP		8
>> +#define DUMPS_PER_LINE		4
>> +#define LINES_PER_READ		4
>> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
>> +
> as you are heavily updating this function, maybe it's good time to add
> kernel-doc for it ?
Good idea. Will do.

>
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   {
>> +	static int g_count;
>
>> +	struct xe_gt *gt = log_to_gt(log);
>> +	struct xe_guc *guc = log_to_guc(log);
>> +	struct xe_uc_fw_version *ver_f = &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>> +	struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>   	struct xe_device *xe = log_to_xe(log);
>>   	size_t size;
>> -	int i, j;
>> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>> +	int l_count = g_count++;
>> +	int line = 0;
>> +	int i, j, k;
>> +	u64 ktime;
>> +	u32 stamp;
>>   
>>   	xe_assert(xe, log->bo);
>>   
>>   	size = log->bo->size;
>>   
>> -#define DW_PER_READ		128
>> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>> -		u32 read[DW_PER_READ];
>> -
>> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>> -				   DW_PER_READ * sizeof(u32));
>> -#define DW_PER_PRINT		4
>> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>> -			u32 *print = read + j * DW_PER_PRINT;
>> -
>> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> -				   *(print + 0), *(print + 1),
>> -				   *(print + 2), *(print + 3));
>> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>> +		   l_count, line++, __builtin_return_address(0));
> this function is also used in debugfs outputs and prefixing all lines
> with "[Capture/n.m]" is pointless there (and will also make collecting
> GuC log over debugfs even more inefficient)
>
> and as you likely don't want to have separate print functions (one for
> reliable dmesg, other for debugfs) then maybe consider use of cascaded
> drm_printer as proposed in [1] - it will also make your code tidier
>
> [1] https://patchwork.freedesktop.org/series/133613/
As already discussed, the intention was to keep this as simple as 
possible and not over engineer a stop gap measure. Yes, the debugfs 
version gets some extra overhead (but mitigated by using longer lines). 
But size of the debugfs file is really not an issue, and it does provide 
extra robustness. The prefix is also trivially easy to remove the prefix 
if desired with "cut -d ' ' -f 2' < in > out".

>
>> +
>> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted %u.%u.%u)\n",
>> +		   l_count, line++,
>> +		   ver_f->major, ver_f->minor, ver_f->patch,
>> +		   ver_w->major, ver_w->minor, ver_w->patch);
> hmm, what's the relation between "wanted version" and actual "guc log
> buffer format" ? IMO it doesn't really matter what driver wanted to
> load, this supposed to be "GuC-log-print" so then only actually running
> version matters as it implies schema version needed for proper decoding.
It is not necessary but it is potentially useful information that can be 
added pretty much for free, so why not?

>
>> +	drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, line++, guc->fw.path);
> again, why do we want include firmware filename here? it's not relevant
> to the log buffer content/format (as we already have 'found version')
Actually, it is important. The filename gives the GuC platform. And that 
is required to know what quirks need to be applied when decoding the 
log. E.g. context switch logs on a TGL platform are truncated because 
the hardware has fewer bits for the context id. The decoder needs to 
know that to correctly track context switching.

>
> maybe more interesting thing would be status of the GuC firmware?
> whether it is still running and writing logs or it is already dead
Not sure how you would get that information? Unless the GuC is actually 
in reset for the duration of the dump, there is no way to know whether 
it is alive, actively logging, idle, or what.

>
>> +
>> +	ktime = ktime_get_boottime_ns();
>> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
>> +		   l_count, line++, ktime, ktime);
>> +
>> +	stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>> +		   l_count, line++, stamp, stamp);
>> +
>> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>> +		   l_count, line++, gt->info.reference_clock);
>> +
>> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>> +		u32 read[WORDS_PER_READ];
>> +
>> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
>> +				   WORDS_PER_READ * BYTES_PER_WORD);
>> +
>> +		for (j = 0; j < WORDS_PER_READ; ) {
>> +			u32 done = 0;
>> +
>> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
>> +				line_buff[done++] = ' ';
>> +				done += hex_dump_to_buffer(read + j,
>> +							   sizeof(*read) * (WORDS_PER_READ - j),
>> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
>> +							   BYTES_PER_WORD,
>> +							   line_buff + done,
>> +							   sizeof(line_buff) - done,
>> +							   false);
>> +				j += WORDS_PER_DUMP;
>> +			}
> as there could be many holes (zeros) in full GuC log, did you consider
> to skip such lines and update custom parser to understand that?
As per other response, in a real world live system, there won't be big 
chunks of zeros. And if you are specifically debugging a start of day 
issue then you can just use a smaller log size.

Rather than attempting to implement some kind of simple RLE, a real and 
significant benefit would be to re-use the compression mechanism we had 
in i915. That is a lot more effort, though. So that could be done as a 
follow up, but it is not worth holding up the current set of trivial 
fixes for some long term goal.

>
>> +
>> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>>   		}
>>   	}
>> +
>> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>   }
> per BKM shouldn't we #undef not used any more local macros ?
One could. It didn't seem necessary given that this is the end of the file.

John.

>
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log)

