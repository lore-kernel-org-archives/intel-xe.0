Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED003C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279810E893;
	Thu, 23 Jan 2025 18:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkvaE49t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A210E8A6
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737656300; x=1769192300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZVSeC9JRCSIW6iB+EmRLPMyGUSwuo2CBung8xUp1lY=;
 b=lkvaE49tYC4RbKuso95LTzfF2uXhSY8oTTdf0HuYhYwwZR/3w1Ev/5kM
 hdOkn44f44MbQ3gKvWFpHI5fPdaBG3dJaIObr4MBbpUEFFkw7XkchtfmO
 BUkHiYEG2rJmAuAXJPJ/YpKUGh5X6Zo7c7WUnwzX7AfubKzRNPtROVlpN
 930s/0YEv2YfZ0hZV+oGVrMsSeKGIAtN6NjpvgyPkZo5/XyJEdMGfs2ly
 5Ni1gbZJzRNYzcdMSwjnCCpgdNV/KYB2c8dLmrnAxE2JStuC7a0RZV8O6
 uCFReEkR0ztWJTz2xvIc9PWl5hBudeNptRhdQd8k6QJ1Tn+xwP8q18zco Q==;
X-CSE-ConnectionGUID: oKU2by8VTU6NJnybemxH+g==
X-CSE-MsgGUID: pUTVeoJ/S3qmb8yDj58CIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49572375"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49572375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:18:19 -0800
X-CSE-ConnectionGUID: nxEUQ21sQ265UY3MaQWblg==
X-CSE-MsgGUID: KYuO8g6rSNK7HtAIONzexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111574039"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:18:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:18:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:18:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:18:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpVlGIRbIJnXS+ztVatHRM92xYzcG7nNYtUy5CAWOoBGOnmESePoxDrxCiWVbRILzMISft/0fsjXTsthdLvMDtaaMmT8czq1/4QYMEGkk2WBIdq3itvF2Ain9VbU4CFPEEBZQyo2F3enYODb0OXFaZ07AZs2hIilVn+fT+iE2x9fyql8dP26U2KP7w7OBrM021iGBvTU/a6fSV3KnQl8Ss/9HbiRaxOKD70b+jmnDcBmhQVaGP2yEZH5FnQoGQrOsWXMt53wFBprRy2Ari2/E5y4XRYcCFzQzubPeJ18+7xfXeEFByb7NOoHr4ZhI/ODwzPhw9cxM6GejeGVV9/CQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAUnhedQKk9R0w5kZ+sMWq/BY1eEVjQ1zvWosiYqQIY=;
 b=RbtJuJdzFvt/4oFLwnq/aIxFVzqAVLRZyYtqDthn6/+2KgiAm9qjQaMZ0OT0fnYE2Mx7LTBrKTL5D/rjcEb/xlkWUSuXiqzuGwoBjlo4BNjEsmYzPRkbSzzSbLS7YSS5wEqvHvGVsM8UNmOMXqdEjgsoRleD9FstdAm9wrJFynzF8yxE0S/jmjEFJSpdFjVOrka5LxRmLa2GdkrGXMwo0bwk0gpsDuv5paCNBrpnMadfH293+cjY4Kpq7IXteze4rk/SjcHEIPfPanHJVSEV+w8MhZzdpQwTsIKz8zm1U3vyw/fYFsUEbLjhB5CpEkd/1hxZEQ0ZpZix9IeJkDLzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 18:17:33 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 18:17:33 +0000
