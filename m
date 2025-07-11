Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF9C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 06:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D1B10E25D;
	Fri, 11 Jul 2025 06:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBxWznnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E2C10E9B4
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752214190; x=1783750190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GNXZIne1zyWqsNtbJfHg7XZkh0ZqKZlEe9I0lvBik9U=;
 b=EBxWznnPw+gVlXn2rce+yDOgDd9TMhrIpWZrIGJFwjsm+nj2kdlbAOeT
 NLIfNmfSgVznQmlHJ9HIw68M1BUXcZ54LmL760l1Fyw2N+jp8xZPh0Gmh
 GOAuBf6WXShvczSGgqcxFVQDOZAradI/34hot6SIqlds+JSPfOTd8n6jM
 83pBIwf7OanAQbD/5xVQXrhiFXonG+ldClMYW3HyfXnMiZA6ZbeF5EFFi
 Yg3NhiYlEWdqCXpTEXNlvN+XwrSd21FQikQQnOo/F89/snsYG+tfGI8Xu
 y8FIvTVIAVGaPVlPUGRpcMx5tOZ4jXViPMc+cX97XkggoFAtysmNRudEm w==;
X-CSE-ConnectionGUID: jR7OX6LvRC+FZByStgvd3g==
X-CSE-MsgGUID: keszQlCDQBeHgs1Y179Mpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58314920"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="58314920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 23:09:50 -0700
X-CSE-ConnectionGUID: gOMGKRB/ToG6nLh273y+Ng==
X-CSE-MsgGUID: ssGoDhuGRw+h+FoiygPoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156630382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 23:09:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 23:09:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 23:09:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 23:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4CDwjFL3a6cXPyaIDDMofSdkS3ni/l75p+N8fR3LfnEE/9j69XsGhDnd3Q3f1Q58HYWZymbEbBPPvGBSGry4Z33a3kiN7/SHV3AYHJCXSOkpAGvra5vxMw0P5jQqWG7RreIgVArGHLPiEExd4MAg1385wtDyf89z4T6n5LmcEX0a8SPo3F2oV/8Tx0JDJOvxRlG0X9FE+Gg6gU6j4VEiI4GIvFx8Db8n8dmN4f0DpgnTz4q1ASfVsZ/tk1vsR+VZIvxqIakLma84a/QuCxE/fwojiaKrAr0eeTXJyPjHTaXIbBZYZuQ6ZLqWe/8RzDCR9oMq9RMcyCBkCZ+y/PC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVLM2/mT0RV5sWfO/tENIdPhUo3ZHXYeddI1miCVbhk=;
 b=PXlGRyIIcn1vdUEVWvlb/Gt25DoyHa3hPhVRQZ7kr+hz4/aDADyTDEYnXNk3rwAGNrnPJr4rF+Y6Qx2ElNMWr6Y8vKbur/247gZ9GTlxbB4nVGDBMrDZdWQJ14PoaININ/1XY61A5M81K+YQrjFc7BNCFGPYRS7Sf/ebeFZNfmxqjJtOxelthzqmKM/ox7Bn/SQ8cnDY4zCGtkfLSBZ3GLXUHam+ffL92zkcruvMW9vXjPgkY92rO2JFBWkdc1mq/PBQVdlH5XTI5KfC2bXjwAr090hflcZTXetDevaQrjuameeTqUKW0lxcDQ1fA3dzvip9rOhJbFgwhDcFhMHqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Fri, 11 Jul
 2025 06:09:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 06:09:29 +0000
