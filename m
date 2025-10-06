Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FF4CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 22:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780CB10E097;
	Mon,  6 Oct 2025 22:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5pyvFQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8F10E4EC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 22:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759789641; x=1791325641;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VrC9jGdiQvS+PvTxR1pywe05vDyF3APFGjcoexhk7J8=;
 b=A5pyvFQh5RA6TzOAHuyNHPL9qe3WBsOBUAMgBfu5k7K5AdAUv417WB9Q
 ABHuqWhuRzJSXIE6ve01ike7fTt4j91/vqzX4Dly93Vw1lv7cEJ7DwSUA
 8+8ez0NgG1NbQwj9gQQyqLg2o9+LCCiI6Y6wjUD9odPruElsubQ6wkLcR
 WaHecPgTIGZTBNj33zwyXUCD719o1iQFjsSxGQU0ugeAORMlQDCFlN5um
 08KyQXeepUI0OccXBT5YpF1jGMm079oCPF5eiMYtLGDLF1syW76afq4Yn
 RJA3kaLjlC3RWhHBWrmNI6vms/rFk2itsS/A+so64GLXv405MIQXrfJYe g==;
X-CSE-ConnectionGUID: ZkmAh0yiTmCJZHAH1NkWVQ==
X-CSE-MsgGUID: iKRN/zg7TvCOSPpJSVF2jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="84596303"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="84596303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:27:20 -0700
X-CSE-ConnectionGUID: rNUaATqPS3uBCjwS0bT66A==
X-CSE-MsgGUID: NEGWe9YYShK5AXlI0sAydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179807171"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:27:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:27:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 15:27:19 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcqECoQYZeZYKWwmqnYN30GKxTW3rg0M2zw6xpoUXulwBEvDafunQaTff3zVuujPYFxsQ79lezJvbNHaBfHiu1I62rpIhMbH123JRoj5P71rMLkM0xj4otmpZHw0Igo08tSKfukn6HmjbnGQ6co+YSNxVpWmdrF2cknpRrvbOfrR5HloCUJ8EGekdeFvmd/zaEIo6iiIee9KRWmMYtweh/P2NF5Y7nuFYg+oUJRaiNHlgbvryyGlEu+y+4LcjV8DTanNqXFP3VCDpKY5cbjrCQd708yFZuAS5OvjXPJSiqdCjHF+7DBE93k2UWWMA3jW8g72hKf2XxcorsZDOfelIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQeK7F5iGI/4YY/AiSiqjEpGmrJdtWYAHCX1W2bVZiE=;
 b=FDUwYeUghZe5yb+8bShBiIZfpkcb3g3GW5tADwr4Cd3UF9bxeaxowi878LW0GZ32NDrzMz0Osey8POhEpBWuVUiQ4BdbzYack6YdST8Cn9mn9TwtsnchKPSq+tAYiWQzgOzxDH/PDjyvi3yEik1hxqxq1XnerOuXoma6KNHoQNfBzhvJTGJHQ2Cjj7bQ5KOY8lk02P/UexqPWcvbpKHCtp2gUl7GbYecMeYhxH6cDv+S+bkVrUp47qjmlvM6GIi4uvNNaQadKx9uGIgxIOnxh4oHRPfMpBe6SbErzOBoap0orCoKsx4pvYbMhGrIXEerJmBLz5VtsCXQBe6xA7xtjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:27:13 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 22:27:09 +0000