Message-ID: <9c1e56c4-4809-4f11-a41d-ecf6754de6ca@intel.com>
Date: Thu, 23 Jan 2025 10:17:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-3-jose.souza@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250123180320.66198-3-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:303:8e::28) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7d5b10-5f6e-4eef-f0f7-08dd3bda3517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3NWWGQyZy9XTG1PS3Z1QjVDNjFmMDBzRGkrbGp2R0pIK3FtTm1xcU1BQ2pa?=
 =?utf-8?B?SUZ5L3VGcnFQZnZiMStvb2twMFVuS3pmMUV1eVZEanFNK1ZsOFhsRU1JLy93?=
 =?utf-8?B?S044WTdFZ3ZKYVRVV0hkcEZwMHIzQ1ZvcERZTHU0VXpVZ1J4SWJoWVJWZ0h4?=
 =?utf-8?B?dk5nYVJXVmdWNGVhMStCQlRKZlo3RWJEUW84Nlp5am04NmRGbTBORDZkclgz?=
 =?utf-8?B?NTNmZEIxM09IbmE1dXQ4UVg2aE4wZVpZdEo0eVh2elFGeHJOa0dDR2Rldkxl?=
 =?utf-8?B?TGNySWVHZnQ2MGlHcUZ0NUVHYUlmUlFhbHpiVEJJRmRxdUVJWnZtajcxcW4x?=
 =?utf-8?B?b3IyUDYxNUFraGsxbjV3WDJIRi96U1BJM3FuMHlMTHo3OU8wczFRZE1jT3ZR?=
 =?utf-8?B?WDIvVnhXZUxueTl5SFVNWjBuUlBTUlBYbTFZVndIb2xKYVNGaDZMRzZkMTFm?=
 =?utf-8?B?SjV4UG9qTElRQmFzVURJbXh0RFJiQ1RYaVNQQzZvQ3g4OW9jNFU5elQyWmhM?=
 =?utf-8?B?M2dSOEtFMmJYbWo3bWNORWJ6SWMvcWlYclVzK1RlVTdsTm51WDNVclZHNUpr?=
 =?utf-8?B?YStBUHNRbkRGd1krSUdFU0w5c2tXMlFaZkY1SjRuQXo1SDF2a0RqS2RGWm5k?=
 =?utf-8?B?djFPbWxROGp6K1pMdU1ZV0NmWmpvZU5WSTlzdzVrWW5MekdVSTJJSkFoSlVN?=
 =?utf-8?B?cmpIOVpVQyt3Y3JzWHhoNWg3VmMyeWQvazNHTlk3ZzJ3Yms3b2pVYlpjQXQ2?=
 =?utf-8?B?czFYUGx5citFaS9WZ1dsNFdxaUZKS1BIYzBZdi9ranlpb21UOFBrT053STdv?=
 =?utf-8?B?c1RXaTAxUzRndkI4OFQ0TmFjSGU4LzQ1ZWNPUm9CdWtoUlJSUGhVUW53dlFk?=
 =?utf-8?B?dTJ3T285UkNmUldIWktnWVcvbUJHZmFsR2J6UXRVQzdXeVI3TjN5dllqRXFm?=
 =?utf-8?B?U2hVYlZSVXRpYnpiNi9JY09vS3Y4Sk8xYzd0c253eldEZXI4NHlSdlIyblBt?=
 =?utf-8?B?cXVmQjIzM0V6RVRBVmxwRzVFa3U2SFBUSUlnSEtOQ0UrMG01ZmxTVy9TRnY0?=
 =?utf-8?B?QVBnbm15dHZVS0VJWUhNUXNNTCtiZG5TMDdqNTBiK2pwUDAvUU5NVUtTRGJn?=
 =?utf-8?B?S0JQN2lFWXlBK3JSRjJhUlM5L1B2OTdzZ01TL00zbEU3SVRBUDd2QTRjUHZh?=
 =?utf-8?B?VG9ka1A1L3ByVUFYclJmVjI1L1RmZEUrY1JUT09RSzJYeEZ0a2FnQjJKbzho?=
 =?utf-8?B?WW9JOGJLR2MxbEJwM0RTMDh6dUxvcnRMc3ZQT2wydVo2Y1ZKcDBmRHhJYnA0?=
 =?utf-8?B?a2NRdGdCQ1ZaVVlvb2NNK2c5VUsxT1ZQZDkrYUdPQXVMa2FSQkVlTXE5YTlr?=
 =?utf-8?B?MWRvUzJNM1hhTTNsVC9oUEU0Rlp4ZTk5c3Z0aVdxak45UGJDUW5EdEdiNnpH?=
 =?utf-8?B?d1RGb2hFSG5KWVBGWTkvUG4rdDR4UE5JUW5qaFBrSGJ5Yk12NEJnLytIZ1Ja?=
 =?utf-8?B?QmovK2hVNU8wN3ZPVFVLNVBhejNYMW9YS3FJNDM2YWllQVBEaHR1dFBXOVl1?=
 =?utf-8?B?THMzUEtuNU5GNFdxNWR2TzRyUkRsNzZEWWkyeTUvWkIrblpsZ1RVZUY3c0hW?=
 =?utf-8?B?VzNiTDY0SnRCQWE4NWNnZE5LQVkvNHJkcVR1amhaQzlzdzFCanVYSVhNUzZG?=
 =?utf-8?B?L2pvSis1Y1lYa0NjUlNLK2JrRlNrMFZKWndxVWdkaGdWdkNES3p6RVZvdHgw?=
 =?utf-8?B?SDF1STAwcEo5Vkd3aEZNUjNlNTUwT095RnF0UVJmTEt4NHNsN0NxczhkYnJ0?=
 =?utf-8?B?MEIxS3c4WjdqYk5STTlxNnd1OC9Ua2lqNko5RnFQUEozNXhCWEhFQjJ2bGNw?=
 =?utf-8?Q?z0cRQRg3qUstU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2tMSHVNcW1CZWZDTVlleVd5UFBOcTQ2aHV0Qmk1VTBxOHRMWEhqY3M3Z2ZH?=
 =?utf-8?B?NXk1WUZtbVpxUTB0ckpJUXBPYTgrNVN6NU8yb3hFOXNuWUQxUWVsUkI1MDdE?=
 =?utf-8?B?MjVadllZdzhkN1I5TFp2NVFzaThDMXhCeFBJckFQMW00QlpqQTJzbkpaQkk1?=
 =?utf-8?B?UklwU3I0QkI0SDdJNG16OWFqTElpUVZyeU90Qzlma2YwdFRINTNzbkxFS29D?=
 =?utf-8?B?eDRYZTQvdkJaUEsxRmNmUzh6RWRhRGhHMzE0b0d3UTRlYk9sVUJ1aDNkZDdX?=
 =?utf-8?B?aU5zVlc3eEdFV0REK3JDT2hwZ1BsaVBHQ3d6Yzd1KzRKWnF3aHkxdnk3aVNX?=
 =?utf-8?B?TjJ1aXRiYVhzZER1dWVlTjNxeGFtQ0JXYjF5VFJKNVkzVjg5OUwySUhFZEhJ?=
 =?utf-8?B?c3JxY0xlNkczOEJHd08vbG1UaWNJTzdRNmo5aDQ4dVlTOVpCZGEwQlVpdkVR?=
 =?utf-8?B?UWNNZ29MdXY1S2dnVmkwaXZkK1dXTW56Um50dUxqY1o4YitTdkl0aGFFSU1C?=
 =?utf-8?B?aXJyMlpjeUhFYkJMNnVjYUJmTmhTckEzMk9GUkhZZm5nOG1zenhqZW50OFJw?=
 =?utf-8?B?YkRpd2NkWDNpNzNPQkhoWkNCZWhHQi9YVUpPbHMzcHBUTTkzaWlTcm8wcml5?=
 =?utf-8?B?UGFIS2dEK016VHBWWXJuUHA1YUdFS0doY1JrWkVGd2pCVTlCMUlYOVRJaWNN?=
 =?utf-8?B?ZVRlRFgzdVZIZ2ZNYW9JT25lcU5KcHZFcUg4SEdFakloRFdnT2R2MHpJYUhw?=
 =?utf-8?B?bTMrM2J0ZkNzNDUxbWhjMWR5SEpQZi9QeUZMWlFVa2VGZkRYTGh4VUxYVlNG?=
 =?utf-8?B?ckFRcEpkNEFxU0tJTkkwci9HWmIzOTErdDQ5NFBBaHY3U3BWNXo0OXBVdXdk?=
 =?utf-8?B?T2RmYkVMb05Mc0NTK2RWb2VtdW9vUFl5WDhpNklRM01xV0x6cVh4NXpuNGJv?=
 =?utf-8?B?THR0WmN0TGFXdFdTcE1ER2hjY0poa1AwOVIzTGlRMnlaZ0ZmdlV1cDJITlNJ?=
 =?utf-8?B?UlRWU2xJYnA2aTlhSWVvVlc1T0NBOEN2Y0E2MDMvQk5UeXBTaUxGRllkUzdm?=
 =?utf-8?B?d2tmNTAzK01EZ0Fnd1hyWEhjdmdpNUFpQ214ZCtoZXV1TnpRT0ZlVm5ZcW1T?=
 =?utf-8?B?ODNnM3EvdmxEZVRiZWVncEJDTStXZjBuc1VWYWJmczc5OW0rN21XS1FZNWly?=
 =?utf-8?B?a3BpSmJ5SWpGSWw0TStSYTFKeDNpYkpxZmk0NWpMU1VQZnI4TEhiM0NnZHVI?=
 =?utf-8?B?SWpQaDl4R0R6V24wYlZZdWpPTVd4QmdKbmI3dG5HN1dVVmlMSGRMb1Iwb2ty?=
 =?utf-8?B?OElGU2h4Y0xUWGpHTFV0ZGxDNzVadXBpY1YvWFJrMjNWRU80K2gzQmdOUUQ3?=
 =?utf-8?B?cDBKYTUybU0vK0JhMmQvZVlIOXExSCtkdUFuMXhJVzJ3YUlJNndweW1pdVRx?=
 =?utf-8?B?RGhWcWxsc3RxUUovQTZwakhEMUxPSlE5ZVhzTm41TFhEV1RhS2NLSTdVYkNC?=
 =?utf-8?B?REJzQ3JSOFQ5NlNsNXFnWmlGL3BQUmlEODB3RDJIdGJ2RjNpQXZnK1pPZHF4?=
 =?utf-8?B?bUZqOEVkOThqOFVFTWV5UWNuOE1ZTENDYzFKQ2lmTDg0SndSajQ5TXlTVFRG?=
 =?utf-8?B?T0dHbVVsSVBrS1BsRktvdnIzenRlbXpGZmgybUlTOEFtdUVPRVpORjcxeUh5?=
 =?utf-8?B?cUY1c2Y4dnpoMmhCdFkrQlBES1ljblNWa1RYQ1JVWmhFcU1GekdrU3FHcFJN?=
 =?utf-8?B?WGJBZTVORWN6eko1Z1h4K3dOYTJmWDNaRTFYT1RyN29qMUtKZURJSTNhWHFI?=
 =?utf-8?B?aEY5eGVPdE5qVHc4WkZraFhTZHFtOVNIWWdoYjV5a1psTlUrOWxMbXppNmZN?=
 =?utf-8?B?NzlWT3k4bWlSMjRMUFZZMWFTeWJXTVk3cGZTS2tjNWwxQzU4NHlvSW5tWjJB?=
 =?utf-8?B?My9nUnQzY1dwdnovczVVbGxlVitiako2TnhWclJWT1VRKzVQM0tUN3lqeXQ1?=
 =?utf-8?B?a1VQaURhSVUvdzgwMnowWFMwREcxSm03cjNzOWNQT0syNWJDYzFNa2RoamE5?=
 =?utf-8?B?c1R1cTlYSHFrUmE3MHpSUWhXMzc3WmJicmlLQldYdmdQa3UybEk0bTVuZEYy?=
 =?utf-8?B?ZzMvcXJlS0RSNlBLQlZqZU5mZmlqMnlQQ3VvS2xDRGg0U0l0SDJaZmtpYysw?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7d5b10-5f6e-4eef-f0f7-08dd3bda3517
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 18:17:33.7720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbQJ6AbCOScn1eR8ejhVACRt7krvH9iK228SS4AYykcIeAteeeOWh3ygJm0BA6tRfitgh/vvjqFQNAA/R6gyuXAnwhwFZdpLiLLwOEUPETU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
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

