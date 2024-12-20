Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858CBE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 03:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BCB10E369;
	Fri, 20 Dec 2024 03:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfWZAqv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E208910E369
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734666576; x=1766202576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aIccAb7NQlmpSNOZ2nLN9j1TgUlNsxkSLRGhMxsxzJc=;
 b=gfWZAqv3VZK8h/i6YD3UC7dEZWeBF64Jw7UrLrfL5WA4WED58vLvENcW
 lUd1aeaIvcrl0jJOuifZy2k6vlSSO73Wy/6MBok9zLYun7ICsT9wOnlua
 PaXQxHOrfS4V7FveQLsGwTSONiniGNlvPLC/VvXtASQOp1wLOcg0fx8zW
 p1LPw5zXoiXON34jF8uEzzZ4Cm3OGIGRnETq7ea+8ZfMkLAN3P1nSmM81
 aozB7V+KhkhCTZd4aaNJh/E7vqC8VafQCOGcoozsovCNuSupFCEHhQoth
 BW9OxVL5aCBDpvG6/ti7eHySja/eAqZwB4OibarnEE1ceZ1fsicXHGvtZ g==;
X-CSE-ConnectionGUID: xJbSXC8nQ9qP3caDcs7bOQ==
X-CSE-MsgGUID: zizxi/yVRz2gI4zEw/UK3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35097906"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="35097906"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 19:49:35 -0800
X-CSE-ConnectionGUID: vRdWShUvTxSsKN+fpVqJGA==
X-CSE-MsgGUID: H6KadpcuQRenrQ/3hQXz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98459243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 19:49:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 19:49:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 19:49:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 19:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl6gwO11fphm36VjlGoNtlfC5nT/MlhBaqkWUBzbrCDDjtkYM93VFHzZg1cwrSFcx9Zgj7mwLtBjcWSre3Qda2OzSFufKXAJHsNjugCQO6HDhxVTjjoYg40T1VighHnYVjhrJS5M7C4o3E5AHHmcp12f5ezt3igM7IkCkisjb5qw3xJXEweMQlWnz0LJ9MvMWsHm/GDZepcaJqF0P6gsni3Xb9PsdqM5TcKcly9U3KSPneAri6x020D31xOTagwOki6oi0vTNvbss4W9SxkHMS/J3sYg4PPzngioAzWGrfSAhqmz570VbmVREatvH494LkZYnMfBCuFrMLdO7AQ/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8GegaSuyNlTEDqx1e5s6B2SRYbieSHmVjw15C271WQ=;
 b=o9TXX+i3vARcPFUDrwETGlhuJk2ERIbPpT2KaffC+p8vGiA3kyHk8BZlO5wLloGKx8ew/Hi3d7O+2mPQ+90FvsDI+vB2Vk1gDSZ6NV8BPxIwZjz+JBcGRd8x+MWMXuDQpNscnxcY/F5O+REm0XieXXCj2eOF7731diWqFl5tiwAKQdvLIBzAq35qqSgUh8yREwRLtGHlSHDD1+51VfEQLwuyE73t4SFCPKs2WZJCtqcmtQp9oZi/Hxz3UM7r/pCHfLIasd5H4WM0HyGtypy5JoZcy6P4puXzFyJqt27QNW3K6pzItxhBITIOGIIy6Y4aaeLCGd1RHqSw8uHPQC+BdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 03:49:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 03:49:09 +0000
