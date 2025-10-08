Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF2CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881FF10E8D9;
	Wed,  8 Oct 2025 21:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyoxTaCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186410E8D9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957883; x=1791493883;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jhfxZOFIyqMjPaqNkbrKFppePQeBhrPF62X+qIwnTew=;
 b=fyoxTaChRoRg5Rf6CG9wxLFMpxfBfGTbFc1HzpYbm9i9v4Y9p7dMz9BK
 h6l6Gk+ShWEZu+9g1fASn1sC27ZE/+6XSgPhGqArhBujQCgHTGqUboUUr
 AmpF793Drw8Thf9Dt4nfL1qEOQx3A5iama/NL1qEqd46+JRGsJGp+5YIf
 wMGMQGNvSnLCk78gzrNnHL/kOwBh7Ircexgf+9bOYg3h8P8qamtrdCWrE
 Ji54fGnlWXMqmeY+YebUaq9aWqEP/5Rn7sXXB5tJqvkzZAX8+5ufVkS4/
 G0dhWPD/MyB6mQk2FvOrRl2pKWoB6SRNZ6vHXUIrvRJ1DIbM8vBbYCjno g==;
X-CSE-ConnectionGUID: s8f+kOyHTWihgGF7tKoFWA==
X-CSE-MsgGUID: KjA6tL7CRAqaEEvzTRxS0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72839350"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="72839350"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:11:23 -0700
X-CSE-ConnectionGUID: jbnnZiWQQu233cFcuDuOcQ==
X-CSE-MsgGUID: 6r8c8nPOSW6PlLhoIyDTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180130234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:11:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:11:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:11:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8MHfFnbYGZhhm48+tJk/hAlNViDqC3iBeAy4f9GQXsfk5uFOtsWseUDu/kA+MOhJEPrfkcAUkaEiJ+9cLPGyHbFfXxfuf0RiDAcEzSaVurHlKJtD/tr8s8Xz+1FUhQxXhoRsPYoPuaZRJTvisCsc61NHthNP7CVjyUu6tU1VeBtaHkxN5aJ72lunOSqSB561RqgvgnyrZ4G4zLDMKfpS0DIwT7CtGayzHfncSygXtzCF3MQySnagddX1NUI+boFsLGwCD3L+5hesToJewrBYwRJ3lXCJItA4ybz/DKWh6Dfx7YRthTpIQfrdwOfBHuJPiInHz+1HDpnn3aVvgA2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHItEewJN6WWXC3JRHSL4K500WDPxcEtYskYAAIcOxo=;
 b=vXubgKQ0AONsV1zMLqBFDXLh79u5WR1a7o05Tpp6UuRJ0YLYFP/fTgHepLHGdbC2E3zr/jsznDOOlNcEB/to+qdyC3AJDHa1TfeGI7ReSZO/w8zoJiX0AZ7VWOYdM/7kAwzj8BZMDt77x5iXf6cD+Pax5hFIgYIvMX6HuUn7uSWc2y+W9qoSnUo375b7Ngxj8a8xGhn+Owqni1zvEfCQMX+4SokiL8KrvGkdTQ3Crak0gAn971pnDDYBPmtsL0y1LLuXdc+q8qfA/FRpgDTWQzT9YIvahvhfeb4DbmBlyWm9Hm4uVWRdH/3jiyY/BOBwbZV8L8VXhyfFsr2rXI7F9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 21:11:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 21:11:14 +0000