Message-ID: <22e28a11-7798-4f90-a09c-cb20850c5988@intel.com>
Date: Tue, 7 Oct 2025 00:27:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/30] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-15-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006111038.2234860-15-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0133.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CYXPR11MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8fa22f-0b3b-4f07-3b84-08de05277d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFoyVXRuTXExWGcyM3dzSnZHWmdOdGRtZWJpaDVoanF3UnhzTXNYUlZob0x2?=
 =?utf-8?B?OTRSK3M2U1pjL0c0S29scVlDWGl0WjdFckhpSjA3K3JBSDA3eVlaYVdIVDJQ?=
 =?utf-8?B?TldoekY2OU45WFlvRXlqOFlSMU1Cc242aDZVNkM2ZUUrVDlYbDJLOGdOYkhJ?=
 =?utf-8?B?NHN6OFFET2kxYWdFTzNNTGhoQXdRTHM0c25PeUNCN0pXL2RRYnJ2Vit3WUxL?=
 =?utf-8?B?NjN2dUdGSzBYckRrL3U4bzJncngzVXVIa3ZqejVnVHA5VTg1d1NYRkZna0Rn?=
 =?utf-8?B?dUFPcGlEUTR6SzdmSnFtR1BxN000Ump2V09HellNQzJrWjN0UXQxRVo1WEVk?=
 =?utf-8?B?TUJZQ0ZnVmw0d2t2bDdFV1RPVHBTV09BQkl3b3N3bDRXUHFGVUZrS0R2L3dq?=
 =?utf-8?B?S09NNnNGeGJZNHc3ZFZ2ZVRSbEU4TWN0ZWc4ekNkT0tKdVRyanNwSVZYSE5B?=
 =?utf-8?B?RUZSeTN4dCtWbXRqdDYrbGhrSlBJN2swaW5JekFHSmxoYlhQWmlNTzRPaDYz?=
 =?utf-8?B?N1paSjBJb25HT3h0aTJlaXdWcHdtYXZCMndlZ2lkTkVpVFlDU0lWMWg2aDgx?=
 =?utf-8?B?c2E4N2lEbTJnVjhGdXB5RWF0emsrVGFJbDdEbVBRaDd5WkRQT3RJMjhrMXlp?=
 =?utf-8?B?VFFDQ092RDZYUGdvMXFQUndoNzR2T0NEVWVHRlQ4blplSXZpR2t4emVqanl6?=
 =?utf-8?B?d3ZiamVFeHVsVXFKTnZDZnY5ZEZZakcyWnBST3gyUXJTUE9pcC9yMmg0OS8y?=
 =?utf-8?B?cXYvaHRrc2ozN0YzL1VGcXNiSmQ4NHRFTkdVcE1ESHJ5ck5wYy82K29CQjh0?=
 =?utf-8?B?aTJldEpLT2VOTDd1VUc0Z3ZGUWM4NWpoZFRxblh1eFAwN3JnV2F2SUJOSnN6?=
 =?utf-8?B?YzVkeUVETG84MmN5enFYTExoL3JETWpnQUx1U2Zlait6TXpMdnA0cmNWYVZo?=
 =?utf-8?B?WVpqZVVXUUtuNHdzK0ZuMzVpSDFVdkJEZHJ5NmFvVjA4em0xSGNvOXQ1Wldr?=
 =?utf-8?B?ajVkQkxTd0hvWWhVNHJSYlRCdzllNGNnTmY1eUZDNHRzY1pLUS9OM3pXZldT?=
 =?utf-8?B?NDBkUWhDV0V4K2F2UVpUT0N3SGFHRTF1dG8rSHQ3ajZLaUEyZG1sTzNmVUJp?=
 =?utf-8?B?ZWZWK2Fodms5VS9kVVdrc08vU3NmZ2FUMVpOdWdFYlo5Ym1OSnVWZGFxdFA0?=
 =?utf-8?B?aTdnNVlJd3h4YzlLNEx0M2JaOGcvUXZUTTR0c28vZE5CVDZyR0NrdUlBeHkz?=
 =?utf-8?B?QTIzSXpGOVh1RXFnNllndU5lMk1RMExnYU1pbUc4ZU0vKzE2ZUhLTTNmV3M1?=
 =?utf-8?B?aWxHUGJUbjRCcks0YklFU0VuMk8rMi95Y1JpTXlKb0NycytZNFNJd0NqQ2gw?=
 =?utf-8?B?a2tvWEJhbWdadjhUQnplVFo4Z3BPOXpEaUcvNlNvWDFRdkgxNHg5MFErd1FC?=
 =?utf-8?B?Skpkb20wci9nZmJLRnZzSFRLZXlaSVIzMFJYKyt5Y3RKbkhoZWNJSk9FM3Bu?=
 =?utf-8?B?ais1Q2MrWWxmN0Z2NXdrZ2NTN2Q5WEFHa3dNMEJPS3pPbjFMV0w4TTkvL1cw?=
 =?utf-8?B?cmd1VkoydU5aNjNBdytHTGdkODlXM3l6bkludTRieVhrWVBQTXZrbkQ5K2xY?=
 =?utf-8?B?VU1vREEvZHEvOWZvbSsybEo3dHRBbGg2VDVyZE1XQlVDSnZmRU55M0RheCtC?=
 =?utf-8?B?dDYzK2JUVzFGNVZGOXc4MzF5VURQQmh2cThaNE9nVXVyOVEzMFp3N2l2LzM2?=
 =?utf-8?B?REFLcWFoTUFMMTFFVTFBS0M4NlZYeXUxQi82UnptWFI5RTh4TUIzRFZwbFBr?=
 =?utf-8?B?WFJoRE5BZWVpTEFLQkgyOVowOCtuMUVPeGsvTk81a200bW8vWEhxOUpJREkv?=
 =?utf-8?B?dGxLN0xEeW80cTlxVDBkcTcwb1hpUGlMZi82ajlacnNYYUpuSHJTUnpKR3ZE?=
 =?utf-8?Q?tlyixEP6Pvmyy+9Fim+YRTMuJ0wYBUZe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dpem5KZlF1MkxjOFd2S0pab1NrY1U1VUllM3pmdnp6bG1yL1VMVXA5ZkhX?=
 =?utf-8?B?aTZSdGt3Vm1oZ1YybXFvQlk3MitlS1hsVFJjOHFSOVJuLzg0dGcxaitwbjVM?=
 =?utf-8?B?Yy9NdGx3a3MvSTkyMGZDQlRBbDRaVHFWNnZCZk40K01uQzVGTHByMUUyaE1r?=
 =?utf-8?B?YzZMdUoxa3FYSzF3cytRUS91Rjl4MnlhNjE4dkZFN3k4TDM4bSswMnFFbVlz?=
 =?utf-8?B?M2swajcrQW9UZUhiOXN5ZnRhSFEvK1NzSHVHY0NQWHl0VkFIZW40WFNCRVI4?=
 =?utf-8?B?d0V2ZzM2ckdRSDFMTDNhdEd3bXkzNXR1ck9mampiQ0VnR1krVjZIWXZnK1JO?=
 =?utf-8?B?dWJrOCtLUEVoZnQvYW1aVVk4elZnQmJMUGJEVUdLSlh5YnIyMnJBdmNVZzR1?=
 =?utf-8?B?c3RDZkRpVWpOdU90RThqcEdaRWxTeXRhck16L1ZLbzVMRkxsWE9Rem52d2Y2?=
 =?utf-8?B?LzQ0NTgyNDZ3dHVzQS9HNXl3ZHRRZUZCaWxtV2xrdmlJUkhncTVxb1lhcmc3?=
 =?utf-8?B?Y3o4aUs1NHZwdUV0Y0EreU5XT3pmRlNLMWhPa1hxa1RUVnBvKzBKZWRwenA2?=
 =?utf-8?B?QWFVMi9JWnhWaVR2NmpTdkVZVXQ2c3NxbllnVUc3OXdTSGhXZ2pUTVFBOTVD?=
 =?utf-8?B?MmNzL1lraFRlcVRqeGt3KzhpODRIKzBJNDRtenF1NHlWQjVFcWZMRUZycER4?=
 =?utf-8?B?cHNrcjB0TlVLT0RIMnFsVjJZMFJZTkdOeWVyUXBJQXptS2UyclY1R1BDdVh2?=
 =?utf-8?B?Z3owTTFrV0Zhbmg5QlVGWGQxUUYrUFRBMzFlUlc2cmRyNUFCQ0ExWExFMGJG?=
 =?utf-8?B?YWtJakZYRGs2WUJxS25aOTFwVm9jVUV3b0pobWVZbTBSWUpqc0l3R0hRN0NN?=
 =?utf-8?B?c1ZTdUlIWGNySEEyTWJ5cm83RjZyWGtBY08zNHQ0bzdpTVNnNm45a1kyS2FR?=
 =?utf-8?B?OEhQQ1RSY1Q2Q0Z5ekhvNzR1OVBqVkluTWowd0ExT0NxVVRaMG9ySWdqd3hu?=
 =?utf-8?B?blRDYUc5Ui9iSDJzcXd0eGhhUlp3dWlkSnpGZVg3dU9KM20rSW5KRWxvZkZk?=
 =?utf-8?B?WmgwQlpvMHA4dElHQm1GTnhpRG00U0dobG1XaTlzemhiRzNSOGptblpkVXJT?=
 =?utf-8?B?K3JLejZGSlAxMWduUkFEV29JUUkwQWNWTmZmKzZFS1M2SUp3WnR3VWlGNW1C?=
 =?utf-8?B?ZU4xWmh6L2FIVGc1UE5BalNIaVJnZlVybmZaZTZRS3ZGVG5vUkF1bmsyaXJp?=
 =?utf-8?B?YXNuM2hjU3BFTWpvVUxsS05aUFU0Umg5TDdVQ1F5UDJNcGVXWGI0YVlZeFV4?=
 =?utf-8?B?dGRxNVE5V3lBdFNLN2hyVW9CaDRYTitKUFZxdTlabFhJWEgrUTdla3VuTjAw?=
 =?utf-8?B?WHlabU9kN3UyUDI5RU5ZR1gycFBwU0xhdGpBaWc2K1JxU3Z2c3VEMFhKN2Ew?=
 =?utf-8?B?Y3RDOTVwRWpiNFEzOGRkRlI2OEttOWpUUi95dThuNXdseWJyN1ByYmhBZm5K?=
 =?utf-8?B?Q1FmazIrU0czbkxLcFlKK1M2SkFoL2xpcTk1S3NseEFneDRQcDJmYTRPNWl0?=
 =?utf-8?B?V2VrU1J1OWVqV3RDZEF5ZDhPajYzUGI2OUJ2NndSREIxVllzNSsvTW9FSm5y?=
 =?utf-8?B?dHRQYXN5Y0ZrRUticG1HZEVoZ0oxb09rcHp2emV6dytkVkF3Z2hBaU03Kytr?=
 =?utf-8?B?cEE0bFA3QmlJYjZ4MC9UczM4Q3k5YkJWa2U0a1kxZG5WOG81TktUNHRtQWJq?=
 =?utf-8?B?Vm9OWTR1NjM4cmZHMDZSUThoQ2pzcWFhdTRlVjZJQVpJY0NVNDMzdmE5SEw1?=
 =?utf-8?B?MjZ5L2l4bFpJbTdMQndwcVIwaHN4bjVaMmFwL1hESThTeDJkajVlQWlVU1VP?=
 =?utf-8?B?dHpkcm9ISHdkRnRwbG1RcDlUd2Yxc2oxQyt2TWRueElmTWcrdHlTakpTY3VE?=
 =?utf-8?B?Rk9BRHI4VU93bDBRUTRKaURFbjJZOXNZWjhQU212MGhYdlZLZUsrc3czMGhP?=
 =?utf-8?B?M1RoSzFlRndkNk9pZndCVGpCaUJSdys2d2ExdGF0NWRqdjJLRWNNSlA2Zkts?=
 =?utf-8?B?Snk5SktLaDNmVmRqRlB6RDlGeTlBNG54dzNJMTFDVVp1UDZIODdyNjhYR1Ni?=
 =?utf-8?Q?ElnqjgT8j6Cwh+n2MRL+ziz9q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8fa22f-0b3b-4f07-3b84-08de05277d2b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:27:09.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8XevaKKS2jprq/A3dI88NqLLKKU0dzoG3mI1RH73LDF4ArPSZpoeheI2FQyBq35xglzchpT9x0RTDzTOLd/zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
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


