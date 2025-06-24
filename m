Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32007C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6810E510;
	Tue, 24 Jun 2025 10:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4i0Szax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA2D10E510
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750761743; x=1782297743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dgB7eLuYmek+ffu0QjKuZnGADelVIAL1ciJkiIltdRs=;
 b=H4i0SzaxhCA/uf48jqpRprHzZMGD5KDQTtkp0mh4Rn/sFMjJ9vtvJoFv
 iIuvD0bwVeiCMACtE6hTk4QJD57A/CBRN5vkx+rb4YWlxmwWZ/uh6CsIG
 bHsE+Ptb85XnKN6rbw8guQn2sUy0sFaotUhD2DGReDptNbH2VcahIam0G
 8qxi/O+54OPkiFAsbax6l5kiluA4TtGVcoE8YMkxWc4K4pZTZRA9FB6rX
 lq1xSfn/5d2bxwCeBna/Sv6R7fzU/QzdrUaAg4t5wj6E50YPUVmQlnys/
 YRvAEbfrohZ3WOexGh5VszZCMS8jQxxTwovvO7Zj6RiGTuqM6r1W+hrAg A==;
X-CSE-ConnectionGUID: RxhUZmuEQRS380OQTbuWOA==
X-CSE-MsgGUID: K091K9XOQsaKADsUL6hFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70417622"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208,217";a="70417622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 03:42:22 -0700
X-CSE-ConnectionGUID: vrCVwz6AQluIMkG3ikrDNw==
X-CSE-MsgGUID: 31pBBUTqSXOB2fQI6ygvyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
 d="scan'208,217";a="151477129"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 03:42:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 03:42:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 03:42:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 03:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b02LVnU3BqDxOfunWpqgRxqV2int2koODwINk6m6nNb30zZN0L+Y/EyMDCdmQv/aPRaLUFeNaTGtPfbvsLZKiERWAZV5+O3uVpnkQBDv4sr1z1UUsO4YgiJwjAZmzRPDv8aAYw5nvKTZ/EyJbXR1J+99YThDldGbxYg49x5MJgQutpJi4JnTBz7+O8dUdv/v7fzOaLsFbzxu5mS4Fni+4FPlG+gvPrmSXKMig7bmbXKzb7Q1cWZAjJHfSplUrWu5MnQ2Tbrzvs8VuqOeFIK6TY1Bhk44VOHerDlDK+WOvuOab6TefxiTFq6LHgx7Ao906PxirLs+5jWPpm+k72IUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+ffCf/JC3hBMhj/iHxgMywUfara1cTY7MWTNA6qHPk=;
 b=LmeQVdjcV8J9XaQYLsFtBFmRkbYyh4ZX0YiVcTNoC+GI0e88PlOBV3ET3ffxrylvCp6tjsfMankpqsIxZtFD6FhIk4SQ/StJkUNz1miudY+pHj5ln0DydlHc/dkZPl4uyxG/D3AF+n5h87afDxb1p8FxEO7WyCsgOA84h/J6NLLFgRmT+faRZpSOjLL3xXt2Mxle2fZe3YjPbhoQRIsRiHAI7TdeHDbfwoSVJFPg02CavkqIvzo7VCBOdLnaLB0rnX6p0N6/kCXKPP98pM6mrkjbsQltrB3k9kyjBU9sUGQcPZG5lorkTNfKpkzHY1lxcJRryXH7Nr40tB/AgjyVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 10:42:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 10:42:04 +0000
Content-Type: multipart/alternative;
 boundary="------------KggnI2AqjSwAq0zwq9wPtxwG"
Message-ID: <89c2a2ba-2ed1-4a30-8013-84d7017a7ddd@intel.com>
Date: Tue, 24 Jun 2025 16:11:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,08/11] drm/xe/vrsr: Refactor d3cold.allowed to a enum
Content-Language: en-GB
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rafael@kernel.org>, <lenb@kernel.org>,
 <bhelgaas@google.com>, <ilpo.jarvinen@linux.intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <varun.gupta@intel.com>, <ville.syrjala@linux.intel.com>,
 <uma.shankar@intel.com>
