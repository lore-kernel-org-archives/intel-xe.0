Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F89CD59D80
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 00:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61D10E09A;
	Tue, 26 Nov 2024 00:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1b2IOrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E478B10E09A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732582213; x=1764118213;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BQst0s/Zdm775AmXGxzM5dBkIvcV3NiG5xYr8x6Kdh4=;
 b=P1b2IOrf1DP6/uKiAME14CmB1fpQzYq1CUxIObwKhkWQ0sBDaPadtP7x
 zcJFRfMo1zI0DOcuu7Ki/j/gE22tGGeeYL1t1gAteFnOpcPPt1/ZOZDOm
 gn4W8nuKgDcZkid3Wmyp9upybc676rU0VqTUPCOxiUh+dHj+x4HtblnxJ
 kFEy6Gt7jJPJtTMXeJ4HXVC2yqM48y66c6iC4SwGR5O3G+1bj2eUQNXoD
 UVI/tqUDwdtmKzXzQ88hRJ4rMBnZQ8LOLvZiSB9v9kHt9MV1GCTv3RuwB
 ++lQo+gSn3yD/OOquFPGzUe4n0mB1lGxH8KOE/MsgvWYMi1CI8Ggt7lrf A==;
X-CSE-ConnectionGUID: IESGHPBPR2aipjwVEbuEKA==
X-CSE-MsgGUID: rU+gw32iQf6+s/SXLcG9Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36500942"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="36500942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 16:50:10 -0800
X-CSE-ConnectionGUID: oHVGGLAvSmyGdecpca8q9w==
X-CSE-MsgGUID: MJHoPS+AQraI6KT2Rq6zBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="91767999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 16:50:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 16:50:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 16:50:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 16:50:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9shtQ1lz0EtgAiPvq1FlM9zZBMOwz8UQMv+P0cdC2b+EiL7JxXuj1NDcvIuVFsAuD2xCJdr6FnmpI0bBaU8F+uagoXPyovJ2FAOYGjzRRWjIRrK4T/h2jZgMZrmgE+Cb/Zita1PseOSqy74ax/I29ej1Yl2kTrtNgNoZ8+qKqSc4VQZETJlDrVRDDEdXUSB7PZ7bAQjbnKlprAPETp6wteQD1kaD92L3lv7d5Gj0FircVF3MljSkx0SWWuhN98cs49hby+AqBHuqF/uJs9mehw7SAO6ijFrk+Q801m/6z2g4OLZSdfplfn+R8vi3P5F64gDGLCk7cJVmv3AhhUCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFJfaqjURlfuh9Iut+oMQE/PPGFfdGeV3IeIszKqmco=;
 b=NBQkFBw3s0baLRentteQfTVSwZaQrm5xEX5F8Q8LJxw3yTYQvaf5hu8uHFLoRm6ARA6s9XFNKvpW5HxZjd4xSUMhJ1atZsgoZXZP/5GV+SUGzhF4Vh7B+eXf1wc7VsvyvWl8qerr5Fg655MX43ja0GrssIfQLRBZSi8EQDUFe/H9rhRIMdMBr7dAgFHXSHQgob8Apjyr+wZsccla1HOmqTJc+Pe6wyEEKm5vP+2/DN3yFbQ7v7K6YUtG6MTrN5WA+UeRVqeJeNFkjhPmiPgZHzt7zMlXITXXRlV45BDPIG7Ej5TL/qwBtIDAtgtHrBP3U2/LZi2rTFPr7cYJsETDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 00:50:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 00:50:01 +0000
