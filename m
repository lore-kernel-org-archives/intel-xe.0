Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B9C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1787610E367;
	Fri, 26 Jul 2024 14:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fdvrmq59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B5C10E367
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722004562; x=1753540562;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eO7h0NNYMrQljRmIyf+LPeGhNvZO4u586WWtHT8JYXk=;
 b=Fdvrmq59YVtmv9QXeZXrSZhOapPiuz31zQhqcKhj6V3dao10e2C8fRlY
 ctYGoV41+tM+tRxsy/L50UoKJevsLoitgEmOZ+MZP/prZzwhbBFhEvBA8
 PplfGfQIdRgosKsrskoRMYKqH/ucpITfHI9K/IiHGLKdkbSBYPCFjNr+B
 Ru9x/EX1WkhgEtitdVga6QOseXmf+CgU7HymdpL82JLBKWXsEE1P2s2I7
 SteH82GlV6GQNBO/DJoEhDjy7cncV++IAL3I+6Le4VfdPBwJYE5TN2q6H
 7J2mxwOhEEqTbU3RmOTkBMwwTkZ/R8/6gMHDcGMkYlBl4UQiK8zWAjvz7 Q==;
X-CSE-ConnectionGUID: dTA7FRH+QP2rlOAY3YGdQw==
X-CSE-MsgGUID: 5BUxSKhvTE6AmI5WlQCPng==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19406660"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19406660"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:36:01 -0700
X-CSE-ConnectionGUID: DTkRh7FeRGK9nSX/LPEppw==
X-CSE-MsgGUID: 7d1dJrsaReCFHwi7pNzN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57447025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 07:36:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 07:36:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 07:35:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 07:35:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 07:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBAPxF2HKEbIcBf2ySsI0ffPN7eVle9U1xWUru0AhguxxxVI08g3Y3r+0G1mpEeakv4MewxfiJ7FDL9RTgfD+by1B5sS3yFBW5sGvCjBxwL926f5Zb1AXliQ1Bdjtn532CtsGQUeW23NA1SGbbkoBGhhhPg4ekP9L1HwoSHH8RmJvtX621v0E4ZTggKsRFAcs6feMa19Ecm6zq2gmlxOm56+bA5wyN4uDzJ1UV0kZDNx4zHlB01Ri0eJzrr2QknncuVibbVsiuiSeYDfazF/zf7DnyjJhAl1nPDlV+CuIVyPTHOd4wek9gMOpsDlq2viyaCiiIBYbJEbZ3m6BT6vUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtNHW0W0LnieP4qnBVhUTiJOlNB9zg1HNqtYiDugPMw=;
 b=Wyj6v4WW772kHek5PUIMu6+WiIqR+8nG0M908HjA+TVf4raps7kmkF4PUY7vMpXwJiLJTK4Caabpk19+GNtuCqdEHmwpnHhjvAVBK+klgMA6CFpR5DAz1i7SS2xzIugR0R9c2Bl8J8Zf6I8/OSF4XUszmCxFZ/RVLFirVELdbX04xo8gk1LxxJPLunTnhEEvm9QjHOw39UQLyPE5e3dFHjh1qM0tQvfOOd7Aa86iBeNYCImCSZb93Zmtg5Onp/rZp57nzd4yCCMBaPzZXiv68IWLhmG1FKaqGoHOwG3sqbvg8RWL3hubficK5lFKOJsLMfHM7JKtYLjj0YSvpZtvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 14:35:57 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Fri, 26 Jul 2024
 14:35:57 +0000
Message-ID: <f2d7776a-c152-4c7e-b6a6-f88861c7ae44@intel.com>
Date: Fri, 26 Jul 2024 07:35:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Enable w/a 14022293748 and 22019794406
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240719230525.2444543-1-julia.filipchuk@intel.com>
 <e46ecad3-9343-46f5-8994-818e6362dc87@intel.com>
