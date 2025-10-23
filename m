Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E575CCD1BF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 23:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1582410E04E;
	Thu, 23 Oct 2025 23:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvgX0s47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D5510E04E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761260666; x=1792796666;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2DSWnY+dnk2VqfhHcLbb0+zqDqi1uzX8mK9m+bKRxso=;
 b=GvgX0s476vPhVVRZw7a5XoYxlCcDgKLUYroS9lSigxdl7+o+JYYi82bn
 v/MUOHTn43mhTs1w8EEggQlQvQgDEpkNKni4kfsLXmdzizOzgyZueWHj0
 NpTGApwClcCHD1OdsuoRE5gLCJ6psA590Y3cdXlUC0hdc+MU76okMFyEA
 FcnSZr34K4wdFfUyYUnjQJC3s/O6W5yJIeChqsgmyzF3pTQ7EJsOeq8GL
 poi8NBUkCWmKS3CAI1r+DmomNg1crg1QuI2xyQrTT8z1MLYh2hk1U9kmR
 UUXU9a0g/vad5TnbxxU3XVJOvfzmg9t3o9WiEqZqwwCdrb517rmiBfSdU w==;
X-CSE-ConnectionGUID: 78FkYys8SeaE/WqCLm0+AQ==
X-CSE-MsgGUID: rsEmdSZ8SEmjhcNtFZYqcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63537010"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63537010"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:04:26 -0700
X-CSE-ConnectionGUID: dJ8O68bjTdqTBrqrmdBp/Q==
X-CSE-MsgGUID: vrKBmANbQSuFGDaMhTw0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="183888994"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:04:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:04:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 16:04:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwcaI1av3EVLvpGCDHHSQBWTwamSB57mfIAw1GbFAZvu9f72qteSi0EGTjPcELRNTNONzBbFcr+4aNyMDC0nZDAZgjVUuSWcN6/pXOVSWzzfsW25CBHWYuOmfKL7TCVaox+hxRj/rzZbhNGOLtqZS3DtIIC9MAe5zhQFjP4S/ENhRBXkHehX4yz4uCi3n+81sNHiIHcjpVQ438YmlSqITyHk0zm+7IWmpL9RHKFXVtuAcOy4avQP06YkYMrSbNpw2zh80lRL1lPHgYT3wiPXK+tHPQPupvisQefneez+BG1mG0UYtABE5CGgx4vyRmAvfZQqznrEhh8azoGquUiEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7lSOi5nZiYwGcUk1347WFltziV7adb/zhMTmZfOGOY=;
 b=bgcWCTqUlC8x4GQtxPmi4WC7lDhvfmX9rTOaeCswcRwzNS7YDc3DEMAq+6YsOgIB0TRobBVhYySdd99uFG0yfKIeeEXYIq5a35yUs0d0UqFq/zAgiifl91b00pSYpxlJ/Rbyvrh5ZK+f7E7n61Wwtcuwqv/b/alQBeC1wbBgcUjL2c2tpBti6NbrbkAlTUpaRoX4s4pWuC7M8VGUCF7qAU2vpV8BgMIfXKEMUuv0g2lbsw8RD1o9ywc6AEacshkIuYqLjFRjkU+zzP16ifsybhI4wBYDB5aYoiF2R/2fMD/TVq+u4Y26trr0kiRR/LTRWhCM47h0ZOXBifiFFbsgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:04:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:04:16 +0000
