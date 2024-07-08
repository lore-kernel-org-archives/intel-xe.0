Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBA4C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEDB10E44D;
	Mon,  8 Jul 2024 22:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhlD448g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C0F10E43C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720476960; x=1752012960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aYIODIUaBR5YWRF+E3y/z+RX8m2qVM3e/UYKkSpTddg=;
 b=OhlD448gmSFn5XeEIuCYRqs01DZhouSrBRNaWE3hbWdBn8Lg2htbHnuU
 TgLlh70ouenjWnKWYs08YQ79Zr1Vvw1CapPB761j0NSYYAcQIlmSXS9HC
 0eI2jX+j2eb6oYP3oZpV6Jmi+RRklyycW10bOTIQkj9TfUAOXzMkpJthS
 knqPFryIJom90OXA3AtSq+jIPXkFTFGLjvuT1/gYYbGylSj5OGSknGfDm
 vyUBD88nOA3hyQ3sQErNaGbnCMsQ9VZc2/S47mT5uVYeY3vQirH2BBuYn
 2rxKm09X6vKkmi4gXanKEp1gqDDEOwjLQJULqvThbteTDSizog3NNWSq0 A==;
X-CSE-ConnectionGUID: +Dku4aLVTAamXTWqRF4faA==
X-CSE-MsgGUID: fuXuLgGUQ++zw1h5l5Y24A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17655215"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17655215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:15:59 -0700
X-CSE-ConnectionGUID: Cv5Q2LOZS8S+OcFGNwnEiw==
X-CSE-MsgGUID: wiSxogCZRKangQY3GzgryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47591081"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:15:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:15:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:15:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:15:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYXsT5YCYcKQdMCb6nhGNYtVsjUB4xf4waUJHqSM5giKHs8qcrVG7kcLu3rqSmynZOrjCKxavpCh7jScoB5PV23dtXIRedm0uu25rqkbMjVo/5aP83wtiSqG44CeZvoNXQDdmGSiAuEYkEdSZP7ohJVputlheN18L2kqhCGnEG0HMd1nOax/KTPSY4Tj82B3mMNuIZQsXNR7HyJ1cNELkq/ef6NZJ5iFqV13JQEAneckgi7SUAW8mbbKFEE6tOx7fQm3eBylymxrclQ6F/JgAsi2/MkAIlAajo0xT7HctyZl9P4t81jHr4wpBZOEFLkSq0MfMpFtPRzWgphX0cv4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qAZYeZOVNd5WWoe1GHMNBAcNzXr3tllxj5847BRZ3A=;
 b=VCkL3ZOJpfW4PzUx5lqLhJRRaK/obY9CkmLO1WDTXabb9tKvvfVr3v06T6b8WJ/801+8wwnJ7dUcySAs4jlER2BP7XgI8+9+jWSJtlBtxJy7UI/PejA08za4/BqqV1Mj37GrR2EVEkBIPOkGKQBTAzjzngupqnPFqSA8b+ca+QAewqdZwLuSSTjnDbqo90GodB8znhiJOiVUl4TREBOB3XIUv7B3PUpT+ILQhc0SIZUz4+ToJQfexOkGu+0JaA/LhfrAEPku5QWK6dQJbqz5/8i5NxYeOnZ+JjHTU/q0gleEI+cLj54vAt/3oyZJcAVQscarRxcM0zv/62AxpsltqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 22:15:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:15:54 +0000