Message-ID: <a3706685-4fff-430f-9729-2194ce632a12@intel.com>
Date: Fri, 20 Dec 2024 09:19:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/dg1: Fix power gate sequence.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20241219235536.454270-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241219235536.454270-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: fff41bc4-6d17-41ac-afce-08dd20a94263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnI5bGxRUDVvNEo1ZE9iYnIyWXhrRWp4OG1LY2J0elliNjdCWVNQY0Q3MHhP?=
 =?utf-8?B?VHU4UjgwRGg2dnhqaFlFQU0xMWsrR2ZSMlE3MEZVSHhML3d4aG1aRTJPUVFT?=
 =?utf-8?B?N2F4R2p0OHRhNkdlZkpMQU1MMUpNWFhudkNCeHR1NXN3OGJvcUdzdFlmakto?=
 =?utf-8?B?L2JkdWFzb1dmckh3bFhQS081QlVuTWhUMHBwMzJnclloajdueHpUV2x6SkdQ?=
 =?utf-8?B?RStuTjkwSUUrbGNIK2RFRXFGenV5UDZKOXVReVAvV2Z4UWZ5dlZtVUdoTmlR?=
 =?utf-8?B?VGJtZzRQS2JNazFXcGFMU25WNUdjWU9NcmNLeVhkT2c0anV0dnNaV1RDckYw?=
 =?utf-8?B?RkJKV1lKalV4RnovbndKTkYwVERnVkJuS3pRWHJ4WFluaFBnOGRmOE42T3Bm?=
 =?utf-8?B?bCtHUW5qK01jODdhYkFqVzVxQWY0Vk1KQU9RWmF2akZtclVjUjRJNmhVdXJH?=
 =?utf-8?B?NDZxblFZRGd3UWdJL3BaR0NEQlY4cFNNdlR5VDMybklMRWJ0TWNuL05KWkhO?=
 =?utf-8?B?dFpIRDdMUFhJanFtbjJwZC9PNkNHWWV1a2RhTm1PWUNGczhlRURMam53MCtV?=
 =?utf-8?B?YnUzM0lGUTBzQWxRV0Y1ZkgxOUJRTW1WUVNNTTUyWXYyTUNxdWd4NUJOZHNk?=
 =?utf-8?B?bHlTQnVjOVIyQVUxYXVvMUR2aEFEcDlNZWZSWXg3WW81WFA2VGkwMmhrUFZL?=
 =?utf-8?B?WlJnRFlGVm56SHNyY2RxeHAvQ0ZwTUJmSTBlNnVHbUQxYzJCZTZ4WGtzSk84?=
 =?utf-8?B?UEp3cys4VXlLNU5SR3Bid0x1VENRZDBGM0k0UlNjV21odzE3NkdkZWVPZFU4?=
 =?utf-8?B?bDkxZ01jdlN6Sm5BSGtZamRIVWNJdlA3d3hpcTkwWGtKYlhLV2hKQ3BoUXZy?=
 =?utf-8?B?QzFVQVlFdkcwaUxiUmZEaXhwMHNiZ3BWVzlITFhEcmhUVUpJL2swMkV3RDMz?=
 =?utf-8?B?VDZGWDVUSE1WMXA4RXpsVzY2bEZRRllrK1puTFp0UkhKQnBZc0hpTW50VXlW?=
 =?utf-8?B?VXhRZmR1Y2RyOHB2c2kva1FnNk40SFMxeVNWRzRhL0ZzSkJUV2FhUXBGQldp?=
 =?utf-8?B?MHFzaTZ5Um1oektaZGF6ZVo5bGgwZmVlSmQvdCttTGsrMXY0SUJ2TVF3MmJs?=
 =?utf-8?B?R2RvUE5EWHE1SEMrRk1LaTMwcklSNjlodjVOVVVNYzVQUzhKdEVpYkd2amRU?=
 =?utf-8?B?WW10MUJFbDQra0JLdnRVS1FsazBncGZUQnZSWFN0Q0hTcjZ1U2E2eUtKTUFo?=
 =?utf-8?B?d01wc2RFWWFkdk9vZlpiUUMvYlArRmR1NTMvUjQ0V01BcERRaS9WbUk2cERM?=
 =?utf-8?B?dEJsalFOUytpdzlKK2EyTlo5NWpOR1hCQ2N6R3pOSlFuVjZZK3d3S0F1QmJ3?=
 =?utf-8?B?U3V0NWFlZUxLbHN3SVNrc0hNVmtDVlpIVTl6QWtSY3RjbTcwTU9LSUZzQlQv?=
 =?utf-8?B?VVljMU4vNVh0NW9lbFo3NWJFU3JXTTJRRk5BWUh4Ui80SXJxSzViMXU2dzhx?=
 =?utf-8?B?NWpaMzBrQmgvVXpLNzcwYlQ3Yy85MkdzMURHblM0NGw4WFYrZmZQUW84YjR4?=
 =?utf-8?B?OXZhTDFnWG05Wm0ybjZmVFcrZ1FyWEhCTjc1Z21tSk9VRXhrSFZmYWowU2FB?=
 =?utf-8?B?RzdZRUZpWVBxQnZNV0dMalhxVDhDRG1SV2dITzVDWEVIS3o4Vkd2cmJKUzVl?=
 =?utf-8?B?UmtSWFJGRGJ6L3lYMlpHbnJFUDAzcWpuUnJGSzRpYlV0ekFVU0hGMDJLbWov?=
 =?utf-8?B?bkx1TDFSTDYwMlpIM1lOUm1kMXAvYXRsTFdnVnFTVERyb2c0YzZuTzJuRTEz?=
 =?utf-8?B?VnNjNnBNS3BEM2R6RXRZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnNyK2hCRXN6YlVIQWZzSjVnM1VnOW0xYXNWMzdVckI3WE4ycVZMKyt3ZElD?=
 =?utf-8?B?b1d4bXZXV1JUbzgxeThtQitHajd6YmxYUjA4V3hIL2V6NWNYb3pNWUlESmd0?=
 =?utf-8?B?UVpJamFCcXMzWHlrRHhxSWNvSVMzQm94MWIyM08vMjBIcE1hMlNpSXdTQlVH?=
 =?utf-8?B?NW1OZUllcEdnQ2IvenNrZmFkSVFPa0FaYlhYcHdTU0JKWCtYOTkvRkNSa0po?=
 =?utf-8?B?VVdnY0l3TXIyREZoSEdrSDc5M0lVankvMHREWlRuQXM3V1Vqa0E4ZnNLQXhG?=
 =?utf-8?B?YjgzUzJEY3R5N0RZTTNIT2Y3QlBXVnZqZXNJa1duWHdQcVNUK25SSm1Tdits?=
 =?utf-8?B?MmwvUEV2U0hwTGZkWVo5TE43aGFIWm1vWklsQlpkOXZ4NVFzZWxGZzN0WGtB?=
 =?utf-8?B?c1ZSckVwdUdmeE1BUHZSVmVLNlpUS0l2VHltRE56TlZkR0ttbnVnSFJJYWto?=
 =?utf-8?B?N3ZGZ2tmRnFGSWlocmoyRkxYNWJ3VVBBVk9uMlpIR0hYTktvcHN0MVMvSTBV?=
 =?utf-8?B?b29TemF5YnlKc01LQWN2UzV5aFhMc1lhMEsycWtlV3ErVk1kUmdwVEpVLzEy?=
 =?utf-8?B?TE5yVThoNy9xVzlBSGxZbnppTXpmU3NkQmtibklzazJueGhDbWxGYi8xMDlH?=
 =?utf-8?B?NkIzcjZxMmVBQmVKZUtQR2grUmlpb3E2d2ZMenlUZndPR3BHQkpmZ0F3bWZh?=
 =?utf-8?B?Vm5wcXVscXRXYUswZ3V1WnRKQks4SlRLbmN1bUlieXB1REpwUjJVQ3RkTnhr?=
 =?utf-8?B?elNSekF5MXdqaUlEcTJDcGpQWHFHdVdiWTFUdUowU01IUjdYeFAzWlR2Unor?=
 =?utf-8?B?Uy9vd2FaNEVSWVBxS2NpZkVVY3Nsb0dPVDh6UDFmait6TnVvMUZlY2hiUDg3?=
 =?utf-8?B?cyt6QXpXZk1rck1nQTAzMGYwYm1JdkIrWWQ5UjJtS2VJOVlyVEJERElFN1pT?=
 =?utf-8?B?VnFHTnRiUGtCMzlzU2FQK0hCcjdrR2tLd2NQTmFWaGhNY1R2Y051djJOeGxQ?=
 =?utf-8?B?MTF5aFI3NUNkeERXWjN1MHJNVzFCUEt5T1hWMGc5ano3eHE1RzRPTGM2RlND?=
 =?utf-8?B?R2tXVVVKR0lNcVpzZUMxR2wzTVVmMWZzb2xRcmYzU0Mrd1o2MFdudWZSeGZ2?=
 =?utf-8?B?eXk5ZWtCOThlVlM4MU9GMTQ1N3pJT2pMVnpHenh3R2cyT2w2dFVBY0xhcGwz?=
 =?utf-8?B?dG5aT2NRc3JMQ1pzY2FmbzBma1NRcVBqbml2R1B5S3l3WHRtVWt5TDdkYlA1?=
 =?utf-8?B?RzN0N2JoQyt5V2JBUnR1UVh0UGtJOXk1Yy9ySFNSalVibjVRbEZoWElhMU81?=
 =?utf-8?B?Vm05VHd1RHp2Tmw1NnZlRGN5a21USnNUQkJUMXZPL3NFNDF5Q1IyeVZ2SEdp?=
 =?utf-8?B?QjdyYm1kNkZSL3BSUzdmMFJVTDZwelBmYVI0Q0k0cGhHU3lQMWVIZEtVS3o3?=
 =?utf-8?B?R3pRZFhCdmpCNVZhQTIvcTZPcHg5b05ERUh2RXk1NnFUWEV0VGljcDFpT0Vm?=
 =?utf-8?B?VytDVkxKbENDK3hnK3czZG15c3FiYzBpOUFxQXZUY09LcG5YNnRtNG1vaVdX?=
 =?utf-8?B?cTdHaVI3QlNhZjNvQVBPVm8xa3ZRUnF1NDhvMTdsWTJmQjMvV0tEODNPbG5D?=
 =?utf-8?B?SW1VZTJlRERtSitvaG1jWHk1Ly9VS3U5KzVWV1FoT2xxQTZtOTJLM3hPd1c0?=
 =?utf-8?B?Q09EZDNVRlJFK0ZGc3NqNHBqV2Q5dEdtSjMvYlBHdkdabDM5MXlmaWQ2c2J0?=
 =?utf-8?B?VkxMQkNzRndkOVRiTG1wTnhOblg5YUtWdUdDNFpGU2h1WWR1d1BMR1RybXRQ?=
 =?utf-8?B?VmRUSDRnNmhPYUFxdStoVDBFclFyYm9TQWt2Qm5tRDg4QmY1WGN3UzNDNGNG?=
 =?utf-8?B?NlVNRmVNaWFHRFozK0VSZjJVOGN3UFNJSTZyRkNrVmZQYnE2L3VrWCtsYUJM?=
 =?utf-8?B?UlRBQXBYeGh6SmN0UVNmTWdXendXTHlMeDZCM1U0TEJMamlSalhmN1I0YmNk?=
 =?utf-8?B?b21kRm5abzZoWDdZV3RzTWNSS25mMi8xNVcyODZtRm5SK2tBalMxZEFQa3RM?=
 =?utf-8?B?WmthcFkwZDdiMllhcmU5UTYvOC9sbStwWWZ3dzdSS29uajJpRjhEQmFCM0dC?=
 =?utf-8?B?UGhmMEt5S0pkYmN4WjBZSWRGK0tTQkF1TWR4RVJSRVA3QzJuK0dMc3RDeUUx?=
 =?utf-8?Q?AmuRflziVmyBJmYuRJ3dc14=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff41bc4-6d17-41ac-afce-08dd20a94263
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 03:49:09.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA5461B5NHsQKoUm14Gwtox+Y5LSpf2lzZJaJYH3psxD4q60qIzdsE6vuQSU64kDX34BuHJLE4IkQ+WizXAWjooyIjmLLXeY/16APKkXYh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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



On 20-12-2024 05:25, Rodrigo Vivi wrote:
> sub-pipe PG is not present on DG1. Setting these bits can disable
> other power gates and cause GPU hangs on video playbacks.
> 
> VLK: 16314, 4304
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13381
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index fd80afeef56a..ffd3ba7f6656 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -122,10 +122,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   	if (!xe_gt_is_media_type(gt))
>   		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>   
> -	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> -		if ((gt->info.engine_mask & BIT(i)))
> -			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> -						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +	if (xe->info.platform != XE_DG1) {
> +		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> +			if ((gt->info.engine_mask & BIT(i)))
> +				gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +							     VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +		}

Looks good to me.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	}
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

