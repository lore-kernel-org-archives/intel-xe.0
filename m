Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142A5D49C6F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91AB10E396;
	Fri, 30 Jan 2026 08:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3SHPLcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0510E396
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769761359; x=1801297359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1JAsmlKdNrHHb7MU0amAxPqevfcLI5BGLfzNvpk3Pg8=;
 b=A3SHPLcfNTdt9A1l9XSObQYfffa+ny08z7usbOcAk0PNmx96mU/ZT0zV
 J8KO7XDBgBpfL+hhcz/NMkLDZIY1P2rGzOdmejYs+uU21tQUJjZHrnUk1
 j5K08psFH6eZ7VxGLu6tGsG+0ymd3k6ZtOF+ZBfTeEavvm1ddufrR2UmG
 OHElE9BHImqlonEZEg9JAtKa+wesqcJnqawOlv3qkt6hqO8bD8M8Bub5Z
 GmO0OP3OuyEierbO6C6P1bOZK9PcBQczsP5jtlkWr9rhoALZRRzL0v5mC
 odFfQVQgqxYnSIK4L/cGhhPkIwmC3/vb0KUNjmhrCW55ZqMDoQzBnKYrE Q==;
X-CSE-ConnectionGUID: vCmvvvU9SWOimamlUUMT2Q==
X-CSE-MsgGUID: 3/1NiyhFRzWCyzj1juHF3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74862521"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74862521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:22:39 -0800
X-CSE-ConnectionGUID: dDMAY+2tSBeFA5166RU2Zg==
X-CSE-MsgGUID: TXq5WeJbTcSObfmZHi8/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209224141"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:22:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:22:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:22:36 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWOXfhzTw5b4l+bcAwtMg4/jVqizlPs5pcbTlQce4XNEKV9FlL7Z50+BDciHACOlb9u4CgnYm5FftDY9C3CRz9JGDC6TFWbdrdozCeVFDjQAjqZAyATTwLODLgiqrpcx3Gs4TsSHu4/+YkGbR0vB1DED8stQIq6TC69FAMeQG3AH6tdYUe7qBEOH4BSKu6jxrG02s0cF7VgYCSd1ShjlJ00ejF3GkLELFDRqyBVG+MU1huuTu15ki5XSgKOT1odZYo0X81ejjIY6EfDK78FF2MNvmWuf8/mAjiymN0gdoXraKqX+dtLtblCkb1eLg/e9Oe8WuOAuaV0fmUelVTzGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeHXRsoBnrwuxLfBGeiYfUe841Z2q8nNERO7lDaOW5k=;
 b=We3649Az9bYVOV3G9zg0f/ju6Q/aUR2auS2AQdlizXdVJpIHwZG6It3fEdD+hvrYWX7ox7m9T01MKtUgquU9Z5WPJf4nFPdm4/qVeM6/NzCFV+0D68NwRKi/8UX7Ie4grtuSNwhpcsY19h7HLSzaXMBD3ZrpNcB2LEBhnp/TprhgSUqtKpMaPEfHKLIWSdgFVBc2UaBs7xzeQ1T+KEEc3+FvEFNIA4xv9sNf2nM9wwiUtgh0gDLr3uYhuus6mRXwuRDMEN9Sqq9aRrnTlqvr6kV0OpYBI7aZzeiZSOFJaeTYZ7jPM8xYfP44BLMf1I8FkTLH8u1gRajDozjCqhJ9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:22:34 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:22:33 +0000