Date: Mon, 8 Jul 2024 15:15:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <ZoxlGMkXx5moSKvw@orsosgc001>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:303:8f::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: c06ea4fd-59db-45cb-3ee5-08dc9f9b88b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ny92L0lMdVREU1F6MjkxSk9LaDMyVXIwQW9YM1BvRFdUYlhiMDIxN3BWcnEz?=
 =?utf-8?B?bW10MG5ERnJ4QXlMUHZ1cTRvWnZMMjJYUUdONG9GZFlaMTA3UHlKQ2pzbWF5?=
 =?utf-8?B?SHA4WStoNFFBcDc3K2NLcXlFMk5YUTJORXVIbkxEUVNnbkFFWUZNR0MvNGxG?=
 =?utf-8?B?TXNZcHV3TkFxTmlmNG43MG9EbFZYVWgvUXI5aUxSNDdOWUg1Ym5aT2ZPdXpV?=
 =?utf-8?B?LzgvaGpFUGorVTVtaTcxZC9YVHB3MFlndHBGcSthOE1BMWJueGxGS0pjejl3?=
 =?utf-8?B?NUVtenBVUFBZSVkxbGdHM0xhMjRyMzRZREQ2ZkYvdXdUZXpkSWFxbHhNTG1R?=
 =?utf-8?B?SzdPQXFQUXpZUzc3V2JDU25ld1FMTkNobXlFRzlTSWJLNFdleXRpNDdYZEFU?=
 =?utf-8?B?cjNQT05IUzRoUXpmL0g3blBzVkhtV2o4UnhPeE80VlU3VUtrL1dRL1l3TWVv?=
 =?utf-8?B?b2EveFJMZmxWKzQ0Z1NsNU1rR3NmOFpuOTdVQTZnQUlwY3VlbDVqQ0M0bUxy?=
 =?utf-8?B?WTgza1EyRnVGOWJWUmNqekNBSGk2Mmt3ckhWNmdVL1d4TTdXa1JBRDZDdzRv?=
 =?utf-8?B?STgyMkp3dkNPekpacStFUGpuWXNPZEtIRVhHdTZTR1o1eEwva0xpemN5TDJF?=
 =?utf-8?B?NFpxTDZlOTdOcjFGaGQ1eCtQYi9CVWM5N0FxWEpISzlMRndRMytIdEc2SkY1?=
 =?utf-8?B?WjJFTDlkVmdsUkE5WUFKeW92V3FUVkVhNHlzREJvSm1pWWs3TGlEMGVhbFBr?=
 =?utf-8?B?K1IxdksxQlFvNkFhTkZVR3oxY3JWVTZ0SnRZYXpYUGtodWJqUU1SRlVxaktB?=
 =?utf-8?B?bkFIM1Mxb0lBMFMvS2IyWHpTcUYrSGJmNktHcG5RbEFzWTRUbElWVVhhbm1l?=
 =?utf-8?B?MzlqQnhyakI1UThTRlVOWFhtdExIRXJNRE5lMkNBNlB6bWxLM0VlY21qMkhE?=
 =?utf-8?B?ZGZnajJBdWl5NDJkaGlRaGc2M3I1U0lXMWdRdkJkcUM2VVFaUHRZdEZyWC9a?=
 =?utf-8?B?Z3M1K1ByMHFHVFkwUTBMb0VUU0w3Z1c1Qnppa3BIQkhpYkNHRUl1UU1zTEcy?=
 =?utf-8?B?ZXJ5bW9DSXlQNnhmZ2xJeUxXb3NIOEVsdnNTa1hQSVRYYXhtTFJwTHVueG14?=
 =?utf-8?B?VEt0WFphSktkbDNPVDlQdFZNS3c2L2tiOUlWNURSLzl5RmlYQ3pETXBWZ3Y0?=
 =?utf-8?B?a20rSXUwM2xNQkV0ZVd1Q3FLM3lrZDdKaGp4WnlzQnhBL2ZiVmV3Lzdzb2FV?=
 =?utf-8?B?UHc2WFJuNThMcndTck5HZnpKNmhUVjhtTXl4MHRQeGVJMW1xK1dJNndnZVcy?=
 =?utf-8?B?S09jbzJ6a3NvZnBnNzJYdFZhU2Y3bldUdUJRbDJkdUFTRGt4VnBEYW55a2N1?=
 =?utf-8?B?bUNJSW1QbmM1QkdXWGNxeTkrcndaWU9rTmluTlZWL25vbjArd0JDczhIUFMy?=
 =?utf-8?B?Nm81bTAybHpETU9oVXlsNDJUVDZZNldvR1gxaXN0RjhKUlc0MHIyb2xobjFy?=
 =?utf-8?B?MjFrckEwQzNkQm5Ndk1OTjBtb0xrcFY1Y0l5THNoVHpmdms0SU1PdUFFdENJ?=
 =?utf-8?B?MkRJR2JqYXl2VzNLRmdtSFF5bWMxbG9mZzdncVhkcGhQeVVDN2thN1RhMVYv?=
 =?utf-8?B?aWZDaWMrc3ZkMTZmQ3NrQmtvdDNMMDlsejk1TDUrQm9venVkV29qZThpVkIr?=
 =?utf-8?B?Q1VuWFFYL3ZvMTZENFlGNW1CbytuSXJ5WFI4RlVwV0JoUms5WkNJaWk5djRF?=
 =?utf-8?B?UXNuMlUwa01WSTZqNkFHUlYxTUJJNElNQTQ1bm5NZWFQcDluMERvdElXcWpX?=
 =?utf-8?B?KzF2UXpWRTdiM3JKNlA0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk9IMXA3Q1NmaWJsTENCRTg1WXVLbVJOM3BwaDU4MmxtVVRpSWNJZXFnZUg4?=
 =?utf-8?B?QUhtNmE3Z2dGZEYzRjlSUEpUaTR2TlZMQmhJa0JiTklnYndMMlZISkZLbGhK?=
 =?utf-8?B?SThHbzBSVFNiaUxNamc1OVFLY0JYaXlJUkFDdk1leTh6M3NOWVNNOENIWnFn?=
 =?utf-8?B?akE5M01kZmxnZTBQTkZpbEl2TVRKL2dRZWxuRU4yQVZKWndkdjdpUUFqazhP?=
 =?utf-8?B?NHJUK1dBakZqMVlqSzlDQkEzRTRmN0FPYXhiZE52SDQwbGtIRmNGSHFnNE5q?=
 =?utf-8?B?cU1hT1duVGV3K2V5SElNcVVHZk1GVWMvelo4aXAyZHI3LzFkendhbS9hdzVt?=
 =?utf-8?B?SmhOZXhlcHRwYTNTYjgrQVZZMWdqNDM4MVhibVJzZ0tidEhZMGYzaW9MbW5K?=
 =?utf-8?B?Z0Q5MDVIK2tLUkhiVU9BVzJrc0FTSEJiZlZpRU9Wckd4SS9jSklUVWo2NVlw?=
 =?utf-8?B?dm00MFMrM3RVT2lRc2JSdFU4RjVURW80SXJZaUlDd3QzejdqOFB1YnJLSDJR?=
 =?utf-8?B?WEpwVzFLd3NZRk5LbzZRdWRxL2FRUU80L0ZuSFEwOENkQzhnOEFjMGpoVHFm?=
 =?utf-8?B?WG82dy9BUmdGQjVZTkZJOE9uaE5GT3JsdGlVM1g0eXdhTGVBdll4STJlWXkx?=
 =?utf-8?B?Z0ZyelFQU0p3ajhmdjVwU1RKVFBDbjZVVGdWTXlxUUNlY3BiUm5BOHA4d3ZZ?=
 =?utf-8?B?cFFXV0dYaEVWOHk4WW01c1hBMUZsbldBS3MwMEF2VjdGQzVXd2pCUmw4a0Yr?=
 =?utf-8?B?RkJWaDFFamV5M09hMUxFZlFlTEx4VUI2WVdUaDMvZnRPT3lKTXczOEhRMnU5?=
 =?utf-8?B?VGhiRTZCaUZnc2lJVUhqeGhZR3ljMlFNZXF6MUJHbkk5NUJJeTRRb2I5UEd1?=
 =?utf-8?B?dG43VHpnc3NzamEvSC9Hdm5rdlY0azRmbHNuNGVDQmswMU9acWE1TmtBNWZO?=
 =?utf-8?B?MUpSc3NLR1dOTmRRNnJYUnlVY1Fja2lXdmtjWlk0MzNtN3MrZ0lvSFdxWlFK?=
 =?utf-8?B?QmJWMjl4VU1UYUZMZjRhNytKT2lhSk9ZWW9rQ0RGd0U1RkdQVWs0eFAxSkEw?=
 =?utf-8?B?U2JFdGtqeExiK3FWemZFY2p3ZVZtSG9hWXlROFZGcE5tY09qbFpLdUluUngx?=
 =?utf-8?B?clNHTmd0b3Q1emdYdnNwOWZnZThEZWtkMGkvYk56SkNoRFVSWVZEdE91VkJi?=
 =?utf-8?B?d25lQlpzS3MwckFvV3BZZTJYOENpZTcxODgwRmFrVzZRUE1xNkVqNXV2azF4?=
 =?utf-8?B?d1ZESGFEelJQQTZzVFc5ZFpzV2NyMzlhTjVHeWtFTUd6T2dOQlVXWnhoMXBJ?=
 =?utf-8?B?QlRFMjVKV3RpWVlodUpCbE9ZR2hkVDFnanRvMWhTblE5Yk5pQUJCL3BSazhu?=
 =?utf-8?B?ZVhhRUw3Y3pzbGFmWjNCRGwrdVNYalp0SnFtcTVsRitiQzRYNEhlZFIrRlV5?=
 =?utf-8?B?YkdPaFdCSWRlN2F1WWpyTDFJeHVVazd3VE1vR2hrUXBEdWhjbWNlckdWRkxa?=
 =?utf-8?B?YllubTgwbGFZTDRUU0hxZ3RpaGpnWnRUQW5uYUFtTnZtTDZiUEpmU0xUVzZQ?=
 =?utf-8?B?T1hrci9BaHlqT0ZiZVdweUhXT3ljVTJrU1FpK0VaK0s0Z2x5Q2lMRlg2cDhH?=
 =?utf-8?B?cGtmbTErL2NHVVhWbVZLRFRYdjlnYTEzeStVV2tETXBMUTJobzlKYVFhUTdQ?=
 =?utf-8?B?eEtaYlpycXZQbS9mQkpvQWNxN0I5VjFCYzFVK0hTRlYvTU5DNmJDMDJiemJa?=
 =?utf-8?B?V0E2NGYzSGhrcjlESXZRZjhuNXNZa2hzVUVOSzN0YVFhT2RmazFyTFlLd2VE?=
 =?utf-8?B?ZitLOGc1RUxpcU9kRG9wQ0RxT0NFRjh5Yk1mVXA0Vkh4Y0N6TFdqNFN3bnBl?=
 =?utf-8?B?R3o2RDlXMURWYVdWcE1hYzZXaVZEbWNiWjZ4UmU0Z3VEZnlxeEhiYUxQTjdn?=
 =?utf-8?B?YjJWZHpXY1RYRWExUU5Vd2p1MWQybnliWHl1aWE4UUVaOGdOK1NXa0M4ME1m?=
 =?utf-8?B?R3pRT1cxejlYb0JiYVl2azFjYkRCRTJlMFZBREdUVXA1UlpYUElxQyt0OSs5?=
 =?utf-8?B?UkFzSTQwaStUeTlQRVZhQ2prdTRVVGh3K2lnZUk3djJscFVOSUpBb2F5RzBC?=
 =?utf-8?B?ZkdGOXNBS3JscXViSHE0WkhYWjNOYTlUQzZCdFdXYzFTWVUwcXgrSUJwb1pE?=
 =?utf-8?Q?OmOYe5u8lNcoloAL++reWDo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06ea4fd-59db-45cb-3ee5-08dc9f9b88b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:15:54.3405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyxnshbjOuw/9TnmzD5bPm4SwaNsj3LZbTgna3p0ZrT40XkO2pU2wuz7eZMxdGTAoY3v80U8ex9WtNK9FojRh7P3Npc+XuYjOz9yloZ82e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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