Message-ID: <206bb287-2b59-4e1d-85a0-4345aa98d394@intel.com>
Date: Wed, 8 Oct 2025 23:11:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/34] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
 <20251008180500.3261209-15-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251008180500.3261209-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: c474f61f-78e6-4ebd-f8c2-08de06af36ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW1LbkREZ1Z0aE9SVHFwQXBEbm1wNjFFU2I5Z2R3Y3dML3V4ZFRGZnBpdW4r?=
 =?utf-8?B?NUFDT0xLc01GaW1oZWFDWWxqRC9VTVN5K0R0QWZCTGtMREFMZlRPV2MvMTBU?=
 =?utf-8?B?ZUlaaWN3NGlpTlU3K002NU9FcVZEbjJaZVBVbFJCWU02SC9JaHk1N3ZQUTRx?=
 =?utf-8?B?ZzhZUHZZNVBUM0MzQnpiNW9NTmJiYVdzSUs4d0V4MUVhRlJMemcydXpKMnU1?=
 =?utf-8?B?OGlnY2c3b3NCS0VrSjdVLzFpdjVWZkF3enVpeGU0V0lidHRkK01OcGlpN0NC?=
 =?utf-8?B?cmgxUHNUT0Q1azU2T0tYSFhEcEpYUTN4K3dWN3hPUDIxOTFsQTJwL284NkRW?=
 =?utf-8?B?U1FyYllqdElvYnpDdWFFNU5zQk5TMlU2NDRQcHJyOUJpbHdqQU1tU0hHY0Fs?=
 =?utf-8?B?MHBEaW1RU25xNWZvUmFuWkg4a1JmL2tnKzZKcDE5UXZKWGtOUkVNV0NOcEFU?=
 =?utf-8?B?QWFSUklEMllQQlpyVWNaNnRJRE9PblpaUFU4eEp5d1E2d1lkQlpwNlQxSENN?=
 =?utf-8?B?WE9velhta2pGeTgzeDYyamJVTlhpNmxPUDVIWjVDY0FiY0w5YnB1YkUwMjhx?=
 =?utf-8?B?RER4SjRHQ0NKUllyeTRpRS9NdUtOU2ZiVi9HTEV4MGhlNXUyYzR1YWlKQ2JD?=
 =?utf-8?B?Q3ArVGVtRTJCSEprZ1QyRzNFaFlFTm1aeDNNWmxvZEVNK2dQNkNiOEVlc1BT?=
 =?utf-8?B?a1h1Zmk3QzNwdGExWFFOM0xjcDVaVVk4YzliQSt3ck9JTnBlQWp1R0J5dWFX?=
 =?utf-8?B?aFlmTDZEWm5Cc1k1L2tENEFHOVRKVUx3U0xkcU1nUjBqNnpTL0JkaS9SQXV6?=
 =?utf-8?B?N1hFcjhZc05EcG1icUlKNk1oRTFNeUtnYWRqbUwzSVEvNFZlVkxJMmc5VUJl?=
 =?utf-8?B?aXhzcFZsYUY2aFhaWWp6cEEyb3JtU21SVUhjd0NUdlZZMFUzdm1wckY5RGoy?=
 =?utf-8?B?cTNQTVJZZGtPR0xwWE9lNTBCaVZLK3kzTDQydSs0RWpxY2d1RDd2cnB5UnJV?=
 =?utf-8?B?KzUrbVdCMWs4TStUSHcxSXZzWndSVmc2eWszK1pmQjRSUWhuc3BmK05kdHVF?=
 =?utf-8?B?QnJ4L0d0VU9WaEloMXpXTUl4MEIrMFNRSitvbVdaWkI2R1NnZDZndWVhejdY?=
 =?utf-8?B?WDJqOXhlQVVZaWZOVWdFelhsRWVaOFVKSVJoWlV5ZklwcWo1eENRNWR6SkZG?=
 =?utf-8?B?K2oxczNVR3pFOEpYUTlvZGZoNVRIejBLU0Evd0toUnZPZTRZZnFTZG1SSk1C?=
 =?utf-8?B?eThWVTdyVU04Sm1ZdUlTYndPZHNaMFBoQUprc0sydWVnZWVBVmZlZWo1azhB?=
 =?utf-8?B?VXJaS0dXOFdxVm5jTGZzV0ZWRkxySmtxdTF5d0U2V3lpOGtLcktZbmtHWEJJ?=
 =?utf-8?B?QkgrNXA2cmd0TVlaMDNpVkpEaGd4Nzg1ck05dkxhRXlMTGY0S2dxQWhHM2Va?=
 =?utf-8?B?bFlDMEpvVE5pNEZWZkx3QldZd3NzU2hBcDRNTDdSQmlRZ3Bsd2N3K2loZlNE?=
 =?utf-8?B?cU5JaURaRS9xT0VTaFl3OXJQZ0c1MDJFT01KRzhGMWNLMTZwMTNjeFRTbDUv?=
 =?utf-8?B?RzlVK3YzMTJFRUNYd3d5a3M1Y0R5NW0xcUcvLzlZdEc5c2hyb0hLVU1Ia2xq?=
 =?utf-8?B?WUNtVkY0NndhbDRQb252NDhQdlVzUXZLOHBmSTVJeGJqRlJjd0dDanEvSmJY?=
 =?utf-8?B?QlJGUCtCUzBSUENuZGd6SjZnOW94ekhoRGREOFVXdzlKOU14cTQzMzJhek1y?=
 =?utf-8?B?Q2ZHYW45YmRUSXZvM2ZvQlpIQUo0cnhybWN1cElraVpZRTJqTFh6NzBTQ2Fw?=
 =?utf-8?B?a1JsZUhPeDI0em9Oc0c5elpiK3hUbjF0STFOZncrbU13eVgxVnI2UVJ3ZGlQ?=
 =?utf-8?B?OFk4djF0VGlxZFlISitBeEQwNHM4UTdKRjBCdkFYVXc1Q1MyVTdzejE4dUdx?=
 =?utf-8?Q?D6gA0ScV6c5CFa3aNyWD/WtZdnjXQott?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHVTWGlMZC9nelJVL0tDS3c5c2IxbFZOVEtCZzdKVTBCN21jL3N2YnVSMG9i?=
 =?utf-8?B?QVpIQkFMOW1UMHFrb2IrSm9EMVZSZHNNZnRnM0pwdUlkMnE5cHhweG1ocnFI?=
 =?utf-8?B?TTV2NEJONHpHQlJwTkJQQmtRMnpvaEFLTGxnV1BIT1AzTHhURjBpWnpORTQy?=
 =?utf-8?B?bFd3OHp3MmcvWmJEUXRrOE9TYVg3OFNTdktNUitlc1VuZUpYK2tBdjdQVkg4?=
 =?utf-8?B?WU83eURnUXFGS2hBVVdENnB1cXZMT1JLNGgvR1B3a2c1RGdNMjFzaTRLRHJP?=
 =?utf-8?B?YWJaTkM2VUtEZHMvOHVhWEVmZnR2cHhUY0E1TTNVc3hhSnFZUWhScmhuby92?=
 =?utf-8?B?NVVSOUlLSkM0T0JCdVlINlJVQkZvS2JWRjlIUXNvMG9XWVZqM1k3WFdqcFll?=
 =?utf-8?B?Yy9YUzYwdVhTRzNjUlJONmhnV2lORUNpUmhVOXRtMlpGdkFRbEQ2YnAxZVRi?=
 =?utf-8?B?MUFCUUVseTVwbHZmRDRMSDJucTJjWnF1OWlGSmF5SzZIakdNWER5MVZCWUUw?=
 =?utf-8?B?c0VXUXliQTA0Zmt5MHBPQjFIWE9JRzVORmNRbXJBVWdjVFo2QTNlTUlnWXZ0?=
 =?utf-8?B?NTZGaGsxRUZVUlhraXk0VFJCeENqOUlaVUhNWUxRQzkyYzd6YXRaQTlHVWJ1?=
 =?utf-8?B?ZmhDUC9WTHJ6RGRlR1dUZ1daVkkwY2pUL3dQOFYrTVp2VG1ZTnJLY1ZycXpo?=
 =?utf-8?B?SlBUVmpUMnEzZ3ltbENiQVVOdXFyU0I2UFYwN0IxUGY5V0IzM3FqZWpOclNi?=
 =?utf-8?B?Z0JiNHNPY2NOMThiYUhvUzkyelBKcjEwUWhWNDl5cUlKaGhZc2hpbGlSdCsy?=
 =?utf-8?B?Wm45SlFTbW4zZUFZQlQ2WThjSmpyWnVIVEJTVUN4NEZnTW9JenBJZmdTa25v?=
 =?utf-8?B?RmZoa0R1RWRzNmNaNWhTV0dVSTVjV05xWmFEVU1IRVIvRXJBS1JHeWhkajFs?=
 =?utf-8?B?V0xMRFlrYjlxd0QvcWN5TGQ3OWM1QlFaZ2p5QVh3UThEZEV2NHhSVmtWWHlN?=
 =?utf-8?B?eVhrdENLWnpMc01lelp3L3VZemdJN3R5NHMrT1NERU95MTBiUjYyU25XWVlQ?=
 =?utf-8?B?LzRuUHVHcWdKL0lGV1JUVzI1bWJsYmt0d2pmY3NseWd6b0VKOU8zc1ZQVWNP?=
 =?utf-8?B?dkVNL3h6L0ZZRHN5VVhWdXppMExOZFJmanBiVkNpeGEvQ3hzUnVrS2FpMUFO?=
 =?utf-8?B?RkJQci9jNUEwelk3Q1FSMHZpWTNPeDdqQWtsU2dXYllwbjFHdXpySzlDSG1U?=
 =?utf-8?B?Znl0L3BzNE1jSHN3Z3pZOXBHMjJHMW03SWY4bTEvRkhCYlVVazFLaXV3cGJI?=
 =?utf-8?B?US94Z09YTCttWkZTcVkrZzFLbytXMmJ2L0NyYlc2UGNDRGdTYzAvR3N1bEd0?=
 =?utf-8?B?a2RNVWdkM2Z6R213Yk9acHpRcFFYTTFOWmhsWE41emxZLzk1WmtyT2lOc3Fy?=
 =?utf-8?B?SmdrU3BGOHNkbHFqNVFrcW1jZmdLcnFkS05nODRJSW1OZ1VnU1RKdGFZVjYz?=
 =?utf-8?B?blc2VnBOYkZ0Z1J2anViMXlTNHF4S1BkeEtpSUZ1SzZ3dXZkaWEydmJsK0lB?=
 =?utf-8?B?WW00Zm9NcXRORjFUdktoSElzUlhWQWhTU0xodGtna0t2ZmhnMTBYM09sMVcz?=
 =?utf-8?B?b0ZHUklHRElFY2o3WVByc2IzK0hINUd4NFAzWkx2OWI5N1VtWWtNdXVFV3NN?=
 =?utf-8?B?KzE1SThwNGNVZjdxS2xmTHBLYXF5WmNvTW0wdTdMWFdrWkx5MnNVcWNXbUdr?=
 =?utf-8?B?dk5uMUsvU0NGRzE2QVFnRWVEbms3eURiMm1BeUJ5SHZWMGxqZU9mckFLZXoz?=
 =?utf-8?B?d1QvSS82T0lHMGtQT2N4WGZmcjZCRjBhUEJUSmlkSG9iTStwYkdvMFZLd2FY?=
 =?utf-8?B?bXF0K0c3ZWtSVlpqaDA4SmlrK2llVStnYlMwNHVYTkYvM0tWanVQS3MxVFd6?=
 =?utf-8?B?akNacXZDSkNZaXp0a3RVcFBTQWJvN2xrakV4WG1jdElQWG5mdzd6UExmOGdM?=
 =?utf-8?B?MGJ3SzdFU0NwejJ6WTdTeHo4bUh2UDNwVmQwMDVoaGFvMU9IbVBRV21KQ1JF?=
 =?utf-8?B?UUFBYTFWazYyMitESEpNdndHN2lWM1oyUGlJV2RCU09ldlZjRUNqM3h1NXpH?=
 =?utf-8?B?cGVqNW1DZ09PaDVoWTNtbXVHUlZud2FTcVpuMFlxSFNUTEx5dDFTcVZJUFdK?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c474f61f-78e6-4ebd-f8c2-08de06af36ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:11:14.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrjkNMLs8bfFGjys0B/+166KPQNqJ+T3rhkJcgo/ffPuTEP/rwSvBqjSS87nAayK4zeHKcaWmHtafFsLhnYI1pTykoP7P2BrNxVKnrKyILw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
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



