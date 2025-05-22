Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E9EC54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 16:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A94E10E28E;
	Thu, 22 May 2025 16:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Py91GEC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6410E72D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747930351; x=1779466351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=p2V0Xp1rC21srIA4fNqTtAHGED5gyHWX4BxYlwp4NBI=;
 b=Py91GEC2D8NTco0WJmk10ax98BE8LMtWh+CfFNN69122SPdzegmtgqaI
 C/lIVJrXwkBQLNcGpKLKXNmbeH1VaXq/H+ZFN7JQKs4XraYTRKO9vnfUD
 vHK2YRO4xE1fQDC/F4+6kZG2xA1jOg+ok3tOU4udCClPYzeQ4dTxkLbT5
 kMoh4V4bNewZuozvV9Fs1v4d5gR+jMrqoDj37Eh2vuOk9vs+kotnAFSdd
 NkqFhEW4Qn/Qppi4fHJLIiHDU5AROBNzkNPlBbMTrNAzHbq2y4ZFb+NAY
 g1tuwZYx1xXHiSiFCNZl4h0dbLBf1kgyf6EEipqdHFxl53oRbO5WvH0fq A==;
X-CSE-ConnectionGUID: ToKwi0tzSUOkDg+TiZQSYA==
X-CSE-MsgGUID: z7Lxn9OiQqOrxEgstPwDow==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61320969"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208,217";a="61320969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 09:12:29 -0700
X-CSE-ConnectionGUID: 4FRV7QeyTvOq+93VnLmIFQ==
X-CSE-MsgGUID: Rx21dcRiThSrZEOPvttLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
 d="scan'208,217";a="163931322"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 09:12:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 09:12:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 09:12:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 09:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHKLNeJaCXKXW0FT5y9cjhF9bWgiMnxStUNW90QKum48RfPvTtm13/qsGWdMzXjgXJMW3sDCd/BgPhTk4Zl2PwhNArqIc4yIWm1UCTeER2mnJkVYO7TXpqOflVFf9dWObcvwpfq3N90iSL+qZc4z5EqufePmpgboxLHhHJ/fHB1c0tvClZx9oUri8REpkqo+FxtG3s3fSKR4zXtLKLjizww37pmwgeQZYOFLoN1P+8YN2z8i7q40QP7fNO8XcJAmdweSG+L28KIUrMyKd6MJREN6EkOQJ9UbgD2KJDl0pBUZs2BcVqgBdyaPtwNUduDQhN6j7PZusvfIJPUB0wg3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WgwOQe7er8cogsLJJXuRPbm9RWLzZnN9vdoqftnMwE=;
 b=JuTATEM3tu3XiuVCrFecOnFAgeriyclN9Frs25e7+hKQnwvKMhAin4T7mOwvyg0jy+4W7p+v+M4zmtTdNnL9Hgy+Puc5ArHs9oHGmHqf5mhLFgro1znlzaEFtJb4xaGDdbwVjLVwpqB3VmfkdX1xCOG5709OsMihjHbGJ8bgkCcN9uAV8wpZPmoRv9f0kjNV1kifu7zO5eo7Ejs2Ufrs+qXfOqxrv9HIFR2PqOOnL7Cb1KrKkWE/t1oaebrrQa1TAtX0b6Aj6e3Cqdib2LWxum420QwX9bhPlvQDhVYLYveqkrZSZqiaww9aSrbcr3OV+VDYJMG6qLjiN4zGyWlB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 16:11:57 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 16:11:57 +0000
Content-Type: multipart/alternative;
 boundary="------------QsC00eAon7G0n2sQSBZPfhdW"