Message-ID: <0db2f198-433a-477d-bea8-81a1abba2b27@intel.com>
Date: Fri, 11 Jul 2025 11:39:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-7-riana.tauro@intel.com>
 <aHCjdQ_jcC8MvhvM@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHCjdQ_jcC8MvhvM@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7746b0-c9e6-4545-f86c-08ddc0417f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWJEMTcyWG5aZUVMUjUvVENTanBHdDk1bGVLUWNDanA1bHdENDcyaUp6SDZP?=
 =?utf-8?B?blprcUl2K0d4RHZpaGN4bndWTVdpTi8reUVKTTdXeWNoMXIrTmZ6b0lNQzFj?=
 =?utf-8?B?dldwaktqR09CVnJiZnl4dDZvbnlMakVSNW8wYjIwaVc3dzU4ejRZNEtFL1Qv?=
 =?utf-8?B?VCtPU1NzZFJUOUk1Z1VNcHpIR3htWWFJVURRWmRacnlqdXN0ck0zNm9HMjhk?=
 =?utf-8?B?Yks4bFF0Q1AvNFNyKzg1Tk1CYjQ0TG5NTHNHc0hITkR5d1llblBNUTdXVUlv?=
 =?utf-8?B?a3ZhQ0tXbUVmYWgrRHFUSTJOUmpLRzQyRE15QTk3endjNllqL3lHS2ZnRjEv?=
 =?utf-8?B?YWdPV0kzMnc2eVlEZHJzYTF4U2UyOVJ6Ty9yT3VtOGlKUTNmSnlCbVdyNERy?=
 =?utf-8?B?L01GSkx0QW40bFVacStPMGlOZStZSE9rYjA3S0VHT0YrTHdzR1ZPeStBU0dR?=
 =?utf-8?B?dFh4b25oSzJ6Ujg1cUhCTGo5WC9oemlvWnE0QndMY2dnRFVmUnRwZFdDWmor?=
 =?utf-8?B?UVNxU0R6UWZ1cWJyTVdqdExNUSsxZEQrK0h6RGEwYmFjdjlMWmFqdjJQa0Jt?=
 =?utf-8?B?TDdCUWpLaDRaVzdBMm9YQTJKMmwxQVA3OFZqa0p1RXJZcnUwclFVZlovbVdx?=
 =?utf-8?B?bk1oRzBUZ3R1b2lEcjAwVnNUNE85dUxqeTlyRWk0MWJ3STc4U0hQRUg5czgw?=
 =?utf-8?B?WVhtcU91S2IzUU9xQms5T3BUMUFDbFljL2txTGtrZThndE5WbFRGV1VTZnJo?=
 =?utf-8?B?TzV1bXRSUXZ3ZGVNbUhwejVJYldlYUQvSlJqUjdKOFhWc1RkQmNoVGdzdktR?=
 =?utf-8?B?d0c2cCt2WEd1WkZ3VDVEaHFQOFZRRXNlMVpSd2FtYi9qY2c0NjB2WFhXaGZ4?=
 =?utf-8?B?dkVPRWduOGdMNDFFbnpubWdHem5mTUt1V1c3WXI1MVZ5bXF3YzJaQThNd3Vv?=
 =?utf-8?B?UjRMbHBMZ2xXa1JDbXVCbytjZmx6VlJ6UTFuYWhjN1pCOGVOSWg5cG9TNDlO?=
 =?utf-8?B?WUJwRVpRdm1OeFFTSExwYWhWUnJYUXgzTlNFUEtHSVB6NVNwU1pXNklhcFBS?=
 =?utf-8?B?dzV4NXIxeTRBLytrYXY2WHAyL1JFNlRqMHN0SURVTVdHNDBvNTdqMVFRNnJa?=
 =?utf-8?B?R3BKOUpNYU52TXpWWkxMaFl2VUZvOFZKdUx2N085MTZLNEs3OG1DMWRWdkZU?=
 =?utf-8?B?RlEwT2hiOTZrVGxlRkRXeXliT0tabWJNNlYrM1Nua1ptTFFYTzd1dkZxV0FU?=
 =?utf-8?B?TjVmUXF0TjRGWmJXOWhnL2tqc0dHLzRtYk1oOTBReGpPV3VlOXJPMFgxZ29w?=
 =?utf-8?B?bE5NWFJhakg5Z0xwcVY0b0lpVVJRYXAyR1FZZ3R5d29hL1JXUzJyTUhkSDNy?=
 =?utf-8?B?Zm1NRWI2RHlQbG16L1lDditMNHUyamdKY2JieEwrYU91RVRrdkpQSngxS0R6?=
 =?utf-8?B?WG01T2dlcVA5SitycERlYyt1T3AxTGswL1FRK2pScVRKekhJeTU4ODNPN0Iz?=
 =?utf-8?B?SExNZFhQaTA2Y0IvcFgxcWtmcTN6c3ZLNTFPVzB5YXJTYjQ1L0xpQ28rMHBW?=
 =?utf-8?B?ZXUxWDBpVzhoVWdyWGx5d3QxTjlZNDlhU2puNFpHemVRUEorUTczYVFpVmZh?=
 =?utf-8?B?S1MwZXkweFJUdXlEWmVVZTQ3d2JRek8xaHUxRGdVYUt6bGNJWmlTN3pDZm9V?=
 =?utf-8?B?TDBST3NKSjErdmZjTDBqdFlya2QrYTd2NUNUWkdjWnJaMmtCS2hjcGNETml1?=
 =?utf-8?B?amxKT1ZMUDZyK1RUdHRxam5MS2FEblozS1B3T0ZVb2hUMWtyUEdHbDhmYWhs?=
 =?utf-8?B?eEhtT0JzN05rNFB1a0Y0Q3RJd3M2ckh6VlRCRHMyNDFVZjg0SDJWY0x2N3JC?=
 =?utf-8?B?NUtXdHl6YlRwUUUyTnBISFJJaGMvdjdGNE5nOGRPWVdDeDlZRzhLVzczOTRm?=
 =?utf-8?Q?AiXL6M42AI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJmT2NvcVZoWTlUeTRvYnNUeVNkaWJTQmk5QTN5bEx3Q2d6amlMOEMzV21q?=
 =?utf-8?B?Um9qdXFSMlFlQyt5bW5EZGliWjRCL0hTbFdOWFFJdFIzVVNUWm0xQWtRcEpz?=
 =?utf-8?B?R3Q5WjBUdjlwWFNlRjB3NGJ1cUVYNGNwLzhUY0hwS3BoZmtQc0I2aVNhZG12?=
 =?utf-8?B?WjBzT2xoVHVyZlF3eVBCaXRHMXRrUWhjNTRKMWpkYzN2U3JGRVpWdTFqbkxY?=
 =?utf-8?B?V29TM3hIdDhqUGNCNDZCVEE1S05pNlhzODNSTVZRY3ViQm5BRkxpeXdDU2t4?=
 =?utf-8?B?RkM4V3RraG4xL2k2SWprZWFTUk9rRXg5RFN3T3V1VVhnS2xRZGVpeVJiRGxx?=
 =?utf-8?B?RUM1Qk5Bd09DRzNWRUhrOGxOWlBKNksyZzArYnZEQ3ZlbWMxd2J0WUxtcU1D?=
 =?utf-8?B?WFk1d1RYMWpyM1A5eVZYSG5QNDNtYXBmeG5oV3A2L2I1RTFxMUk1YmcvZW5B?=
 =?utf-8?B?d3F0SDRIUUtCOXRKSENwU2F0bkZJZkIrT2Qrd05EUDZWRHRsemFzdmVvdE1K?=
 =?utf-8?B?QUpnODVRYXVSWFo4bjVtUUQvU3RscDA1WTZUdjFCVVVTeEhmV056aHYwaldW?=
 =?utf-8?B?MU5sdzRKZW95d3hoRWNNTXZ6eHNyeHZrQ1FuUUMyQ3IvMkp5dGpuZTN6a2ov?=
 =?utf-8?B?QkE0Q0haOURRK1draFpXVzhNYjRWbUZQeDF2dlN2YTRZZklWTjZBWGlaZTNQ?=
 =?utf-8?B?RGZwT1FEVDFKWGIxM2FxNVlhV1VFU1RPZmNsSERoQmM0U29nRUlDVThSM0wv?=
 =?utf-8?B?cmhvWTdyaTA4ZzdWTlBWSkJCeU91VHMxNTRqZm5ldFFFNkkzZWUyYXhJdUtq?=
 =?utf-8?B?RytLN05OUmN4ei9rRGlZVFdXUDNYS2c3MVhMOEJROTNzazQ2NEJQVzU0cTlG?=
 =?utf-8?B?V3plcXNFSFI1U2FDUlRHWmJlaFZkWWFFNGRqUGwvZnExYi90V0dnRzlHY1ho?=
 =?utf-8?B?bWdPNXVNY21tTTlsaFlhbE5tQ01BUEJkMFRrcUlUSGc2QmFUdTcyNlpNOGd3?=
 =?utf-8?B?UG1kOS9lWXMxN0NaQWpjTlEwUmoza21OeVhHNEc3TVo4dUNNOE56K0FwVFZE?=
 =?utf-8?B?WEpIVTZJODhzMXdhQjJLMForS2IrOVJqVUR1dVZWRUZydDVsWEVZYy9ESW1l?=
 =?utf-8?B?NS9tbUxDS2NSVndsMHhwU3d0RndFSDRVQTcrdnVFaDkzWm1TU1VRRWJIdDZX?=
 =?utf-8?B?MVhzZGcwRUNGM3pieE5kcmtyZjhlUjU1RFQ2Y3Btcktvb0RycHhUUlhXNmIw?=
 =?utf-8?B?MnFkYTBRWnR2WXlkVlVnb21uTDl4Ty9tSDJIU1ZYMndVaEcxODAwdzlZc1FB?=
 =?utf-8?B?UHNlR29oTmp6eVc1UFpENTY0K1FQekhONVVvQTBIMS91NmdCeFBQT0d6b0V2?=
 =?utf-8?B?aWFxaVVyRzJFNzlNaDg0VW41M3o2cFhYSHVNczBCMzYzNlRKOFpibDMzN3VU?=
 =?utf-8?B?VkNIZEJJdkVTN2NjNCtHQmpqWVBrRnE0MWFrS0dlM0lCOXRQM21BS2huRHFB?=
 =?utf-8?B?NFpwdnhHdWJiWWl0QXFPZG5UZjVpdXJxMFBaMGRpNnNWZWtrQ1IyQkR0eDBC?=
 =?utf-8?B?NnZWMzcvOXlKcDhCTzJXTTc3ajRvYTBaaUN1S2hDWTlhenVjUzZISVRsUGxO?=
 =?utf-8?B?U1dMNTRDd014YzRXOGdYWlVYMURuSUhydjYzVk1OMVV0VDdZVGxPbmRkSDEx?=
 =?utf-8?B?alhkakd1eGFwTVhSM0MzVkZCeUc4OUlBTFdkOUt6bWE4MlJXUmlQSkRTVFFn?=
 =?utf-8?B?RTkyUUs5eithd0VRYW1UaVN4Uyt5bkhlbEpValdteTF5MUVJWi9TVW1NSXlJ?=
 =?utf-8?B?RE9GalR4Z3ZwZW1jc0JPdkRvVE5kazVTQ2xhUlVJMGpGMTdYKzVpcnBBWWQy?=
 =?utf-8?B?bm5CVkVFaHJyZXlvYUtneUpCYm1EdXYxVGJIOVVwd1B3TmgrTkVnMzh5YmFu?=
 =?utf-8?B?WVRXZzVaczlGSkpjeWVjM2ppWGdTRHJnSWt3OUZKWEx1Q1N0SGlRZ0poV3JM?=
 =?utf-8?B?bVRwV25WYTJwcHVqN0hSTXFRTk9OVkRZd3R2S2NxWWw5RWRqYVg3Y0dmMVJG?=
 =?utf-8?B?RTFzNGt1R1JHK3htVVFTT2pCUHFwT3Vqd3d3VnM1eUhuY1NuODVybytBUlJF?=
 =?utf-8?Q?IvHq1bXxYXoevtsixSed7AsEf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7746b0-c9e6-4545-f86c-08ddc0417f45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 06:09:29.8603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyA96PbPWmegOXXkzY6uJc1ayic+fezraqQCXGfniIy+l9MPOgRnlSsznWrmlqXk3e7z5tTzDrBVa8Cf22OETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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



On 7/11/2025 11:09 AM, Raag Jadav wrote:
> On Wed, Jul 09, 2025 at 04:50:18PM +0530, Riana Tauro wrote:
>> Add documentation for vendor specific device wedged recovery method
>> and runtime survivability.
> 
> ...
> 
>> + * Runtime Survivability
>> + * =====================
>> + *
>> + * Certain runtime firmware errors can cause the device to enter a wedged state
>> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
>> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
>> + * is indicated by the presence of survivability mode sysfs::
>> + *
>> + *	/sys/bus/pci/devices/<device>/survivability_mode
>> + *
>> + * Survivability mode sysfs provides information about the type of survivability mode.
>> + *
>> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>> + * survivability mode. User can then initiate a firmware flash to restore device to normal
>> + * operation.
> 
> Do we have definition on actual procedure? Can we add a reference to it?
> Otherwise it's telling me to do something I have no idea about.

That is a userspace tool. I don't see any kernel code refering to 
userspace documentation.

Thanks
Riana


> 
> Raag

