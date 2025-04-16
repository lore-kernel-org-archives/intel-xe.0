Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CCAC369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 07:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2165710E879;
	Wed, 16 Apr 2025 07:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnVdlYs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569F210E879
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744790186; x=1776326186;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UQAuo5rastEewVgsKmSPTIaUbUXesurKh40nMaDF5tc=;
 b=dnVdlYs4qUTpApxd0vLqw1T2Z949bgG3QD8hjG0eCBtV5rQH70HIW6m5
 rPAGtTfTcfSw5oXBvqDXY+2Msw0x0Xt+5EJx18HaO0EwforExy+0VePxQ
 hkBV1tT7FdL/bpaHRHcfkZUYUWc51BWDQVExRjHXur/Dl+Ce91AZAclzY
 VKH6zBo6C7KFZWOSb2HEy4SE1ZLuqXIIcrKsh/I5jqUNEWKxn0NwLZoSO
 J0iAbCAlcYlRHjA7I66W8w91uvoFiuXWcteBwozM3H31rCdHr2JsriKHJ
 2LVjqzyA8Ilj09pJGX9JOij1NCeaC/HVsdiIDYtNXH/GgDRjX8pSLKHlr A==;
X-CSE-ConnectionGUID: Dl+nnT9sSLiFkLKw+nA4Ig==
X-CSE-MsgGUID: gWvRClgbQeCqlqN9sC8mFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68814796"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="68814796"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:56:25 -0700
X-CSE-ConnectionGUID: Y7T/s0xISfyxBvYwMKWN7w==
X-CSE-MsgGUID: i4wgRlynTlON4Ebu0R3f5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130685379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:56:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 00:56:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 00:56:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 00:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0BZuQ9i51CPpRixRhanomUlWXeJZuBhhVCoT8XAIRUSFmUuMv8wOHv4GCFC87DWNd1vcD3XrFhzHPZpSg3Z1wU+rzeYxpF5Ue/1D5WCimf5BWX76lw1LaSS7N0YXtvazBww0crpoLvLATMeXVNxLYP2kEfjWaXirIdZ0xBQbzqDWIf+WJkcj6C7Hnvfv7DDopqV6eGvIlb6ywllPTGj5ghzc7WgqFQYYQqspyDhw8J9fNJ/szUJo1RvXeULquqcEa995fmlwkuQTEz9n6f2J1MKMlTQ4mWrcaRbIFcYb65tn54dx1BNwtS8Ij6ujuWmEIBy+e43yVZU4q3By+J/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jpNkb4tUjJK/rET9QyV8sORf7QzuqzFuDxenhUBbfY=;
 b=t9iGBfmu0f50hPCYjvkeuteO/KRsfsipUGflvwAZ1jHrFTTSq3VcOLzq5QzAt5athPOSfpZkmG9PDdh7VS724qUTMx6kIpbjOusWytvdqvUGS8EmoogWGRlARx58ftG8c9IlTk6N5m0C+ZA+ALnxp/PzzIceYQW8QZtt/1IxernBSmKM2ktObaGZgFZfF+n8NJTNlzqjDSPUjR/yuss5biSSYszncWdNtalCqg6KeTvK11oHFiBgOZ3A6Wq6ia78OAz6n2RFChHCG/kiqYAUDWk68gQqPDHYQ24B6biee9Fn1nMt1c0ryd8A6TRwtY9MlFRe3LYZWGLdpJta+GePfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9278.namprd11.prod.outlook.com (2603:10b6:208:563::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 07:56:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 07:56:21 +0000
Message-ID: <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
Date: Wed, 16 Apr 2025 13:25:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250403174742.1294227-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 73397982-12bb-4996-a1df-08dd7cbc2d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1U4RDFPdkVHYkM5TE1qb2hlblIyQXRjZVlyMTQrSXY2MVkvWGdsSmIzQ3lo?=
 =?utf-8?B?T1g2RStpeTh6N2VUcUZvK0p6c0Jnd0w1Z1V1c1hMMFlMbmZtY1hnVFZJUWtC?=
 =?utf-8?B?RTlvTlB5WEhoVVBWY1cwSEM5UmZkRm04azV0d1UzNFVIQWdoMWMzTzVnZVh1?=
 =?utf-8?B?S1p0QWxCWVo4MGEwV3g0VlhrYU95S1Q4aHhtSStYeU9EYlMzL0lsZ2F1QWQ1?=
 =?utf-8?B?aVV2cEUrazBBVDJxdklaVkdYTmU3bXBob1pTaEh4NVlwMCt5VjJadmN3bUsv?=
 =?utf-8?B?bWxIVnFTTXcvL2NjeVU2NE1tOVRqL3RTc3p3QVo4L0JoK3FreE0yMHhRK0Z1?=
 =?utf-8?B?NTVwWWtMRkFsOXJkQ3ZpdTAvSTdRMkhDaUFmWGFDY0k4Y2VJelhhY3RVVkgr?=
 =?utf-8?B?aWNLc0RVR0ZTTFdxOThnR2daVStMOXBwSWY0NHh6eVVSNzFYYlNBd3BYd21h?=
 =?utf-8?B?emhwTndtUlJKWXNBTHVMa0lBVFZGeVNqcStLWFNUZHhGazdEczJDTXlOWG1q?=
 =?utf-8?B?dTdTQkJDMndyZUVwWVZlZEZ0L3UzUWdvd1VlOVZLS29WaEhmcUFUOUxEdE5K?=
 =?utf-8?B?V0RVL0hHekhDWVdXM2xLb3I0UWJTdHREcUFrYll2ZC9jZXBEQmp2eHpKc2l2?=
 =?utf-8?B?Skc4SlBMQzRTRFkxaWppZ1JHNmE1M3l5RTdyUkV5WFRyZElpeE93ZGVaOWF2?=
 =?utf-8?B?V1MwZThvdkNBaWtyaTZ6c0lOOXhKb3MveFhjZk5FN1JhK3V2T2FWdmZweVV5?=
 =?utf-8?B?d0Rwclgxd2FXVTNEalJEY2FseFN0cTQxUVcvTWZCOGtGcVV2bnkzaG5YM0F5?=
 =?utf-8?B?TGhiOGR5OFhoVmV5M1V3SzBoeDVYV1pkVXBmalQrbWtzZldWeExhWlZoR1Rv?=
 =?utf-8?B?bzFYQTlLLzRwck1ma1J2NkJDLy9ENjdOVm9zUXc1UVpSNDV4WnFGZ2VUMThh?=
 =?utf-8?B?Y0d6bHV6b1I4UHlxTG95aHZOcEEzRG42S3JlMjZkOUUyRGxkSWh0TmRKWUdM?=
 =?utf-8?B?clNQd3dtNHFieXJndnFKV0VSYXh4eXVpZ3Ftc1Z5MnhhczlLNjBHUnk1UVpy?=
 =?utf-8?B?Tmo2WGFySFdjbVp1R2VFZXRQTWtuOG9zcXpJdS9LbEhaRHlOSHFKVFVBZWdG?=
 =?utf-8?B?cFVqcER5NnJnaFZROVNaS3p1Tk94QmdiR2IwUHJUODAzd1ZVeGZLM01XRzNO?=
 =?utf-8?B?STMvaEpKbXRIRXBCZVhuaFlBdkh2K0x5WTNMdEpNY3FSVjYxVmV4VjlKNnN0?=
 =?utf-8?B?UXdRU0ZoTGtqYjhSamMvUlluY3N3ZXZoa0JJb2RxS1JJRC9DTmFBSHRqdFUr?=
 =?utf-8?B?UmdubXk5MXNxSXl5YUpBZTM3dWtYZ0R2UGVGTi9kTjVkL1dFdnFhL1RqWmF6?=
 =?utf-8?B?TkF1YmE2TjdBTHcrS3BnV2syV0FyUkxjUnFkYVlUSUxDWVhMci9JSnc1WUhV?=
 =?utf-8?B?QzVpMnVPaC9SZkQySHowWEhpQXkyRUlNNkdNaitueDlIWDdQQStxbW1wUG9Q?=
 =?utf-8?B?QVhpaUlvOWZuVlpyQ2NSNzRvTXFEeTVQNW1nVjRZZ09EVFdHSy9QdjFzbmY5?=
 =?utf-8?B?dFRMdHpDejhlS1JUaGxjSmRIY2hWLzFPNWU1b2lWUDZHTlI2Vzg1a2dZY09Z?=
 =?utf-8?B?NC9peGpleko5cDM4cWkxTEhWSEE5SlgyUVl1d1FReG9hWmJRRUZXcHhBOXpv?=
 =?utf-8?B?NHFBODNGNFF2c1k4NkNEY21IUWxXbEZWUUtzUXBZUWx5RVhnbjJOSkE4SGN3?=
 =?utf-8?B?S2gwSHAvT0Y5V210Yno3NkZhNGxVZEVJbnhtZjJ6WGpiQm1jQ0IxRU9YZzc4?=
 =?utf-8?B?OVBtNGZpMXRIRlY5Z3hBVWZZTHM0R3VYQnlOUkRFZVlyb3ZWNmNJSUxrM2li?=
 =?utf-8?B?cWtZZTRXVUwxSUljTUNJeDZaMUpZZnh0dFhmYWRURkJtdGtQdk9IKzJWV1dI?=
 =?utf-8?Q?lEkfT7JR9PE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHI3NVZvUWYzcm1IWlc2TnRMSlVOUUJ0cmhZZ1phUVpxWHBWaGNSdkpJQ2h5?=
 =?utf-8?B?cFVDdXllM3ZWQXhYOVpQbGR1MTkzUEFVTkhOYTBQalJMcWNTWWNka1VheVZR?=
 =?utf-8?B?Si9OOVVsZk1PVlZTVXlTMU5ZYUJ2RU81YWFFcDBmcDBXNEZOcVB4d2VKa1Fq?=
 =?utf-8?B?Q21PS0xTV0NKbEtZMnN5b1UwaE56S3EyQTc2SE9kenNXalFXc2lOd1BSV3Jm?=
 =?utf-8?B?SVV1WlozL2YvN3dlZFhXSGpMeVlsaitCc0FwSGhsNFY1bEloam8wYmVGT1Yz?=
 =?utf-8?B?ZCszdk16VWRJK1ptRGNVVFRPdjc4clNnYmtMRFZ2U0hmRlg5a215ZU5seDBz?=
 =?utf-8?B?cTB4a0JnRnc1TytQQUZwOEJ0SzNNWllaeXN6aXVKVCtFazVJenFmeWFrbVJE?=
 =?utf-8?B?L3kvQkRWS09zOUZuY2R3aTJvd0RRUmxPd3ZoTEwzMG1VREpnaHhVMmRxUDcw?=
 =?utf-8?B?WmpjVlB1WXhFbS9HVEZ2cHl6MHdiTnBvUmYwcHR5ZGQ1NkdRL1E5NmdPZlBp?=
 =?utf-8?B?bXB1YUdYT2xZRmd1WWgvYlJDSGcvSmVPck4vQUhmWDViR2Q1V0xINGZ5SXdr?=
 =?utf-8?B?dXFvVUdZeFZLbHNkYTRFaEllakN5YVVGRzlQRmNvMUxxNUROVzIxTS9UcGVu?=
 =?utf-8?B?SVE5Z0xMb3RvaUV3bFM1SEZBWXB5aDFIYnc5OWJyNkhTVHl3dXRwS0JtYWxW?=
 =?utf-8?B?bGxXcVpkZ3lDU3lhdU1OcFhHWUE0aUlMeGtSQkM4VzR2UjY4NlMxUGd4Y2ts?=
 =?utf-8?B?R3d5VEZKSmVGNktZb0tpWjUvdDlQMlZwYnZDY25OVWxBcXByWndhK09vYlVu?=
 =?utf-8?B?SVFLa29ZeFlsYS9EMTluVjdpYXlLMTZNWEdZSTRKS0tCSUpwTVdCSkdnbjBQ?=
 =?utf-8?B?TThTcGY0SVlrUkxyRTV3UEpzdS9BU1hITkg5N2RRbVVhZHdMNFJmS0RJMTla?=
 =?utf-8?B?TGgzWjFzZjFlZktEeHVuWjVxZlkzYWUvdHJyeGhoL0FGTkdLQk1FemUrWm81?=
 =?utf-8?B?NkpjaHRUcklmWmJwOERYYjN6Q0JPRDIzQmhwUldZOXZxYVhqWHc0RG5GYThV?=
 =?utf-8?B?cWVCcERHUm8xQTNqbFRsVlRNem8ycUdXUzFJZXFkRldHQklhZFhlMUtPYzhQ?=
 =?utf-8?B?eHhobFNNbGhaS1VxZnI0bDEyVTZVZmdVd0czZWRJOTVRZU5qMzVKQVhXK045?=
 =?utf-8?B?QVVIdDFBNUlQdmtBbnh4UkJRZXo5QmhFbXZEZ2RCYTBqYk1RRENjRFJxdEFU?=
 =?utf-8?B?b3pFUk54YUhCanFXZ1V4ZDFQaHMxcG5ocURFQnQyZlp3WDNuTFgwcEJoVW1w?=
 =?utf-8?B?RGV1MHViOVA0Uzd4YS9PeWliSDc1VlRlK0M5YWFWTy9WNlJmWG0yaVhQdTNp?=
 =?utf-8?B?MXNRWVMzalNISFVVSTY5T0kvenhkQWQxcjMwcHVSNVVKZnE0c3FFa3hCVmlC?=
 =?utf-8?B?eXBxb2RBZ3A5a2VWN0wrYWR5RWJseE9Uc0g3SVZ0WWNVdHU0WkNyb1VjdEEz?=
 =?utf-8?B?c0ZVSTRra3NwVnR6NDN1ZXowM3dWQWdtcHRJL2xXN3dJRlppVUxNUGwyTVJM?=
 =?utf-8?B?VEhzeC9raW1uWnNtRHRpL2hZWktrQ1Q1TU9VZ0NnVHprZ1RCSlFCT0VnZ3Nh?=
 =?utf-8?B?NFRKcmZ1dWZzRjMyYW9RQ0lkZnpFdFlnczY5amlwOXM4NER0cGNUOUlVWmtP?=
 =?utf-8?B?Y1dNRjJ6QUFDNGEzMEw3cWpkQTBnWFFCTitHcmZoblBzdm02NXpKSG5DSFlW?=
 =?utf-8?B?YzlVVUJTMm5QWCs4MDNpaWpiN0xEN2RxMmhEeUc2U2FXUG1EN1l6V09lWnFp?=
 =?utf-8?B?clFuZzZxdEtNdktzSjdqVlZaajg4NUdLd3BFalBxK0JENGpLMjdMSGR0SGll?=
 =?utf-8?B?ZmVGQVdWcm9CSmtkMjc0UDAxRUVJbHZkZUgyTUtyNzF3blNkTkZRR1F1N2N3?=
 =?utf-8?B?Zlg4K1NXMlRsOXdaY0Rha2R0bEsxSm9NT1BFNDBuVWVsVmI2TjBGY1pYYkdw?=
 =?utf-8?B?SE9rYTMyY1dlZ3lNREtRZjZBQXRWUmc0Z3BKZTM4azJxYkwzLzIwNTFjV0Vt?=
 =?utf-8?B?bnFEUzVIeGVyOUpIRmZTd3Uzc2NabW5NOFdOeTRrOEhuTnB6VUZvYzhpNm9u?=
 =?utf-8?Q?tEHH1PCOTu+DcSTZgM9CCN8TW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73397982-12bb-4996-a1df-08dd7cbc2d08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:56:21.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNK6AgCIpqZVMAxehadeRhInpvaZuXeHOAeKYukn3pLPXuMlVNUAAxG1XnPXH41nIfcPbJtGXdyJ+Cc0XQmbsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9278
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

Hi Raag

On 4/3/2025 11:17 PM, Raag Jadav wrote:
> Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
> non-PM attributes as well.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
>   drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
>   drivers/gpu/drm/xe/xe_pm.c           |  5 -----
>   3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 7efbd4c52791..d4c73acea1cf 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
> -	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (xe->d3cold.capable)
> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>   }
>   
>   int xe_device_sysfs_init(struct xe_device *xe)
> @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	struct device *dev = xe->drm.dev;
>   	int ret;
>   
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> -	if (ret)
> -		return ret;
> +	if (xe->d3cold.capable) {
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 58347fa91841..246682b2a2be 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -18,6 +18,7 @@
>   #include "display/xe_display.h"
>   #include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
> +#include "xe_device_sysfs.h"
>   #include "xe_drv.h"
>   #include "xe_gt.h"
>   #include "xe_gt_sriov_vf.h"
> @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (err)
>   		goto err_driver_cleanup;
>   
> +	/* We have PM related attributes, so do it after xe_pm_init(). */
> +	err = xe_device_sysfs_init(xe);
Layering doesn't seem right. This should in xe_device_probe.
d3cold capable can be moved to pm_init_early and this to device_probe

Thanks
Riana > +	if (err)
> +		return err;
> +
>   	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>   		str_yes_no(xe->d3cold.capable));
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 7b6b754ad6eb..6af1de78dae8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -16,7 +16,6 @@
>   #include "xe_bo.h"
>   #include "xe_bo_evict.h"
>   #include "xe_device.h"
> -#include "xe_device_sysfs.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
> @@ -306,10 +305,6 @@ int xe_pm_init(struct xe_device *xe)
>   	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>   
>   	if (xe->d3cold.capable) {
> -		err = xe_device_sysfs_init(xe);
> -		if (err)
> -			return err;
> -
>   		vram_threshold = vram_threshold_value(xe);
>   		err = xe_pm_set_vram_threshold(xe, vram_threshold);
>   		if (err)