References: <20250529111654.3140766-9-badal.nilawar@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250529111654.3140766-9-badal.nilawar@intel.com>
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e7e59b-6d9e-4d45-a046-08ddb30bc1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlQzdlJ1cFQvbThnaHhqV3kxcGdUNDlBVWJmVUE5OUszOStiRlU1a0Mrek9x?=
 =?utf-8?B?ckpldG5WQit4SlFLWm1Zemo0R1M3K0JmcVAraVFNbExFU3J1ZlNFc3d0TndD?=
 =?utf-8?B?S0tmcVFDUVVrc1U2ZjlnWWt6NFAwYmZRSEFoSFNiK1NadVhleDJaYzBGSWhj?=
 =?utf-8?B?WStuS1l1NXNYZStIZDJjdHgrWkVEVytHQUpnTWJFMU9DcmJhRzhhNlFrMmd5?=
 =?utf-8?B?SnExZFA1aVJSWnpjWDZBUzNLNUhzaExHS3R6OFZoSUFTNDI0K1laaTBpblNB?=
 =?utf-8?B?bENyUFQ3ejNlcmM2RDVEMWl5OWZBendOQjBia2ZWZHYzb0VpYjU1UGJGQnV0?=
 =?utf-8?B?RVl6Y2JrQjY0cTg4QUd3YlpmcGtaYzBxZ0JBRVBMY0IrQ1hPZGhKeDBpa0ZQ?=
 =?utf-8?B?WTBQUzNrWFo2STU2Z1lsdzkxM1F0ZDRtRkphK0hPWUY5c3M1Q1lTR2FhTk8z?=
 =?utf-8?B?czFGWW5NMndxOTNHMXFHL2QreVZsc05jaXRvMXErY0dmR1dqSldWTStYNXhr?=
 =?utf-8?B?cFVjNWZ2UU9MRzF5OHFXdkNvSDFNNGQyYk8zWWFEcDRTYkswczJlYzZxa09l?=
 =?utf-8?B?d095SC9UL0pySGJuemJJekU1a0VEclBQa0o4cERidVpIcFRBYndsL0JUU0VH?=
 =?utf-8?B?YVNwRjcwckxkbG1ldjNoTGNJYWtZNWJhNnBLemJlRnZjWStJWEszSWV3eU1v?=
 =?utf-8?B?TDdwejF0R3BLN1Rzeng4SlZaWjZUTkE0aFZLTlpWeGs5RHNxSnJkc2dzcXFR?=
 =?utf-8?B?aUhOeUlmdFFwd3l0ekpVUk8zczl1eDJVbnpXaDZDNDA5ZHhNRFcwNUhXazlG?=
 =?utf-8?B?eGRDNUVHMUkyaWxlaXB2L05rRUZSUDdmZDRmeDJuKzFRQ1BNWDd0V0lKOER1?=
 =?utf-8?B?L1oyUUY3MEt5YTFhTndlOGVhejd6K0wvcmo5MURTMTh2Q2FVSXlBYjdXREhK?=
 =?utf-8?B?SUlQcW5nMFhnUFZIVjJsbmxHak9GWU81OVgwYVZJMVlBc0s1U0ZwV1RrbGhE?=
 =?utf-8?B?aWJtaDNZMVZrUnIwODFmMHlLTXdZS01zb0tlTkxST3UvbTRnWG5tRHBTRGd5?=
 =?utf-8?B?ZHF0Mm42QmZuV0FiTHhjNnBiemhvL2FpOTk2YnhNRVhNbGxkMStCMjl0UnBT?=
 =?utf-8?B?U0d2R3VodTJoeWZRSDl4Q0g1UVBZSmQ2cFBSU0g0WitiNEErWmlRTmpvc3pB?=
 =?utf-8?B?NThidWQ1WjB6VUVFa3NoWUgwVW5qVXJzazJNbGJqMnB0MUhxVWx1eStKaVpB?=
 =?utf-8?B?WlJWM1pQYkNubHA2WmhkK3lUZytEYklJNm13ZW1JbGpobjNpM0NEWC9PdWhv?=
 =?utf-8?B?TldXVGNZaVpKS2Y4bVJjVC9aT21VRnE3cE1hdWJzd0J0UldFdGhjYSttczVi?=
 =?utf-8?B?akFlcUdsUzBWb1hvbkl3UDJiRzNmeFZYWU9JU3dQWVg4M3RaYnhFMC96ZUxj?=
 =?utf-8?B?RHdjNWo3RFFub2pMUUxWUDRtaE51TktKaXZQU3N0b01veXdJakRGenNpSDhC?=
 =?utf-8?B?NGhmS0tTZEE2VjRwZ2lvVHFMZmQvbGV0U1VSWkUrS1pUcmRWWmtJU0J3MWx6?=
 =?utf-8?B?V0JPSVJlMWo4citMZERmSGM0WFl3RXFsZEswRzhzdW9YenpMeCt6WkMyZWxY?=
 =?utf-8?B?dmZkTk9DeDhmaUQ3MEFuOTF4QmpyVkE2bkd6NndONEhpcXQzc0s1OFhiRjlF?=
 =?utf-8?B?OFRtZmZsZXJTME83U0FmcCtVTE5VTG1aUnpvUjVEb3ZKVkVjTnZMeE1iNzdL?=
 =?utf-8?B?YlRnT1BhZ1JVUGRxN2t1aG05S0FUbzJCdlhNYUx0WE9kN0lFVGJUckZMZ3Bl?=
 =?utf-8?B?L1MySG5OZVJCbUUrNWhUNHNCKzNQMTJ3MVFJSE9BcVNGbTJqOFVwMWdXWGhp?=
 =?utf-8?B?YStON2c5UG9abk5WZjNHaTZZY2hURElqVXZMSWRYZmdCcXNNNWFOWEJleEl1?=
 =?utf-8?Q?13Ke0bjVahI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRST1R2RTZJYlFZeER1SG5mR1NaVTVVUHM3Sm91NEYwYmN5b1pZcGRNN0U2?=
 =?utf-8?B?dW9HUVYzUkp4MTh1TXg4WVBCbndPWlBpOHd3aTNDYzNBOGJVTW16UWtVUTlL?=
 =?utf-8?B?a0RGeXpzSWtLTWR4QWFoek5Pc3JqdlRwY1pXV0hCcFd6bHErQ3RBUnhTU1p3?=
 =?utf-8?B?ZTNhZkhZb1lyOFcwWTBKOXBZSkVsR0d0S1Q4QUk4bGdKd3dIVy9tZnp1OGQ2?=
 =?utf-8?B?V1V6SEI0Njg3K3BtaTF5TUNGZjNxWjVZR2gySmlPYUVFa1k1Y0FpSEkzR3Yv?=
 =?utf-8?B?M1JFYklWL1JCM0E5UDY1TVZrS0x5R2NLcDl2LzZteHlaTFh4M0VvZWNhK1Vk?=
 =?utf-8?B?dzU4REpJQ25XYnpPYUd0aFJuM2ZnT082S1l1dS9xa1ZKNmdqZUJlOW5QSFIr?=
 =?utf-8?B?M2M3eFRwVVIwcHVrNStTU2ZZdXUwRlM2SVdmU2o0TFIxVGtiWm5JeS9BTzZC?=
 =?utf-8?B?TXBlMG44M0lJcC9VWkNlWDhkb2JFTG5OczBVcTBtK1NvYjRqa0FDVzRCampq?=
 =?utf-8?B?ZDBuZW5tSExEckZDY0RPSHJNQjFHc2l0c0VISnhjc3RwQ3NVS1d6ek1WZktQ?=
 =?utf-8?B?citnZHNJR3kxRFVaTlEyUzNibEdUL05PYU8wMzB3U3NINmgzOWZIanpjeHh1?=
 =?utf-8?B?Y21aNnNmcHBBcksrSUFVajhXbXRERlBKMUNjZmw2ckhKdUsyZzZWVFAvcWxr?=
 =?utf-8?B?UWxFTHExRitIMVhua0RwbVNBWVBiVy9wUFFuVFRxY3B3WVcrZUJQQ2IxelF6?=
 =?utf-8?B?QWdzSzZOZ21QZHRMKzI1VFdCSWdVSzZXNFAxM1RiUUp5M2JKL0RUUlI0MnBI?=
 =?utf-8?B?UmhGQkY1RWVDTWs5S0hCdFp5WlEzcDVGS2JrWkZORk9HY3Nhb1FFT0xjTDcv?=
 =?utf-8?B?dmx2eFdLMzFMbVRJWXVHM2VUUkI5M2VBSjI4TnlGc2s0UkRPTW9POXNZZU9O?=
 =?utf-8?B?OTBNNXo5K2czZDNselRiMHFxTVJNR1AzSU1ObmZhRElzNzlLNkJOMGljYlZE?=
 =?utf-8?B?NVJXeXozRElXWUJQWHRETkZhb0JFOXlaS25OamNyMkZOTGxUSTkwei9RNHdP?=
 =?utf-8?B?VEJncklwVmN1YXcxR1k2Tnl5UkdhczM3WHlJaU9mcEcwOEJmWGY4aUhXYzg3?=
 =?utf-8?B?eklpMllVMzJWU2FNTEQwaGtFemxJbEVMNGR3Y2Q3MnpYMTgxVXI1QmpRdjNF?=
 =?utf-8?B?Rk5vWWd5VkMzSk1kUjRsMmkvVUl0U2JVeTJELzc0WnhKUzBualFpQnZ2WFdU?=
 =?utf-8?B?cXpvQk5iQ0hBZy9rd1FiY2thdm1YM1dCNndLbjZzbU1qSXRRc3RSOFhnVkRH?=
 =?utf-8?B?UmhiUnAxVnZHeThSWE13Zi9FcVREYSswVjdRK2hVV3pRU2IyS0x2d2dGa2hD?=
 =?utf-8?B?Q0d2Rk5DeHhHNWEvN29Hekx2VVc0SVh0cXpBNGs3di83MEZBR0oxcXhHMk52?=
 =?utf-8?B?eVhEUGNBWm5GWkNydzVMVzBYUXltNFZBc0laOE5LRTVvNVUzV1pjM0F5OUFW?=
 =?utf-8?B?Ujk5U3pLSmNZVngvWElseEdZL3lZWEtqVnB3cHBXdk9qRnBvNUc4SDd5QlM0?=
 =?utf-8?B?TFFsRnQ1VWlnQVp6bjN0ajlwZURDZmFla240Y1NXdmRrUmpFVEJTTzBJWDhY?=
 =?utf-8?B?ZWljQW5yZGtxeEdLNG1YOUhDdDYrUU1DamY3dFh4ZkE1YjhtNkpjckdBRklq?=
 =?utf-8?B?SnE2MUtmbFM2REwzT1AxYlYzZVFxM1lRTjJRTUNjU2dqS1FuM0VvaDArMldO?=
 =?utf-8?B?OW56TlJvN2IrZFE2czRPbEJOQkdlQ3ltTGR3ZDczQXVmU0NuOG5yRW1wQ3VG?=
 =?utf-8?B?YW00Q2s2SFNkdzAwdnhqMEcyZEZvUFpYQ1BNbzc2WlNvdEZrSXNiNTRIczJN?=
 =?utf-8?B?MGpwdXJ5VzhrYXNaY3hkbVg5Q0VNNlBXb0RWbW00dlNNM0ZnRHlwRnhtb3I1?=
 =?utf-8?B?Ky90YnFENnFxOGpLVW9xeDJ1OTFSa3FhNzZrWEdjRXc4T2tvM3lKcFF3NzBV?=
 =?utf-8?B?a1paS0FndlAramdXNFp0YkFmdW9BWEUxdUNNK3lqelZxYzVzWVNZMzQ2YTV6?=
 =?utf-8?B?SC9icVIzcExkc0ZUSXpxcEoweDZFa0lIMXRLRCtycmgyT3p5OTAwekxoOWFT?=
 =?utf-8?B?WDVjRXIrak1ad3hOcWhsZzFSc1gwbHNVcVNGWER1ODZIa2U5MVQybmJ5UDM2?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e7e59b-6d9e-4d45-a046-08ddb30bc1de
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:04.3478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15QrgBL7J1aRjBXl0+Y22rx9g21UtsOcRXkbMzSsgazoCDOTwahfRGh+oVt5H1Qij6pALxbKQB1xnhfHztmzZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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

