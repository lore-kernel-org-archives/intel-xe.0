Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C34C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 19:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168F510E1BB;
	Mon, 12 May 2025 19:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yvk0XuKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AA710E1BB
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747078226; x=1778614226;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oCdNINqdbPWL2ov6zogflR64iTTv2BLk6T8nlcScJso=;
 b=Yvk0XuKv+UZI7nzPtMKRtEZDx7M87zaLGLYFSTwA6Wy1NtG4K5KyXeWR
 Hg1w6M8KrByHUEY+bHCFwHb9O/qnuFJ66shXcJ0L+narXYBM4ybzXkGSm
 STsEdwG3bazF4D7xcQ2dc3JptGyLBf92Zt5NYvlCn5siGjDm1FFlXn+w7
 wP9CWaFHttC9Y9PeiTpMIcdKtoq+nG5X2AEeXRgcya6c9RP0Wd1hiA0f0
 bXjYRsjWt6Y116lsKKSIGo3Cm2tZffJCTwWBXs4kI3lDO6ciRc0xpY0LU
 iN3h7ZuQh1hwALoVNnpS1mK291z8PS3jQOEmaLC4O6zwZiR8YoRvEJaMA Q==;
X-CSE-ConnectionGUID: 3QABI2AHQ7S+FBcYzQ6dlg==
X-CSE-MsgGUID: /lg32Mz4RWKdN1x7ud6UFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66436635"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66436635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 12:30:22 -0700
X-CSE-ConnectionGUID: dxgVI/0PRq+ZUXncVhrZnw==
X-CSE-MsgGUID: bGPcaAa5Sj+CQHMunRDITg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142586512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 12:30:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 12:30:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 12:30:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 12:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Inm/dela3KZnqpBHibArQ/djLWQkJOARxOVVhJA6smeo/iBY6lr7Q7gDw49xSd8w3jGNGPAtAi4bNPpc4SWOh+ZBYqRn+lFJLk1q6cMnUslKeAgYWB83GApnnb51oEagJHbr8iLR8jFSoRt+GtO7j1h983inohjQ3Yx63xCfueUESZJJyQIiIYBvysM+NARUCiAxwrONwnQf0iXStV145urWQjnD9mPHOIM/jtvb7oJqNV3Ccv9sVuMKrBSMq0u+rlrSYn/p4WMLMqQaMyZA5DyyCnnT5hTJQtRIjTFovfW1it5ezaXS6/TmsCHWTR/Ay69u4/ogYslb2B+brY3Kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpReFLxAPbR3b0wkRwJhxpjBeQv5vRm/uzc4VBhPGUE=;
 b=oACdMgn6hjse8y5P2PXboz3GisfuDsC267lVAl/rF8DiJJTbm5WrPc7HCbw3PnP7H2r9N/UHt4+/qyrg8kwcAjLj+UHL1c0b2cYxS5lzZagG/MlQvP4J2V/8mR7OTbcv/jlYOLaTSaP6gKK0Nm810Jb7LALGDu4vDo/pUg++GsoBVQrObrqGX/evRh8M/6//L52uKprMugEmPYdJa8qSnSV2CFWda/1pLsxCtbAHwEofuwKPG7CiUKDgua9M/h7sSaati4LrAusb5K+yT14t45PaINmmQl0ze5wbGzWwbKLbpn4/vtlajfJ8GQMcellWWQlGEKJJercysZZSyZt3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 19:30:13 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:30:13 +0000
