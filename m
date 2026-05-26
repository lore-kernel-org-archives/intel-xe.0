Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD21CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 21:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17CB10E544;
	Tue, 26 May 2026 21:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pf4hmZSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D1E10E544
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779829283; x=1811365283;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yMYmyXOCx3Dz+jPiYHmIAfrudHOu8gAScHcrbMOlAm4=;
 b=Pf4hmZSfi/4fmSXjgyY7lzc6VIPsswVgzXTmDCio0+GkVyabgxo7O3+H
 H/IMCW+qHvMvlKt215S3/6ux37Z4LF6zt8lv1txhrsOErTI7F+NFHZGOc
 LMFIPBUq7GpAbtcZSEuXngZLF4aniGL9nTmW0rZFmYDGCNnN7y521oBF9
 Kd8yFO2o/Ybv1axWGXL5AQQD+J4DeoRShAwna4yc8cBdtGCzxshjDYEBk
 iyfmyrCPo9fRVqGiLffjLNtDK+bU0vOxYTzyqOVCix0icGCmXJHZ0SDvA
 sjYnyzHw6Cn8l32yB0MBMf4U0/LPGEVJwpl7Sa9UWt/ECogn/3uazX+Co w==;
X-CSE-ConnectionGUID: l2ram4mZQuC6ZMlhtwNtig==
X-CSE-MsgGUID: CCJPKcWZRaSJGXaN4BPE3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84510880"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84510880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:01:23 -0700
X-CSE-ConnectionGUID: QRkp1ugKS/WQmq2ilG9rCA==
X-CSE-MsgGUID: JU646NMWR/WvQpxU3VFQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239423082"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:01:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 14:01:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 14:01:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 14:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcw5dL8/hAOSo44pXWBPhX6LD9pSksz6J7tDnSRP9+V3YKPA0nqwZGJE5gklmSGq6JL0c7QejwQeJfYTuKJLMZ5MxZO5J84tH+Hye5dH8frZGG3YjCAZI6ssGI70rp0WmirsqFBF0icH8roBDwRW73r4HM5YA3uxIGXagRiVXwqtHnRrmxLN/YbD15bauVcmdOTgYOHk6YdH3HfDeTgFtnCN+ZfqA9prTBVtXgPep+TRpjAhHZ3pZ5MVUcElpFiANr/uNVlzOuph22WLMQETrWDmfWm0crlofr1jyG7a3yvSVX29euKaztprmR08iDOL6qU936/PGvUmY3oJzLJp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMYmyXOCx3Dz+jPiYHmIAfrudHOu8gAScHcrbMOlAm4=;
 b=xz7HJwlVS+lHxfxRY9qDIZbGxOPgm+c1kEXXei7/dGOFLIkeVUh+l2enBWaPt/D5jUTT5E5V6TYaibVddj2uIHylq7zOpB+qu8msiHAIufNwLsgH88MUeXTyrVHFehGrydrlf+v5BiQD09D55/y/GTVwbVNkct/ebfxE2dqoLh2TPwXG9dLTEfs5MdOO7m6GwMvI8Fkx+w9TcvPSjlr8zomXIfGD3Xq/dCKLqnKaneLL1Tig6Eehk9z2mSkkEQWdgDjoqhonPUdk9leJErupcw7dMuSwYQ+E2IrZAHxjPkpeN6KW9AJz7Ff0AjqXbTk02u1Y1uzIRfsKd1UV3X8/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CH8PR11MB9482.namprd11.prod.outlook.com (2603:10b6:610:2bf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Tue, 26 May
 2026 21:01:20 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 21:01:20 +0000
Message-ID: <8d92ca49-2006-468c-8412-092c9b965aba@intel.com>
Date: Tue, 26 May 2026 14:01:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: PXP no longer requires HuC from media 35
 onwards
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260521233132.883021-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260521233132.883021-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CH8PR11MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 385aa414-e7e5-4a0d-d7e6-08debb69ef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SdsUQiBN+Gg9OhIMXHRguVu8IrD4YoKxAFwUU32m8N1kpw0xmPI7PP/z6UdYW5PBXqtSXVv93PJP7EwhYN2R9XJBprjlwJMroePWQxzQ/NPU+t0SWGlQ6IjcCelRissTlugqtxuVfWbfd47BP7TQoNcTgowbNLoXpcWZ+mPgwlXHN3cTznRWBHULfAz63QAhyzrmvGqby9P0/BfxuGoxngN0gIqb2O4PXUkRmA34h9F3FBGMTm7E7UgwJSAt0xWVJOZnvYGB1GlIcyOFQ7tp7TG70JeyI8sojMmT2b41BpwWFr7uFh93xjpR6W5sotz56kqIZTiD/1SqiEDd6MPJv1EndR7b4bxIGUOSrjYsqV2TnReSkI6j1XQ/hBUCFAUmM14FrQxWWpUkMesbfJJEtw6AEF1wZ3UtDL9D0R3AOmtkuXQet5c3e0cPe+Bc1/R1txMFxHnr1042xowWAQGL69am9bPP+ArRWMHHTb6jm/mIAfOnmK38auEBqwITcOWd+eN+e9SebC7Hx1g6QloyajlA7PLNHfVROZmuuCAgL1vR4cc/rkL3/t4AyQRqqgc3NytgS30fp/T/wRvSaB1vSSwukChTSRh0ruyfc+thnbqetNRFV9AbinlfBtHaq9LobikhTL5fhE/4x2ngEuu7FLNwjKMGnjM5lxNil2zrjCIGmXqQ5q7JEPazdrkXL5Yl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UloyYWJHK1p6SVdJVXh0d3ppUC8xV0orK2tieis5Sk9kVVZOZHBQUkZyZlBj?=
 =?utf-8?B?MWkrQTJieU9RenFHRUtaeXdQNmJVL1hoR2wzbWY3UnEyL01rSzkwTUVCRExT?=
 =?utf-8?B?NXp3bUYwaTZLZTZCZWdLTWsrRVRla0JaNm1jTlkrTjRJR2tndWYvWUF6UUFj?=
 =?utf-8?B?SDYvZFZ3SERRd1JYaVRTcS94bjhqbERVdFZSMmNUY0lxZ0RxeDZIRVYwVTFi?=
 =?utf-8?B?aXB2R1ZtZFhTZU5qeHJjdDd3c3Mxazd2dVZlVmZYeEtKL2dwYzZzd242WU9r?=
 =?utf-8?B?azN5b3hoSWU1d2JnZktrSjBYaG1HNjJBTVhFMVVyOGxxVjJZNjlkbVRsRDU4?=
 =?utf-8?B?dExsSzJCZjFkNk81VEVWbzFKY2JSUVRlTkdKWVFiZjJoa3REbHhycFlUTkwr?=
 =?utf-8?B?UldDRGNLZ0Y5ekY2Wkx6MkQ2ZzdYcFhjTGpiN1d5NEZwcmpvR05keGNud2NY?=
 =?utf-8?B?d1JCdzdGMThqMElHNTNMcFh1TmtOL0MxTFNJQmJ0RE9Td05mNHc5QzFYNjMv?=
 =?utf-8?B?RGpLNVZoQnVVWGtuTmlIdCtlTjhjb1hNbnU5VTRSY0I2cm9nUjFnMVlRKzRy?=
 =?utf-8?B?aE45Q2pXSFpUZVhRWm9ETWJLc0FNbzd6OXBwWDNhb3Fnb2lBdVdnMlBrVWVX?=
 =?utf-8?B?VDJHajZ5dnRzYThjY3FDUFRTMVFmc0k3N0hTbW1oNXlXU1VlRnFBbVN3RU95?=
 =?utf-8?B?eHppN3NvZGk0d0ZqMHBKNWpibWJUTTYrS1cxOHJydmNNelEzTXFhNU9WT0dm?=
 =?utf-8?B?M1R6djA5V2Z5OGM4cTk3NkUvY3llSk4yVkNiVS9NUUVnNkdtanNxdkMxbmlR?=
 =?utf-8?B?NDF6eXIrdjE4STNzamQ0KzFXa1N3Z0U1V25NRXRvaWNpN1RPaEdRODJFdTNJ?=
 =?utf-8?B?WUFTL09uVDN1Z3BKNlk0ZnJKZFVLUS9VZ21HZG1oWXN5bzBwc0grcFloVDRP?=
 =?utf-8?B?RGRuenpIa3o3a0pqTHlzeitlNXFYdExMQnJsKzM3THNUVVljRHBrTk1KeUxU?=
 =?utf-8?B?ZU5oWmVzSHV6cWtLOTdqT3ROTEtwcXNvZkZBZGpNbEQ4S0c5ckJ0c3JtU2lO?=
 =?utf-8?B?R3JCZk9uWUFxSUVER2RpOE1NaWtnQ2JUVyt3eU1ETU5nSW5hZDQvRkJUZFU3?=
 =?utf-8?B?ZlJMUjc4eHBvUEt0ZWNWc1lyQS82QXkxb21jZG1XTXkwR1FZNTNZRFN3QXBU?=
 =?utf-8?B?REdkL2lJbEhqdmtLMzUwMnQrdlBwejRsSlFtaHVUcFBUZEJiWlJlSzBzaUJt?=
 =?utf-8?B?N3lncVdtTmM2M0owaWl5SHNtWCs5TUJBVlVuajhIRU5RNlp6dEpOZXdoeEhx?=
 =?utf-8?B?em0vN051NFU3RTRKQ0lOWDJnL3pNalo4R002NFBFSUpDdTdOQVBtbi9reWRs?=
 =?utf-8?B?c081ZGNMVjJXUEdOUytWdjdqSVV3WUhOTHRlQW5LRXNzb2FhVHU3cnRaWmJZ?=
 =?utf-8?B?V1hDRGZXeUhjVjB4R0l5N2pMdzVBdFZGSERBbXlKd2c2Mm1qck1FMlRaSUhk?=
 =?utf-8?B?VVFMNWtNMHo2YmVvRTB2UG9XWDZBZk5rNDNSTXY5YjBxalkvVEJ2RCtvRVJY?=
 =?utf-8?B?STNYRWhaTmljWTB4b0FrWVpTYlk2cERQVzZJT2d2UnJpd0J0T0d2eDJLdmI2?=
 =?utf-8?B?dnE1dUtwZW1uWUxoR2RSd1NSR3p4MllFNE83RkErT2gxVnBOblJudHJtektZ?=
 =?utf-8?B?RkpzRVd2OTZwUmRrY2NhZi9DWjBUOGpoazdDYVZyQ2RESXB5UWhuaDRLamZP?=
 =?utf-8?B?OFIxNE5HbFZHNXhZcHg0cG5Ibll5SlhDSmFZbldiYnJrb2hwU2RJamc5K2JV?=
 =?utf-8?B?N1J1VEk1K0dnaENuMXVLejMveVdkdXlNNFd5dngxMWhRY2U0elAycTFrQmxn?=
 =?utf-8?B?eEpnUTNNR3RIdnpNWUpxV3UycDluY3MwUHhHVWlPN1FLS2lGZWR3L1greVFH?=
 =?utf-8?B?cEFGRDJWdkhURjQvcGNqcU9VWGtpa0puYWpzNjEzdWFJQW9SUGJqdndSK2JD?=
 =?utf-8?B?cVZ6NDhXQWJ5R1h6MGNOSms5M3J0RXNQaHBOcEN3Q2dXUFdzalorc0RYdXBV?=
 =?utf-8?B?dWFMcjBBd1pGWEJjeW1lWjRjdm5mZzVyT0ZVRVNLaitkM1RtL2hsMzFSVkUr?=
 =?utf-8?B?VFU2enFYV3htM3RtSnlpdjhIMkV0QnEzdmF2aXV3RFNVYTA5VlNrNFN1eVB4?=
 =?utf-8?B?QzFNY3UyRzNDNzQzbVU0RUZ6SFJQMy9sVGRsS2dUZnFpRlk5RjExL05WWDN6?=
 =?utf-8?B?NEh6dno1VnVLM09rb0Y3VDFveFkxZTZBd2dlZkZnTVBqV3hLeHRYdTc2WlZF?=
 =?utf-8?B?YzlURzhobUVyL2hhRndXNzdTZlJMS0NidjdLTWhHMFRZem9aR0JHWTFON1hJ?=
 =?utf-8?Q?wiqvfqEa90jO6sYU=3D?=
X-Exchange-RoutingPolicyChecked: XAU4R4JPvfOot9ZSE0Odv1uJoeaZwsTqi5ye+4lI38emqcah9dXXMhQoWvZ268ztKSjeh2L7rJJFMgDU8RIqqDPTUZznXOROVSmTgH3F7cLQ47fbTy5y/zMkwX3hGYl9yetClRFNmSgpE41Uxo92UAnPKn2wIYC1d07pbfxJMNUP3XZdFbFzgSH7AF73dB47D6hZQgaYRyVxABm2ZQJCs164EunMM+dxwDYOf2QVduGGC5URCezjlHawDjPkuXGctnssGaVyjXrpqguUMg6rUqRd0FuUPMBkL7X0cRzODZpvUSyjMwXTAuf91zi/RkzibDx/u5cEFcBvOrM/GTDgFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 385aa414-e7e5-4a0d-d7e6-08debb69ef90
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:01:20.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR09D4G/vXU4MDX5df6Qaqy2f5Uelt0U1IMaLKFsXCzwNTH29MZ3Rs/7+XvVaHRIXwQobmJqAdr7OSm+fZm7MuFTM96ak8CLi9rimqd5x1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9482
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

Changes look good.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
