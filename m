Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E976BC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 05:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC410E4B8;
	Fri,  8 Aug 2025 05:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kreOK/Tq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB6710E4B8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 05:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754631467; x=1786167467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+qYMtjefPYH2uUK//PN5OEQk0oVKM8Gq3tlCCsEG/M=;
 b=kreOK/TqgFlbWdZb9tkp2n2oy/8h2sTX/ZxnVZYWBPIKOiy/veq7ZB9L
 GiPwzXa9pMCMw+JDQbSi1SW/cKu1G+pT6GBdHSgMEf1GUGqai7thBbP4a
 /VJ4sohol0QdCyCC2NCnMbykM3ctWuqTN1iCi22WuNnW84F+uDN0prppc
 hRoLJL1LZiHnF8pA7ANj4gysYbPHp4Ml+GKaEHn5/aIQ0KcisW9R7Awum
 B/5mqTiewNbig8bpAOugDoocBx5KMdkHTBFxazDN25oJaQW9593MifZKd
 ae9U9O9eof4P18CSngF8AoAVjFW1SgKrNKnJPrOIvmjYAPwbOoQotrLGq w==;
X-CSE-ConnectionGUID: XhYB7eB9SWOod3XJWjF0rw==
X-CSE-MsgGUID: jeZwvFmFStq5yLIhK/ASkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74553371"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74553371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:37:47 -0700
X-CSE-ConnectionGUID: f4d4Ebe1Rsqg0YIhv5L+kQ==
X-CSE-MsgGUID: dTiPvaLASAyYCSg/m6KTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164902743"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:37:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:37:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:37:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InwXh08X+9jPUFmHWQQA8Z/cwkZe5ipcqFinGGP9iaJ24CTkji8iJ8bXezazS0BS5JBReovRQCjGqnT6s8H7dZpq6Zjw5oDLR5jsDr4s/R74WNVdfIZaqvfR7njUcEzFYWSRBfaAi2gqQQleaeNJvCTqVxpE0n9eq/E6tuBmuWB5LSyUYmuc/646g25bZX3FZT500/O54O2n0j9r09hCOB0SJ8isuK9ZFVJcUCv1DkLfN7L2X3qaJArlfif21iCKVU46ymPBBm1Q9O4bhzmL254Otw4V1uC9hfnL6qahplAmHRxOaxNu4xKD/baDBNLdQGt9HHbm+ao+VURMJZWwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+6tSj1KkmxfSk+N4k0MMvAapcHBz4v+3zu6gXNwsP4=;
 b=Vflf04d8yXZDx5F/eVirLznxbanavuGV4Sh1ZbYWX3YtzwiTdUgDqioCVZXAe5XRzva8dw4vWHJuH3l4ojhT97h9tvnkA5fYZslPPp+OskEwInmhKtJw7Q0L2c6AL6v7kI836wafQuQq5FXjfJxnwsoNDkFCd+sw0ZP1obeKnlkLYtRzJ7YBl1t9fxK5IC5fEegu89/Ov3I5hSE4N5j4JB8UKRxaF+2llEC2Chm1GOzALIaosZ9joXZ3C35G0cVhDzPOXZ/OHlSbaVkqs2Znf/iNAEVJUxM8HvlmKCZ64MUWmx1Kr8JM0CEuUs0SVrl+fQId4TnKqKXA+zopDBlrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Fri, 8 Aug 2025 05:37:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 05:37:38 +0000