Content-Language: en-US
In-Reply-To: <e46ecad3-9343-46f5-8994-818e6362dc87@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dbdc49-6b46-4a84-9f9c-08dcad804305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0JDSThDNFB2VzlOS0hwaGRDYmJicmwrVC81R1cwZzg0eC9IdkgxR3AxYlBX?=
 =?utf-8?B?YXNkajlSOWdBaUE2U1RWaE45d1ZjVEM0RS9Gc29PVFFrSHJocnNSZGFuY25z?=
 =?utf-8?B?T2dyZjFtMkpDMDZyVTRMeTc1eERKMzU4b0RUYW84R0loVjIvS2JWN0tKdHpM?=
 =?utf-8?B?OEhJYXc3elFiSnQycEVJUFhnVmF0NTMrYzRnaDRrRFczd2hXSitIV2xxRWJ4?=
 =?utf-8?B?aDVGMzlGNERBbFhxbThCNnEwaU1temJEQy9DMzRyVThkak53WXdESTlQKzl5?=
 =?utf-8?B?SHRqTUxDWFViSUxLRlZvZ095YVA2eXN0RXNtNjhXaW1NekdFWjdzRlFIends?=
 =?utf-8?B?WG8xM0J0MXJaMlFMZnI5empHbUVkU3Y0ODFiRnFtMEx4YXpwRldlM20wdnJk?=
 =?utf-8?B?UW54bWdQdHBxWEtlbXphMTBFQTJsUXVHODk2dGxyU2Q1ZnREbVl1UHlzcWRv?=
 =?utf-8?B?U2tQajU0Zlo2aWE3UFBOSGQ3Q2V1bDY3VmVJeVp4SlVKYlB3M0FoZ3JjWmtp?=
 =?utf-8?B?QmdGcXE2aFg0anR4eTRSajAweHhXS1Q5aUt1K1FMbmdXZUlOcmlyZTYrSyti?=
 =?utf-8?B?N3h1QU9wamx0NS9sNDhJc1VMZkNxZDlLaE9NMTdRNExTcGwyR053VjgrOFVw?=
 =?utf-8?B?NXIwVU5aeEVlVFN2VVg0NngzUkZIMW1rYVR4aExYVGNUOHRSZ3dhYTc1cExC?=
 =?utf-8?B?bXEvRVFCM1E1WlB1ZFJUNW1VM2dvKzVmQW5rVlZmTUxaK3FCMEVldjZlZE81?=
 =?utf-8?B?dXRtVDlSL1FRVHpxcTd2R0w3enl6bUdLamFRUXRsengyb2lrTlEyandNM0lW?=
 =?utf-8?B?azNYN09HOHJwMXVacGpkYzdRd3V5WWpjM1VnOTVaZjhQYkx3SFMxbWFqeE1G?=
 =?utf-8?B?SnlGTnUvTndwb0NrZHJhdXlWL3hUWmkzclJZNzFMTmk2N0FGNVRVZnh0RmRy?=
 =?utf-8?B?VWlITjdWbm5waFVoR1doLzlPLzJVRUNZOTRpT1J3VVR6cHVreHdwMzM2c2I2?=
 =?utf-8?B?UTZSR3hrdjV0WWhFYkNQQXJ6ZGN0bWU3TWV1VHExR0F2SDN2MVpHVW92b0tD?=
 =?utf-8?B?QitydzJja3dYaEhmTUVNZzhScUc0dnlkSXJENlFxU1NwSndTakJ5M1R5MEk5?=
 =?utf-8?B?c0tweDFFZzBzSkt3dzFYSm91RmlpcTJlTmpkTEVncVYvUmZxVDJXK3BsUnFy?=
 =?utf-8?B?K2xidkw3ZGN3UXl6dG01QXFtQkNvbHFqWFlPdUs0VCsrSFBuMVJaeU5vUWpU?=
 =?utf-8?B?V1l5WE1RRVJKNmZxVXgraEczeXcvWXlhUSt5eWxDZHNOL1E1VjlSRnd4WkdG?=
 =?utf-8?B?Rkg5MEZJSjM2VEZUa2t3WFFDOUdRUTR4aTcweFMxY1NSL00vcWVsMDg1bzJQ?=
 =?utf-8?B?MXNhbGFIcFREemhoWlJsNkdQNVhtdlh4bEprMDU0S0hJWDJ6WDQrbmgwWFVm?=
 =?utf-8?B?TmhjVWk4WnZBVWRrdjdVZ1p5WXB2eEpFSHE1Sm9mb1BOb1ViVmFYcDRBckpI?=
 =?utf-8?B?ZnhNWWhqOVFLQmsxS0o1UDJ3bm5JTC9rOEFUU2FHNHB5cGZZbExXN3hTUHAy?=
 =?utf-8?B?WnNlSWJyRnNYbnVBb3pUV1hLQ2p0bnFWbk9zeFJuQmlOajh3Z1FNdXdid2hh?=
 =?utf-8?B?M1dkSWErQk1xOTVFTzgzd0lwRzF3T2ZFVlFpMXg0YlVna1puOGRQRWVBN1h5?=
 =?utf-8?B?OTBERER0UEY0Z2lka3dMbjhuYWZNRTc3anowYSt0YlFjMjJFeUdUQStybWVp?=
 =?utf-8?B?K2xUZ0VmMXBSUmZwc1dQRmhHSERZLzZibnlPMm1MNFVvbE41TGsvVVdhTmMv?=
 =?utf-8?B?VkpCOXpiaElhdlFydTFudz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGJxY3NlOXpySUljcVl1V1NDcUl5enN2VXdxUStNeCtKQ1E0cWVzMm5EVXQy?=
 =?utf-8?B?YkpNdUNQR3d0SmVpVXB0Yi8xYjVDSTUvQTFaSFpoUmN2QUNZNXJtYnNTdXFM?=
 =?utf-8?B?NS9aWi9jbUxuMU5aeEQyR0k4Q3RTM002TVNUSW1xZnZFRXpKV0xUOFpKa2R6?=
 =?utf-8?B?WGM0UjgwRkdNUTAvd1RBRFBhenltbTRFT2trajFidTRtb2o0MEhNOUhoRk4y?=
 =?utf-8?B?OVBzTHkxR3BUNUM3Wk1oaDNFK0lNYjFvQ1RLS0JmT2pRU2labkRGbVJwYkpi?=
 =?utf-8?B?US9LT0hCbG1nMmF4NDJQMnBielZKazdCOGJqMFpjNSs3ZW1aaXcwWjJBYjE4?=
 =?utf-8?B?ZEpEeE1DUHQ0Ui9JWldBYk5ud2drMUR4c3Fib2VkY0JVWEtlUXV1SVVLQjFy?=
 =?utf-8?B?NTdFU0s5Ni9ERjIra3NnbVRpSHE3ZGZHTnBNWHRTVFZZa0cxUkJWTTJscEMv?=
 =?utf-8?B?Yzg0cld0NTZYdmd4cGxYZzIwWDIxa3NJWFpUbFY1RFAvNU04a0hDUVJrYjBZ?=
 =?utf-8?B?citqaUo0NU8zb0NoYmk2WnU5L1A4LzlyRER2MlFWZjM0YnUySXE0b3lsemVP?=
 =?utf-8?B?T2s0Zjg2UzFBTjc0Q2FYMFJXSHBLYm1EZ0ZBd3lWTW1PY3dzKzM4VGt2LzRZ?=
 =?utf-8?B?ZnVDbkJPRlF2MDdBRmhINU15OVZ3YUt4NEJYTXFTNXVTVHhLOFByUk1pR2ta?=
 =?utf-8?B?ajVVU1BsZXRYVm1XeklLR2hYU0E3d3REVGVZTkdTRmhtc1BBMTR4dHQ4M3lZ?=
 =?utf-8?B?N3lyam53MDVZQVRpM0RZUWI1RTh4UkZoRFNYS3pHZjRpZjlyNHJhL0ZGaU5k?=
 =?utf-8?B?ZWFzbURXb01IRUw3M1hWWUV0NzNMQzV0TVUyNTVNL1hnMm50L2JPeVFoQW9T?=
 =?utf-8?B?VXZmbktWa2MxWjZNZkhFWFlQRG1YTUdYQmlteTVsSVRuanJrTzRRbkpwcU1a?=
 =?utf-8?B?TmdsVkZuZWV2NUMrb3NlZmdBcHI1LzVRaGVuejY2aWtTMjY4K3ZBa3lqOG5T?=
 =?utf-8?B?OW5CWGpKNnhHdzk3c2FxYnVjbzcvZ3czV3RWQjRZYUFxdHIrVHBQeW5Gc3lQ?=
 =?utf-8?B?U0JvZHgvTFBCZTdSMlVyRE16ejFiUGxwbXhuTCs2NlBXM0wvUzladTY4VWtB?=
 =?utf-8?B?SVFPVHRlaHBYQVNCTFV2SjFiL2pmUFA1RlkvUG5wb3Vkd3NCMjBvazZTd3lL?=
 =?utf-8?B?Y1hQTlQzWHRlQ1VkUGZkMVNKMUtMVnZXZnlqbnFxeVY4R21vQ0lLbGdXczNu?=
 =?utf-8?B?cmM3WHh0OGpXRFE4cGVJNmdMa0dLM2JNTXZpZjY1VmxzbzZaMVJPaDZCWHpj?=
 =?utf-8?B?YWo2anRrOUpZZEpZVEVuL0QyWEN6K3pxeVRqR0tUdVFsQWp6VmlHdFJCZXpV?=
 =?utf-8?B?QXBzWmdMMDliajVKd3c5NjYwb3duZzJZVHFiTXFwZGNhY0ZOUkZKMEFlRWpj?=
 =?utf-8?B?WnZaL2x2d1ZkZHlIdkRaUVB5TDA0dnEwcmlJRlM2bERRQ3d5bm5TeHVHTG52?=
 =?utf-8?B?ZWtlbTFFN2Z4MDZtZm8zYzN6MEgzeE1xcE5nQ2JNblpsdVAxeWNFRHJTMWIz?=
 =?utf-8?B?VVRNK2hSMzJKVldPVy9xa1lhejEzVUwwNTdMWnpUMlAyNExPbnI1VWMzSm0r?=
 =?utf-8?B?TVBSemhYM0tCbkYwT0RFYzJDUFhKYktoSUxkWVNGaFJZUXdVNEFicE1MT05J?=
 =?utf-8?B?VDcrK0xqbjJ4Q3ZFQkVIdGtLWUU4M3d4ZWJObmxjM1BXdUoxZU5LMkZKMll1?=
 =?utf-8?B?cWU2Y3JqRmxJZm8yMlJhMGc2dmdZeHNnK09LajFPTzBIb3dkT29XczBvVmtC?=
 =?utf-8?B?MkZpYmdDcVp1UHpkS0lrK01wMFpKQ28reWh2ZHhmdEtQM0VWd1BSeWM4b0Ro?=
 =?utf-8?B?cDVwU0taYnNyRWp6STBLVldNaHg3di9SRUlReWhJVzcxU2FUNXViRjZMK0J1?=
 =?utf-8?B?N2VnMjRyM3NNcUNCWlEyS0NPbWVJd2lCYXJYbFROaEtLMExTYmVJWlhQOXJY?=
 =?utf-8?B?S3JuOGNsYjZFQ1dmWGpKNUg5cjJTWnlVMEF5U004blBaei9kaXhSZG85M1E1?=
 =?utf-8?B?YzBicGtRZDhiMnZ1am5hLzRxdmNLU095VFNIUENFSzVDN1FrcW1Mb05pRjBv?=
 =?utf-8?B?SGMvTUVmK0JLUy8zZEdYbWUwTWp3T01GZXJOMVd1WldaQ21aNk9TeS9kdzhq?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dbdc49-6b46-4a84-9f9c-08dcad804305
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 14:35:57.2907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm0GbuXEPSS5pT+EOpJSkgnxzSBOs2SQSLNUvPB87cmV48Zys/NHmz3mOI/Gq5xI3jBGiavVDP9RzGi9So6hOXKKb1AFSdv8jlAj/iPpmNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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