On 1/23/2025 09:59, José Roberto de Souza wrote:
> All other binaries follow this format:
> [name].length: 0x1000
> [name].data: xxxxxxx
> [name].error: errno
What is the purpose of including the name in []?

>
> The error ones is just in case by some reason was not able to capture
> binary.
>
> So this GuC binaries should follow the same patern.
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c  | 6 ++++--
>   drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 50c8076b51585..497036675a38c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1723,9 +1723,11 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>   		drm_printf(p, "\tg2h outstanding: %d\n",
>   			   snapshot->g2h_outstanding);
>   
> -		if (snapshot->ctb)
> -			xe_print_blob_ascii85(p, "CTB data", '\n',
> +		if (snapshot->ctb) {
> +			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
> +			xe_print_blob_ascii85(p, "[CTB].data", '\n',
>   					      snapshot->ctb, 0, snapshot->ctb_size);
> +		}
>   	} else {
>   		drm_puts(p, "CT disabled\n");
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 44482ea919924..462ec4bb98bb9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -204,10 +204,11 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>   	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>   	drm_printf(p, "Log level: %u\n", snapshot->level);
>   
> +	drm_printf(p, "[GUC].length: 0x%lx\n", snapshot->size);
>   	remain = snapshot->size;
>   	for (i = 0; i < snapshot->num_chunks; i++) {
>   		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "Log data";
> +		const char *prefix = i ? NULL : "[GUC].data";
This is not printing the GuC firmware image, it is the GuC log buffer. 
It should be called 'Log' not 'GUC'.

John.

>   		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>   
>   		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);