Message-ID: <6adbc8b5-f627-413a-a7da-512660e17339@intel.com>
Date: Mon, 25 Nov 2024 16:50:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/guc: Fix missing init value and add register
 order check
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241119231356.1473342-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241119231356.1473342-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4ac83d-9a84-4894-c408-08dd0db44275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vnh6MzMyaFNHS2FHRnlrT0Z2akpTR2JqUHRIOWhzUXY2MjJ5eXpuUkZUeER4?=
 =?utf-8?B?RmJ2NHN3SkZuOXBtUUFQWEVTOVZDOWpzc0tQdUE4R0FaZkJmVHE0VXBmMGNy?=
 =?utf-8?B?VERGa3BxaS9tUk12NnF2cmEyaEJqaHNWOXRKV01xQVNuNXNENytYRHFPckt5?=
 =?utf-8?B?UFVaVGovNWo2VzREUW1oSTlUM3RiK0pKbGUrWUVaS05XeUhIMGI0L0tIL2ds?=
 =?utf-8?B?WGoxYUkrVFhYcG1Qc3hrTDB5ZDBVL0l4ZjJxVFhQUmhoN0hBY08wVklyaFds?=
 =?utf-8?B?SXN3ZW45am9EWXQzMlYvUk1qeFVYRTFjUk5vQUY4UkpxNC85dEEwTlNQQnQy?=
 =?utf-8?B?aHlScGluL3FEdVBUYVN0d09aN29mOGZZaEliRFROK3BhSkc1RkxyOUIzZUpW?=
 =?utf-8?B?UUpEQ3lHeHZQVS9BZmQxcFBJVERIRk1tbFZxWW9wb01LQm8zeW93ekVEVWc5?=
 =?utf-8?B?VW5lTTE2S1dtQnJSekF4WUE1eWJGbVY0WUpKSU9Pc0E5dzZWcStzUk11dE1X?=
 =?utf-8?B?YnlZWlhOeG85ampuTTFKU2lMNEdQYm1XQ3JTZHBQVk1KVXFPeGxoVE9YdTha?=
 =?utf-8?B?L0RkS0lEa1ZPLzdKRU1zME56TnlMRjJYNXN0eG1mZE82VkhhYTZuNjVDUC9P?=
 =?utf-8?B?U1hOenJyREgvRmtOTDNtL2xESUtqVHpqTnRiRDI4RzVlRnJyUEFtM1RKdjBk?=
 =?utf-8?B?bU13RzgvVVM1dE5vUXdxUHhtcGN0Rldab2xnNk9BczNUak81VWdLOTU2YVRD?=
 =?utf-8?B?bXVNYjRDUnkwMUV5cHpSZXZOUms0WENSTDZJWWxwem43V2VFWHdqTVMxOWdW?=
 =?utf-8?B?TDBIM0lnSWMrL2NhNHU1aE5HdjZsOTM1cUxReTZ0SFY5Tk5iaGl0aHlKbFJT?=
 =?utf-8?B?eXdzRDlEK245V2xBcUY0Y1o2TVVMUEJXYXBIZUtaVktFQVZBaGN5dUZwV3Bv?=
 =?utf-8?B?N0Y0VlBmSWdnWUlOcC9FRTlkcU0rNmt6VnRabHc2RU9IRG5uWjFIWmh6REZG?=
 =?utf-8?B?VWJwdXdvUEtuMmpNNDhaQ2txeGlVZnRFZDF3UUhqcUJEa0dLVzN3M2ZmSzd4?=
 =?utf-8?B?TE9iZVk3LzJ1T1FGSWJUb1dOUzRTQk5JT0tNZXFRQTNBajRMay9oUU9BV1dn?=
 =?utf-8?B?dTJlRm03WlRVb2pZWFJ1bHp3MzBobzJOQ01jWmkyTWdySFpGd3h3R0ZYTC9v?=
 =?utf-8?B?WTB3U0x0ajFpTWdNa0hsUktBR2dqbldkWW1oTDJBSnZCRml4Vy9zYmxaeXpa?=
 =?utf-8?B?dTZVRW5UMTBWV09Vb1lLOGR1b3Z5YjRQVnMrTGpJbjdUOUhtZVdnUEJ6dUJy?=
 =?utf-8?B?RlJaVFZKVEJhUVQ4eG5kQy81eFVINWowTncwNExqQ0Z1SEwxeHA5SUdOclpx?=
 =?utf-8?B?b29wOW9VMlJQc01wbFVkYlFJSzY3N29CektmL3h3VnFaak9Edis2VHFBdk9K?=
 =?utf-8?B?MGNpWUJnYk5ibHRWMktFdVFpTXlaYVdHZENWNHdzbUY5WndCdjM2bElwUy92?=
 =?utf-8?B?aTIwbVcrU09iaFMraW9saXlxbUd5dldHeFlTOGt5aFJocFVvRk8xU0Z6Y2xK?=
 =?utf-8?B?dDBQUjB4Y25PaWU2SkxIRVN0VElmMUVMV25Hb3N0bTBDamNPTHlqdE9KUTJD?=
 =?utf-8?B?S2NYVXlORDBSUW1EMWtDTnhtTWhzQVNYa3k1ajJ0NTc3S3l1OStCOW1xdnlP?=
 =?utf-8?B?aXN3cVJKWjhpeENDZFFlYksycUpmWkNrNVZYamRuZTB5SytQMFpFeWxEN2xZ?=
 =?utf-8?B?bGpjOG5xZHFMSEtxYXIycldIUVl2UHVRTWJTaEF6b3FtVWtMYkpYNzY5VmFM?=
 =?utf-8?B?Q1VjZktmaWhSWE95L0VpQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJ2S21xcG8rSWNuTjQ1LzVTeDJCNkw0eCt0M2dBNkNyRFJXTDRnMmhVWElG?=
 =?utf-8?B?N3pCMlM3YjF1Sm1kZUw2Rk5tMFYzUVVoREZaWksvbXRrODFBNFB6QnBhaEpa?=
 =?utf-8?B?ZU5hNkVMK1lFQWpZanhaQkE0elJvb1lSaWQybzcvc3Exb3lrQnlBdTNDT2U5?=
 =?utf-8?B?VmRRRW9ySGVScFgxSml5RGlDU0tubXRYTitjUnRCdW9hVGFIdGwrcWNLeDZ0?=
 =?utf-8?B?SU05eG9qMXQvOVpCVk1TYVJrbVdKaFhtaVQzNFRQOE82R3JiR0NEbitTSzBv?=
 =?utf-8?B?SSs1LzVnRVZhTHM2YjF1NTZ3cnRFeGFBWDFGMFhaNmVOZ25SUTQvUVFTbjhQ?=
 =?utf-8?B?SG10aEhPMGlwR0w1RXFoT1FwcGtNYlNBSUpLa2kxbTFWeVI1TUNVeHArcFN0?=
 =?utf-8?B?QWp5THNEQXpFS2ZxRy9KUXFTS2NHMjN0QWlZekRENGlwQU9xdm9SczE4WEov?=
 =?utf-8?B?NTBpVk5CVExjdzZLd0cvZXdsWTU3TjBYZjBZK1JicWlCbDZ6ZUJnd2t4NTFj?=
 =?utf-8?B?U2hmQnlQbU5VUnY0QVNweU5JZVJmMVJ1U05RaC81YXBJK3dXS1QzWXRqSzV4?=
 =?utf-8?B?KzFVT21lbGp3L3p2cDM3SHJWSG8rTzJIcTlITzdJM2M0UDNyUzE5ZmdGSjJF?=
 =?utf-8?B?cWhHNm95M3FlNGlFN2VKRjk1eldkK0FNZzhXdFR5aUY4WUlWdjhzS21CZ291?=
 =?utf-8?B?QXNOZU5kbktuYlF4QU00RjdRNm9lMWpwTC81cnl5UVErTE11RC91dTJMYVEx?=
 =?utf-8?B?TmJuazdETWQxWXVrOEY2TURVemRsZ1htem5UQVdJM2U5T3Q4NVo0ekptVkR1?=
 =?utf-8?B?ejhNcjBuTDRQcXhRRUdLRCtyU2tGNWdQQmtrODZ3aTVWRmxGWWhHUXdCRW1B?=
 =?utf-8?B?SmtUTXFXdmppK1MrYy9qU05pZXQ3cnozQ0lFYnlWL1Jxc3ppRkkzQjMvbjdT?=
 =?utf-8?B?QU1JZjJZamdKT2srQXQzRzlWVTdJWEZodWtOdlVrcDJVOXZzWGs2TTFtS2JU?=
 =?utf-8?B?K2ZHZEYzb3lWZW9SWXh5UzBpOVJEY3NxMGMvdlBKMFhjazNRQ0k4bTFwU3Zo?=
 =?utf-8?B?VXZ5WlphMGhhNlp6Z0dGeTdGSEwxU0t4NTRXWmtDMG1leEhJa2NoM1d5elQz?=
 =?utf-8?B?OVhlTVRyeU1qek9pY3lDK3JJQ21Xd2NBQ3ZTZjFWanM3UDEwc3VEbVVGSDdG?=
 =?utf-8?B?Z3R6Y3lSUW14b0xIalVKcjNJUExMd20xYjdCQmhJQjI0OEQ4QVhaMzhKdEdL?=
 =?utf-8?B?Wk9KaThRVGNMbHRZWk1SZDFEaEsveFR2WHJYanRYQWlTajAwdTlIcDFqZ1Vr?=
 =?utf-8?B?bGl5SnpUZFA5VGpINnJYc2FrSVRRNURTN2VBdWRYTlRHWXVlcE0xWVVOUGtZ?=
 =?utf-8?B?U2RqOGlCYXpFSy9nc2JkVWNzS3AvQjNUMnZ0Q1RGQWUzbHRyMzRSSHd0MzFs?=
 =?utf-8?B?VUt4eUE5VmR6dWd1WGRISkQxZ0FRR081QjVwQTNEc0kxc0l5b21QWEUxK3lK?=
 =?utf-8?B?Vk9BWHFncmFkVk15VGMvTUJYaHpDcnFlejNDdktmeGtieWwwUEZaOGdNbEhF?=
 =?utf-8?B?VlRLRFNmdTNjNnl2TWxCOUJheUpZT2ljaHk4aEthK2dsZGJZdUk1aVpCUDBC?=
 =?utf-8?B?b2NOTFlObDQvZTBUakZtMTErYXVwb3ZsL0RMTFpSMk8yTUhydnk3NlZJdUp5?=
 =?utf-8?B?czltbW02dVFRazh3YVcvWWdwV1VBcUMwM3dhenlGTE9McWRqR29LN2VCR3Ev?=
 =?utf-8?B?SEtIS0FFQ0tnYVVqckZtTC9RZGhSVzdRWThIWlVWTUdmTCsycmVnRTVCZkl3?=
 =?utf-8?B?cjR3emQ0bk84bENpczFmeDBxc1V4ZzZUdmlhY0FjQVpQR3ZNZnRIbWNrVnV4?=
 =?utf-8?B?cU5ocWRlQWN6cHptclVSLzlQS0pCSHVlMHhtZFlCQWkyWmVUZW8xbGlvUm1k?=
 =?utf-8?B?a2FCcmFiNElCM01JZHFoWFNCU1FGTWR0eVlFc0ZCNGtMbXRnQVkxcWgvUFBR?=
 =?utf-8?B?TU1IVzJlQ2swdW1EblIwdU8rcDU4ckdCUCtmb04xVVpvY0JVbHErOWFxMGFL?=
 =?utf-8?B?RlRjZTZIQ2N3a0FTVHNkN0RTS09uT1luaHRxdzJBUWdLY3VaSFdhRHpFcGZz?=
 =?utf-8?B?Mkh5S2xpd09aZEpScUQ4OEpqMW5lcSs5RVNOUXJjWEpQM0lpc3BkVDNuS05N?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4ac83d-9a84-4894-c408-08dd0db44275
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 00:50:01.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xiHV9n8fqyjQSv0C7z3gZWzsy6oVuZJxVF9rlVFruLewx35znxTGZDXw9eIIKsPrVaWlBj2rL2MnOa8s01bTcumTfoYQDRAhJ27c7c63II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8424
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