On 7/24/2024 2:04 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 7/19/2024 4:05 PM, Julia Filipchuk wrote:
>> Enable workarounds for HW bug where render engine reset fails.
>
> This needs a comment that the WA is only available from GuC 70.29
>
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>> This patch is for testing KLV workarrounds.
>>
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>>   drivers/gpu/drm/xe/xe_uc_fw.c         | 4 ++--
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>>   4 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 8f9f60b28306..6b30743a2f6c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
>> GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING = 0x9005,
>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE = 0x9007,
>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE = 0x9008,
>> + GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET = 0x9009,
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 1c60b685dbc6..3190bb4ce04e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -367,6 +367,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>                         0xC40,
>>                         &offset, &remain);
>>   +    if (XE_WA(gt, 14022293748) && XE_WA(gt, 22019794406))
>
> You need a check on the GuC version here. More comment on the version 
> below.
>
>> +        guc_waklv_enable_simple(ads,
>> + GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>> +                    &offset, &remain);
>> +
>>       size = guc_ads_waklv_size(ads) - remain;
>>       if (!size)
>>           return;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index c902f4a10f44..d145ce77008e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -105,8 +105,8 @@ struct fw_blobs_by_type {
>>   };
>>     #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>> major_ver)            \
>> -    fw_def(BATTLEMAGE,    major_ver(intel-ci/xe,    guc, bmg,    70, 
>> 24, 0))    \
>> -    fw_def(LUNARLAKE,    major_ver(intel-ci/xe,    guc, lnl,    70, 
>> 24, 0))    \
>> +    fw_def(BATTLEMAGE,    major_ver(intel-ci/xe,    guc, bmg,    70, 
>> 29, 0))    \
>> +    fw_def(LUNARLAKE,    major_ver(intel-ci/xe,    guc, lnl,    70, 
>> 29, 0))    \
>
> A couple of notes here:
>
> - The LNL and BMG guc defines are CI-only patches for now, so this 
> update can't be done as part of a normal patch meant for the full 
> tree. We're planning to move to the official patches very soon, so my 
> recommendation would be to drop this change here and just add the 
> official patch directly with 70.29
>
> - The version in this list is the recommended version, but the driver 
> will still load if an older GuC is found, so setting it here will not 
> guarantee that 70.29 will be loaded, so you still need to check when 
> setting the WA above. However,  we didn't distribute anything below 
> 70.29 for LNL and BMG, so we could indeed assume we always have at 
> least 70.29; if you want to go this way, please add a comment above 
> the WA to make it clear why the version check is being omitted.

Just realized that the latter part of this comment was incorrect. We did 
distribute GuC 70.20 for LNL, so we can't omit the version check in the WA.

Daniele

>
>
>>       fw_def(METEORLAKE, major_ver(i915,    guc,    mtl,    70, 19, 
>> 2))    \
>>       fw_def(PVC,        mmp_ver(intel-ci/xe, guc, pvc,    70, 24, 
>> 0))    \
>>       fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 19, 
>> 2))    \
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 540d38603f32..b0d7d4114967 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,6 +27,8 @@
>>   16022287689    GRAPHICS_VERSION(2001)
>>           GRAPHICS_VERSION(2004)
>>   13011645652    GRAPHICS_VERSION(2004)
>> +14022293748    GRAPHICS_VERSION(2004)
>> +22019794406    GRAPHICS_VERSION(2004)
>
> 2004 is LNL, but this also applies to BMG (which is 2001)
>
> Daniele
>
>>   22019338487    MEDIA_VERSION(2000)
>>           GRAPHICS_VERSION(2001)
>>   22019338487_display    PLATFORM(LUNARLAKE)
>