--------------KggnI2AqjSwAq0zwq9wPtxwG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 29-05-2025 16:46, Badal Nilawar wrote:
> From: Anshuman Gupta<anshuman.gupta@intel.com>
>
> Add xe_d3_state enum to add support for VRAM Self Refresh
> d3cold state.
>
> Signed-off-by: Anshuman Gupta<anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c |  6 +++---
>   drivers/gpu/drm/xe/xe_device_types.h    |  5 +++--
>   drivers/gpu/drm/xe/xe_pci.c             |  6 +++---
>   drivers/gpu/drm/xe/xe_pm.c              | 16 ++++++++--------
>   drivers/gpu/drm/xe/xe_pm.h              |  8 +++++++-
>   5 files changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index b3da88b12b35..7ccd9b447ace 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -433,7 +433,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
>   	if (!xe->info.probe_display)
>   		return;
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		xe_display_enable_d3cold(xe);
>   		return;
>   	}
> @@ -459,7 +459,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
>   	if (!xe->info.probe_display)
>   		return;
>   
> -	if (xe->d3cold.allowed)
> +	if (xe->d3cold.target_state)
>   		xe_display_pm_suspend_late(xe);
>   
>   	/*
> @@ -537,7 +537,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
>   	if (!xe->info.probe_display)
>   		return;
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		xe_display_disable_d3cold(xe);
>   		return;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5f9a1a358468..48ca0d8c4c45 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -20,6 +20,7 @@
>   #include "xe_memirq_types.h"
>   #include "xe_oa_types.h"
>   #include "xe_platform_types.h"
> +#include "xe_pm.h"
>   #include "xe_pmu_types.h"
>   #include "xe_pt_types.h"
>   #include "xe_sriov_types.h"
> @@ -510,8 +511,8 @@ struct xe_device {
>   		/** @d3cold.capable: Indicates if root port is d3cold capable */
>   		bool capable;
>   
> -		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
> -		bool allowed;
> +		/** @d3cold.target_state: Indicates d3cold target state */
> +		enum xe_d3_state target_state;
>   
>   		/** @d3cold.vrsr_capable: Indicates if d3cold VRAM Self Refresh is supported */
>   		bool vrsr_capable;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 46a99d6ef1a5..5ae1df345416 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -977,7 +977,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   
>   	pci_save_state(pdev);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		d3cold_toggle(pdev, D3COLD_ENABLE);
>   		pci_disable_device(pdev);
>   		pci_ignore_hotplug(pdev);
> @@ -1002,7 +1002,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>   
>   	pci_restore_state(pdev);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		err = pci_enable_device(pdev);
>   		if (err)
>   			return err;
> @@ -1018,7 +1018,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
> -	xe_pm_d3cold_allowed_toggle(xe);
> +	xe_pm_d3cold_target_state_toggle(xe);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c84b9b3f7371..b86e95493cb5 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -606,7 +606,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   	xe_display_pm_runtime_suspend(xe);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
>   			goto out_resume;
> @@ -653,7 +653,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_rpm_lockmap_acquire(xe);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
> @@ -676,7 +676,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_display_pm_runtime_resume(xe);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.target_state) {
>   		err = xe_bo_restore_late(xe);
>   		if (err)
>   			goto out;
> @@ -918,13 +918,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>   }
>   
>   /**
> - * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
> + * xe_pm_d3cold_target_state_toggle - Check conditions to toggle target_state
>    * @xe: xe device instance
>    *
>    * To be called during runtime_pm idle callback.
>    * Check for all the D3Cold conditions ahead of runtime suspend.
>    */
> -void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> +void xe_pm_d3cold_target_state_toggle(struct xe_device *xe)
>   {
>   	struct ttm_resource_manager *man;
>   	u32 total_vram_used_mb = 0;
> @@ -932,7 +932,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>   	int i;
>   
>   	if (!xe->d3cold.capable) {
> -		xe->d3cold.allowed = false;
> +		xe->d3cold.target_state = XE_D3HOT;
>   		return;
>   	}
>   
> @@ -947,9 +947,9 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>   	mutex_lock(&xe->d3cold.lock);
>   
>   	if (total_vram_used_mb < xe->d3cold.vram_threshold)
> -		xe->d3cold.allowed = true;
> +		xe->d3cold.target_state = XE_D3COLD_OFF;
>   	else
> -		xe->d3cold.allowed = false;
> +		xe->d3cold.target_state = XE_D3HOT;
>   
>   	mutex_unlock(&xe->d3cold.lock);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index ba550281b130..c6c2bd6187a5 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -12,6 +12,12 @@
>   
>   struct xe_device;
>   
> +enum xe_d3_state {
> +	XE_D3HOT = 0,
> +	XE_D3COLD_VRSR,
> +	XE_D3COLD_OFF,
> +};
> +
>   int xe_pm_suspend(struct xe_device *xe);
>   int xe_pm_resume(struct xe_device *xe);
>   
> @@ -30,7 +36,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
>   bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> -void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> +void xe_pm_d3cold_target_state_toggle(struct xe_device *xe);
>   bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>   int xe_pm_module_init(void);
LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>


--------------KggnI2AqjSwAq0zwq9wPtxwG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 29-05-2025 16:46, Badal Nilawar
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250529111654.3140766-9-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>

Add xe_d3_state enum to add support for VRAM Self Refresh
d3cold state.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/display/xe_display.c |  6 +++---
 drivers/gpu/drm/xe/xe_device_types.h    |  5 +++--
 drivers/gpu/drm/xe/xe_pci.c             |  6 +++---
 drivers/gpu/drm/xe/xe_pm.c              | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_pm.h              |  8 +++++++-
 5 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b3da88b12b35..7ccd9b447ace 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -433,7 +433,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 	if (!xe-&gt;info.probe_display)
 		return;
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		xe_display_enable_d3cold(xe);
 		return;
 	}