On 11/19/2024 3:13 PM, Zhanjun Dong wrote:
> Fix missing initial value for last_value.
> For GuC capture register definition, it is required to define 64bit
> register in a pair of 2 consecutive 32bit register entries, low first,
> then hi. Add code to check this order.
>
> Fixes: ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Changes from prior revs:
>   v4:- Fix warn on condition and remove skipping
>   v3:- Move break inside brace
>   v2:- Correct the fix tag pointed commit
>        Add examples in comments for warning
>        Add 1 missing hi condition check
> ---
>   drivers/gpu/drm/xe/xe_guc_capture.c | 74 +++++++++++++++++++++++------
>   1 file changed, 59 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f87755af545f..b06811a822f5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
>    *                   A 64 bit register define requires 2 consecutive entries,
>    *                   with low dword first and hi dword the second.
>    *     2. Register name: null for incompleted define
> + *     3. Incorrect order will trigger XE_WARN.
>    */
>   #define COMMON_XELP_BASE_GLOBAL \
>   	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
> @@ -1675,10 +1676,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>   	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>   	struct gcap_reg_list_info *reginfo = NULL;
> -	u32 last_value, i;
> -	bool is_ext;
> +	u32 i, last_value = 0;
> +	bool is_ext, low32_ready = false;
>   
> -	if (!list || list->num_regs == 0)
> +	if (!list || !list->list || list->num_regs == 0)
>   		return;
>   	XE_WARN_ON(!devcore_snapshot->matched_node);
>   
> @@ -1701,29 +1702,72 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   			continue;
>   
>   		value = reg->value;
> -		if (reg_desc->data_type == REG_64BIT_LOW_DW) {
> +		switch (reg_desc->data_type) {
> +		case REG_64BIT_LOW_DW:
>   			last_value = value;
> +
> +			/*
> +			 * A 64 bit register define requires 2 consecutive
> +			 * entries in register list, with low dword first
> +			 * and hi dword the second, like:
> +			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
> +			 *
> +			 * Incorrect order will trigger XE_WARN.
> +			 *
> +			 * Possible double low here, for example:
> +			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +			 */
> +			XE_WARN_ON(low32_ready);
> +			low32_ready = true;
>   			/* Low 32 bit dword saved, continue for high 32 bit */
> -			continue;
> -		} else if (reg_desc->data_type == REG_64BIT_HI_DW) {
> +			break;
> +
> +		case REG_64BIT_HI_DW: {
>   			u64 value_qw = ((u64)value << 32) | last_value;
>   
> +			/* Incorrect 64bit register order. Possible missing low.

nit: comment needs a newline after /* (can be fixed when merging). Same 
issue in a couple more places below.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +			 * for example:
> +			 *  { XXX_REG(0), REG_32BIT, 0, 0, NULL},
> +			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW, 0, 0, NULL},
> +			 */
> +			XE_WARN_ON(!low32_ready);
> +			low32_ready = false;
> +
>   			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
> -			continue;
> +			break;
>   		}
>   
> -		if (is_ext) {
> -			int dss, group, instance;
> +		case REG_32BIT:
> +			/* Incorrect 64bit register order. Possible missing high.
> +			 * for example:
> +			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +			 *  { XXX_REG(0), REG_32BIT, 0, 0, "XXX_REG"},
> +			 */
> +			XE_WARN_ON(low32_ready);
>   
> -			group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> -			instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -			dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> +			if (is_ext) {
> +				int dss, group, instance;
>   
> -			drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
> -		} else {
> -			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> +				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> +				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> +				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> +
> +				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
> +			} else {
> +				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> +			}
> +			break;
>   		}
>   	}
> +
> +	/* Incorrect 64bit register order. Possible missing high.
> +	 * for example:
> +	 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
> +	 *  } // <- Register list end
> +	 */
> +	XE_WARN_ON(low32_ready);
>   }
>   
>   /**