Message-ID: <919519d6-855f-4596-a7a1-396446b4cca2@intel.com>
Date: Mon, 12 May 2025 12:30:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Add missing H2G error code definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
 <20250508013437.652982-3-John.C.Harrison@Intel.com>
 <d8969391-26de-465f-894a-aa75c0947bc5@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d8969391-26de-465f-894a-aa75c0947bc5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b65ba0-e9db-41ea-5c24-08dd918b6a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVdqSHl5czRxb2hRK2cyZ0tmWHBqSlE0c1BueDViendqUmVsOUgvSXZjTjdK?=
 =?utf-8?B?emJsZ2RTNnpkdGdoMDlGb1NnbENnZTVlSGlESXRmTFNKWlQxQ3NLOS9hbm5h?=
 =?utf-8?B?cmRJdXNGQlFUV3ZmS3JSd0hkNVlzTjRrZ29DZzlzYzd5ZGtNaDhKandMTEtF?=
 =?utf-8?B?QStEWm4xR1IwWjhTUGJGRXFYZWVxMzlEVDczbGxubCtsdmEzL0NUeFJ4RXpI?=
 =?utf-8?B?UG1EZlAxdlBPNFBuZ0dVb3hiWGd1Wm1vYU5Fcm5yNzE5MnIrU0J4VENJUVZZ?=
 =?utf-8?B?N2s0aXBkRWtrL284MGFzZ291NDl0TkIvK253TlBnL0RDOCtyUFpPYTV6Zk1n?=
 =?utf-8?B?Um1tTVdscWVDZzBENHZrazdmZTBxNzY4M0ZkOFB0MVhraUpTT1lCZXJRWEpT?=
 =?utf-8?B?RkpSeEdPOUN4V1IwOWxIbVExSFVIekx5TmlZUHZvdHJGNDhKOXduNVRlYTY1?=
 =?utf-8?B?VDFkQVEyYVpWWm5lNDNlNEh1bjJkWGt0WGxocEN6Nms2cVZiQTI0SzdQU25s?=
 =?utf-8?B?NDhNZ2kyOE5seDNINXFNS0IweXdCazc2MUlsdk9WMGZCVGgzZUhZOEV6VEVE?=
 =?utf-8?B?cVhhc3hkNzVBQjRRSmFHN0tkQ0JLZW9QdjUzVi9ONldUeXpQZXJnUWJIWXFK?=
 =?utf-8?B?U2pFa3UrUkdINU1QcFkrcGhrRjZ4dWtpRi9jZkJuVE1ORXdMcWIyRjRvd3RM?=
 =?utf-8?B?MHU0d3RzSUZKbzhvaWl5ZFhpMzE3QmN4Y1kvTVg3Mk1vQ0p0N1ExWG00OG9D?=
 =?utf-8?B?MWFMOFcySThwejhjbDYrTVpvN1RhM0JsUm9tRDdWMDY1dFNPTjRpeDBRNE9k?=
 =?utf-8?B?M1R5cXhDd1ZJaFdhK2hUa0J5MFdDdGZKM2hlcWR4VUJYS1ZVeTYyeFFRcnJO?=
 =?utf-8?B?NDdjaUJuUVg4S0crSkFPOHh5NzhGTVUyU1NJb05GRTVIZ1JQemovZ2NFblhP?=
 =?utf-8?B?anRhS3BmWkNVUFluckFmTkgrblFlaE9WZ01tang0VkIwaXlDRGJhUlFkTHZK?=
 =?utf-8?B?UE10bjlOQS9zN21kbTdDYTdOaFJ4UG9yRnlJUVptQVg5Vi83ZU45SWRXdUZm?=
 =?utf-8?B?TDNKZENhMFpuSEJGakxXdDNoV0RhZmVZa2xlajVtVDd0UXMwcno0YXlzY0lT?=
 =?utf-8?B?bXFtc1RoRkFVdkNHbkdZNEJMR2VvaktPVTE5TGQvSFdVRVJ0Sjg5UzRHM3R6?=
 =?utf-8?B?enpTc2MxMVEwY2NqamNBS2xRMVNtRmJibjBxd3phSUhma2YvUzErLzk3czVl?=
 =?utf-8?B?WHE5SWFqWWZpVEdIS29mT0g1VVV2ODFhQ0hCSXNYVEZ4aGhYRXlpWVhLV3px?=
 =?utf-8?B?aEIzenppMElqRktuSHVhTWtHa0hIYWJUWTI4bzdlTXBaOWlsSGh5WkJBb1NI?=
 =?utf-8?B?ZGwxL0Y3WkNKTTNpSkU5MVNyK014SDk1QVhXUjh3UHZMVGF6OE8vUFoyUFNa?=
 =?utf-8?B?TXlwVjd1bzlmMzZERUcrQXVUNE43Y1RRSW04SmkrMkhpN3F5N1ZDUWVuYjVI?=
 =?utf-8?B?aWlXeUxHYUNKNm9oejZMM09EbmViWTNiMU9FSFZOMFVsLzdQRnpib3lyMWMv?=
 =?utf-8?B?a0FGK3dvUE1uVW10SDBreCs2ZXl1VTRRTldjRGlHWDZQSnc4aXJzbnF0UEFw?=
 =?utf-8?B?WFlxOGdTNGN6M3NtWlNWbnVHK2dmMVAwak8rTEVvQ1dDZzZYNTVwOGlteGJv?=
 =?utf-8?B?cjdjODlWTitKaGcrTGJUTkNadGNLdko4MEUzeTM3akI1cE15RzlXWW1GZjFv?=
 =?utf-8?B?R29GUDJxMjB4NDFPRlBMa3pUQThxVmVxNm95Mll6YUN2Z0E3T1ZEZmJxaVk4?=
 =?utf-8?B?VGllc2pDYnpXZFVPaHVZb2VFT1JxdSsyZllVSy91ZFRzeDY4N3pUYkxSaERY?=
 =?utf-8?B?L1k1dGJDUXR2VWpMYm1iV3pxU1ZiNnlhdU4xbVRuSDZRRnhCdnh6eERiQnU3?=
 =?utf-8?Q?AKceLtCZhEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1laTGxRY3owZVJmU0czQTlIK3JjVUx3TURWK3cyL2k1dFVESWFqVStQS0Uz?=
 =?utf-8?B?UDN3dk91VWwyWlJKWllTV3hLVlJWa2gwZGUrcWpNcUJ6WlovZWRKMzVSQVZO?=
 =?utf-8?B?bUlFTmdQTUZaYjdVaU9qOU1qSUx3MUFhNHY4cmtxZ0VKSFdrM3RxditsYVpp?=
 =?utf-8?B?ZTFvcUt3SmV3MmYydjREZnJaOWtSQ1NOS1I4YkFNN2xNWmF5UDJ0Nm5wMTJP?=
 =?utf-8?B?YzBJY2gzSHNoMXRxcHk1Q2djZ2xxS2E0OTJvWG1VZE93Z3BSdFA4am04VzI3?=
 =?utf-8?B?czdVZk5rVk9ReXBGclBFNW9EOGFhVm5FQkswZkRva1hnbEcxZDU0NGgyMVZl?=
 =?utf-8?B?SldpS3oyMmdtMXhtc0U4Y2RNQ0MwQjRqbXk4NS80TnFMdHlxcmNnWlo5M29q?=
 =?utf-8?B?OTJ4SHpCMFlFM3l0dnBmd0JlUGxkRU9aQWV1NzRnZDc2VCtlb0tHVEpYK0Y3?=
 =?utf-8?B?My9leDN4RldQSDBvVmJTbXZBbE0yQWVWeURzekFoWERzWWNaanpiU0VMYkF4?=
 =?utf-8?B?V1FiS0lHMU5oME1IYlA4UmNjNmpuT2dWcGw1cTZwajAxMUd1MVJzcGVBNUZx?=
 =?utf-8?B?T1JROG41dDVBVHk3Umc1c0FNNldEemdFVkhCMVY5M2pqWTFxbU1YNmY4bVJm?=
 =?utf-8?B?NCtsUGQ1dHZJQVk0dVZqOUlHcmVUaFhiNEdhOXhnRlFjMUF3VHhqQTNTOGZG?=
 =?utf-8?B?L0V0ZWN4cURaZ3VvMS8rNVREcVhESXhoVkZGOWY3YTBRNEs1YmZjVU5rek5i?=
 =?utf-8?B?OGpKNlRLWm1MVUFDWkFjVmNld21HOW0rOGZwdWZYWklMT05aMmJRK0sxcUZY?=
 =?utf-8?B?NW5kWForWTVBM25pSnJQbVRvUVUxVlBBY2EvWDJ0WHJLb0ZwOHVCTVgySkVT?=
 =?utf-8?B?QTJSdzdLemhNOEhzcE0wTFYxeDhSMkRQakQ1czhjNEU3Q0xHOGtoZ2hydnBl?=
 =?utf-8?B?M0Znck4zc1ZjNEZsVDIwdGY5YjNVY1VQMHcrbE9CMEdta1FXQlArTU5nRndK?=
 =?utf-8?B?WGQ1ZmZOQXhyYUlwNmtDYm96Wm1EaWRZdlZ4UG93VlBETU9PTHlQaXlCYkhF?=
 =?utf-8?B?Ukh2NDd0amNNTS9JWDQ5WVFidUs1alo3SllNRWVCY0syZHlxVTNxaHBzd0FD?=
 =?utf-8?B?RHNxZCs5eDF1cVBWNjAzQ2JOVFUvQW5heXcveXBETUJPTjBObGVRZUFvUEFV?=
 =?utf-8?B?MzduUVpIZnh6SVBtbFgrY1JGZm9YQ3JJRWE3OHRMQ09JMTBESlRMN3NaZ2RX?=
 =?utf-8?B?a3ltYktvbkswdXI5Q2J4YXhIeENJZTB3L1pUVkduaHl0WnhNWldScjJjWmF0?=
 =?utf-8?B?dFdqaWNGdmRMSFlRK1JPeFlDTWVOZS8vcU4wenJnYUJpSW91MVVLdlkzQ2pj?=
 =?utf-8?B?US93R3luTFJ6djIyWDRoVVp4THJnako3RitxNEgrdjA0SDRzeVFmVFFwVWUw?=
 =?utf-8?B?OFZxdTBoWWYxMzJiUEcwcy9VcmFiRGdISHJtUCtPL3RzZWd4RGFZZ2lURFI3?=
 =?utf-8?B?SGV5Wm5NdURpMUhXWG5yQlAxZU9WWCtjaVkrc0JlaHM1VUxyR0k2VFJONHF5?=
 =?utf-8?B?eFpremUxVWorSTlUVjRmK0E3dnN4NTFkV3M2cnRuMHZ5S293L01xY25MUGRp?=
 =?utf-8?B?b3pUc2hnRTdqOXQ5UG10YU9JNEdVZnd2K3lUWG9wdUJPNzNBYlBjNkhVeG1x?=
 =?utf-8?B?SnIxdzVWNHVXZkZnRjJ3eGMvMW1MWUw3b2ZQeWhUN1phRUpxQi9MSWp5YXVu?=
 =?utf-8?B?NW84VWh1c1BjZTJjNkJLdWFoYzduNE95cHNpaFk1bjlOUS9NTzFqMFFLcCtT?=
 =?utf-8?B?OE8xbXJQTk4zTC9YRWpDMkxxc3VNeUtzOEpvV25UVnRTWWd1bWhDZy9iT0ZV?=
 =?utf-8?B?aHV6K3ZFODl5ZERhMjdwbExXUjAzK1RBc3NTTklUU2p1RHZIbWtPUU5qWTln?=
 =?utf-8?B?QjhpQldoWnN3Z1I0NzU4MnplVDVZNHFhNEpmK2F4Mmg2NS9JRXR2UEZGWHZD?=
 =?utf-8?B?eVcxU09aM012WmN0NHpvVnJWbmFMSUdBb1I1YzBvanZoald0bnVCQm9Dazd5?=
 =?utf-8?B?RDFvRTY5M2pobU5ETzNJSU9hc2pUMnptRFI4WjRiV3JMTkhEdHNUL215T050?=
 =?utf-8?B?Wjd5dHpiVXdKQUNqVTZQK1Z0SDdmUnM4ZUJ0RDVYSURQUi8vT0lLSkhNTXZj?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b65ba0-e9db-41ea-5c24-08dd918b6a7b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:30:13.1696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIwoxhXxkPkWkdUy9GlS8TfSaRvJcEHuS2Op+W122u1Ek+Cyq1S+ri5kKkAtaLPMawAA3MZTee+cNgEYE7GLASwB5tsLnI0u+8cjOKdAmqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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