@@ -459,7 +459,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	if (!xe-&gt;info.probe_display)
 		return;
 
-	if (xe-&gt;d3cold.allowed)
+	if (xe-&gt;d3cold.target_state)
 		xe_display_pm_suspend_late(xe);
 
 	/*
@@ -537,7 +537,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 	if (!xe-&gt;info.probe_display)
 		return;
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		xe_display_disable_d3cold(xe);
 		return;
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5f9a1a358468..48ca0d8c4c45 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -20,6 +20,7 @@
 #include &quot;xe_memirq_types.h&quot;
 #include &quot;xe_oa_types.h&quot;
 #include &quot;xe_platform_types.h&quot;
+#include &quot;xe_pm.h&quot;
 #include &quot;xe_pmu_types.h&quot;
 #include &quot;xe_pt_types.h&quot;
 #include &quot;xe_sriov_types.h&quot;
@@ -510,8 +511,8 @@ struct xe_device {
 		/** @d3cold.capable: Indicates if root port is d3cold capable */
 		bool capable;
 
-		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
-		bool allowed;
+		/** @d3cold.target_state: Indicates d3cold target state */
+		enum xe_d3_state target_state;
 
 		/** @d3cold.vrsr_capable: Indicates if d3cold VRAM Self Refresh is supported */
 		bool vrsr_capable;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 46a99d6ef1a5..5ae1df345416 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -977,7 +977,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 
 	pci_save_state(pdev);
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
 		pci_disable_device(pdev);
 		pci_ignore_hotplug(pdev);