On 10/8/2025 8:04 PM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues, but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However, both GTs need to know when this step has
> completed. To coordinate this, perform the GGTT shift under the GGTT
> lock. With shift being done under the lock, storing the shift value
> becomes unnecessary.
> 
> In addition to above, move the GGTT VF config from the GT to the tile.
> 
> v3:
>  - Update commmit message (Tomasz)
> v4:
>  - Move GGTT values to tile state (Michal)
>  - Use GGTT lock (Michal)
> v5:
>  - Only take GGTT lock during recovery (CI)
>  - Drop goto in vf_get_submission_cfg (Michal)
>  - Add kernel doc around recovery in xe_gt_sriov_vf_query_config (Michal)
> v7:
>  - Drop recovery variable (Michal)
>  - Use _locked naming (Michal)
>  - Use guard (Michal)
> v9:
>  - Break LMEM changes into different patch (Michal)
>  - Fix layering (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 112 ++++++--------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   3 -
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   6 --
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  81 ++++++++++++--
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   7 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
>  6 files changed, 116 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 6f3d9bc5ed22..aeadeb29d5ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -438,13 +438,17 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u64 start, size;
> +	u64 start, size, ggtt_size;
> +	s64 shift;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	guard(mutex)(&ggtt->lock);
> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
>  		return err;
> @@ -453,20 +457,28 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	if (config->ggtt_size && config->ggtt_size != size) {
> +	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
> +	if (ggtt_size && ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> -				size / SZ_1K, config->ggtt_size / SZ_1K);
> +				size / SZ_g1K, ggtt_size / SZ_1K);
>  		return -EREMCHG;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> -	config->ggtt_base = start;
> -	config->ggtt_size = size;
> +	shift = start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
> +	xe_tile_sriov_vf_ggtt_base_store(tile, start);
> +	xe_tile_sriov_vf_ggtt_store(tile, size);

since we always store both base&size maybe we can have single function:

	xe_tile_sriov_vf_ggtt_store(tile, base, size);

>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +	err = size ? 0 : -ENODATA;
> +	if (!err && shift && shift != start) {

hmm, this !err is weird, maybe we should just have:

	if (!size)
		return -ENODATA;
	if (shift && shift != start) {
		// fixup
	}
	return 0;
> +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
> +				 shift, start);
> +		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);