Message-ID: <f0dc1f3a-e2ce-465c-b74d-daddffc2197f@intel.com>
Date: Thu, 22 May 2025 21:41:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
 <dfd48f5d-3238-469f-837e-8df09176a81a@intel.com>
 <lcn5wm254jscwodpvpwzkmqioe7jyke5yn7hcm6vjfpnyn23hj@42zcznbfhsui>
 <aB4lx1BMVH_c2JUe@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aB4lx1BMVH_c2JUe@intel.com>
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH7PR11MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: b19900f2-0680-4885-5279-08dd994b6035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WklROWg5ZzZlL1dCZXVSdENvMENqTmtXcFdlRkJDd2RqWnhJVHNKVmZvSnN2?=
 =?utf-8?B?eHhKMDB0eVRkOC9Oa2pKajN5Q1JuSTdFUnpBL3J0OVU5NlJiK3JYdUFyN0FL?=
 =?utf-8?B?LzhtWE80N0NDV2w0MHEzdGE5R2RNYmFlQjBXclJIZkwyL0hxbWZiaWJQZ09m?=
 =?utf-8?B?S1IzQVE3bVNUYmtNYVNtK0laZjBCN2xuUHQyQ0ZzYkM1NzRHZHJDZHpGcm1Q?=
 =?utf-8?B?cXZZc0lZYWh4WjRrUEE0MFVXTjhvNlIzOU5wYU96YUZBekxDcEVUSys4eWhO?=
 =?utf-8?B?MnVPL0N4d21EeGE1bktyaWNySHFXZzR4a2ZvQmMyUnd3NVFBS3dnWTNiRS8y?=
 =?utf-8?B?cFN2cG5XZlg4bFJKcjl5YlZMbFBvdW1WODFlVVRSOGd6Z2JZT3kwTVRkcWRv?=
 =?utf-8?B?bFBOSTdoT1FzMFBvbC9ybFBSQktBbE1JZFZGKzBUNmY0aEF3czZaa3pLRXZI?=
 =?utf-8?B?dVdMcHdyb2k4YW9aWm94bmNUVjgwZjVXK1VveE45ZUJpY0RmUnVyQlJCUUE3?=
 =?utf-8?B?YXlVc2RJYW5tSmNsUEFveXM4c1FpUmFUWHFXa1NacWhDU3gzdmpFdVlYWVVY?=
 =?utf-8?B?SXp6aFo4bDQ4S3I4Mm1ma3FhUUhZN01QUWtteW9mV1Q2Y1A1ZUs0WWt6MDlG?=
 =?utf-8?B?Z2RJN2d2cnlxR2NvVklrZCtOOVo1VGlrZ2xkRUVlSm5CYXMxVFdrQ1p4U1lH?=
 =?utf-8?B?V3Rna1BzNjgycTV3WGhKcDdJVE5FZUZ1eXEwajRQUjZWN1lGM1hVK2E4VmI2?=
 =?utf-8?B?aTdQVW5McTRJOVcwWmdCbkROZStoWDhGVzVUTGV6QVg4QW1jbjQ1K2VyL1h5?=
 =?utf-8?B?NDdjeW1aSW83MlVyOWQ5dWx2UGlXYVcrWlBreTFGZktMTnRHS3pDVXZwcmxP?=
 =?utf-8?B?T0ZBY29DVTlEMnBBa2EyT1lJckw5MWZjMXJERElzenBveTZpQWtFdlMrSVJs?=
 =?utf-8?B?VitrZzVoK0pzb0dycURuNjhmWEd6eDd6MGNIZ2hVY3J6amR2WHd3eVFReUlC?=
 =?utf-8?B?NkQ2OEFXRTg2bmR2UzBZMHNKRncyRnVnRmcrZjAvY0tKSk4yZUFOTmM1YVB4?=
 =?utf-8?B?V0Yvb29uTlREU1RZVTZOWjNpVGFJODNhOHE0RS9uRE1XeHdpYThGZzAzTGZX?=
 =?utf-8?B?bUgyaWtyUHk0VExRK3Z4R2dUU0VqN2d2OTBvZnV4OXhpNmJ5T1FldGJIa1Ba?=
 =?utf-8?B?NkdaOXliMExLalc0SG54MVdQa3Z3RkZlS3o3NVlGbmsvcUkxYVN2ZDVQZ0pp?=
 =?utf-8?B?NnlMRldkU25UM1RIRkhzMWdBdnc0c2wwdS9hR284MWMrTy9uVWJ6U3dyUnpK?=
 =?utf-8?B?eTFMOUlBdEM2WVBxaW1McUlKTXNXelNjWVNHL3hnTUVrZTZEK3RVQjhyT01h?=
 =?utf-8?B?c2xMandFeThTUHdHbVlCa3pUUXU4eWt3blVNQk1QMHNLbmVVYnprY3BiNFVZ?=
 =?utf-8?B?Z0Fvd3ltTUQ0RGg1SXVtSlJUQjk1dUNuWjFhVUEvSDdST2FGWVZBRitrSFor?=
 =?utf-8?B?cnA3L2gxQ1lLb2R5N1VvRmhNVWM3TGdtZndBMUNrcU5qMExXRW1CdmhnM2ZT?=
 =?utf-8?B?MTNibENWNmNVNWd2S3U0Q3VHd0FveC9NZ0dtazFCdEpUOXNaYkh1dFhRUUln?=
 =?utf-8?B?aGRJcU9wNU1uQmFvWHhiY0tYZVdka2ZIRGIzOUJPRWpJcHpNUW9KVzh3UDdO?=
 =?utf-8?B?OUR1bTRCTklQOUx2KzZpSXFCdGVQNTl4ZmdNRHBIaENiTVJ5cC9VWGZ3dDI4?=
 =?utf-8?B?bk5vZHNuMEd2YTNQd1piYm45cFZQMnpvK3ZaYnh2bTJxUmU3NzhCZEM0WWo5?=
 =?utf-8?B?Uk5PYS96bThiZGhFVXhrZnZpTU1WOEo2RWF2aEhaK1llRlRabEZna01IeXQ2?=
 =?utf-8?B?RTF1eXh4UFR4VDUrRk9yTFcyK1MrZHNjNlZyY2Fjb1NYS3J2cUlkS0xmQW5y?=
 =?utf-8?Q?1I5sPQiiY44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtKc21NdWxGUjBvdDBKQTgzem1qSWhZUXZSTkM3b1lNclJHY0ZPVnN4YUhC?=
 =?utf-8?B?b0x5VVNYbFdRUmlvWU5BVmgzTTFFRXdEUStpbkhzbmNTUFZaZ2RSNndyZ2pD?=
 =?utf-8?B?U3VlekxUZUU1eWtER2tlL3NjVHlTRU5TL0p6T3E0OTNId2syVVU1ako4WWUy?=
 =?utf-8?B?a0NFMXNuaTB0R0ZTS0l6aHg4VzZQRXdFTTdmK0FJZGpDSUR2L2U5ZXVnTjFM?=
 =?utf-8?B?VXh3WkNPdCtaa3V5LytpTmZWdDBDSjlFeW95QnRQTktsV3YrTlROUCs5cmow?=
 =?utf-8?B?d2FwYUFMUkExaEd2TTI1eTMyaTNTZkR4emZueThLeVRCTHlsd2RWYnR6Q050?=
 =?utf-8?B?WHJwcGVST0pNZTh5VkZPMzg3N3ZVc3phV1E0U1h6Z25rZDRSbDYzNk9lZmlv?=
 =?utf-8?B?ekFFRnpPay9nSEk1c2xMdWk2UEdtUDVPb0tZSUZ0SDYzdEJFTTJrR3hjZVlw?=
 =?utf-8?B?V3MrdURlc1lWNi9LTnFhaVR6SnpDb3JpYlNSQTJmWkgrVER6Vk9WTUdic2pn?=
 =?utf-8?B?WmZpUW9VMFJJa1d6Y0IvNmxTRDhMVzJnOEsreEJ3Ri83MU1JU1JyZW1UWWZZ?=
 =?utf-8?B?UFgwNkdRZHRZRExQNXpBdjhGN3dGS24yRTRzMmlsWm1PNkp6YzBFUFMybVhm?=
 =?utf-8?B?eGVqRngzOUkxaDdkcjlKSjI0aEJHNzE2TVRTVE9scElWT0h0SDk5QWE0ZVlz?=
 =?utf-8?B?OEJjVmsvMExCRU40emRWd1lPVlVzZFZoTmJ3NWFqLyt3Mk14cjBRMUFYU2dj?=
 =?utf-8?B?RnE1ckNaZExXSStSRjZWOEdXOFJFd2VkWVhQQXlaR3lMTlVEajhDTHBUbUJk?=
 =?utf-8?B?ekZVcU81b05IMDFxNEVLbExCSmFMRGcydHgraVRyWTlRVUZ2M1BPaU12UDUv?=
 =?utf-8?B?WlhmRzhlSVdYck1yUU5raklPNnlZb2hVQkUrUUxtdTYyaFVtNXZDSmJLTmxz?=
 =?utf-8?B?VldLUDZKRlFvd2kvWWVZK2lUVkZaMXBOdldEWThuTWNMQlhJQy9YWEtsck5t?=
 =?utf-8?B?UUZ1KzgyM29kMEZMVWcxdHlRVXRnT1FEa2k5VHNmSVVEQWFXQTdrUUhuS2FW?=
 =?utf-8?B?Y1l6K3BPQUVhdG5lOEdwY3EyZnpSai9nV0xIaUV2dk15TGt1NFh3ZlJ0WHVL?=
 =?utf-8?B?aVFKZksrdFdvdFNDTXpxVElnWUFkT3NaNlVlSkV0NmVNWkJlcXVHUVM5ZS9Q?=
 =?utf-8?B?WUVURDlOMXNKYWh6Myt1TStsNTkxY1ZnRy9YaWt0OXFydjlhQVFNa0pDSGUw?=
 =?utf-8?B?aHRxOWdEeUxHTm42a1pVSnFIQmJoMklYbGg4cXE4MTVtRHBPU1EyMDdNL2t2?=
 =?utf-8?B?WUtaOVdTdkVweGp6eXJBcFR0YWdWNy9NT1I4Ty9uV0tXaFFZOTE2ZDRKR1pV?=
 =?utf-8?B?dEt1UkpUbEhaOGdyT1pYUU9rNjF6Z1NRbkMxMndDTlVVUmpLUnRZT2tHSHox?=
 =?utf-8?B?Z052cENMRm1tTzVIQWhqSWZCdTNQNmM1RnJkcEpuKzVVREpXQmhieXdadk9T?=
 =?utf-8?B?YjFDVTRSejlobGZXS1RHdEwyZ3FNWlB0bTdrMHJWYXRzTVhhZW8yeWF1bkoz?=
 =?utf-8?B?ZjdzbEFOTVVMaFdZekhuSTRSUm5BNm1LNXJqZEpVa0tjVU9zck1NU05uUHUy?=
 =?utf-8?B?U0xxNWdqYy9JSjkrOGozeDVCWkdvRzJIVjFBSTczUFF5czFHc0dNM3JvQWkz?=
 =?utf-8?B?SS8wWm9CYkx1U3B1UVhGQ0g4MnhHa1RlMU1YRUUwM3NTUFFlUUczc3RqQVlm?=
 =?utf-8?B?S2d2LzhDUkNnRnM4MjZLbHFoNXJZWUFGaE83d1ZMNXBMbHY2ZG40RkRydWo2?=
 =?utf-8?B?TEdIZTNYRUlWSDVqWDJ5bEZycW9KdGQ5UlpHREtTL0VVTXFhUmt6Q1dvYkd5?=
 =?utf-8?B?SXR4R1pWT0lncGV6SitkeVVwK2lHQ2JQWlByUEhXN3pVeng4NzRIVURSL2Nu?=
 =?utf-8?B?R1dlZ0JqUW5CQ3daTlpjQmxqRE1kWHFVNG9pSHIvMXpGOGhUaXVvdXFhay8r?=
 =?utf-8?B?ZzAxSmxSNmtZRzVNcktBcUo1Z0ZtN1VTVTRoZGFGRVE3QkVLYXlDZ1ptLzgx?=
 =?utf-8?B?elJhM1lLK2pyeXNEbnF2aDV6dldVUnBjRFR4cW1LQzlNcngrVmpvSW5tVWlp?=
 =?utf-8?B?NGhYeHhIODlMSXJtTE5kVHQrbmdVY1JtNUdKakR1YzJKMHNvc01yMmg3NmJF?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b19900f2-0680-4885-5279-08dd994b6035
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:11:57.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fbx4vKqYYzz0t5RE4tl7BUXm1g2VGAd5CYMg1Bgg9CBzY8NZc0SzbuGrbJa//hIxc2EuIuG0tezt31aeM/XITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
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