@@ -1002,7 +1002,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		err = pci_enable_device(pdev);
 		if (err)
 			return err;
@@ -1018,7 +1018,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	xe_pm_d3cold_allowed_toggle(xe);
+	xe_pm_d3cold_target_state_toggle(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c84b9b3f7371..b86e95493cb5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -606,7 +606,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_display_pm_runtime_suspend(xe);
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out_resume;
@@ -653,7 +653,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_rpm_lockmap_acquire(xe);
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -676,7 +676,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_display_pm_runtime_resume(xe);
 
-	if (xe-&gt;d3cold.allowed) {
+	if (xe-&gt;d3cold.target_state) {
 		err = xe_bo_restore_late(xe);
 		if (err)
 			goto out;
@@ -918,13 +918,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 }
 
 /**
- * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
+ * xe_pm_d3cold_target_state_toggle - Check conditions to toggle target_state
  * @xe: xe device instance
  *
  * To be called during runtime_pm idle callback.
  * Check for all the D3Cold conditions ahead of runtime suspend.
  */
-void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
+void xe_pm_d3cold_target_state_toggle(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man;
 	u32 total_vram_used_mb = 0;
@@ -932,7 +932,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	int i;
 
 	if (!xe-&gt;d3cold.capable) {
-		xe-&gt;d3cold.allowed = false;
+		xe-&gt;d3cold.target_state = XE_D3HOT;
 		return;
 	}
 
@@ -947,9 +947,9 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	mutex_lock(&amp;xe-&gt;d3cold.lock);
 
 	if (total_vram_used_mb &lt; xe-&gt;d3cold.vram_threshold)
-		xe-&gt;d3cold.allowed = true;
+		xe-&gt;d3cold.target_state = XE_D3COLD_OFF;
 	else
-		xe-&gt;d3cold.allowed = false;
+		xe-&gt;d3cold.target_state = XE_D3HOT;
 
 	mutex_unlock(&amp;xe-&gt;d3cold.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index ba550281b130..c6c2bd6187a5 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -12,6 +12,12 @@
 
 struct xe_device;
 
+enum xe_d3_state {
+	XE_D3HOT = 0,
+	XE_D3COLD_VRSR,
+	XE_D3COLD_OFF,
+};
+
 int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
@@ -30,7 +36,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
+void xe_pm_d3cold_target_state_toggle(struct xe_device *xe);
 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_module_init(void);</pre>
    </blockquote>
    LGTM.<br>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    <p class="MsoPlainText">Reviewed-by: Karthik Poosa &lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</p>
    <br>
    <blockquote type="cite" cite="mid:20250529111654.3140766-9-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------KggnI2AqjSwAq0zwq9wPtxwG--