hmm, so now we have 3x calls to the tile-layer

	xe_tile_sriov_vf_ggtt_base_store
	xe_tile_sriov_vf_ggtt_store
	xe_tile_sriov_vf_fixup_ggtt_nodes_locked

maybe we should move more logic/logs there?

(but can be also done as follow up, as part of not-querying ggtt from media-gt,
or just checking consistency there, without triggering any bad fixups again)

> +	}
> +
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
> @@ -546,7 +558,9 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
>   *
> - * This function is for VF use only.
> + * This function is for VF use only. This function may shift the GGTT and is
> + * performed under GGTT lock, making this step visible to all GTs that share a
> + * GGTT.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> @@ -592,58 +606,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.num_ctxs;
>  }
>  
> -/**
> - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_size;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: base offset of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_base;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	return config->ggtt_shift;
> -}
> -
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>  {
>  	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> @@ -1048,14 +1010,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> -		   config->ggtt_base,
> -		   config->ggtt_base + config->ggtt_size - 1);
> -
> -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> +	if (xe_gt_is_main_type(gt)) {
> +		u64 ggtt_size = xe_tile_sriov_vf_ggtt(gt_to_tile(gt));
> +		u64 ggtt_base = xe_tile_sriov_vf_ggtt_base(gt_to_tile(gt));
>  
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> +		drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> +			   ggtt_base, ggtt_base + ggtt_size - 1);
> +		string_get_size(ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "GGTT size:\t%llu (%s)\n", ggtt_size, buf);
> +	}
>  
>  	lmem_size = xe_tile_sriov_vf_lmem(gt_to_tile(gt));
>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {

nit: this could be inner previous "if (primary_gt)" as

		if (IS_DGFX(xe))

> @@ -1147,21 +1110,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> -	s64 shift;
>  	int err;
>  

maybe we should add small note here that below query_config() will actually do the ggtt nodes fixup that remaining code must take into account?

>  	err = xe_gt_sriov_vf_query_config(gt);
>  	if (err)>  		return err;
>  
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0adebf8aa419..2eb793a2d8ba 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index aff76051c9bb..0d9e217989af 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -14,12 +14,6 @@
>   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_gt_sriov_vf_selfconfig {
> -	/** @ggtt_base: assigned base offset of the GGTT region. */
> -	u64 ggtt_base;
> -	/** @ggtt_size: assigned size of the GGTT region. */
> -	u64 ggtt_size;
> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
>  	u16 num_ctxs;
>  	/** @num_dbs: assigned number of GuC doorbells IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index 02430a53da9f..043d93844a32 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -9,7 +9,6 @@
>  
>  #include "xe_assert.h"
>  #include "xe_ggtt.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
> @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>  {
> -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u64 wopcm = xe_wopcm_size(xe);
>  	u64 start, end;
> @@ -232,7 +231,7 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   */
>  
>  /**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
>   * @tile: the &xe_tile struct instance
>   * @shift: the shift value
>   *
> @@ -240,17 +239,15 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * within the global space. This range might have changed during migration,
>   * which requires all memory addresses pointing to GGTT to be shifted.
>   */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> +void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	mutex_lock(&ggtt->lock);
> +	lockdep_assert_held(&ggtt->lock);
>  
>  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
>  	xe_ggtt_shift_nodes_locked(ggtt, shift);
>  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -
> -	mutex_unlock(&ggtt->lock);
>  }
>  
>  /**
> @@ -285,3 +282,69 @@ void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size)
>  
>  	config->lmem_size = lmem_size;
>  }
> +
> +/**
> + * xe_tile_sriov_vf_ggtt - VF GGTT configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the GGTT assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	return config->ggtt_size;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_ggtt_store - Store VF GGTT configuration
> + * @tile: the &xe_tile
> + * @ggtt_size: VF GGTT size to store
> + *
> + * This function is for VF use only.
> + */
> +void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	config->ggtt_size = ggtt_size;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_ggtt_base - VF GGTT base configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: base of the GGTT assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	return config->ggtt_base;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_ggtt_base_store - Store VF GGTT base configuration
> + * @tile: the &xe_tile
> + * @ggtt_size: VF GGTT base to store

ggtt_base ?

> + *
> + * This function is for VF use only.
> + */
> +void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	config->ggtt_base = ggtt_base;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 86d750a57530..749f41504883 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,9 +11,12 @@
>  struct xe_tile;
>  
>  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
> +u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
> +void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
> +u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
> +void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_size);
>  u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
>  void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> index f49afa8338f1..140717f81d8f 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -12,6 +12,10 @@
>   * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_base: assigned base offset of the GGTT region. */
> +	u64 ggtt_base;
> +	/** @ggtt_size: assigned size of the GGTT region. */
> +	u64 ggtt_size;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;
>  };

I still think that pure GGTT selfconfig move from gt to tile could done without remaining changes,
but I will not block it as now it's better than before (only GGTT changes in one patch),
so with most nits hopefully fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