Message-ID: <cdcac9b3-79b2-4c3c-9a7c-de6fa584b2ac@intel.com>
Date: Fri, 24 Oct 2025 01:04:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/guc: Cleanup GuC log buffer macros and helpers
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251023175855.2464961-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251023175855.2464961-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0164.eurprd09.prod.outlook.com
 (2603:10a6:800:120::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b520db-0e61-4b5b-f75a-08de12887da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUc2Z0MrY3YwNlR3bXpiczVBVzA4YjBxTnBvZ2tqY1B5azJ2Y0pLWGRpNEE3?=
 =?utf-8?B?Q2hhT1lQYjdwT3BNc2Jjc3NEQzJRODh6VlZOMVdublhiWWNpeWtTWmNQSEpT?=
 =?utf-8?B?WWxMU1dWdXJLaWV1VWxabS9mQTJBYUZpQ0dJU0dlei8vZGlMM1VzZXoxZUF2?=
 =?utf-8?B?STZmRE14cnFYSzNLNXVvY0NIZWE1ZlM3STc4eGNGbmRyUkVCRlYxWlpXWE9z?=
 =?utf-8?B?ZkpxWEU3UytWODdOMlNQRElpRkxwWCthZzgwUGpNYndzQlJLS0laQWlVakM3?=
 =?utf-8?B?V3pPd1J4MWExWHhxM0k2SkoreDBFdVBWMXVoNWRUNlpqdUsrN3RIUE5obG1Y?=
 =?utf-8?B?R3E2N1ZobElQSHB2QzZKRzdObHBMTWtnVmZRQjdKK0RqOFV4angyLytVbW01?=
 =?utf-8?B?c3lpWnFpT05NR21PTG9CdS9adysvK0xHdkw4ODlmN0FBWXJuR1pnelZrT0Zu?=
 =?utf-8?B?d0FUem9PQndoSm1kSlJkQ2c3SDhFSVNQeUhpWGZvQWsrbEN1OUoybHBpRzYw?=
 =?utf-8?B?R3BQMmYwTWxDY0xoVUtqSElOY1NnTDBINTA4dGJzSkNxUWpVWUhBS3BZMk80?=
 =?utf-8?B?R0NNWnpycmluRWlTZXFJYi9KVDRORDJqcWdaVHdxRTQ4LzJEaEIwSkdsUzBQ?=
 =?utf-8?B?ZzV3L2JibUg5VjN5Y0ZGQ0NQZnBoVnhVVktIVVpIYmlkSDUvNTRjM2Q0OXFS?=
 =?utf-8?B?c0xlOFBiNjRxblpwWDBrT3MvWldoTE9MWkFmemQrSWdTUzkwWE4wOENaWXFC?=
 =?utf-8?B?SDdlN1NjWjVsTDI0Z0JpOU42OWtxR25ENGNGOU9NMnR4VEJPUzNvcHNxa1h5?=
 =?utf-8?B?ekNtdWVVaCthTG1JVHdhUnlpdGhtMWxVVFpHR0xHR1pubEd0N3BzLytyZXdk?=
 =?utf-8?B?cUZ5M25nUkIzL0NKeDZwblp3S3V2QW51RytBWFBaYUIzWXZzbmp6NDRCQ21M?=
 =?utf-8?B?YytpbThjVi8ydlVkNm9VdERQWkd2aGlLTFJ1ZWdCZ2NSVC9QOGNYait5RWpP?=
 =?utf-8?B?MVpyOG5MMExoTWZ2MmE1OHoxMWllUzQxc0JkLzlXbU5yNG9rWVBGZ0x0TDZp?=
 =?utf-8?B?ZGUyQytXbDl6NjBPdnU2eWZtY0p0a3lremdubmR4RnZhdmpudlh4azJUdnJV?=
 =?utf-8?B?U0lQV3VyZHlNUHJLWGd1L0JGZlRrNUhoVmVnOXEyR2FiV1NKb25icjBCSmpU?=
 =?utf-8?B?aFY1TjhRbXFReVAvVEp6bVRVY2JKeEg4cGNBVVFLakQrRzhlRmhQb2cyWXlZ?=
 =?utf-8?B?T3J1cXQxRWtYQmxJOU5LRnpmb1JHSnQ1NFY4cGdKRkFORmptai9hN09UQTZJ?=
 =?utf-8?B?Z3dUSWx2WjIxMGwyTU1ZYlVvek85NzkrMFFpeXBPYy9iMk1VNTI1RGVLdWh3?=
 =?utf-8?B?MjBEUGpNdDFOSEthYi80WDNHS2VEbVhrRlMvdTBheU9jYzNydjM0RVNMZ0k0?=
 =?utf-8?B?ZC9ESC9QZFBzWEdKRCsxWW11QjJYc1h3THFLOVM2S0RxVHAvM1FxTDBHekFK?=
 =?utf-8?B?R3BZUFFqWHVYUHc0TzdBZjdSUjFXYVdaT3ZsWnRxOThXZEVzMzJxWGZHT2E3?=
 =?utf-8?B?ZTN0ZCtsYlYyYklhazlJRG1MZFFad1RUc0FnckR1cVppb2pGcExDS3ZybzJt?=
 =?utf-8?B?VGUxUTZLN2lwbDZXVEpMUDkwSndyYnFjdnRaMVBRNnM4Umt0MnRlcnc3Q3l1?=
 =?utf-8?B?RXE5ZXZWRFExMSt3aFdDT1JkMGgxMk5yREFaVzRLTEU2cm9WbEYyVUZHcWZv?=
 =?utf-8?B?MmpVbU1YUXN4UE1ES1ZlaFB1WlZTcnN3RTE1d1NuMG5CQkRXYUQ2eVVnYjQy?=
 =?utf-8?B?M2tEK2pkUWptaVBYZU10bCthSjZVQXlDdFNvT3MxU2YrM0RqWUdzRTY0V2Nq?=
 =?utf-8?B?S2ErcklEaE9jTCszQ0hBUkRJdmF0Um9wYlRXeStsbzRVdXp4Tno1SFFKdnJJ?=
 =?utf-8?Q?0ABdl1K6aPlTRniwB7m7JwfiVr2YqsqX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdqMjltZWxSL3NZdWZla1pISldFR1lWNHBTYnM0RXlkZjlTd3R2VHhiWURy?=
 =?utf-8?B?T3Y5RkRUaWxzV2dzcWJNb2E0MjFFRHR4alI4U295Qys0N09TNjl6Nk5zaWNH?=
 =?utf-8?B?aXBVVDZ6ejU5eEVWSVJHTGlBMzYzdk9pOEdDaVFVWXkrVzFqZVJiUlB3Mm1z?=
 =?utf-8?B?Y3l2V1pjZ0NCTHJ6cE1WUnVhdEtvdVkzcjJ1Rmh0M25zOVZqTzVwNWErZkNz?=
 =?utf-8?B?SGordEc4MlZHeG9uTmdneGI4SGtNRVREVDB4OUhNOVc1WDMzT2Nwdm9YN0Fz?=
 =?utf-8?B?QWxpNXV5RDNtQ29OY1pDSEMreWljTGd2VmhQTUE4TjE0WHdNaXhOTWw1SmEv?=
 =?utf-8?B?RExIVnk2SUlQS1RFYldpU2xlbldCWFFvbUtrWTBZNWVKU0MzUG94eC9kdmtO?=
 =?utf-8?B?WGw1Ym45NVpzZUZpYnd1Wm81Q1pLQkorWmJaVVBTcmhrcDBKQ2xTb29Ub2xF?=
 =?utf-8?B?M3FFMG1SdmhxTVQrK2laUEZ0ditjZnF6Nnd0cUVIVndBSUtZL29VVHVYcHFn?=
 =?utf-8?B?U3ZXajljM1Q3R0VIRDIwTTRFM3RzTzV6RnlFSTNBUHo2aDJWNlZZY0VhVVBq?=
 =?utf-8?B?UmwybjZIcWN1UUFQTHllZVdjajAxVisrZDRLVjZGZUNPU0dwVEFsTHlNVS8w?=
 =?utf-8?B?RVF4THFBZDJVZ2htMjdlSU1mdjBtREp1eE5TZDgySnpKVytUZ0VjVkVpaUov?=
 =?utf-8?B?MU4wM2VqWHJHSldVNlRETmEyWlNnUDlOMnVIK3I0MHZoYk5uNmozbi9NUmFG?=
 =?utf-8?B?bzd6dS83eVNSL1FheWZta2ZVbEQ5NzcwVXJXaWU1Rk9QS3U1TmJKYnkzU0dq?=
 =?utf-8?B?eGJwWTFoYnVoTDlJbDQwMVZNUENWVHlrbXlPS0xOTk91anRlL3lEcVdpZ3pk?=
 =?utf-8?B?Y2dzclYzTFcxMUpUWlJXaEVMQUFGUFJHekVxWi9ncDgwc1B4eEVRaCt6Njlx?=
 =?utf-8?B?VUhjY05RZW9IbjJiSEZ6Y2Z4U3VTeCtjRmgwYk9kV29hM1E5M20zWTB5WWdG?=
 =?utf-8?B?YVE3YnNTRklVb1dvMUdWY2ltK0o5dFVKcVRLNExxQktNb1hGWnErNTdmQzg5?=
 =?utf-8?B?Zm1ybmhwcjZjUENYUkQyem41OFAwbmVIdSs3dVhQdk5SUjBXT0QzOCtkZUYv?=
 =?utf-8?B?dUlUL2tJU3NSdC9OSVJLQWF1RWhhVUpmcjVDSnV4Y1pMZE5WNDJmeVJDeWF4?=
 =?utf-8?B?NkhlRWl0QVpOczVxNUZqNElFY0lJM1Q1UHVPenBJdEhFTG5SWTNRUzZhUFVJ?=
 =?utf-8?B?eCtzcjdSdUNuMGlxRzFvcG1vV2RCbjFtRGlQQ2IxVktXVGI3VzBrdWp0eFoy?=
 =?utf-8?B?M2d2SDMzWnhENHdjb0JOaUlIK3JtaCt3bndFWnVYaW1TSjhIUk1Ob1BZMWg0?=
 =?utf-8?B?dHBJYXVmNEp2VjJ6K3hoa0lkTmRiYlJFaWMwQTZuOHk3YXlGV3NmU0pnRmR5?=
 =?utf-8?B?dEhFc0NnT0NRdzQzeFQ3WDlwa3hCTk5CdEJkN2JUTkVlS0lzTExOdE5peDly?=
 =?utf-8?B?TE8xSld3OEVKaGh1by81Zjdpd0REQ1BEMGYxcksrSndtcVJ5cGhidXRrbWI4?=
 =?utf-8?B?WUVYUDJCUGUwQ0ozckhsQ01ybUMyZ01jSHNXd3dCSjI5Y0NRTkIwWmdta1FB?=
 =?utf-8?B?NGZROSt1OXFtRGJqN2FSMWtDUUFaWWlxNmMzZjNIN1p3OVYyYTlZRVhDeUFO?=
 =?utf-8?B?R080TUJSUHhiQzJyKzRPTkhkYzl2L3ZRaFpPSGlITjBmNG1MNTNZUEdGM3lU?=
 =?utf-8?B?NktsRE96cmFpR3kvM0dUV0w3UGtnM3VoNDNZRnRDcS83ZjR4eCtZMzdmUDZU?=
 =?utf-8?B?WUlESktEaXIwU3dwdFhWbWpUYzdQU2h5VmNrMWpWNHJWRnd2bHVZd2t0RWNZ?=
 =?utf-8?B?eVZCNDBYRXFRb21TTjc2dk01a0MvRGR6WVhDQllCVENTSWV3SVJuR0k2UzA1?=
 =?utf-8?B?d1I0d1o1TTlBMFpDMVpqc0VtcEZVTVRYU2VtUHIxL2ptZTNueW4xSFBpK3Rt?=
 =?utf-8?B?bm92aDZHMExoSW9zN3NwaVY5YWltWFRnVHdEdC9qMmtqQVJmM3BGWW9lZ21j?=
 =?utf-8?B?dnp1aGpOeHIrTjdxTEhWemZMakJjNjJIY1hyQlpRaUcyYVB4TkJmLzY4aC9q?=
 =?utf-8?B?VlQwZk1mSm9kQVh5NzNYaGtQMUkzME4wUS8xWnJ3T0JkalRXT3R3Mm16Y3RE?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b520db-0e61-4b5b-f75a-08de12887da9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:04:16.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgT3p5C9Kdbbqnj5NZMqy3dGFqVBBR9xb5SjlvqIMweDpJAqNkvah8wHvx1dq2rjN+RleQ/a+AfDSGks8KL6h2SLHVIhkViv5zMC1tEWYCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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



On 10/23/2025 7:58 PM, Zhanjun Dong wrote:
> Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
> Update buffer type values to align with the GuC specification
> Update buffer offset calculation.
> Remove helper functions, replaced with macros.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> Cc: michal.wajdeczko@intel.com
> ---
> Change list:
> v6: Avoid change same line in series twice, squash into single patch
>     Correct PAGE_SIZE to 4K
>     Promote memory layout comment to kernel-doc
> v5: Change patch order
>     Sync macro names across buffer type, size and GUC_CTL_LOG_PARAMS
>     Replace guc_log_size with macro
>     Update log buffer layout comments
> v4: Replace helper functions with macros
>     Rename log type xxx_DEBUG to xxx_EVENT_LOG
> v3: Update comments
> v2: Use SZ_4K, instead of PAGE_SIZE
>     Expand for loop with switch and fallthrough
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
>  drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 129 +++++++++++----------------
>  drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++-
>  6 files changed, 82 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..fb5e2b8e7cf9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -10,9 +10,9 @@
>  
>  /* GuC logging buffer types */
>  enum guc_log_buffer_type {
> +	GUC_LOG_BUFFER_EVENT_DATA,
>  	GUC_LOG_BUFFER_CRASH_DUMP,
> -	GUC_LOG_BUFFER_DEBUG,
> -	GUC_LOG_BUFFER_CAPTURE,
> +	GUC_LOG_BUFFER_STATE_CAPTURE,

	GUC_LOG_BUFFER_TYPE_EVENT_DATA,
	GUC_LOG_BUFFER_TYPE_CRASH_DUMP,
	GUC_LOG_BUFFER_TYPE_STATE_CAPTURE,

or

   enum guc_log_type {
	GUC_LOG_TYPE_EVENT_DATA,
	GUC_LOG_TYPE_CRASH_DUMP,
	GUC_LOG_TYPE_STATE_CAPTURE,

>  };
>  
>  #define GUC_LOG_BUFFER_TYPE_MAX		3

do we still need this?

> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..c82570c70964 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>  	u32 flags;
>  
> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define LOG_UNIT SZ_1M
>  	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>  	#else
> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define LOG_FLAG 0
>  	#endif
>  
> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define CAPTURE_UNIT SZ_1M
>  	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>  	#else
> @@ -115,20 +115,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define CAPTURE_FLAG 0
>  	#endif
>  
> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>  
>  	flags = GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
>  		CAPTURE_FLAG |
>  		LOG_FLAG |
> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
> +			   CAPTURE_UNIT - 1) |
>  		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>  
>  	#undef LOG_UNIT
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0c1fbe97b8bf..4e2c5a51adc8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -843,7 +843,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  {
>  	int capture_size = guc_capture_output_size_est(guc);
>  	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
> +	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  
>  	/*
>  	 * NOTE: capture_size is much smaller than the capture region
> @@ -949,7 +949,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>   *                  ADS module also calls separately for PF vs VF.
>   *
>   *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
> + *                  Size = #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)

do we need this "#define" ? maybe just:

    *                  Size = &XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)

>   *                  Note2: 'x 3' to hold multiple capture groups
>   *
>   * GUC Runtime notify capture:
> @@ -1367,7 +1367,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
>  {
>  	u32 action[] = {
>  		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
> -		GUC_LOG_BUFFER_CAPTURE
> +		GUC_LOG_BUFFER_STATE_CAPTURE
>  	};
>  
>  	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> @@ -1384,8 +1384,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	u32 log_buf_state_offset;
>  	u32 src_data_offset;
>  
> -	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
> -	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_STATE_CAPTURE;
> +	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE);
>  
>  	/*
>  	 * Make a copy of the state structure, inside GuC log buffer
> @@ -1395,15 +1395,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>  			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>  
> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  	read_offset = log_buf_state_local.read_ptr;
>  	write_offset = log_buf_state_local.sampled_write_ptr;
>  	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>  
>  	/* Bookkeeping stuff */
>  	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
> -	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
> -	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
> +	guc->log.stats[GUC_LOG_BUFFER_STATE_CAPTURE].flush += tmp;
> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE,
>  						     full_count);
>  
>  	/* Now copy the actual logs. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 50c4c2406132..8b5c58b1857c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>  #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>  #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
> -#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
> -#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
> -#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
> +#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
> +#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
> +#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
>  #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
>  
>  #define GUC_CTL_WA			1
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..995148e3f103 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -19,6 +19,45 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +/**
> + * DOC: GuC Log buffer Layout
> + *
> + * The in-memory log buffer layout is as follows:

... as follows::

and empty line here

> + *  +===============================+	      0000h
> + *  |    Crash dump state header    |		^
> + *  +-------------------------------+ 32B	|
> + *  |      Debug state header       |		|
> + *  +-------------------------------+ 64B	4KB
> + *  |     Capture state header      |		|
> + *  +-------------------------------+ 96B	|
> + *  |                               |		v
> + *  +===============================+ <--- EVENT_DATA offset
> + *  |  Event logs(raw data)         |		^
> + *  |                               |		|
> + *  |                               | EVENT_DATA_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- CRASH_DUMP offset
> + *  | Crash Dump(raw data)          |		^
> + *  |                               |		|
> + *  |                               | CRASH_DUMP_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- STATE_CAPTURE offset
> + *  | Error state capture(raw data) |		^
> + *  |                               |		|
> + *  |                               | STATE_CAPTURE_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ Total: GUC_LOG_SIZE
> + */

since above layout is fixed (up to actual data section size) this DOC could be placed in abi/log_abi.h

> +#define GUC_LOG_SIZE (SZ_4K + \

maybe this one should also be defined in .h where other _BUFFER_SIZEs are defined:

   #define XE_GUC_LOG_BUFFER_SIZE (SZ_4K + ...CAPTURE_BUFFER_SIZE)

or make all names shorter by using only _SIZEs suffix:

   #define XE_GUC_LOG_SIZE (SZ_4K + ...CAPTURE_SIZE)

> +		      XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE + \
> +		      XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE + \
> +		      XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)
> +
> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -37,33 +76,6 @@ log_to_xe(struct xe_guc_log *log)
>  	return gt_to_xe(log_to_gt(log));
>  }
>  
> -static size_t guc_log_size(void)
> -{
> -	/*
> -	 *  GuC Log buffer Layout
> -	 *
> -	 *  +===============================+ 00B
> -	 *  |    Crash dump state header    |
> -	 *  +-------------------------------+ 32B
> -	 *  |      Debug state header       |
> -	 *  +-------------------------------+ 64B
> -	 *  |     Capture state header      |
> -	 *  +-------------------------------+ 96B
> -	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> -	 *  |        Crash Dump logs        |
> -	 *  +===============================+ + CRASH_SIZE
> -	 *  |          Debug logs           |
> -	 *  +===============================+ + DEBUG_SIZE
> -	 *  |         Capture logs          |
> -	 *  +===============================+ + CAPTURE_SIZE
> -	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		CAPTURE_BUFFER_SIZE;
> -}
> -
> -#define GUC_LOG_CHUNK_SIZE	SZ_2M
> -
>  static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> @@ -257,7 +269,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
>  
> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> +	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE |
> @@ -265,7 +277,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> +	xe_map_memset(xe, &bo->vmap, 0, 0, GUC_LOG_SIZE);

use xe_bo_size(bo) instead

>  	log->bo = bo;
>  	log->level = xe_modparam.guc_log_level;
>  
> @@ -274,49 +286,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>  
> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> -{
> -	return CRASH_BUFFER_SIZE;
> -}
> -
> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> -{
> -	return DEBUG_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
> - * @log: The log object.
> - *
> - * This function will return the capture buffer size within log sections.
> - *
> - * Return: capture buffer size.
> - */
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> -{
> -	return CAPTURE_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
> - * @log: The log object.
> - * @type: The log buffer type
> - *
> - * Return: buffer size.
> - */
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
> -{
> -	switch (type) {
> -	case GUC_LOG_BUFFER_CRASH_DUMP:
> -		return xe_guc_log_section_size_crash(log);
> -	case GUC_LOG_BUFFER_DEBUG:
> -		return xe_guc_log_section_size_debug(log);
> -	case GUC_LOG_BUFFER_CAPTURE:
> -		return xe_guc_log_section_size_capture(log);
> -	}
> -	return 0;
> -}
> -
>  /**
>   * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>   * @log: The log object.
> @@ -327,13 +296,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>   */
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
> -	enum guc_log_buffer_type i;
> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> +	u32 offset = SZ_4K;/* for the log_buffer_states */
>  
> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> -		if (i == type)
> -			break;
> -		offset += xe_guc_get_log_buffer_size(log, i);
> +	switch (type) {
> +	case GUC_LOG_BUFFER_STATE_CAPTURE:
> +		offset += XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE;
> +		fallthrough;
> +	case GUC_LOG_BUFFER_CRASH_DUMP:
> +		offset += XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE;
> +		fallthrough;
> +	case GUC_LOG_BUFFER_EVENT_DATA:
> +		break;
>  	}
>  
>  	return offset;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 98a47ac42b08..a3620462f44c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -13,13 +13,13 @@ struct drm_printer;
>  struct xe_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -#define CRASH_BUFFER_SIZE       SZ_1M
> -#define DEBUG_BUFFER_SIZE       SZ_8M
> -#define CAPTURE_BUFFER_SIZE     SZ_2M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>  #else
> -#define CRASH_BUFFER_SIZE	SZ_16K
> -#define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M

what about using shorter names:

#define XE_GUC_LOG_EVENT_DATA_SIZE	SZ_64K
#define XE_GUC_LOG_CRASH_DUMP_SIZE	SZ_16K
#define XE_GUC_LOG_STATE_CAPTURE_SIZE	SZ_1M

>  #endif

then we can also provide here:

#define XE_GUC_LOG_EVENT_DATA_OFFSET	SZ_4K /* btw, this fixed 4K header size should be part ABI def */
#define XE_GUC_LOG_CRASH_DUMP_OFFSET	(XE_GUC_LOG_EVENT_DATA_OFFSET + XE_GUC_LOG_EVENT_DATA_SIZE)
#define XE_GUC_LOG_STATE_CAPTURE_OFFSET	(XE_GUC_LOG_CRASH_DUMP_OFFSET + XE_GUC_LOG_CRASH_DUMP_SIZE)


>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>  	return log->level;
>  }
>  
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);

then we can kill this function, as there is only one user which can use XE_GUC_LOG_STATE_CAPTURE_OFFSET	directly

>  bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>  				   enum guc_log_buffer_type type,