--------------QsC00eAon7G0n2sQSBZPfhdW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-05-2025 21:26, Rodrigo Vivi wrote:
> On Thu, May 08, 2025 at 10:47:59AM -0500, Lucas De Marchi wrote:
>> On Thu, May 08, 2025 at 11:28:29AM +0530, Poosa, Karthik wrote:
>>> On 22-04-2025 21:30, Lucas De Marchi wrote:
>>>> On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
>>>>> Add wait for LMEM ready during system and runtime resume.
>>>>> This wait is there in probe and is missing during resume.
>>>>>
>>>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_device.c | 2 +-
>>>>> drivers/gpu/drm/xe/xe_device.h | 1 +
>>>>> drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
>>>>> 3 files changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>>> index 75e753e0a682..4c0d9eb51d1f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>>>>      return !!val;
>>>>> }
>>>>>
>>>>> -static int wait_for_lmem_ready(struct xe_device *xe)
>>>>> +int wait_for_lmem_ready(struct xe_device *xe)
>>>>> {
>>>>>      unsigned long timeout, start;
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>>>> b/drivers/gpu/drm/xe/xe_device.h
>>>>> index 0bc3bc8e6803..60bc92f9ab22 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>> @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
>>>>> int xe_device_probe(struct xe_device *xe);
>>>>> void xe_device_remove(struct xe_device *xe);
>>>>> void xe_device_shutdown(struct xe_device *xe);
>>>>> +int wait_for_lmem_ready(struct xe_device *xe);
>>>> if you are exporting the function, please follow the naming:
>>>> xe_device_*.
>>>>
>>>> However, I'm not sure this is really needed, particularly on pm runtime
>>>> resume. At the very least it needs better explanation in the commit
>>>> message. Do we have any known failures this is supposedly to fix?
>>>>
>>>> Lucas De Marchi
>>>>
>>> While there are no current issues without this check, it's a prudent
>>> measure to prevent any future problems.
>> no, not without proper justification. I see no reason to wait for it in
>> pm runtime resume. We shouldn't sprinkle sleeps in the driver to be
>> prudent.
> We need this on D3Cold -> D0. If power went off, during the wake-up, memory
> links needs to be retrained and this is an indication that everything went
> well on memory bring up and that we are able to access it from the driver.
>
> That said, I believe the code should be changed here to only have this if
> d3cold was allowed to start with, and not in every runtime resume.

In runtime resume this function is already under, under d3cold.allowed flag

         if (xe->d3cold.allowed) {

                 err = xe_pcode_ready(xe, true);
                 if (err)
                         goto out;

                 err = xe_device_wait_for_vram_ready(xe);
                 if (err)
                         goto out;        }

We shall add the check in system resume also.

>> Lucas De Marchi
>>
>>>>> void xe_device_wmb(struct xe_device *xe);
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>>> index 4e112fbacada..2e59670660c1 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>> @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>>>>>      if (err)
>>>>>          return err;
>>>>>
>>>>> +    err = wait_for_lmem_ready(xe);
>>>>> +    if (err)
>>>>> +        goto err;
>>>>> +
>>>>>      xe_display_pm_resume_early(xe);
>>>>>
>>>>>      /*
>>>>> @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>>          if (err)
>>>>>              goto out;
>>>>>
>>>>> +        err = wait_for_lmem_ready(xe);
>>>>> +        if (err)
>>>>> +            goto out;
>>>>> +
>>>>>          xe_display_pm_resume_early(xe);
>>>>>
>>>>>          /*
>>>>> -- 
>>>>> 2.25.1
>>>>>
--------------QsC00eAon7G0n2sQSBZPfhdW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-05-2025 21:26, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aB4lx1BMVH_c2JUe@intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, May 08, 2025 at 10:47:59AM -0500, Lucas De Marchi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Thu, May 08, 2025 at 11:28:29AM +0530, Poosa, Karthik wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 22-04-2025 21:30, Lucas De Marchi wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Add wait for LMEM ready during system and runtime resume.
This wait is there in probe and is missing during resume.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
drivers/gpu/drm/xe/xe_device.c | 2 +-
drivers/gpu/drm/xe/xe_device.h | 1 +
drivers/gpu/drm/xe/xe_pm.c&nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++++++
3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c
b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..4c0d9eb51d1f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;return !!val;
}

-static int wait_for_lmem_ready(struct xe_device *xe)
+int wait_for_lmem_ready(struct xe_device *xe)
{
&nbsp;&nbsp;&nbsp;&nbsp;unsigned long timeout, start;

diff --git a/drivers/gpu/drm/xe/xe_device.h
b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..60bc92f9ab22 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
int xe_device_probe(struct xe_device *xe);
void xe_device_remove(struct xe_device *xe);
void xe_device_shutdown(struct xe_device *xe);
+int wait_for_lmem_ready(struct xe_device *xe);
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
if you are exporting the function, please follow the naming:
xe_device_*.

However, I'm not sure this is really needed, particularly on pm runtime
resume. At the very least it needs better explanation in the commit
message. Do we have any known failures this is supposedly to fix?

Lucas De Marchi

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">While there are no current issues without this check, it's a prudent
measure to prevent any future problems.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
no, not without proper justification. I see no reason to wait for it in
pm runtime resume. We shouldn't sprinkle sleeps in the driver to be
prudent.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We need this on D3Cold -&gt; D0. If power went off, during the wake-up, memory
links needs to be retrained and this is an indication that everything went
well on memory bring up and that we are able to access it from the driver.

That said, I believe the code should be changed here to only have this if
d3cold was allowed to start with, and not in every runtime resume.</pre>
    </blockquote>
    <p>In runtime resume this function is already under, under
      d3cold.allowed flag</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;d3cold.allowed) {</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = xe_pcode_ready(xe, true);<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = xe_device_wait_for_vram_ready(xe);<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<span style="white-space: pre-wrap">
</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
    <p>We shall add the check in system resume also.</p>
    <blockquote type="cite" cite="mid:aB4lx1BMVH_c2JUe@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Lucas De Marchi

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
void xe_device_wmb(struct xe_device *xe);

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4e112fbacada..2e59670660c1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;if (err)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;

+&nbsp;&nbsp;&nbsp; err = wait_for_lmem_ready(xe);
+&nbsp;&nbsp;&nbsp; if (err)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
+
&nbsp;&nbsp;&nbsp;&nbsp;xe_display_pm_resume_early(xe);

&nbsp;&nbsp;&nbsp;&nbsp;/*
@@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = wait_for_lmem_ready(xe);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_display_pm_resume_early(xe);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
-- 
2.25.1

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QsC00eAon7G0n2sQSBZPfhdW--