Message-ID: <f7ff5e5a-f4f1-473b-bd53-01afe5cc5c89@intel.com>
Date: Fri, 30 Jan 2026 13:52:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe/madvise: Block imported and exported
 dma-bufs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-8-arvind.yadav@intel.com>
 <aW/ArJw02DG/6wHv@lstrano-desk.jf.intel.com>
 <06e2e9a9493b5389c9bf01304ea248dd3c86c8e4.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <06e2e9a9493b5389c9bf01304ea248dd3c86c8e4.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f6f3ac-882e-4871-c81d-08de5fd8b7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTY1VmtWVU5yOGVzM3dkVldURzU3QTRpT3NIUitKR3ZuS0YzK3NTc1RqS2pL?=
 =?utf-8?B?M3JlcER6YnlVWmw2Qlh5bUFMSmRKNSs0UFFLcVpHeXNuYWxLcEZoVVAyWlhF?=
 =?utf-8?B?UmYxdmNzS1BnVDJ5UlUyVFJLbWtWcERTUmxNampEbG9DdzNPc05xNWtTSzh0?=
 =?utf-8?B?TXVyQTU0N1FKemRiaUo3OTlCOUsxb2xac2lQM2N3blhERlEwWjBQbHZsT1FV?=
 =?utf-8?B?RWFndXNrUWJPNmlMNVdDVk9oVWQ1V0ZIK1dCaGY3aTFUZDBzS01XUERYZ3BF?=
 =?utf-8?B?YldSUUgxaG9TdFlOb2lpYXpmU0s4U1B2bnVxc1dDYUU3VTV5UkdYVXVvU1BR?=
 =?utf-8?B?RWZSOUluZ1pQTkJuV0VYeU1vL0hINEg0YXB2bkJRamY2R0duNHBJWExqTUND?=
 =?utf-8?B?UVNsTVZNbjhCM3ZKVnFwenJleEZlUzhqbEFjUnRTa0RZYTFRN1JtV3pDQW4w?=
 =?utf-8?B?c0ZMc3RLQ0hzRVBtVklqMjdadE5oZlJCSzBzUmpYS3BuY0xnRzFSWm4xSWJu?=
 =?utf-8?B?RDdYbVFydDRiOStoS0xTVy8wZzdNWXlOM1p6elpYNVB1ay9jbUM5UVk1RWdk?=
 =?utf-8?B?VFFNZXM2NGFhaWtOUEhyRGtOaGtIUExDT1VNaUtieE1sMWtWNWJyUmZHYVJB?=
 =?utf-8?B?ZWlsSXVBU0grNllvTWlFV3VjbXd2VjBib1EvY1NRd21RQXdkUFQxNDBVYXBL?=
 =?utf-8?B?eEFLbUIvNTB1L2dTZ3ZrLzFHY204ekwxOXBrL3FZNnBPMHVJdWxTa3dYRzd4?=
 =?utf-8?B?blFycm01ZVRhVGp5VEU0TnNZU2JlMzhQQ0swZTVIWVY4L05Eb1dab0lQS2hy?=
 =?utf-8?B?MmNDdzllVU05Q2xhOGMrZFJGZGxGN1lSWXJBY0tHcFYydTdrS0t2UGxLZG9h?=
 =?utf-8?B?UlE2aFdkOUtGTWFNL01PNjZUVFdKSkRtRHdpbWVDL3ROeXZOODhqTnJYY0VK?=
 =?utf-8?B?RS9YajA3dG1RbjNBUlNJbzF5dGttNUFmRHB0SEYvSXhGUEx3dlhiWW5xSWpm?=
 =?utf-8?B?clNZdVJmR2l4UStBcTN3WjJQR2hTVFZDQ3g2cUJQQ3BWellrVER3RDJJeVF0?=
 =?utf-8?B?N1Z5SEtKM3ovRzhLZEU1TFFtenhVaGF5SWZGWk9McUpsSVBpM1pZSll4SHFL?=
 =?utf-8?B?c2hUUk9XQStwalFmNnhVWjlWckNSdHpJMVczUlNPR0Q1eDF3RHZodHNDdC81?=
 =?utf-8?B?ZmIrcW5FSjNhU2hHVzdKNGNWa25sOFJHQnhVVVVvbmpvVWw2SlV0RUhIUG45?=
 =?utf-8?B?K2xsbmtObkZ0QTdGMVZaV0cvWTZsekRiT29RYU5IU2ZQYkxnVXFoT3ZKc3VN?=
 =?utf-8?B?MkxXbE1mcnlIU2oyMk4yN29mUW1BcXJvSnByWEl0aXA4UkUwUGx3OFNVdGNO?=
 =?utf-8?B?ZFplc0NnSVl4OHZ4dnNoK3hnRXBUb3FwaFJraDB2Z05icm1vWXlybUEwLzBs?=
 =?utf-8?B?dmpwWlN2UmI0YWZoR1R4aWR3d1hFWEJLVEZVcUlwdlF3MkpHUUVzeFgvQ3FL?=
 =?utf-8?B?RzdpSWs5RFBxRjlGVklyTk42amIxckxERHl1UUtMVWJVdy9xUmZwOG1VUi81?=
 =?utf-8?B?VWtNYlhhelpJMjlNUDkwSC9HSFJLVkJqOE1RQyszekFkNzJIQktjUXp2TU1B?=
 =?utf-8?B?ekQvMlRVdnlhUHZOZUhrRWQ5bmRCeC9kQUxOWlZMNS9xcHI0VUxIR3VqTnN5?=
 =?utf-8?B?emRHVVE5bXBUeGdVeWZnekJSOUt4S2N0MTBFazR5Wld3RFJpOVA0SkhDZzBx?=
 =?utf-8?B?RGtQMmpraWJSWE5Xd0RMZG96eXJQOERSYTM2WXpOMDlTYjFMT01aN3hQK2Y3?=
 =?utf-8?B?djVROFhpS3RuWUczTmtqRFBadStkVkVJTGJRUFhZQldNWDkwSWNvZnQ0M3A4?=
 =?utf-8?B?S3QyRENpYnFrRVFuZ3FiOHZ5OXlsSG5hVFhyZG1oSVl5aS84YTFqYnVKT1l5?=
 =?utf-8?B?KzZHNnNVdzd3eXpxME9ieDlNdExJb3o2Y21GbHNoaytyNDNtdkpFaEI3VVVq?=
 =?utf-8?B?V1I1RjBZd2xqVHJnWWh0cUlqbTBlYWUxUVVnZFhqTHQ3cWVmcU9MZjB6Y21l?=
 =?utf-8?B?azZKSWljR2ZoOTBMbGdIMzYwbWZsdkQrUXQvM3pvN3A2L0tVcDhkSkl2NHBV?=
 =?utf-8?Q?ZJ9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dytMaDF6R01Hd3NJazFOZThLTStFVDl6cGtNNWFlSUlxK08wc3czVkl5aktO?=
 =?utf-8?B?M0UzVS9rNEtYRE1FRkI0bGhwNkxoTTZ5Zzd1SlZVd3JzSjlDb0YzSXp0ODM3?=
 =?utf-8?B?OVVlZVJudXQ3aVVZSXVWQ0FKNktLNFVhUXR4bnlaMEd1RG9yaXQ5SWRhRzBG?=
 =?utf-8?B?RkIrTWtIUmtKMDdJS1JSdHk3cFQycE5YWkFjZVFqbEVBKzFhbFVJaUI5M3FY?=
 =?utf-8?B?UEJNN2lBQ0ppS2d0VmxHQUViNDVTSUFqdFBoQlZNdmFrQ3BCY1NadkNvVito?=
 =?utf-8?B?K29KV1NEbUpIMnNJWWN5VWdSdjhDcmROK1pYbEQxNHBrZUVMblE1cENFZEor?=
 =?utf-8?B?ZWI2QVVIMkxpOUpRc3dwUXEwQ25MM0VHUEI2VGFUNDUwcWlqcXdsTUFxaXJJ?=
 =?utf-8?B?N2FST2RoeEJITUtmRlkwaGRXRXI0cmZpNzdyRExZYkJZK1dvK2J4TUxrbEhk?=
 =?utf-8?B?amdvajBnRkNTa0NHODNHT3Y4dVBXOTdiS3JEbXoyQ3grenB0NFoxVlc5VmFS?=
 =?utf-8?B?Nk5JZmRDZHZBbktybGk0MWJsTDUxdDExeDhNMWlGS2lHT04vS2daVGE5OGVu?=
 =?utf-8?B?ajdPdFRDbXJ2UTU0cDY2QW11NEs3N0l5OHZNSHo5RHhJS2crakIvOU96Wm1C?=
 =?utf-8?B?ZUluOHV5VWJycStYczlUcm00TWNLcjE2M0w0SjNMQWRRVTk5dE1NZzhMUmsr?=
 =?utf-8?B?SDVpbVRVRG9YWEwxYklXRjRFQXAyZmNYUlBLL2VEQ0plNFdaeEtpM3F4Qkk1?=
 =?utf-8?B?a1AvUW9tVG1lTGFOQ1lFL3VrcnZkeEtxL29lNTdqWWFEK2pxZlBVT1FjeStl?=
 =?utf-8?B?aUdkQWtCTmpUVUJkMlFycFluK054WmhsdFJvelRLS05ZbmtQUHNycGhLcUNG?=
 =?utf-8?B?a3E1TXBBdUNFMTVudjVKa3hOK1V1eVc5ZVQ4bkdEUzBSemp1MWhxTU1KY09E?=
 =?utf-8?B?T0N3L0dQVVYwMWRtNGZGcmtEUzY2dzlrUGtuUzEwQVRkQzIyMGY3R3E0TktO?=
 =?utf-8?B?VVcwbGFmbWF4MytoZVVvNlZSM2lKT3pDWHBkVkgzVFArMFNHd0pkTWNOb0xU?=
 =?utf-8?B?cG54WTRwQjR5ZXJ5TUJydGd3S3k3S2N0UnlUc1ZBYkZlUnNoOTV1dlR0akJO?=
 =?utf-8?B?TGVoLzVtRmFJOWgxNE5wcVg3MlhZSjM0cWVxS2xmU1g5TXdVWkpjeEhhUFRX?=
 =?utf-8?B?SDBaUS9HekIxcFg0RDNTVmRvalVzcy9zNzB4aFlYajhlT2thUUNyczY1REJs?=
 =?utf-8?B?ZTRHSVp3dzFVMW0vcDBvYmN1ODN6aWVYSEhRdkF0dlVsRDFnVnNzaHovVTEw?=
 =?utf-8?B?RFhEbmtucWVhMHBXN010dllBM0tYb3pYcjBobk9rQi93NEZmbWZYZVhvdUNI?=
 =?utf-8?B?YmdIc1RkbkF3VUFRZFE1NGFFVUdydUdBZDI2NlYvRndRQXNjdVJRTGN1MWY2?=
 =?utf-8?B?cDBuZDYvcTVqYUh4T3krYjdSNDhlWXhwL0xXRmkyWVA4aXhRRCtGTEZlU00y?=
 =?utf-8?B?QmpzL1IxVDhObCt0bHNrOHI3NzUxUFJDR1hhaWQxSDBkQWpmbnl4UDRkNjdv?=
 =?utf-8?B?S0VnYktmZnBzTHpmUk9HR0RYUGVaUlBmZ0ttNjZKelJiQnliTlptMVZNaENq?=
 =?utf-8?B?TU5GbXRxZXRYemZhTDZuY3NmVjdwbG9ZSDFWNzVDM1ZHQTg5RHFvWldWc3ZD?=
 =?utf-8?B?a0FpQ1pnVTViMlVNWEQ1TzlGNTFzRVlYNyt0WlY2aGppWEtXdUlrU2E2ZjZP?=
 =?utf-8?B?c3VpQ1gzZ0YrdEdEamNlNE1pblZsNUZ4VkloRzA3Nnhrb3dHN1Jzc3Z2V0JU?=
 =?utf-8?B?TFVURVJhNXFNNDJmS004VFhUMDZqb0h5cTByWnp1bjJXS2kxTzlNaFd0Qmt5?=
 =?utf-8?B?QnpYOXUxVkJpVGI2LzBNaVBWYlFmTlZZN0VyUmFEdzRMckxpcjAxaGl2eU5W?=
 =?utf-8?B?V2RKS0E5Rm5zaVcvMysrRDRLQ2tsbjhnYjBWalFSTWx5SHpjSUd5R3dZbksz?=
 =?utf-8?B?UCsxQ0srSHExdW1lTlNyY1RjZjVURHh3ZXEyVmdERGsvZVNXT3YyNGJMT3J0?=
 =?utf-8?B?L2FQa0hqN1pEUG54TUJZM21yL3JZRE50T0dqV0pjeHlWVC9pM3BuVnlLekxp?=
 =?utf-8?B?Y3ZRWFQ2eFpYQXpEMUtWbUoyRU1MWllMWW02WVl2ajVBOGdmeVRUUEZUVmd2?=
 =?utf-8?B?ZmY3YjhMemlqS1QvYm8rQjZVdGVTdDVidUlnc3Y3K3BiNk54Rlh3R3ZBMFZt?=
 =?utf-8?B?QjRvNk9CZFZjb09tMzJVWVNzU1pueVR4cjJIck5pMjYreG1YYjE0cVNZR00w?=
 =?utf-8?B?NkJOeGM3NWU1a290cFVXTFRVdkhxWFg5bWZlckJFd2xpeEdUcU1Bdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f6f3ac-882e-4871-c81d-08de5fd8b7da
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:22:33.8950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGod38th0CY1jKmBSWNF1s4z/Ted8sG+yQ0A1Am4q9fGVvuHecC9EV8o2op0rTMrlSTojM451ArC2i9XQNEdpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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