On 10/6/2025 1:10 PM, Matthew Brost wrote:
> If VF post-migration recovery is in progress, the recovery flow will
> rebuild all GuC submission state. In this case, exit all waiters to
> ensure that submission queue scheduling can also be paused. Avoid taking
> any adverse actions after aborting the wait.
>
> As part of waking up the GuC backend, suspend_wait can now return
> -EAGAIN indicating the waiter should be retried. If the caller is
> running on work item, that work item need to be requeued to avoid a
> deadlock for the work item blocking the VF migration recovery work item.
>
> v3:
>   - Don't block in preempt fence work queue as this can interfere with VF
>     post-migration work queue scheduling leading to deadlock (Testing)
>   - Use xe_gt_recovery_inprogress (Michal)
> v5:
>   - Use static function for vf_recovery (Michal)
>   - Add helper to wake CT waiters (Michal)
>   - Move some code to following patch (Michal)
>   - Adjust commit message to explain suspend_wait returning -EAGAIN (Michal)
>   - Add kernel doc to suspend_wait around returning -EAGAIN
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  4 ++
>   drivers/gpu/drm/xe/xe_guc_ct.h           |  9 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 82 ++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_preempt_fence.c    | 11 ++++
>   5 files changed, 88 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 27b76cf9da89..282505fa1377 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -207,6 +207,9 @@ struct xe_exec_queue_ops {
>   	 * call after suspend. In dma-fencing path thus must return within a
>   	 * reasonable amount of time. -ETIME return shall indicate an error
>   	 * waiting for suspend resulting in associated VM getting killed.
> +	 * -EAGAIN return indicates the wait should be tried again, if the wait
> +	 * is within a work item, the work item should be requeued as deadlock
> +	 * avoidance mechanism.
>   	 */
>   	int (*suspend_wait)(struct xe_exec_queue *q);
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 7057260175f3..7f703336d692 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_gt_sriov_vf_types.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_guc_hxg_helpers.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
> @@ -743,6 +744,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +		smp_wmb();	/* Ensure above write visable before wake */
> +
> +		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>   
>   		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>   		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index d6c81325a76c..ca0ec938edac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -72,4 +72,13 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>   
>   long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>   
> +/**
> + * xe_guc_ct_wake_waiters() - GuC CT wake up waiters
> + * @guc: GuC CT object
> + */
> +static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
> +{
> +	wake_up_all(&ct->wq);
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 59371b7cc8a4..b2ca4911efe9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,7 +27,6 @@
>   #include "xe_gt.h"
>   #include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
> -#include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_ct.h"
> @@ -702,6 +701,11 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>   	return (WQ_SIZE - q->guc->wqi_tail);
>   }
>   
> +static bool vf_recovery(struct xe_guc *guc)
> +{
> +	return xe_gt_recovery_pending(guc_to_gt(guc));
> +}
> +
>   static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -711,7 +715,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>   
>   #define AVAILABLE_SPACE \
>   	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> -	if (wqi_size > AVAILABLE_SPACE) {
> +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
>   try_again:
>   		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
>   		if (wqi_size > AVAILABLE_SPACE) {
> @@ -910,9 +914,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   	ret = wait_event_timeout(guc->ct.wq,
>   				 (!exec_queue_pending_enable(q) &&
>   				  !exec_queue_pending_disable(q)) ||
> -					 xe_guc_read_stopped(guc),
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc),
>   				 HZ * 5);
> -	if (!ret) {
> +	if (!ret && !vf_recovery(guc)) {

Is it possible for vf_recovery() to change its retval between the above 
llines? Ending the wait due to recovery, and then forgetting that happened?

Maybe we should assign to a local?

(concerns all places where we do the check this way)

-Tomasz

>   		struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> @@ -1015,6 +1020,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	bool wedged = false;
>   
>   	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> +
> +	if (vf_recovery(guc))
> +		return;
> +
>   	trace_xe_exec_queue_lr_cleanup(q);
>   
>   	if (!exec_queue_killed(q))
> @@ -1047,7 +1056,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   		 */
>   		ret = wait_event_timeout(guc->ct.wq,
>   					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			return;
> +
>   		if (!ret) {
>   			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>   				   q->guc->id);
> @@ -1137,8 +1150,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
>   
>   	ret = wait_event_timeout(guc->ct.wq,
>   				 !exec_queue_pending_enable(q) ||
> -				 xe_guc_read_stopped(guc), HZ * 5);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>   		set_exec_queue_banned(q);
>   		xe_gt_reset_async(q->gt);
> @@ -1209,7 +1223,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * list so job can be freed and kick scheduler ensuring free job is not
>   	 * lost.
>   	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> +	    vf_recovery(guc))
>   		return DRM_GPU_SCHED_STAT_NO_HANG;
>   
>   	/* Kill the run_job entry point */
> @@ -1261,7 +1276,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			ret = wait_event_timeout(guc->ct.wq,
>   						 (!exec_queue_pending_enable(q) &&
>   						  !exec_queue_pending_disable(q)) ||
> -						 xe_guc_read_stopped(guc), HZ * 5);
> +						 xe_guc_read_stopped(guc) ||
> +						 vf_recovery(guc), HZ * 5);
> +			if (vf_recovery(guc))
> +				goto handle_vf_resume;
>   			if (!ret || xe_guc_read_stopped(guc))
>   				goto trigger_reset;
>   
> @@ -1286,7 +1304,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		smp_rmb();
>   		ret = wait_event_timeout(guc->ct.wq,
>   					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			goto handle_vf_resume;
>   		if (!ret || xe_guc_read_stopped(guc)) {
>   trigger_reset:
>   			if (!ret)
> @@ -1391,6 +1412,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * some thought, do this in a follow up.
>   	 */
>   	xe_sched_submission_start(sched);
> +handle_vf_resume:
>   	return DRM_GPU_SCHED_STAT_NO_HANG;
>   }
>   
> @@ -1487,11 +1509,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
>   
>   static void __suspend_fence_signal(struct xe_exec_queue *q)
>   {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
>   	if (!q->guc->suspend_pending)
>   		return;
>   
>   	WRITE_ONCE(q->guc->suspend_pending, false);
> -	wake_up(&q->guc->suspend_wait);
> +	if (IS_SRIOV_VF(xe))
> +		wake_up_all(&guc->ct.wq);
> +	else
> +		wake_up(&q->guc->suspend_wait);
>   }
>   
>   static void suspend_fence_signal(struct xe_exec_queue *q)
> @@ -1512,8 +1540,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   
>   	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>   	    exec_queue_enabled(q)) {
> -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> +			   ((q->guc->resume_time != RESUME_PENDING ||
> +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
>   
>   		if (!xe_guc_read_stopped(guc)) {
>   			s64 since_resume_ms =
> @@ -1640,7 +1669,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   
>   	q->entity = &ge->entity;
>   
> -	if (xe_guc_read_stopped(guc))
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>   		xe_sched_stop(sched);
>   
>   	mutex_unlock(&guc->submission_state.lock);
> @@ -1786,6 +1815,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>   static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>   	int ret;
>   
>   	/*
> @@ -1793,11 +1823,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>   	 * suspend_pending upon kill but to be paranoid but races in which
>   	 * suspend_pending is set after kill also check kill here.
>   	 */
> -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> -					       !READ_ONCE(q->guc->suspend_pending) ||
> -					       exec_queue_killed(q) ||
> -					       xe_guc_read_stopped(guc),
> -					       HZ * 5);
> +	if (IS_SRIOV_VF(xe))
> +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc) ||
> +						       vf_recovery(guc),
> +						       HZ * 5);
> +	else
> +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> +						       !READ_ONCE(q->guc->suspend_pending) ||
> +						       exec_queue_killed(q) ||
> +						       xe_guc_read_stopped(guc),
> +						       HZ * 5);
> +
> +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> +		return -EAGAIN;
>   
>   	if (!ret) {
>   		xe_gt_warn(guc_to_gt(guc),
> @@ -1905,8 +1946,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>   {
>   	int ret;
>   
> -	if (xe_gt_WARN_ON(guc_to_gt(guc),
> -			  xe_gt_sriov_vf_recovery_pending(guc_to_gt(guc))))
> +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>   		return 0;
>   
>   	if (!guc->submission_state.initialized)
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 83fbeea5aa20..7f587ca3947d 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -8,6 +8,8 @@
>   #include <linux/slab.h>
>   
>   #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_exec_queue_types.h"
>   #include "xe_vm.h"
>   
>   static void preempt_fence_work_func(struct work_struct *w)
> @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
>   	} else if (!q->ops->reset_status(q)) {
>   		int err = q->ops->suspend_wait(q);
>   
> +		if (err == -EAGAIN) {
> +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> +				  q->guc->id);
> +			queue_work(q->vm->xe->preempt_fence_wq,
> +				   &pfence->preempt_work);
> +			dma_fence_end_signalling(cookie);
> +			return;
> +		}
> +
>   		if (err)
>   			dma_fence_set_error(&pfence->base, err);
>   	} else {