Message-ID: <625144eb-9b3f-4d93-860f-3b200400bf5f@intel.com>
Date: Fri, 8 Aug 2025 11:07:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Add SW clamp for power limits writes
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250807140602.3247853-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250807140602.3247853-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2385b853-19fb-4467-e4df-08ddd63daf6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUNqcUwyV01JMW5wYzd1dDV6WHlmV3pmNDNSenZzbk1mNVM4Q2ZKOGhqRUJI?=
 =?utf-8?B?SmFkc2JiellPSXlpdk9admE2SDZPcXRwU1Bwb0djaGJqNTNMYVd1MGZSeHpm?=
 =?utf-8?B?YkN1OXNZRFpaTmk0RndKZ1k4Vm0zTTVNYzNmTFdYRDFNdlZ6VUs5RVBnNkJR?=
 =?utf-8?B?c1FMamozOFE0Mm9uNDJ1ZTJodVI2QUp5c1pTTWhkUzdOcDFyMzErbE1qSFVF?=
 =?utf-8?B?N1FPZ1B1WHgxZE9jZENjYlVXR0Noanp0TUlUdEVCV3pZdXZudlpxRVZtT0Fh?=
 =?utf-8?B?UEZmblVscGZhSUx5aGRlYnc3VGExdy9VZDkyQitLSERnaGJ5MTFiYlZGL1NK?=
 =?utf-8?B?dUtPaWtiQlVmNjBzTFM0dUNKUm1RY0t1RzJ0VmdNRzBrZ0F2Z2RmLzd3MmpQ?=
 =?utf-8?B?eE9vU3ZiT3EyVTdWOW8yVVJ6ekUybTR1dUZqWHhYWW50SnpZTjBqQytXencw?=
 =?utf-8?B?dUpmdWNaU1pQV2JZcEJPdTN3NkUzRjZOSnVRMVdsYWhIWUdQSjd4OFdOTEp5?=
 =?utf-8?B?aWMxWm9LZm8zRUQvNXcyRjJua2NXWldaelVCbitNcDJ4emRYeklvWlVqbDJa?=
 =?utf-8?B?WHFLLzBzeDFPYi9YWUkyZjNhbFlXZVgvZFBNMXBEV1pTWEJMWjlwa3pOMjhH?=
 =?utf-8?B?cENKdnJFbEVVcEFlaXQyZklBS0JQa3VkRmU1Uk9nRGJTSlFlUzAxVE55eHRL?=
 =?utf-8?B?d2Fvb08vNy9ndVNQUTJNR3AwUVVDeFd0UXozWGxtZG5YemVkK0x2MGpScEdE?=
 =?utf-8?B?enhheFJ6WG5lSHM4ZVFsZnRYS1JTZDBFWDVHSGhoNTBxd0Q2WVRoYkNROVFB?=
 =?utf-8?B?dVJsV2F4QlNVeURUeUl3ZzZXZWtqeEg5WTBkSjlTVStCc3pSUjA3bWtJUGNh?=
 =?utf-8?B?V1plaEh0RDFNeUtPdzJQZkI5M0tvbG9NblBIa2pMZVNCTWlwYnNNM3pZb3Jt?=
 =?utf-8?B?dURSYWVjS0thamM5TnQ2Qks1UThmVkZ0UDN2QnVxc0tLNjNJYTJwakZ6NHQr?=
 =?utf-8?B?RDlCUzhJcGlMS1dKSCtuOXFONnFWVUZKMkk4d1l1K0VxZC9sZlVrVi9Wa0RH?=
 =?utf-8?B?RVh2R1F6elUxT1BVTDN3TzhMT3VyYnduT2FiUW5KWlZ0cXZoQjgyWm4yRENh?=
 =?utf-8?B?YTlrb0VMQVR5d1FiOXdjTU9Qd3FaWjZ6aWppMW9FanhpMXUxbFpUK0loTkM5?=
 =?utf-8?B?ei9pd0hxaUU0dkxvR3BOYjBPM3ozMGZSd2pYRyt0aExiK3Z1dFN5YSttOURs?=
 =?utf-8?B?Sk9xdklVRjFyTXQ0bjZRc215aXJxOUhYK3k2TytBeFNHYXRtenBjMjFQZ01J?=
 =?utf-8?B?THF2TlF2NHNKU1NBZDFNc2RKYXR1bzJkK1hJWnh1VURqanEvcGVzaDdjK0VD?=
 =?utf-8?B?TFFVQzg2dU1iNlU4ZVg2OUJnN1BBaW1sdDJGOW9pSWVwYUFCT21tM1UyQkxD?=
 =?utf-8?B?c2RpSEY5TzltZHhXVTRVMVpKRTZLSS92QWJPNUtVMy81Q2wrWFY1VEowTjBI?=
 =?utf-8?B?QVlGY0VlaW5LV3NRWS9ZRUdoc2hpa0M3bXprYjliZUpVVzB4TEk1TzM5TDdE?=
 =?utf-8?B?Nys5QmFQeTdCNHE3c2hlejVPUUVIRFNvTTFGV01pSkZrZnBTZ1JzRWhhenI0?=
 =?utf-8?B?dU5PNjRPS0pqdmdHZzE1SFIrMFJLNG45UUlEUzRQVFJpRExpVWxoUHNhT1VH?=
 =?utf-8?B?MHQ4ODJQaEVVdnFtRytpSmI4bitBN2U2S21CK3pqa0NFMlJ1VHdUWFpFOEhU?=
 =?utf-8?B?UnY3MjlsQ2toUnU4QVZTazY3NE4yN2JBRXg4alpqWGVJT3hRNk1KNXJkOGhX?=
 =?utf-8?B?ZUJZZVF3RlFKc0tMNkE5WjJrWFliWW1JTXpDWDRVdGxRbHVKd29YK2MxbnNi?=
 =?utf-8?B?a1BSV2h5SHdDZkh5Z1BXWUVIZ1RzSlVZaUZ3ZlpEeEhJTXhZN0MydEtyZFlw?=
 =?utf-8?Q?YKm7zFNmyf8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFZOdkhab3ZpYjRkVGlNSTFsbTNaMkswVmRtLzFCTkpPcXZmL0dmQ3VJQ0k2?=
 =?utf-8?B?VFcwd3c3QVgrWWNqdDk4YTVYVWRBUGx3OGVCeFdpemMxR0pHVXpsTDF0b3ky?=
 =?utf-8?B?amI4ZS9HakFCdjE4cjlWN0g5bjdsT0N4T0RLMXhhUno0Ym80TFAyOG44NUJ3?=
 =?utf-8?B?MVQyc0ZCUk1vOTh5YU1qRVQ4d1FIa3J6NHZNRkFPNy9lQUhFL0dCckZYSkQ4?=
 =?utf-8?B?ZkZLYXNYKzZRTlM0RVZkNGRDU3IzWldRZ3Q1RVI1OXEzMW0wSDM2bDBIUWJq?=
 =?utf-8?B?M2JUU2YvWWZmRzRtSDViNkxrNlVvbDFMR0phSEtiUFdtcmlYd2xKeUNrTDk0?=
 =?utf-8?B?aVhMZ1l2MmV3RW9ick9PT0g0SWpKU3g0TWR6VmxGcGxFYVlGTVJOTTlpeDVU?=
 =?utf-8?B?U3g4MVRrMXZFTTVoYyt1WTZlMVdHNDdCclNmVjVWUm41bFIySEJnREc4cThR?=
 =?utf-8?B?MUx0YlFoM2pjemZxOFhhaTkxK2plcEdVdHRZY1I0V1lUMnZSa3JBQXZUM3Fx?=
 =?utf-8?B?SEpVR211d0ppQTFGdGszNXJYZGhCdzFiSW5pQUZ1WS9LSzhCOU1aUWs1L2t0?=
 =?utf-8?B?NmI0N1BKdEQwNXhJTXlXa0YwdUlGN0VTZmNDZWxjMVMrd2VUdkp0Z256elh6?=
 =?utf-8?B?VWFwSG1hbU5ReGhVeU15RXh1RCsxQkxyMDVRRTNuYU1STVNjV1dXdFJvQ0d3?=
 =?utf-8?B?YnlMVGR3bk9CVkh1dnQxTEU1Wkc3SytXSTh3cU40YjJDSlp3NmdVRk9nNWdr?=
 =?utf-8?B?V05qdWFUMCtrUU5vK2oyZ21YMXdVczYwNHp5dEFtcmFDTDEvRXhrd2puYUFa?=
 =?utf-8?B?dGJSaCtxZW16Z1Rja0R5dHFJclJVcVR5cHh0U21nVHNWTkVTU3VQZ2tMZ1U0?=
 =?utf-8?B?Ky9GWkJYSGlPR2JmT1VLSnhUcGFWYTZGeVZGckxObUllMVBGMmdDUEhCeHZ5?=
 =?utf-8?B?bWdwd3l2OXBHY2RlUGtxbnZmb1NnVDdnV1BldVZEcm44QWtaaGU4aS9YaEI4?=
 =?utf-8?B?U1dpQnVJb29tRHJmdndPckt3eFpQa0NXY25oT0VzVVZFNkRKMWJsNHZMVWh2?=
 =?utf-8?B?cHhVc0kwcFZHUXQ3RGN4cHdNRUFjN0N4c1c1UUFOdHVyVGJhdXhRNyt6TEoy?=
 =?utf-8?B?OXBHeE51bjNlMHBLNy9PNlFrWThDVG1ydTQrVnJXVTNRTlVFcnpHMjdYZ1Jv?=
 =?utf-8?B?QjNIamdyUlptZHVHTXEvajVkRXpjUTE3cWQ0enlkUlZHUTJEWUo4a1RMM3hm?=
 =?utf-8?B?bURIMVhoM3RESWNXVVllcDNXT0UyZTVFSFZjQ0ZsQWFBb0V6Ukw4RVlxWERl?=
 =?utf-8?B?N1VuY3VGWmcrKzhwcDZXRklXQVcxeFZLREhKY25HSFRidW9vYmlHNWRPdWVI?=
 =?utf-8?B?WE5OUVhaRXpyckIzNTFPUFQrUlduVXUxcVNTV1NGdXVXNHZqcjdteXljMzkw?=
 =?utf-8?B?N29CUHVQQmZYbDJzOUdXWXdzRHlxdktOSWRGQy9hR3VTOHdVb3ZKQlNqRlJR?=
 =?utf-8?B?S25wWU9RZmoyVE9DZW0zdndhaUJaU2RxakxUZG04WWxhUTVZRDZXYU1ESHlu?=
 =?utf-8?B?RG1obzlFWUVzUkJDaUtrWjMxeWNGc3lrTEovZkw1U0wxdVJLWDJFemg3enRB?=
 =?utf-8?B?bHY2ZGlRZnNIQW91OHFMRFIxOVZwbGRIa1dPSDNRdHhDUjBxeUhjcjlWdjN2?=
 =?utf-8?B?V1krREhDNDlBME1rN04xR2Era0xDQWlOUnhKOW5pMGE2RmVnY2QwN0NETStw?=
 =?utf-8?B?cFBXVXBFZEZNdkpId2hidDFwQUFPcVFZM2MybjZmMTVEazN3WnBCYjY4ZXo1?=
 =?utf-8?B?L1kzWFY0dzYvKzd0UkZRY05zZDY1VUNBdkRSL3JZV2hCZXFtaVY1Nm9oNDFS?=
 =?utf-8?B?dytabkpyZEFrZEdiMTE5T0dFT0pONlcrUTdVbnIybXllMC9BT2t6V2RoOVdq?=
 =?utf-8?B?ZzFhNmZBOEpPSFJUL1A2Vmx4Rm0vRDVMVll4bnpVN0oxTGkyQVFtNGxyTitu?=
 =?utf-8?B?dW9YaUdZOFlzWVFPRy9mYlhnVjQyTjNYUURISWsrZ0JJT1M5bjJUajdaaDll?=
 =?utf-8?B?VFAyeEh5ZkhMRDBXUUxSamgvUmoxL3V6QjZFL0xEb1gyTTkxNnhPcE5nLzdv?=
 =?utf-8?Q?/6wPH2G+uDum1wxeYDzYgvwYj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2385b853-19fb-4467-e4df-08ddd63daf6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:37:38.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKlSzd0fRlTWT8olTOahNy+8/fPUgTYA7TD9Aua2gmeL16C+dMLtf4ijF+zqmc7OSRYbsdyOMw8OR3xHQNMo3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