On Mon, Jul 08, 2024 at 09:23:15PM +0000, Matthew Brost wrote:
>On Mon, Jul 08, 2024 at 01:21:00PM -0700, Umesh Nerlige Ramappa wrote:
>> Add ref counting for xe_file.
>>
>
>Patch LGTM, but a nit I'd make this first patch in the series.

First patch was just a refactor. This one depends on xe_file_destroy() 
defined in the first patch though, so cannot reorder. I could squash it 
instead if that helps.

Umesh
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>>  drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>  3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index babb697652d5..e6eacf1bcce0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  	spin_unlock(&xe->clients.lock);
>>
>>  	file->driver_priv = xef;
>> +	kref_init(&xef->refcount);
>> +
>>  	return 0;
>>  }
>>
>> -static void xe_file_destroy(struct xe_file *xef)
>
>Kernel doc as this is exported.
>
>> +void xe_file_destroy(struct kref *ref)
>>  {
>> +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>  	struct xe_device *xe = xef->xe;
>>  	struct xe_vm *vm;
>>  	unsigned long idx;
>> @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  		xe_exec_queue_put(q);
>>  	}
>>
>> -	xe_file_destroy(xef);
>> +	xe_file_put(xef);
>>  }
>>
>>  static const struct drm_ioctl_desc xe_ioctls[] = {
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index bb07f5669dbb..2a8b370b1fda 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>  }
>>
>>  void xe_device_declare_wedged(struct xe_device *xe);
>> +void xe_file_destroy(struct kref *ref);
>> +
>
>I forget if this is a hard rule, but public static inlines likely should
>have kernl doc too.
>
>Matt
>
>> +static inline struct xe_file *xe_file_get(struct xe_file *xef)
>> +{
>> +	kref_get(&xef->refcount);
>> +	return xef;
>> +}
>> +
>> +static inline void xe_file_put(struct xe_file *xef)
>> +{
>> +	kref_put(&xef->refcount, xe_file_destroy);
>> +}
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index c37be471d11c..ec2b0fb6afe1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -566,6 +566,9 @@ struct xe_file {
>>
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>> +
>> +	/** @refcount: ref count of this xe file */
>> +	struct kref refcount;
>>  };
>>
>>  #endif
>> --
>> 2.38.1
>>