On 5/8/2025 12:50 PM, Michal Wajdeczko wrote:
> On 08.05.2025 03:34, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> These error codes are not actually used in the driver but it is
>> extremely useful to have them available to understand error messages.
>>
>> v2: Add a bunch more error codes and drop 'status' from names (review
>> feedback by Michal W).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> with one nit below
>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_errors_abi.h | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> index 2c627a21648f..cf00300add37 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> @@ -6,8 +6,8 @@
>>   #ifndef _ABI_GUC_ERRORS_ABI_H
>>   #define _ABI_GUC_ERRORS_ABI_H
>>   
>> -enum xe_guc_response_status {
>> -	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>> +enum xe_guc_response {
>> +	XE_GUC_RESPONSE_SUCCESS                             = 0x0,
> this value seems to be some leftover from an earlier GuC ABI where there
> was single H2G RESPONSE message, but today, as we have separate HXG
> RESPONSE SUCCESS and FAILURE message types, there is no place for the
> success code in SUCCESS message and in the FAILURE message we expect
> only error responses, and 0 there can't be treated as success any more
Good point!

> maybe we can put some note here until official spec is fixed?
I'll just drop it. The file does not need to be an exact copy of the 
spec, it is just a reference aid for debugging. So no point having 
meaningless entries.

John.

>
>>   	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
>>   	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
>>   	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
>> @@ -21,12 +21,20 @@ enum xe_guc_response_status {
>>   	XE_GUC_RESPONSE_CANNOT_COMPLETE_ACTION              = 0x41,
>>   	XE_GUC_RESPONSE_INVALID_KLV_DATA                    = 0x50,
>>   	XE_GUC_RESPONSE_INVALID_PARAMS                      = 0x60,
>> +	XE_GUC_RESPONSE_INVALID_CONTEXT_INDEX               = 0x61,
>> +	XE_GUC_RESPONSE_INVALID_CONTEXT_REGISTRATION        = 0x62,
>> +	XE_GUC_RESPONSE_INVALID_DOORBELL_ID                 = 0x63,
>> +	XE_GUC_RESPONSE_INVALID_ENGINE_ID                   = 0x64,
>>   	XE_GUC_RESPONSE_INVALID_BUFFER_RANGE                = 0x70,
>>   	XE_GUC_RESPONSE_INVALID_BUFFER                      = 0x71,
>> +	XE_GUC_RESPONSE_BUFFER_ALREADY_REGISTERED           = 0x72,
>>   	XE_GUC_RESPONSE_INVALID_GGTT_ADDRESS                = 0x80,
>>   	XE_GUC_RESPONSE_PENDING_ACTION                      = 0x90,
>> +	XE_GUC_RESPONSE_CONTEXT_NOT_REGISTERED              = 0x100,
>> +	XE_GUC_RESPONSE_CONTEXT_ALREADY_REGISTERED          = 0X101,
>>   	XE_GUC_RESPONSE_INVALID_SIZE                        = 0x102,
>>   	XE_GUC_RESPONSE_MALFORMED_KLV                       = 0x103,
>> +	XE_GUC_RESPONSE_INVALID_CONTEXT                     = 0x104,
>>   	XE_GUC_RESPONSE_INVALID_KLV_KEY                     = 0x105,
>>   	XE_GUC_RESPONSE_DATA_TOO_LARGE                      = 0x106,
>>   	XE_GUC_RESPONSE_VF_MIGRATED                         = 0x107,
>> @@ -40,10 +48,11 @@ enum xe_guc_response_status {
>>   	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>>   	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>>   	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
>> +	XE_GUC_RESPONSE_HW_TIMEOUT                          = 0x30C,
>>   	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>>   	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>>   	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
>> -	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>> +	XE_GUC_RESPONSE_GENERIC_FAIL                        = 0xF000,
>>   };
>>   
>>   enum xe_guc_load_status {