On 23-01-2026 19:01, Thomas Hellström wrote:
> On Tue, 2026-01-20 at 09:51 -0800, Matthew Brost wrote:
>> On Tue, Jan 20, 2026 at 11:38:53AM +0530, Arvind Yadav wrote:
>>> Prevent marking imported or exported dma-bufs as purgeable.
>>> External devices may be accessing these buffers without our
>>> knowledge, making purging unsafe.
>>>
>>> Check drm_gem_is_imported() for buffers created by other
>>> drivers and obj->dma_buf for buffers exported to other
>>> drivers. Silently skip these BOs during madvise processing.
>>>
>>> This follows drm_gem_shmem's purgeable implementation and
>>> prevents data corruption from purging actively-used shared
>>> buffers.
>>>
>>> v3:
>>>     - Addresses review feedback from Matt Roper about handling
>>>       imported/exported BOs correctly in the purgeable BO
>>>       implementation.
>>>
>>> v4:
>>>     - Check should be add to xe_vm_madvise_purgeable_bo.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> @Thomas - couple questions below here I need a 2nd opinion on.
>>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 33
>>> ++++++++++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index 27b6ad65b314..5808fef89777 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -180,6 +180,31 @@ static void madvise_pat_index(struct xe_device
>>> *xe, struct xe_vm *vm,
>>>   	}
>>>   }
>>>   
>>> +/**
>>> + * xe_bo_is_external_dmabuf() - Check if BO is imported or
>>> exported dma-buf
>>> + * @bo: Buffer object
>>> + *
>>> + * Prevent marking imported or exported dma-bufs as purgeable.
>>> + * External devices may be accessing these buffers without our
>>> + * knowledge, making purging unsafe.
>>> + *
>>> + * Return: true if BO is imported or exported, false otherwise
>>> + */
>>> +static bool xe_bo_is_external_dmabuf(struct xe_bo *bo)
>>> +{
>> @Thomas
>>
>> Should we have this check more generic? e.g., if a BO is not tied to
>> a
>> VM, we don't allow purablity to be set?
> I think if NEO is going to implement this in one form or another, we
> need to support also external bos as long as they're not exported,
> since NEO refuses to use local bos.


You're right, and I believe the current implementation should support that.

To clarify: "external" here refers only to dma-buf sharing (imported or
exported), not to placement. System-memory BOs that NEO typically uses
remain fully eligible for purging.

The xe_bo_is_dmabuf_shared() check specifically targets:
   - Imported dma-bufs (we don't own backing store)
   - Exported dma-bufs (external devices may have active mappings)

Regular Xe-owned system BOs can be marked DONTNEED and purged under memory
pressure. We only skip cases where the BO is shared via dma-buf, following
the same pattern as drm_gem_shmem_is_purgeable().

Please let me know if I've misunderstood the NEO requirements.


>>> +	struct drm_gem_object *obj = &bo->ttm.base;
>>> +
>>> +	/* Imported from another driver */
>>> +	if (drm_gem_is_imported(obj))
>>> +		return true;
>>> +
>>> +	/* Exported to another driver */
>>> +	if (obj->dma_buf)
>>> +		return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>>   /**
>>>    * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are
>>> marked DONTNEED
>>>    * @bo: Buffer object
>>> @@ -200,6 +225,10 @@ static bool xe_bo_all_vmas_dontneed(struct
>>> xe_bo *bo)
>>>   
>>>   	dma_resv_assert_held(bo->ttm.base.resv);
>>>   
>>> +	/* External dma-bufs cannot be purgeable */
>>> +	if (xe_bo_is_external_dmabuf(bo))
>>> +		return false;
>>> +
>>>   	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>   		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>>   			struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> @@ -277,6 +306,10 @@ static bool xe_vm_madvise_purgeable_bo(struct
>>> xe_device *xe, struct xe_vm *vm,
>>>   		/* BO must be locked before modifying madv state
>>> */
>>>   		xe_bo_assert_held(bo);
>>>   
>>> +		/* Skip external dma-bufs */
>>> +		if (xe_bo_is_external_dmabuf(bo))
>>> +			continue;
>> @Thomas
>>
>> I think instead of silently continuing here we fail the IOCTL with
>> -EINVAL?
>>
>> What do you think?
> Hmm. If we view the export as yet another map, then IMO silently
> continuing would probably be the best option and consistent with
> sharing across VMs.
Noted, I'll keep the silent skip behavior for dma-buf shared BOs to 
match the "unanimous DONTNEED" model.
>
> Finally I wonder if we should update the purgeable state on final dma-
> buf attach.


Good point. Currently the check only happens at madvise time, so there's 
a window where a BO marked DONTNEED could later be exported.
Would it make sense to hook into the export path to force transition to 
WILLNEED? That would make the "export as implicit mapping" model complete,
though it adds complexity. Let me know your preference.

>
> Floating an idea here:
>
> Could the code be simplified if we maintain a map_count and a
> purgeable_count on each bo? Bo is purgeable iff map_count ==
> purgeable_count. vmas and dma-buf attachments are included in
> map_count.


That's good idea and would avoid VMA iteration. The tradeoff is 
maintaining correct counts across all VMA and dma-buf lifecycle paths.

For this series, would you prefer I pursue the counter-based refactor 
now, or is the current iteration approach acceptable
with counters as a future optimization? I'm happy to go either direction 
based on your feedback.


Thanks,
Arvind

>
> Thanks,
> Thomas
>
>
>> Matt
>>
>>> +
>>>   		/*
>>>   		 * Once purged, always purged. Cannot transition
>>> back to WILLNEED.
>>>   		 * This matches i915 semantics where purged BOs
>>> are permanently invalid.
>>> -- 
>>> 2.43.0
>>>