Hi Karthik

On 8/7/2025 7:36 PM, Karthik Poosa wrote:
> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
> powerX_max, to the maximum supported by the pcode mailbox
> when sysfs-provided values exceed this limit.
> Although the pcode already performs clamping, values beyond the pcode
> mailbox's supported range get truncated, leading to incorrect
> critical power settings.
> This patch ensures proper clamping to prevent such truncation.
> 
> v2:
>   - Address below review comments. (Riana)
>   - Split comments into multiple sentences.
>   - Use local variables for readability.
>   - Add a debug log.
>   - Use u64 instead of unsigned long.
> 
> v3:
>   - Change drm_dbg logs to drm_info. (Badal)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..a43bc8b91fea 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   	int ret = 0;
>   	u32 reg_val, max;
>   	struct xe_reg rapl_limit;
> +	u64 max_mbx_power_limit = 0;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   		goto unlock;
>   	}
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
> +	 * max supported value, clamp it to the command's max (U12.3 format).
> +	 * This is to avoid truncation during reg_val calculation below and ensure the valid
> +	 * power limit is sent for pcode which would clamp it to card-supported value.
> +	 */
> +	max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER;
> +	if (value > max_mbx_power_limit) {
> +		value = max_mbx_power_limit;
> +		drm_info(&hwmon->xe->drm,
> +			 "Sysfs value for ch %d %s exceeds limit; clamped to supported maximum\n",
> +			 channel, PWR_ATTR_TO_STR(attr));

Why semicolon here?
Expand ch to channel. Unnecessary to mention "Sysfs"

With the above changes
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +	}
> +
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>   
> @@ -739,9 +754,23 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>   {
>   	int ret;
>   	u32 uval;
> +	u64 max_crit_power_curr = 0;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd POWER_SETUP_SUBCOMMAND_WRITE_I1
> +	 * max supported value, clamp it to the command's max (U10.6 format).
> +	 * This is to avoid truncation during uval calculation below and ensure the valid power
> +	 * limit is sent for pcode which would clamp it to card-supported value.
> +	 */
> +	max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> POWER_SETUP_I1_SHIFT) * scale_factor;
> +	if (value > max_crit_power_curr) {
> +		value = max_crit_power_curr;
> +		drm_info(&hwmon->xe->drm,
> +			 "Sysfs value for ch %d exceeds limit; clamped to supported maximum\n",
> +			 channel);
> +	}
>   	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
>   	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
>   

